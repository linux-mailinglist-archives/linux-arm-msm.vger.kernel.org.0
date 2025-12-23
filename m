Return-Path: <linux-arm-msm+bounces-86272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7365FCD7B74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 02:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FFF0301F7C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 01:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65365239E8B;
	Tue, 23 Dec 2025 01:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMnzTWv+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKYNvFsZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1642A82
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766454547; cv=none; b=BlLSWVWH6uYl/PWBlNVdm0sSAC8hLV+u5SZ1g1gWe+irbXwQvElR9Ey0WxWltAdDiTQchUWKjnyHNpztqK9o8G4M7jjG4zWagC++T9TJ9DXBTSna6tBdKautg2dsUy8z0cwPciap9+z92UMiql2m7lsFT69VvH6gS75iqNlIgJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766454547; c=relaxed/simple;
	bh=w11abjTlgWADZv9k48T/N1jHnNoqdhfpuMdvMe6vgLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqr+wK1iJ8l4OzyMrP28+U0W0KOm/sa/9Arry/W3Ww5b7McgjH1Ih7smdkwtaKX8XPpduBW+6WEPJXu9G91FGB5f8GC808LU/PzNC/ZPdeo5bqYF2jRFt/pv6QhwXkqnh+stmlsodWL/EoTM3FVcgaHoHdX9vFa5npSoKRTafHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMnzTWv+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKYNvFsZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMFkwCe1356371
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BW8rbvpMfVR+f032rL3RykV3WSD2/R1qKsif/x4gutA=; b=bMnzTWv+RkuRjmEw
	eZSKKUvK1g/dZLNuJ5WvRAWa5yr31dHOAXcvtNVw8UddfczPmBZKzivKcVLp2rwf
	xLSEwcJFh/33GzCrqnCnlHSf8BDyq8Wz7dKDxcIjJ7ICRoHtCflxIoOPjTwHkua3
	C6K+C9Fizyzx5E5NT2dGu0lJ54OLOlH3Pzq28/54rXoSHQr+gxHvwtD9Om9nSaPn
	2S0YXf72sVFQy9V/htaWw6rP8Jv3cJ8opkug2QpoPvG8g5sHW24Gs8le9zz0mYA8
	UoxLHHmw/415jMijRLr2XVYm9tLFxaoTvlkRHHa6+t63ZdIMB8N56/4OCGMgwlno
	zwmMkw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc19nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:49:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b952a966d7so9395108b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766454543; x=1767059343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BW8rbvpMfVR+f032rL3RykV3WSD2/R1qKsif/x4gutA=;
        b=NKYNvFsZTMq5wWKCFf2iAovFR8mPEf/dr0dxE0VPEmOBxGr8GulWb4BzgoWnuwSkAH
         aJRiH1oLq0ccgllnv/kLDwBb9H2nPRDs82N9bI3H8iqp5nwlsYqwnZ5DVW/QIpYWBuES
         zhVuNvj7B2zCjTFE1oaSN0aB38tVkxkCA2lBkiHHFF8sRQk/8Lx/MaHqwhvUjCqbaNFs
         Htgo0m7N9Hq49BnL1S0sXEIMXmcwQ2R7J9pkqTYd2VJaJHjpbGkzb66APuw/TB+S0woH
         DkNY0tkUpO4KgdVq21BLofqRDHml9l9Dy2RK1sAIdkITmpOWsEdM1sxuiPCHNJWYLNOZ
         s/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766454543; x=1767059343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BW8rbvpMfVR+f032rL3RykV3WSD2/R1qKsif/x4gutA=;
        b=hbM9pXRx2aj1GO+4ABzSpATpMrkiD3kzZaGpo7L5atdj0uNYRgpHqQezloWyYBoWq8
         iq7NPNaFjzaa+7MubcCr6fYiUzx0w09D7+eLP8qzYWzcfE5xdWWUjYq9sCsPnAXm5013
         6q/l3bymMm4CvdxBWjW+IbC9HNn5/jtR1BS5xBHvQMHu2w7hmZVaOKXFBTZuHeBPQDB3
         4p5dxDQyvTqeUnSDSlMbtN529axaT6DGM49TdGpJNfD4EvXR7gXyNnzdo21OHdkyizuz
         Ga8x+BGhDKrUujV3wi36JXmUjid4dO9VBRArp6Qx5XZtxOgcN40rG6qPDjtcH99EzmxJ
         RopA==
X-Forwarded-Encrypted: i=1; AJvYcCVz0GYwY6s+GlMAAWNSHfr1KXodAcIJ3pOD/UnSpOW3AR+DkcPSabk2xarX+vGHBf+JmJVaxrlDKd5tKpPY@vger.kernel.org
X-Gm-Message-State: AOJu0YyucnPIFQCbsf0EJPIvKAxrIGGWuyP34Nzca8mC8sfeHryTjZ10
	WJdzKjHxv5LznyL1Co5CBFGBnykB2sA6fXoUC0hfjDF4RpyDGc3EyWQFH0xhOU0hu37mJpYCPNF
	i93SxM+5CE4oCUxoZ58sB/v2iE2eyRupth9tj3Rn9FMsHEyFALIa9vaJRLU6CBtIvC0D2
