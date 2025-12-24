Return-Path: <linux-arm-msm+bounces-86494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7C3CDB8AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C3163014590
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA602D3A60;
	Wed, 24 Dec 2025 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qxd5vU9z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YpwJjy8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94530286D73
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766559274; cv=none; b=UEF4HDQKVBY4E7Uq6GbwRVfBqwiLy1IdqcQZxi8H3bl2anUUHQH0zU6838ygb3keK23tX95rxKiBu/AaoFsMnoqkTxVZK51nQZyjNE45zONr1k3KEJktMwAUSuKWrOQrIkEgL2FvjRVSSi/2B/VubXqJ4DCKqm8a/hYC3EWDr3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766559274; c=relaxed/simple;
	bh=so7ejs/tXD+v18SWqcbAQpatqZhSQdyisz6wolGvqKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvJHyKTsVGs0rNvQydrTh+M2cmsVHYbge+F9agmBf9BHM5BApznde+jwEb2lKYyYOJpc505/akMpTB9hzryzG2u+lIGqLc+JqUpyxy+vszsm8kNyrrYFVivSj/J7zPC8EmOfKsrk8bvYT91NvZbflnU5cK85AbkM7MoKu7gV/UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qxd5vU9z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpwJjy8/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3f3Qj4134142
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34Okt0JF9BBw4/qZVJvVGZbHMv8GtHzwox7/u8MrpdM=; b=Qxd5vU9zdW3UDyCC
	m3QFdV5BDulsLiIns3bfYQKhadQ1iIyvj7s2Sc4NzovZWLqrsXHcjxc7h/oNBBRv
	sj42hazzEdF7HVO3QIIxsATa5fGGWWBr57GLzQSRlamHHhLLJKm/feEuJPhkCs3/
	INrOolQpO/uplAHcgTDBkapaHk/CVn4kobtdaJ8d/prqgrAVgD6LqUwB+NENoyPz
	OLIBFel3SRv2NtCsQaseVyIrBVA9rifnB0+cJJdr5Hx9C2DD8C87S2ckucl0E//m
	r6vmi8QNFVCrETcz6H/xac7s5eLDVdCojC1l6XKHbXysHPfpYtV9c0xvVbzvqtek
	UQEjgg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46t79d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:54:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c0c7e0a8ac1so8535918a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766559271; x=1767164071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34Okt0JF9BBw4/qZVJvVGZbHMv8GtHzwox7/u8MrpdM=;
        b=YpwJjy8/LmmUddrQVFuje6RoOKceOYF3aTzHwvuC2N9SpbRB2HAFFZRiJggZLkv6sK
         DzAESa8PQ26EkXgOTbiyrRSxfQ677Jfwik1Hb6HuFTMsTg6LkEX/OmpiRz/uD0JRIIFS
         osyXXSWnSx2WhL7Pw0avw8oXSj+ZJW/iWyW1d8TijOdJJTEPGj50moENw0C3I5QKv7VV
         AvvUcV56BfDB+pR+jYkZ2A08zM2Z3sxjlGWF3tOcwXFllHJqBmDBRVlMFOuWk4yWPOp6
         uhH1qYQkKpFgHJsmr6TTk37aRNCi4qpX9R4ItTb8m/t3/+StzZubWXDLokveB+AsXtod
         xdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766559271; x=1767164071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34Okt0JF9BBw4/qZVJvVGZbHMv8GtHzwox7/u8MrpdM=;
        b=MUz91By/qyQnc4YShJTdzzHwGPsuvvAeHpIWQOfiTR+xudmbRlx8KIIZAHM9+SCYn0
         eVd/HIzFVJBRCIjQu3fk/006jkzSB8L3zUdRwnn/u1iogMHfWhNvBH0CX1awq7RNS9aq
         DcfRx8zdfnnZ7Gj9fpFs4hVzQJIeVtMJIfVtTwCRQzFw2bN3ZWSphAyxpnw8MqUnmwwO
         p9H5m/YzgBoEzuh5ivL7G/8tunrYFfBNqYVnU5LXOjuZG2dZ2nJ20cG13vWcJiuZ4o4N
         adbdRhO9hPBqg9q5hqmhZ5RxtlLIC8Ok0V0UjWHEtOS+ZAaHuimGXym385/zAQpQ4aWn
         bNig==
X-Forwarded-Encrypted: i=1; AJvYcCVeoYWdKzrfydH3CftS1a0XsG+M75th99vrjtjtNJVCjI8bAD2fPMKumnGLbS8E47LVuBdSB0jrn84WR9uC@vger.kernel.org
X-Gm-Message-State: AOJu0YzMl3/Dx/aGQcRx4/gNkS8LNbAc03B1X372p6ODqwR2C7elTgBD
	WAATmF/LWlr2zvNI9O2OdB2DJVmJ4PZ9SenFPecBVSooI/GBQ3DIl3XxGxHlUcW9r33gri0Fnua
	HioenX/ZW9QVAtOB5BoU2Mo0wpO47zze36NER0lcyMWj6MUeUGLSUM1t+BE6CUflO/0fgNjDKIY
	LHU4k=
