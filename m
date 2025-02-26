Return-Path: <linux-arm-msm+bounces-49489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC7FA45DCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2941B1899522
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3EE21ABDF;
	Wed, 26 Feb 2025 11:50:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E08B218845;
	Wed, 26 Feb 2025 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740570631; cv=none; b=WWKpdUU1SEmpuTjO+zca0ykutpmYgMsNp8JuN2viG8XbFBLaWHS53CG/9GusSftM3kFbbxXzGMxS+mdwFjR3qyklvv/AKkZMqpOywdkChvvyx+OuUYwVMbozPj3mBQDKiAYt1qPakcROMTrGBxGV4eCP4/7qecP2uMjUnj4mGvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740570631; c=relaxed/simple;
	bh=HNfX/NM1l3gCoaD7uUn++PqQND2o3uQwcNFZh2DqyPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LbLFD31Wfa8VDr91PezLm5J6yJgtkDIu70nuScQFEwxB5wlb2MoQrXMCqESCCUvxjpL94wpCXpnwwKbAHtiQnejr8DscxuG+6q5q+hTCa93QvEIqAQPhV/MDPIwP9C1T9pLwyVSl+2ULlOx/d77XLhL5e4K+wzm50nW0Xdh61m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB8D81516;
	Wed, 26 Feb 2025 03:50:44 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B3A43F6A8;
	Wed, 26 Feb 2025 03:50:27 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: coresight: qcom,coresight-tpda: Fix too many 'reg'
Date: Wed, 26 Feb 2025 11:50:18 +0000
Message-ID: <174057060414.1607370.3307069350698832445.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226112914.94361-1-krzysztof.kozlowski@linaro.org>
References: <20250226112914.94361-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Feb 2025 12:29:13 +0100, Krzysztof Kozlowski wrote:
> Binding listed variable number of IO addresses without defining them,
> however example DTS code, all in-tree DTS and Linux kernel driver
> mention only one address space, so drop the second to make binding
> precise and correctly describe the hardware.
> 
> 

Applied, thanks!

[1/2] dt-bindings: coresight: qcom,coresight-tpda: Fix too many 'reg'
      https://git.kernel.org/coresight/c/d72deaf0
[2/2] dt-bindings: coresight: qcom,coresight-tpdm: Fix too many 'reg'
      https://git.kernel.org/coresight/c/1e4e4542

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

