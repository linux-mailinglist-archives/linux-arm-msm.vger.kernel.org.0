Return-Path: <linux-arm-msm+bounces-110232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF1tLYpMGWqSuggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:21:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5495FF193
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9B0B3004DCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 08:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C273352031;
	Fri, 29 May 2026 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azKCRi9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIiDKue6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98F23382C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042877; cv=none; b=Oo9JSUBnJsew6sJ+CeuXG/F0aKEQBJsQBsJdo+bR1yqzc8ahkBfIYJkUQa6YjTb/KfF3Orhy/W5eip3+TINanVw32xw/KXuB+lU3RmdFMqLULCIXPbjKQn99eAYIJzmNQYcZ5cp8K8XUn8PRPL2F8YGP5uw2zszzeU8ACn01rQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042877; c=relaxed/simple;
	bh=4tWHmUV/Et2rVGzL6+V1EcfXfRGK1FHN/TBRFW6MQBw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ujDyd1CshS70R7qoco2TZeT079+a1rcV1kqxti9Atdqzec5Fg1vfVWI/EdGLvbjKJHKbCadZ6s+hbiF3Qsn+3PWo4ATk1OYiDHQDK5qDNPuwcA/qVJBSZ7jk9ZCxjXiuQJ0qSJYdVsNGDiQxCACPMA48KLcD/83CdpRw1ADnX/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azKCRi9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIiDKue6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6Wdnn1386624
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zt4hnhOe3SqfyqniTKscAkfNvEQoOj0aZNG5SeU89HM=; b=azKCRi9QlFO4qBvu
	tzEgH2IUjdxV1l1nGyWfbZgbnNp7MA26Trs3h8iJwy2r53DWGgPoqoyGWuVb2v8d
	MtNs8zD/9lsG/YlbuTbdtpElsL/d/aVDqEW6/a5zvEkbiGLiAcVJPxRoESD4X1M6
	3hspQvvAipQF2YadZnIQ9pqFTLmrgQpg4ydrjfZQdd+aDSYUwT9EIOWM2d8orTxD
	h3i/PWP1ILP08RhwMhTCA3TCOQzTUUJEluSHy4gFfzN97oetpss+5bAVeuv5OkjJ
	Ar/FmBcDWBjTdoC1Ifg8hA/q5IcwVg+j51p7I7d58DkRXPQ+gTk9IcB/D2yZa7dd
	katkCg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumtgyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:21:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c827c880e39so7087476a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780042873; x=1780647673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zt4hnhOe3SqfyqniTKscAkfNvEQoOj0aZNG5SeU89HM=;
        b=IIiDKue6TAKyArmgp1fudCLZWMSxc1GKTxq9d/tXr0n5t3fVuiZt8aMM7MRufQJ/oh
         MNOtzbniAZbNAPi5GwPlaOv6mTKnL/h7kmdiZZlEcs1VJiI1tniyxWE5BFA7/3rd6SjQ
         t5EYhXxYcTOLQXcGF9HlfQf1p8cKHK8ThOnfBpD+10Wi0CEOeLtj04M5PTHd3j2D0b0X
         vK3/MITYde/gXgUNc8tbUWVoFObQ/tMBnsmYyeMfg76GkwImZj96m/bwkAioNeotD7qU
         BTiPdEIbvgxiC3U/euFf153YR/AYCyZI83iKQfY8BV+3ZYfEcBgJDTIzd866XK+Bk4M+
         ADqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780042873; x=1780647673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zt4hnhOe3SqfyqniTKscAkfNvEQoOj0aZNG5SeU89HM=;
        b=fcc2shuvjpyVhFS3Lt4RryfpwW1/pL04BAYwdhRJjT89S2lMgdm1zKhY8IYRPgsTKR
         E4tGGNtk7VQqQfWiE6UIQ8JmQLG3UJAxZAdPWKRuPuH861jNBCWHJSRwkhO0C8gqACqF
         PSX4QfnB/hmTebc4zJSZF6Az5I180KUDKNeX4QdTF9P0JOA6nhsIJQdk5vD4VfMpmeee
         wxI03HOQOKBT4LJzYcFJhJ2TNK7QCUUoLbJxtyNtOyHjh9QZcSkcCZ3ZkCYF5fdmiotp
         LkfBXDAnDbhw6BZZpGkfRdDOz9tgQcI83x1m13578QHjKkugwaWBw40RX0pPiCfM6Xpf
         1IEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pOBacrNhiG8a7rHfhWJzHYYkGp78KA6eaJ9gNPGAxwq8gr7/raZ31rF2G67aLyOixL7lLHmYnV22Gg9ph@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1FO/y5U42iP5w+j4HLRRGEPJQZk1Hx3zoHt+cFZPyI+y5Q053
	GgEO5MbvWej1hI5g8Cgf4MSUFUryCPl9Kee6/iUjUM1ntQWHvjdtDEGwkPqHh/Rpqt8cagWEVcw
	9RQ6Kk+z71dc2z2VDeNC0sJ6Mz7V51r0ZMsBBldklhfnUGEvJfVn31NCwjTyqsvQ/k7dT
