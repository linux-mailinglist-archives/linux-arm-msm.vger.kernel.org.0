Return-Path: <linux-arm-msm+bounces-86065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF51CCD41EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 16:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CC3A3007C63
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 15:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA566211A05;
	Sun, 21 Dec 2025 15:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQBfUjqO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xe6tcKR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C88184524
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 15:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766330470; cv=none; b=WL+W/drWvr+BJfykRnrk6rf9VhZwpAsNikjQX0ZTl3IFf7oyCCl/Ftt6jGW5DZjhUWAyUfX5pu8UyYRtBQbpokIvxraUDP+scoomrPNGG+ba8Qz0h2xIjM4U6gClOYcNEgvSBpd7fIqvzhO+jnTTlDfCX7bSFaO5j9vFwqa+/4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766330470; c=relaxed/simple;
	bh=KE2hInq9bRMwVsXpW3QW4X+embjE2CmL8zlKg3wZYuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFvIIp5OAE7b9c4xxnk16WH4euNpk6EmphF8QRvGr2DEHmjtgTSbonZfkaLBo05M5MShAhb+bwFnzFm2oyA8NMVBZrVkZ8kfxoM5wW4g6HEbhebVr58X4oNvyF7x6OQyE8qYRiVTGlClE25k7eYkfVBliVjABhm58KaMhqUIw10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQBfUjqO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xe6tcKR3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLBTqcn2461542
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 15:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQHOL5GtuzQBVP5V2YY6m0cLoSE33Pw+ObugZxqUKgE=; b=pQBfUjqOZpd41U0H
	/L7MZx1ThXt/iVrk3FRHps6k18WQOVUp9EtScavmCKpOBjCoYC7Qvq2bcixmM0IO
	oks/W0KCliGYeVV/1yQov2Rr8zhESy7hm81PhUyue1lgZ/oyui5HZTECHOM2+F4p
	fiC2Xtmb3CjzQ9LvGgsOKj/UrisxEGuM3v1Z1fe25p73oI+4e/eCkk2/EbPP+cBU
	ZI3ZsTAzIE+nwCXGhgqtoFCDn93kiwV7e127VniSLfUAyxCMLGJiBvYquV4fKVQn
	OQlxcuNNIW0RCF6ZwewgPs4CFRucRT17C37ziTyJyiqryXiB5h3euIQiDW542pM/
	8VAn2Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru2h36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 15:21:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804b991a54so112818326d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 07:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766330467; x=1766935267; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wQHOL5GtuzQBVP5V2YY6m0cLoSE33Pw+ObugZxqUKgE=;
        b=Xe6tcKR3NSJL00ZjYNVji382jK7iE7faiS4k+vTukpHgCRNwy3e9aqFVPXGHozRpuL
         zjgjS75FdHll0yokl3Pdh4++Lzptv24NSqIhz4Cqg1vUOQ/9+3qMSrXggLtXkiaAp15S
         5crkF9zbx4oDkbUk2/DCt8kI7CvS6GBw+gNfDRH0gnGc4CJdauGN5C/MA4r9ongqWXuC
         d3LP/VQy1KjNLtgAQN9DeHWw7nxTpp9cAzAcu0FIE5qqZN1DB+wSAu+Ois7eOkWfZ+VU
         oDQMjjlhb5jKFZGKo8Ty0okK42cGKKNqD9ONjVKazOAcEDEmMZBvafBsiEQ+irzweIHe
         3wRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766330467; x=1766935267;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQHOL5GtuzQBVP5V2YY6m0cLoSE33Pw+ObugZxqUKgE=;
        b=Eov5T78REpg5K5g/5wwKMPhRs1leb9YpZDnmZF8Ti1jQwKJLh3sISqVyfeT9hcWNM4
         FigWpzh+CDuBLp1Dyw2Y1zNfyvsfR18/ix6TX5J2aQRwxaJZcz2xDglLoIsEQRWodY8j
         L34h+rET2ID2b2CAzCfLMTpWiqbfkRDHC+ls0GzfmjqYSRncWfLvVwZpd86mCHF37h7g
         eaMyTMZkC/+K8o2pKHuiYUYjeAah2UPwcUCaczmCAvuJhOZDqvqJAXBO5szdYgpuC3K1
         wEDozIw2QXa5a0mmAXW74eiztjGMkV6SWXmoPn1VAGPDZ4ubCfEBiA3wfJJslJpyCiiz
         Wp3w==
