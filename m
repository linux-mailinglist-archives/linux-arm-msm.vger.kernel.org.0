Return-Path: <linux-arm-msm+bounces-113482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YyTAAeG8MWqJpgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:15:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB4B69561E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:15:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Kccf9lDR;
	dkim=pass header.d=redhat.com header.s=google header.b="gV7/Jy4X";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113482-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113482-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B05A30074D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3A33AA4F1;
	Tue, 16 Jun 2026 21:15:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3813A8724
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:15:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644506; cv=none; b=fq9YA/SlyjAyTb58lvHT0HojC0oHxffF01KZTYai2dcdTvSalb3tsfbrMo0pLeGg6558CyWmawNW7TSQwbn7x5la7txoH8AL2mxMguBEVHjfCsdJq4+JHECwknVBdu3JpSblmDMXQjVhFq+WIjA1jS46F5oRSD4l93LiHwuTGeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644506; c=relaxed/simple;
	bh=mMvV2jT3Lx56AHuQ6UWzQ3fhVExrQHe/Na75v2tYy9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bs5qnqMuGeKLt0X5/lnkfEIE9Pp6VsrEE4ZKt1w/ASJci/UhhMRlzlXeXh1cv1ph2W4ZeGpp0iPvjl/x+hpUD6xK9JSxcSkPzO62g4YvnVwjblzusFnIoHdVF14YrGp0yzrjyir+f1Iiij5+GAYPA90uuVKUsDjHTDq1RG2qqyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kccf9lDR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gV7/Jy4X; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbSNizx+3t0ia73sVy4IXbnSv0+hbHzhdRigrmncOuc=;
	b=Kccf9lDRKdMx8kobRuvkQo44VdeU2k4Ws6qjYYiO0urq03so9DjTiDnUsJ/PtDeN28eo3Q
	boHmYppDg74mrD68BgSGMggyALrGKAXc2qwjvOU3nXO8ewWLKGnsTo2x2BWoF0OuQhY6jx
	Uaptjh9Cvtc3zpOjmyBNSzNgCDIUvJc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-3QyLYwT3OOyOxNKSPHnChA-1; Tue, 16 Jun 2026 17:15:03 -0400
X-MC-Unique: 3QyLYwT3OOyOxNKSPHnChA-1
X-Mimecast-MFC-AGG-ID: 3QyLYwT3OOyOxNKSPHnChA_1781644503
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f7bd027eso1307525885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644503; x=1782249303; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wbSNizx+3t0ia73sVy4IXbnSv0+hbHzhdRigrmncOuc=;
        b=gV7/Jy4XgVx+h6NaMUT6a4XHEMeYaxH2n20trsYFLSNNUR9l6vw8JicNxhCOkk82n/
         Yb/86w14GTYGdC55ASlNVB1CXalBLPQKtlDuwEDGjFm1PNe6i/XtNgnaj6jUcHYjpU0D
         2uJByd3hKwjhjN6kuGiTH0KX2OOu3NIcL6KQip5pJcA2DFpfG4ggk8tgMm0nGzZy3RkI
         GC5UKiVuK4X8SengTTE7PEnH9/dE0rksN0kHyzGtCN2O/GSck6X3ck5bDPbH4DjXAuO/
         f+Oe8T89t5vpBf0LbqdbtWn46wZ12abHo3gtq2KnCCptLRMse8xceQPfVqMxeqBEuFTq
         zFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644503; x=1782249303;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbSNizx+3t0ia73sVy4IXbnSv0+hbHzhdRigrmncOuc=;
        b=FVvo4BhcTOGgMYgC9MARMLzVgZ62SA7e6oInkh+9LfoIlD5Qow/dk0a3EySOu7y93J
         PXsuVONcsXiMEkfwzVk8YL8e3sS8pocQk/DKcqVCeOmqdvDUrqCVbuKQr0LUUFaNG3Hd
         lc792QxSm1tl8/7VkUSu/Vi/lMTiIVp+8Rv7X7Jjze9zmbVMpTxGqeNjbgFTBlUu6FHj
         Ox4bS4QBZJlhJ9tKjDyaz73SCG9FEECwddYLb/ha2k65IdwsGYACOg5Tuw0hsVEif7Fc
         Whsxj93QT1RU6qoRzrkGD1VsYX3jXXU5MMCBWGcQTB2jF0lQHMAUglBwWiyy+Q+1BL7S
         v5nQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fH1MjSuP4BlyXZnYTRMzhCx75iuSUvZpNaM3QE55mmLOHtpaP2cUvb5NiuGrzZx8UFlEtlBxdFzQvo6we@vger.kernel.org
