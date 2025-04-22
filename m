Return-Path: <linux-arm-msm+bounces-54954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE29AA96A40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 14:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DA45167E87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 12:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B904278179;
	Tue, 22 Apr 2025 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dU+NAc9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF2981720;
	Tue, 22 Apr 2025 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325524; cv=none; b=IWSn+0yHOmB8f3TotSb8UQnSxGJ1sSkCjvQtCleW8nJNVM3VhYKRjmBEaSAVQDPLQOI8ZWIKQSsI1K/iY0rjlVMA4d+XDT6YuLZNxJSDk8EN6nJ3zvXfJGWYlO8yAdiCF/zNfIfsBX1nEznwE1/XFUo/xSNAVf6MKLyRb/3Vjgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325524; c=relaxed/simple;
	bh=8jZdifvOtur3vwJnFuo3KO9Vc5YckEa1p+SN/buOwcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tf0Wph9bMkW2AVMMeC7zlQJWKclucBAgMAvcJ38AK5eCwjGjPPoEO7HLRLTV2jDyV5+fPUIuGfneNX85/3Gd9kT02jvK3Otp8i5ShPq9HyyH9UurtDBqRDnZ09Y4Kt3yrg2HjMSmTtYjxCKmWPsKBMwjvLOoAvJBVPpAIX3cwHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dU+NAc9v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B173C4CEE9;
	Tue, 22 Apr 2025 12:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745325524;
	bh=8jZdifvOtur3vwJnFuo3KO9Vc5YckEa1p+SN/buOwcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dU+NAc9vzaSsBFwi9oFbiQWujxHuH3VoiMgMHBhUvuO5heiDwtApXHeBaaPdS2tr5
	 qYtAIIZhRrnzQoOUuTkvP69wS6Tas82QhGtSHh56HBdAYLwEOBzWR8z8YYKFaqBSmQ
	 9sjSG4xgXVQPdUMx8qfCxP0/ybaAmAjrwZAWP9tMIDJtYqMZqcy3R/vNqILmLw+FWf
	 2JGiRMLxgjzEVt/TSoqC7eYfWqI85Vp4Nxx8u0/LF78bSZRdW8ynKwy3jk4ckm7zQ+
	 VYbTWbwMcLoK/XE+ifkdIil3DQb7t2CA+xkzHSTDeEmCROv4n2YhUnOPSAL0iBNzJj
	 T9sssQaObA8bw==
Date: Tue, 22 Apr 2025 07:38:42 -0500
From: Rob Herring <robh@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, krzk+dt@kernel.org,
	mani@kernel.org, conor+dt@kernel.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	beanhuo@micron.com, peter.wang@mediatek.com,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 2/3] scsi: ufs: pltfrm: Add parsing support for
 disable LPM property
Message-ID: <20250422123842.GA896279-robh@kernel.org>
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
 <20250417124645.24456-3-quic_nitirawa@quicinc.com>
 <0a121c0f-edcb-4d5d-8427-f1eddddcb9bc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a121c0f-edcb-4d5d-8427-f1eddddcb9bc@quicinc.com>

On Fri, Apr 18, 2025 at 10:13:46AM +0530, Mukesh Kumar Savaliya wrote:
> 
> 
> On 4/17/2025 6:16 PM, Nitin Rawat wrote:
> [...]
> > +/**
> > + * ufshcd_parse_lpm_support - read from DT whether LPM modes should be disabled.
> > + * @hba: host controller instance
> > + */
> > +static void ufshcd_parse_lpm_support(struct ufs_hba *hba)
> > +{
> > +	struct device *dev = hba->dev;
> > +
> > +	hba->disable_lpm = of_property_read_bool(dev->of_node, "disable-lpm");
> > +	if (hba->disable_lpm)
> > +		dev_info(hba->dev, "UFS LPM is disabled\n");
> How about keeping as debug ?

Why print it at all. You can just read the DT from userspace.

Rob

