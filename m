Return-Path: <linux-arm-msm+bounces-115191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KdmeN5SSQmrb9wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:43:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7606DCD8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:43:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="hZTmN/tm";
	dkim=pass header.d=redhat.com header.s=google header.b=r+pS0z5r;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115191-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115191-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1E3530EEB3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CDA42EEB6;
	Mon, 29 Jun 2026 15:27:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD2E42EEAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 15:27:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746847; cv=none; b=UIhWujveQLg5rxYWxM+TSGWkYRGfUQw1b3i2IBHgoUQA5IS0m+ojamVCuFzoebM76fro4NLhMKL0SdkpUS1ZWRAOn3ZxajQ+KmxAftCxnlRLTlpRMQCjRWJRvdzmKApcpJPcegUCRvdet7Hd6dWATXXog/Xw0VJXJkH4hTvCeQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746847; c=relaxed/simple;
	bh=olktBAQvKxaecZIsp/fU/dPVOlKjbtQGwgmmgY/1Gkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+7qFyzQvaD0qUUxiAAt6PvusEbomhR88O1o/veQVEIv4WTWNyYh9dj7K3nCoY3H2+mFFhdcTORjKUaFjohy8DRKBKApR1eKiF6GV8Aico1UNw/w+VWGZnXAZcUQPbtYUi83guzrG39wTR25oCUSeMNZrN3zUhkKLmj13jSAoHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hZTmN/tm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=r+pS0z5r; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782746845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrIKgHHkGKl8C2lG9pNbUWYtGyLd9dJ3sMY6MdK0KTI=;
	b=hZTmN/tmRzbR1sJoYz9ntrUQf0kuVkjZGi83JxCaVT1ka6jgnHcNpURp5vWm9+KXRxSgWV
	F5xn5e/mF9g2UMxZNbe4/eGySI6vX88nOZrpiYSJ8ZuO6T+Pms+FbaRreoBiAQYiOt9Ekr
	w3Rc6fQxD/lqnQ6fN4bHM0SNNf0YSUw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-eF3Vkyd6OImVInlikb-6rw-1; Mon, 29 Jun 2026 11:27:23 -0400
X-MC-Unique: eF3Vkyd6OImVInlikb-6rw-1
X-Mimecast-MFC-AGG-ID: eF3Vkyd6OImVInlikb-6rw_1782746843
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e55721a8cso137449985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782746843; x=1783351643; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrIKgHHkGKl8C2lG9pNbUWYtGyLd9dJ3sMY6MdK0KTI=;
        b=r+pS0z5rBms2E6F/XFfUt8T7vrxiJEA95Fqz4loBlLamLiq2Ueou7ORrowJqmyD/HX
         JXWhjVBg1+S3E6P655OyP4MXMuMHJJiTnZOV/4KrgVWLHV4UXf7iRFX4IvzZ3C+w5tx3
         NkyGpftMUZDa5SKU3wGM9y35V6L1bGE/cjYElzKBS2LoAdGgw3mPNkTUH954If/TYkG4
         xLz1h37j9jLqQeg3BGHON3wg5LFHdpm0Mu9xYLDKgtkSUDu1CcUYwkYnGXX1XbKYDRe/
         fy7AetUcDiCd4hC3UhEB747tUdkmYxGn6xeS3HWfSHafumFqCegEnVraro8ZXxxXQBOS
         2sCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746843; x=1783351643;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrIKgHHkGKl8C2lG9pNbUWYtGyLd9dJ3sMY6MdK0KTI=;
        b=gycBxayFG6vlbLX156zLG5L1iPZ6wPQeGCYdzG1sOLJ5/HAAIq0GdsMNyjuRCnIP91
         x3Nk+jlrkCxf1ZWs4QoYfdFhApGToq1J7XKGbpU9vU2RnLNQ+UVmT+J4K7+g3KbmedOg
         QJY3TFUUkRhWYs1Sy38/0qJYPZR8K7xH8pvYkd0Bf12MbAsimOQL+1RA78IXG2SDlF8L
         DPrwHeSz0ds2ifQ0dzbqACiPf8fzz5O8qIu/nswx8erGDQoPcZYFE+9qt3qiA8dJDT49
         HynaBEFfqYQcjWwIJA2QqcQVOoX3uieUBCrv9BvQoKwTuOzdvLR86pbnfVmJ3ZbupKxN
         DAlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PbnAA4B2wgi+jn3l6W+1b68Q0/C6MVKEczPThTLbgJrEx+62R+i1WhyYZ5VoPs3aehqylCFtlelw0K17g@vger.kernel.org
X-Gm-Message-State: AOJu0YxMIDlNQFCXsQgW1Po/KzI4D6/5ZoQI0Ss/sL75yOk13hw6DIu5
	bTczQpt9nVMRppZrbnrCRKkWf3uZVb6+3qS/FZjmHaqnDlngMU7PSA8Neps5k1VdLCwtfJXnxtg
	zSu7+jWEnxP8DNp+hO7Rqs5bS/XwQPDeTt5NV1xUW8Swa6By0L953x5ph7Z98ziR7EOw=
