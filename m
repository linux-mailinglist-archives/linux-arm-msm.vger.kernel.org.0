Return-Path: <linux-arm-msm+bounces-113207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +I6AErIVMGrRNAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:09:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE98F6877E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:09:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=DpjF2U5d;
	dkim=pass header.d=redhat.com header.s=google header.b=jqyhQpOf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113207-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113207-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAA813066AAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807B73FDBF3;
	Mon, 15 Jun 2026 15:04:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2541D3FFAB9
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:04:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535897; cv=none; b=TGmRxBI2cVN9f3FUWRH/ix/4JmkZeGQsmv4W46S4vi8UnJTPcE1lMuQi9swT4grY3+G5Z2cKfqTtIlZgiexjb9xkF1VsQvq/Y97a+RFsSXpdAX3JxnuNfAmJxLTiB67jL4uQsA+OcE/69+t8iNLxlzKfSG7Rcb4e9tm11kSE0VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535897; c=relaxed/simple;
	bh=qiJePkb77wcQ8uQMKyB7K1EajheX5tE398lCjm2qbrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cm4bqKx/xkqRFoBjccYGGNS0blkXspWoCljNsdZ9PS8j8wK1kvvoElfmms7VaBxPmr3EFSTYMXzW7jwwdzQnGX42QDycvG4JMUc73nqnV1ihZ4GhdTRCtOLc7dqFVXuQzdDSQn2RNqLTO6z1vHD81PEotC+SjmO/NEDZQWo27w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DpjF2U5d; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jqyhQpOf; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781535895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Px5Xu7MhZIEsVfuisoAxF+/5T0Fd35a+WXu6g8v35xE=;
	b=DpjF2U5dbb5ywWyn5uJZkyv7cClTpNklEIIbBZLK70u4tsPoxpRJVRy5h53zh/XELYx+f5
	jDeE2keko6HMLxMr1vVXQUQK+FLBOfOYhdQfcie12HFqhwJRFC1n/yQ+fy2fV3gnSefsdw
	W6bLIImMkKUdOwMRtWvLNI4rlXPMo84=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-5BBhBN45ORKGJ-PJMSrt8g-1; Mon, 15 Jun 2026 11:04:54 -0400
X-MC-Unique: 5BBhBN45ORKGJ-PJMSrt8g-1
X-Mimecast-MFC-AGG-ID: 5BBhBN45ORKGJ-PJMSrt8g_1781535893
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd2462acbso3612600137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781535893; x=1782140693; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Px5Xu7MhZIEsVfuisoAxF+/5T0Fd35a+WXu6g8v35xE=;
        b=jqyhQpOfTMleP3Ak7MC+7q7rV3drfNo8b5CtiF2F1DUZIFLZ3qLtnEkek0zgmbU7aM
         FkmQgN2Ik9RQfObFzX/gky0LduevPMi2a6sMv3NkT1XrV2P/8Bd6DIWbwP76VjNPQn4B
         5iKyrL/rTcFp9BxLBw/zEKG4+8CvsY9au9wKCniCPJBWYuMaGdpSR34sKOarP3QoDKyT
         /IblLWiSUh5qpqlAZ6yvaAQjXf2eguvfvBZKCfQ3On4MVD5fPvF3BodhG183hI6YG3+F
         cAFBp4ZsElJIoWnwEYDNnNUIFgsllmlLpB1BtNAMI1YKu2MqtVVbQA5oDV149cchsaL0
         xMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781535893; x=1782140693;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px5Xu7MhZIEsVfuisoAxF+/5T0Fd35a+WXu6g8v35xE=;
        b=I5eKiBXtIo/IRYHiU3R78iEVDaN1blpxsb3FyVQhGiI/SvblyVWwllwYnGKQjjeo7K
         kU41wuOJk/DmCGuKLq1/Aw2dS03fyf2l2VMlxOHeP+vrueBCkNHbpyExf+IVmg0LlrBb
         ruCSJmkeyKREHL7sTFldAipeY2kPEmLOZoz2EgO8YuoS8atcruXc15pk1rcRCX5YTgzZ
         ClQ3doQsmIaDTM9T6pjqGMff7DUeoSWgt+Qxj7maHW1Mm2ZXUiKxaVcV7OWfDMO9C/+G
         dTVOU+683nxUKk+b73xqXDAhqT6mNqBHQJy2J1Pnl6pEFmaIj8bzksZw4B0ekLkJmJN4
         rbnw==
X-Forwarded-Encrypted: i=1; AFNElJ8oGvXGlkP9v1Qwo95LZUCK7TS+VgHfLnILeMHBCEog+6IirljtMMo+GSa/gyzcB+SdQurV7b/ALetofodK@vger.kernel.org
X-Gm-Message-State: AOJu0YzHZRNi117uiDiD2Uq00fsqBsXkAzwOWOqk2eaOqyralGAWPG1G
	U9sxtve+Lm1TBZM7sLQQyMq4mWP9xNmKUda15y1TvA3cjeDo8t3O87yJd9NapJFJjTkZjNstA5E
	T61GUVfuaPZ/NKOMLMEmfsksKMrhih9j8Lm7y0Cei9h7aVazngi5EkJJCdtDZXoFUO5s=
