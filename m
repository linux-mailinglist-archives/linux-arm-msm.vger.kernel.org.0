Return-Path: <linux-arm-msm+bounces-43387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D17E09FCCB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D293B1883767
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4F21D8A10;
	Thu, 26 Dec 2024 18:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJO4gFnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0F91D89F1;
	Thu, 26 Dec 2024 18:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237643; cv=none; b=TLpCyjlEJTL/ZJ2ylcZ18llzQ4TkbiUGfpO62kX2jZOwWB5sEbVtNrqjOfJRlMub/srDBbTBj9Nd2vpDwVUvQfgusrrlQ4j5CKwYCUq7WIZJeFezvpcJvFVBA/5IiF8XgYl1l9XAHy5UHD1qe/+HCZSHmo2ThC+4kvLFDxvDjEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237643; c=relaxed/simple;
	bh=+PGT629iADlZ+ys+RwH6X56kgC6PaAULQn8vG+BzzfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X79CU/OuTbmNYKubtGaGiyyl3/6VSYVWh8YSi8Bm96KyNJ7RaOSgJMBqIYQAzaHOYsY3MLiNLwKLM8riM2wvsxEHqHI+nXO/LGwJ2HjmZ9rJGBe0tlQBrc2vRylNMmPj7oJV7nBNDfLqGh/dbkbf5n9MPWuY370HolPJN3Z9NxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJO4gFnU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF80C4CED4;
	Thu, 26 Dec 2024 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237642;
	bh=+PGT629iADlZ+ys+RwH6X56kgC6PaAULQn8vG+BzzfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eJO4gFnU2McCCutfsqu5bCbx8SqRZKpNzzzeezk5mVGXJ/8FtbTHg8Yj0LIw8wtOH
	 uNTnZDH8+1mNp5cmIOPWSvdauKdRlF74OUDo4tl7gletsb9mI68e5CMj00CyBiEtJi
	 uF1ihED0jaYBuhBb+ud567T7pn1DZY+QrEipjECwLLKraORQf9wGbBr7IV7oJ8Hqb3
	 OwFrykT6+Iok/nc/RtuyKtQxv4WwL1uHfQGJCBo6JE3KQdQ88sm/TAIHU/IWw8vCvZ
	 CXPJUy8XgGeyV6XXvDOz89/OFm/RaGOW6a6E9J63e90WbSSH/D8eX3UqqLSE5VhgV9
	 c573RZDlw+1NA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/3] X1P42100 clock changes
Date: Thu, 26 Dec 2024 12:26:40 -0600
Message-ID: <173523761374.1412574.6777541539264789462.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221-topic-x1p4_clk-v1-0-dbaeccb74884@oss.qualcomm.com>
References: <20241221-topic-x1p4_clk-v1-0-dbaeccb74884@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Dec 2024 13:24:08 +0100, Konrad Dybcio wrote:
> X1P42100 is heavily based upon X1E80100, but ultimately it's a
> separate design.
> 
> From the clocks POV, we need a new GPUCC driver (though for ease of DT
> integration the bindings part is reused from X1E - perhaps that's
> something to look into on a broader scale, but that's not for today).
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: qcom,x1e80100-gcc: Add X1P42100
      commit: 089c09ee12317def57ab6a5159269315743083e3
[3/3] clk: qcom: Add X1P42100 GPUCC driver
      commit: 99c21c7ca6423913783ea50e2c16be3cc097f17b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

