Return-Path: <linux-arm-msm+bounces-113204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZgLuIb0QMGoPMwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:48:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D480E687566
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:48:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Bw+wPxEZ;
	dkim=pass header.d=redhat.com header.s=google header.b=nphXWQeZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113204-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113204-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC0A43054886
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E583FC5C7;
	Mon, 15 Jun 2026 14:48:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FE531CA4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:48:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534897; cv=none; b=Z3LOYhYqVJalBKidFzoufKiNTMLDnDvcaj31W0Ma1FXsLKaAuOsC+mIyKSYkTImgCio7HeOQZ+vGRBMgKwVVo0gerunW46bhdAUgbNZqTuuNA5Q7m6Jo5rAI2R97f7fd6iAaUEq1mEPLdALQ8cxR62b5w0BytN/hDURZRl6LimU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534897; c=relaxed/simple;
	bh=YlzTVkLgMbpd2FCLrWB4gEgTde5PLvSJdXVzWSc/UuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0VXQX6E6QJ3TQ2xSghzurCxkbLY0wc6EwMkp5lis0wpC3SiWcLTogMRLaUSFrQw7nmoSXNMw0AAiLWrHGAszDDP/9eKU16dRVuMiqgX2Chi8krmAgAxrA38Nq/iratM43wzYLP7jK5yn+kmEF6rBHj0KwjwAXr751DawkjTe0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bw+wPxEZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nphXWQeZ; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781534895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYUiP1zUOQ/ECnZLKF5f92a9iphW3H0XPbp5bN6qB9c=;
	b=Bw+wPxEZ8iuBqOoOh4mYL5+B095PtaJU1SKBm49H97R6ATuS1UJ7Pc1ILI+QujaOBSLtQ4
	AzCHD/MgSBzfidezYssQswz0veBRRyZvd27qo/O0Dv1LsQXcLtPRxdTN9bZMwOkx1j2AGA
	js0r3SyhPitL1kkP7+ebZJ3/5+VvQhk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-KX2MNjdvMvu09ZmNwqdFvw-1; Mon, 15 Jun 2026 10:48:14 -0400
X-MC-Unique: KX2MNjdvMvu09ZmNwqdFvw-1
X-Mimecast-MFC-AGG-ID: KX2MNjdvMvu09ZmNwqdFvw_1781534892
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccdcd8dd3dso74467666d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781534892; x=1782139692; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYUiP1zUOQ/ECnZLKF5f92a9iphW3H0XPbp5bN6qB9c=;
        b=nphXWQeZEpLoRYrX0e5YD+2i8ZGlvrQSDPXe9b8xIpfqANRY+m+nm7XyqtUtQw0Nae
         T1z/tnVWBMkYNFx/Uxy3jl8iD+rqEiiWczzqU0KGawTwtWk6yc8n4ZM4hlajwiF0u75B
         JKENZOtF2hKFa0ZeefoUJcH1z8Haa891Loyq75ni4kK0/iBr11wCa+nPfhfoupHOX3Lr
         2q4aEaIOLEjQ/w4rqk+9KF+cP1kBGN+TZxGKu5vQriTRMSP0iXifGe12eSKlJCqVCNgI
         hSkYKW/gkhnLONVzJEAXmOcVuU9zoj9uI3nTohK8/hcYJCzEv2j1Q41Lep/ZiviE1Pny
         YeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534892; x=1782139692;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYUiP1zUOQ/ECnZLKF5f92a9iphW3H0XPbp5bN6qB9c=;
        b=R87UBaJCJB0CJ2xtwixqmUZsg2W6JcfO5d2EGYVPMSCad5+Qu/rP+HzlUA58+z5BUJ
         ptrKQnKATbgjCuzuGE87YOu1rse0nxYOJHlVKKyI26soamMueGgDnxBL8aDSJqJeOBlZ
         c9ZsqdDJAatfbXb8UmzjBGSCWbT+ISrUEJR8D9PffXlb9AOS4114yVIrDrgD3En1uaU5
         HRTVTYG1yja3ao0nIWJOtl436RKYsOw56anQpKF5UiJR6WRtkL8B5Q6msn2hGoPws65o
         QG+TyETQ2CVuw/p1ktf8n1sGaTOQwFDwHRXGN30eaWGTY4pGK0kNAMGND2jya6bsaJLn
         yYPA==
X-Forwarded-Encrypted: i=1; AFNElJ9WseJzoIUXWh4+O8jCVVnVWIaMqNAH0MU/dYOZxeMR784mvHiIvIXMEk3HG6Jdf2Tj6+g1avUnGWFMRIW5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsyc3yNfom2wBr74golGGxzpUw2PyjqEDcxMvNd286IrEcL/K/
	2VWr9R42+2RHJ4fpBhfuz2GVQ8f+DTAsfPoDTHAiua8gpmOjHaukvvnLmIu8k1au6ixFSMkvKH0
	Mkws82s3wE8x3VELNWbCD7XtdUqO++FvQq15gBCuOZOoKR6Tu4HpHHVrY8wvGdshB2CS4gi+VXS
	8=