X-Gm-Gg: AY/fxX6+NFVFMyYbU0nBkLp8DSUUha/M0rMXqpDy+4h5Z8cV8Mo56eZuWrQbuLLXSIP
	bXB/eqaVOf/6qSJKnYyVuOrK10ERxKzGPbTyDxkOdGh/1QZCDddpTwR/fN/ofTIRIO3HkMu4zmH
	mUQI30zd6+G1ODmJSyhB869oLbMQ6akYhUszxbpTLwyOEL2EOZYFF2mZOwa0IBbmtkSJdEsa+HI
	fMwnbyjc8OAWIdlfhF0dfXOLyaFEvQdP7vRgmsN7tnup/teB6yPKGe2SQ7O501amXrALYtzLulG
	/ul17a2vX3rYAuAc1nxNSNFOTJdV4kQaj4LPe2mQrwzBdQYTlzT6WDWAdu29itoKSuRiY/4xZep
	cVTf44epK1xBTbOLSaKk6YxUm0TPJxleeQ1GxzfjZXJO3/PBllbHKi6dqDe1JlzI=
X-Received: by 2002:a05:7022:4089:b0:11b:9386:8264 with SMTP id a92af1059eb24-121722ed029mr16013609c88.41.1766559270850;
        Tue, 23 Dec 2025 22:54:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZHmNsSPH6NKM+ismOIXjTLrl9nL+cZrkSk6A/E8HhMhoy5SFYbFs0Pn0v/AjsbVdXeXH3cg==
X-Received: by 2002:a05:7022:4089:b0:11b:9386:8264 with SMTP id a92af1059eb24-121722ed029mr16013598c88.41.1766559270243;
        Tue, 23 Dec 2025 22:54:30 -0800 (PST)
Received: from [10.110.49.95] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm49331825c88.8.2025.12.23.22.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 22:54:29 -0800 (PST)
Message-ID: <fb6d72f5-b35b-41d8-93d2-eb4fa83c513c@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 14:54:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <e9190f33-de6d-41f6-88bc-1f90513bcb3a@oss.qualcomm.com>
 <t4rfkbbw4pkio5xwar5ilytkjsfiok7ni3xbrhbhh46e557xga@m3uannuoqja4>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <t4rfkbbw4pkio5xwar5ilytkjsfiok7ni3xbrhbhh46e557xga@m3uannuoqja4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: v0I_0qW7O7IAhd0MUn3Dw_HUwuQo9FDC
X-Proofpoint-GUID: v0I_0qW7O7IAhd0MUn3Dw_HUwuQo9FDC
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694b8e27 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=33pz77RsE4FNkTIxbK4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1NyBTYWx0ZWRfX0GcN5Ys4hUJE
 vQcZfsGwuPk7NO35w8F8Zgi3h9uoaiQfdt0/CjJ61gchgnlraV4zhPPIVp/G8IpGt31gHcsD0oV
 kMVb3wB7J4/9a39dpCeCmZuokjdr8YsLTHXub11lupnM/INDOtS2kpQnvRM5yRqMcxLI5MC5mpV
 RcuesvK2YmWGEhSCAy+znYJfBA6fwdZlnTC2lmT5AQbLxJ6g4H90jZOCoH+kGUHjs30mHnW+9OF
 g7fOkOSswG0h96ANDT8NwbFZOXBri1mLCOzmpUaGv36mbTp4NufIP0rMUTzENWuF133i33jGOLn
 dSKBGJcxASFUWfKDLKZBr8GO3YJ8+OgyfOhHa4uakNf3HqOLqhHG/NiNzIL6vUGAc4A8YScphsR
 Nnlod58aKzVEGJy2w2T5Vur9+CuVZBBuWDilPHCHeeSNA2zE4FEK+kvrZ8VQOy3MXq1HB4q+FSP
 szLx3YITyA1b2A0yY3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240057


