Return-Path: <linux-arm-msm+bounces-79033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0AFC11C1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 95D56353114
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E6133437A;
	Mon, 27 Oct 2025 22:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXUGMbRR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD7433375A;
	Mon, 27 Oct 2025 22:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604500; cv=none; b=ETeUVeC8Z9IeQLTfWIWoLzrXwMNCPk2VF3xd/PKig9T5VQSRh/sMJtaQHXQ33HvZyW2oIUajhr21R/SSjguA3EzIHYWoN4P54fwTOxo9BRGvPXTUMClyPfcm8+hIupvTJU4MODwry9B7OZR/TNl0aoIXRZGDTgeBpe/YA7JprU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604500; c=relaxed/simple;
	bh=2dYCQ24NK/uNpXe+zeQ953Tqg80i4qYKC/WCAYAPj7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q70XKclJqR1KuMZ64PliDFVHRnQLiIa6tKXgafZKXZHFVpdAm0D7RMLuqL/bnFhuV55/3zPdPIdg0NarRnSzSEh8rSVnLMPwLCeCPn1jsoJavdjCbS2yqLgubdo9TtP2V+F+fWrCb6e9V0LzHj9Eh4cPN6hWatj2if087Tqv1QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXUGMbRR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA13EC4CEF1;
	Mon, 27 Oct 2025 22:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604500;
	bh=2dYCQ24NK/uNpXe+zeQ953Tqg80i4qYKC/WCAYAPj7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lXUGMbRRpaDaRWYp+NxsJt4uEb+wg5FIl01wZKASkSMgF74TwBL7yu9YFRMn+Hdw3
	 NYpB3S5xkUXxtSq9nweBYMvtbWK92Zidgk+g+EcRmkSl+opAtZZIGdQ+REljRzwiS3
	 ndH3YICuN2qoHZ+R1WqX40H51WAEQ4N5Tl258gx62IxTJ56b6bptQkTF9vfYFslqI3
	 v88jw0WRwNJs7EhxeQC0Z3tubVUhb3qxFoPxyc2mkZxDuEieIaHOTcv9E/CrrGncvf
	 C4XKnCSMd1ptiKVpk+9DG9nXG4JdtLAAkjFhx2woRv/gSo+cv3iIQVL9NgcylcYs43
	 wpuorikHrG9Nw==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4] arm64: dts: qcom: sm8250-samsung-common: correct reserved pins
Date: Mon, 27 Oct 2025 17:36:54 -0500
Message-ID: <176160465237.73268.13433678465782509694.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016202129.226449-1-ghatto404@gmail.com>
References: <20251016202129.226449-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 16 Oct 2025 16:21:29 -0400, Eric Gonçalves wrote:
> The S20 series has additional reserved pins for the fingerprint sensor,
> GPIO 20-23. Correct it by adding them into gpio-reserved-ranges.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250-samsung-common: correct reserved pins
      commit: 42e56b53a1919dbbd78e140a9f8223f8136ac360

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

