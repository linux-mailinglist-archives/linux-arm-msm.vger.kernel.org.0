Return-Path: <linux-arm-msm+bounces-51556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE30A63C38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DCBB188F54C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CE3185B67;
	Mon, 17 Mar 2025 02:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5iQ7W7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA1317D355;
	Mon, 17 Mar 2025 02:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180170; cv=none; b=Oo4QM3TZgB8KueWMn9l625T/tD0ijK89TGVO5jOjwTLSokfABFrozowcQbC9L+N3vNTdLsUNEo2NYUOv54/pkma2P97TwEG3Ewn+AJsBGEVOAtKyvYzTQx8gdH7lMYSyYYoRHgHZLKTrL8iptKrp/F9l+fXA3Jw4ipjCwSgKj2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180170; c=relaxed/simple;
	bh=ICoPnaL3xAQJcfni1TorrVh1O89PfpXEn5siUbXR79Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UDVHq6FP1SLxQaTlYsIxNwy5QooL9FMUKoZYVXivDyGCMV8BSuqft791zvcWgJ6G+Kyh5WmcQ5K9+3/mHPnBYT6pPbvFdc0NCao9bPLKekqzfUb3kQhBqX1nJvso2YjmO010JYgp5HzqGO/nJVtGMbBfOmoc4Xs9vTTNidNK5Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5iQ7W7R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4326C4CEEE;
	Mon, 17 Mar 2025 02:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180169;
	bh=ICoPnaL3xAQJcfni1TorrVh1O89PfpXEn5siUbXR79Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b5iQ7W7R7qLi7aLTmu4gE4ehM+EbcyXMcaRSDJ5mwKpkNzs9Q1i3okiPXFR+AmdOk
	 CfIb3jViI9X932fQ0CE3fCqGc48NSk2EH1e3RWGprZHfaWeIVk/Zvv9nryUsZANh9T
	 vF4ARakpn6fNTv1R4L4T/0cGR9bKuls7fbdrpL/qqDdL6rEa3qEWYCFYi4CuG5ryOR
	 aA6Kx7F8rvrXa6HpxbKPcCJLY7lEpE97MkIE0wmL3yOVmmeTqQg700bfACG4z5yBel
	 akeN5++M0WOqLeGr09OuDlp3tsGI7R7kQsFECgOdk+fwk7Nfe+JwtrdJGTKFkK086o
	 ltc62e8LBaguw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-crd: add support for volume-up key
Date: Sun, 16 Mar 2025 21:55:49 -0500
Message-ID: <174218015888.1913428.17093197353932304885.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307171036.7276-1-johan+linaro@kernel.org>
References: <20250307171036.7276-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Mar 2025 18:10:36 +0100, Johan Hovold wrote:
> Add support for the keypad volume-up key on the debug extension board.
> 
> This is useful to have when testing PMIC interrupt handling, and the key
> can also be used to wake up from deep suspend states (CX shutdown).
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp-crd: add support for volume-up key
      commit: 3529d9536105b78d9756ef81722554a7f9e3c6b0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