X-Gm-Gg: Acq92OHZumgzB4H48cquigbYHn7JsHFMXZJ4u4qU19jC7h2iopvkZAMKrSGU2xiWnly
	i3s+nejY0/l+UG/TuMbbV4t++1c4GBt3GItJ042pKKSp73CfRJ+YdzsbHOJ+Kv4qe/aMY4bc/+C
	o1uRnKbITKAYL5VcU7KX9z7imT6T5+74ZZYIaGF5IfTLu4A0vusZ3JlXFU9qVZ3VKlJdkgyCvHj
	jIocpl6t8EkamCe0hm0/wj9uOuCiPDPMTBxwt2lINtmN+sFbETg1h53nb6b/ZTbGpTUDpRng6IN
	8TEAJsP5Cjkv3i2bn86tsHHPi1DE27AukHfAGFOUC0DkzKh22hXRRmZ4Ck1CBlUHl2YFD5QdP2q
	sp7uLT+eho4hnQonBkLGr8hS9kbQKjamGrpvCrloA3mKQ8IGdvt4DYzgB
X-Received: by 2002:a05:6102:330d:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-71e88aba506mr7937958137.2.1781535893165;
        Mon, 15 Jun 2026 08:04:53 -0700 (PDT)
X-Received: by 2002:a05:6102:330d:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-71e88aba506mr7937894137.2.1781535892692;
        Mon, 15 Jun 2026 08:04:52 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619ed7215sm1095261585a.7.2026.06.15.08.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:04:51 -0700 (PDT)
Date: Mon, 15 Jun 2026 11:04:49 -0400
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
Message-ID: <ajAUkTW4uxf7SyPn@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
 <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
 <ajALNcLMlTThdilX@redhat.com>
 <68a86037-bba0-4cab-8a1f-b0be78f259db@oss.qualcomm.com>
 <ajAQqVB_knGO-bqL@redhat.com>
 <fef227d8-4ad0-4884-98ae-fc48056c3856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fef227d8-4ad0-4884-98ae-fc48056c3856@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-113207-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: AE98F6877E7

Hi Konrad / Dmitry,

On Mon, Jun 15, 2026 at 04:51:35PM +0200, Konrad Dybcio wrote:
> On 6/15/26 4:48 PM, Brian Masney wrote:
> > On Mon, Jun 15, 2026 at 04:33:17PM +0200, Konrad Dybcio wrote:
> >> On 6/15/26 4:24 PM, Brian Masney wrote:
> >>> On Sun, Jun 07, 2026 at 01:30:03PM +0300, Dmitry Baryshkov wrote:
> >>>> On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
> >>>>>
> >>>>> On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
> >>>>>> On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
> >>>>>>> Several qcom clk providers currently have a sync_state helper set to
> >>>>>>> icc_sync_state(). With an upcoming change to the clk framework, if
> >>>>>>> sync_state is not defined for the device, then the clk framework sets it
> >>>>>>> to clk_sync_state().
> >>>>>>> [..]
> >>>>>>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> >>>>>>>   }
> >>>>>>>   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> >>>>>>> +void qcom_cc_sync_state(struct device *dev)
> >>>>>>> +{
> >>>>>>> +	icc_sync_state(dev);
> >>>>>> Only if desc->icc_hws != 0, otherwise it will mess the interconnect
> >>>>>> internals. You might need to set drvdata to desc.
> >>>>>
> >>>>> Hmm…
> >>>>>
> >>>>> Currently icc_sync_state does not seem to use the dev argument at all.
> >>>>>
> >>>>> How would something get messed up, now or whenever icc_sync_state changes?
> >>>>> o.0
> >>>>
> >>>> Yes :-(
> >>>
> >>> Sorry about the delayed response since I was out of town all last week.
> >>> Just to be clear, the missing check for 'desc->icc_hws != 0' is a bug that
> >>> existed prior to my change, and I should label it as such with a Fixes
> >>> tag when I post my next version?
> >>
> >> Up until this change, having icc_hws > 0 but lacking icc_sync_state
> >> (or the reverse) would be be considered programmer error
> > 
> > icc_hws > 0 but lacking icc_sync_state (or the reverse) makes sense as a
> > programmer error. However...
> > 
> >> Starting with patch 4, this gets assigned unconditionally, so there's
> >> no prior bug to be fixed
> > 
> > I don't see where that situation happens here. All of the places where
> > icc_sync_state() was previously called, the new code now calls
> > qcom_cc_sync_state() -> icc_sync_state(). (There is
> > qcom_msm8996_cbf_icc_sync_state() that needs to be modified.)
> > 
> > In patch 4 of this series, it sets up a framework level sync_state()
> > callback with dev_set_drv_sync_state(). If a sync_state already exists,
> > then that call will fail with -EBUSY, and it will leave the existing
> > sync_state() intact. So it's not calling sync_state twice. I will
> > clarify that on the comment.
> 
> Dmitry and I are referring to the situation where the clock driver isn't
> an interconnect provider but icc_sync_state() still executes. That could
> not have been the case before, since most clock drivers didn't come with
> any sort of .sync_state()

I'm sorry if I am being really dense here.

Let's ignore clk-cbf-8996.c since that has a separate issue. The other 6
drivers in this patch today all have this pattern:

static struct platform_driver foo_driver = {
	...
        .driver = {
		...
                .sync_state = icc_sync_state,
        },
};

I'm changing it to call qcom_cc_sync_state(), which will call
icc_sync_state(). So everywhere where icc_sync_state() is called today
it will still be called after the series is applied.

All of the other clk drivers will just call clk_sync_state() directly
that's set at the framework level.

Brian


