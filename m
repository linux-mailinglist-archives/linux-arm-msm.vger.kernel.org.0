Return-Path: <linux-arm-msm+bounces-95075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHhTEZmnpmkNSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:19:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9D51EBB85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 952C4303077A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 09:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC92538C2D5;
	Tue,  3 Mar 2026 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7pWR2K3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8656038C2D0;
	Tue,  3 Mar 2026 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529558; cv=none; b=DQUT8EruMWYM9mY7FnHtT5ct7faeEi3nPvIzS9+zUwclQnZPaeMqZcmvB6trgID16SfbNycesPCs6mQvepl1k7TbQRopoeKftGPW/etilI7+IUwKyQUN9WsCxEmympbXp8Mk8xM8V7uImsMksM+wRrBwIzEKmN2l3xy3+htAF5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529558; c=relaxed/simple;
	bh=aS0Q+f7SHHFw1yREg5BbU7Bsh0kSlyyHqmg0Lk8akx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNRjo+x321LghPwaenuTiLulxBaFACgg3YhgLzMjsIOcN+HwLojQ3GUDp66kimPplKoi5JyLxkqeZTXjugKpAfu1+XBV9OfvwFILB87z8a8QEOq+yeBnzJ/Gb5YIbFiW6INzfprIC5yG3r8HVKkto/pIAYd20XuSqujyGKrBPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7pWR2K3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B73FC116C6;
	Tue,  3 Mar 2026 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772529558;
	bh=aS0Q+f7SHHFw1yREg5BbU7Bsh0kSlyyHqmg0Lk8akx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s7pWR2K327EuFeJ9Ohh7aDaEGYyxlpKRE/AaTuyWYat61baizv83KA0zJaFa5Z5hA
	 Ot5k0Si78cM02FbOBaEmXpeoUAw1iT4Hf30EUYt99FOe/FaNPvjzPcXSKKIG5QVoK6
	 ehKJ02twPRa90HZ5QuGkDU4gLNVMu9j2jP+ajZCT382c6Os8YwvsUIfwc3MIPZfxQr
	 z53ioJ1R3YnCG7aDGI0UFGJEjFdpZiZYdcMPseH3riBeMeiFvYO75XmIbw7/Hz3Mt5
	 vlrc5496X6rjfK8lLQH5dlU+oV9m1goOjrls/YOFaHav5+wIIh0P7plqgRb6guYqcG
	 vJDwKFU62obGw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vxLtn-000000001pU-1EF7;
	Tue, 03 Mar 2026 10:18:39 +0100
Date: Tue, 3 Mar 2026 10:18:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: display: msm: Fix reg ranges and clocks
 on Glymur
Message-ID: <aaanbwG-icaIY_IK@hovoldconsulting.com>
References: <20260303-glymur-fix-dp-bindings-reg-clocks-v4-1-1ebd9c7c2cee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-glymur-fix-dp-bindings-reg-clocks-v4-1-1ebd9c7c2cee@oss.qualcomm.com>
X-Rspamd-Queue-Id: AB9D51EBB85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95075-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 11:03:11AM +0200, Abel Vesa wrote:
> The Glymur platform has four DisplayPort controllers. The hardware
> supports four streams (MST) per controller. However, on Glymur the first
> three controllers only have two streams wired to the display subsystem,
> while the fourth controller operates in single-stream mode.
> 
> Add a dedicated clause for the Glymur compatible to require the register
> ranges for all four stream blocks, while allowing either one pixel clock
> (for the single-stream controller) or two pixel clocks (for the remaining
> controllers).
> 
> Update the Glymur MDSS schema example by adding the missing p2, p3,
> mst2link and mst3link register blocks. Without these, the bindings
> validation fails. Also replace the made-up register addresses with the
> actual addresses from the first controller to match the SoC devicetree
> description.
> 
> Cc: stable@vger.kernel.org # v6.19

No need to backport this, it's essentially just a documentation fix (not
a bug fix).

> Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
> Fixes: 1aee577bbc60 ("dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Johan

