Return-Path: <linux-arm-msm+bounces-77244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B47CBDAB19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 18:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 66B2835382D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEB4303CBD;
	Tue, 14 Oct 2025 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D00qQswn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE62D2483
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760460527; cv=none; b=gb1NH6w8rXL+Ga3j5jgMbHdsiADDxTLpIz/MoQTjG3TCzPcmfTNmMI4ZXZGegda04odHUca2F0Bre2H0H/FmAbm6b6HkgBoEF65pff8FogJOMxeKLlFqC9sWDjSbyGAGZwlSYG8SvOMzC7Eceaoo19CTp2g97wO71YFhC2olYfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760460527; c=relaxed/simple;
	bh=UWX0ba8EiZLjAm/lcykp/GrQ2XM9gYzU+3MgXTWq7go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLFrmZiTMrYJcKXXhphm1nj6Vkjw4ZkC5dBkeQ6SSncsLIbBfwj/idfSuL5ijCCjtfa9BIPinVCKFE7NXkIm4Fa79PnCK8GflQCrs0R5sx+vWcgKtJd8bjC/bFmc3cPj8ZT+E6dbNhCTDMdgpa26HTq5qFI4NJhBy6rG6RGpUWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D00qQswn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EG63Zn025660
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0T1Jjp9QDrR/DmyB+uvS3bVOfpogbRvHlaXdf+Z3TC8=; b=D00qQswnhERKYlRK
	3XlOpkdp2tStNoU4792X3kPXExvNtCd0fHt13tc81JwoFp/UxG8+ImzR1WUbYHrc
	YgV9up0ipIVmM8hPHiCxPUQCRMG9vivZjrH/eXGlwEBODmUGfflMYXFMcFJX+TG4
	C1fqJngSgQOMav6b3YmtFRXaWV8qD8oOkRLqEgPQbNSSUNC9Ym0jvCKRCeguAa+l
	MPsgtnyBXLU6cFnFWSC9dqUE+iiZ0wOUOoJZnT1/gL1MHc9NEI2ISjRBipwD7Oyr
	GB8wdpYi/2LZ6jY/jP0SsUCCOBTqKRjQVOVeWP3i9Gtx2/F2hpQmj9GWaEFotuKS
	wx26UQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg15xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:48:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-339d5dbf58aso21775226a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760460524; x=1761065324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0T1Jjp9QDrR/DmyB+uvS3bVOfpogbRvHlaXdf+Z3TC8=;
        b=KGqOIndZo5fomvK15EqG5bx0vwjqPquI5KAgakzlvakBqhydttrb56dfiBHofOVyfQ
         T+9DlsQ2JWC4GU5GE5a+fuu1ibdmZLMgrOcPOEULfgJxd/MeHBez1mEPD3x03IRyxSN7
         g7fEXjEsfYj4EF+3W9uxXZ3Nm43HBwNXByAVUE2ymDCRNI+fjs7omZvku3WPET36yXRn
         xC8PDQrGIneZXE0BLSvY+b19BLsfHfh4T0gJq49Nzyn0iJtTUX0Z1NyqIsRlVNnPyZYT
         8R1SAb5GQg4YVlJGt0VbtmqEb814VhDG7Swo1CdsCZJtwV4jZUWYiauY4JbqYQ04pjnu
         AIEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7SSWPFb17qhaxbW0IYxYPqqYW7fxx4ulBFJM7eEZKKShnANaAyMXcSyGqzmgenbBwi0N/GSZiHTm+wnk/@vger.kernel.org
X-Gm-Message-State: AOJu0YyAKeNypsMeSOYNavKre5dwIKc8I0P6bdjN+k7BLu3GLxj1sWUm
	6tQ5aTI+yGFmXKtmJMll41Y56FH1S2RowionqMGhuw2A49nAho64yUzT8HF3KFK9dXQB4ZwJmUi
	oYtltOgEYd9MB1v+cNDosO1xIIe0FnGBP7jl/nwtZh35+h73gnq4TDtRp3z2r9P8vA/jf
X-Gm-Gg: ASbGncv47mc1hhhy/Yoj1IOKWXEp6yT/hGJNY/B2HMsl75kwxlLtdpP0IE0wDKAONFN
	+RcaVKdn8taT94GAOR2makFi9xq9pTQDezWatFr0U8gYxp+6CkYYty/t+4wOx5C/goo5fkU1ja6
	zfdV1qFsyFbKi0mhshmYO1xCz+rzZQw41vcki53gID7BPWKlrIov4EQqtAU06BfSzr3II+3IzwS
	Tak+ge9WCU63IQMfL/Wf7tSO85mNxH5aLG9ugOQgQajC0/aFs+ThGT948FaY5hwFPLdK6sG8iAT
	nQ0pFqEbFg3+HE8n/DLyXL8w0VqQ6pvD8Q8bqEA7OiWBSXmhq50aJuuRkcv32j1DgC0YFAemuoW
	D3yxpkY+Y4lOGBA==
