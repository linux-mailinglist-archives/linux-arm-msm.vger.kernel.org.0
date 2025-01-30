Return-Path: <linux-arm-msm+bounces-46570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A0A229A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 09:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E053A6E53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 08:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64A81A4F0A;
	Thu, 30 Jan 2025 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rm6+eHmt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997E651C5A;
	Thu, 30 Jan 2025 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738226112; cv=none; b=c46jYImeESaRFn/X8MpgS1wZ5W5sLbzUvulMdRmtTjKaMwxutpzo/nsmM91jcw0JsZVOVgGUNPolSX2AJp/fU3ZGJpQc6HBWA7Ik17t4TsR82sq3ALfl+rVQACbDHJoTLm08enwcem8a6kgp5X8tB35aX7kDEex59hcKEmtTjfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738226112; c=relaxed/simple;
	bh=uAFNIom2egyM9yFIPFGaNT7cgFUuSuPYI10Vu9ykITg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKrMsKt46ci+EBtnlRIPieGvQfjKSoz+g1+pv0DFSNEEz8DhLTkHeQwfl3Ae1hZfzHAQ8EDdBaG6XiCSS6Cxy3Ay17hRWL0W3HQak58Zrr4xmhN3C71FHMEK6k8bGA7YY6dxTuOAHqFcf6jwVv34Cqu9oK+4a6mu75ZIvp/SsVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rm6+eHmt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1494EC4CED2;
	Thu, 30 Jan 2025 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738226112;
	bh=uAFNIom2egyM9yFIPFGaNT7cgFUuSuPYI10Vu9ykITg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rm6+eHmtk2YwFft4vFcSlVZEQ8ywP+E7Pc7HyQx6vXROJv03gu7yQ5yvOQ6ljMnth
	 rAqpINETKsnbzufJs6foZWF3gJsiXIQPdMp+xJ0J7IFoY8ZLqnWIg14GYR1M5fKLAV
	 rFEhLdAHwR8NvjkRkbfWLWn8Ohd67VIK+GdQamVMP/4ciXlvBFsiARhnSmOQ9leH94
	 35Hdd7w4xiO0/VDfbHptQ+BKm5kVLTXb+iQo6Ck7PfTdTq3ASBgF2JAp3fucyudgvM
	 Zj/K2JpUfX8YJjQL7kl0GW7q+Lto++TokrHP2kImSZsQajBUC3Ip+932aBeNvQ7oqN
	 aiqQuEHFSnasw==
Date: Thu, 30 Jan 2025 09:35:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Craig Tatlor <ctatlor97@gmail.com>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: gcc-sdm660: Add missing SDCC
 resets
Message-ID: <20250130-cheerful-splendid-cockatoo-d833f6@krzk-bin>
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250129212328.1627891-1-alexeymin@postmarketos.org>

On Thu, Jan 30, 2025 at 12:23:25AM +0300, Alexey Minnekhanov wrote:
> Add resets for eMMC/SD card blocks that were missed during initial
> driver submission.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")

Your SoB is always the last tag, but repeating what I asked during
previous review - what sort of bug is here? Missing feature is not a bug
per se.

Best regards,
Krzysztof


