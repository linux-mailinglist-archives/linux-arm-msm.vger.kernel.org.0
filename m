Return-Path: <linux-arm-msm+bounces-57501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C6EAB1FCC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ADCFA235EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE80264A61;
	Fri,  9 May 2025 22:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9qPElr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E025EF9B;
	Fri,  9 May 2025 22:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828818; cv=none; b=QoPD83vKTH2DABvTQrClXyoP1br0PeS+Al/2oP2buk0jWEMm0oVHq7lgXuo9TXO5vE0YADZCTczPrl7ZoaiSqFouAFoC8FAPoHs2cZ1I3eUMFeQkD09Yu68knSSEfZtCB2rQRjg1Na+tBDJ1nNntPbIkqSwvXkvnN8CnvteezkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828818; c=relaxed/simple;
	bh=/llQsZpsmpj3etelRNzIfWyqO7s6seDIgLv5gr/7Uiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I52A8q54hvJB4s620nx9QVIM0uvUrYwBbpS2c2Wb2+nEJxBFZoBYYwATxSvqGJplNiqki2xB8HzIHvkt52jkqPKJrnd/eM876H9b63NlKddxrSLbm8N1HlFbIlPWvbrXLATmEILtkOOKJohTlbL7oe8GG3Q89v39CXSHcCYjz4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9qPElr4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D8EC4CEFB;
	Fri,  9 May 2025 22:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746828817;
	bh=/llQsZpsmpj3etelRNzIfWyqO7s6seDIgLv5gr/7Uiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M9qPElr4VcrzbOp/zjIIyT22MCjUJT5i5iIF5R4pnq5tduNhV7yXJheJc9nQ4QegY
	 QO8fgWXjIVqn0bgs/ctlCHocEQj295zVgkih+jIEC6ThXCQI4re8EJpzkFrIPWxZGH
	 RtyM6nr9atokxH+exH1L5Yzi4C7yGqdUF9f5I01LBpMKmKhjR9maaJ4xoH8Dzsok+J
	 GkZ5TUI/dXKDLr4lyldM1T+xqpgZZkI1uGy/r01nz7kAHRLkpxZwU4SEcmM04EEWaq
	 dDuCIJ+w4CeMIWRLm5Wv1v/SFJ8HwRAoOYSCNZsU7NtX1CF893wsPHpsWQxtRa/7jc
	 HJ5SUx5wNveFg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 00/10] ARM: qcom: fix APQ8064 schema warnings
Date: Fri,  9 May 2025 17:13:24 -0500
Message-ID: <174682880490.49052.1880417553268846900.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 15:21:53 +0200, Dmitry Baryshkov wrote:
> Rob's bot has reported [1] several warnings for Nexus 4 submisson,
> however none of those warnings are specific to that device. Fix all
> those warnings for all APQ8064 platforms by extending existing schemas,
> adding missing schemas and making APQ8064 DT follow all the schema
> files.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: soc: qcom,rpm: add missing clock-controller node
        commit: dc4ec780313c698dd75f685250f98f98e07f9f17
[02/10] dt-bindings: soc: qcom: qcom,rpm: add missing clock/-names properties
        commit: 3022ae40e92b1458901867a114472cff76dd3531

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

