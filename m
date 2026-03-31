Return-Path: <linux-arm-msm+bounces-101106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPVqK00JzGn+NQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:50:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C836F60B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2083B3107518
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD60443DA55;
	Tue, 31 Mar 2026 17:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6r5RCFw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9743AA4E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979014; cv=none; b=dAN2IedHteZnxFd29z8TWGsG3xRH/QyVHNCHBCOUGY+9w5Oj9Ucg5VDEKyyAMn0PsfAtziXJItN5aVfxhWg+iRZSYHH5Qhg5J7cGd/ABYW+XzjssBIr5qqrpAgypBOCELdLkSEurPVccp7KI/rJ4cGUOi8H6ZeIuHjnvYGCMOkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979014; c=relaxed/simple;
	bh=BPAI10K70e+CF+7qyTbXS4a+PvSEqRYiYd9lP4ZeYLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvutpWWQf4YhyzeDSvqv7iMaeFkaK3iZTlHeld094faX7HBab3wM/AKsmVfHNbHrjAxDnLsro5XjM4AV7ITgahg7XQdQOcr/91qMaGoDMXhpaDrqOt43hhNRBrh34zF4jdtc/yt8+1cMb/QRJA7cPyHFMLp8xd6PA0Liv5AvyY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6r5RCFw; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cd7284782dso363319885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774979005; x=1775583805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XbKHKvhaSMoLy6eA0IPH3efMSPpQIB4QG87MfGtQ3zY=;
        b=c6r5RCFw+becEQmdyeDtY4HM/UIya/k/fTr9BAL5Y15NZIvcm1rlmsk1a2uQjMn1VU
         WIe/nrkvQzhpK6mdeI3qYlq8T3NejDb9YZID12258E7ggev1Rac5K4XKIZepGgJUyncv
         vfc2f1zdqR0U6Vv6JQa6ZsTXB0iwA9+ZLf+CsRdgCEmLyaB45UrHFI3kcQZmvKkX7Frt
         EUxKT7jPCoKlTl4wbStty1XUY5vmXFT4j9ZwJdinwk4y7HzNrTpsS9xsD0QlrCQaD2Jh
         A70uGAogasAhAjtLku/3NoQ7Rt6REEBAPtdJpN76+AA1ntLrjRQFklq+XZxFz1irFgO3
         Ku/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979005; x=1775583805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbKHKvhaSMoLy6eA0IPH3efMSPpQIB4QG87MfGtQ3zY=;
        b=BfWoq/kqOY3PZHKcoCzB6ELM/np+aENMvnyeld7lPAiBNAqzmgCtAxiZECfF6Fdb79
         kCl5c1gwWjwwegEwUm6SiT9wg+bsODhvMjQY4g5RfyrVgWHkTyMCYGjZT2cKKAno1oel
         81oUcpTUOQaZP+CtjThO01KARYz4Ljasr0/rZYQyZx3mWRtwP27SrT69efujZaRDVwWi
         ZFpXI0peHpqWJGQdoUTaJB93LISNFVyweZXHRYgJIXVCrooGIFKaze1XCVUCgkazpAtO
         JBJlnGXQqWWQoBD9zjMwJu/u7TDP1dpMiBeRA0Fqecag2NZFnapl4EDInpZ1KfYpLA2f
         M4og==
X-Forwarded-Encrypted: i=1; AJvYcCVcHbd9iegH/1ss/x/caL9A0jxTFCIvlQ5ZazWXD74SlQR4ihgB3tgOtIFV+xYWVwa6yfiqMeGWc8aBtDYN@vger.kernel.org
X-Gm-Message-State: AOJu0Yze1JowyXEw99EWkYA/2H8A01wM4Hv2XVCsi/ph92JpRNzqwRWU
	eTinm21THYclwcxKj6XsKlDE3VTZRjKaKRy3xBJZpehTpChUl9LySqkj
X-Gm-Gg: ATEYQzyf0jEq+b4x8wvqTgLumWEGzKGDaH0IKrda23bCxI4n6YbFj2yptwlSFK/wtZH
	QEaMIPBMcDNHzG+tGmXqRnK6Yy9KUVPPZhXJ35EvniXKSwqXa+EJOGWjSHR+YkFxJALI5FS3l+x
	wl/JHgFYmKciJJkqB7v3qjBHf8dgwtr9GwF486pSS0JSyBGPanckOlrE661DlsI/mlhFRTSFStm
	HNTQVKgz1NwlMUOjOUuD81ZqKJpKhog0FzbvqJykS1TcdE95LFCWhGC/JTtWElhuirQKJODFd2U
	K+sf0PNmmNTfFg11qYHlPkkt3xEXWr1xCS2r5yh8fI1QuqIxLXSAgT6MWUYKYDI8qIFpmuJY1HT
	oZlN62xxSA7+eu6wv0S9fRKsoVteKlFskWVxhJ2DM7qBmfEBvQZ+HHP35W1Nyf9rXhyblSqm7xS
	EmYPqQi9l6lGDOjZWBmIsp242vR2Y=
X-Received: by 2002:a05:620a:7085:b0:8cf:e0fe:f20e with SMTP id af79cd13be357-8d1b5ae8497mr88040085a.15.1774979005294;
        Tue, 31 Mar 2026 10:43:25 -0700 (PDT)
Received: from localhost ([199.119.232.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d0280374cbsm947500885a.26.2026.03.31.10.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:43:24 -0700 (PDT)
Date: Tue, 31 Mar 2026 13:44:08 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 1/2] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
Message-ID: <acwH6N56W_ULNe2q@rdacayan>
References: <20260330165237.101045-1-mailingradian@gmail.com>
 <20260330165237.101045-2-mailingradian@gmail.com>
 <ca6c13c2-4e46-483c-bc22-0ebb6db704fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6c13c2-4e46-483c-bc22-0ebb6db704fc@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101106-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A0C836F60B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 10:30:29AM +0200, Konrad Dybcio wrote:
> On 3/30/26 6:52 PM, Richard Acayan wrote:
> > The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
> > some SoCs divide the CPUs into different sizes of clusters. In SDM670,
> > the first 6 CPUs are in the little cluster and the next 2 are in the big
> > cluster. Define the clusters in the match data and define the different
> > cluster configuration for SDM670.
> > 
> > Currently, this tolerates linking to any CPU in a given cluster.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> [...]
> > +	if (cpu_id < 0) {
> > +		dev_err(dev, "Wrong CPU id associated with LMh node\n");
> > +		return -EINVAL;
> > +	}
> 
> nit: try to use 'return dev_err_probe(dev, ret, "....") in the future

Does "in the future" apply to the inevitable next revision? This would
be the first occurrence of dev_err_probe in this driver and the error
path was just cut-and-paste.