X-Gm-Message-State: AOJu0Yya1ZNpezWnbUqTa0fQn4+DZGFuOw00qIJ3MHVuCyJSf3hcZLOb
	er2u+EMJnq98+6MrKzYdBs+ATjvNYrx1dlzSoBRnY4mTaTlSaw3/uyMS0BfAiK4ErTUcjUsHMEi
	pKG0Ddfd4oyBEvfbmVZoP7eRhgkZ4ZswgpCs5bCyBa7Y6XyOzRrE4DdXPKCTF0a70ma8=
X-Gm-Gg: Acq92OGV630+JaS6sCTn5OgZbjGHtt3k7M8n1oMUabVzoGN3rXYmiS1jDkr+AM1oLgf
	nYvZH7Gt7gOQa6yn0Yt8zjzEynifB32DvxSuAt0kjXgCRAuPfpZ990IO7EGV52w2NLwFVtcqQzp
	d8o0X/QyU7YUIoFAHPYvnfG8bM/AWvcz721cVaUDtEN8rVnyWX/CUjlnPYFlMabduKctuPTp408
	wgXdzCTx61aLlvGR42lE3E2Ejh6Boh5DloWVAgntecI1sY85fjK0hhyf1eInLtoKOfNnB88zem5
	mM8F/0fDlQ9S+7HBv5RqMMfm0i0Isef2SXAIQDpUQjRs9B2HMQOc5tWtq99lx9Laone6ZX6b65F
	a1IC/71bDivhhz+la6BdD+kt56jABXUagiMhNVNN1x/+O8Iluk1tfU4qC
X-Received: by 2002:a05:620a:444f:b0:90f:9cde:977e with SMTP id af79cd13be357-91d8553a7e1mr279648185a.0.1781644502861;
        Tue, 16 Jun 2026 14:15:02 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:90f:9cde:977e with SMTP id af79cd13be357-91d8553a7e1mr279640985a.0.1781644502270;
        Tue, 16 Jun 2026 14:15:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a0080a7sm1591984085a.26.2026.06.16.14.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:15:00 -0700 (PDT)
Date: Tue, 16 Jun 2026 17:14:59 -0400
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
Message-ID: <ajG80xpQ32TsgrAC@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
 <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
 <ajALNcLMlTThdilX@redhat.com>
 <68a86037-bba0-4cab-8a1f-b0be78f259db@oss.qualcomm.com>
 <ajAQqVB_knGO-bqL@redhat.com>
 <fef227d8-4ad0-4884-98ae-fc48056c3856@oss.qualcomm.com>
 <ajAUkTW4uxf7SyPn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajAUkTW4uxf7SyPn@redhat.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113482-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEB4B69561E

Hi Konrad / Dmitry,

