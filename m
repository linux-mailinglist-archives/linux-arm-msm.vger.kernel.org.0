Return-Path: <linux-arm-msm+bounces-61664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8394DADE21B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 06:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D039217A393
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD1221770D;
	Wed, 18 Jun 2025 04:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBDQ7Hsd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FA8217660;
	Wed, 18 Jun 2025 04:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219780; cv=none; b=K5K7l0MXGPJOx5u507hU9zYU3Ijjv+p6//ra1jy2cTyNA5TXaslLqbWbYuNCa/h0cZcO7SUPGLgDGtBPEhBCViOOUF/AvXuGs9P7JCgE8Ai64idZISZxcd7hyRUbIVL97lSQGE7SVktcCEKhpAvF2EevGEoTG7MV3hSZiSRZ1y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219780; c=relaxed/simple;
	bh=064hywwsQNzbR3c8t7PfuutQNYtsxzltdoqUOLmuT74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ghDrSyojB+mOsjhZ3L6hIHeKv4pc0Kv2ZUt+tnbirW7X0pnCvXZgR9JflOeTVycAYkEn9nZIseHF0jZY7mY+1b3SlbUpaZPfEn+7hmdayqfrADaXG+UESmp14dNAyZnUZauPV3+3ZSsNUbGu5VYTQ3WKk/EB2f7zD4tykhKFiSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBDQ7Hsd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086D1C4CEF1;
	Wed, 18 Jun 2025 04:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219779;
	bh=064hywwsQNzbR3c8t7PfuutQNYtsxzltdoqUOLmuT74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BBDQ7HsdDen+SahKJe8pbrtgnOcp7I+4zJ7cassl0KigILIdLyd63w1v+zRISQG7y
	 Kvx+8zdl2sxemps+CpnRV7mKPJCZ88IwYWFpxjBmSvJzSfu1iF6yiAXNF/PiJKXec2
	 2LzuRJhCf6zJa6PCA7p7RxM18a0pEGofa4Kd4aCOO+OsGgQ0djq+BqApF8kw+8q3e6
	 e1swN1LQtnQkW3ejFa4+jGxk23Jie2rwYrhA/t7YKEV8FQ2pafR+kcckpQ1vGJKaLv
	 KnuoUvu5/51N1FJDGOLgyWEy5QdWAqeqe3yuH+z4WnouogE28ML0345ywvCBQwxr3W
	 CfaC6GUNItiXg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: add APR and some audio-related services
Date: Tue, 17 Jun 2025 23:09:23 -0500
Message-ID: <175021976642.732077.16252470040851608155.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250321-sm6350-apr-v1-1-7805ce7b4dcf@fairphone.com>
References: <20250321-sm6350-apr-v1-1-7805ce7b4dcf@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Mar 2025 09:12:57 +0100, Luca Weiss wrote:
> Add the APR node and its associated services required for audio on
> the SM6350 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6350: add APR and some audio-related services
      commit: a014ad1ae4ea1ec8c3ea3a66f09217f1bff937a8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

