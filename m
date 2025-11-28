Return-Path: <linux-arm-msm+bounces-83743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC2C91BFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0C8BA340F60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A8030AD10;
	Fri, 28 Nov 2025 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpj3UCBg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAriEkaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CDB308F05
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764327861; cv=none; b=KBx7aB5grkAgMigu+HJjPiwS/WlAdem8Maaw1xm6M4FLxcP/soVwn8eymrVm6tlsmbHw8ggmXKO5ACyrkGqKE+SbgMXS2Q5yHkSQkuTuq7YOf/7V2BpcigtpJCnel09U6BXQGrlnHAVVK3da3DmT2ihAAbi3HcqMvK69BW7DfpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764327861; c=relaxed/simple;
	bh=io2qTwYQTp6q1yk4V6dF1s16CO0Ve7WhukxEkDZ29Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SViSmNmp5E8t1thmoUHTfuF9M7qFl/OPTE+BIK1B7ch/1KeV72mMZZ0ETuSde2+rRicNeXIw3XG/bbH3hYgR9MctPleVpq0oYdsEMvPql4UQ7PxYHChIBg+4v3cEplB5PqUmqyuJfy+3eD4+7hpMfpyduCWNcNLLSheHL8ahlBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpj3UCBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAriEkaq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8Oq3k3621303
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkor8fAqAL5jcHpNVd/wYoQjdbh3Wm5P2F/U2e70reE=; b=lpj3UCBgfLKg1Wvu
	Ru0YjyBGSj4wjl2BRBkbnUPT42jhdxzUOi8/XO5CgaCrdMgfKV4IGT6P+YL4zeCK
	tAkbcF5tjc0g8kc8IBvhfGFUZ+Igxv+xjC//F2WROxKFR3gUecW0Xa6MLClhYwaM
	IuiGLEXBHhgv6TLtXm3JZN3aRna22UffUxwtgdR/9SZ8zLUGpiVLLpgGifoj/1Gq
	SV/PNf3cq1Xr81i9zUgiFaS3bwRRiCjfrtZzyL4KPUgboI3zPX5Gdb1nycvKJXFS
	c9Ue6m40QAdK4XMSNQiC9EyF4n4uCFk2AjrYUklsxXhOZCwXk2Hr66Mi/W+wFGLl
	aiXlUg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjdb5cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:04:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5dfbe140bffso176021137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764327857; x=1764932657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkor8fAqAL5jcHpNVd/wYoQjdbh3Wm5P2F/U2e70reE=;
        b=EAriEkaq8unNUAkEyNDc+W208ik7viDlB2VWjhiEEHZrfz8Ll0SlOBfwIXljFa8R1T
         2HVEcrWaLxQuFTFvSwT8uVKMDaRVpl4bhPeKIzNaNzaMPzofcU9WRD17sl8DgpYhyRy/
         s/5gf2+llkSXtn27DXErZStWJ+q60OrDsVcnsU2BLHKElGToQEuVic5/HPvABvQs6ivH
         i2Ow5jfYPzZbLapq4Cj2YvO4q2dzABFrF5cvZX+gp5BO7yZgRulPHEwqpdRWNuetv2w6
         532mZ0O4lFfsynZeBe8OMFUWKf59WyrDkpqXS287nRpF/MVm2sEz+HwaUJEPwr4FVfus
         DM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764327857; x=1764932657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkor8fAqAL5jcHpNVd/wYoQjdbh3Wm5P2F/U2e70reE=;
        b=TGOtb1n4U7zJGvUsDR9dmdaMQfOBLRZkb6bQZ6cu2iaklF60AffKUyI39bzR8od2JQ
         3M+1JJjtJGY7QpSTRBvy4byNqjoD51vem+gi1Y8qspmGwTU3FneiYGZw8EDgaxsPISj5
         RkANnObIWBfkAPi0YhSxVA1vkjNx5qha3PNMsqRG5zAP3D92EzUmNvL0uwg9MQKzlZtU
         FkuXTckf33VL1tONwrZBkiuZ3oGMkNnqosiU+BzSGCV9D6waJJ59Oxy2OIZ03eFHDLHX
         H6BpKsVdb4hE+9Ivmq4KEi0tveVSXNQyxufRad0fOFVOTf79W0S2/wo9jDZHnOks1EYE
         b9lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbWRpA5EGbtBuYPJCnosKb3ergo04X/IBis0WSFS2aIjmxTmy5i0hjQ0zDD5HOYQqJaRXJ0SKU8s8vtASD@vger.kernel.org
X-Gm-Message-State: AOJu0YyHkOaPgdmI/MNm7JBCfhvuAonreseY2xd67gLCG2886bIyTshw
	63JoBxFTfMQnoVodVW9Dxj83mm06FC6FXkjogbJPDkxJf67yQLXqPWjIuop5Wr22rm0RBwdR4eT
	D6VsdMBbq/m0k/WYy83Co/oZguydGsNUmvPKwchnB4zdfhx4FMJK32Sch8z0tnPnLpBub
X-Gm-Gg: ASbGnctExQ0NIA9lfpm9bSFw9wE+g4SPNoo994lYDuvCzc5DiNsv4YWTad+/4DnT6f8
	7WgWbr0kgS16O1Gbah+xJYqY8bwOXDUnzFstuBBZ8Snb7vWx6nk01W1jWFHOqNbumKi4RDX2xE4
	Ed8tHEA/1mO8xa3EpgJtZbwaoaCC4SwLEJCJ5s00fnkVAyV3YuLhF1jUhm0EP2AS6BGIbvl2/Iw
	RtChoGq2cOyZj45UVPbJuaIVYTwfXvsw0ur2hxQSN05MefYuKPq1+Lq30BwJbl6aCfhkGd15EYm
	+4jNPCUK0bM/AUoWAwYZly+f/3VpIsgwJIXaBpfhU6+iuBZ3Au7tLYCp8VlqRypabCin+Yeq8bl
	79wmletqr3KNH5Q2mSnxQxeFtgOpMn9khj4lcCC2z6sYC4KU9HeROYHPKa3JnxHdYmWE=