On Mon, Jun 15, 2026 at 11:04:49AM -0400, Brian Masney wrote:
> On Mon, Jun 15, 2026 at 04:51:35PM +0200, Konrad Dybcio wrote:
> > On 6/15/26 4:48 PM, Brian Masney wrote:
> > > On Mon, Jun 15, 2026 at 04:33:17PM +0200, Konrad Dybcio wrote:
> > >> On 6/15/26 4:24 PM, Brian Masney wrote:
> > >>> On Sun, Jun 07, 2026 at 01:30:03PM +0300, Dmitry Baryshkov wrote:
> > >>>> On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
> > >>>>>
> > >>>>> On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
> > >>>>>> On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
> > >>>>>>> Several qcom clk providers currently have a sync_state helper set to
> > >>>>>>> icc_sync_state(). With an upcoming change to the clk framework, if
> > >>>>>>> sync_state is not defined for the device, then the clk framework sets it
> > >>>>>>> to clk_sync_state().
> > >>>>>>> [..]
> > >>>>>>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> > >>>>>>>   }
> > >>>>>>>   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> > >>>>>>> +void qcom_cc_sync_state(struct device *dev)
> > >>>>>>> +{
> > >>>>>>> +	icc_sync_state(dev);
> > >>>>>> Only if desc->icc_hws != 0, otherwise it will mess the interconnect
> > >>>>>> internals. You might need to set drvdata to desc.
> > >>>>>
> > >>>>> Hmm…
> > >>>>>
> > >>>>> Currently icc_sync_state does not seem to use the dev argument at all.
> > >>>>>
> > >>>>> How would something get messed up, now or whenever icc_sync_state changes?
> > >>>>> o.0
> > >>>>
> > >>>> Yes :-(
> > >>>
> > >>> Sorry about the delayed response since I was out of town all last week.
> > >>> Just to be clear, the missing check for 'desc->icc_hws != 0' is a bug that
> > >>> existed prior to my change, and I should label it as such with a Fixes
> > >>> tag when I post my next version?
> > >>
> > >> Up until this change, having icc_hws > 0 but lacking icc_sync_state
> > >> (or the reverse) would be be considered programmer error
> > > 
> > > icc_hws > 0 but lacking icc_sync_state (or the reverse) makes sense as a
> > > programmer error. However...
> > > 
> > >> Starting with patch 4, this gets assigned unconditionally, so there's
> > >> no prior bug to be fixed
> > > 
> > > I don't see where that situation happens here. All of the places where
> > > icc_sync_state() was previously called, the new code now calls
> > > qcom_cc_sync_state() -> icc_sync_state(). (There is
> > > qcom_msm8996_cbf_icc_sync_state() that needs to be modified.)
> > > 
> > > In patch 4 of this series, it sets up a framework level sync_state()
> > > callback with dev_set_drv_sync_state(). If a sync_state already exists,
> > > then that call will fail with -EBUSY, and it will leave the existing
> > > sync_state() intact. So it's not calling sync_state twice. I will
> > > clarify that on the comment.
> > 
> > Dmitry and I are referring to the situation where the clock driver isn't
> > an interconnect provider but icc_sync_state() still executes. That could
> > not have been the case before, since most clock drivers didn't come with
> > any sort of .sync_state()
> 
> I'm sorry if I am being really dense here.
> 
> Let's ignore clk-cbf-8996.c since that has a separate issue. The other 6
> drivers in this patch today all have this pattern:
> 
> static struct platform_driver foo_driver = {
> 	...
>         .driver = {
> 		...
>                 .sync_state = icc_sync_state,
>         },
> };
> 
> I'm changing it to call qcom_cc_sync_state(), which will call
> icc_sync_state(). So everywhere where icc_sync_state() is called today
> it will still be called after the series is applied.
> 
> All of the other clk drivers will just call clk_sync_state() directly
> that's set at the framework level.

I posted a new version with the clk-cbf-8996.c fix, plus clarified a
comment on clk.c.

https://lore.kernel.org/linux-clk/20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com/T/#m23a1b61017d35020a311a83454331f758c386c8a

I'm not trying to ignore your feedback, but I'm not sure what's being
asked of me here since I believe what I have is correct. Anyways, let's
move this discussion to the v2. Thanks for your patience if I am being
overly dense here.

Brian


