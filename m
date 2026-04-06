Return-Path: <linux-arm-msm+bounces-101924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOaLEERM02nQgwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 08:01:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A80533A1B86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 08:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8148300F7BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 06:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF35353EDF;
	Mon,  6 Apr 2026 06:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4x/P0HF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXGJrD/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2C3346774
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 06:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775455289; cv=none; b=o7NOTfaTMW4NKzli+UzS1w+ZnWn0kbgaPT65XMErULSbxdtcqxulfRY3ymS8HFoebncEmiL8b+IKT9y+u4TE40ucNncte4jdBP9VrEiWtPFjBacKi5UulUMag21fe5j4dEXD262LjJ6MPr9w1FW+oaiUfWxhaIrnOAqUcS9EpcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775455289; c=relaxed/simple;
	bh=JI5iBFaeeDL9bvBFn5OW16PUp/PhoYNUPLyuwYAhPbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZ3HXDgigFFulDLby43A+Vk6y9i4RlDqXjhu87HWKga3Fd4S01WEfk/q+Ctu1q9LzmgAxFYg+5r5zt7zLsoGNlL3ldDlZU3pdKK7iudnDH/WjuxDfga/chEIgym2JakOjrBrDf2OneF9xduLt0x3Xj9n1DjdQIAlfyVGAhoQB+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4x/P0HF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXGJrD/t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635ATv903204592
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 06:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fwm+xGGl/6Zvyv3SDhLC4j3+IdrlWcFoiDrUY8cbwok=; b=U4x/P0HFUAUCmRM3
	q8x0SX37jp4A47cWu4i+d33qO0pVFOhl2ngybzYjdNhCWHWKjwRhn4Mm5IMy4c8s
	TTY2cWqPwWDs+5ZYrUfU9bRtCdfv8y/nSy8sBIrmBqky0Vi/bRrIiZtL+GbV+mr7
	3PYsH5Lb0W9iKNfpBn9vXx5K/VGNh0LFFN5Eo/Yh6lcu1gKomztUkEXuyqgGcslx
	Q3FUGfV7HRad8MVEb9VE2v63GoUxBSQrdFEHp3iWF0nHwuONRNLIRZd+2w3FPszT
	cpGGU+r3AGHdgwQr0XcpJS4e88JJ7yYUl6AnGWzwnp0gRh+T1V6ZVLlI7be3dVVV
	7VXWFQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqsky1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 06:01:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da37203d2so8368294a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 23:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775455286; x=1776060086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fwm+xGGl/6Zvyv3SDhLC4j3+IdrlWcFoiDrUY8cbwok=;
        b=BXGJrD/tV23f4mVztm7ivkip28LkiV+88Udhb4MbDtVpPzzW3P1g2iKusrnObvivyk
         QDV9xm2MG7stTrkQYN1wrE8PAv71Ku7I1NQM+uViZlNERB26HuK9q/7xJgiPtfujebP8
         SIrpl4XMakTvFO+CIfSDwrgAZNiiVPrdtshogMxj/9QZ+AoPf5noWrSQnAAzQQwcZem9
         0huXD036E076AA4hQ7O0WR7VdCyyFudgVOtnVp0UQvy+gk19OqlcRBCMW1hDZswcKI8/
         fQLfkQZyGROrj6sud7tHC40ZJHHdh4yjkGFRvvyJJ2KiXeOeta2nHeroKHENVWecA4ef
         St/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775455286; x=1776060086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwm+xGGl/6Zvyv3SDhLC4j3+IdrlWcFoiDrUY8cbwok=;
        b=BZGv84S7QwbW92l1pnGS/qldPFKNdLAZTF92ae0Pb/jhwS47rpt3GzhwNdf5t1MIeE
         VeLcq/4++HT7rvYQU8Ts7I+iG3TyiSaW52y6iP2DzyKf8ePPEzkFOjbHbmGrJQP6VACy
         kNH51AcfPkxkfNL4r42qA0Q2+liMBbmMMwg8bXPorw5v7JoOdw4n1C4nv9PTNLIIcwkI
         /RQ+Gu3FrqNtHWm8IpzkkbR5aoQyTHYSBZ/+mfKTaptvKF4jwOskXiKBe5bJ0AOtpknS
         TdI+T8HMsQi3DhXOTtjfi7NgQgf618WTA7bLRtmgSu2lHfqsPtT/j92oG0O2KBNOQh/w
         tuMw==
X-Forwarded-Encrypted: i=1; AJvYcCW26cjGZP5vkTGgq0tLQXUk1bAKhByHwxk8dctn1LRYeGx7FDSfgs1Xbk+k3+PNHBwyvPy5plO/IJ8vIq3s@vger.kernel.org
X-Gm-Message-State: AOJu0YxZh3TQr/t3wGkwrPXsdKeJF+GsPhwR9jfEmseQj8jB9RAhSixq
	xUIVTxKOiq5p9NwVAsXvuMX+yFttPtpr2HvW4APDsYDgjV5wxGIzeWAq6NMaAqJKbD+NyhDYOYN
	6cA0DUgnTTO7CIYdJXppFda0sp+vfnQ1Rmr3F6t3EGQtyBKYK/GLVz7gv9XTJxRq078jv
