Return-Path: <linux-arm-msm+bounces-5095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D48160BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5547282442
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A2746529;
	Sun, 17 Dec 2023 17:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpiJ+uON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011EF46456;
	Sun, 17 Dec 2023 17:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CA5C433CB;
	Sun, 17 Dec 2023 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833696;
	bh=aUnbtBvYc5j5FQICjWzIW/hZZLwVpxAe15LU129bb8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SpiJ+uONUjJtRq6cFLS0HMHHPpgGpXwZrZKgPmLvC2JB6dAjRLhDH8f9qC3BvOrhy
	 zDOSVT+nAHV/lGtMZyaPvqQJG2Gltdj/iEfSXb8fKhB7UhRF3GRzZYWxUCW+wLADM8
	 HJ/2Utw0MrL5qocmlXS2J3rBvV5R04L/nFswj4SX5x2p62JCxqYyw8FY4la8cFKpWW
	 HmZzNgOD9+WKgSyEfq9d9/PTXo2URfw53LwfFNTQnOuhlVALo+Y6PSDmFHhS28XXA3
	 kmdeLakT31qreH2v/8Q9lLKjq3rQMvtYpQotZZXajPz2RUWeerbaPvZl4jHLVUc+GF
	 Bcv0ujYK1A/yw==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom,aoss-qmp: document the X1E80100 Always-On Subsystem side channel
Date: Sun, 17 Dec 2023 11:20:53 -0600
Message-ID: <170283349431.66089.9014562198203733569.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231214-x1e80100-soc-qcom-aoss-v1-1-94c46c5182fd@linaro.org>
References: <20231214-x1e80100-soc-qcom-aoss-v1-1-94c46c5182fd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 Dec 2023 19:35:50 +0200, Abel Vesa wrote:
> Document the Always-On Subsystem side channel on the X1E80100 Platform.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom,aoss-qmp: document the X1E80100 Always-On Subsystem side channel
      commit: ce2e6658cfa02ef7fb7b697abac85742af4cc0c0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

