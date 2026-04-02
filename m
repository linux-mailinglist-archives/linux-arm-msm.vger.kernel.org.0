Return-Path: <linux-arm-msm+bounces-101404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJqVGuHAzWnwggYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 03:05:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D2382231
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 03:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D761A302A7C6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 01:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A3F309F1B;
	Thu,  2 Apr 2026 01:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6siG1Eh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A08423A564
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 01:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775091934; cv=none; b=TEJg2bdltqYE1uRMCKyXcKy9YuuKc2Vbq4gdsDcTsoZ6AzzLJN2ZexXPbNJRIP6XXX8/bSjC2wUPC46devJS5F16Lm9Ap+leHLXuYLm5VCH73uIXQ0rjKx+U/2Zlj7MAnHoYj4BiOG60gNglBGqetpy64IerRmuXBkY+ujCXYtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775091934; c=relaxed/simple;
	bh=am/OmExRMs6+4inYpMeuvlbO5iWLZZ1oD5RIyvgeXuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWqyGy1vZwGrtYRgGIDqdBoDBr0yNkxKjWUlJbooKdOkSr6q+hk2phbMaAQGcRz+rPizvkeHVktlkEGbJ8bShVzcLsPqY8kJj/gDzVhwD9++76gO3eXGYfpV5+KOqUJvEvhuAKRdTGy3IfjgJ5XD9aLOOtWy7owjVXeoVK5A9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6siG1Eh; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50b268fba9aso3112601cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 18:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775091932; x=1775696732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/gHu0FdfX6ZXbcJGvtqN+jQ/yvbzkeHZ4ajTT5rTrk=;
        b=E6siG1EhVTKGOfnj4xwH3D/Rw5dWilZ0kNDXadAQBVOQJzl0vx/FVmSwewipWFENKA
         xo+ztQgylWLADpS4vH9Sb8hs2mvQzuSgoIQtOLg/AeV5KTNrNMU+rU/FQrTuCd8ZDjQB
         E/YSSTSELWrLmk7pJdEebIIUA7v8Y0UYXgHR/YsLTN6kVqxJI1S4jXaAB77nvwWOh1IZ
         LFrMJJuYXZU/QqOITLSChuO3mUAzyGXkidhWBNNs2aa52sGILDCdSVMcOAffOMFgyBNY
         JFWcq3yG/mNyNgr8VYcsoFVS1cGo69MTJucRPgN3xo/CfYHa++nejqkjf0tLK/ZirJs1
         gt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775091932; x=1775696732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/gHu0FdfX6ZXbcJGvtqN+jQ/yvbzkeHZ4ajTT5rTrk=;
        b=jAoKsTQYXl4NYXu41N0SeUcZr2oJry/GpbEnx0G/aes3F6ko9A85iZ+iV4WUrKnhWx
         1IwId9xp2gbnleIPspNzqG659JqXGBDXND+mIzoDHYQ6X1tTXOXKFk5VdAw2elVjtk8f
         3TmCR8Wg5nkNLmdX3HAAkp0cGWohMVSYGgpjmHszpguV+6yMILbEQukmR6R3G5AZEQoY
         jyV1Idyy1aubvfSprpKjhPP8vntUBau84CQXFxiTRXmUE9IyCzYe6eUW1NRDfX4q99+M
         ivslCATy/QmPAP/zBU9MIgT6B4yMO/JPZW6WBadW2SSnB7a15B53gLyjBgG76W+M5fQA
         ZgHA==
X-Forwarded-Encrypted: i=1; AJvYcCVhbzYSfvp9svs4PwhyhLq6l0WqBbW+Oj2/DOZgVtcankopSCaiVnaXKlHNFgPMm8Bj+31TG4xySTNaksNE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+LmO6ETRPmt1WDNy3jfKynBMSvtZYBOoR+ArwdhDs0vJylXX4
	E3MiNUn8hnebbwOyDQnzJ7yPbnG8um+4AIzwE92eHPf2VNyXn0WZ4b1v
X-Gm-Gg: ATEYQzwsSiTotIjcRGcbHbs1LwiC/dL0rxZzOUxJ57DNW2ZwRL76eLnUgLoj1pTwdMr
	1NNfQ6MXWUOgFTPTBLhlZ4WEFxSKG5gMmbYBhuGHn+7KUOKTuoA7lgAC4i0Or7ibcdxbi/EMBLp
	jxL7j/PneYyR+jdV3L+M5DkpdpHWEJCi0yWpiVwV4dslt2WFFoiIgRLOYHtXUrURj7tcGMIkEJS
	kSk97YxV5awnakJdfoQDBc45jg/GDuoWCc97otJQfhOxV6WKercX2dsKsQPH88+hW6qVOGb0CP8
	vawQKw4k5jTeOA9v3b1AIkJ1vtpMSqOi+e3iqfqgoqMuVQX9MzjdQpm6dz4AIJhRuM6i9cCuZga
	plxlb07ZV0KgxrE52dlrjg4h4Ltd/3gNObYWICROGLzzfaVGzeOBDw2t5Wlom7mHjdkI/Xu5sWp
	woKXI7SMKoLC/FU8yEFF11GcPo3g==
X-Received: by 2002:a05:622a:d3:b0:509:2455:2b53 with SMTP id d75a77b69052e-50d3bdcc8cdmr85646001cf.49.1775091932321;
        Wed, 01 Apr 2026 18:05:32 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b1a3fc7sm14217521cf.5.2026.04.01.18.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:05:30 -0700 (PDT)
Date: Wed, 1 Apr 2026 21:06:06 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 4/7] media: i2c: imx355: Restrict data lanes to 4
Message-ID: <ac3A_m4sKyJHa_hT@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-5-mailingradian@gmail.com>
 <3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101404-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD8D2382231
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 12:37:14AM +0300, Vladimir Zapolskiy wrote:
> On 2/17/26 02:27, Richard Acayan wrote:
> > The IMX355 sensor driver currently supports having 4 data lanes. There
> > can't be more or less, so check if the firmware specifies 4 lanes.

This patch is superseded:

v10: https://lore.kernel.org/all/20260311020328.57976-1-mailingradian@gmail.com/
v11: https://lore.kernel.org/all/20260324020132.8683-5-mailingradian@gmail.com/

If my workflow somehow caused you not to receive the new versions,
please let me know.

> Does IMX355 sensor hardware support any other number of lanes?

Actually, I don't have hardware docs so I don't know. There can't be
more or less without driver support.

> 1) If no, then it makes no practical sense to check for data lanes number
> given by firmware, there can be any stored value, but it's known that the
> number of sensor data lanes is 4.
> 
> 2) If yes, then please return to the sensor dt bindings, and reflect any
> other options, right now it is set strictly to 4 lanes only.

I think more lane configurations in dt-bindings can be added as they are
discovered, either by reading hardware docs or by finding a board that
has a different number of lanes.

> In case if
> 'data-lanes' property is omitted, you can use 4 lanes as a default number
> of data lanes, and this information shall be documented in the dt bindings.

Later revisions of the patch require data-lanes.

