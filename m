Return-Path: <linux-arm-msm+bounces-115728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MQ8qB+gjRWrR7goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:27:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B7A6EEBAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:27:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="NXf3h7t/";
	dkim=pass header.d=redhat.com header.s=google header.b=Vgz3vSYN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115728-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115728-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FFAE30F863C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 14:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5692C15BB;
	Wed,  1 Jul 2026 14:09:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F33E2EBBB7
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 14:09:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914955; cv=none; b=RBjCg8jreLE3nOaL42D5XevL1jU4G7OAMJIUM+Efhecs+0zJ42zlH/uGzY+cd5W8V0mRaHL/DbvaVNsP8WjGdFapG/uOpZzf2ATIyGzN7lhFAlZmkiKd3zs7vWVFRz+cJIAVMhe5ZZwKRNRMR4RCMaEmxO0DBtHIfT8pG6mpq4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914955; c=relaxed/simple;
	bh=Rr9nTxauw3Ld+d8F57iqszED//Wn2JjDdovTpTeRCzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZr181OzWWkcPIBJ86xEknWeFjGyexWxh7idjryTpopgiufLFmG6J4B++TC/B2RFE7wzQUQxeXXeDgDThR3rJa20EKFxstc+fFjgIeDF2pueI0zVxmRubP5Dk7TtB3ikDHj+3p1pszPbkR/wixYvV/Dxz3PBAtV6cwes1898Y5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXf3h7t/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vgz3vSYN; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782914953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fg1jQ5xlQw7jkowSdvyp9ysqaIiouFFtIXbXuCa9asQ=;
	b=NXf3h7t/H2NYSES3LNQIpP+JmTrBrOmxtfV3n3JztEvatR8tUASRAtFCh8uz/6pjfKhYhs
	X5IekaIVTKza0xhNCN/XxWg8SxGtY9MHhheHAC1d5vGEcPI7b0BACnAeAqWg03Yu31CL/9
	7Gom86SoN7kFtTEWYKLQirLkDnL6tys=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-xKCFhSmLOx6KE_Ht_malXQ-1; Wed, 01 Jul 2026 10:09:12 -0400
X-MC-Unique: xKCFhSmLOx6KE_Ht_malXQ-1
X-Mimecast-MFC-AGG-ID: xKCFhSmLOx6KE_Ht_malXQ_1782914952
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee40bceb55so11062776d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782914952; x=1783519752; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fg1jQ5xlQw7jkowSdvyp9ysqaIiouFFtIXbXuCa9asQ=;
        b=Vgz3vSYNbWxy6s3rUxXJOa1nsMmWKANEhpsTCmFBBZzoG69L1znoUpVqfVD+KDCokn
         b5yFO3glpb1Kk4AMX5VTHUQ8IgFHH9aG7+6wUr7htyywIpuLlBgfv96lY2vdAcB3QJvq
         8pgW/ILDIHtP97SQ/Y/YcuEwfBJNrPVvgs8Sd/66o1PkUMk5df5zDKrGNlyTAqfihrQx
         Nhkq84+StkzsjYtaOY6OUUE6wNIPnIIlwgsKERGX4je4x3LeRCf491+v+VOAFNe7BiK0
         XQiwW/viCO0BHN5KlmiPYwwYbl80DrdRy/ogyef0mYP1myqlmVw90NiQWHt+R4jHDnjA
         SWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914952; x=1783519752;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fg1jQ5xlQw7jkowSdvyp9ysqaIiouFFtIXbXuCa9asQ=;
        b=B1UiUdT479WkzAVVVWraasNWPxi1REvWlcAXLdLKsqWJBr/jaKkvxvgbjsUGM3oXYE
         a8FU4mEb7mh/o58NX8xfIJKjZZnPKMBo4gmbGP09hRm4NWascoiR4iK9a2eMlIt1S8i+
         I2Pi61p1XfMwxj2toqAKDgjp8uB+rhXwI3ybVRJXRr+IhznC0jpP73w3Q/3O/9q4HGgg
         w3GnC0gmhOFXtIuJNQZar+xcoc+LvLtx58ro2MSqlMvOB4toPet7YqnNV+0Jh4NEt468
         l4X5k9YwWbEoswpgyTj0a9hP5ffFUQcWqqnib1sjWE5ca0UgNURQGUeIx7CFH68fCcjd
         HI5g==
X-Forwarded-Encrypted: i=1; AFNElJ90QnQWC5GEzhinunw2c/9/secVIqHQnioWztL6KkJZ9ocPXm4NcV6wYcpuohEzIzlH+n1kRxmKGAQXpSeL@vger.kernel.org
X-Gm-Message-State: AOJu0YxUSWj6h+QTHngeQvyOaHXJ0DwDOd8vQa1a2ZwIoF0M68zFkBeT
	np59t5T9JjSS2AHgQhYd+cxBEHgd7F8+PWN1nZ5KsxEcnESGHly8KV9FAE5LjhISOkXQAuwM3ha
	uesRZvxvRKam8BOgS2SsL4s9kxVN83d4kutZDvMfcjf4G0Cg3W7J37t3pRwhBd8P/WeI=
