Return-Path: <linux-arm-msm+bounces-114989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /nXOBJ1RQmrn4gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:06:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB896D92C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:06:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=hovgqjww;
	dkim=pass header.d=redhat.com header.s=google header.b=tiMfI7RD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114989-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114989-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B13913010C38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7CB314B6E;
	Mon, 29 Jun 2026 11:03:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE567366831
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:03:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730997; cv=none; b=fFPibPz/CvAUApiZHJzPaRAetnxv2R2gfH9wbKcHAzvGFbGyx/2LW+ypPeBJ6OAjTAe0/x8xzzrjgmKY5J35VNyN6nXxbbmuUtBT0Nt8kzFSGeP0brq+m5JuyhhMbAenlCEyV/mxMHzGpYxiSXe/UQBttGoKM4pjw+0TwFI7IiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730997; c=relaxed/simple;
	bh=rxJWyuhBTRSB/O+mauv2DdL+vehSsvLqh+VLsRPp7dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ja3UkZARRtl/yDsL5t6k2uUccmTtEHu0PFq/QwgYezSCV5zd4y9sBgyfotkr5YsIiAgsASubO++gxdxMYWm+4Fhx7YH5FsZH4CwtCh0GbYw8xhaLuVQCWi936x7MCBtEu7T981WmgVSZVmd4QwELlYQhrSp4Pv5oxL3YDIml9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hovgqjww; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tiMfI7RD; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782730995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QKyV/U/ktAcTR9z7ikOTnCGUhOOpuAU9kKgERdXtwk=;
	b=hovgqjwwr6n1YDCWkqaZkxzoGo0lMsMbZcBUrECtUWGFJcJc57cYCzAmswvFPx37hocnrM
	QTu7pFu+A9Vt6SFHFZr/FYoUbhaSU0uEqRlWV0iC2x+G6HsDkBnIwbJUg69P0FsTyPIe3K
	KuMlw9v1WNJqtLv4+0NaEd1ZukLyR5s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-d0PAz7xmNnCdNytuw9lvEA-1; Mon, 29 Jun 2026 07:03:13 -0400
X-MC-Unique: d0PAz7xmNnCdNytuw9lvEA-1
X-Mimecast-MFC-AGG-ID: d0PAz7xmNnCdNytuw9lvEA_1782730993
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f6ff639aso813612085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782730993; x=1783335793; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QKyV/U/ktAcTR9z7ikOTnCGUhOOpuAU9kKgERdXtwk=;
        b=tiMfI7RDiEYkd1nobvFpWcgl0KN+oO4oFg+LAeEEFhRyPT68dgBsBp81nrnRRL3Ylo
         /g9OyZqTW+7OxcIeWNkWZ1tjO7sUe4xOWNSqxuasSC/vgKpWBTzTvJVSrT5N26UfxgKM
         bXgTUGm1W5rj+U83q8O9zjKdGSySmA35LAGAWYiqpdJ5EX5tg/4P97Uydo+mCfked8Z1
         Wy74npOmLNklr6mVjZU9zaLRohY7rvbWKTSQf72VioRIEzUH6MQCm0MWuHd6NozWMW37
         cNsZh1Kddrl9jaavjoBltCLeopn71UiPrkLhpxUXOR1YCpgrYrHX0Da8FauM6hdJ4t5M
         7WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730993; x=1783335793;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5QKyV/U/ktAcTR9z7ikOTnCGUhOOpuAU9kKgERdXtwk=;
        b=UAcG+NyW/gpdmY1w30ZDZnm36r0ZH104GqJZyPZLVb8kicxkcnGX/HZbb2GlXRpMnZ
         UP3AjsRr20ndc/1H41Ia7wg5QE6qqLxJrVMXuHHNf4tqAdj694NtHvtj9oOxQYSOBMX4
         sSSit89JaqmKk6DZrXe22i4x60/3KjUH7Afnl44gPZWCihZBKO375C5arV0JHXczqEjU
         GExW5wJL1FEtXwwbv0TV5HpwI1PWv4Kpbeeb6QKou7X5+bXmQmr+E0UPb5Uu89fkBwsi
         B8vIyO3l+KgPPIpb7Ydd7lXddEwLrUt6Lol/MIu+gPea0Ge1Yo6R8oFXG5t9cZdAiNF6
         x5+w==