X-Forwarded-Encrypted: i=1; AJvYcCV2tnYqNeuyCyMJkmmHcfHg+hVzUr68SdUINo4oV3Ac9Xd2tG+sVazwd2aZlra2wPTY47s3vbDihL+alDfh@vger.kernel.org
X-Gm-Message-State: AOJu0YwmhwH+FRbszOs4oyrMZltXMFEt3lPiiDKligzhcxk4IP4mZT4e
	uT2HmcHElJLAwffdIge+P/JhejTCwlIA++d0ixxOFC0F6ORD+LSMnTv4V3leBm8Z8f/JWjQi6Uw
	KbYSRiXelXwvFV5LeEdc0GAwxbMJquL3bKJh2PX78bBBC77fKZt98+ykHIG/Yj1gA24M8
X-Gm-Gg: AY/fxX60C41nTvG6aLzWCiitLZgxf3MVw8Yd4u55OuavwwfQW/xtTCWcbZ2mIH0Z9IV
	jRxm4k+IuyPtQVa7K7Mb0JpYrpCOGUS1gTaiTo2UJMrbfrDxkwlmI6SWB0aD2u3p/OF8X5kzZX6
	+7FfXtpPkOoEcFXoxnU67+3dfenpFQQX9qGwjTKPqeoVDr2iC4ERkFxeR5KR9L5U7dabnmwuR6K
	sHB3WVwP2ShWopGhJyl2q+N8VwhCypxoO0yrpojU73j9CW6VYSwYyjJMPCW6LVVKNB/DVRsNqkR
	9rUBHGIoYQx6JXA7P/KHtIbHW3jd2STk66wjrnvi4hJVgSCAmLKUeWVE859gIk1S0u8Ppd4c1Zp
	7YYy3qcs/BWz6/bdR4uTKS3HxJHmw+lte7bA5XnlnZZRqY7JKpLsPTSnTC51cPXMdqyxRrM5Q4K
	bMbH2CZnmnN71dZ1Kw676nUFQ=
X-Received: by 2002:a05:622a:59c5:b0:4ed:b25e:a721 with SMTP id d75a77b69052e-4f4abdc97efmr128111801cf.78.1766330467297;
        Sun, 21 Dec 2025 07:21:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY+Lms0FP60VpziwIjQ5rwgdchuL+Vf5wk1M+z5RaJhEybPwtqQOJr9RjP0IFtPHmmv/gI7A==
X-Received: by 2002:a05:622a:59c5:b0:4ed:b25e:a721 with SMTP id d75a77b69052e-4f4abdc97efmr128111431cf.78.1766330466839;
        Sun, 21 Dec 2025 07:21:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620296sm2334940e87.82.2025.12.21.07.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:21:04 -0800 (PST)
