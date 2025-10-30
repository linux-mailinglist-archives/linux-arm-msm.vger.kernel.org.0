Return-Path: <linux-arm-msm+bounces-79764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AFC225E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 22:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C7814E403F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 21:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26786329E76;
	Thu, 30 Oct 2025 21:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkZ3/dam"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539882F12DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761858239; cv=none; b=VRwlsSmvt6fzZjSeh4Yr9a1LmBPtr4WsdlGCtZKBNee9gp5BYTDyUKnniEvBkSQzLG2TtYUw/peg4Jm0qXacK07eCViVTh+HZn3o9a1L+zucoyU9zBIATC956xp0RAvUnj2w/MLJ8tYtosU3q3ZMFJ2HNsNZnWF9Wm2CqkYvhDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761858239; c=relaxed/simple;
	bh=Mmg0QcOckoARFwLJXtWfFSkFuqQoLOpNDnE+ivjKx9M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KKxt+lcHb808484ikFbq/6OHib4lxlsmjIx8xXz2mtEu5Rm3kdD3IrVvigFcDyNrk5PG2BQQFzIBH/qZzNevWwxLuFrpbdYEvmiSQYHLf9Xrs6uTjuzT6BRNGq1cXbxLjmjmo65IHOiLR2eCj6hmrE61OzWm+V3IR5Yz+niywRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkZ3/dam; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-474975af41dso11128455e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 14:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761858236; x=1762463036; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mmg0QcOckoARFwLJXtWfFSkFuqQoLOpNDnE+ivjKx9M=;
        b=UkZ3/damTIqvOWERo56XKIBZCdAm9AZkcsyynHOpmH/6mG6U03VaSjqxyFUPJBm0bU
         OP0F0NyyiR9YmK0u3w0Zi40A2+yOI85fEN60jSI6KCDZvrdh/lFK3o9+PYGMLQCOrW1s
         YZUSxmrVnjiGt+7hmpT9GHu2SzobUSEl9seEzz8gCMEqGF4ShmVRn0br2nOSM/78BEVt
         QGCm5Ju4UajqUY+AzPT++Q/n8owf7oP0nqteiumsbuu0WtM76lpdZmpdrmVau3Xpq2Us
         2DDpL30cNpE8shiEl3dIst+Fv62+t8JXpxKtPXpgBhPDyIPsN9/xuK1zVZTSX4+OHVF3
         pL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761858236; x=1762463036;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mmg0QcOckoARFwLJXtWfFSkFuqQoLOpNDnE+ivjKx9M=;
        b=q2fQZJDZUrVCmDkawrQa6G/Lg4Yms2OlfZCGToHSyjAWWwD6U5NPnsD4HDxYJiz3O/
         GOvZ+BFtU2P541eavJmO6OO4gy8oTFgFMvwxehy4a0+vPIgBv3KG5gd6Ig2rbrRzYYxP
         qwoiC1HHGqjStAQKSk6wDMRIqUYdbPfbfIWZDIb789HhqUChX3FJVwbO7fraJpOAAbux
         EQL8RdOt+ej9+sFz0woYc7ROPN/reBX4Q5Wddo5BjQgmFn85P833RYPlwb7WUB4ZcNue
         ChpEodQQqbFE1ITEIM8O8TagUlyN8Kur5ranQlZ7MlOh2Oq+LMPLAuaLe9dps9e9XnU7
         ZuMw==
X-Forwarded-Encrypted: i=1; AJvYcCUID3b2/AjZDURkmjGugXZx2NF/AukAcUFKp9e6AprwO2Vh0m3vpJuw8INbi8xTPJOhMQHixe2Ac8s5ljn0@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4Yun435iHketULgLrbMihsBz8GrlwGIcfKKd5RkSS0tvf0X8
	y2iOy8xxfoprtZd4X0P7n9NYGxGKeOBrpNqCIZbJFXNPEWbKP2mJApD3x/Zr+mNb3WQ=
X-Gm-Gg: ASbGncs7yuLdm+Vg1ENYyQf3NPw7lQybB9ZjruDw+Y6z9H7Mzi8wp0s7WxodE6tnCbk
	+TTMf3sql8v5Iy/lxDW+itW/lNKx7zquLOoCiMUEIGnlNZnHYyJyaQRleEvCChz+N9mcGz/nszl
	n6+3vrGBk0m3NB96vu+/pv4TpKQeRdGIzQE8+iQA4cGy6XTzy3oNzjrgKb1kKqCnAmloN1KA7CF
	CpiXraBGc02joEdF2IcbYSPGVLFiSHKY37zvmG0LKo4pnY67Fcjnh5biKJYdLeq51cKYtv0H3PJ
	IJKYap4dRaUg8EEFrWXcczLiOqk2G9cVB1FXqdAW0vP7Zwb7mw0F8Ubsn0NKfOu4UXgqBeBUvUN
	gg28HJkxuter9YX4n4tBP/xlQ7JyOBdpO6TGvomHdxcfB29iwFxdbd1fUqYo4UFozFu/+kA+Vpq
	26hSIYRHIpBvbXmHVy+87ls/2Pxw==
X-Google-Smtp-Source: AGHT+IGkeNaYKvyK6RfsmW9P2I2Bei9/3fDZq7zhXE2U6MX7ry6sRZVC9VoMigtpV+m4XtidjifL/g==
X-Received: by 2002:a05:600c:83ce:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4773086eb33mr8700635e9.26.1761858235643;
        Thu, 30 Oct 2025 14:03:55 -0700 (PDT)
Received: from localhost (054722ac.skybroadband.com. [5.71.34.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm34127953f8f.38.2025.10.30.14.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 21:03:51 +0000
Message-Id: <DDVYM9SMCT7O.17T5SIB9IEED4@linaro.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: pm4125-sdw: correct number of
 soundwire ports
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>, <srini@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>

On Wed Oct 29, 2025 at 2:46 PM GMT, Srinivas Kandagatla wrote:
> For some reason we ended up limiting the number of soundwire ports to 2
> in the bindings, the actual codec supports 4 rx and 5 tx ports.

The reason is quite simple. The available _limited_ documentation at that
point suggested that there are two rx and two tx ports. There simply
were no better docs.
If you finally got access to the right docs then it is good to fix that.

> Fixes: 88d0d17192c5 ("ASoC: dt-bindings: add bindings for pm4125 audio co=
dec")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

You should run get_maintainer.pl script when sending patches and check who
should be put into c/c. See [1] too.
Here you should run smth like this:

get_maintainer.pl -f Documentation/devicetree/bindings/sound/qcom,pm4125-sd=
w.yaml=20

or check with b4 how it works.

The c/c list is not full.
Perhaps this is a consequence of putting all Qcom audio related things unde=
r
one entry in maintainers file.

Best regards,
Alexey

[1]: https://docs.kernel.org/process/submitting-patches.html#select-the-rec=
ipients-for-your-patch


