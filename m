Return-Path: <linux-arm-msm+bounces-37093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD2B9BDAA8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 01:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F5C61C22D90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 00:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D913117AE1D;
	Wed,  6 Nov 2024 00:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYalfs+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2C81741CB;
	Wed,  6 Nov 2024 00:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854435; cv=none; b=SOB1FviK15alMKQ4umwFB9/5bf2KX1gNBTPQvZsdcleKv8uAO8B884bq9bUUke4uA3bTxLlXAUZ2HBoWLislyZvdf2xLQU0vZm9Cv5jP1jWGcQMU6vk1PCzwCrin+W2JmlzXteqweBNObZO7f6KF/eL076R4jr0HFkRysJh16j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854435; c=relaxed/simple;
	bh=b0pPioQHprklN4t0ESfcQXf1r+IQ0OdVzG/NwAhpiRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJ73VeVbmYgz0FP4LR7ZKLar9KWklXO/1VIegYGZvLlOoOuOsWafkE8bV20t/Cx6hhTGMMIcxw4LhHsd3gBaIP5Bbm8mzfN+uncLk4ZR43aQluoMsWQ7d8IZ3wATzTjieRtUSxeXoy5sUgISQuWHcvWKPJ4DEJ3f1uUaqZo6bZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYalfs+c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B5EC4CED5;
	Wed,  6 Nov 2024 00:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854435;
	bh=b0pPioQHprklN4t0ESfcQXf1r+IQ0OdVzG/NwAhpiRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BYalfs+cEGcBaBJoSxbcCY4aNnGw625Sh4DqEGjT3aUG9JME9rXPdVmQ3jh1NSGq+
	 CRwUy+ul4eh1YpMLdl0lkkYRyOkOh1/9AevhEDHFONAqSYAFWe5FzFIiBidB/TJHMp
	 F0AUos7eCooSmFAQ68wLPJ23x79TKXsUvBkLW3EYH5MILRPVlhm+wt3vZnlVjBC9ZH
	 lIE/eYZb6r6tgCVNHCrejgv99rm8oboobksfUDbOutwQ9mn2WHiy2cXrRiJVlgkGul
	 F9VMc6Pn0QHgiUxYpqvdzUNpzReItvWYQHp5P0fvTrT/CmmfFa2D/lzVM1PWRH8grE
	 ivwfabLMlYBIg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document sm8750 SCM
Date: Tue,  5 Nov 2024 16:53:46 -0800
Message-ID: <173085441665.26510.7937758918555553606.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021230427.2632466-1-quic_molvera@quicinc.com>
References: <20241021230427.2632466-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Oct 2024 16:04:27 -0700, Melody Olvera wrote:
> Document the scm compatible for sm8750 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: firmware: qcom,scm: Document sm8750 SCM
      commit: 4cadd106208143a919c957171a0634e16fd32f82

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

