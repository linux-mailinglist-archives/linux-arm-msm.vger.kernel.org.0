Return-Path: <linux-arm-msm+bounces-79171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B695C14560
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E7AB565DE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D9C307AFA;
	Tue, 28 Oct 2025 11:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BgGXWr1L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B6B3074A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650684; cv=none; b=oGKGNmFLnOnDdM99Yjfz5vcz1GbeeaoPBJsOgVGdxK700+fKkYDzeDSKoiNT1yMow/oiKqX/5MJAbxtya5u5UjDTmhLdzAOa42rfxOyq6UKYZTx96CKRde1Q+2qheKDxLbujfrBoTnXEJDkNCsTC6XIfHt40gfDVxuuHrWtbenM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650684; c=relaxed/simple;
	bh=ZS8D7YevM68kueG73PP38JtCM4/TbPTO+FFQtYA36Xk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YPaatva8rcghyfuIVqjZwI174FSs25z7iD0gwv9lQDdf4RUCipjHAALoOgKTAEVg1gUD1lOQbKTNEzQi4sDe1fUGuHuGEOfA0AhBNs341M1sDmgskH2005gjyJLCME7YV23EOfFZoNL3V+OgnHQHvdBBtJVGcSk90iyW51JI0Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BgGXWr1L; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b6d70df0851so863586466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761650681; x=1762255481; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1X0JyiHF22wejOgofms7G80j8gK+WhQgjSa7+ha7gyo=;
        b=BgGXWr1LwuQwdmscGN2R6zsTMYKLiPURTF+5Y4Q8H7w3aRU4OEgoqnpYEGXfYh5gZq
         G3lC6sY0p/BcxJYZZug2Ddmu9t+WdYb+iU1/ib/oesOx9hgET9sEfUN4byOL9oglw8GU
         KKcvmTr/JisJLD56M0RcYg7vq9zp5E2YzqhxCq2rqueuVk2O5UqYY+f4ZdWE3KPBW3QK
         MJQm/SK3L97THbOmhMhNFO7icuodMEIM4bNt2cOH2Y81kBQZAznbmpKzlvPIABvtqb15
         OeQptLrD5PuyllwRoHMzO1qwUO0qyFg8FCDSfnzcmhnYPq5XxCnBsFKJ/OdTGM7UvjAA
         XR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761650681; x=1762255481;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1X0JyiHF22wejOgofms7G80j8gK+WhQgjSa7+ha7gyo=;
        b=xFLwc/A3iEJYdyaGbghbdl5wmlFzTUpH01dYDl0do8H8uretTwPglsuKt1A4Jo+Acj
         slAZfD9OFAgAa4tETfNvxbpjZDUua1STWC53XI9ddqEMROg9mXpsWe6TbP7ReUn1l/HD
         xzna8wRIDfpQXA6mqPMXgS378udt5lWHTcwgd4sLqek54oFty+h8g7FEX90Q9Lxny18z
         uZeaThOmgWLysFI/GRJGoWAUvqDvsJankJDGtBqXAUlGP6WfOUj/xPT1+xDKsXquGHb1
         MXmCGyzzmSI7+6lBn6EHVqxndQzpmIuj9Ef22Mnj9mumm9lqGvLS5AFhENxfNAXk9kXG
         MJHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjfDEeYspaiweeAa2huZr3MEp65ckPwwqWyT2ddzouPMp8fmWtmgq6LEwmX3RQkyVMw4NyvsVPZ+Ek1g8r@vger.kernel.org
X-Gm-Message-State: AOJu0YzjSJVflxD/XJtM2EOIEcbRn+YDInsxzwU/QUIzM50bI9t9aiJg
	xuSlfjZqrPuKBYoCpSNJrLK0SldiiCIXbnhsSZPS+SoHdbyjH0t0YVPEkbRu/mjIu8s=
X-Gm-Gg: ASbGnctf0Ju59DsL8PEq/V27o2jmjovUB+c3Tt1hxjiFcwLX0V2mRLJ88Im3kJ0QMx3
	50iDspQ/UsM3qcghq0Eo7A9NKV4ezpga7dX9lPDphxgd1AGiQ5dwQq/H3/sd5BMUExqnHle1+gj
	gmjHilkc/OZoJxfli4Byy4Cxw2DJeDOCqmdepe9N27qa+dVD2b6M3JnVAQOgmxvV5Dv+WCJOy5S
	ApMOm2TURRX8e1hZIThQSt6YuxTMjBhipA60yvs5vqo6CEMIZQR0N6GGWbHC/LZNO05ldexT7Bl
	RW/W8OfCC4WBCcSQVgIRjCKkeA6bjQ1LFGt41OZGHl36+gQOBCDiVhowhu0l2wClQaJPbLVQDKF
	LwS7VQPAfs8kfJtKsy9jTonRnKEGMHYY1hYRbdkuCu4qN8gSFN7LliKw01RXzjQEOllXejrbXa1
	ddDbpvo/OLwcJyBbbtKMBhunK6++I5hmRe0Z1zwY++tQpcFfSTrQU/KssPsJgtrSivP3s37kihf
	EriifvAFkTy5UbF
X-Google-Smtp-Source: AGHT+IFncZEIG2aB8fskoYH1N8Pf/o+3C4t3kr4xMiHMDpXB3GXPV+hTSqwVR4PFYW4I2LOJqiq/XA==
X-Received: by 2002:a17:907:7205:b0:b45:b1f2:fac0 with SMTP id a640c23a62f3a-b6dba4a8d87mr344374766b.29.1761650680970;
        Tue, 28 Oct 2025 04:24:40 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077d2sm1068327966b.3.2025.10.28.04.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 04:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 12:24:39 +0100
Message-Id: <DDTX1PP2BBSX.WS61ZEATB649@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: qcom: camss: Add SM6350 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bryan O'Donoghue" <bod@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>, "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-2-63d626638add@fairphone.com>
 <7e7e35f3-82b6-4757-bbcd-38e0e867b184@linaro.org>
In-Reply-To: <7e7e35f3-82b6-4757-bbcd-38e0e867b184@linaro.org>

On Tue Oct 28, 2025 at 10:26 AM CET, Bryan O'Donoghue wrote:
> On 24/10/2025 13:24, Luca Weiss wrote:
>> +		.regulators =3D { "vdda-0.9", "vdda-1.25" },
>
> I'd like a little bit more consistency with the regulator names.
>
> 0p9 1p2 instead of 0.9 and 1.25

Based on the dt-bindings discussion, this will be updated in v2:

-          .regulators =3D { "vdda-0.9", "vdda-1.25" },
+          .regulators =3D { "vdd-csiphy-0p9", "vdd-csiphy-1p25" },

Regards
Luca

>
> ---
> bod


