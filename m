Return-Path: <linux-arm-msm+bounces-108762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EL8Mm7CDWr32wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:17:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4616658F6B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 548C230788DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863C63E7BC6;
	Wed, 20 May 2026 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdGVqRzj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgnDfypb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234543E51FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285944; cv=none; b=t6zwdliPDjClpwgWilhDvUZvGguqPWLj5kXVTgWCXlEItoma9XiMH9NoC9grR0Db9trIZ3AAOw6RwlCa8ThtYmeI4vAjKwzjog4cwv+1Mrb8HlTo02ryZKVhEnUaki4lxEu6rOm8lGUjKa6C7O8tFdVjgI8eGsO2tW76hhnNZyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285944; c=relaxed/simple;
	bh=bxhg2HxFmld3fYJF433QWvJMN+XCIp0MPqLoIN6K3y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avcg9X8QSFJSE4S5sexCVd1DDJR9WBTG6mun/bsN+kXW9tSZH/GoPnGcoD0jrtihGQPSioAVW4WBXCRFidcaxLPyBv1DHuZgolyuqk9zk5AyNT4XQZP2tCHNJD3xer5b8d2F+5C484umS3cSfZliOHral8qJCxo2I0a+vIUM1+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdGVqRzj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgnDfypb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nXVh446929
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYuYOeuKLU/F1YE+q0QbOg5zwMu3UJcu2pfEYYYE19A=; b=EdGVqRzjucFwT49w
	wSuOYqa1DcEBhIYGmSAP5UaGSI+FBYEwoK4K2nOR5LuSTZ+PysT3pQw1lppIYVNN
	uDm81WUXn9T/i0nDVwT/Ysf6bkzjZmrgg0fzR1O7IY2NAY4ATQp/iCIHqHJsv43K
	shMwAIM8uWKebr8wnQB4e8bgco59u2Qkfido66ov98H4AN73ZhyJYbI5C1tyCHlc
	zCn7OD8fXKxsWM5TTEhLfbGid6MzBY17YF/9dwJODR7geqqq4wTTGV7o5UKRbvbo
	KFvfkkKGba6+CjQ88Uq25Gh5UgZJJ34Nr8xoendBKPdd4ZrujEiw+uZwhNkNwemW
	+O5Pjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrgx5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:05:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2baf7378ad0so51880385ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779285941; x=1779890741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYuYOeuKLU/F1YE+q0QbOg5zwMu3UJcu2pfEYYYE19A=;
        b=IgnDfypb0lTPGpsRl845AmnD/sIJxmNxtr2TCMBo7rBqjW+5YXwBF4srDdFdIT7KyX
         XcS5vpQAahY+uAMsIeIO235iTFjsRBIDgdA0UMy5fKrOEPU3tY3gLK7hUroY3hTZ+bD4
         g9tkfAhNP7+0uJd0VXuDyaZz2+TyiabpUbiTCwl0jDGczQqgeus/umg+toIVVbrROOG8
         8fg1XzG9CqhDyl1u2HBJKxu6LR+gyCPavwuFZpFDm3DUKqjLryDG0r3R01q8qkuJpFSI
         kUqx/iPS6sM3yyGiLZ3i9Pwx6GjlwPwx3JKhT/e8wIIpGY78u9IemXoFZT84DErvOO24
         KJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285941; x=1779890741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYuYOeuKLU/F1YE+q0QbOg5zwMu3UJcu2pfEYYYE19A=;
        b=TjPXghsqhSfpinlU3rgr+eIVWp/2mhyVdLLI8gcidx/wUK8m5i/J1mIHiOwFnnf/Hf
         NQyuxlrgnRb2u/tZkkEDkXjm01NsBxEcJCpXtghnZOVbt/jyN84CcRhEUwpdd8C3Ys4/
         OV5fEa4i8HcDEu3hGSnK4LVDJMB9zFNdVVwxqmEcr7JqzxJzFykZgLyF5M18Rzjpz2/G
         4mg79uK0UAS2McJZui0dm/xPqSNXunpiaEHL8deAC+UUGd7GXed8jAgwutdByLlQbgE6
         BNmTYCBXO9XV9Pni/544c5FIIPMdBgZsiRMe0MxrFSevutQfA0n6XF23VSCnLZVzetAb
         DIwA==
X-Forwarded-Encrypted: i=1; AFNElJ/bLfL9vvHwlvPLAtm58IoDfe3wtWQuPOqWsRklxN73YGJkRQ9EHeBv67kJ/WDUJmkDkkYY5uibfbzV6SW6@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfh3TlcjN7mEP5i+KzMHa0m8G70gEkzk9/DZfCX1nNdClOstk
	ncqKuAN64FnezViWekKAilhHBeTg+G/95QNI/Ch7o0YsYenMIcuVTJZsptubm+WmqNTjSe+pK6A
	mLIGSeKLDRBhAtAZxBlgaOE7trWa49zSPNHK//X8/td1miPS+coQAcIYUOq/1Ft/UdYqcZWR7S1
	HA
