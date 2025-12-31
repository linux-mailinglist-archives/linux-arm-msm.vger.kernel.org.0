Return-Path: <linux-arm-msm+bounces-87044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6919CEB263
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 04:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6FB5300BEDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CB7246BBA;
	Wed, 31 Dec 2025 03:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuD2F18q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EB72030A
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767150116; cv=none; b=Xlri80ZRxLTtwmKThEFRmWRi1fink6hh5d27B6OFveouCKf78pPJDsh6GbSrF/7rH02msX/wa04dS7cKjOMkv8EItKH7sdQiQVW6CoMDM9HMKBzA2wlf2yURQ4j6llJMe4JRWE8RYW99yTyuj3NeCF5xjdkPxvQIaj8Losy4SOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767150116; c=relaxed/simple;
	bh=VfUAn7fuzAJ1b65MvaymWQC022eu06jMkmEUoeIuEzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRBszDfOS1QBFGmIH0gwWZIQec/SWkJ3HkyzoYTcuQmZe3Kci3O2cnjfD8eosQXUe0IzEjF+Q6OtwgGaAidp0G3j6MeVuaTbpm7eiRrtVP7Ww2seGHsrolTt1nekFUFUIjXkgcsVKyYEDrOuAko4clzuIhKd3APhjrYP/REP5aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuD2F18q; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b2ed01b95dso1085178885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 19:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767150114; x=1767754914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zusqzk/Z0ArToECS6/v9lmrCcwZi8OdNi5W/vdy0GjU=;
        b=OuD2F18qhDghQ5PprngP0OPDTym7da1Jj9tkFIhCNJIXVnT7B6dRacIv7qYen1O02k
         Dcv49vbjBF9MY4gB912rC0xC9RVjjQ8C24Ik4rK3xkHmnQfnYrFxcEeINSATqkeWXBrC
         SyqpLlRhZksvBLxCzsxS06oHRuISNNW2O9Cur9ukvIwoZ67R5Qc2IdarTz5fyihMrCwa
         qp+TCvv4qvSwpID4U2EByYVd60aGxWLjgUPmb3Z9zntfO3Zm4MyPi6vtOpLKLyzu4XdJ
         lCcG5mxk752tWNWy7DGwiCbL4AefCHZkr0NpFWcroQ6z47qUWMEIxAGJgZPEkT1xbe7W
         YT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767150114; x=1767754914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zusqzk/Z0ArToECS6/v9lmrCcwZi8OdNi5W/vdy0GjU=;
        b=pd6Bcb4Tcc5BuyHlofpH5KcrfHUp77+vjPNZq4MvxLECTcsiVutWf6He7iI2w3YZB2
         VWzA43DwJD2PdxgtDde8ne0uO/wYBrG8sMeiz8ZmLpKw/Tjh12YD6x7c27/laMFzK8HD
         KrTcF8fqAVW6UDrtTSMUJNnOXDD67GrW9VwHQj8rOHVPpfCsF/B4CHjnfIMWfnRxQu3t
         JT/vwd91VGyMDxaqYjulC2SdLnai4kz1Cm9EKLo3z8zVq/30CL5YfCxAIhgMbIsWmbei
         MrcjTaI9i1Apai0XCs/qvrmgSbq4TOs8iZvaBgOpmxm1GOzM8O7e2OO75CSu7uz8d2Oh
         qPRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfhke3V/cZlmwdbezdHQ5B/yGam0ZFugPc0SesSadsYMEy8uqtfLu0G4X9PGTzYFqnU/ldRV/yfnCXCNEP@vger.kernel.org
X-Gm-Message-State: AOJu0YzJCHWmzFTLQSqcaiFxVg2dObCgky4dBGNR5iPQAoSMZLyLO3Oi
	5HdhLQ9RY5RlPCa1s/+p2Fk6zO4iNm1OOSt7XYX2Y9M+qlVRTzSCc0pG
