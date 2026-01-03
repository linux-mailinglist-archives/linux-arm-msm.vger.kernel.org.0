Return-Path: <linux-arm-msm+bounces-87316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C4ACF027C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 17:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C554D3013EAE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 16:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C2413959D;
	Sat,  3 Jan 2026 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IF/ARlkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7833C1F;
	Sat,  3 Jan 2026 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767456109; cv=none; b=cH5W+cODMtpxg2hzYoigKZHilCYgvbmmpC84XkonauHcevNkNDtB4HMheWySFnJ/unseZpkh/DYrPn2J/NRWEeQ1OhlZyFFXF8EiYyBdBl927NztllzeGAeQ9z0yET0t1flyUywGJwkJg+ScMaDQiIFEsS39uCkDLtOYsp7zg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767456109; c=relaxed/simple;
	bh=TTzyM30cr/hEsnmjoGkCUz/GaOUvJy+291pNbgjoMVg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qaUlzwOOoq0cR6Ps0X7vSi937D4PyjY4ljEj1Sv15ipfqyftIyArSKDH7c+yfNIwD104jXRRrTIw8uieaEBte8ZgA0KECmK6GuaU+mVwMnw4pfZXs2c0XzLIPxaW/gnYDVILLP8F1RsM6Q3sRLdZxFG9V9Py1z4ppJUrXsinsec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IF/ARlkW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B59C113D0;
	Sat,  3 Jan 2026 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767456108;
	bh=TTzyM30cr/hEsnmjoGkCUz/GaOUvJy+291pNbgjoMVg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IF/ARlkWr7KTQ5Fm4QCUcDi5Q1NWV1g1LqbywqzSOwty/ZCpajyrwHUat5cjK1Dnp
	 9NZdKGLJqWClejnR0b3sMYaeNGiYXjgygsekvwFV4chxcdTRN5W7WAaYgpJWikc//s
	 xDAdURVx10Bk4Gz0JrdeVIX04iNMcOsrurh7Rm7l2T2+Wbj7GCYAOdusOWH/xBoYSk
	 tZ7hvT5oX88HP4T4Kd2bcGhi4BXjN4+FopHu5+ZZ/BjsE3QW3xx2O9HsTBdvee45cT
	 5KCUGtgznkZCL6i81rsOg5FleAfTxlmsuZiQE536nlSYYgpHy62+5CnCAU+yWsKpdX
	 wm9CEmgUYB7+A==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Drop SM8750 ADSP from if-branch
Date: Sat,  3 Jan 2026 10:01:46 -0600
Message-ID: <176745610338.2631079.885451348924031995.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223130533.58468-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223130533.58468-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Dec 2025 14:05:34 +0100, Krzysztof Kozlowski wrote:
> The binding for SM8750 ADSP PAS uses SM8550 ADSP as fallback, thus
> "if:then:" block with "contains:" and the fallback does not need to
> mention qcom,sm8750-adsp-pas.
> 
> 

Applied, thanks!

[1/1] dt-bindings: remoteproc: qcom,sm8550-pas: Drop SM8750 ADSP from if-branch
      commit: 332c03279bc81a1a88d8dc5dd23f3c956d99d882

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

