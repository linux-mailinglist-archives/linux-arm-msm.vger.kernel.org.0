Return-Path: <linux-arm-msm+bounces-107763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNyaDtHsBmq4owIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:52:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7620654CC70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFDC13104A1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BB443D4FF;
	Fri, 15 May 2026 09:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmwZbB73";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHuEgUjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E8143C059
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837940; cv=none; b=EYG38x01KjWmto0RR0YbkO7nE7sBNZZr4FUzLx09TKpPUxmtFbN4R4iodmWnmdJ5Q4SPJIJZdjd4erJOuQexxuTLA+864J7VJY07Rurg0d2TQUKVzeBSMPym1W0Dn/T652V2g6KvttWA/OQ0AUMKPEs1kyOS9+HU7jgLvDUwH1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837940; c=relaxed/simple;
	bh=bK9Ms32Mc0mtw7i1mc34AziXrcj7CPbt0s2yL+G9aFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGILgSzAL9jQLI6NvnDkwRgV/qF4CF9cYDwFQDcBqUOwmTwplt84BMPJrrZ41USCSBtgDOShJztLInkUSxl8sGtUuB6da+iJJOVqOL+omF0JTl9118BCXoOZQHJLlt3dG2HB9CpWShb2aLnDBMrRrYgQjG/tV7ODLpt8XCo6jlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmwZbB73; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHuEgUjh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F593oZ4020762
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sQaSscl93BusCZxZn/AxsEzMNW/NuD9i4imhTBA1QQ=; b=MmwZbB73QziZMTc4
	8/ZdS6DIGmgu6bVW+39Q5MJiz77ruxuZ9+XStzVsdeeEdlXt402LmlNa9L3ITwXA
	lAZb0Z47ebVQlF5g4DelvVdAsw+ahuebHX/SYVei9K7NPIRH0ijbVIE8zQvilhRy
	Qzhm6HOwEDugk8ohrTebFMY0rQcE0GZ163jFg6LGvTJljH325dl0sNFcCdkSqGiS
	SkqzQHny+XnPO4xNqWAwazk7C0/DWZJQIdMdOnbjgjwv+evVXk1X9FxwFyxJOgLH
	4amwPx7fl88+eG/vIV5KUZ3gU06PiWq/Erz7t1zFVMpUAbLwH1VsRIX9GaRr+ZPu
	hwgKFA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rtnvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:38:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82bd90afbbso1029012a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778837938; x=1779442738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sQaSscl93BusCZxZn/AxsEzMNW/NuD9i4imhTBA1QQ=;
        b=XHuEgUjhGnGWai9lnbeP2I1qqjvb8aa79CO/yCtyNBmo2e8P3Gw/5Bi1lnRIfuiRh+
         ly5lIModOdTo+fKES+3CrpM+DpI+NPt1lPVudXVcb39tbb0auyTZo3IceK47Fvh2TrrJ
         JS2f0ExolN6hBoutIQ27arlBr4Dfz0woHiMHkbB6doh+j1WIyNHppdMXkWNRQkhR+2GT
         BmMhV/1SS9bVFoANfYm1XPFAEtpBLcEGD1DAi+FQLLMhaMbiNO+fzhwBxqiGNpI8s5YX
         kH8y9V3QoIv1WddGEd1ErxKrUT7PXgjFrEwR5zV5bGDA1TgLc9XiEbwajpqLmHVADxWM
         CTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837938; x=1779442738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sQaSscl93BusCZxZn/AxsEzMNW/NuD9i4imhTBA1QQ=;
        b=Cq0sg2fMj9FMA0z4Ekq0UhigLSZNSlCyQntBdA/Dz2LFoGWoZBWehpFmhsbV89M3IF
         AxC4FA/wOZ6iDw91xqml9YUc8hM5m2jBy/45fzU0/07SlYlrLxgC/unxaAtIsiY5Y/Bx
         7wxZsBi8ofHJEY8j+xXQWUvYmHaX3+IvHb7evDrtvE4s87EC1WWV9HATxi3vUorn6OAI
         qoFGz/X9qT73eFS6FH5XDQR0iZkyb+w68LGFHzhKGZvN337V6JsxPo4j62hel62lE4V7
         sMkHmMN6LEwF1gZGyUr/xSDITz9nR9vX+9ntq0nY7dMdfRjBeCKn9un4xiEL/MRJy1sG
         gfCg==
