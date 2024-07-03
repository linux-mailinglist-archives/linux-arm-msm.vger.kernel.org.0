Return-Path: <linux-arm-msm+bounces-24970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFC0924FD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 721D428F873
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8AE13775B;
	Wed,  3 Jul 2024 03:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpTBoIgQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0044E13774D;
	Wed,  3 Jul 2024 03:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977874; cv=none; b=k6bg9C8Gm3QxZpuMPjnNieSJE+aYZ5ARXqCNIl/VDnFzCLWYedaEmfkDNgTs2CmCHKGCHpGloEKoN6Rd9wkNI6HRKTy39vnWh3MV6kW+6xQUWL2K9Zs5NsVwJoV5eTGHffSNFfyda35R1JzekMPkgLcadtabvlBkLaK4OpfTvu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977874; c=relaxed/simple;
	bh=9LOG+Iz8twR7rHxeQYQr8OSRQaJ7m/kpUczuRzyqIIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LJyfpSovydMqJaa0D+5vJ3cMDxVN20+Zm9SQ0mbziH0raE8w6Ga/+zNUtoWugRxOAdalN10OKcHASLlvfRzTCT3ypn2kJlI3VNS8La43aPBTmTkAfXF+cpd0EgXOGk39uKICC1Sf31hSWJlzoxXRLrLZy0vGqovnD3M+XuZmNCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpTBoIgQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EA5C116B1;
	Wed,  3 Jul 2024 03:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977873;
	bh=9LOG+Iz8twR7rHxeQYQr8OSRQaJ7m/kpUczuRzyqIIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tpTBoIgQnZ20aIszmZXh3ZSV6CyQiqIM/M4nMi408ma+p4JmpU7FjZw/HX0tgyFd1
	 Il09SUk/v8u9hvdUYVCfrkdI6NlWkYywThvtI13U2ADO0k7jGA2b9Tsuz/vF71kCwv
	 erL+b7NFnQ+6xDsQODusJXkQinwWLPpzg2fsdJFriN0l7xrRGP9fJ+F/pOZA3KahjD
	 eLwhEPemhx9SRdgWWnZt9UKbSA2KqYLBU5+i1p8wEYnUJ0jy4nYgKlopfTF9soEgZT
	 ZuBwGv6nD9MNR12j/oEYaXRYUfpbHkURp/GV5z2ZDJ3V5XJXBpxcjIuNjJlRIiT13R
	 CdDKw0cze0QwQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v3 0/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add initial device tree
Date: Tue,  2 Jul 2024 22:37:35 -0500
Message-ID: <171997785372.348959.15845091614741529157.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240630132859.2885-1-raymondhackley@protonmail.com>
References: <20240630132859.2885-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 30 Jun 2024 13:29:13 +0000, Raymond Hackley wrote:
> Samsung Galaxy Grand 2 is a phone based on MSM8226. It's similar to the
> other Samsung devices based on MSM8226 with only a few minor differences.
> 
> The device trees contain initial support with:
>  - GPIO keys
>  - Regulator haptic
>  - SDHCI (internal and external storage)
>  - UART (on USB connector via the TI TSU6721 MUIC)
>  - Regulators
>  - Touchscreen
>  - Accelerometer
> 
> [...]

Applied, thanks!

[2/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add initial device tree
      commit: 2a5454d0fe5684855581f8ad958afbcdc476fd64

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