X-Received: by 2002:a05:6102:5e84:b0:5db:36c1:17bd with SMTP id ada2fe7eead31-5e1de56cb5emr4715591137.7.1764327856844;
        Fri, 28 Nov 2025 03:04:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoeuS0Wic0v+kDByv3hBDuYERXOu+EYGDY/250dogexYk1Ma2jd9eWsvwx6B/onkqhQDAIYw==
X-Received: by 2002:a05:6102:5e84:b0:5db:36c1:17bd with SMTP id ada2fe7eead31-5e1de56cb5emr4715543137.7.1764327856395;
        Fri, 28 Nov 2025 03:04:16 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162093sm429910166b.2.2025.11.28.03.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:04:15 -0800 (PST)
Message-ID: <d4f58ebd-631f-4ccd-a36b-ac562be7bc68@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:04:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
 <20251126012043.3764567-3-vladimir.zapolskiy@linaro.org>
 <b07b88ed-83a3-46d6-8b97-e8661e2cfaa3@oss.qualcomm.com>
 <d3cccdf4-8c50-4b6c-a29b-5b1388ce2249@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d3cccdf4-8c50-4b6c-a29b-5b1388ce2249@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _VxtMu916XlEbqu8af6I8xbCSf1I4UzN
X-Proofpoint-ORIG-GUID: _VxtMu916XlEbqu8af6I8xbCSf1I4UzN
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=692981b2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=BRLZTvTzQiK5oUZ-ObUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MCBTYWx0ZWRfX4YEwApCuFeTj
 gyoMmD1gANlznDkMjEA/tVBNylPp3JFIqtIlWPt8vFgKToKUo8cRVyIelWb0eqINBKBqslp9HQe
 vmsRFNx8liPFBBDMPYtY7shO+2jtRAj/z9bH9uLG52vfGtFBcKfkAcCu/rvitq2M50tx0W2tEAs
 ajcF34RCrft8vwyQxLTnnUxocRu4nrEzNgHmp6SiUMtaKwJ7gzMZszHpbvZGl5WiuWn3AOiqYev
 cfEtu9vqCO0jpw7dabWoHt1fhCNnIOMFxXagpYgAvjo51UvZiwy5RcZKgts6qovf/x/Y4zzmIvV
 0r8TEXL6t1nR1me420qtQ/bbeLTZwRDRJhSH5URAef3fRS9nXtjWk+5tGYmf9ZQnUPVXPe4xz6m
 Pa2lA+eOj57yeftGd40sVohyTPy3Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280080

On 11/27/25 3:27 PM, Vladimir Zapolskiy wrote:
> Hi Konrad.
> 
> On 11/27/25 15:40, Konrad Dybcio wrote:
>> On 11/26/25 2:20 AM, Vladimir Zapolskiy wrote:
>>> The restriction on UHS-I speed modes was added to all SM8550 platforms
>>> by copying it from SM8450 dtsi file, and due to the overclocking of SD
>>> cards it was an actually reproducible problem. Since the latter issue
>>> has been fixed, UHS-I speed modes are working fine on SM8550 boards,
>>> below is the test performed on SM8550-HDK:
>>>
>>> SDR50 speed mode:
>>>
>>>      mmc0: new UHS-I speed SDR50 SDHC card at address 0001
>>>      mmcblk0: mmc0:0001 00000 14.6 GiB
>>>       mmcblk0: p1
>>>
>>>      % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>>>      1024+0 records in
>>>      1024+0 records out
>>>      1073741824 bytes (1.1 GB, 1.0 GiB) copied, 23.5468 s, 45.6 MB/s
>>>
>>> SDR104 speed mode:
>>>
>>>      mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
>>>      mmcblk0: mmc0:59b4 USDU1 28.3 GiB
>>>       mmcblk0: p1
>>>
>>>      % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>>>      1024+0 records in
>>>      1024+0 records out
>>>      1073741824 bytes (1.1 GB, 1.0 GiB) copied, 11.9819 s, 89.6 MB/s
>>>
>>> Unset the UHS-I speed mode restrictions from the SM8550 platform dtsi
>>> file, there is no indication that the SDHC controller is broken.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>
>> 8550 has additional limitations. One was addressed recently with
>> max-sd-hs-hz (HS mode can only run at 37.5 MHz), but when in SDR104,
>> the frequency must also be capped to 148 MHz. I don't know whether
>> the driver respects that today.
>>
> 
> This frequency cap tuning for SDR104 speed mode is not done. If I
> remember the story properly, the frequency cap for HS speed mode was
> implemented in dts instead of being a pure Qualcomm SDHC specific
> quirk, because it's possible to workaround the limitation by slightly
> changing a board PCB layout. Then should this new SDR104 quirk be
> considered due to a property in the dtb as well?

I think so.

> FWIW, comparing register dumps SD host controllers on SM8550 and SM8650
> SoCs are identical, should HS and SDR104 quirks be ported to SM8650 also?

A document says that in 8650 and 8750 (and hamoa) and newer, these issues
are not present, however the original author added the same limitation to
sm8750:

https://lore.kernel.org/linux-arm-msm/20251026111746.3195861-3-sarthak.garg@oss.qualcomm.com/

+Sarthak could you please remind us why it'd be necessary on !8550?

Konrad