X-Gm-Gg: AfdE7cnl8S5DiOxNq0t2EhfqwcR6MW7u13HaxhD2m2b9ZanzG7XDrZqVC8MOFhipfDH
	CiAq7jxQSDc4TH6MxbjcWwQiqvL44EoasRPuWc3EhaJssMp9+pxpBM+4/+nSzzl6+39xiikFlFM
	lAvF6rHpvtyPvvsZ3OQPojk58hX2/EPoCE2BNmVPG8rCC9N0jw4ZLiWFIZ7PnLMPMvADXMt/nm9
	E1BpJux6yThEbUplOjAAJXmsV/euU9N/aZpcyxzCWd5d77ynzeUyOTL8B2xpvF0SWJ8p8lHsbun
	j6py+cBRTVRHRY4cN7LxTGe6Otx4wZG05dPL5WVOZJGcUn9HLhQSp4jzlavqU4OZlTKJ202PtvB
	0qfCaa7tA+WiLGwMH9j9SrhpfEc+9cNsmlA3Dv/xXHjyOcA==
X-Received: by 2002:a05:620a:6405:b0:92e:72cd:32f4 with SMTP id af79cd13be357-92e78504000mr245373385a.64.1782914951717;
        Wed, 01 Jul 2026 07:09:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6405:b0:92e:72cd:32f4 with SMTP id af79cd13be357-92e78504000mr245365485a.64.1782914951052;
        Wed, 01 Jul 2026 07:09:11 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e6234862csm564321785a.38.2026.07.01.07.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:09:09 -0700 (PDT)
Date: Wed, 1 Jul 2026 10:09:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
Message-ID: <akUfhLO0I2NqqIYi@redhat.com>
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
 <56ebd97b-0834-41ac-8fdb-2469e2848694@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56ebd97b-0834-41ac-8fdb-2469e2848694@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115728-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jagadeesh.kona@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taniya.das@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67B7A6EEBAE

Hi Jagadeesh,

On Wed, Jul 01, 2026 at 09:37:04AM +0530, Jagadeesh Kona wrote:
> This probably could be due to camcc_gdsc_clk getting turned OFF during the
> sync_state, but this clk is required for GDSC transitions. The camcc_gdsc_clk
> is currently kept always ON from probe in camcc-sc8280xp, but the clock is
> also modeled with clock framework, so the clock can get disabled in sync_state
> callback now.
> 
> Can you please try removing the modelling of camcc_gdsc_clk using below diff
> and see if helps here?
> 
> 
> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
> index e97b8d4f3c84..660d8655d391 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -1753,24 +1753,6 @@ static struct clk_branch camcc_csiphy3_clk = {
>         },
>  };
> 
> -static struct clk_branch camcc_gdsc_clk = {
> -       .halt_reg = 0xc1e4,
> -       .halt_check = BRANCH_HALT,
> -       .clkr = {
> -               .enable_reg = 0xc1e4,
> -               .enable_mask = BIT(0),
> -               .hw.init = &(struct clk_init_data){
> -                       .name = "camcc_gdsc_clk",
> -                       .parent_hws = (const struct clk_hw*[]){
> -                               &camcc_xo_clk_src.clkr.hw,
> -                       },
> -                       .num_parents = 1,
> -                       .flags = CLK_SET_RATE_PARENT,
> -                       .ops = &clk_branch2_ops,
> -               },
> -       },
> -};
> -
>  static struct clk_branch camcc_icp_ahb_clk = {
>         .halt_reg = 0xc0d8,
>         .halt_check = BRANCH_HALT,
> @@ -2839,7 +2821,6 @@ static struct clk_regmap *camcc_sc8280xp_clocks[] = {
>         [CAMCC_CSIPHY2_CLK] = &camcc_csiphy2_clk.clkr,
>         [CAMCC_CSIPHY3_CLK] = &camcc_csiphy3_clk.clkr,
>         [CAMCC_FAST_AHB_CLK_SRC] = &camcc_fast_ahb_clk_src.clkr,
> -       [CAMCC_GDSC_CLK] = &camcc_gdsc_clk.clkr,
>         [CAMCC_ICP_AHB_CLK] = &camcc_icp_ahb_clk.clkr,
>         [CAMCC_ICP_CLK] = &camcc_icp_clk.clkr,
>         [CAMCC_ICP_CLK_SRC] = &camcc_icp_clk_src.clkr,

So there is the CLK_IGNORE_UNUSED flag that can be added so that we can
keep the clock defined.

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e1..9a525347fb2a4 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -1766,7 +1766,7 @@ static struct clk_branch camcc_gdsc_clk = {
                                &camcc_xo_clk_src.clkr.hw,
                        },
                        .num_parents = 1,
-                       .flags = CLK_SET_RATE_PARENT,
+                       .flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
                        .ops = &clk_branch2_ops,
                },
        },

This patch fixes the issue for me. I see that camcc_sc8280xp_probe()
has this:

        /* Keep some clocks always-on */
        qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */

I'll submit a proper patch for this shortly.

Do you by chance work on the team that deals with clocks at Qualcomm? If
so, it would be really nice if your team could make the time to help
review a patch set that I have to fix some scaling issues with clocks.
Here's some details:

https://lore.kernel.org/linux-clk/akPcgdjlDxd-JmYb@redhat.com/

This is two messages up in the same thread that has an example kunit
test snippet showing the problem:
https://lore.kernel.org/linux-clk/CABx5tqK3MymYQZ4owofnzFLnjt+96njw5RG2Vwxo7UJ93A-42g@mail.gmail.com/

Thanks,

Brian