X-Gm-Gg: AY/fxX6NWkE04DDsHyK/V6QnSgyoRoQBU/xD5bohb8MbqFNEHMYIVVPmIplD50A0BKw
	19pFGe+A2fxivMFOriwtEg8pnB/wk9GT/BrMi8qjc2ZtN5I32vf8Qe84ru7YYcIKewg2atcmnZK
	/AxoSPhepq6R9ZiaH86PMt4Zjo3Lv/zQP+jZuMhvqgUa1bsIO+7fUj01V3/waF+8gyh6R3H4lL1
	MlvrcHma38Ex3PF5H1qlj92aQHO8/nsCHaUMm0yOt3JaQcasYW4EuJAjQsuVmdFur2VWUPFpaG9
	GpNjvPDI2s17kM8kgrPXYQrYikh5ZOGI9SvcBTpnxC6CaRdYUmbT/nonzzZSWfdrD0kcFaM6fcJ
	98Cj8NpP8X/4JRnZoHUaJt/TRBm7W3GtaVRIqcQWRArcb0DO6vq4V4DP5u2DbX4A6PhEKRutAz0
	tp00ENthnqK7I6JQ==
X-Google-Smtp-Source: AGHT+IEzxBN4kluErCkFUOvPOVgIkBgVvoyMRSDm/yqIVEJ0Qm/7aQQEO7z0S0+HYnyDvukVT0yxIg==
X-Received: by 2002:a05:620a:c4b:b0:8b2:5d6e:48c1 with SMTP id af79cd13be357-8c08fd037bfmr5364545585a.27.1767150114089;
        Tue, 30 Dec 2025 19:01:54 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44e26bsm255936816d6.47.2025.12.30.19.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 19:01:53 -0800 (PST)
Date: Tue, 30 Dec 2025 22:02:12 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
Message-ID: <aVSSNGCtvcYCTylu@rdacayan>
References: <20251230022759.9449-1-mailingradian@gmail.com>
 <1fa74da9-bd3e-43c6-afbc-8cfcbb93af93@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fa74da9-bd3e-43c6-afbc-8cfcbb93af93@linaro.org>

On Tue, Dec 30, 2025 at 10:18:39AM +0200, Vladimir Zapolskiy wrote:
> On 12/30/25 04:27, Richard Acayan wrote:
> > This series adds support for empty endpoint nodes. It is currently RFC
> > because it continues an ongoing discussion on how to selectively connect
> > some CAMSS ports to cameras and leave others disconnected.
> > 
> > The SDM670 patches are for a full example. If agreed on, this should
> > expand to SoCs that have CAMSS.
> > 
> > Example SoC dtsi:
> > 
> > 	camss: isp@00000000 {
> > 		...
> > 
> > 		status = "disabled";
> > 
> > 		ports {
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			port@0 {
> > 				reg = <0>;
> > 
> > 				camss_endpoint0: endpoint {
> > 				};
> > 			};
> 
> I do not see this device tree node layout as a valid one. A 'port' provides
> an interface description (an option), and an 'endpoint' declares a connection
> over a port (the accepted option).
> 
> From dtschema/schemas/graph.yaml:
> 
>     Each port node contains an 'endpoint' subnode for each remote device port
>     connected to this port.
> 
> This is violated in the example given by you above, when a remote device along
> with its ports is just missing, thus there is no connection. A forced alternative
> reading may (or will) break the legacy, so in this particular case you shall
> start from making a change to the shared graph.yaml documentation, since it's
> all not about CAMSS or even linux-media specifics.

So, if endpoints MUST/SHALL (in IETF RFC 2119 terms) have a remote, then
would it be acceptable to label the ports instead, so a board DTS can
specify its own fully connected endpoint(s) under the port labels?

The labels to ports aren't looking as "excessive"[1] as they used to be.
Is the original review comment on port labels still relevant?

[1] https://lore.kernel.org/r/565d14e1-1478-4a60-8f70-a76a732cde97@linaro.org

