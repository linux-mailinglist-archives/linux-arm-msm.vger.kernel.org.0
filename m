Return-Path: <linux-arm-msm+bounces-99501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMoDOqbywWlzYQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:10:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF32300FE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E93843073F54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5DB38552C;
	Tue, 24 Mar 2026 02:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzYjxuNV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9957384232
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317912; cv=none; b=un/AwI0Rxf0I6EkZGncGHEkyUMk+5l67CMbeoUKS3drbNWPi2NwUlDKn/OgFjdyiRzv0l31GSCXepgImzYXeTuJl1VwXV413DykarjgWQtAVH0Xsve0aGea0DLti2e2sBAY5KyoDlXRB+n9m8JGIg70yoCE3iS9l+Vi/fNMGqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317912; c=relaxed/simple;
	bh=+ehVjjn+FFP1aRjNxMvD8VGxFjrfQtZn+7RGgcX7Sic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBx+owDZTyfNEiCNHcw+1qIWfN5AzmDXnX4IcrgdeVvTbddlXD+7qciEZ2YY7bXqBkm1eMNVAVeXWqxB7wpCoiebf5Yf3kmzKp9xo9OCAeq2CHj1wliYepjOhSyGdqrcxD2WrRY9G2+QHnfTD5V4UZusNlhIvzNHHTIL9osQLtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzYjxuNV; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cfc5941028so496320085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317908; x=1774922708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WhBxiKr+CpFwBrUC+deA+ndmr0D+vf1b3ZxKGdD13Q8=;
        b=nzYjxuNVWsy2FAJrdUup/mIJSbRkLFV8btqoBVKVP6d3j7kaRWMaVCI1a9kj5foQ6S
         dNkE2Ur1Mcd6lE2LZ5+/gkgtKM0ls0uYRXYuAvYgnJwg+bmjKkVlRZlObOn3qVfzTN8R
         HH4viLyYStE366bC3xc700XYNzdbUVq2FgELOFvyEMqN2gmUOAt3r4ZiWNVE20yvNN8s
         BZDDAHTmYUNlIhCFRyC4WVuL2lmUGpr5WNwEPmhwmvgqkyhcoeiw3yGJ/gahQExhMZ+x
         +q2lDIpIk6GrGVGXcvcrj1qxwqJSTezPv4CIOUaxx7371PuaZH8t9xo+WPcqSHRODHgI
         XPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317908; x=1774922708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhBxiKr+CpFwBrUC+deA+ndmr0D+vf1b3ZxKGdD13Q8=;
        b=K8NUup9yEcL8X17Dkqi2rKfSHuXD/q8tTyO0mQC7mppwBSMdc/wYZN8pA9nnbVYh7e
         oX37IU7G3cRnBi6wpWs8kYZvDXs7EMlRRbr055mLEazGq8uQMId+reAqHQKEfj7rV9ei
         L/h0ASLjUcn00Ti7BcHCABfB9Y+LlezCyapWyc+LjoqfoXYXWjRJM0s7P7AplPfsVdui
         i0JLnob/4FTM+qNL9EsxbsyF2B+o3twkLiQJfUweFcEwfXXS+xn+olDcXHCP56LGpHue
         hRHyalJS0Co1uqPf4URPLKSfdz0JjYjiB1kHfFshPWe/S2blOIzYaasN9LNoo8ZITuCn
         Vi7g==
X-Forwarded-Encrypted: i=1; AJvYcCXxfCiWEZyicbl8c1VirXZAAPAjiBegxjThDgnXxGdb1NB8Fmo7yE++Mu5wrIdn4g+j0Uh0LcXr2qoZ51zZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyZR1F1Qn2FSmWFLJ0jtSmQM6lvP4oTbjTSG0kr+3jvk+HXqkef
	RUZYeTKaqcU9rnsiTmSg6v4CS5U8Ht1m9buyNVtBRBgU0jTJ+LWf+D14
X-Gm-Gg: ATEYQzwatNMdMO2PgPXnIhSvlVPRah4jS0SUZkMffBZzdK0Eb+ru/c8Iyb7RorfyG/3
	hjcOmdOPKyYvVwanPKZcjITUI51xNZVexXi2bb/PstfEey0T81AdDINA8YYEVGnJDjs5znQ1u47
	GSAxiCOrxX2KOl5vPr0Ec+GhEQ6Nx5/79b2E4gJgRPhGyzx91jzLF/YTxmVKL/84QFQ9a/ggcj2
	sIPw3d4bQ6+u5PFJRz2080wkt522WhUEy/Zdj6NmvEqfhA389C0a/RXr6YsNGHasumffO5MVq6d
	Lr/eWOjzDaV3OOlGyThDnc2FnvqUuaiJXyyCiQrr8fUTgHYc4RdHmxnh6B9GsaBUY7rI7vwEiz/
	VS231c2ob7+HrksVGXl2Kya48GFkg9KgSRpsTwTNlKQeZgwSai9NTKhN8KKRywFkEPd8vit/zXy
	5i2lcS/hLrC4gfFh/h9yT8Tt6XBzbyeCBjb2wmxISToUvAVNl6UMBDPi/KjlS4BWmjBzQOSwFD7
	lWIEp8u7OVXMAM=
X-Received: by 2002:a05:620a:4543:b0:8cd:bfd9:e2a2 with SMTP id af79cd13be357-8cfc7f33feemr2140906985a.43.1774317908192;
        Mon, 23 Mar 2026 19:05:08 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cff5d486basm50081285a.45.2026.03.23.19.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:05:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:05:52 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Robert Mader <robert.mader@collabora.com>,
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <acHxgIsyPiQTeqCB@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
 <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99501-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,collabora.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1a:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7FF32300FE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 07:26:47PM +0100, David Heidelberg wrote:
> On 17/02/2026 01:27, Richard Acayan wrote:
> [...]
> 
> > +&cci_i2c1 {
> > +	camera@1a {
> > +		compatible = "sony,imx355";
> > +		reg = <0x1a>;
> > +
> > +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > +
> > +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > +		assigned-clock-rates = <19200000>;
> 
> Extract from #sdm670-mainline:erebion.eu discussion:
> The imx355 can operate on 24 MHz (on both Pixel 3 and 3a), but Linux kernel
> driver can operate only with 19.2 MHz.
> 
> I assume it would be worth it mention at least by comment here.

This might set the series back because the devicetree isn't meant to be
written for specific software, but it's included in v11 because you
already asked twice.

The frequency could also be stated as having "better software support"
in general without mentioning Linux as the reason.

