Return-Path: <linux-arm-msm+bounces-114516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J7/xJ8ATPWrLwggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:40:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9966C5342
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:40:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=RjCN4L1J;
	dkim=pass header.d=redhat.com header.s=google header.b=lAMpmWeQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114516-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114516-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3A6E300DD40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA343A451D;
	Thu, 25 Jun 2026 11:38:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DE932D7F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:38:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387530; cv=none; b=Ee/2CtPPgJC7wONT+/a9gXf02y5KfBu3GRMyk3XROG5uLZUQsd81jKtyB+8MX/0wTNI+58ojH1G3HWE26EpEUXcK2F8RQeiW4ICt9b4cvgMj0IvYF8CRU4seyF9x9auYiVqrU2p3oIXTQHvYzU3f7opFWzWZkGfv9VCsSDTh6Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387530; c=relaxed/simple;
	bh=dNJMKE8Fb6m6nRBSQf7lQCMZOJCugTd17FFgofP/eds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPbVzwE38vd8n+THS2jwY72gt7uplmKBsnAJx1VkFb2wHMTqmZdZ5Adbp3Yn6pkM/HbtqKHDIGHbE3XeMr995HJOEsGddhz67IQUCmR9fp3txr+GOQ6oSBwfY8eqweyrjQ1G4ufYWNHZzmJGF2278yzC4GLK1Tt5EDKjhcNiEKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RjCN4L1J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lAMpmWeQ; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782387528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eb+j6jBjdeQpLj6vYhJ/GQkkOLBPXDRRMzcQgZKL2uc=;
	b=RjCN4L1JsQPysHyFEVfer7mMqpPSLNe6UMmafcbShizq6Ec3stFghcv349WXrBtoswjlWq
	8qRIj6lSvUMTliNJ9rYziZLi0GGO09VjOjTqmfPRhBigKwzBEEXv0WRrB5j7hjJPO8x4kB
	ySjcjJ2JCHJOpJe+oATuptPhqtSnMxs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-AVqk5qfrOO-Zuy0A0-cJ-w-1; Thu, 25 Jun 2026 07:38:47 -0400
X-MC-Unique: AVqk5qfrOO-Zuy0A0-cJ-w-1
X-Mimecast-MFC-AGG-ID: AVqk5qfrOO-Zuy0A0-cJ-w_1782387527
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-519899aa6bfso32652701cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 04:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782387527; x=1782992327; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eb+j6jBjdeQpLj6vYhJ/GQkkOLBPXDRRMzcQgZKL2uc=;
        b=lAMpmWeQZ6Olu6/1NZoydzaFcTQFKWh7PoUSZcH4erPrnRWhCnzTrUb4abYuFrOVaK
         t3+q7mZnxcl4FSzaHmrhgE+FQ4jZ0KyvqVfNFFLhRfdJ1P8YhlJ4fh/I+nA9UuH+Zf2Z
         N6T4K2369UXgUc2DwfiYg84GBVNgtFdIS25JRzbx7bvP20w12mGOOaX2TcVrSFWKlRar
         p53clSWiTM/T2fO3hfYtmGCdZ2QA16dfoPQHylMdSDqgchXpPbAyfFokwjej/EW4Al+9
         TjDEnEu4GeWvsAR2TmqL7GmbjK+OsqtkmjyFLfQOwjPo65Zp6yN2WBZMEwYnknqKbDnI
         FQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387527; x=1782992327;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eb+j6jBjdeQpLj6vYhJ/GQkkOLBPXDRRMzcQgZKL2uc=;
        b=HoqbHp879QysPGUxDx4iAz7SGttmkQlFMZwPAzi+Q5AwX8WUVvdzMCshHd3C+mDpoT
         lcVSPgiYvI/OPBbKx2BA+LX/KgfBjlpe7p0QKR89CxqIuYXC81FFPFs6O/LbSAxJIpUg
         3EMXs33czTEgNzotUpgeUMkS/xdojLd+VHigRJa+jRpyTb7XOj+9phPHZP4YSnnpmPh+
         xNllzOWG1yYR2G6fmdgD3HPwRXBh/5yrUW1syt8CA9Zq+yPZUlMdMtprFHu5yVsXCd/O
         q6FL3S6v++M/LCo0B5hWRvXVAm3eIYikDfV3prepxTJs5OKos0oseV5EAPb2zpjwF/0l
         oCoA==
X-Forwarded-Encrypted: i=1; AFNElJ8+tjvwC04SOfeOOHIbsKAa1Ddh28YuDYlQZsQpxAOgpFHbJZ4gmYhWvdcYGLJgMJxgc0KJOEzhVfNMNZdw@vger.kernel.org
X-Gm-Message-State: AOJu0YxV8ScdT7KPqoC63vDGTDJ4ebAXckUxE8nKAE/dL+w/hKsH/WTd
	4xZFUqO6Iu4Z5jVsS4r6KBk11wc2tLMF9gHaVk429SvAbmKqtJJLsAkKRAR6FxmOnXuMEQEw1FU
	m+vgHQC+xhAsEw2Y3zsjEIacaqydBiDidibzlY+XH/+TFCjJ4DOEZT6/AyhVhaIK7ofw=
