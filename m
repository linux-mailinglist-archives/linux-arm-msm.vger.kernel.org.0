Return-Path: <linux-arm-msm+bounces-86529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5424CDBD1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98C53301397A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE1B30E0CE;
	Wed, 24 Dec 2025 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6Jox/0T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bxojaxb5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAD5332EC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569167; cv=none; b=fRWuOjWVFrNU1tg8rkTu4xjBoVVPGi4Eyx26AISUISi/PEx27G64o5uNtqYxeO21mYilKKnnpVrQfn5RVZjJLGIjQBcD8M2UHIDpVXvAN5GfdtJwh16WhkxDvQMbXL+/ouCqA/Et+lxztQZDkaq1RIIH6gEhQyQKuwVSYbA01fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569167; c=relaxed/simple;
	bh=CRmcAoyUtq6iBXHMPiagvrM09Lai/RUX2snbRGcswAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOkfSeWMDphFpG7N11m/1kj0YgD3n2yONDc7zXRPPy/H8oNcyfkRGoMJRZI+CggOxACKZw7pwGp1+iXJ31qn8e9Rs6d1chQgVarOp66Fm0li8kPaI++Ryj7BKlyBagDRa3SJZQ/xOG6vVmzq2mK0TspKeYZOIHAwKMf28V9HW1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6Jox/0T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bxojaxb5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO6YJmv678258
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8oSoDiKphsc2K7HPgkLLB/R2Zw9DltlgN5tqv7NL44=; b=M6Jox/0T1szsJYDX
	rlKboitPKBlYHMO36SDSTOJmXH4rn3ryrh/hs5rou/6tHky1i3feuK+SJk+B7ZO1
	WPlE33D4QW29fFeDO3dK0xs5P2s+43BTAlBpXpsYgb34R4QfTyM0RM4WDFrEEttM
	SwSugsk6AC9Ycjlpm1tY3/6yBn4ZLdpQmT8Ze3kep2w9OuN3kwMvFalzha1UyqJT
	2qtKWAF1nFT2G5OtClp1yUzc44GJefb+FK70q3qYZC8nCuSN3vTMC3uHAk4mW8Sm
	fBtFI+VHhlkzgFgI7GpQBHEhf+CzNeLTD68c/UHkWrWmw+sw1Bvg+YK9Y0FTCTYE
	NSZ+9w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq27cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:39:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a3356a310so157083276d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766569163; x=1767173963; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G8oSoDiKphsc2K7HPgkLLB/R2Zw9DltlgN5tqv7NL44=;
        b=Bxojaxb5Tg2LVchK1NUxf/r6X+735UHuxkeUZ4iJ0pSUQ7Rt6tKas6lcu++7twigcq
         Ko1NAJyc93RkjH73PrTHbCPQFREj313O0NVwl+j3/QbooFXsyrrKSMtttRc887CvP6c6
         HfQAS7w+ALJjdQVnl63xuIN/hrR//aGRwqGuKfKMRHy5xXNsjnBV1+/R612NNyor+eYl
         UzcT4YssCk0+xUnbI1JxDC4W+b8a2nCZo51I/0IH0sYyxPi21xQP73UAk+2pYo7Qdi8q
         zsuz4CTpE6+egJiSotnn7HL30iTX/5gtcLYy33z724jq3MQnqYWgtFj2WvPzQMgpvMmq
         nr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569163; x=1767173963;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G8oSoDiKphsc2K7HPgkLLB/R2Zw9DltlgN5tqv7NL44=;
        b=Q6Q5Z34Jq3QS5R19vZxtkNZaFM30DgX57b2ux5BnfkxCP99+UHMvcl9O/xKPnwcNiL
         65+KG26J+SjIyVwuoA+Bv9MPnoDkWeaKxaKi2+cZMNrvHa87QiBOPxnrdCJemdnz6pNp
         e7gvEiqi+zUnyq+syI3TwIsSE1QKhVKm71RYvIwWEn5PLib3l9g5lfHE6Mb3Es/RM6Rp
         mLAut9yYg3ah9QZWAURvXot9mTC+ZcKCetJ1gSF7QgnwUip/t9BkqXH0Phe3ux0Z+vC5
         Ck8PkLLKL0g1lgrTc/TnaSOEvMabK9xrDeKPIFxmrtp2rtyU3g/c3hUQ7FQlWCv4+6E9
         sJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCUJ6IyvBnuLKbrt1UUEhUYD9AC4MAK5cUsrnLJ+mPlag3Ph9x6BlKt5gjTgcVj/5HoXBjjzddkE9j6omXyW@vger.kernel.org
