Return-Path: <linux-arm-msm+bounces-69947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF166B2DA79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 709B7727032
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6401D2E2EEE;
	Wed, 20 Aug 2025 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kcoiVQ/J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BF52D7818
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687801; cv=none; b=lZjHY3nZYf6t3SDATVYcYr7+pRUYQyYTuHUGDYx+zV55HN5hK7oEMTO5TFrqdC39vwFIvffV57/VazgRflbprvEBaI5iQeMW4YzY0wXwqfn0OthWqqifNmDOYSAf1A1KzFoAahKO1OaHItBwIQdkQuO4bR84OIZBAIZSBQSz9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687801; c=relaxed/simple;
	bh=u3stZJZozj1Ykm8shsxVmP+agbKEMYkuhg6zzlZscwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ed/qjy4Set8ujKYaen/XyE6D6G5ka8ULI/Lf6ixKyXZIfqidy9vcIFR3ARv8k9BEnU2CrbaNUa11dz6NSlyYtd/57/A7T4IANrWBU5nX4gqwas/2FZkn4WwHZBylVQZvRqShQ1ZJd6Q7M0br3tmpvVZzJJDJOdXStG8cJa5OIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kcoiVQ/J; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a286135c8so4175275e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755687798; x=1756292598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkwhUABhPBNZeZgOhl20sSl/xqev4urG4lq3t9jsKjE=;
        b=kcoiVQ/Jr6XEtOCKhNAre08GZOrIVtYDbNkBfak8MU0Ms2Lhbft7lBrZTjZielEdku
         qGO1IYQYNEC4IujhCN9+XxOOvStMx7D1NfVIjkPKVS/dz4H3MWpZZiPudMZgubGGdwzv
         8yljkqZ4FbTMvONAFg1QRuCDWxI3F+HPL52EvIH+HUr4fEv4gm45efKkwjc6U245xC1L
         T5w2rtRhfUkRu5qktPiLXzu/PRt/FNndjbRYY7zip9Jd3zoGxU7Q9mGo6voyFha1jGW9
         Fitb2siNiGUABwf+gGz0++2JyIAviX36u7LiT08J8eetwegYwJ9/N+btP2GEQKFjdJXB
         62vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755687798; x=1756292598;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkwhUABhPBNZeZgOhl20sSl/xqev4urG4lq3t9jsKjE=;
        b=BfMvB6FRv6yWwExkIw85bZV2aU4awzfIlS4MIZMeWbkEqozGwF0ijsK3EJMA/oeMaI
         ntyXeqdGsvcy6cYPnOpByg9JZ/I3LZru2hZhMJeQQb8qwXsKGMJlnJCrV3Gdqypsl940
         Ucy1cfb2fwqh+T4TLMvUVlrq20uWW9eg9X5BVCOHi1346hZw2R/HDEdQ4x7Mt9KuSHhB
         pdlJaefUA0qnd8jS73KaK4uMzx+DVxNjuCT8cjtFI69tOpRJd3WzjSgkCaXOgHlcnqtl
         M2GzsnDHScFBcDagWie79AFJiJ9T2mVlKRtRDdLKtJM61NzB+gFhfkHZl00kzy5bfyB4
         BB6A==
X-Forwarded-Encrypted: i=1; AJvYcCXV6WNkYL2qD1cOFDSkLx4AzHYqfZn1ZKzFI32MCspf5XShgiJF/D4mXrid5mqkvQqe/+bnGCYdZNcgGqdJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxxgWmEGC7kblIDM+SrAI9Yx3yRFTXMaDlYD5rEEnrTLU3YTSIo
	k5ttzbTsslamWB1WETJF6aEM2PPBvov6B/TqLW4FkUtslRABUd33DIgf3L2C2n5fAZA=