X-Forwarded-Encrypted: i=1; AFNElJ8rkHhasfHkSL3DrXRfLatKUaul1S/SBOYMDd6vc6mvPLWvZd0HN8BLUKQlmhYSCWf1RmhAIEnIxtpaeyYC@vger.kernel.org
X-Gm-Message-State: AOJu0YyEXyOdkzVXH9563KFSj+VlddwdTaqo2X20BgqyNA07F1gXr1xW
	xHWXFzT9ggLJSFBU+KCHFWZZwM4o2uxXJAIsWWmMkgjq23G6fIcPn3FekyIOUED6L3k3bRrr9MY
	QDfT6IjMyhJdiQpsmsaJNZjlG4ggKU+cFoWXsfDPcqafzSZSdWWh84eqUn8HyRvawm0bJ
X-Gm-Gg: Acq92OERswggAaYyD5hVxso8yxrpu2LChDUQ5GzWQH5ZIy32i68Vvh6XFjY5OAOzm67
	0NnXVqOCQR//S3PPfdIR55/p4y4/Ae00F3WpeqtCsz41Kcy3IerBWSjIHeviaSyJwsx5pcKCbyI
	UySL7GxFAO6J36nJGQk8Lw1DFqn9AISMmzJcuRFss88TmgbHFOSwAWpydHfulyH95KwxTi3CEiE
	UOwzTCOj6eIWSNcJecLJTZMeNfekZkcBijYgmcd/BCrW89ToFfN604R+COYE1TopKbZ3Fe84254
	cbLMkv8+KSch988foYwn0hMVD6sPJP0J5v/SWNwcOiZX+XS58FcNBWoxJsSAqAm9772Ku5nS/ci
	aAVKhsTJO95iwOm3GWQRaXd5ayaHIrKEKVoxS19URtFc/7ByLX0f7UwYl
X-Received: by 2002:a05:6a21:e097:b0:39b:ba95:b128 with SMTP id adf61e73a8af0-3b22ecf5a75mr3781366637.50.1778837937638;
        Fri, 15 May 2026 02:38:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:e097:b0:39b:ba95:b128 with SMTP id adf61e73a8af0-3b22ecf5a75mr3781327637.50.1778837937130;
        Fri, 15 May 2026 02:38:57 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff0edsm5271154a12.20.2026.05.15.02.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:38:56 -0700 (PDT)
Message-ID: <601721a8-8ff7-4eb8-88ce-b4ba937095fc@oss.qualcomm.com>
Date: Fri, 15 May 2026 15:08:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Bryan O'Donoghue <bod@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <5Yg7em0Xca9girDZT52cxZaTg93xJtZD7C2ExswhAkholGSsMsWXMWxtbtsWmkGeJWjp56SmJlLhj55vO4e0nw==@protonmail.internalid>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <11e79f8b-9401-4e56-87b2-8d8148e05232@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <11e79f8b-9401-4e56-87b2-8d8148e05232@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1chAOCEIeFTl5xdC8U1cFJAZ_QrNTh0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NSBTYWx0ZWRfX9lrnEss/gN2W
 k+GubG9v+vdnweQiBBvpPYXjwYOc1GcU03ftTSZK3Djg/Mnw+kTbA6aJpHPziPltKIkOwpsjU1Z
 ic2uDaEPRyB7S7f6glaHWDNMQeKp5dQu6rG43TsxYv9wKEvD3rJpLHAQGE0H+CEVssWmwNVMjLZ
 ldy783XjP0sWnEhYrWOjCFA0dpv2YZ/1AVrGHdL/RuSvVSVgLHX/WLikKHPr/Yn6bjiVGIldwS3
 ET6Xpwpoh3YpWNHTBjI+7XyRk1dIkDGVBIt7zz7m3RTGbB/pZjbjv7rqtlPRTXEH12K4zDok36q
 b1+DYdRnSoP/Tsj4P++wo3iNM/EqP35kc8/4AM3F7nuCATpeXwkMiZfymBZaUQ05A3Tg3kp9gNp
 jt/0RW6nPzRKzQqkxN1q952dBqGBW91zf0EHLL9P9qswmyiUDNjZ7oAWdotRQfKHt6ZbyRSk4kv
 tZUB1oC1U9KhUM0P6CQ==
