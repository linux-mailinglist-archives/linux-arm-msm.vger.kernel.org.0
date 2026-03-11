Return-Path: <linux-arm-msm+bounces-96900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOC/OIQmsWnJrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:23:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5076725F170
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9F9731D2632
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748C3211A05;
	Wed, 11 Mar 2026 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h5/Hjhhc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1BF34C9AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216405; cv=none; b=oGiIAA0CQalr0nthlm2JV8IMk9d3gLFqQEuRKnI2nfOkvQzZaoa7EW1lc/dniO1f6x1xJBt3UPS3HkBsmmtGs8dUz0ekajoK4osV+d4r+3RtWC+o8dm+/WRGuO186uRB+1C0Oejl5GLxGDGgtAN33LVSP6QtyTufO2+gAhf3Lx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216405; c=relaxed/simple;
	bh=I5XePahDdZxkT2lcI/2aGwvT7jVpioZ3NcNMQHdU7Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEsxjG7ydjdDwJ21UBqPCl3Pkol1w5Z8QB9R5SgdmtKQ/+PjqAxVzNvyGpeDY3BodtTZvg7eEyy7/fAVOvNO3E4Pdaku1kuiZOQL/UumIglB+CU6l9UiW+xFqQi6RSVm6u+9LgEHfJywrUuxHdN6txhX1moCVSQjbvDTfNsZz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h5/Hjhhc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso124332555e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773216400; x=1773821200; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QqJVCEF9evLSw9CGf9v4iGyJ+/vqb8/nhU/YNtIqzkw=;
        b=h5/HjhhclbRrnH5/9ayteCfacKDvxrvJw4HAtGuduxqH7txBTyzUaQy8T5Svkngjnb
         N9eZtr5vmwuuV4Hl0eB4t6polvHUvwtti1ynhYBiGotkS7iQiLwoCl8C6W6drqqE5Xd3
         igdmjQcZO83solffJQsbzwH9XME6z+zWqxtLBz4vdr2AXuB+yQX521sJmAXdOrt8YTSR
         kPSKuLuSMkIZgRowxjT3eaOvkoTmknh68nZPqzt3UhBau9kyK6iLxUMcYSVyTNCSuqAv
         nq81IKZD2bsHvgcYwP+B0FUnbAgTyj5tfHE5xp3BBkBwEjWaiKIa0OYs4QRQqkW/gFvH
         8csQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773216400; x=1773821200;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqJVCEF9evLSw9CGf9v4iGyJ+/vqb8/nhU/YNtIqzkw=;
        b=wmoq1WT1+PjcUbdRb689VZ8p3k37nhNGG1kr8mtGQrIdV5C8GvbVUFIU7tyH/sE65j
         oTWi0NUevsBU21dOojD5lzbSmeXpg28jMvdfOH4Ey2KRz2WIq3rHxKUc3/2npxp5n3Oj
         lvH0XaH+42w8wjOL7km8Xw8vUvPxK1x33nIIV5tH7L917v/4ypwD0UabYI9vaE9teO6E
         /4CaLKTwu8Pp+6aql5Eswnno6NPWCn0BIAKYtF4WYln/bFtVeJew1om4SNStF53EuCsw
         v8x87nfxMpQi41h3Io+kqeeE2H9FFHOc+zWnSpamaYmNY0mxURh7AD6USH1qEWbDHQcr
         VIqA==
X-Forwarded-Encrypted: i=1; AJvYcCXO9SzhB7+EEAGxrsP1iRUX/l01vdr2W5gz1DcpMprw03W60NTjBVjRXCxaffutokZEQlzpS9hn/QYKmUn0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzde5yhxEJqrVr6nyMQGEb7cnVE7BcP8ESzeKs1wybJc0saAd6T
	3sX5Ah0Alhv/aBGBcvtcVMaaJapq2lpyf1aDgWbuxtU/PZ57xnM6kC/3JSK6mlSZbt4=
X-Gm-Gg: ATEYQzwg2piQHVpX4ts2WRDX8qlzlkvY3JNjBezcUYm5+3GElY4ElKX9xZB1+IFTz3D
	D7ZWiYAri6slqGN6KrwZs9HlfoFlamEq9kWwlyf9ak6h9OF9Tfw17heYfloDqLjcl7VyP7ECxkb
	M/FhDeRAEOZYhp3OhkAh8Eu7RkAGw04P4oBVE0x5kFnr6aApr4ZVXliMHnjafoeT3WomF1/FLIn
	McKyAFBPW2VP6UbE38/y8lr9tGhopZYE9YP0Z6nd7GGS5FOoJsDminlO7nFj1+KSjuMRUsH2Kpx
	oaDDlWH3RF8l//sFiKw2EDrJ83jV66PIwBCQu2iYEJuxqJEvOgw5m2N8lHcf3FoOSUw6RIZd4fB
	ackGTqWqt5O27qEXyYvPKT7iUJMz7AQVvmWv8pp9sWvQFZsUwvrjjpASUjLxBS20sjUuJShomHe
	igpSuwjWQzXO23jB3JMg4qiMNsvtpG1my9CDjEJI7/20P34A==
X-Received: by 2002:a05:600c:1f10:b0:485:3f58:da6 with SMTP id 5b1f17b1804b1-4854b0a55efmr29718895e9.2.1773216399585;
        Wed, 11 Mar 2026 01:06:39 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66ffe2sm30730665e9.13.2026.03.11.01.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:06:39 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:06:34 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v12 00/12] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <abEiiqKrn62Y_s1t@linaro.org>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
 <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>
X-Rspamd-Queue-Id: 5076725F170
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com,vger.kernel.org,lists.infradead.org,linaro.org];
	TAGGED_FROM(0.00)[bounces-96900-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 09:03:37AM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 10, 2026 at 4:44 PM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > This iteration is built on top of the v11 RFC with remaining issues
> > fixed and the mechanism for communicating the scratchpad address from
> > clients to the BAM driver changed from slave config to descriptor
> > metadata.
> >
> > However: during stress-testing I noticed that sometimes a transaction
> > would end with an error. The engine was indicating that a write/read to
> > the config registers was performed while the engine was busy (bit 17 of
> > the STATUS register was set). It turns out that we must not just
> > unconditionally append the UNLOCK descriptor to the "issued" queue, we
> > must wait for the transaction to end before we queue it so this version
> > takes this into account and queues the UNLOCK descriptor from the
> > workqueue.
> >
> > With this all stress tests and benchmarks from cryptsetup work fine.
> >
> 
> Mani, Stephan: sorry, I forgot to update the cover letter to Cc you.
> Doing it now here.
> 
> Stephan: I tried to use READ command but it would crash on sm8650, so
> I went with WRITE. :(
> 

No worries, thanks for testing this!

Stephan