X-Received: by 2002:a17:90b:3ec5:b0:327:e018:204a with SMTP id 98e67ed59e1d1-33b50f85081mr34686280a91.0.1760460523638;
        Tue, 14 Oct 2025 09:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfjmax7nUj1hTWUtndCVkZQbPyiK00PHdxF5uajC+DTYIemIff+447wAHVQF5O6WWnSqeWBA==
X-Received: by 2002:a17:90b:3ec5:b0:327:e018:204a with SMTP id 98e67ed59e1d1-33b50f85081mr34686257a91.0.1760460523171;
        Tue, 14 Oct 2025 09:48:43 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626d61aasm16453355a91.17.2025.10.14.09.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 09:48:42 -0700 (PDT)
Message-ID: <d61ca50d-f9ea-40f1-a97d-090a11e49028@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:48:41 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
 <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
 <148df7bd-6410-4814-94ef-0880b596f363@oss.qualcomm.com>
 <74703f5a-243f-44ae-bf74-ab5ddfb6f685@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <74703f5a-243f-44ae-bf74-ab5ddfb6f685@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX4TPnCFSfnyiY
 wuMO8pSnuoVy/orAeOcxa22VqeAXjdeuxleIV7w1IhczucPBpHkc1luNlmqQ3CqNBBMSlQdSQmr
 8US+aw19rPNcabndwj+7W9HYceZ43QA55fAm4vFE9cmS2X5AO15bRAqAg3XSHPQZTzKjF2Olwrl
 p3JZq1hGbWpkkQGQ0gAf+C/89i1mbC6l/pcwIquCfkyWsCluyGmv1B3erQqMt15jtO9FyyYKAZp
 V8fBV8XXVdO485tx1e2nILhW5p8/3MgEtw1vV85HVH6I6/TvFgAxJ+NsdWOX+SlrafyzMt3Bx0p
 AQgKG5lOkjy7Qs8fa1oSKq0Kye8yGfspzuSckyoywJzyPVtYWk757FltAxBjfEYULLa9CIOk1lh
 bVA1aWWtrHOSI4KN+g0Irft8TqrGYQ==
X-Proofpoint-GUID: F1r33mK8IIC9K1N4SdIo1YHAYfzsKLMX
X-Proofpoint-ORIG-GUID: F1r33mK8IIC9K1N4SdIo1YHAYfzsKLMX
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ee7eec cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DQEq_hw0WcjhS003KFEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On 10/14/2025 1:48 AM, Konrad Dybcio wrote:
> On 10/14/25 1:47 AM, Carl Vanderlip wrote:
>> On 10/8/2025 12:49 AM, Konrad Dybcio wrote:
>>> On 10/8/25 12:15 AM, Youssef Samir wrote:
>>>> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>>>
>>>> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
>>>>
>>>> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>>>> ---
>>>>   drivers/accel/qaic/sahara.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
>>>> index 3ebcc1f7ff58..04e8acb94c04 100644
>>>> --- a/drivers/accel/qaic/sahara.c
>>>> +++ b/drivers/accel/qaic/sahara.c
>>>> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>>>>   	[23] = "qcom/aic200/aop.mbn",
>>>>   	[32] = "qcom/aic200/tz.mbn",
>>>>   	[33] = "qcom/aic200/hypvm.mbn",
>>>> +	[38] = "qcom/aic200/xbl_config.elf",
>>>
>>> This is the third oneliner extending this array you sent within 24h,
>>> please get the list of required files and update this list once and
>>> for good
>>>
>>> Konrad
>>
>> I wish it was that easy during bring-up.
>>
>> These patches are being upstreamed from our internal branch and thus
>> reflect the different latencies across the sub-teams to that request.
> 
> That's upstream-first-first ;)
> 
> I would assume there's a single list of files that get loaded, perhaps
> within the device programmer image.. Unless you're altering that on the
> fly as well?

There is no device programmer.  This device does not store runtime 
firmware in flash.

This device is still under development and not in the hands of anyone 
outside of Qualcomm, yet.  Much to my annoyance, the firmware developers 
are continuing to change the firmware images - adding new images, 
splitting up existing ones, etc.

I'm expecting to lock this down, with or without the firmware teams, 
once devices end up in the wild.

-Jeff