X-Gm-Gg: Acq92OESZfb2IT4gi8P2RAyQXWXDQsrsVgwamJWHkhX4Z36uZokMCQmpwJ+hQXDiNj8
	4ucuSrKtUcrDskIzfJAzKijV/ta8t1HVO5mB8zsVGrSwVVDa2dVbq2IhMYE+aZw1hq6Mq7+6Q59
	tRqt3bD07dz1Pi6/z22Wm4h9qLp8ry2dK2fA9A5Rsdj+LX97UAlM6sHtGlOAMcfX3TYdOufNlIQ
	6U4XJsnpmKGoJKLLFExRc2A5UhngGbR60n3Z6w2rb8mXCbp6RwBmTtRTl0oLxe/0oHEfwAObGwT
	Uhd1L73UjGg7m0o0Y6xefXMtiEotATYGh6xUdE4jT/dzl4/pK6OodmEZoH1dg38M9f2exrvAJsl
	L3C8TfgZaQ8Gi1SgNXICprESowoQLWhBF8B36W0DTQXEN+aJAEHml5K9DAdWMK1RGGlZv8Jve/N
	PiBSs93WYDdgulVQTWaUR1ZZe56Nc=
X-Received: by 2002:a17:903:185:b0:2bd:5026:ca11 with SMTP id d9443c01a7336-2bf204f428fmr25204555ad.2.1780042873315;
        Fri, 29 May 2026 01:21:13 -0700 (PDT)
X-Received: by 2002:a17:903:185:b0:2bd:5026:ca11 with SMTP id d9443c01a7336-2bf204f428fmr25204215ad.2.1780042872790;
        Fri, 29 May 2026 01:21:12 -0700 (PDT)
Received: from [10.249.20.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b018b6sm11287155ad.43.2026.05.29.01.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:21:12 -0700 (PDT)
Message-ID: <9148913b-a5cd-4730-beff-6c517ac4818e@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:21:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
 <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
 <feb42925-5704-4266-8c3f-aa944fdbed28@oss.qualcomm.com>
 <12da2953-fe51-4999-9656-2b42a7897f91@oss.qualcomm.com>
 <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QEQ5EiTQz9EhSlFdraT6eaP4lgwDUogE
X-Proofpoint-ORIG-GUID: QEQ5EiTQz9EhSlFdraT6eaP4lgwDUogE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA4MCBTYWx0ZWRfX6DHFej+5+Xbt
 sDeSVZ6MWqtmXc4YNLJerrf1Kgm3IxX6jwAXQywB25pac2XSdmf6GNNuAtKUdErOT+oyJ+XrxxP
 GjbAbq7GP+DRXtGv7kw5VHGKXKP9cEmNqORu6uWrXZk8rWbMT1MPhoDuCn3Drl1xLJuqG/V/J7H
 oAgr8S38KQYfDSI9K74tcJFYfjOB7y+urA2dqxskLCJv6ZUjxlvgRXG2vIvb/Ze8He/heZP15qK
 hUWwj4shoYCV2nIVBPQQvDulRSfV5x8MQq9T1CJNbO4KeYHSh1/PKymbSqqJgdWGAy1ltb0sRQB
 gmOAXpaf36rnScHIfGsP/B+9o3A1JGacPmeEePc9eaV6hnHLTOT6J0IxXjdI9dlxoA9lkZF9xX6
 HAKyC05IkxDmF/Rzm2cwo5tnUUYA38fO1/FCA1Mdlpvv1bEiEbQZShoeiP9jDgIXTiC+fxVZInQ
 J0DmUj46G5pU5TMUnVg==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a194c7a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=-wTkLGI0D05PckrZPBMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-110232-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A5495FF193
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/5/28 21:26, Neil Armstrong wrote:
> Hi Wangao,
> 
> On 5/27/26 06:15, Wangao Wang wrote:
>> I tested the v4 patch using the gst command you provided earlier. The 
>> decoded output still has the previous plane misalignment issue, but 
>> all frames are decoded successfully. When viewing the raw data with an 
>> image player at 1920x1080 resolution, the first frame looks correct 
>> but subsequent frames appear shifted. If viewed at 1920x1088 
>> resolution, there are artifacts at the bottom of each frame. I've 
>> attached the images.
>>
>> Also, have you tested the 720p case? I can't get it to run on my end.
> 
> Thanks for the report but I don't have access to the Purwa platform you 
> use,
> I've run test with multiple resolutions with display using P010
> and QC10, and ran fluster aswell and all passed on SM8550 and SM8650.
> 
> I'll test it on the Hamoa T14S I have which should be the closest to purwa,
> but it uses the same driver setup as SM8550 so I expected it to work the 
> same.
> 
> Could you indicate which iris firmware you're using ?
> 
> Could you try passing the fluster h265 main10 test suite with gstreamer ?
> 
> fluster download -c h.265
> fluster run -d GStreamer-H.265-V4L2 -ts JCT-VC-HEVC_V1 -q -s -j1
> 
> The picture you send looks like there's a mismatch with the kernel
> and firmware setup of planes offsets.
> Could you check if there's a Purwa specific firmware property
> to set for 10bit decoding ?
> 
> Neil
> 
>>

Hi Neil,

I also tested on hamoa, and it has the same issue as purwa. The firmware 
used on purwa is vpu30_p1_s7.mbn.

This is the result of fluster:
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WP_MAIN10_B_Toshiba_3 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN10_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN10_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN10_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN10_2 
       ... Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN_2 
       ... Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN10_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN10_2 
       ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN_2 
       ... Success



-- 
Best Regards,
Wangao


