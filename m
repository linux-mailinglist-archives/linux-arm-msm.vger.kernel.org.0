Return-Path: <linux-arm-msm+bounces-115112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /gQ1CoV6QmrC8AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:00:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8326DBAB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:00:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ZCIg6Dl4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115112-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115112-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45AEC300B0A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C1A221D89;
	Mon, 29 Jun 2026 13:41:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5D721B192
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:41:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740486; cv=none; b=WBJMS73462bFnuTOmhgmFlvz+MCBaTMZX4IsRrussa2OqIS/rNlhiLAGaRjPyP7usizHS1/T+PDWo7Uy/uZTsY3aim0a5Mwbv4wodLAkXoTGDoWA72sOlMzFYyZhh5C/dbRiyCHgzxX6WODq3XRAEC8KHFDrXeAfUBOKLuLrVOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740486; c=relaxed/simple;
	bh=CQJFHVi3mWhoGuN7PwL+jX0oz9CJw/ur/BmVyt7Uy50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oDW9rC0C6u5fexKj4cI/U0hAKCR/g8xY4OrKSHKLfQvO7WHsnlw1N2dEmC3YaqlRwV16lBX1J9Jq4qDWNzDpW+NIL+cvgmRUczXcD29dM8J5U2aT2LIi540PsImvaHW1HV0AlYVCP7rM8GFz1iCLFVmxH4t5qC3oFvpZ2z5dhgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCIg6Dl4; arc=none smtp.client-ip=209.85.208.179
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b15ef3633so434341fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782740483; x=1783345283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W1SHPHn50RFg01mCguwYGn/fl6UooE/4FbPssLiu2OM=;
        b=ZCIg6Dl4o2C93w2kDS32LfgLSNvwQe31Vt801v2ivfnbg2PTe42u0N5tyW94g4cdnJ
         RgtHhfzh6dH/07gco+VsQ6sZGSed4J2/BFrh9CnpNIqRX4BHstSaTgx2JVGxVO/luJUw
         1dbkvCfLuL0S8DVDHWtQHWJZLMnIMsDMjnxsyxwLKvUeLdVJu8dxFPJiu/whSYM7DWqW
         LZ88TSulr5yXKlTCoIz1h3MvzYVlU3ylTEpqFMK7610346ddr9GOPq5t7SIs1c9IWSAc
         PVjpzIljWGP0jc8NBa7X1+1oX33NADPPMDaJFUe1X5MvCnsAvNLEkSj9yKpz1E2RWgjA
         8OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740483; x=1783345283;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1SHPHn50RFg01mCguwYGn/fl6UooE/4FbPssLiu2OM=;
        b=OrzGM1bH6V6X3oVeNdU8g6crpHX0nqfG353dgT0mFQ35YCRM1i0yYGhhBZxWSc86tW
         whrRTZ0aPgUybBctETbmZC91DLT7B4i7fy5mx63pdG9RJq+xcZhpg7RPn7YiR2WUfoeN
         uNcQFPshxX5KRpy6YwX8U7bKtyUWOLFBuf3PKHcIxmEvuqbHDp99tHOgPInjX9PN6IND
         LG4IXP5FgIeBSs9MsHTAskaVQSwe40IZpkP04vBREHLg+5A/3bo4+frOsKxItucBI6yT
         SEcK4PvDuUDSNi0jPifPYRbcq8I2JB//YWe52OFkh3DWo+0pVC3byFmIefNmYA0NunNF
         WcMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiBQzq7QFYFxREO2BLTFVdCBvn00WhYAta9u0fjDAvYA/jslIuKBgmhN3LzfRsC7ZGUrxJQad9QjH2+J5B@vger.kernel.org
X-Gm-Message-State: AOJu0YyuVvWXyCMSmZyp3NlEgiEhLp1Sfvtn4eUx3n8ppHjLR2aRTHJV
	uSYuU3I6n1eQ4M0oObZlC2YK62eIK0KxiMtFsq7XZ3wzDdBfUPBHqaOb0feJS2IfBPk=
