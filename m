Return-Path: <linux-arm-msm+bounces-86417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBF9CDA68B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DA023024AC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54C3346AD5;
	Tue, 23 Dec 2025 19:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXFWLLIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6E9287265
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766519277; cv=none; b=BbCuIUx0nlUULOJV2Cl+jxFZZaahhMq7hzU2sAixj8v7f3L2pUfEl+7+I17YLMtRMH5MIQE+l4DljyIZNIrq1+f5oTKtOWHXVoJSqB8G35QjeWvNqgQCUMBOChZe9OHM1QIS2W1Re8nZvab3C1m/LrIgX4239RQof2XHneBBIVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766519277; c=relaxed/simple;
	bh=O+al3T5GzHGSlUthhDdnNmN3jTqqvKqHzxLvsIe+qrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o20lBnxv24zluiGEcrY/cfK5kk8bnWBisJ4vv32SwdcBb9lySd+5Kz/KG7LjjyWFZQ36DzJOJK64+2GIRkXDgR5qLFfXhYFFBUs7oOb+L9ya42EGXGA3hPtMc99r4Po8NrFCRTDrH2a+exr4BhDRxFLfWhnTWANwxPkV+eszSrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXFWLLIM; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3e8819eda8bso1985582fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766519275; x=1767124075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3mRJeRPuNplyzmtQpT+uTf1WmnP55bf7PHuhNJ2LCk=;
        b=CXFWLLIMvJnxkqVhl3qf+hIIVPPt5ZKmDrDA7ZV/DOpjTjEgOpNdkCG+A1dT+5u8ro
         xBdUxmdH/vt3sBPZ3O90WglZQyfxYCHVUHvVG27dTD6B5lwqlEE9pg9gOIqQM/WaGiON
         UBCwebTgRFg0wWscS8nzqMcUh56SP11luotZjZ6YfJiZiEPGRJT8rO26GPnwfaBnPY8W
         CGD2lpgl2tfqtnSnOeeetRkEf2Z0w9d29kZlvRrJe7RN8+14ZRRPUKfG1T6L9zMDGOxw
         RA1OhwRvpIDaFOi1ds9pp2MBfbVCDZoS/81GDBl4wLukE4kgev8iYcrLjGM23aDHkCBP
         6nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766519275; x=1767124075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3mRJeRPuNplyzmtQpT+uTf1WmnP55bf7PHuhNJ2LCk=;
        b=dfjuC5k2FwdLHo6dXqG1PMcq/J5s5gyxI7l0txsP5gbMRk8qLWtRxfCaQ03bbCUmr8
         U6qAKoDbiQY1n23UfEGqQtZpFvwtlW62IbvQwoi4GtMK06tnLqEdmwD28hs9xijzgLHj
         37AczjeDIadVK8Y0Ra0VuNHE5w9kPeF6VBwutkk0RAKs+CFgxPBBIwaPwwCzx4oS9AQ1
         ci6ZIgkYgijYvCPuzeweT1nmX1NzTP1rT6B7orf1nmhMKs9a4XV5NwUMc6LLnH/wd6Rn
         jNQi73JGzLwfCNZt1ee9GKBSRYT/Cbjr4UYKXpqTOY3V0gSLzFymGPmj5Uyk5mSTdRE9
         X8fA==
X-Forwarded-Encrypted: i=1; AJvYcCUGIuEKtmpUcc92zcowtZobrDY5FHx5t/HtBekdc2pA8xbOJydbJFNBioi6AgeZKwWpvijej1G+iOTY1K8p@vger.kernel.org
X-Gm-Message-State: AOJu0YxcgKP7mV8O4YMUCl8Vja8hX6w0dC/BJ0nRIUXKBBtpEcXC4q6s
	yDPnSAPb9Oe1RCBNkI0uti1DXfC/sPJvXhAZY7TEHif+ukmf7HL2dRuk
X-Gm-Gg: AY/fxX7ETOI5pu4K7eFAtAKNIuSkYGxc9a62wiNXFiVzh+qXaW4XIWERHyqfnmEqQ9m
	XhZaJnj+frKNTZy/m5KTKVhrdum5HKl3CBi98ezfTjn6+mziOkTaQLjqufKzHXeggliqDYFH8vO
	CUbylxduAxa3GiWF47BFAS2weCSSpjIOA6Of+ybBw07oXvvA5xRFErTcVTsIymuhQHppFVy54yo
	KUQd4AgPn9WBKkVdTHYedDSx3KOBKf/WXpWNuROeHtQOykHWxg2qejXrGZ767E1Xw0vpvlyNQPv
	SlR3lFa0RZHkdGNxa1DqD2QwV9CADKDTpnuGNe9RXZin/cu47ApOCm3eJcg3yVGDq5CZ8RO6WmO
	Nd3NP++J5a/QbwUzNbWaC+0GqkGp3IGZ8zDU1wbyiUuB6LqJOHPwCMjS4Yx9era5pUqS49m1nP8
	1Y2hkW2g/WrRBWzR3KR3wujIeKAaF6rtKlywEydlGXhpjXNvE0voxF+RWzcMhdxirqLXH49h80Y
	s1T3xp1w4BzVG4VSfOPh84bOsyyONjbskLNly78uQ==
X-Google-Smtp-Source: AGHT+IHcrjhYUuAj6vozocg7gaQdzG5Vqlzq6aaTKhOSW+rv6kUgyk2MG7UftkvU7tvQ1KVlt/vjsw==
X-Received: by 2002:a05:6820:e010:b0:65c:fcdf:a350 with SMTP id 006d021491bc7-65d0e9bae35mr4930818eaf.24.1766519275181;
        Tue, 23 Dec 2025 11:47:55 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65d0f69b9e9sm9066832eaf.12.2025.12.23.11.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:47:54 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, krzk+dt@kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
Date: Tue, 23 Dec 2025 13:45:49 -0600
Message-ID: <4260401.mvXUDI8C0e@nukework.gtech>
In-Reply-To: <20251220-imaginary-merciful-quoll-a91a4c@quoll>
References:
 <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219144433.GA3163791-robh@kernel.org>
 <20251220-imaginary-merciful-quoll-a91a4c@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, December 20, 2025 2:54:02 AM CST Krzysztof Kozlowski wrote:
> On Fri, Dec 19, 2025 at 08:44:33AM -0600, Rob Herring wrote:
> > On Thu, Dec 18, 2025 at 10:34:10PM -0600, Alexandru Gagniuc wrote:
> > > Document the IPQ9574 native (non-PAS) WCSS image loader. It is similar
> > > to IPQ8074 WCSS, but requires several new clocks. These clocks must be
> > > enabled by the host in non-PAS mode, and are not optional. Add an
> > > example that uses the "qcom,ipq9574-wcss-pil" binding.

Hi Rob and Krzysztof,

> > Is the new example really much different and unique. If not, drop it
> > (especially since it wasn't even tested).
> 
> There is simply no example for existing devices, so this is fine. It
> could be mentioned here WHY it is being added, which would solve two
> people's questions (yours and mine earlier). If only people knew and
> said WHY they are doing something.

TIL, I need to put the third patch ("dt-bindings: clock: gcc-ipq9574: add wcss 
remoteproc clocks") before this one to resolve dtb check issues with the 
example. I'll also add a blurb to the commit message to explain WHY.

Alex




