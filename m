Return-Path: <linux-arm-msm+bounces-24128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC63916E42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08F6C1F2345F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D755171E7A;
	Tue, 25 Jun 2024 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0i01YGN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E93713B2B0;
	Tue, 25 Jun 2024 16:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719333604; cv=none; b=UtBVHL8p3fvGWuFtSK1NBY4PTrTnVLsSwm2FDZb5hPOotaHVwSUF9vZunj2HYxTvgJq135zlSsiT+a//WaEQ0M/KC9/ExB4d2dFeskhvI2yKWD55OWpHQp3OJGH67iv/5Bk6TA9q5/N5F9C7E1w234wgL+pWsgjdGSTZIpaW8wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719333604; c=relaxed/simple;
	bh=zs0R/nUMW9F+9o//+MVNBbmIzx9PAPVGu5kurOrvf3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YFYOMFYz1EIYYmAA0yq2G7ieYptSTUCvXJablZ7c3INJ2v/CRvelbR3hv9s8H9vz1kKEphGw6lgGlZKhuldG4ZhKC9u0iApF9vVwHZGDA7gnGk9icRwqlNhokDHxFcOKTn52nlDjY1q1OuogMDX5YkXJm1DAIO54dVqf1Ns9BqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0i01YGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944F4C32781;
	Tue, 25 Jun 2024 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719333603;
	bh=zs0R/nUMW9F+9o//+MVNBbmIzx9PAPVGu5kurOrvf3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q0i01YGNhy/WDsdDsPUax/XbA6NHWKsM8HjwWXbtPBfI2rQhGzYptx6Usd4LMzGdK
	 XInOGbVJ/59S9x0mGss+0A/b685BUwM22rPzl3wekboi3vcTEo7H9Bsr5rLbfwlBNI
	 dFLwrG6He0DW2MBQp605m0JafM9LgHZfELzrbCrOQ1k8JgM8rhKlkqaqWNKW+np1Wi
	 Udxhr5croQ+Fdp+dcUAZofVhZccJFiGlodo72KM1nnfdXTqta5Y6aF7KgNKbq9ZJMi
	 VJ5Wh1KcBR7W1HlkcOaai7WCaE12+agyDOWmfTqWygLXoqFLnOKBk1cXtpfL1+ipP5
	 ix8BCT/GxDKjA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Xilin Wu <wuxilin123@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Steev Klimaszewski <steev@kali.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>
Subject: Re: (subset) [PATCH v9 0/5] soc: qcom: add in-kernel pd-mapper implementation
Date: Tue, 25 Jun 2024 09:45:13 -0700
Message-ID: <171933390698.2418820.597257098896589015.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
References: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 22 Jun 2024 01:03:39 +0300, Dmitry Baryshkov wrote:
> Protection domain mapper is a QMI service providing mapping between
> 'protection domains' and services supported / allowed in these domains.
> For example such mapping is required for loading of the WiFi firmware or
> for properly starting up the UCSI / altmode / battery manager support.
> 
> The existing userspace implementation has several issue. It doesn't play
> well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
> firmware location is changed (or if the firmware was not available at
> the time pd-mapper was started but the corresponding directory is
> mounted later), etc.
> 
> [...]

Applied, thanks!

[5/5] remoteproc: qcom: enable in-kernel PD mapper
      commit: 5b9f51b200dcb2c3924ecbff324fa52f1faa84d3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

