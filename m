Return-Path: <linux-arm-msm+bounces-66651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2747FB11958
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 09:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47EC45A0A1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 07:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D79C221F11;
	Fri, 25 Jul 2025 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7nEkoGU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4446941A8F;
	Fri, 25 Jul 2025 07:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753429520; cv=none; b=Szqv1NhT/2gGiKsHocdTXQT3bA0SLLKMDS/R58vJDloWfezQAD8v5kufz1C7amD1z8EdWEUTHPkBaaGJkN4goRkqzgeQ9avPt30l2bb/0ggxOIsmDPlipWNgVQ8IrfZv6O1pWmPOEBNa9R06isMfC7KE0Y1dPkv5QUzqv+DOdIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753429520; c=relaxed/simple;
	bh=clcYxE5Wx51OdBHA9h9oopi2+l4nXhAbyNOMVavvEhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vgr3PD7eMmGqZJD/hg0NzuqG3XGtfYV8hw0PyXAIcQzTci9S1lbv1LMP6efgJQ75/xuUE5alx075cCWbhppyJfpjYQkOioEkhm+pT+Tv0tZ3PwfYYL8GUc0Fn6ipiWsK0AQB2czVjHQn6MY7XB89eiagPp3ZbbIMp+MRANKInH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7nEkoGU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1D0C4CEF4;
	Fri, 25 Jul 2025 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753429519;
	bh=clcYxE5Wx51OdBHA9h9oopi2+l4nXhAbyNOMVavvEhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7nEkoGU5gbaiALcyHoH7ZDNAR+4xBy1vr8IDdJcy6FOte+FmxF/HCANtCfgviWSb
	 2k0j/Cg8TLP94JRcZH//H2g8hrQ+HCeU1e3o9zFvux4YsZK8pHkhuBfh54tXlIDlv0
	 oj/DvvJN8iRqVhTqoDJxba+aIrMVnY/72kjUYjZ86am0uwut4uq2TDzkprsNXK6jgP
	 3W6kOel/vkaA7+FaIfCAQ16vuz8Y/JkbHYDciC9aCatA2B7fXKE5Bm3Vzzu/YEeDit
	 Uhh8UiEOhAeaE8ZN7iJznkAwuX3bbXpeJ7VVukojYb0kssKUyUTWLiGjOF0/TCER4e
	 5baL8ualUQlig==
Date: Fri, 25 Jul 2025 09:45:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] dt-bindings: clock: qcom: document the Glymur
 Global Clock Controller
Message-ID: <20250725-incredible-nippy-sloth-67a31e@kuoka>
References: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
 <20250724-glymur_clock_controllers-v2-6-ab95c07002b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250724-glymur_clock_controllers-v2-6-ab95c07002b4@oss.qualcomm.com>

On Thu, Jul 24, 2025 at 02:59:14PM +0530, Taniya Das wrote:
> Add device tree bindings for the Glymur Global Clock Controller to provide
> a standardized way of describing the clock controller's properties and
> behavior.

That's not a correct reason to add bindings. Why would we care about
standardized way of describing clock controller properties for Glymur?

No, explain what is the hardware you are here documenting.

Best regards,
Krzysztof


