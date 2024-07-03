Return-Path: <linux-arm-msm+bounces-24961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0EF924FBC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ED4128C43D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289373D96A;
	Wed,  3 Jul 2024 03:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5oGdcgk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34454D9F4;
	Wed,  3 Jul 2024 03:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977864; cv=none; b=hJG/19oalGIo/DqjS1iOqrg2Z1tQBy728GH6TXeKb7q05wKbX2+uF2HNlBRq8r6I/9OmHgGqbycHtcX4y4mgNYuSrRyG5xnsr7PyNumRU2zRnqM6ioPw1qRjNjz0b04adKlsViC2Cp4hEi21lF/n8L2tMNPqMFwOo+bOq7Fvexg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977864; c=relaxed/simple;
	bh=RkN0Y6PCTL/vMRCSQYJ4sUQcugme90wrMIBsgjhHNq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HnzHoBLucpJHs7hEORTKAcIFzUcxTghlYhuhgNwxID9Zd1TlxrqwDI6zZFz4cFxwgFbMy6D7/FvDo+WoGC/dv7hP1oyfOke3ah8B3hXo6+F9wWLaWpxogl9APDu/IGo+/KlAUZpvLa7j/p0MZBkQsS5AbXD10BscZWYpp+pAKwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5oGdcgk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE67C4AF0C;
	Wed,  3 Jul 2024 03:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977863;
	bh=RkN0Y6PCTL/vMRCSQYJ4sUQcugme90wrMIBsgjhHNq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n5oGdcgkwibDM9l5wCj6k15CNFt+leXzoBHZlOTrc5lgfcY6q+ehKkCUHuQmxzY1g
	 1ajxyHtXyw8fXg/wQC/r3WYOWboaebnBZsVXvZLrOOc23ap36oYuGjUBiO8kyN2Gur
	 EhTldgMSiyjVQKoV3qQQIVO4cg4MzxCIO7lTsLT6eyufTLIzsV+bQq/wgKzgbq5tYP
	 5cM1/viW/0ZFYY2hpD8cLjATjFKHS012LTlo+yue/mpG12ptWolNyJwV0kgQGasg67
	 zlt9phXMADca+gB9Qw77EWmDvcub4sbWHqJc8XWGY/CgLfBIEF+ZHzQTloge96xY96
	 1OUVgEEuvpHAA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pm8916: correct thermal zone name
Date: Tue,  2 Jul 2024 22:37:26 -0500
Message-ID: <171997785357.348959.10266570411926265603.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701-fix-pm8916-tz-v1-1-02f8a713f577@linaro.org>
References: <20240701-fix-pm8916-tz-v1-1-02f8a713f577@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 Jul 2024 21:11:16 +0300, Dmitry Baryshkov wrote:
> Correct the name for the thermal zone on PM8916 PMIC. I ended up with
> c&p mistake, which wasn't noticed until the patch got merged.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: pm8916: correct thermal zone name
      commit: ac3eb41a283adf861aa49408bd4a6ce1e9563f84

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