X-Gm-Gg: Acq92OF2U0pb1o5cHX6MZcUv5vB4Pp50HL1ifjtOtzHCd7FUtqv3l1scrGqSO3tVU0r
	L731fyI2cPCwfh+rG5FZEwmd8rbyWV7rcEiXGYbjsyU78t5KMGdNPz8uhrrs0ApIyUPbDFEruPw
	MMTAH2UJ5+ghWSzschu1/3k0mx0cxN2v7oAM4cEfYPPDHKgpWw+X8ZPHz1x+wOmbvzhkUHZrWA0
	ue6NRCJG4QoD/g7ds/QK5HbX+pHod5uAA4tMBKCRUN5zXH67WKUjxClfAvcLB9P5v5bYEctfr7z
	6XKT4wIMc84ymGwDbRRv99kDpyCUKSP6QdbQNoyZVNyzU8/vVQ8ZYP0K1vt0j26I8JUYCYDJYpC
	+Ed+vUI7cgzFefCXDO6KyMiSLbWUSPtwGAlZ521TgoRSInc0/EkqfJSTE
X-Received: by 2002:a05:6214:c2d:b0:8cc:10ff:cebc with SMTP id 6a1803df08f44-8d32c012972mr6347106d6.7.1781534892439;
        Mon, 15 Jun 2026 07:48:12 -0700 (PDT)
X-Received: by 2002:a05:6214:c2d:b0:8cc:10ff:cebc with SMTP id 6a1803df08f44-8d32c012972mr6346636d6.7.1781534891945;
        Mon, 15 Jun 2026 07:48:11 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f4557634sm259586d6.30.2026.06.15.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:48:11 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:48:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Saravana Kannan <saravanak@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <ajAQqVB_knGO-bqL@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
 <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
 <ajALNcLMlTThdilX@redhat.com>
 <68a86037-bba0-4cab-8a1f-b0be78f259db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68a86037-bba0-4cab-8a1f-b0be78f259db@oss.qualcomm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113204-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:val@packett.cool,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D480E687566

Hi Konrad / Dmitry,

On Mon, Jun 15, 2026 at 04:33:17PM +0200, Konrad Dybcio wrote:
> On 6/15/26 4:24 PM, Brian Masney wrote:
> > On Sun, Jun 07, 2026 at 01:30:03PM +0300, Dmitry Baryshkov wrote:
> >> On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
> >>>
> >>> On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
> >>>> On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
> >>>>> Several qcom clk providers currently have a sync_state helper set to
> >>>>> icc_sync_state(). With an upcoming change to the clk framework, if
> >>>>> sync_state is not defined for the device, then the clk framework sets it
> >>>>> to clk_sync_state().
> >>>>> [..]
> >>>>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> >>>>>   }
> >>>>>   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> >>>>> +void qcom_cc_sync_state(struct device *dev)
> >>>>> +{
> >>>>> +	icc_sync_state(dev);
> >>>> Only if desc->icc_hws != 0, otherwise it will mess the interconnect
> >>>> internals. You might need to set drvdata to desc.
> >>>
> >>> Hmm…
> >>>
> >>> Currently icc_sync_state does not seem to use the dev argument at all.
> >>>
> >>> How would something get messed up, now or whenever icc_sync_state changes?
> >>> o.0
> >>
> >> Yes :-(
> > 
> > Sorry about the delayed response since I was out of town all last week.
> > Just to be clear, the missing check for 'desc->icc_hws != 0' is a bug that
> > existed prior to my change, and I should label it as such with a Fixes
> > tag when I post my next version?
> 
> Up until this change, having icc_hws > 0 but lacking icc_sync_state
> (or the reverse) would be be considered programmer error

icc_hws > 0 but lacking icc_sync_state (or the reverse) makes sense as a
programmer error. However...

> Starting with patch 4, this gets assigned unconditionally, so there's
> no prior bug to be fixed

I don't see where that situation happens here. All of the places where
icc_sync_state() was previously called, the new code now calls
qcom_cc_sync_state() -> icc_sync_state(). (There is
qcom_msm8996_cbf_icc_sync_state() that needs to be modified.)

In patch 4 of this series, it sets up a framework level sync_state()
callback with dev_set_drv_sync_state(). If a sync_state already exists,
then that call will fail with -EBUSY, and it will leave the existing
sync_state() intact. So it's not calling sync_state twice. I will
clarify that on the comment.

Brian


