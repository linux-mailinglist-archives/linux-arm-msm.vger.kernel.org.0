Return-Path: <linux-arm-msm+bounces-86275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B95BCD7CD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 03:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E09923001160
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 02:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEA427BF7C;
	Tue, 23 Dec 2025 02:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+vzCm0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EO5F0l/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92737215F5C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766455434; cv=none; b=DR6oZWDIHPzBF12P1rMCczSqyHk2ZpzjoOPFUAvEvqdfR3PiZhz1HdvGgpDZbA44PYyAqe5z1B05ivy+NBMwesNElVUWxR1Dmjzz1rNIz90mWMACpQQ5ho6Qo5DXfue2BRxjhVQsXnq7NdB03SZK+9QbiSJb0i8+UA6Ojj+Feq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766455434; c=relaxed/simple;
	bh=ADseQxITzdrPRi74F1RrzdY42wR82Wxi2IptvYdtVTw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G0Uab7696x2rKm7qkcbqlU3bAwwzvb1yFnzflbKWdnkpTeQqlA/wRLtcnmeeulLL0823gYRa4s+EYdw4/uyBqHkEjgWZSOK+vcGn1jAuyxPfcsSVfG4WgzPW1lF36yj9uFrSVl/UTxzxPPzGe2RJH5CvnnK0InUg/uvyStdCkns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+vzCm0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EO5F0l/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMEC3qv2198999
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CYKI1cNRXDVOJTX7mQY2hnCGtOzpcksSTqchtZH0nzA=; b=C+vzCm0Yy9IGwVIs
	E7esW/2fhWkwhIEizPzPHpZAFBm4RV4WEpTs9raMhm3C9Z4kUKFtRStngpzApRsi
	J4e0z69hTqx/ya6v7PLZcfD6RZ+Z5rt8Iy8aYp76YLSuQuV6TFAo5GolTjiGd0q/
	mAL8Mxg2sFTIkhtj+3GhXHiARieXx6Qqv3nxA+KrDMMoEWDK9CkTDDlGTgxIjtj/
	V/yvX+FxoupoXO0e4BC901KE8cs+UJcl2x5Er0NEWkF9I/MIJIeAnVNUaCsxBUaK
	Rgw5yCBGRu3GbYm4tdZZFyxM2Lf85iNoTrMkC498pKFgqVjtP3wv9lhe6h+dqFfL
	PAcPHA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwtawq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:03:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso145429245ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 18:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766455430; x=1767060230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CYKI1cNRXDVOJTX7mQY2hnCGtOzpcksSTqchtZH0nzA=;
        b=EO5F0l/uhvJVcnc+sVlImHgZzX2H/WpPyR0gXkqP+YZYE3TqTyO4MyIptbbFhJEe+x
         mur52YcM1pgz26uk4pHO4AsVnfeaGptvQXqI4CTWaZJTviNhIKQXyxz8gvKBnDkO/4t9
         POaYJe+b8BSzQNoiYv8ztujRPdUSQFdRJIqNWUDHpoNhqxGziknh27FVB992qtLzcjH8
         SU93ZpPygJOnOA7MwwpJzg/Hn5fp3G18bcDadU+AWFzfDHTSUh+2SXKM9Zu12A50jsj3
         t5dCgVYgxtUPhw5sJmlBHymx1p/ikTJKi73plAxD3FDyJArpAuuw1CrZ6Xm5WrU7kUpM
         BN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766455430; x=1767060230;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYKI1cNRXDVOJTX7mQY2hnCGtOzpcksSTqchtZH0nzA=;
        b=jIFuDhoMJRbsFxVC1RzJn/MWQMxmhfLE1TmJ+oC3i1LgvmqQKxEeYTmcdYZw1hycsP
         es8bdc3XZQ36hR8aGoMuuSG/e05/o9TO8edBdGK1HeTACbEoVHBUSwNp44UoNNlPFT46
         ofhF8OAgVmpr/4GK+Dy+8mqJW8wgmkF7WSQfHL/EsNkH4dnnKl77dHuyhXz2narPx/Sw
         WRflNgSkA6Pef0sZyrz7qKAGPGcfeECS/mo8NL3ZkPiKwfIVi/36smVNvTt7lyoprH1G
         BwoqIzQWh7M/6dDGJvFk3CYI/7q99sZL5caIs8FEzfGKSlKAQ+Wta2Fo7moInRxwl+s4
         ICqg==
X-Forwarded-Encrypted: i=1; AJvYcCW5VDe71ltSKtsOjSntNOSROZwVZ/N9yKc60oQOiPBkhy1468uB+0MNB6Gagf833CfA9QT3bUqt8WZ5kfUD@vger.kernel.org
X-Gm-Message-State: AOJu0YyqgaTDR3aC6kzhhrrl2gCShr0MtuecKZ9IpSx0WkSvXanXLwCi
	OGH1PYqDkOcOPqjHwSGyDcaWSyWvU3Fp1eYmUslN2fH8kDyIPPWN83X1Xnb2MfEB028lHBGREre
	wyHgKRougPDrc/lQzhaLSfjEZYUWrZC09NqLrSKd59b0pGKabQL/+4yZaNTqDh2w/9GOV