X-Proofpoint-ORIG-GUID: 1chAOCEIeFTl5xdC8U1cFJAZ_QrNTh0X
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06e9b2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4FU6K_C028STTvapGXAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150095
X-Rspamd-Queue-Id: 7620654CC70
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107763-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/15/2026 3:05 PM, Bryan O'Donoghue wrote:
> 
> Can you rebase off of:
> 
> https://gitlab.freedesktop.org/linux-media/media-committers/-/tree/next
> 
> and ideally make sure everything applies against
> 
> https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/ 
> next+fixes
> 

there are issues reported and review comments open in this series. You 
need to wait for them to be addressed.

> bod-media-committers-next-plaform-qcom(next-smoketest*)$ b4 shazam 
> 20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org
> Grabbing thread from lore.kernel.org/all/20260511-topic-sm8x50- 
> iris-10bit-decoding-v3-0-7fc049b93042@linaro.org/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 25 messages in the thread
> Analyzing 12 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v3 1/6] media: qcom: iris: add helpers for 8bit and 10bit 
> formats
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 2/6] media: qcom: iris: add QC10C & P010 buffer size 
> calculations
>    ✓ [PATCH v3 3/6] media: qcom: iris: gen2: add support for 10bit decoding
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 4/6] media: qcom: iris: vdec: update size and stride 
> calculations for 10bit formats
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to 
> handle 8bit and 10bit formats
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into 
> 10bit format
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ---
>    ✓ Signed: openpgp/neil.armstrong@linaro.org
>    ---
>    NOTE: install dkimpy for DKIM signature verification
> ---
> Total patches: 6
> ---
>   Base: base-commit 76671814f2843482d97feca12e95c06f0b05bc8a not known, 
> ignoring
> Applying: media: qcom: iris: add helpers for 8bit and 10bit formats
> Applying: media: qcom: iris: add QC10C & P010 buffer size calculations
> Applying: media: qcom: iris: gen2: add support for 10bit decoding
> Applying: media: qcom: iris: vdec: update size and stride calculations 
> for 10bit formats
> Applying: media: qcom: iris: vdec: update find_format to handle 8bit and 
> 10bit formats
> Applying: media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
> Patch failed at 0006 media: qcom: iris: vdec: allow GEN2 decoding into 
> 10bit format
> error: drivers/media/platform/qcom/iris/iris_platform_gen2.c: does not 
> exist in index
> 
> that file got zapped in:
> 
> commit 53a5e095636acbab817a7fb98a67ce76cac59fdf
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Date:   Sun Mar 29 02:33:10 2026 +0200
> 
>      media: qcom: iris: split platform data from firmware data
> 
>      Finalize the logical separation of the software and hardware interface
>      descriptions by moving hardware properties to the files specific to 
> the
>      particular VPU version.
> 
>      Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>      Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>      Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/ 
> platform/qcom/iris/Makefile
> index 2fde45f817276..48e415cbc4390 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -4,14 +4,16 @@ qcom-iris-objs += iris_buffer.o \
>                iris_ctrls.o \
>                iris_firmware.o \
>                iris_hfi_common.o \
> +             iris_hfi_gen1.o \
>                iris_hfi_gen1_command.o \
>                iris_hfi_gen1_response.o \
> +             iris_hfi_gen2.o \
>                iris_hfi_gen2_command.o \
>                iris_hfi_gen2_packet.o \
>                iris_hfi_gen2_response.o \
>                iris_hfi_queue.o \
> -             iris_platform_gen1.o \
> -             iris_platform_gen2.o \
> +             iris_platform_vpu2.o \
> +             iris_platform_vpu3x.o \
>                iris_power.o \
>                iris_probe.o \
>                iris_resources.o \
> 
> ---
> bod


