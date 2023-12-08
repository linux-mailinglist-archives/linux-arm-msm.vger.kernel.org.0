Return-Path: <linux-arm-msm+bounces-3973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF16F80A600
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AFF7281CA2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1490D200C6;
	Fri,  8 Dec 2023 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7J9kCQG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971E1E4A9;
	Fri,  8 Dec 2023 14:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E77C433C7;
	Fri,  8 Dec 2023 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047078;
	bh=cG8W0M/t4/u1ISE9ZqR1C1c719aguQoxMpPo2EFRDE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X7J9kCQG7e3dktXVBofkt8WZ4LovJQJOpGTx/B+i6dV5T+40WUydnk4POSz47ntdJ
	 4QLAQrcPx+yY0MLVWRSdxvqVFEuEZinmOaRXax6BFh/ASgTL8HPIW8A73ysHhC9EPA
	 NCu/rJObyIPqRDW/2lXRpE1AnnXlsyloXPPyr1Qoa9cXjlcMt+5Rpkah2RSTkgYKG1
	 0altbXr57gs8bM0TRny1reuEbkbqxI1K0S/yh+glwElYkJXvf0ZomuqsQONVdymenh
	 2C7W897jpHkhzQAwA+5hhaDQS4iwZ8LDkbbhdWTVcuOs9xr7GlYauGDBwnnEGFb1FH
	 /0aP3/9e98OlA==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 0/2] soc: qcom: llcc: Introduce support for SM8650
Date: Fri,  8 Dec 2023 06:55:27 -0800
Message-ID: <170204733614.342318.16799780457521942115.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030-topic-sm8650-upstream-llcc-v2-0-f281cec608e2@linaro.org>
References: <20231030-topic-sm8650-upstream-llcc-v2-0-f281cec608e2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Oct 2023 10:45:13 +0100, Neil Armstrong wrote:
> Add LLCC tables and Bindings for SM8650 platform.
> 
> Dependencies: None
> 
> For convenience, a regularly refreshed linux-next based git tree containing
> all the SM8650 related work is available at:
> https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm8650/upstream/integ
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: cache: qcom,llcc: Document the SM8650 Last Level Cache Controller
      commit: 8fa41c40a1cb8bd78e3aba36865162c8d7019d94
[2/2] soc: qcom: llcc: Add configuration data for SM8650
      commit: 7a280fec21fa4ca313e7aa6708f2480757501053

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

