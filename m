Return-Path: <linux-arm-msm+bounces-113199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id baZxJC4NMGouMgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:33:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09667687357
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:33:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=JzDQJVtD;
	dkim=pass header.d=redhat.com header.s=google header.b=ry967fT9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113199-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113199-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BD483022F72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E4B3EF0CD;
	Mon, 15 Jun 2026 14:25:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E003DC4A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:25:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533510; cv=none; b=OMgxZ0FnV9AYHP13vRZr0SaPks7EGMD6VqfJPTHEoMi3Ws5fEMUkzBtDopMfkBRIRcGqz7m6coQqy5LIarIKH/vvOHE52FDIm/VZQLBagoJkOWbCWPXOQcnYRQ27E8GRh5a6fWIExX2EWwhYbPe2dmqwfiDQKmrrNiaoLvjoFA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533510; c=relaxed/simple;
	bh=3iC2i87xS9mCd/Ng/n0/ibrULXDsMvrLdh9naH6TGmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofPBheoBaoyR81ii976Gt+DpIQ7MSidwbFEpE6if0asbY0FhdcqXVy5vHCv1Obv0wbtAW8pEwa3BbAC7bfmBhkrkpyEu82jL6cNgXfnsYQqwUY2sGk4IoGe0qMecH1CM4ZgXDs+aOQYPfDzyUPkmZulvUzhoMFNM27YoF5To59k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JzDQJVtD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ry967fT9; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781533508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xh0dNKG18px5DpO/h+4aJqXUivlxzo3JbzN1grHbi+o=;
	b=JzDQJVtD3am2U7Eo1LNfwr4oLHkMSUlhiXSaH0gwyndWy8fVqjH/aThZDlxMjstovJUWTq
	SeHFoxVXDRsGRi7/7BzK5k5HZ6pgm36fb8VGk4zXgfBM5r/kgjpJE6fr4mLtIPgCK35ntg
	/IeaktallCwmBGUAqhASWeua9E2gj3c=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-R4icxw0gNQyYpIGOgKvbxg-1; Mon, 15 Jun 2026 10:25:07 -0400
X-MC-Unique: R4icxw0gNQyYpIGOgKvbxg-1
X-Mimecast-MFC-AGG-ID: R4icxw0gNQyYpIGOgKvbxg_1781533507
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915b3587972so317554685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781533507; x=1782138307; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh0dNKG18px5DpO/h+4aJqXUivlxzo3JbzN1grHbi+o=;
        b=ry967fT9CmJC3sc59UK3ZgqozynC7VTHvY/PVYUisNGsjlc8IFghn40B/uEOv3r7Ob
         2Kh7mQE+8xAPpROnD+IfWLRJi6oqEqXn1Aa9lIROBeCmMnl66MulzCTWjtPiWyH+DkbC
         r6QzJFJYomQiPyeOXvL+CJJKBnPJPhysxCzpyxbODARt8jrRtYlnJxa+VlJYj+ZOZbWA
         iPnXsWoL+Eu4RCjLjuSdhCTf/5IiDm0SPo6E7AtbEmqguMHkF3G7N759KAYTnT7MuSc8
         je4HNkQTlPpVxApcZnORCch6xm6HQuele/lvhinDl+HUEi69sw0f/+i5+bsUWZDvO4vo
         ylaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533507; x=1782138307;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh0dNKG18px5DpO/h+4aJqXUivlxzo3JbzN1grHbi+o=;
        b=lXMwPVjOkBHwlIoi8DpY4t1pq+p9z5sBzgJporIvopxdTkM9c0zjrOYugrRnWI6+j7
         X2XVhJ8LGw5Dwrs2iwZZtKnaDbpUEjsrltq/j/vPqRdLpbI+wJKm6B02JGa/KNZ9D/th
         vG00kP1AwS/UMq6FwsA7EYGnIbeXMwwfKvMuCleoYbawDnGhuy595pG3mibT1BqjcadV
         wAShXbvq6Ik8zs/eojFVURTbKuhoQy3CtRhW9TcQRES/97QvS/OJ4207fvibAYT1n6AO
         iVir8omvIC/aFYyBiRH7Gh4zikZbiSxaRPmleiSO9AKWAi7YvFeZyNFtbRQy46a3Sx8n
         Uqmg==
