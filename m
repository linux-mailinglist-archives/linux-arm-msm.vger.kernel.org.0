Return-Path: <linux-arm-msm+bounces-79711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 777C7C21286
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA54D1A6416B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEF236838C;
	Thu, 30 Oct 2025 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lm2DIopT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DD0368383;
	Thu, 30 Oct 2025 16:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761841364; cv=none; b=eOr0f7hc2KFKvc6MJ1twtsIkBqyn1SjRR+xJNC4XyhAoqUjcc7urc0wrQa9sY9D/SEs90OQKdk/3TMQlhN+FaqtuuRK8xnIR4FMd9RML9r61a0yTzrb0bSuIZze07Y6UwlfxoHdI7rzk4nj7LztRso8mqLm6Fm/LBjoK2HDZVRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761841364; c=relaxed/simple;
	bh=mufiysJvjZh/Si7EgRf1BTJFlisWd4q4BAHM4Beh1g0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t9og7lxyhGmhSOuJZYtcKG2PxO2mGVRDKQ9j41jN13VA+Y+lt9Ayvorr7mJFbANZHlz4iCUrXhb1mHsU/e2Wqhvk+XlUFHmwoQgHMiXP1PvNjAcuM0iQubqRqCkeQQ93j2g5W15cRN3Z/xmZ4EKPEq8TqpsN9fM75XFwqKXYMG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lm2DIopT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F65C4CEFB;
	Thu, 30 Oct 2025 16:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841363;
	bh=mufiysJvjZh/Si7EgRf1BTJFlisWd4q4BAHM4Beh1g0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lm2DIopTxVcPaGVfLuWVFJvBdyl6Yeci5sSpx6LylAZ63bcIymsHDqr+bSXBX/0tE
	 7ewrO88brx9bF8/Ff7tMyHxwvLQry2VYc1Ik4p03ntt21Mfq4RPzVcqijsq+X4HZRD
	 fpiaMdgLtPiPilOojCbPG7UAbAVNmlHqYCfH9FMQMojg5C8xBQbfESKEgNMwgCwWXH
	 bsSh3+dpvk4yh7pMbh36hzFjp0LQPSwzdCzxEV2v1kjDdqyTYaUToJ4Mle9HzB003T
	 dCb3yfxdaDtFLfPFqLh/t9ERSGw+4aVvyaswMDt3qSAOB5d/OABgkLf+t8JJgaOP7K
	 3EOuHdd8dw9Dg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] dt-bindings: soc: qcom: Add soc related bindings for Kaanapali and Glymur
Date: Thu, 30 Oct 2025 11:25:36 -0500
Message-ID: <176184154229.475875.1577854234314562353.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Oct 2025 00:28:40 -0700, Jingyi Wang wrote:
> Add soc related bindings for Kaanapali Platform including aoss_qmp,
> imem and scm. And add aoss_qmp for Glymur.
> 
> 

Applied, thanks!

[4/4] dt-bindings: soc: qcom,aoss-qmp: Document the Glymur AOSS side channel
      commit: df8764c2cbfeae63c4fa42c9d4ce926e412fa53c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