X-Gm-Gg: AY/fxX79Zp8HYTuIYf3buoqUAG0c7S5SKzy1wyqPaJFCYF9haOoj0VcSZkZrFinNgl0
	fihdkYHLswTL4gWmgXhxEpKSZW8qK8QioXPZ9+7mvd5fy3KLJeU5zfRrbD47fLv7bT2w1OLfWkW
	n+ka1hw1kqLVKvkbaNMuz6vv9QnX5s9HrfDNGSxWpUJfiqobTm0smGKDheDFqDNlZu4WR9hBJV/
	JrA7PsBGnS2zZ2Msr5/fJUjmzlqlUGhP480LfzeofhCn7MxqIfhZtHHb/4xz82+UsKTIUtSz72m
	WWX1qKVNybao8hOJf5VxBrJRY8Tyz2+yIrDxE8pFkl0daWm/hDiUB/u6EXe1LrT3N/f8JE8a7IY
	mg8He9xhK52I4yF2/zZet7WkLEwa3x6wPA67y8JdowG8SbYR78NzhAXcpI9NSPTU=
X-Received: by 2002:a05:7022:1a83:b0:11d:c049:2fa3 with SMTP id a92af1059eb24-121722e30eemr14591163c88.30.1766455430244;
        Mon, 22 Dec 2025 18:03:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFC2sVpQwO37dYMKZ4rtNjoVTCKHbyX8M4akAueTEpepfJTaA8nCAX9mdm4iKB+EFqyv3zjQ==
X-Received: by 2002:a05:7022:1a83:b0:11d:c049:2fa3 with SMTP id a92af1059eb24-121722e30eemr14591119c88.30.1766455429593;
        Mon, 22 Dec 2025 18:03:49 -0800 (PST)
Received: from [10.110.55.95] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm38259631c88.10.2025.12.22.18.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 18:03:49 -0800 (PST)
Message-ID: <e9190f33-de6d-41f6-88bc-1f90513bcb3a@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 10:03:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com
References: <20251117021645.712753-1-shuai.zhang@oss.qualcomm.com>
 <20251117021645.712753-2-shuai.zhang@oss.qualcomm.com>
 <mtp3qxngbnlpzk2cdp45ndtecab2h56ocwm6cp5ia7butra55a@bevidj6vdwzj>
 <c3526d32-6769-4681-bc54-90a4af082265@oss.qualcomm.com>
 <bvkfq2cg3nstegininpxjr2ldfv2kode3fy6ekv5vuwbh3lrv6@qnvxwsu7y4zl>
Content-Language: en-US
In-Reply-To: <bvkfq2cg3nstegininpxjr2ldfv2kode3fy6ekv5vuwbh3lrv6@qnvxwsu7y4zl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=6949f887 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=PFKM2LL8Qd6Ys6_6jnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAxNSBTYWx0ZWRfX6dYhrRFlw/Ll
 6hSjsbmSbkg7rudf4lGulB+AmRPujiQEycFiMab2lDUaBi0LgZtN8KobCDvzqXWCEe1v+uarhny
 bRZWex/s5Nq4MRRFm/SpUcG2hxAPT9pSCUqP+Vb8DQA69z8XrqoeFe0oetMwzOi+ECwihPCJRkE
 dyr0m96ZRCWNmI5C8ux1f7OqBP1M+tn1MiJAqtpm+gY3SbH3WYPOK1UrS3aco8tuzSoZJxV8ruw
 JnHZ4u+E76E7EqGJ9Cq9NEyYvFJIHAU3DHxmbUo2LHm4PwqYw1V5pCmRXXvQz/xdkK+Y4lSNWu1
 8FU3FXZD0Ju42+G17Ofon4Jup9klNx4//jzDxjb7EgM1fP7i4LOFKWxBPVT0OaSF3df7kx/eLuv
 jIKk25scaam4+GOhCEO6wiNXsZciPKHEVX0JAmYAujn2dXcmRl1gFEm4hvzbUtYaZAg604rZw+n
 XWu4fpzu9tq/40Lw6QQ==
X-Proofpoint-GUID: 54_DfV5_rVD_v4fcIywXui8L2dQGUuzk
X-Proofpoint-ORIG-GUID: 54_DfV5_rVD_v4fcIywXui8L2dQGUuzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230015

Hi Dmitry