X-Gm-Message-State: AOJu0YwCWb5RoR8uWETdVZE1/mArHLiuinjyjHl4w6TbbBYUdle12BrK
	rZozpBOrtXcHnstY0GTDI9WYfRMrWIsJGOvgL0swkBgyoobR21re+kX02oijT6WJLaJpEGgkODT
	DLlbSDm09RF8Xkl/2CJt+/awC57oFeHMxzessrmAXZ2ZaZo+w17/Sl47c/LhSapTve3u5
X-Gm-Gg: AY/fxX68/LJuZ5rzuBtpIuR1KGCjPVmCP+CDcCDkRILf7VF/dwrXnokeliEzG2HM1Dr
	2OmHDbIlkHhQrTOg7KivRHECm5IqQGDr3Ra6GOeYr6kAPWf2miMAVIaHNAf4BEvK93qUsF9/TBu
	jLodo8Y8vA8Ihvl8tJMP6aPnQW0/w4LKfoyiPt1kQBRl1+6aJqvEUgb2O6nDk3Jr+csozzjFRIr
	rY/m+N6p5AdvZdx6HYCLUn3uT+P/O5G5tJj05OqI4pjPzd5uNTm+MIl8y2fBM8RLWfIwPNY5vn0
	v1ffA2o7t9cSHjN86ldkeF/N+RJ8waMXY/+20zH0RpFvlqAWpTwCApRBSeJ8bcumuX+7GPTLc9i
	J0H+HAOut2/U+jKQJtXGM2WgX72FhowQkqtlfUjnSMcbs3zDUmqWlwFOlyDsZxikzrVo4+xLCfe
	QQV0igVqw/WKKt4/2BRpEam9w=
X-Received: by 2002:a05:622a:a11:b0:4ee:219e:e74 with SMTP id d75a77b69052e-4f4abde4c12mr262730221cf.77.1766569163345;
        Wed, 24 Dec 2025 01:39:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1EkHCdKkOcBB5LGJZfj81ocGScXvaPa/FpQOuK0uf4tBOBlM/EqUQ7SnuQ5tdLmrlMnP3dQ==
X-Received: by 2002:a05:622a:a11:b0:4ee:219e:e74 with SMTP id d75a77b69052e-4f4abde4c12mr262729991cf.77.1766569162875;
        Wed, 24 Dec 2025 01:39:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812264cc13sm41134671fa.37.2025.12.24.01.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:39:22 -0800 (PST)
