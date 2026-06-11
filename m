Return-Path: <linux-arm-msm+bounces-112783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B4exEu3pKmpOzQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 19:01:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7165673D03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 19:01:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=dgf2Ry88;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112783-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112783-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09C36307D761
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A914279E3;
	Thu, 11 Jun 2026 16:57:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B95042189F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:57:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781197070; cv=none; b=HoEC8x6nPrmHSQEU3qHVabqtaOuw4wN/HQL2Z0SBk7bLyZardcFg1QayjYckQe3Twml4WQPxGI73/ZdSDBlhCMtzk2FiLjvVt47qLi5dD+VxvF7TiEqyC0wKCYlIl/k3X1K3miGRMRSRN5Ene4ZVsgdSm7B5KNB5eyqXue0J/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781197070; c=relaxed/simple;
	bh=rNBqmdI32h2ItfYChnrouN6UPvYm8fGizzqJIFfXIfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3kWbF7mAJSYMtqLI8obYDx8ba+NJU8dhympNA1PCDo+YriyXp86RgHonfQ96QV6MhdxSIjLxr+P6x6Ue8UPul894lnc4zQtxPUQP1MWYl4Kacl6Fhckco9rTC2tUHjdE5A/8bcIU5ILOYbLU/kP29TZXt1A+961jMvFHOiiShg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dgf2Ry88; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso163215e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781197068; x=1781801868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6VZrzStJ4BscFJtA3k9EjpEizqcPtVvIB05nAc7hZ0=;
        b=dgf2Ry88oGGGvGWzhA6bcdDsplonV87NFrLEIE5IYYT328d+RiWfj6hQpgJcHUGczT
         jQkBWlCkDNSW5elCHb1kUkZMUtvLGKJb5B1Yr7XJowEVv7d0f3ice3a39H2v5dZNQps3
         XmvE+Zi1dgG1uqUTn/RUAJVwX69bCPfe4UiPKIgLFLyr8MCE6AewqEiVyx67X/DaynFO
         8KIrZ9LS3nBkWpFSJLUOdCfanNZF0fY2NzOIKLpto2eBFUbaQPpffFA2nIBPZUlfoYGJ
         RCzt3p270gitckr2hxi5iXZS3RTMPRSgfl3ax16VTHhekBvtyTNsUp6c9OXf3KKl3ALf
         GWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781197068; x=1781801868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6VZrzStJ4BscFJtA3k9EjpEizqcPtVvIB05nAc7hZ0=;
        b=kMvMvLNRRJrnJZNlpI5ZEnekiplsJbSN3nkb/jghjw/HH5dKjvqcp8C6TZ+bCCewZA
         q/5oSe7I/GoT6DF0KHE53XTSvQpQByLobylKV0tsSdZp3PQyHqLK+SvtLFuiRfCZYefk
         9DIo8i+DLVTmb1OCw2JjCU6tcEqXt7cIaYIVHxVPvfTHD853i9lNVIEC+8aA+DnNkPI9
         kUzd8Kejm7l/TG/+1HExRET9aRx76zhl/VbKRctzcWMBhYtCN5rztuNSJxAu0sIvfnFG
         wZVY+Pms270AgybYls5nB5Z8Yb1cMroaJ0LoiQXZVmlbsEIMFBp6+Iu21vtofZwTBw3T
         y9vw==
X-Forwarded-Encrypted: i=1; AFNElJ9SOKBa7/eR3C2RODhw06y6WlikMIhVP/mLARHgPGyO6XgaM/CZOXEajfgO3lu0YzC7SvbJacRrXnjyj7sg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1vY9n1CugpyTc1kpj7lExEVtQt+mIUzGrX6GrJMw2Tl50iWK2
	anvdRy5Mbfw6Fqnd/lxxx1EtGbxXxXHQjz7YiRuCnpNXZFuFV5TIBU1VJ0SLdM7gppPC+bx66zx
	LvSTSzzI=
