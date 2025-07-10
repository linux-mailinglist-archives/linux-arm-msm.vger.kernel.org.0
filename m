Return-Path: <linux-arm-msm+bounces-64466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F1B00EA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 00:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AABE57B237B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 22:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00067294A04;
	Thu, 10 Jul 2025 22:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="io1hn25P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34528633F;
	Thu, 10 Jul 2025 22:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752186061; cv=none; b=tOWKmldsSTz1ClrSY29yBAi7nCynvys7DhxCB/+HRFwmAq8R9nWV9IsDYGa6p5lpe2qGLipwKbP0qeJORupMXbW/2awXTw4jgIl9U7g8B2QWmozciY2kegLWdVShfnYP1HeDGtFAkzPQ4egpgvGJGOPQw3Ry8sKDEjxQ4OxQ5sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752186061; c=relaxed/simple;
	bh=7vOsASejqUANov9z3gdTadG0WWN2JSm8R2ZdKlBY8fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZaPGuX3MjW+XxT+DcgZxt7021SLpQcKP5vwHkDVP0dRLsSKEIn3QQmaJswO7etfMMvLk4Y3h/zQo3eKLZQQOuQrubYyJ2ckz5iAfu8l3LlesaH+AHx6Qwp5/RtjzzU26kVGgfYKK3BB9zZhjwrc8UnNg2Lq5j0EvK9HSN7S53o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=io1hn25P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265EEC4CEE3;
	Thu, 10 Jul 2025 22:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752186061;
	bh=7vOsASejqUANov9z3gdTadG0WWN2JSm8R2ZdKlBY8fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=io1hn25Pq7wRvQZv0SS7B3dW0ZKk3PdBbljT/aCgMnf0IPwwqtKIW63Ap8mDJjKGP
	 RQkqa69yhifUXBfwfT9HkGC+jKe+g982qqKvbc4sS/0xbUFkDoJzAGOyO/IbZ9eD+F
	 fzpbZNkj0+NNH8ykOShWxaR6IuYqoN00me4wTEjM2g6JMpj/wKmCMe53XrSQiT6qyz
	 CoGjNwWME7IYQn2lOwdR1C6gAuKCe3By13RRUp59riT80jt2lFnebRxNY0vyYYoOCV
	 DAWBcKOAs3JLY3HIOhPKsdrQJUTnqDZsC6xaYlgkBNZ1nI92/ZIYFsZcH4BLDKmfdx
	 cGn4ijCFf78Fg==
Date: Thu, 10 Jul 2025 17:21:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Conor Dooley <conor+dt@kernel.org>, phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom,snps-eusb2-repeater:
 Document qcom,tune-res-fsdif
Message-ID: <175218605943.4171086.4708337107584931560.robh@kernel.org>
References: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
 <20250709-sm7635-eusb-repeater-v2-1-b6eff075c097@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-sm7635-eusb-repeater-v2-1-b6eff075c097@fairphone.com>


On Wed, 09 Jul 2025 16:55:14 +0200, Luca Weiss wrote:
> Document the FS Differential TX Output Resistance Tuning value found on
> the eUSB2 repeater on Qualcomm PMICs. The tuning values have special
> meanings, being different offsets of the resistance to the default value
> in Ohms but the exact meaning is not relevant here, as the correct
> tuning is determined by hardware engineers to make sure the electrical
> properties are as expected.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