X-Gm-Gg: AY/fxX4GNTsDkUktxyNAnPoPMWmTzyl4N4An47GvtKYG5qjFAo4rJE2I1IGIMZ7qm0Q
	FD0FxgUzB8JSohksDnUY60Cson7Yv1QJTFXq+2Sn+B0Y7RMctejPyp2XmWFDIlDVVND2yQTM7y2
	wukqNwecfHsNck4QVT3qDT1Srul7RG/MYE1Z0AKiUuFCb4DZ9ZCMlLj09CqVlU4dnw+cgFpXNyu
	YcJoRnf7PMF0YOlC7mGxcod/Wu78Fo2wmLycQfGqwhLUOc7kTNTN9Jm/3yg9mxjp+5ZGZ9k94Rw
	CsJt+flq2i0SUGPSZRuBKAf/ohFVeueivKospO0iGEN4Tr+vt++ERu9qEmzDWg1xtj/OwtGB8v3
	naoGkadXi6pmSmNbbQzmiqVMPtC/2Il4Euh75nn94wkKRnYi3FDaWiI0YRAs7l9WpqDU9h5GV2Q
	Wg
X-Received: by 2002:a05:6a20:e210:b0:320:3da8:34d7 with SMTP id adf61e73a8af0-376a88beb87mr11460616637.22.1766454543288;
        Mon, 22 Dec 2025 17:49:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZp1iCqub4YEnfsj6zxntO/vfz/lLcVOrz1xhaJ4egypRQr4EQUxgsIUZ2JQA7cLmJgrK2DQ==
X-Received: by 2002:a05:6a20:e210:b0:320:3da8:34d7 with SMTP id adf61e73a8af0-376a88beb87mr11460598637.22.1766454542828;
        Mon, 22 Dec 2025 17:49:02 -0800 (PST)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9224d9e5sm11174842a91.17.2025.12.22.17.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 17:49:02 -0800 (PST)
Message-ID: <fb576893-aa2a-4e7c-9c3a-1bda7e849412@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 09:48:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-1-yijie.yang@oss.qualcomm.com>
 <20251222-daffy-hummingbird-of-glamour-fb02d4@quoll>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20251222-daffy-hummingbird-of-glamour-fb02d4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tzj_xCFHq9mcdDtOEu9JGVWeR6gchLLr
X-Proofpoint-ORIG-GUID: tzj_xCFHq9mcdDtOEu9JGVWeR6gchLLr
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=6949f510 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sgiu5Z4A-zyB4-zQnDgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAxMyBTYWx0ZWRfX30IOx6pEuENn
 PEJpqrgWAJe4a6Sh1hZ3Wj+qVKoTvnGRT510DWkjfSSOc9Tj00FJAfwmxq6Gx0HG0s4wlurfY2X
 YUSVW6IjP3W8yBLx82TSIEniXjKG3zq5U2ZijORb3KG8IHR+41xtTyohx7cqTnixoJ5g4pF0uCu
 UBlwVcHWyu99bnkldHG9JJnGJ4Lo+w6XUdz0JMrflbZ87BkUZjZNSQp5pHXY0lv2CN5PcW6UB52
 Nn2W6qK899NEdQOpp5FxadNg3MoyNWiiFPw1USYd5mO/mIhxrApgqo8F8sw5oURqH8wf6bJNUfm
 Dy9buGc9vKDelPIjA2ls9Gpo88O7ui5A97qG2/uIxyvyxXcvUuNUM32pWkqhi8SzGz17epeMBK+
 e2J4EcvgO58oOhcTQZp/ExsaESz6d7L1oQzxQXhGcm98mX8uzs9n+3sP16vAK1HxAEpbB7BauRo
 UWQ/OAU8yd9HrHV1sfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230013



On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
> On Mon, Dec 22, 2025 at 02:03:26PM +0800, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> Add the Purwa-IoT-EVK board to the list to enable access to EFI variables.
>>
>> Guarantee that subsystems relying on SCM services can access secure-world
>> features. This change improves reliability and prevents missing functionality
>> or boot-time issues by making service availability explicit.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   drivers/firmware/qcom/qcom_scm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 1a6f85e463e0..1fed7a81bd29 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -2010,6 +2010,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>>   	{ .compatible = "microsoft,romulus13", },
>>   	{ .compatible = "microsoft,romulus15", },
>>   	{ .compatible = "qcom,hamoa-iot-evk" },
>> +	{ .compatible = "qcom,purwa-iot-evk" },
> 
> Why are you using ABI before documenting the ABI?

I’ll reorder the patch sequence.

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Yijie