On 12/24/2025 12:23 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 23, 2025 at 10:03:44AM +0800, Shuai Zhang wrote:
>> Hi Dmitry
>>
>> On 12/21/2025 11:21 PM, Dmitry Baryshkov wrote:
>>> On Fri, Dec 19, 2025 at 05:19:30PM +0800, Shuai Zhang wrote:
>>>> Hi Dmitry
>>>>
>>>> On 11/19/2025 3:59 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Nov 17, 2025 at 10:16:45AM +0800, Shuai Zhang wrote:
>>>>>> Historically, WCN685x and QCA2066 shared the same firmware files.
>>>>>> Now, changes are planned for the firmware that will make it incompatible
>>>>>> with QCA2066, so a new firmware name is required for WCN685x.
>>>>>>
>>>>>> Test Steps:
>>>>>>     - Boot device
>>>>>>     - Check the BTFW loading status via dmesg
>>>>>>
>>>>>> Sanity pass and Test Log:
>>>>>> QCA Downloading qca/wcnhpbftfw21.tlv
>>>>>> Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
>>>>>> QCA Downloading qca/hpbftfw21.tlv
>>>>>>
>>>>>> Signed-off-by: Shuai Zhang<shuai.zhang@oss.qualcomm.com>
>>>>>> ---
>>>>>>     drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
>>>>>>     1 file changed, 20 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>>>>>> index 7c958d606..8e0004ef7 100644
>>>>>> --- a/drivers/bluetooth/btqca.c
>>>>>> +++ b/drivers/bluetooth/btqca.c
>>>>>> @@ -847,8 +847,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>>>     				 "qca/msbtfw%02x.mbn", rom_ver);
>>>>>>     			break;
>>>>>>     		case QCA_WCN6855:
>>>>>> +			/* Due to historical reasons, WCN685x chip has been using firmware
>>>>>> +			 * without the "wcn" prefix. The mapping between the chip and its
>>>>>> +			 * corresponding firmware has now been corrected.
>>>>>> +			 */
>>>>>>     			snprintf(config.fwname, sizeof(config.fwname),
>>>>>> -				 "qca/hpbtfw%02x.tlv", rom_ver);
>>>>>> +				 "qca/wcnhpbtfw%02x.tlv", rom_ver);
>>>>>>     			break;
>>>>>>     		case QCA_WCN7850:
>>>>>>     			snprintf(config.fwname, sizeof(config.fwname),
>>>>>> @@ -861,6 +865,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>>>     	}
>>>>>>     	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>>>>> +
>>>>>> +	if (!rampatch_name && err < 0 && soc_type == QCA_WCN6855) {
>>>>>> +		snprintf(config.fwname, sizeof(config.fwname),
>>>>>> +			 "qca/hpbtfw%02x.tlv", rom_ver);
>>>>>> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>>>>> +	}
>>>>> Is there a reason for ignoring how it was done already for other cases when
>>>>> we need a similar fallback? Please extend the existing code (or rewrite
>>>>> it) instead of adding a similar hook at a completely different place.
>>>> Current Strategy (when DTS does not specify rampatch and firmware):
>>>>       Rampatch: Load the rampatch based on soc_type.
>>>>       NVM:  Load the NVM with board_id based on soc_type.
>>>>                   If the file corresponding to board_id does not exist, then
>>>> load the NVM file ending with .bin.
>>>>       For HSP (new requirement):
>>>>           First, load the rampatch/NVM files wcnhpbtfw and wcnhpnv.
>>>>           If not found:
>>>>           Rampatch: Fall back to loading the hpbtfw rampatch file.
>>>>           NVM:  Starting from wcnhpnv.bxxx, load the NVM file ending with
>>>> .bin.
>>>>                       If still not found, look for hpnv.bxxx and then apply
>>>> the above NVM strategy again (soc_type(board_id)  to .bin).
>>>>
>>>> The current changes are based on the original implementation, which should
>>>> make them the clearest modifications.
>>>> Please review according to the existing strategy, and feel free to let me
>>>> know if you have any questions.
>>> qca_download_firmware() has workaround code for WCN6750, loading TLV
>>> file if MBN is not present. It doesn't make sense to have similar
>>> workardounds in two different places. Could you please unify code
>>> (either by moving existing code or by moving your workaround).
>> I tried to move the changes into |qca_download_firmware|, but it conflicts
>> with the logic for
>> loading the default NVM. Specifically, when there is no NVM corresponding to
>> the board_id,
>> it will not load the |.bin| NVM file. I’m not sure whether this limitation
>> is within a controllable range.
>>
>> https://github.com/shuaz-shuai/Add-WCN6855-firmware-priority-selection-feature
> So, the solution is to move the quirk for WCN6750 out of
> qca_download_firmware().

I’m not entirely clear on the rationale for removing WCN6750,

as our current discussion focuses on handling WCN6855.


If the logic for loading hpbtfw.tlv and hpnv.bxxx when wcnhpbtfw.tlv and 
wcnhpnv.bxxx

are missing is moved into qca_download_firmware(),

it won’t affect the firmware (hpbtfw.tlv). However, for NVM, if loading 
hpnv.bxxx fails,

the hpnv.bin file will also not be loaded, which is a defect.

This is why I prefer retaining the V3 changes.

Please let me know if you have any concerns or questions.

>>>>>> +
>>>>>>     	if (err < 0) {
>>>>>>     		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
>>>>>>     		return err;
>>>>>> @@ -923,7 +934,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>>>     		case QCA_WCN6855:
>>>>>>     			qca_read_fw_board_id(hdev, &boardid);
>>>>>>     			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>>>>>> -						  "hpnv", soc_type, ver, rom_ver, boardid);
>>>>>> +						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
>>>>>>     			break;
>>>>>>     		case QCA_WCN7850:
>>>>>>     			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>>>>>> @@ -936,6 +947,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>>>     	}
>>>>>>     	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>>>>> +
>>>>>> +	if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
>>>>>> +		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>>>>>> +					  "hpnv", soc_type, ver, rom_ver, boardid);
>>>>>> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>>>>> +	}
>>>>>> +
>>>>>>     	if (err < 0) {
>>>>>>     		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
>>>>>>     		return err;
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>> Thanks,
>>>> Shuai

