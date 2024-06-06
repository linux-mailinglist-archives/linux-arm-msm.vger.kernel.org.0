Return-Path: <linux-arm-msm+bounces-21850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6977D8FDD66
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 05:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DA881F240D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 03:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906FE6F099;
	Thu,  6 Jun 2024 03:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVB2GNeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE56F06E;
	Thu,  6 Jun 2024 03:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644050; cv=none; b=DFz0UVRZWf6CF8BLj1i6wzE4NqDGjuPdlIvnaI8lnTNbAbRGnEJ/mxpE9YEI5t+ypSLsSIYIhhUBU1LJSMJT1CGAUGwNk7nUQrymJFQDGmO/KfUd2m9pnMol8Ppak4M5ibEV0t764/cgOHR2RJYg8G0ltcxgvfZ3HU30G3YFcJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644050; c=relaxed/simple;
	bh=lTwROkn0eQ4IiIEKxNxqBGGJZJXeBxIuDT8xYbXd/dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A9Qn3BR0AXhLS4Vt8VuK4zS7lYXBq6zH93Ccntfh1UYHDLdrIoUQwYWqu+Rtn0JfgKLhUGyb7MSOSi7AAMFyOVuKQeHorxzDrGh3zI9BIpzwlqXH6gqD5uAo5KTj1WI3ZRiD6an3tK5yRsMsK7MHVwanruuggkqR+SV21gbVCus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVB2GNeT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4C6C4AF08;
	Thu,  6 Jun 2024 03:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717644050;
	bh=lTwROkn0eQ4IiIEKxNxqBGGJZJXeBxIuDT8xYbXd/dM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IVB2GNeT4pHWYWo+kR8d5xcANGSlLECthTSHepjWxxiErUBJCg1kH6R6F82UB6xXS
	 4p7+0T5mcVb0/Pf1CsGQEwZyRY3b2zKuMAeQi5F4rs1WQrv8HzMag2wlf7ilQRHAyL
	 K+j4sGOL5EJKcmJrV0Br+r6oJQhne/9igPU8JiQZsUCK9X6hpUK20e/Tbo+4ZYRLQv
	 LDElbVhhHmYSIFuFyaV1iovzGtXcGmyoGhTLEKWTsUkwVWELtNIJn9NVsbdiYT92pU
	 ak/izeCUjh1xK8lgOuy5aC3pGqT/wXSxDEiH/5GQlJnVDk/QciQA9hCoyQFjdS9jzU
	 Ql+YkXH+sZ4dg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Siddharth Manthan <siddharth.manthan@gmail.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/3] arm64: dts: qcom: msm8916-samsung-fortuna: Add msm8916-samsung-fortuna/rossa: Add S3FWRN5 NFC and RT5033 PMIC/charger
Date: Wed,  5 Jun 2024 22:20:36 -0500
Message-ID: <171764403337.730206.729155025878631182.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240601115321.25314-1-raymondhackley@protonmail.com>
References: <20240601115321.25314-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Jun 2024 11:53:38 +0000, Raymond Hackley wrote:
> Some variants of Samsung Galaxy Core Prime LTE / Grand Prime LTE have
> a Samsung S3FWRN5 NFC chip that works quite well with the s3fwrn5 driver
> in the Linux NFC subsystem.
> 
> All of Samsung Galaxy Core Prime LTE/ Grand Prime have Richtek RT5033 PMIC
> and charger.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: msm8916-samsung-gprimeltecan: Add NFC
      commit: 62ae64ceb9a55333f3b259fef8acd0bf1598638a
[2/3] arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add S3FWRN5 NFC
      commit: 834cfba67835ff2440ef7402e1448a40d3c61250
[3/3] arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add PMIC and charger
      commit: ca4afdfdbbbd64cc08eee834bee97596bb649413

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