X-Gm-Gg: Acq92OEs/wInfdf+7UkaoAOLZvgibtVrKQpnWuNM8yNNXAjeRThtAYYobY56ELOaYlu
	TPzTQaWHrJOfWYLX8taAFoGBav2CStI0V2wdeSidBfv2Qi322k7gSV9ZQEZlzBTIsdUScGspJss
	vnpoAjdCAue5lqfnTodO6Wz6QlMALeZQviLwEstlzIIas6pJO+pxWrtBMg4qBy0I/yzsLaezKzJ
	1q9JhMTvLIUjICGg4Uoa5phTKCWvsZtcRerX8VWZO3KPumsblxYSGGFOfIgLJiFwcMv/DyZsSbz
	ZYnP+LopEliwaWtjxAUAOz9vOJhgyeumRq65QHZM+0Adoeo1Pxz6STd8G6lv8orPaPD35S5RwMZ
	uMTSxRKIpC62g3UEWKHUKXy3taEPSARMayhXZHZgeTjH6DLz3I/xggiQ=
X-Received: by 2002:a17:903:2284:b0:2bc:9f51:2922 with SMTP id d9443c01a7336-2bd7e9db7cfmr238085785ad.41.1779285940616;
        Wed, 20 May 2026 07:05:40 -0700 (PDT)
X-Received: by 2002:a17:903:2284:b0:2bc:9f51:2922 with SMTP id d9443c01a7336-2bd7e9db7cfmr238085155ad.41.1779285940030;
        Wed, 20 May 2026 07:05:40 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fc2bdsm292402795ad.63.2026.05.20.07.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 07:05:39 -0700 (PDT)
Message-ID: <12650883-177e-4e92-bf34-370249cf6994@oss.qualcomm.com>
Date: Wed, 20 May 2026 19:35:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com>
 <20260512-kodiak-gen2-support-v4-v5-2-a98968423d24@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260512-kodiak-gen2-support-v4-v5-2-a98968423d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dShfaRvJMsiNTuzQrj5M16GRXTjtxCSw
X-Proofpoint-ORIG-GUID: dShfaRvJMsiNTuzQrj5M16GRXTjtxCSw
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0dbfb5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SlpFFaZawDAKOkDku34A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzNiBTYWx0ZWRfX1eaChevk+ghi
 8pU697NQQfDwN/ocDC1Rw3u4k5JObu5xHWkaugVzw6/JUBZBB6P0sa2Z04D5quFq14gxY/RmrBf
 71s1AMLp7WqWBj+6+jQX+vj0OEtnXLRsGMLo5ABdyPDWZMl1J6t25bmi4eaMkDVHWPMiYNyYx3r
 ctaAUgIbJBl6o20meTfDuz4LZTfNvRiR1caLYSMg51vrB+WlcFJW1xPREOQdrq/uWJuriH8sNZK
 huXyXfw2EAFtrgFvVGQbZ5h8HmXp3vxuo/MSXttM5ygSuVzawBsklqk6BvW3yz+F+GDnZrCq3qR
 eG3llD0j6rutD4deIcJIscbDK4sNg1bhtTIQTLCMKTLxIkdhSyOypbN3nLVCgN1m134WgGHyT70
 huMCqIPv/mlSGT6yeynSAlNnVpd9KH53PBZh7L11qpNKa5feWh8coM0+Tbdbjx8gsdmKefF6/If
 9YKOBRf7ZvzhLHobSdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108762-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4616658F6B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/12/2026 8:51 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> Update the firmware loading logic to handle this generically by
> preferring Gen2 when available, while safely falling back to Gen1
> when required.
> 
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 default : If no DT override exists, select the Gen2 firmware
>     descriptor when present and attempt to load the corresponding
>     firmware image.
> 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
>     descriptor is available, retry with the Gen1 firmware image.
> 
> When a platform provides both Gen1 and Gen2 firmware descriptors and the
> firmware is loaded via a DT override, the driver detects the
> firmware generation at runtime before authentication by inspecting
> the firmware data. The firmware is classified as Gen2 if the
> QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> "video-firmware.N.M" format with N >= 2.
> 
> If a Gen1 firmware image is detected in this case, the driver switches
> to the Gen1 firmware descriptor and associated platform data so that
> the correct HFI implementation is used.
> 
> This change makes firmware generation detection platform‑agnostic,
> preserves DT overrides, prefers newer Gen2 firmware when available,
> and maintains compatibility with platforms that only support Gen1.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Co-developed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |   8 +-
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
>   6 files changed, 105 insertions(+), 32 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