Date: Sun, 21 Dec 2025 17:21:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com
Subject: Re: [PATCH v3 1/1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
Message-ID: <bvkfq2cg3nstegininpxjr2ldfv2kode3fy6ekv5vuwbh3lrv6@qnvxwsu7y4zl>
References: <20251117021645.712753-1-shuai.zhang@oss.qualcomm.com>
 <20251117021645.712753-2-shuai.zhang@oss.qualcomm.com>
 <mtp3qxngbnlpzk2cdp45ndtecab2h56ocwm6cp5ia7butra55a@bevidj6vdwzj>
 <c3526d32-6769-4681-bc54-90a4af082265@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3526d32-6769-4681-bc54-90a4af082265@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDE0NCBTYWx0ZWRfX1k/UOwMfZbfS
 CQu8jh+4kUBgyJPcZEL3G/MdalwNE064iXSPCMfdeQc8ay2Hb4yJyxAUnlagIEZ5ivVnVTQKz0e
 /GnJ9h5dnSwS95lsQ/oBFGzOg7tJxXKPE0FsPcnfBzIttDs7IFxqRjYMwSL03wsb27ZsP2eAmtr
 a1Pf7Eh2IPO1PoOPXGH1p1VMqCeuJVNgcyx+uDQaVQ/JYQSBafgUEuhLZl/xDBzf0juGqHaeV1F
 5d1x80HNODEspqIlga4dDYk0ULBaVzboPSV1HnOS1DqLfhhh98FblKUX39n1qoymLzCipWodLsO
 BEBk1ILoFZZR6dlcV1m4ZM5HGyniBbMvT+ZqKNCgihrx1nJElVEU/uvUrriCaBAxBzhQTGDRJNF
 pHvSfgji/j4bMWuWoor8arqHSFcjL8cTah+N8fYdpyQrSLC9qZAIxaAmFahNilsO6n8udSQHhzu
 u32rnEwvCX0vknlFmqA==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69481064 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oRovbpetgKaY073uAWAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 33rqOi1ZPgdsGl0HhTxJ311QeYmfIHrT
X-Proofpoint-GUID: 33rqOi1ZPgdsGl0HhTxJ311QeYmfIHrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512210144

On Fri, Dec 19, 2025 at 05:19:30PM +0800, Shuai Zhang wrote:
> Hi Dmitry
> 
> On 11/19/2025 3:59 PM, Dmitry Baryshkov wrote:
> > On Mon, Nov 17, 2025 at 10:16:45AM +0800, Shuai Zhang wrote:
> > > Historically, WCN685x and QCA2066 shared the same firmware files.
> > > Now, changes are planned for the firmware that will make it incompatible
> > > with QCA2066, so a new firmware name is required for WCN685x.
> > > 
> > > Test Steps:
> > >   - Boot device
> > >   - Check the BTFW loading status via dmesg
> > > 
> > > Sanity pass and Test Log:
> > > QCA Downloading qca/wcnhpbftfw21.tlv
> > > Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
> > > QCA Downloading qca/hpbftfw21.tlv
> > > 
> > > Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> > > ---
> > >   drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
> > >   1 file changed, 20 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> > > index 7c958d606..8e0004ef7 100644
> > > --- a/drivers/bluetooth/btqca.c
> > > +++ b/drivers/bluetooth/btqca.c
> > > @@ -847,8 +847,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> > >   				 "qca/msbtfw%02x.mbn", rom_ver);
> > >   			break;
> > >   		case QCA_WCN6855:
> > > +			/* Due to historical reasons, WCN685x chip has been using firmware
> > > +			 * without the "wcn" prefix. The mapping between the chip and its
> > > +			 * corresponding firmware has now been corrected.
> > > +			 */
> > >   			snprintf(config.fwname, sizeof(config.fwname),
> > > -				 "qca/hpbtfw%02x.tlv", rom_ver);
> > > +				 "qca/wcnhpbtfw%02x.tlv", rom_ver);
> > >   			break;
> > >   		case QCA_WCN7850:
> > >   			snprintf(config.fwname, sizeof(config.fwname),
> > > @@ -861,6 +865,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> > >   	}
> > >   	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> > > +
> > > +	if (!rampatch_name && err < 0 && soc_type == QCA_WCN6855) {
> > > +		snprintf(config.fwname, sizeof(config.fwname),
> > > +			 "qca/hpbtfw%02x.tlv", rom_ver);
> > > +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> > > +	}
> > Is there a reason for ignoring how it was done already for other cases when
> > we need a similar fallback? Please extend the existing code (or rewrite
> > it) instead of adding a similar hook at a completely different place.
> 
> Current Strategy (when DTS does not specify rampatch and firmware):
>     Rampatch: Load the rampatch based on soc_type.
>     NVM:  Load the NVM with board_id based on soc_type.
>                 If the file corresponding to board_id does not exist, then
> load the NVM file ending with .bin.
>     For HSP (new requirement):
>         First, load the rampatch/NVM files wcnhpbtfw and wcnhpnv.
>         If not found:
>         Rampatch: Fall back to loading the hpbtfw rampatch file.
>         NVM:  Starting from wcnhpnv.bxxx, load the NVM file ending with
> .bin.
>                     If still not found, look for hpnv.bxxx and then apply
> the above NVM strategy again (soc_type(board_id)  to .bin).
> 
> The current changes are based on the original implementation, which should
> make them the clearest modifications.
> Please review according to the existing strategy, and feel free to let me
> know if you have any questions.

qca_download_firmware() has workaround code for WCN6750, loading TLV
file if MBN is not present. It doesn't make sense to have similar
workardounds in two different places. Could you please unify code
(either by moving existing code or by moving your workaround).

> > > +
> > >   	if (err < 0) {
> > >   		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
> > >   		return err;
> > > @@ -923,7 +934,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> > >   		case QCA_WCN6855:
> > >   			qca_read_fw_board_id(hdev, &boardid);
> > >   			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> > > -						  "hpnv", soc_type, ver, rom_ver, boardid);
> > > +						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
> > >   			break;
> > >   		case QCA_WCN7850:
> > >   			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> > > @@ -936,6 +947,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> > >   	}
> > >   	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> > > +
> > > +	if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
> > > +		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> > > +					  "hpnv", soc_type, ver, rom_ver, boardid);
> > > +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> > > +	}
> > > +
> > >   	if (err < 0) {
> > >   		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
> > >   		return err;
> > > -- 
> > > 2.34.1
> > > 
> Thanks,
> Shuai

-- 
With best wishes
Dmitry