X-Gm-Gg: AfdE7cl0K+1BVXb5qoHtHVN9mIA4kT0Cr5gSyVjpEnCIyRFNydIImFWikNbWomSaheO
	bpUmQfYw3bHRBQ71a18nh7U34fALjdFLTlsfjs9qT9XvM4OauSZ2w5Bt0w5beT0PSviwlSU9Bi3
	ZDyHJ7yjaLx1STZ9fXy6Sidv5V4hveujkwza2FgZoSteAyEzDFTJA9eJdl9flnMq1nnGTpB9KKV
	JqVhrehqbbJurPRwKcrARwR285ZXCdHviQ+ptB75iH50J+GZ38oPTqqB9m7nNOwOJmshkCJ2aPN
	BDTvUfdagP1Ka4ikseglpTnfe0CSCVWKVdkzkminZoj3/JlIAeqTgeLrsBRPwrLQXcTn2S6fjhf
	97ZqXK2cw3XrDQpTfVd0OVRkw2yfTXIEhX2hfk1NRI9QGwg==
X-Received: by 2002:ac8:7dcd:0:b0:51a:1128:4b3e with SMTP id d75a77b69052e-51a7283a782mr28783651cf.29.1782387526788;
        Thu, 25 Jun 2026 04:38:46 -0700 (PDT)
X-Received: by 2002:ac8:7dcd:0:b0:51a:1128:4b3e with SMTP id d75a77b69052e-51a7283a782mr28783101cf.29.1782387526090;
        Thu, 25 Jun 2026 04:38:46 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51a9bca9sm69288951cf.19.2026.06.25.04.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:38:44 -0700 (PDT)
Date: Thu, 25 Jun 2026 07:38:42 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2 2/5] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <aj0TQuaPWmSlLwIw@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
 <21bbffb7-ce99-4c38-a5cc-6a3f3c7f48eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21bbffb7-ce99-4c38-a5cc-6a3f3c7f48eb@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114516-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oldschoolsolutions.biz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC9966C5342

Hi Konrad,

On Thu, Jun 25, 2026 at 11:44:12AM +0200, Konrad Dybcio wrote:
> On 6/16/26 11:09 PM, Brian Masney wrote:
> > Several qcom clk providers currently have a sync_state helper set to
> > icc_sync_state(). With an upcoming change to the clk framework, if
> > sync_state is not defined for the device, then the clk framework sets it
> > to clk_sync_state().
> > 
> > Clk providers that require their own sync_state will need to call the
> > framework level clk_sync_state(). Let's introduce a new common helper
> > qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().
> > 
> > Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/clk/qcom/common.c | 9 +++++++++
> >  drivers/clk/qcom/common.h | 1 +
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> > index eec369d2173b..31382c49c948 100644
> > --- a/drivers/clk/qcom/common.c
> > +++ b/drivers/clk/qcom/common.c
> > @@ -3,12 +3,14 @@
> >   * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
> >   */
> >  
> > +#include <linux/clk.h>
> >  #include <linux/export.h>
> >  #include <linux/module.h>
> >  #include <linux/regmap.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/clk-provider.h>
> >  #include <linux/interconnect-clk.h>
> > +#include <linux/interconnect-provider.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/reset-controller.h>
> >  #include <linux/of.h>
> > @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> >  
> > +void qcom_cc_sync_state(struct device *dev)
> > +{
> > +	icc_sync_state(dev);
> 
> As mentioned before, we really need to test for (qcom_cc_desc)->icc_hws
> here
> 
> If icc_sync_state() is called without an interconnect provider
> being registered, the framework state gets messed up:
> 
> --- drivers/interconnect/core.c
> void icc_sync_state(struct device *dev)
> {
> 	struct icc_provider *p;
> 	struct icc_node *n;
> 	static int count; // function-static variable
> 
> 	count++; // called for every clock controller in this revision
> 
> 	if (count < providers_count) // kaboom
> 		return;
> 
> 	// actual sync_state never happens anymore
> 
> Presumably one would pass this through drvdata, but be careful as
> some drivers use it for other purposes today

My next version of this series that I haven't posted yet allows chaining
the sync_state callbacks at the driver core level. It doesn't require
any of the QC clk driver changes, and will allow us to play nicely with
the pmdomain subsystem, and any others the move to sync_state in the
future.

I think I see the confusion between us the last few rounds of review. In
this series, I added qcom_cc_sync_state() and converted 6 drivers over to
use it. (I excluded clk-cbf-8996.c since it is separate.) Only the 6
drivers today that called icc_sync_state() now call qcom_cc_sync_state() ->
icc_sync_state(). So from my vantage point it is the same overall
functionality.

I didn't look at this from the perspective of qcom_cc_sync_state() would
be common infrastructure, and a newly added driver in the future that may
not interact with the ICC framework may use this. Is this correct?

I asked earlier if this was an existing bug, and the response was no.

Once I fix my x13s today, and able to verify my v3 sync_state still
works as expected, I'll post the new version.

Brian


