Return-Path: <linux-arm-msm+bounces-101925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF4FIVxM02nQgwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 08:02:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEEB3A1BA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 08:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF3D8300D45C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 06:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141E43563CD;
	Mon,  6 Apr 2026 06:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsce4Q5t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZvlqS2NR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69F2350A1F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 06:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775455317; cv=none; b=Kh32s7Li/n2g4clYvy7JPec4Ory1KLdnvDQBqkAb6mD/gF9+XZU1ZicWDXUrs3q24nUHvDQ66DZT0dUY1QyPIydd5Bdh7WiPDWdVEDyoMTJoeqzC/ZbS6Y8kynrF3xcVy3ztDjPquye6e3Vt7jbonKkC+XuuL+oza6J+L1G7bwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775455317; c=relaxed/simple;
	bh=0tImFS4ABMDg9bJyqwyS5dBemqFPhTSKTOcbFhI6icA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qys3jE58gF9QYHc9PZPxFEjGNMFS4z1cnlNFn/oAbQvOSc6h3d/ujagDcJ4lV6444k8kZqzPpncrWLfzbmyjunENP3py6PME4kd+OHWEceeCKAb1bc24HmI5oWlJE21IOV45PO4zC/WumEKV3HAt8mIvZOsgVCb9oiT1JfzaSnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsce4Q5t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZvlqS2NR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635LoG6B367411
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 06:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXO6apHJ4oRf8IXdVY4OkSBbhjDR55c7WnY4JLVkPxQ=; b=fsce4Q5tG49yqG7y
	tT2kgE+WMS72dokdL8Vn9mYRlZWJxBrWtODm2ogZUV9auAEO8sZnc7b7szti2H66
	952bgz7roJnRwuX0nPxkpmUdL1Q1Sl/CczZlWuCLFXaxH0VdtlYkk0hNfqaEUVVL
	/m/obU7dnA7dh+f5bq0PY/NjlXHMX8fYvwKYs0hk2RFrrDU0M55VaOfyZRRSpU9L
	HnXHF5CK07s2kzn96JtCml7nPcoGOKAw0wfMhqgUjcPykO6clNF1d+riIIDDk7z0
	uOFhG/dzIRlMc5FDDcqE5nLluv+F4aNsWanM2kGJHYJgzsoVW6OT4AWCt2eEegSG
	V7IsrA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqsky32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 06:01:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82cd9fa609aso2183615b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 23:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775455314; x=1776060114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXO6apHJ4oRf8IXdVY4OkSBbhjDR55c7WnY4JLVkPxQ=;
        b=ZvlqS2NRdj3Q68ICLZhfUp+RhGB0jb9E2/xitXJfYdadPufmBCPgjnRFNAc3rOVuvh
         wZBN+ffIqIoKkfGfsN/Lmy7zAwUbPKN9jQ5FIO1h53cQxa9DD0J6ZZqUdW7Bcoe7uyzJ
         SVcKTCRn9ftlT/KBBERyriOyJffI9pSyb1Z4q3H8hJbjD5i3Q0GdzNLpVGZqCK7zj8PJ
         Vt5rypTB5n4FaIy5BT51hfndzSWn/8dZwhsXitDibkMq2QC2IE0p2Jxk4n5ojVhZ7Yzx
         +jLh2K55dFQQzDIr3RQbuRGjKy6e+Upa9a4JatH7YeZKpWks8yTpZmJ9u1KwNcko0PaC
         tYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775455314; x=1776060114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXO6apHJ4oRf8IXdVY4OkSBbhjDR55c7WnY4JLVkPxQ=;
        b=D+rBRmdnbdHR/IiIskyh/QbS47SgRGBOAn+0pOxLXSwsg0a3wKoFrPRIHTaJ6Oc+Za
         MCB9NIs9ZMYc/XHwUJ8iaSHTfChJDbMjti9AutWBNijalRNWVxsx9tfOSPkZAbAfKiuv
         3H3onDjLNq9SxexGiBVfrpeUa0YOwQOF2PwT6HPt9qUzkR70X9lDMhudYXIYOwaBw40K
         VATmqgZ0i/PZ+OdqY5w0H7xN6Q5kG8NzfWXnd5gclt9TeTJUreEazSB3L+056ogZF2Ak
         8Q+3gadlUjtcGNhIc/gdNp8jmF6suxivHF7wrsdn+BD/nALcLJnNma7GKLwEvCR0nFfq
         hg7A==
X-Forwarded-Encrypted: i=1; AJvYcCWeV3VKwkJ0D3ispnU2+OgKK12EzXG+TL8iXSvMm+HniD9x+CB+ZZicvpuU4dbpYBtMBkZs5NP9gk85KUhM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxorig6QeJdik8C1ASDXJAcSyknX5zf+919gjbU+SyHHjMI4QWX
	h7R+CPXD3rHHiDhbGiDWF8jit36e/CQtFVWoX2cQQBEljdDcUlr+A73vPJmlAqEB9pk8m0S3vYe
	f978m42E5+b6jXfpawWWJ7kyFyxS2HNFENATKIcqTsfXKJxqIQAZxQmkuHpbd2CRTTrYR