X-Forwarded-Encrypted: i=1; AFNElJ9iMJ/5reP4C64cCRETjc0P2QDgdGEgyc4SOWoQt4vwa88KIvm6rWs1QiS+iMlY1cBVSLCgQXI4sAG5aQmi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1xGlmYInrJjDZTzNWNSLjU41S/Q3ZDxCKWJFBpEutRfpsBq/O
	XEaW0xz/J4xDf7nD7lhmKNAaC/TAlP2CZVJXse2OdgWFxUHbeNBqv4R9/AASFj71IvqpUsObTvh
	M/Hgh5ayR1ml13i19DrQI/hCOzm09/ZCyfuSyDbzyrJbTevL7+0bxTYdHl4n9hX/drNA=
X-Gm-Gg: AfdE7ck/AKUPMOq7y/Q/9D5EDDWYjJVlTIm0xpKTd+LHuZDtF8Ha6FCMjFXqUiy5YJt
	JsZ+LNQ+siMzdtqlSOj3Zx2egR5Ey61MLJJK3dXfj4y9kHPWAvznMGMbuR405KCmfBbAcGGJ3ur
	hcDGLsRsq1FO0I7f9GylZcvoXxRY6SmvFVxhUryePNEcmBeDZ003Bl1SLauBT6JoZJSstRpgLhk
	6/vw+d73QBCD6YqeG79NZtAQR4xXEi+NPmOpv+GuaWmMeuEzyZvDtKqwIFX6Vt06DuOVp9CsTuv
	vLw8LPp45UlDRGuajBFR6meTVSC1p/MfhT95bkgZWsqJcnhfiWucJritAKasgLqXQfL3mZana48
	nq00/vmD+AGUCYVwkP+qPdjhW+LdkiZOEBJFtO2OgsOIf+g==
X-Received: by 2002:a05:620a:2552:b0:915:efa6:d718 with SMTP id af79cd13be357-9293cade740mr2654173385a.47.1782730992970;
        Mon, 29 Jun 2026 04:03:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:915:efa6:d718 with SMTP id af79cd13be357-9293cade740mr2654160485a.47.1782730992022;
        Mon, 29 Jun 2026 04:03:12 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde21csm303262796d6.26.2026.06.29.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:03:10 -0700 (PDT)
Date: Mon, 29 Jun 2026 07:03:09 -0400
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
Message-ID: <akJQ7ZFODBjHrqFt@redhat.com>
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
 <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-114989-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FB896D92C8

Hi Vladimir,

On Fri, Jun 26, 2026 at 07:54:39PM +0300, Vladimir Zapolskiy wrote:
> On 6/26/26 19:32, Konrad Dybcio wrote:
> > On 6/26/26 6:26 PM, Brian Masney wrote:
> > > With the introduction of sync_state support in the clk and pmdomain
> > > subsystems, the following warning happens when the unused clocks are
> > > shutdown in camcc-sc8280xp:
> > 
> > Stuck at _on_ sounds wrong.. does clk_ignore_unused / removing
> > the sync state from the clock part only resolve this? There may
> > be a clock dependency for the TITAN_TOP_GDSC that we're failing to
> > describe
> > 
> 
> Let me remind that there is a series, which solves this problem in a proper
> and elegant way, it would be nice to get the review tags though:
> 
> [1] https://lore.kernel.org/linux-clk/20260331140142.892579-1-vladimir.zapolskiy@linaro.org

As I mentioned in my other message, this series didn't address my issue.
sc8280xp wasn't included in your series, so I had to make the following
change in my tree:

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e1..4724ea54c5f67 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -2995,6 +2995,7 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
        .num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
        .gdscs = camcc_sc8280xp_gdscs,
        .num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
+       .cc_gdsc = &titan_top_gdsc,
 };
 
 static const struct of_device_id camcc_sc8280xp_match_table[] = {

Brian


