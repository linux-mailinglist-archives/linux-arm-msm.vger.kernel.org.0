Return-Path: <linux-arm-msm+bounces-100667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH3ILYoOymmL4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:47:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6C9355B21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 234FB301C157
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 05:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1982D38838F;
	Mon, 30 Mar 2026 05:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TimNB1Ec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZJu2rpm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A2B149C6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774849546; cv=none; b=F3pSAy+dUZ3bep6ioGIGyuvZ7tMoYeRFNhgzwALVPwwi9r6jRFproRz9MP6jongo40oET4Ep7b5bcGfb1NHp6XdC2KMedNcmPc/DoPgqdWnnfXXSU3wqxusjrx/8Z5FTHYwTMAzu67dtl9Nd6gYrhh+WIgilphYuRDM4SeRXhHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774849546; c=relaxed/simple;
	bh=poc9qMgnkwcElIolQsxsct50pUXh2ykMOLBvEytqk/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JS933/nvqfBgIdeQW5dQrRvXYJ7AOEhAxFj8sRj7BHj0YHB/fTeYNlN7ucqrZkQEgEvkBSO27ME4qa2gSxy4Ze3gvfEOou1Kh75joY6RE/ZZcSXMd1r72Bzxf0uvwaavPvRynDybLcpryT7mqp0cWDbnilpTfcCEKntRePy7kRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TimNB1Ec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZJu2rpm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TLEMAM3783209
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7DVu227WmucQxYjqTod8kwtol9NGmVKJ1oGMwmvziw=; b=TimNB1EcKlmIyDiO
	M+SCINIuQQlf2gAToKSWbXcaXdgTGnNK4jS/fZ/bfJeIBL9oy+/opKe8XKUQpGLC
	9xhYXcahI2Lk18PRg9e4zj11uyQxshM4oyyf9AHXyeSxsFrdyN98HGCyB2d5x9qf
	9R0vc2tvV3Kn2/BWeIre1go+jKktxZqPS/6pUk7zmuvEtNC2vCoY08RB9rdst/kq
	+sC+JKiykd3k+CJHgCxHvnU/DCIhKJE2Ad/SBF2GUH4iMRgaaW/3J+QO35xO8orp
	DCpBGAwEvVuANtt4GPF2Wkf+Uij3DBKHNZL5gsGred8Q/upQ9f4jxKDyU2M9YN1X
	g7yO/Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afvmm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:45:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c649dc145so2539192b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 22:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774849542; x=1775454342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7DVu227WmucQxYjqTod8kwtol9NGmVKJ1oGMwmvziw=;
        b=GZJu2rpmQwE4qqUXA1bxqL7UFhCdfKaYIzxpSgF2S4b3O10XWcX3z8QbBxvLgM0CJ4
         99wu1HqZahRjxV/YBwKaXca86lGHfdz6HNhEz6F3DgwmK12RiTQSoMd1jBui7Prpr7gs
         /GA5NC/+zzpTOnpbQQQGIAMvXdSaaD8y0bC2OmqJd8SyqeXuaNu7wVCbzcjShk4jUx2+
         CLz/YZbElAi2ZzPj2SoG2jtS/+7W6K/OeqkN3rIht3XgtsNr0qx9h71kMwH3jpBQxGVY
         Mfd+VomeuWwCSRW/lZa91OMNqBbHRjzDtLaay+EaUA92qxYqaLwQ86Tadr0TmgZG+Tsi
         hgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774849542; x=1775454342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7DVu227WmucQxYjqTod8kwtol9NGmVKJ1oGMwmvziw=;
        b=R8kKUSBQI77JGBmjSsdKhJe0FJkYgfo16DCfYY7qTBRZwPsbqPpd0dlA4Iysi7+CVi
         bzpPx6ee5HKNuQ8aMGFQ+eew0DsvB0V3AWKSSeCnNK/VPz/b1+6IWh/Dy3KbgsnlGHbO
         PrRicM9bX/tktimfRvlfQd5wtAjInITp+Ms5X1BNH7vmolfO06kSkL7fIalfVsSR+O0J
         xCXuWSMtGTm5QEdVXMlH3+OIFePtksg7Kztf9ExP87oyA4s4GMhItLLZxnTSUucWJcvs
         eu4Q02uBYcdfgCEQpcf5q8mh+FTorGh8rC5phEd5tlmM+Tfo1+LzHdVTj5DidhuVk5Wi
         Sb4g==
X-Forwarded-Encrypted: i=1; AJvYcCXGxhWvUQ+tkoWJApRVIjFznENknJoFPkVQOGYX1N/aGXy2rbjZphUSf7+alJ3qZmoi5vZ5WTF73Z5ywaFU@vger.kernel.org
X-Gm-Message-State: AOJu0YyHCHgndP2bDWKt5ygd+8eopQvdDBYhNHrqJp60+89SiGf9WbMr
	rBxhWrMRR3oXcw58yqGvlNY9/Q6Cu3rjpsw49Rt0ObuAUCXrHPTs0TWmik3zJk/OL5Oi8rAWmCD
	yIL3YapRHPg8Q/JAQAnCA2XW54tDoLdPOSo0HznS8tDr/CrUmlC3GxLYYycbxixWhf12s
X-Gm-Gg: ATEYQzyeiR5ICWoYR/B6M0xI/W2X7ODpDpyFxDJoaRunLwkLDfle+AN8uaGXLG2ojiL
	3NHP0Vol2G1dgRyHhFWFmYohwhJVX5X575RkFd3vtW13y0b1GAEEZmOPgQYd2mKqlGty2Me9u6u
	Cg8rtN/hfaH+udN0j0TjN8zNrO5uYhS7YyB029jrM5kCsOSbG+o964+4+l3CPXTiX3geQTUiy3T
	wN9csCGdHCevmIJKvZsrz7tq5IKC29cU/MYnab4Jjij3g6Q8gKEeHYWtB+Y40zNyYP/0CeSsJ25
	UViSw2mxwCQq3t5DaqWJYExrGbEK3GZ5wN/CY5LLsyTpGev+knYRTSr2m6lUgLl9ffyOzEh7qvH
	njOpWXGyOodDbQn3iCmEIYdryXxIKo/p5Q6QR947basYQIPOEjg==