X-Gm-Gg: AeBDiet5gHHPFOrnKSm6TViOTxK3QKJ8mfr2H/v0oligU4xC6c4MSsLRqo18OfqnxGZ
	Khsh5r4FJZKYRYwpdpTpTT/N7lKQ/9KiUZuRmow5bYK/juUP2omrXtpEHXU4XGl7u1OrozxaWJh
	4nVVq2qK4Lnrko8zWwAblNo/HUJoc9zWPx988tIL8VCkN6zv1DphqdbPkyYekuUhsX49emoNYWl
	Z68MMAiEcCC6vKKsFhjr1M2WMc6hJ9w6WKA9YRAzC1KOT5d2bvIJa/3z9vkjioOWGVWBe8JBk6B
	pysaMAzOI6sv5JlPO/ifrAntYHHAligGIzlUsHExETkJVZdRTKp9NDPjD5op3FRlUQ/f8zWRpXc
	HXG8yBmKbVtR4tyYNsff5IIDcBnw3WFOXAzBgE+SrHFEmxD53xPfLRA==
X-Received: by 2002:a05:6a00:8008:b0:82c:6c90:c76d with SMTP id d2e1a72fcca58-82d0dbac80amr10511222b3a.46.1775455313688;
        Sun, 05 Apr 2026 23:01:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:8008:b0:82c:6c90:c76d with SMTP id d2e1a72fcca58-82d0dbac80amr10511196b3a.46.1775455313181;
        Sun, 05 Apr 2026 23:01:53 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.228.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c706f7sm12902550b3a.47.2026.04.05.23.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 23:01:52 -0700 (PDT)
Message-ID: <eb7c7137-8595-596d-bf21-b82397e43fb9@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 11:31:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/3] media: qcom: venus: relax encoder frame/blur step
 size on v6
Content-Language: en-US
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
 <20260331-fix_venus_bug_issue-v1-3-e4ae7a1d8db2@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260331-fix_venus_bug_issue-v1-3-e4ae7a1d8db2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d34c52 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=AZq5V9zQ+e7Vr/IEUKe0sw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UhZ1D2OpQGTyPwmj0QMA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: JJDuu2WkWMfbMmD8I2haxeZlcaH2nB3l
X-Proofpoint-GUID: JJDuu2WkWMfbMmD8I2haxeZlcaH2nB3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA1NSBTYWx0ZWRfX1TAMFJ4xnEXb
 EJdFiz63nl5z+QG+yTPl4txf+LL25gXNT4yWl43YtZVuBNLkHaPrHAr5kBpc5bmx2P052QvVNm5
 ThclkLO/riFk0DapMr9dEaidjdPfhx94BmaXFtSw0qcusfzXGfH7mx8d31vbJ/ob3FdT+GJrF8/
 WtEy0N6TjQVYbyL3aB8aB+HyO3JQaxq+dceT8Cc9to60/2Hu9q2KjbHW50Oq/P1jxYBECQ94W0Q
 SNPC1VGo8qnPJ+Yevf1tZm2i9INLI9UdEAAAvcdtFf25pT5+UoQ2rkhVZtYnsEBQ/znhvLOsunx
 gr+iS/kRBFi+DJoWlHpeeBboh3SgtJFJIpM8CJVRbMLecnCZc9g6uH6i9pt28MeZ1Mm1QJLGgVI
 nXqF6mngUY+Ft+a5WcXQVkoSlpwYbbYFy19ZSYfV586tpGDnc0WEDAO1fnmUe3BErrOWeN1EsmB
 oXYwrX1VJwvEsQmLSBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060055
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101925-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,samsung,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DEEB3A1BA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 10:07 AM, Renjiang Han wrote:
> Encoder HFI capabilities on v6 enforce a 16-pixel step for frame and blur
> dimensions, which does not reflect actual hardware requirements and can
> reject valid userspace configurations.
> 
> Relax the step size to 1 while leaving min/max limits unchanged.
> 
> Fixes: 869d77e706290 ("media: venus: hfi_plat_v6: Populate capabilities for v6")
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_platform_v6.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> index d8568c08cc3612a0024d36f65c741151a23459c3..fb8d10ab34043ee676bd7adcf9420d4274ce9d78 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> @@ -173,8 +173,8 @@ static const struct hfi_plat_caps caps[] = {
>  	.codec = HFI_VIDEO_CODEC_HEVC,
>  	.domain = VIDC_SESSION_TYPE_ENC,
>  	.cap_bufs_mode_dynamic = true,
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 16},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 16},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 1},
>  	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
>  	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 160000000, 1},
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
> -	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 4096, 16},
> -	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 4096, 16},
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 4096, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 4096, 1},
>  	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 36864, 1},
>  	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 74000000, 1},
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

