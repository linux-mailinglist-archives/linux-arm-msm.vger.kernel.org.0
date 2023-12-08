Return-Path: <linux-arm-msm+bounces-3970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EC880A5FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CE751F21243
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6702D1F94D;
	Fri,  8 Dec 2023 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAQqTPLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404C21E4A9;
	Fri,  8 Dec 2023 14:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB36C433C7;
	Fri,  8 Dec 2023 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047074;
	bh=2OFxvrVXGN3ju31vhdzIuWPoAM2PcgOtVQ/mUI2wJ2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rAQqTPLhUn0FzfxNVixNLUZSYYPRiK5nU/3bIrkwuCOrCNMI7IdP7Wocx2iEn8Uds
	 K9pXQNXLRF3B7bNowd7V8o1O9fv9lvza068RH3fz2jVFQEJAQY/lJ8bJ8vVwoG5DSG
	 0Frl1ntKd502RJ2GibdoBKMrhPYjaYtvEo07/aIudWQfQJ0QrxDf63oArldYqBFZx3
	 kv66UvRwQes1guDauKxLsQdjDjBhTsiThJuh1EzYS/p94qMjMuRbwLn+b46MXcWc0i
	 vjjbIRHy4+KweBfBKv/ZGvMdgQsmkzqDUVvLbWjgZEP/+zNo5lYRB8h0AxXKdz8Ylt
	 Wy7wuLumn7vug==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: document SM8560 SCM Firmware Interface
Date: Fri,  8 Dec 2023 06:55:23 -0800
Message-ID: <170204733608.342318.3156607162293538559.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025-topic-sm8650-upstream-bindings-scm-v1-1-f687b5aa3c9e@linaro.org>
References: <20231025-topic-sm8650-upstream-bindings-scm-v1-1-f687b5aa3c9e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Oct 2023 09:29:17 +0200, Neil Armstrong wrote:
> Document the SCM Firmware Interface on the SM8650 Platform.
> 
> 

Applied, thanks!

[1/1] dt-bindings: firmware: qcom,scm: document SM8560 SCM Firmware Interface
      commit: 6da02af3f910bbcdd2914050cfcab1a9d7980494

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

