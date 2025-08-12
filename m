Return-Path: <linux-arm-msm+bounces-68621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27855B21B42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8F7B464261
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0893E2E3B00;
	Tue, 12 Aug 2025 03:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L91uTGKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AEA2E370F;
	Tue, 12 Aug 2025 03:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754967897; cv=none; b=QAWZpzoQ4sU5d/JF3BNcwQOTDyVwPgOlb7itGldMBvuCthp7wSIgOFSmYFEX2zRcOw8TFvbHuV7KHL5eSZtf1Yrh69I7SUvPPlWZ3vj4kT02scr74bmqm1XnhvZAEtCpHSQrchyB1bRlgHJTWtxl4jfZo6GRSEKT2ginN6tJmvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754967897; c=relaxed/simple;
	bh=cp8a6HIynIq9+EZwCU1mEZl2oMBlXHSZ/lMlEtjWJ7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=joOqcNzz0CAm3DahriUphhG96upAt8S8OVKponuXqz/g58JQWYVvjuaDySiVJ0UJaqrpsSZ9QiIqjXkBHDnFgPAer55xl6cGudTvG1l7H1UeFE1JZ9t6cphqcdbLaqbaq503Oq+JkBuWMbUDfV1ady2bSGM6Il2nr3AQsrT5aXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L91uTGKs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA40DC4CEFB;
	Tue, 12 Aug 2025 03:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754967897;
	bh=cp8a6HIynIq9+EZwCU1mEZl2oMBlXHSZ/lMlEtjWJ7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L91uTGKsSdnj9/XI3Do9i3ka2pMpwiGoCiayxIxVydUe9yYvvezLcWzRMzVoHlAoj
	 R6ZMDwGvrO5zy/kGAypJA0ZL78r9sqKQOBAEKIuDokh2za4sd0SNynFRw6n4fFg6+r
	 UBcwZWkFwtAP1y53YaVH5ArE54MASIrQ59NkCOyjoXf1LRSvcfpS5bf45zw23pS6JE
	 iUYNMQEk5DW1sUWbgYurz9dSg8G5rFxyG6GkLvVCwOgGUAwObOStleHDcztABV6/RG
	 z/hFLxCEr0kn8GeNayNWwxb0uvMJ/oh/UMKi2/GWoEf8rtqiSQGpZ9tgH0xHpDWoNJ
	 NqJ2z+ADr+dEg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Flatten usb controller nodes
Date: Mon, 11 Aug 2025 22:04:46 -0500
Message-ID: <175496788918.165980.17430518825409421820.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250728035812.2762957-1-krishna.kurapati@oss.qualcomm.com>
References: <20250728035812.2762957-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 28 Jul 2025 09:28:12 +0530, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Flatten usb controller nodes
      commit: d72cb0551d113a0a42e12dcdfdad78ade2c63f50

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