X-Gm-Gg: AfdE7ckciCQ4pJmRTQScbox5C93sviN57KDS7H3b5wUfKaNrPLa/09y24hfwLIgqK1f
	8DupZFhbR3u++WzSVmEeHuiOHlB86ag97oIYB7n64KV7sLRJUBryG4u9uLwrKoGKC7cZvmew7FI
	frKw1IqGispOrjt9Pho2uUQTXdpIQaD9dW+ozlEPcnpMetLkNNln58YCBuo5EKla5qPvjZlJmpq
	mOXmmY9VlxIbDlkAZVnlirz6URAlP7CR6ZsoRx28pBuFANe2Gb6HQ4trsiWIVFNBeVtDfKroO1F
	29m0dSS5slAQUr2zsMRBoD/LYLtW3vEDBEP0SftA6yYYpI773/vEg4CHO+TjPGMT5KroY7sZmIL
	gXK4pkgYDQcGd2XvfsCKNK0ZRpfHK8lcEWbqaEdQ64ZUO5x6ALnbtVRvGo7VqdnYgzHhiBtmxXN
	BVjShg3gATU5PNeC7xHjPUYsy+wtwuScX4xvLzVEyjSo9hcmhb6CdFDs++nssD7eh23c4=
X-Received: by 2002:a2e:ab06:0:b0:396:8c78:3d53 with SMTP id 38308e7fff4ca-39acb9ac8a6mr17363281fa.8.1782740483113;
        Mon, 29 Jun 2026 06:41:23 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b176967a1sm3100311fa.13.2026.06.29.06.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:41:22 -0700 (PDT)
Message-ID: <a06e5330-ac88-42aa-8b9f-148e9c5a6734@linaro.org>
Date: Mon, 29 Jun 2026 16:41:21 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] media: qcom: camss: populate child platform
 devices
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-2-atanas.filipov@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260629121750.3469292-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115112-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,linuxtv.org:url,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A8326DBAB1

On 6/29/26 15:17, Atanas Filipov wrote:
> Call of_platform_populate() at the end of camss_probe() so that child
> nodes of the CAMSS DT node are registered as platform devices and
> probed via their own platform_driver. This allows hardware blocks that
> are physically part of the Camera SubSystem - such as the JPEG encoder
> - to be described as sub-nodes of the CAMSS DT node and probe
> automatically without any changes to their own drivers.
> 
> Call of_platform_depopulate() at the start of camss_remove() to tear
> down child devices before the parent unwinds its own resources.
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Link: https://patchwork.linuxtv.org/project/linux-media/patch/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org/
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Instead please include this unmodified change to the series:

https://lore.kernel.org/linux-media/20260508-camss-isp-ope-v3-11-bb1055274603@oss.qualcomm.com/

> ---
>   drivers/media/platform/qcom/camss/camss.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d..d2ecc79d5269 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>   #include <linux/of.h>
>   #include <linux/of_device.h>
>   #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm_domain.h>
>   #include <linux/slab.h>
> @@ -5460,6 +5461,8 @@ static int camss_probe(struct platform_device *pdev)
>   		goto err_media_device_unregister;
>   	}
>   
> +	of_platform_populate(dev->of_node, NULL, NULL, dev);
> +
>   	return 0;
>   
>   err_media_device_unregister:
> @@ -5497,6 +5500,7 @@ static void camss_remove(struct platform_device *pdev)
>   {
>   	struct camss *camss = platform_get_drvdata(pdev);
>   
> +	of_platform_depopulate(&pdev->dev);
>   	v4l2_async_nf_unregister(&camss->notifier);
>   	v4l2_async_nf_cleanup(&camss->notifier);
>   	camss_unregister_entities(camss);

-- 
Best wishes,
Vladimir