X-Forwarded-Encrypted: i=1; AFNElJ/9lE8YLT/zpSH4KV23yNTahfItbdYQCgck2KiarBq1f++1pdsZ9W7IY7d+bi0llN/mAau9iCgDwKF59Ql2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+q2yLb9vPYn2iP8Pw/Cl2uQ7CoQYlKzYxLWCLpTQSRIOrTXz1
	4IGCQovoLPI5gH5jdO7KSlvi52nW67MCsxTVLzbcXZnqVd4QVDgUp8w6Cz57TvWXgRKWNzsQ3Dw
	Fi3Gq5mKnXDswInS/vMYuux48g/AwgVlDorf2Mc7J/2y/aIk8znDSubYUttE/NC/40K8=
X-Gm-Gg: Acq92OG2sAkcL23kjXuqOez3AAEb/b1ppfZLdyh9FMJtrgt2090adPVp8L6/ExcjcE7
	eipLlFmsi5HT6xqIHs+Ckse7X16P0EfVyvSkGHoeiOgLGa2ieU/EPRFMXyEGMItBgzykvv5G5ip
	UhokCAp9cAtdGOo9FJjWaBtBMRfbVOpJlgwh7tJBOYfYsZ0U/jrAHQfnJ6ja5VDB6edPbFyUHIE
	Q06TI3R8I8e2PdRoJ0iY/Qz6hr68tL3Yhx7F1mOxGtiASGuzILa07wJbnqXJvOqxjIHR9Tb7OtE
	7R5LOxJITT85tVX6CpZb4jqL56hL4CjqLQC1rhyVF9zCjw0UE66u1Gi9GCpRrhDROgs5K2yHVjw
	5fdgCL/FGYWw1fsx/x4I8aAwQHS9uTOoA4dKR1xGhPXDXFsEBR6aLqD1b
X-Received: by 2002:ac8:5e11:0:b0:517:9206:10fd with SMTP id d75a77b69052e-517fe4f99aemr213373291cf.16.1781533506543;
        Mon, 15 Jun 2026 07:25:06 -0700 (PDT)
X-Received: by 2002:ac8:5e11:0:b0:517:9206:10fd with SMTP id d75a77b69052e-517fe4f99aemr213372311cf.16.1781533505971;
        Mon, 15 Jun 2026 07:25:05 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7dad16sm108693331cf.21.2026.06.15.07.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:25:05 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:24:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>, Saravana Kannan <saravanak@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <ajALNcLMlTThdilX@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
 <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113199-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:val@packett.cool,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09667687357

Hi Dmitry,

On Sun, Jun 07, 2026 at 01:30:03PM +0300, Dmitry Baryshkov wrote:
> On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
> > 
> > On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
> > > On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
> > > > Several qcom clk providers currently have a sync_state helper set to
> > > > icc_sync_state(). With an upcoming change to the clk framework, if
> > > > sync_state is not defined for the device, then the clk framework sets it
> > > > to clk_sync_state().
> > > > [..]
> > > > @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> > > >   }
> > > >   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> > > > +void qcom_cc_sync_state(struct device *dev)
> > > > +{
> > > > +	icc_sync_state(dev);
> > > Only if desc->icc_hws != 0, otherwise it will mess the interconnect
> > > internals. You might need to set drvdata to desc.
> > 
> > Hmm…
> > 
> > Currently icc_sync_state does not seem to use the dev argument at all.
> > 
> > How would something get messed up, now or whenever icc_sync_state changes?
> > o.0
> 
> Yes :-(

Sorry about the delayed response since I was out of town all last week.
Just to be clear, the missing check for 'desc->icc_hws != 0' is a bug that
existed prior to my change, and I should label it as such with a Fixes
tag when I post my next version?

Brian


