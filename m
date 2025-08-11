Return-Path: <linux-arm-msm+bounces-68391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4F6B20CBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F418D188F2FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799E12DF3F9;
	Mon, 11 Aug 2025 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBNOS65W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BE72DF3CC;
	Mon, 11 Aug 2025 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924248; cv=none; b=F+04pCnY7TUfZVa4/hrel2YpbaT/nq1ubpulJhncv0T7r+2TLTnOsjRWjgDjiOtM+lnufHKj7W42SMFBg1zAGV+3NmPgcw7rkGVA8r3pwdyvQswmaNEQLGGIFohrngd0R3yfyw85M8yr+nuxfrvY5GxHb54oY1Fd9jo5REJ7LhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924248; c=relaxed/simple;
	bh=k9bHcKadN+tM82VIVuIzcD0ZNas/mePGWyteCf+xXYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bvkn1L9OOwLSA13IGDXphLr1v3+Y4ewj5W41CFVKDfwH5kCF93bNna5iXyLJi+taQjUCc+aQeotmMimEHAmoWHLY4kY7wUm8Qtwh03yEprS4KWNxkEOYo770GruTSHA4xjS5ytRKg5ntnoNRQH1wTBS/fmz5E3Lq370qqdgXjBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBNOS65W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D94C4CEF7;
	Mon, 11 Aug 2025 14:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754924247;
	bh=k9bHcKadN+tM82VIVuIzcD0ZNas/mePGWyteCf+xXYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iBNOS65Wm6nCUQF/tYAVc5PqovydXEXWbZY4J9opYLTLa20/ggv4yfaZUmY/X4ZF9
	 qAlFLembFLBOrdBZUMOAP30NtpQBkNPsV0GegAVVy7pXWWLIB8NHlDHlc7x4QdSgva
	 D9vpgNpR0CrXeJbMZokvGfS9kvHaGIYQ8PyDhxY3CN+gn0TMvdKbMdkoy7KJRuao/Q
	 RxwveMLMlLcqCvT5RLtfOzimxoFEHsTRzUNwxSHbz3y5Ohsp05jVGqBDrkEodTG5O/
	 fSK2SQKe1odhsGZa5kIFiZrwmGer38jlcLgd2T8DL5tSDg9FRJiTzstD4XM0B39aPC
	 uWZ0bugXxbr6A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: sort out RPMhPD domain indices
Date: Mon, 11 Aug 2025 09:57:21 -0500
Message-ID: <175492423743.121102.14480738725760965623.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250718-fix-rpmhpd-abi-v2-0-0059edb9ddb3@oss.qualcomm.com>
References: <20250718-fix-rpmhpd-abi-v2-0-0059edb9ddb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 18 Jul 2025 18:25:37 +0300, Dmitry Baryshkov wrote:
> Several Qualcomm board DTs either use incorrect power domain indices or
> use old defines for RPMhPD even though the platform should be using
> RPMHPD_foo defines. Correct all those issues.
> 
> 

Applied, thanks!

[1/4] arm64: dts: qcom: sa8775p: fix RPMh power domain indices
      commit: 3ede313b5ec41bf1064fc35a168618eaee0d8e98
[2/4] arm64: dts: qcom: sm8150: use correct PD for DisplayPort controller
      commit: 1d517444b21e49bb049dc1ca9df0281ba5203c86
[3/4] arm64: dts: qcom: sm8250: stop using SoC-specific genpd indices
      commit: c48aa92720dc1b883982b1b7e110429d2e316c22
[4/4] arm64: dts: qcom: sm8550: stop using SoC-specific genpd indices
      commit: 633ffe23173d947e4075ecf419889a59e6851ea9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