X-Gm-Gg: AfdE7ck6EqHw64gCsU9fuL/M4+zlJCLS4Ee3HIlvDlOCoACAuOl1cBAt4W+ZmRIDhBJ
	yT1IuSCz7UgWA9I9WQgaN3ayYH4+WuLqr3yMIjzjq348L63bncc2N/UUZwFoIxXX/0pSI+hDLDQ
	fShLhva0UHuEGNdMTjdtwyPAkNJ0Jml2Bh6GZjehMFwH19A4tGrCxlsaG9L+6xEteE6qI0YlvSS
	404Mz63wPJIH2XVlD8RVxjmk+ZxAjRA32ORO8mYuGRYx5wSb8ZQdZ2JBb8zedOeIUJ6JkoCTEBR
	MGjU+xbcJUfWY88HUMlKhC39d48Bi/pQRg7GMUFBp//gWLl/A+NALBcY7iPvZya1vcE/xgY9D7f
	VCKvV3pzIiLQ5Nc/0c1DIoPyc96FFgO+WU6UKGVvzD1tngg==
X-Received: by 2002:a05:620a:25d1:b0:920:bc4a:6d9f with SMTP id af79cd13be357-92e6267aa05mr1798885a.25.1782746842660;
        Mon, 29 Jun 2026 08:27:22 -0700 (PDT)
X-Received: by 2002:a05:620a:25d1:b0:920:bc4a:6d9f with SMTP id af79cd13be357-92e6267aa05mr1792785a.25.1782746842154;
        Mon, 29 Jun 2026 08:27:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e623386a3sm4363585a.34.2026.06.29.08.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:27:21 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:27:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
Message-ID: <akKO16q4rTbS2vx7@redhat.com>
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
 <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
 <akJQ7ZFODBjHrqFt@redhat.com>
 <03596c5b-9448-49e3-a035-25c0475df9be@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="pnxlf4Bzm5/y2KKA"
Content-Disposition: inline
In-Reply-To: <03596c5b-9448-49e3-a035-25c0475df9be@linaro.org>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-115191-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	HAS_ATTACHMENT(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C7606DCD8E


--pnxlf4Bzm5/y2KKA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vladimir,

On Mon, Jun 29, 2026 at 04:00:46PM +0300, Vladimir Zapolskiy wrote:
> commenting the series I was also directed by Konrad's review comment on it.
> In addition one problem, which I immediate observe, is that camcc_sc8280xp_desc
> misses the necessary .use_rpm flag, can you please do me a favour and test
> my series plus the add-on change below?
> 
> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
> index 18f5a3eb313e..a15e9754bfb2 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -2995,6 +2995,8 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
>  	.num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
>  	.gdscs = camcc_sc8280xp_gdscs,
>  	.num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
> +	.use_rpm = true,
> +	.cc_gdsc = &titan_top_gdsc,
>  };
>  static const struct of_device_id camcc_sc8280xp_match_table[] = {

I tried with this initially, however it fails with:

[    8.193803] camcc-sc8280xp ad00000.clock-controller: Unbalanced pm_runtime_enable!

I see that pm_runtime_enable() is called from common.c when use_rpm is
enabled. So I removed all of that from camcc-sc8280xp.c with the
attached patch.

It still fails with:

[    8.204595] camcc-sc8280xp ad00000.clock-controller: probe with driver camcc-sc8280xp failed with error -22

I suspect the use_rpm flag requires a more thorough migration.

Brian

--pnxlf4Bzm5/y2KKA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=camcc-sc8280xp.patch

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e1..a7d2a86ddaa36 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -8,7 +8,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
@@ -2995,6 +2994,8 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
 	.num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
 	.gdscs = camcc_sc8280xp_gdscs,
 	.num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
+	.use_rpm = true,
+	.cc_gdsc = &titan_top_gdsc,
 };
 
 static const struct of_device_id camcc_sc8280xp_match_table[] = {
@@ -3008,19 +3009,9 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
 	regmap = qcom_cc_map(pdev, &camcc_sc8280xp_desc);
-	if (IS_ERR(regmap)) {
-		ret = PTR_ERR(regmap);
-		goto err_put_rpm;
-	}
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
 	clk_lucid_pll_configure(&camcc_pll0, regmap, &camcc_pll0_config);
 	clk_lucid_pll_configure(&camcc_pll1, regmap, &camcc_pll1_config);
@@ -3038,14 +3029,10 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable;
 
-	pm_runtime_put(&pdev->dev);
-
 	return 0;
 
 err_disable:
 	regmap_update_bits(regmap, 0xc1e4, BIT(0), 0);
-err_put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
 
 	return ret;
 }

--pnxlf4Bzm5/y2KKA--