X-Gm-Gg: ASbGncsdV9UXSuXLHCUb2rKsoF+yqqSg3p3f6/b62uG+05cF5uNkbOYFMVvzAybiEOn
	5OxR62LeIoe9cq/9AeEDlzKhK8LLjRfnOejZTXHI0MwKrn745UtTuvfO7q9G7/VSnJrY+wu4OiR
	caf67qkYPIvNQuozUwkiSaK48gEyrbTQUBWPSmAdNwftd1KdAZOpU5PedViqXzlJqb14LBfjFkJ
	OQ6IYTdfwcPcmma4291hqGSeXXEVS2+SKPpPVYmKKJGLb1JGkxX0vBAf3dP27fs14bZIDgRPPKI
	LAKit+GM2FPZoql0x3q17I4oTAw+CeXKXMr+1hhOjNwcjqhSeWVpUO84NPLMzapA8/J/d9AYvAM
	uVXlbPufLax/E7umeUd+kcd3YXMHDaR5s6x98XJQ2kd2QLQrifglQDF2mDvJH0Q8=
X-Google-Smtp-Source: AGHT+IGWRDOeJaAPpLWfekSMtMXpy4Qbpyr5pWYSFND6wauYCuulJRLUbo01wH9DLbqwq7ctNEf/Hw==
X-Received: by 2002:a05:600c:1d24:b0:45b:47e1:ef7b with SMTP id 5b1f17b1804b1-45b4b3b2723mr5193455e9.17.1755687797808;
        Wed, 20 Aug 2025 04:03:17 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c90cc4sm29805385e9.16.2025.08.20.04.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 04:03:17 -0700 (PDT)
Message-ID: <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
Date: Wed, 20 Aug 2025 12:03:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> This is a further continuation with a new approach to the topic
> discussed in [1] regarding the enablement of Secure Peripheral Image
> Loader support on Qualcomm SoCs when Linux runs at EL2.
> 
> A few months ago, we also discussed the challenges at Linaro Connect
> 2025 [2] related to enabling remoteproc when Linux is running at EL2.
> 
> [1]
> https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
> 
> [2]
> https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> 
> Below, is the summary of the discussion.

Which tree does this apply to exactly ?

git-log-graph linux-stable/master
* c17b750b3ad9f - (tag: v6.17-rc2, linux-stable/master, 
linux-stable/HEAD) Linux 6.17-rc2 (3 days ago)
*   8d561baae505b - Merge tag 'x86_urgent_for_v6.17_rc2' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (3 days ago)

b4 shazam 
20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com

b4 shazam 20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com 

Grabbing thread from 
lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 18 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2 1/11] firmware: qcom_scm: Introduce PAS context 
initialization helper
   ✓ [PATCH v2 2/11] soc: qcom: mdtloader: Add context aware 
qcom_mdt_pas_load() helper
   ✓ [PATCH v2 3/11] firmware: qcom_scm: Add a prep version of 
auth_and_reset function
   ✓ [PATCH v2 4/11] firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
   ✓ [PATCH v2 5/11] firmware: qcom_scm: Add shmbridge support to 
pas_init/release function
   ✓ [PATCH v2 6/11] remoteproc: Move resource table data structure to 
its own header
   ✓ [PATCH v2 7/11] firmware: qcom_scm: Add 
qcom_scm_pas_get_rsc_table() to get resource table
   ✓ [PATCH v2 8/11] soc: qcom: mdt_loader: Add helper functions to map 
and unmap resources
   ✓ [PATCH v2 9/11] remoteproc: pas: Extend parse_fw callback to parse 
resource table
   ✓ [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS support 
with IOMMU managed by Linux
   ✓ [PATCH v2 11/11] media: iris: Enable Secure PAS support with IOMMU 
managed by Linux
   ---
   ✓ Signed: DKIM/qualcomm.com (From: mukesh.ojha@oss.qualcomm.com)
---
Total patches: 11
---
Applying: firmware: qcom_scm: Introduce PAS context initialization helper
Applying: soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
Patch failed at 0002 soc: qcom: mdtloader: Add context aware 
qcom_mdt_pas_load() helper
error: patch failed: drivers/remoteproc/qcom_q6v5_pas.c:235
error: drivers/remoteproc/qcom_q6v5_pas.c: patch does not apply
error: patch failed: drivers/soc/qcom/mdt_loader.c:302
error: drivers/soc/qcom/mdt_loader.c: patch does not apply
error: patch failed: include/linux/soc/qcom/mdt_loader.h:10
error: include/linux/soc/qcom/mdt_loader.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"

---
bod