X-Gm-Gg: AeBDiev/Rv9cJfrwTna15ApmE5GDhvVB7Zo8xt9hZLxR5LqjZX6fdKqbTZWMfx8jB4y
	NkvKau6RcSt3mb4L6C7KP+smvsvQp0VjWI0RyMxuwnGYnk5Nbk6VG3i36u4au5sTgem1+NtUdqY
	BII3xLFEGXLI23PwK24JtFouoPO+QL5cZ14h4cVI3pcigKr9uln9LpiGXPoIU4z5pu/B4Qbe6mq
	hQM0K8WBLZD1STuoDTAEZUEeeYNvkxfc5aPM4bN4jxx0oB9GP3q7iyPE1YjoTHgrhzpvJvSSdCA
	A/lSh9s4pGvaHt8zm3i0P3vW+NexqQLNBGtnRkPr5Uoc0fEBm40SbUjz+azEcFIrUSwA8YPXIEz
	eBjmiql5V/urkmxqtQF7431hLK6PtufA5hytvSq2F1FbpPVgu6XhT3Q==
X-Received: by 2002:a17:90b:4c11:b0:35c:936:d4cc with SMTP id 98e67ed59e1d1-35de691ac07mr10924895a91.14.1775455286503;
        Sun, 05 Apr 2026 23:01:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4c11:b0:35c:936:d4cc with SMTP id 98e67ed59e1d1-35de691ac07mr10924859a91.14.1775455285979;
        Sun, 05 Apr 2026 23:01:25 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.228.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm22179416a91.5.2026.04.05.23.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 23:01:25 -0700 (PDT)
Message-ID: <9afa1b06-2b10-2b99-0918-a6add4632f96@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 11:31:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] media: qcom: venus: relax encoder frame/blur
 dimension steps on v4
Content-Language: en-US
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
 <20260331-fix_venus_bug_issue-v1-2-e4ae7a1d8db2@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260331-fix_venus_bug_issue-v1-2-e4ae7a1d8db2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d34c37 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=AZq5V9zQ+e7Vr/IEUKe0sw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LJ3xZjtEJ-EMi3p6IU4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: VSE-tinsTjLwTTnJPEpHrRCVyBIXaD1A
X-Proofpoint-GUID: VSE-tinsTjLwTTnJPEpHrRCVyBIXaD1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA1NSBTYWx0ZWRfXwO4ZVCuLGE+v
 idPHULnFh6CyUcaVCQsLUkxs+eLd0HQNqDjIoLolfAOo5VoyLOiIS6xMrLaG4iEwxOR6hAUh4qS
 olbr58XX9+tIEwNxYRB7R6RKunwBg0MCaq6QEC/RLD66g949dwrH1ky/iXMT6QWE2mXH6cX1ltx
 vWcQksbrljFFa+Wr7V80zOfE+0vZFOSP4uG6ZImiJenGfDyF0sFUame2iyy+hQCcVBeg4Z4E00X
 OgrZklZTkev8WkeZ8UHu1ynwGpRZgrpUiOLSSXa9YHhsFap64t5MI+86OtQLS02ZjpBri7zFlhH
 2hU1vtrXDjKtwBVybwOFNnYQYaFIEohGviB3kt9Hm1kp7mYJ9btxpQ3dR+GqU0Xjl0e52ywxUqL
 ks1mcrhrN2UTNVYf3Ai3yjvkmV44BWqbMbCfgzPjNdheNvc8q0kmA76yzopftvkTCp/H56krQA5
 WpZidd+pvuih1jNTWTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060055
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101924-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,samsung,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A80533A1B86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 10:07 AM, Renjiang Han wrote:
> Encoder HFI capabilities on v4 advertise a 16-pixel step for frame and
> blur dimensions. This is overly restrictive and can cause userspace caps
> negotiation to fail even for valid resolutions.
> 
> Relax the advertised step size to 1 and keep alignment enforcement in
> buffer layout and size calculations.
> 
> Fixes: 8b88cabef404e ("media: venus: hfi_plat_v4: Populate codecs and capabilities for v4")
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_platform_v4.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> index cda888b56b5d4806f10d062371b9a4969e27d9b4..e0b3652bb44093111ce610fb09366c38db516966 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> @@ -136,8 +136,8 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_H264,
>  	.domain = VIDC_SESSION_TYPE_ENC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
>  	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
>  	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
>  	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
> @@ -173,8 +173,8 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_HEVC,
>  	.domain = VIDC_SESSION_TYPE_ENC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
>  	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
>  	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
>  	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
> @@ -195,8 +195,8 @@ static const struct hfi_plat_caps caps[] = {
>  	.caps[19] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
>  	.caps[20] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
>  	.caps[21] = {HFI_CAPABILITY_ROTATION, 1, 4, 90},
> -	.caps[22] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 16},
> -	.caps[23] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 16},
> +	.caps[22] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 1},
> +	.caps[23] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 1},
>  	.num_caps = 24,
>  	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
>  	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
> @@ -210,8 +210,8 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_VP8,
>  	.domain = VIDC_SESSION_TYPE_ENC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
>  	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
>  	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
>  	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
> @@ -229,8 +229,8 @@ static const struct hfi_plat_caps caps[] = {
>  	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 127, 1},
>  	.caps[17] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 2, 1},
>  	.caps[18] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
> -	.caps[19] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 16},
> -	.caps[20] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 16},
> +	.caps[19] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 1},
> +	.caps[20] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 1},
>  	.caps[21] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
>  	.caps[22] = {HFI_CAPABILITY_ROTATION, 1, 4, 90},
>  	.num_caps = 23,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

