Return-Path: <linux-arm-msm+bounces-92540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDZBHRzii2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:57:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB8612095B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28C4030138DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 01:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72322D4806;
	Wed, 11 Feb 2026 01:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3mjtpcn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E902C1590
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775064; cv=none; b=pw2THZAXxNXeVaXwVshxEGqg9t8FMxUYQVuG4/LAcfRO0oMO4a6YVQYk4SKPdWJW5x7ZRkQBBxNg05tKZmK9Dlf7977wu4TRUq7nmEVi5IBwAYSTjyySqdOhUz88A4EEKV9Es5+Jt8vt4xAfycmTrQAN7gIBmhKlI3iHcCVOxv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775064; c=relaxed/simple;
	bh=Gc0gOaoHzXbYc7NYkFtpNl/sc2DX8b0S6Hs8q7uqAEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3+uALbh9KqYxMPrOVPYa79GD3PETX03lVw3L8dy3y7ElpBK9ecNIMS1Q0Er7iZ6GVN0Fbf3p+amHodBXPCwFMTkRrNkzzk04CwzAZ490jstNMk/cdp3GzU5yvoJq5Uk3kSgFkOFQrbtwDt6/nnAwK9DfZoba865qwmN+/0CS/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3mjtpcn; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5014f383df6so10947461cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 17:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775062; x=1771379862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fhFxUnx/Epygu+crt0JPvhltwHI+RIY/8wqwIdbg8HI=;
        b=R3mjtpcnWWQOfQ4TdWcIuKP3u614U/xcFycKD8nk+dmNgFK9CFmh1sg/Ce8iYsUHRY
         St53F04VYd6B9iIirP9tuZysjkIX34juuec2RWRx5P/tGH0VbJmKoYoL9qdulwzp8viq
         4kC9UAYVKkUGVWNAiZr4jOy0fMnDE4gk+APhdVcPr4a1n3NySja1WLwMYGYy/21sJ8J5
         L9ATkllnlnBtE2pQJtv3unTS2XJhcLlePvivx8xKa/LJLBkKQd/KcQO5h3OLme7gDYly
         YpJob2u9hcF+betXPOyXaqQGpo3wE85zRpEVwa4AsW8k8HG16nHhQuAqAFlmGLQ/Efjo
         dz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775062; x=1771379862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhFxUnx/Epygu+crt0JPvhltwHI+RIY/8wqwIdbg8HI=;
        b=BgxylcJU8L/8foDWkTMAIMRBYcAXvyQAl4C6cg3mHpM5aggHKm4wumE9ug3lcVnxWs
         IbDv/9lihfNqa+ODHu3xoK0PbmzcAgLx7YE1sVc/wZLLw7CWBVpScjqkrav9k5YKaPGP
         v0gyCidymNiUA4nuZIjmGQk2va+CtbCGXMio0QbvtjpLz91k+2ikztRa+TSfi4jon5Hp
         q1hP65QjOYnntn6ZdEYTkmmEKcPOer+FRLZqlDLfsjPFh1ROFyjbWGzcWJiAivG3u+UE
         1MBGx7XUkCyOhfo4c+kawnWCgTF8dp8azQfdPaWzlns0DnAp/d2+vm5+eOu7RhertaWw
         NwPw==
X-Forwarded-Encrypted: i=1; AJvYcCVEYR5zB7pX9QR3cDkb3oofqUpdp0dULuz1dpyYZMCzj1UKwv8RH4n6nQQsJYNJRCRKXOYaVFI4RjVyl8mm@vger.kernel.org
X-Gm-Message-State: AOJu0YzDdDn26PXxF9lQQYUVpTxeOGQEKt3zB6myLtMZRLyS1hyhKbAo
	CgZrp2E0+H+CecLmUB1KFNsp8sQlXf/MRQEw/ib5aj2AMV39UbGRTXB9MdxZfw==
X-Gm-Gg: AZuq6aKlJY7XVunTFdt6C2lPzZiWUqSfYwnmsos9KBoE6qtV5th+MgBu5OArDlTp8vV
	kdB0EHS8x6+eQdiXcpLl/m7dgqcO7YRuOJM9hyK0EdlaFTCxzS5ZkVLtV1Iq702zoBiND7H8k9r
	PxR5AtXDhvTMSz5jTf3A+E2bKdHZoB24y56+dUjlGFzup4WZn2QuRF5NifFILkDQVdEATm4tJHl
	iAai+pATWvm4hQYk7l11GEJFx/owPEFc66XnD54S6NxEOOfQX5Lo2ZehOpZMLIeJoLGtf0exhLF
	k3IDFILesh4W5E/GZvOCgoiu0IW5S/CA8FLNDDzysOpX8xVoMx/8GtUQ2o9ELIrUzmck0IRRwQE
	G3SG5e/mn2aocje5ZZarZGudkLU+qhzLU2ppHzLuPetoxER5aXqxXdtLUICKO+KQjeIm1ol7OjF
	WCikpMnNNEHBFDrgfRsfrS0EC3NQ==
X-Received: by 2002:a05:6214:d8f:b0:895:9df:cea5 with SMTP id 6a1803df08f44-8953c80675dmr256086986d6.27.1770769732356;
        Tue, 10 Feb 2026 16:28:52 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc823a4sm2007496d6.8.2026.02.10.16.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:28:51 -0800 (PST)
Date: Tue, 10 Feb 2026 19:29:19 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm660: add thermal monitor
Message-ID: <aYvNX718diaXDsBy@rdacayan>
References: <20260210021819.12673-1-mailingradian@gmail.com>
 <20260210021819.12673-4-mailingradian@gmail.com>
 <e72ede03-94cb-45c3-95e7-63dff0ca3888@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e72ede03-94cb-45c3-95e7-63dff0ca3888@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92540-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.13.72:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 9DB8612095B
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:59:20AM +0100, Konrad Dybcio wrote:
> On 2/10/26 3:18 AM, Richard Acayan wrote:
(snip)
> > +		pm660_adc_tm: adc-tm@3400 {
> > +			compatible = "qcom,spmi-adc-tm-hc";
> > +			reg = <0x3400>;
> > +			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
> > +			#thermal-sensor-cells = <1>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			status = "disabled";
> 
> Can we enable it by default?

No, the thermal monitor fails to probe if it doesn't have any channels:

	[   17.728926] qcom-spmi-adc-tm5 c440000.spmi:pmic@0:adc-tm@3400: error -EINVAL: get dt data failed
	[   17.728945] qcom-spmi-adc-tm5 c440000.spmi:pmic@0:adc-tm@3400: probe with driver qcom-spmi-adc-tm5 failed with error -22

Triggered by https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/thermal/qcom/qcom-spmi-adc-tm5.c?h=next-20260209#n945