X-Received: by 2002:a05:6a00:2d9c:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-82c95c2f178mr10993641b3a.6.1774849542294;
        Sun, 29 Mar 2026 22:45:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9c:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-82c95c2f178mr10993609b3a.6.1774849541807;
        Sun, 29 Mar 2026 22:45:41 -0700 (PDT)
Received: from [192.168.1.5] ([49.205.249.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843e1desm6994238b3a.4.2026.03.29.22.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 22:45:41 -0700 (PDT)
Message-ID: <bd049402-6342-4b3f-a2d3-58d8dcda6ca1@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:14:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: add new rate control type MBR for
 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
 <20260213-b4-add_sc7280_mbr-v1-2-e8d95b4e4809@oss.qualcomm.com>
 <84895cad-9f1a-4e51-8e43-faf30b4bdabb@oss.qualcomm.com>
 <7f165169-427b-4f5b-9bee-bb227be23d82@oss.qualcomm.com>
 <69fea3d9214405996d2ecc50419e539e84f22a3a.camel@ndufresne.ca>
 <r23uskjcu2ui4hgviei5pyv2jlnz5bhuqdjavz2ipoenwbya4y@gijmbfreckzl>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <r23uskjcu2ui4hgviei5pyv2jlnz5bhuqdjavz2ipoenwbya4y@gijmbfreckzl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EaXIHSr3PGyk1m-WNL-24GK_tZBm0_U_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA0MiBTYWx0ZWRfXwCvWw1zsX3/3
 pwGoWS0c5kcyCpJ+MezlWn/2seXsNkCn5oEzQKGjcn+GtTjilsaYjUOMFcRMPyEP2YjQUuygYDz
 cpBe3e5m0DHoFMX87MyYoGBJQfokvB30fq66T4KFBCE/+48rEzSs2NpqoBTeRQ/QhFXiU+KVerV
 2N19hbBAvIs0u1NkzMmhsC3Xvow8giYuyhD0R1wUEAFYJu5fXSRa1kFdWm9Em447oiFJKobm0Io
 /UNVuNomViWBgYP+uCWJZ/Njtfx9m4PT8FuK9lp1WfFsVydVCbHRhK5sGOv89u+nNPLc1LTVslt
 PtGSqdwG7cKX7e/TJqauyq+816h1llQzRoOs/Mu0sFVDHeldmLhCUGg4YlAmVVwfZL7s0ZZcIqY
 l1XQmPjrKgo5eGvS/HvAEeiv+vVwSOwNmaq7v0eFbjWcqGeWEV4fDYGvP9h1I6OoX8IMCyIWVbm
 Ie1ZaAs5i5HY7kl3kXQ==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69ca0e07 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=YMTtrPfsndxwdlgdRDw1YA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=o5YXNfCz-0zmBcW412sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: EaXIHSr3PGyk1m-WNL-24GK_tZBm0_U_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300042
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100667-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1D6C9355B21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 12:17 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 01:37:21PM -0400, Nicolas Dufresne wrote:
>> Le lundi 16 mars 2026 à 11:52 +0530, Sachin Kumar Garg a écrit :
>>>
>>>
>>> On 2/13/2026 3:24 PM, Konrad Dybcio wrote:
>>>> On 2/13/26 7:04 AM, Sachin Kumar Garg wrote:
>>>>> Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control to Encoder.
>>>>> Encoder will choose appropriate quantization parameter and
>>>>> do the smart bit allocation to set the frame maximum bitrate
>>>>> level as per the Bitrate value configured.
>>>>> ---
>>>>>    drivers/media/platform/qcom/iris/iris_ctrls.c      |   2 +
>>>>>    .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
>>>>>    .../media/platform/qcom/iris/iris_platform_gen1.c  |   9 +-
>>>>>    .../platform/qcom/iris/iris_platform_sc7280.h      | 202
>>>>> +++++++++++++++++++++
>>>>
>>>> Is this really only available on 7280?
>>>>
>>>> Konrad
>>>
>>> Yes Konrad, in this series we enable V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
>>> only for SC7280 because currently, we have added the support only for
>>> low tier chipset. MBR rate control aims to improve the compression
>>> efficiency of encoder for static and low motion scenes for extremely low
>>> bitrate use-case.
>>
>> Without a spec definition, which constrained the implementations toward
>> interoperability, this needs to be made vendor specific. That being said, even
>> as vendor specific control, I think it deserves more documentation for your
>> users.
> 
> What kind of documentation would be a better fit for keeping this in the
> generic namespace? Frankly speaking, I think that the current
> documentation is too vendor-specific, it describe the particular
> algorithm, while the control seems to be more generic. However, I also
> feel that defining it as "Maximum Bitrate" might not be specific enough
> (nor would it show a difference from the CBR mode).
> 
> 
Thanks for the suggestion.
I understand that this functionality is vendor-specific and should not 
be exposed via a generic control. Would it be acceptable to convert this 
into a vendor-specific control (for example, 
V4L2_MPEG_VIDEO_BITRATE_MODE_QCOM_MBR) and update the documentation 
accordingly?
Please let me know if this aligns with upstream expectations, or can you 
please suggest if there is any other preferred approach for adding 
vendor-specific controls in this case.

Thanks,
Sachin