On 12/21/2025 11:21 PM, Dmitry Baryshkov wrote:
> On Fri, Dec 19, 2025 at 05:19:30PM +0800, Shuai Zhang wrote:
>> Hi Dmitry
>>
>> On 11/19/2025 3:59 PM, Dmitry Baryshkov wrote:
>>> On Mon, Nov 17, 2025 at 10:16:45AM +0800, Shuai Zhang wrote:
>>>> Historically, WCN685x and QCA2066 shared the same firmware files.
>>>> Now, changes are planned for the firmware that will make it incompatible
>>>> with QCA2066, so a new firmware name is required for WCN685x.
>>>>
>>>> Test Steps:
>>>>    - Boot device
>>>>    - Check the BTFW loading status via dmesg
>>>>
>>>> Sanity pass and Test Log:
>>>> QCA Downloading qca/wcnhpbftfw21.tlv
>>>> Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
>>>> QCA Downloading qca/hpbftfw21.tlv
>>>>
>>>> Signed-off-by: Shuai Zhang<shuai.zhang@oss.qualcomm.com>
>>>> ---
>>>>    drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
>>>>    1 file changed, 20 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>>>> index 7c958d606..8e0004ef7 100644
>>>> --- a/drivers/bluetooth/btqca.c
>>>> +++ b/drivers/bluetooth/btqca.c
>>>> @@ -847,8 +847,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>    				 "qca/msbtfw%02x.mbn", rom_ver);
>>>>    			break;
>>>>    		case QCA_WCN6855:
>>>> +			/* Due to historical reasons, WCN685x chip has been using firmware
>>>> +			 * without the "wcn" prefix. The mapping between the chip and its
>>>> +			 * corresponding firmware has now been corrected.
>>>> +			 */
>>>>    			snprintf(config.fwname, sizeof(config.fwname),
>>>> -				 "qca/hpbtfw%02x.tlv", rom_ver);
>>>> +				 "qca/wcnhpbtfw%02x.tlv", rom_ver);
>>>>    			break;
>>>>    		case QCA_WCN7850:
>>>>    			snprintf(config.fwname, sizeof(config.fwname),
>>>> @@ -861,6 +865,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>    	}
>>>>    	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>>> +
>>>> +	if (!rampatch_name && err < 0 && soc_type == QCA_WCN6855) {
>>>> +		snprintf(config.fwname, sizeof(config.fwname),
>>>> +			 "qca/hpbtfw%02x.tlv", rom_ver);
>>>> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>>> +	}
>>> Is there a reason for ignoring how it was done already for other cases when
>>> we need a similar fallback? Please extend the existing code (or rewrite
>>> it) instead of adding a similar hook at a completely different place.
>> Current Strategy (when DTS does not specify rampatch and firmware):
>>      Rampatch: Load the rampatch based on soc_type.
>>      NVM:  Load the NVM with board_id based on soc_type.
>>                  If the file corresponding to board_id does not exist, then
>> load the NVM file ending with .bin.
>>      For HSP (new requirement):
>>          First, load the rampatch/NVM files wcnhpbtfw and wcnhpnv.
>>          If not found:
>>          Rampatch: Fall back to loading the hpbtfw rampatch file.
>>          NVM:  Starting from wcnhpnv.bxxx, load the NVM file ending with
>> .bin.
>>                      If still not found, look for hpnv.bxxx and then apply
>> the above NVM strategy again (soc_type(board_id)  to .bin).
>>
>> The current changes are based on the original implementation, which should
>> make them the clearest modifications.
>> Please review according to the existing strategy, and feel free to let me
>> know if you have any questions.
> qca_download_firmware() has workaround code for WCN6750, loading TLV
> file if MBN is not present. It doesn't make sense to have similar
> workardounds in two different places. Could you please unify code
> (either by moving existing code or by moving your workaround).
I tried to move the changes into |qca_download_firmware|, but it 
conflicts with the logic for
loading the default NVM. Specifically, when there is no NVM 
corresponding to the board_id,
it will not load the |.bin| NVM file. I’m not sure whether this 
limitation is within a controllable range.

https://github.com/shuaz-shuai/Add-WCN6855-firmware-priority-selection-feature

>>>> +
>>>>    	if (err < 0) {
>>>>    		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
>>>>    		return err;
>>>> @@ -923,7 +934,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>    		case QCA_WCN6855:
>>>>    			qca_read_fw_board_id(hdev, &boardid);
>>>>    			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>>>> -						  "hpnv", soc_type, ver, rom_ver, boardid);
>>>> +						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
>>>>    			break;
>>>>    		case QCA_WCN7850:
>>>>    			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>>>> @@ -936,6 +947,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>    	}
>>>>    	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>>> +
>>>> +	if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
>>>> +		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>>>> +					  "hpnv", soc_type, ver, rom_ver, boardid);
>>>> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>>> +	}
>>>> +
>>>>    	if (err < 0) {
>>>>    		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
>>>>    		return err;
>>>> -- 
>>>> 2.34.1
>>>>
>> Thanks,
>> Shuai

