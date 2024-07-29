Return-Path: <linux-arm-msm+bounces-27186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B838A93EC5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DAEA28245F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839F7143C70;
	Mon, 29 Jul 2024 03:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocRL3XaS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD77143C55;
	Mon, 29 Jul 2024 03:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225545; cv=none; b=XdWc6pXEZKhCe1eUqamuqet3cuPv8z0+t6o1yBMpcUDS4k+Axff7quXLzt2ZI9JcgpfINC7MKeL88yy7zgled8ilu81v5R64OEeWW3GCGCAAPXr5KXuFDgpdV2bWHCgWFj6Fp9UdBXDfTYo9MVFbNksyu6Mrrhdrc4OWevYJIug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225545; c=relaxed/simple;
	bh=WmzVry7X9ZYGVrQa8PD+Trqhtih9BzgquIuX9aqJJec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKF6WbK9jf18UifwPAeP5YvMIbAGBJsmI+cN0BkHJUxQeLSf5JMGHh3cSy8RzJGs6omxaNUeKYX+H0XEL9+i27FMfxPh0Jnt0sM4xb+RGc0bCVSrp8NXyD/mDNnsg+qo1GTy8zD0Ssj3CfPdVZrxartSUGzpW4noWLWEjfV0DYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocRL3XaS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E7DC4AF11;
	Mon, 29 Jul 2024 03:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225545;
	bh=WmzVry7X9ZYGVrQa8PD+Trqhtih9BzgquIuX9aqJJec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ocRL3XaSl3SbC/PBKScGtd8CFQXUHaHACP4cWNlyFRR3cjQIIqEaZj5uLKCHoWzHl
	 F+lyCiS2UELQfYaIeV2Ki2QnIKF7yOrdQ3fPrR2Tsc9fSB3pRxcjsV2efzaM2OgQqU
	 eh8L/YxF40fS1vAb0tTdW/IK8TycMrVUd8UwFckG0d8+9oYXiG/0RKiRqvkZIDMga2
	 sIxUXydlnsQ8Rff3+MRHE8MZsc40RUCDCKJrpo/pILz5HsvI9tEw4UbiEyGR1A9jI5
	 bdXDDrnQtFLPEsnrsygedEHCPSHCKqUs0mR6gIAuTALO9lees6GBaqga27ZSOaYwU9
	 4RVKyUDk433MQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 0/5] ARM: dts: qcom: adhere to pinctrl dt schema
Date: Sun, 28 Jul 2024 22:58:30 -0500
Message-ID: <172222551302.175430.13462932727966070475.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711110545.31641-2-rayyan.ansari@linaro.org>
References: <20240711110545.31641-2-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Jul 2024 12:01:37 +0100, Rayyan Ansari wrote:
> The following patches make the device trees compliant with the pinctrl
> text to dt schema conversion here:
> https://lore.kernel.org/all/20240709162009.5166-1-rayyan.ansari@linaro.org/
> 
> v1: https://lore.kernel.org/all/20240710084250.11342-1-rayyan.ansari@linaro.org/
> 
> Thanks,
> Rayyan
> 
> [...]

Applied, thanks!

[1/5] ARM: dts: qcom: apq8064-pins: correct error in drive-strength property
      commit: 046301eafc3296efe7266832b47c9cc93ff0ad38
[2/5] ARM: dts: qcom: asus,nexus7-flo: remove duplicate pinctrl handle in i2c nodes
      commit: 6dbec1c39d3ff53e24e434862c7b7da3552b1ffe
[3/5] ARM: dts: qcom: apq8064: adhere to pinctrl dtschema
      commit: c9c8f449c8a27791bd8540cbcb538a19568608cc
[4/5] ARM: dts: qcom: ipq8064: adhere to pinctrl dtschema
      commit: de52c020e1a9c3313d88405a4545020b1f5ab24d
[5/5] ARM: dts: qcom: ipq4019: adhere to pinctrl dtschema
      commit: 268a968ef946ccce45be7c01bf915dddce7208c9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

