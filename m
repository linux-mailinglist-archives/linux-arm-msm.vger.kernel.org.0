Return-Path: <linux-arm-msm+bounces-36865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB35E9BABB7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 05:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 348E8B20F7F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 04:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048B918BC0D;
	Mon,  4 Nov 2024 04:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsESGZ8K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3C518B499;
	Mon,  4 Nov 2024 04:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730693632; cv=none; b=ChOBbnUVylpZZLsaC/HrqBzWMw2GxJlaiUjgEmB7N4ZPcDLbWD0pJ6Q2xfeAYkfx4N94Z5C/oAqSEPmFLMyr7FIePauXf3NBaznd+lNlDXFg87mTL01AtO7YruLQjONznt3npdgJ7VkgMOqBwrK468Y8YI2LJ4clSGPsPKpeux4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730693632; c=relaxed/simple;
	bh=ROJm5Riqb8GCJc0XnvZBzYoadBG9Ur6SnDxmpL/YrTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TprBPGGkjNzL0yYsYzLzLnqqO9HbrVXTQoIpneSyrAvt/K+V/7vGBM4oOcNpiK2Vl/rhsDwcDwZpBaeEPlxcFJYOMMpNXpp0gqSk4eXZ4yQcqfk6uRXXdwcJu5vHKEl6yEUfL3MIwAMLUWB0Qa0GVzpncsbZ+71ESU2n+iwUnVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsESGZ8K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEBFC4CED0;
	Mon,  4 Nov 2024 04:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730693632;
	bh=ROJm5Riqb8GCJc0XnvZBzYoadBG9Ur6SnDxmpL/YrTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EsESGZ8Ky7HSnFWgsR309UR9iMynpszUJiQFII+4Mj48L78xNt7ZrIDel28BKY8Ag
	 9ALLBK1h5hdaNbUDjHeVNlNTRKVgrsB+hh79NWZHrUEJVhFUe4dSfwpmd6EK5mtOc2
	 oi6KHVHM215LgDipRhnFgr+36fFS36WDVTLWrbKiN3iyNJtMAokretXc0qEolEF4Sy
	 HkH2LAkNeHHBnt2KPBa1Hyg0RDcV9WL5oC18aop/zKmw1MgsoW73xAgCS9SqTA9ezO
	 lTmWlOl01usL9idiYA1zhnQbnrxsMWhAGYsnEqrq9t89I16yq3VrPXCsoUgkzLoy9T
	 OcTV/kQ5AmoqA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Depeng Shao <quic_depengs@quicinc.com>,
	Vikram Sharma <quic_vikramsa@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] qcom: camss: dts: Prune and tidy x13s, rb5 and rb3 CAMSS dts
Date: Sun,  3 Nov 2024 22:13:39 -0600
Message-ID: <173069362373.23540.10398389041972525975.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Oct 2024 16:43:22 +0100, Bryan O'Donoghue wrote:
> This series does a refresh on upstream x13s, rb5 and rb3 dts.
> 
> Firstly:
> Moving from static dts files for the mezzanine cards to dtso.
> A recent examples of this approach is here:
> 
> Commit: bc90f56a1699 ("arm64: dts: sm8650-hdk: add support for the Display Card overlay")
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Convert mezzanine riser to dtbo
      commit: 231c03c6119d98ae26c7fe72c3281091eb41a35e
[2/6] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Convert mezzanine riser to dtso
      commit: 30df676a31b7a4881352097d8ae7c2bb83515a17
[3/6] arm64: dts: qcom: sc8280xp-x13s: Drop redundant clock-lanes from camera@10
      commit: ec83cf7581bd0a03e2a4a7145ffb4eda1f2e243a
[4/6] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Drop redundant clock-lanes from camera@1a
      commit: 2d444a792b3c3d763e291f05402c4650d4ae7a9b
[5/6] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add cma heap for libcamera softisp support
      commit: 99d557cfe4fcf89664762796678e26009aa3bdd9
[6/6] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add cma heap for libcamera softisp support
      commit: d40fd02c1faf8faad57a7579b573bc5be51faabe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