Date: Wed, 24 Dec 2025 11:39:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com
Subject: Re: [PATCH v3 1/1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
Message-ID: <4pfooyem3h2ljapiye5faljkwi7aekaep6z6o4jviqghu3nsdg@7tslak7jyuky>
References: <20251117021645.712753-1-shuai.zhang@oss.qualcomm.com>
 <20251117021645.712753-2-shuai.zhang@oss.qualcomm.com>
 <mtp3qxngbnlpzk2cdp45ndtecab2h56ocwm6cp5ia7butra55a@bevidj6vdwzj>
 <c3526d32-6769-4681-bc54-90a4af082265@oss.qualcomm.com>
 <bvkfq2cg3nstegininpxjr2ldfv2kode3fy6ekv5vuwbh3lrv6@qnvxwsu7y4zl>
 <e9190f33-de6d-41f6-88bc-1f90513bcb3a@oss.qualcomm.com>
 <t4rfkbbw4pkio5xwar5ilytkjsfiok7ni3xbrhbhh46e557xga@m3uannuoqja4>
 <fb6d72f5-b35b-41d8-93d2-eb4fa83c513c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb6d72f5-b35b-41d8-93d2-eb4fa83c513c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dQC65aDPvSgZ9c_OSLsqeQZjhcY9vYES
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694bb4cc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=cZbSsLDkPTXUyY1cNiAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: dQC65aDPvSgZ9c_OSLsqeQZjhcY9vYES
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfX9nvxG0CqLpNA
 6Nw8Ue2V8dcK+LLrhv74VJA3Fa+OZVtNbmF6lgJIxYd4y+iKYq+25d2ZTJksnrKXwi01pP36DZr
 8CRhmaB5WSYKyHHc4lGUbU4qUXSFSpnpuDlIA4UPXMpk3KvSOk/8MvctIh00o9b4mH+rTIYKgoA
 POC2uodC7ekUv4q1IwD3csDsOtbNllQdrWst6+/jWX3qXptijvyg3zivF5qsabHMJrIp9aYtDjY
 9PYocHjUJV/CG5I5DbxAsLrVJHG5qcM0TvJqxuBQ43GqMfYo2HfaCes2AztopqiT+ts0aFwRE/K
 jxslpPoMIFqwfgAB3nDhVwlJF7wuRrhh1oNNbw9i5fLPPyF58NHmKpzjoaawvi1nSEP2W7RD0Zk
 QH7ZR8RO7B7hEesJ1ZYPw0u3xvqgy+Ujz8B/rG1YMzsJO3IoYFWAVQ1f7wHgaQ02aW/sYF+OK1T
 sTQkxhwbgh6XnKNiixg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240082

On Wed, Dec 24, 2025 at 02:54:24PM +0800, Shuai Zhang wrote:
> 
> On 12/24/2025 12:23 PM, Dmitry Baryshkov wrote:
> > On Tue, Dec 23, 2025 at 10:03:44AM +0800, Shuai Zhang wrote:
> > > Hi Dmitry
> > > 
> > > On 12/21/2025 11:21 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Dec 19, 2025 at 05:19:30PM +0800, Shuai Zhang wrote:
> > > > > Hi Dmitry
> > > > > 
> > > > > On 11/19/2025 3:59 PM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Nov 17, 2025 at 10:16:45AM +0800, Shuai Zhang wrote:
> > > > > > > Historically, WCN685x and QCA2066 shared the same firmware files.
> > > > > > > Now, changes are planned for the firmware that will make it incompatible
> > > > > > > with QCA2066, so a new firmware name is required for WCN685x.
> > > > > > > 
> > > > > > > Test Steps:
> > > > > > >     - Boot device
> > > > > > >     - Check the BTFW loading status via dmesg
> > > > > > > 
> > > > > > > Sanity pass and Test Log:
> > > > > > > QCA Downloading qca/wcnhpbftfw21.tlv
> > > > > > > Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
> > > > > > > QCA Downloading qca/hpbftfw21.tlv
> > > > > > > 
> > > > > > > Signed-off-by: Shuai Zhang<shuai.zhang@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >     drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
> > > > > > >     1 file changed, 20 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> > > > > > > index 7c958d606..8e0004ef7 100644
> > > > > > > --- a/drivers/bluetooth/btqca.c
> > > > > > > +++ b/drivers/bluetooth/btqca.c
> > > > > > > @@ -847,8 +847,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> > > > > > >     				 "qca/msbtfw%02x.mbn", rom_ver);
> > > > > > >     			break;
> > > > > > >     		case QCA_WCN6855:
> > > > > > > +			/* Due to historical reasons, WCN685x chip has been using firmware
> > > > > > > +			 * without the "wcn" prefix. The mapping between the chip and its
> > > > > > > +			 * corresponding firmware has now been corrected.
> > > > > > > +			 */
> > > > > > >     			snprintf(config.fwname, sizeof(config.fwname),
> > > > > > > -				 "qca/hpbtfw%02x.tlv", rom_ver);
> > > > > > > +				 "qca/wcnhpbtfw%02x.tlv", rom_ver);
> > > > > > >     			break;
> > > > > > >     		case QCA_WCN7850:
> > > > > > >     			snprintf(config.fwname, sizeof(config.fwname),
> > > > > > > @@ -861,6 +865,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> > > > > > >     	}
> > > > > > >     	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> > > > > > > +
> > > > > > > +	if (!rampatch_name && err < 0 && soc_type == QCA_WCN6855) {
> > > > > > > +		snprintf(config.fwname, sizeof(config.fwname),
> > > > > > > +			 "qca/hpbtfw%02x.tlv", rom_ver);
> > > > > > > +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> > > > > > > +	}
> > > > > > Is there a reason for ignoring how it was done already for other cases when
> > > > > > we need a similar fallback? Please extend the existing code (or rewrite
> > > > > > it) instead of adding a similar hook at a completely different place.
> > > > > Current Strategy (when DTS does not specify rampatch and firmware):
> > > > >       Rampatch: Load the rampatch based on soc_type.
> > > > >       NVM:  Load the NVM with board_id based on soc_type.
> > > > >                   If the file corresponding to board_id does not exist, then
> > > > > load the NVM file ending with .bin.
> > > > >       For HSP (new requirement):
> > > > >           First, load the rampatch/NVM files wcnhpbtfw and wcnhpnv.
> > > > >           If not found:
> > > > >           Rampatch: Fall back to loading the hpbtfw rampatch file.
> > > > >           NVM:  Starting from wcnhpnv.bxxx, load the NVM file ending with
> > > > > .bin.
> > > > >                       If still not found, look for hpnv.bxxx and then apply
> > > > > the above NVM strategy again (soc_type(board_id)  to .bin).
> > > > > 
> > > > > The current changes are based on the original implementation, which should
> > > > > make them the clearest modifications.
> > > > > Please review according to the existing strategy, and feel free to let me
> > > > > know if you have any questions.
> > > > qca_download_firmware() has workaround code for WCN6750, loading TLV
> > > > file if MBN is not present. It doesn't make sense to have similar
> > > > workardounds in two different places. Could you please unify code
> > > > (either by moving existing code or by moving your workaround).
> > > I tried to move the changes into |qca_download_firmware|, but it conflicts
> > > with the logic for
> > > loading the default NVM. Specifically, when there is no NVM corresponding to
> > > the board_id,
> > > it will not load the |.bin| NVM file. I’m not sure whether this limitation
> > > is within a controllable range.
> > > 
> > > https://github.com/shuaz-shuai/Add-WCN6855-firmware-priority-selection-feature
> > So, the solution is to move the quirk for WCN6750 out of
> > qca_download_firmware().
> 
> I’m not entirely clear on the rationale for removing WCN6750,
> 
> as our current discussion focuses on handling WCN6855.
> 