X-Gm-Gg: Acq92OFuhvdpd5/iYb16J0BaYuNa+Gqs3GOKHzshogmqKj2QVW0CQlTd5oXsB4uLpxb
	59SftpwM35P2Itc8SIgP5KyTVt+LRZFWQ06C3cQgb/U0wWX8xd4BKw/PfhGkSzKujs6tAgR9Qxu
	2GQm8TIg8hDLnbp/zzlpFrnGnZlpcMKO/jzNOTiC+IqKa5uqKDukfWrb0OkjaTvRteUMrfiI92s
	dlsQVmfTJl0cZXhGU4TywxuPJ5hRkJ4zjUCil2jT237XZ5dHkJ2pB2msLqz/g/P3bwN2ygroOMa
	yRaxqnR7bbW0vY/oyGKgDHdmQgoL4fnI9rOvGA6nz9OIDWfxZaoh1I09nNb6yfejI+YX7pCjeXD
	tZXVMX7q+kOpu3Gq1Vw52nG3r/sSxOA+n8URKnPoFODoDdKzlXQ+mtxaeTaqszBLumJcyADKPQt
	aOUkBUWUlt11cNZQylZsYu/J1CzwyENfYnWxY=
X-Received: by 2002:a7b:cc04:0:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-490e5619a8cmr39855435e9.20.1781197067940;
        Thu, 11 Jun 2026 09:57:47 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:ff23:71de:3dfa:4b53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606c10456esm150482f8f.37.2026.06.11.09.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:57:47 -0700 (PDT)
Date: Thu, 11 Jun 2026 18:57:41 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
Message-ID: <airpBYZ2pRdNaE1v@linaro.org>
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
 <aip3_fyE8tMtJZIW@linaro.org>
 <17bfa853-d0a6-4f83-a164-a17fb02f67a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17bfa853-d0a6-4f83-a164-a17fb02f67a6@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-112783-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vishnu.santhosh@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7165673D03

On Thu, Jun 11, 2026 at 09:31:06PM +0530, Vishnu Santhosh wrote:
> On 11-06-2026 02:25 pm, Stephan Gerhold wrote:
> > On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
> > > +	bam_dmux: bam-dmux {
> > > +		compatible = "qcom,bam-dmux";
> > > +
> > > +		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
> > > +				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
> > > +		interrupt-names = "pc",
> > > +				  "pc-ack";
> > > +
> > > +		qcom,smem-states = <&apps_smsm 1>,
> > > +				   <&apps_smsm 11>;
> > > +		qcom,smem-state-names = "pc",
> > > +					"pc-ack";
> > > +
> > > +		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
> > > +		dma-names = "tx", "rx";
> > > +	};
> > This should be a child node of the modem remoteproc. See msm8916.dtsi
> > for example.
> 
> Thanks for the context! We actually referenced msm8916.dtsi during bring-up
> and initially placed bam-dmux as a
> remoteproc child. We then hit the issue that the driver was not probing at
> all. After some digging, we realized
> that qcom_q6v5_mss.c (used by msm8916) explicitly calls
> of_platform_device_create() for its qcom,bam-dmux child,
> but qcom_q6v5_pas.c which Shikra uses has no such logic, so the platform
> device was never created.
> 
> There was a prior attempt to fix this generically by adding
> of_platform_populate() to qcom_q6v5.c
> (https://lore.kernel.org/all/20251223123227.1317244-3-gaurav.kohli@oss.qualcomm.com/),
> but it was blocked
> because GLINK/SMD edge child nodes would also get spurious platform devices
> registered for them.
> That series remains unresolved at v1.
> 
> Since your driver already manages modem lifecycle independently via SMSM
> state bits without remoteproc dependency,
> we moved it to the root level where of_platform_populate() picks it up at
> boot, and everything worked.
> 
> Would love to get your suggestion on whether this approach is welcomed,
> since it needs zero driver changes.
> 

Adding the bam-dmux node top-level makes it impossible for userspace to
associate it with a remoteproc (for this purpose: the "modem"). If you
add it below the remoteproc the udev/sysfs path will include the
remoteproc and you can tell that the network interfaces exposed by
bam_dmux belong to that remoteproc.

As you noticed, having a generic of_platform_populate() for remoteproc
nodes is problematic, because usually subnodes are remoteproc subdevs.
Also, the cooling device use case in the thread you linked doesn't have
any resources attached, so the root complaint there was that you don't
need a separate subnode at all.

I would just replicate the special qcom,bam-dmux logic inside
qcom_q6v5_pas.c. I think the motivation for BAM-DMUX explained in commit
59983c74fc42 ("remoteproc: qcom_q6v5_mss: Create platform device for
BAM-DMUX") is still valid. Conceptually, BAM-DMUX is a subdevice of the
modem remoteproc, since the remoteproc is responsible for powering the
BAM-DMUX hardware on and off. The fact that BAM-DMUX is not a remoteproc
subdev in Linux is more an implementation detail of the current Linux
driver. This is independent from the model in the device tree.

Thanks,
Stephan