As I wrote earlier, code uniformity. We already have a quirk code
handling almost the same pattern as yours: load the fallback file if the
expected one is missing.

Also please fix your editor not to insert extra empty lines in your response.

> 
> If the logic for loading hpbtfw.tlv and hpnv.bxxx when wcnhpbtfw.tlv and
> wcnhpnv.bxxx
> 
> are missing is moved into qca_download_firmware(),
> 
> it won’t affect the firmware (hpbtfw.tlv). However, for NVM, if loading
> hpnv.bxxx fails,
> 
> the hpnv.bin file will also not be loaded, which is a defect.

As I wrote, you are providing more and more arguments for moving WCN6750
code from qca_download_firmware() to the caller site.

> 
> This is why I prefer retaining the V3 changes.
> 
> Please let me know if you have any concerns or questions.
> 
> > > > > > > +
> > > > > > >     	if (err < 0) {
> > > > > > >     		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
> > > > > > >     		return err;
> > > > > > > @@ -923,7 +934,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> > > > > > >     		case QCA_WCN6855:
> > > > > > >     			qca_read_fw_board_id(hdev, &boardid);
> > > > > > >     			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> > > > > > > -						  "hpnv", soc_type, ver, rom_ver, boardid);
> > > > > > > +						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
> > > > > > >     			break;
> > > > > > >     		case QCA_WCN7850:
> > > > > > >     			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> > > > > > > @@ -936,6 +947,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> > > > > > >     	}
> > > > > > >     	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> > > > > > > +
> > > > > > > +	if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
> > > > > > > +		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> > > > > > > +					  "hpnv", soc_type, ver, rom_ver, boardid);
> > > > > > > +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> > > > > > > +	}
> > > > > > > +
> > > > > > >     	if (err < 0) {
> > > > > > >     		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
> > > > > > >     		return err;
> > > > > > > -- 
> > > > > > > 2.34.1
> > > > > > > 
> > > > > Thanks,
> > > > > Shuai

-- 
With best wishes
Dmitry

