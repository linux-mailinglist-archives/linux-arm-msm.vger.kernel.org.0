Return-Path: <linux-arm-msm+bounces-3971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CE680A5FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85DBFB20CC0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547CD2033C;
	Fri,  8 Dec 2023 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKAIE8mD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A191E4A9;
	Fri,  8 Dec 2023 14:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01121C43397;
	Fri,  8 Dec 2023 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047075;
	bh=ixnZw9Pfic/HpM05X3/v6NL62exJ9aOzdidCODnBIgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nKAIE8mDbVDpDov2S+joCY/+0dp2s21NT3w5OfyaVKMCBrLHbaDeI3NJorGdmVI2O
	 1Fk7/JH1X0SrMwnZgR9zUcXW3Fbk+GeFIvF7ep2GVXlfyXGA3wj8on06r2mypyEEYY
	 6rjHDif/ZP093nYw8Q4WDWTfvYa7GPh0nuSVdjfOi+dQppbcm+dZY02aPQjkl68ITl
	 JkxfMp3ynNk6tkU7csXftvLJc4FYXZiFSRy5rkCp7S9Ue/B3Lsj/X1D9wSVk4ZezfK
	 z4I3EnGxbzV5mFTDKKLKJIyvlN/uIleKBr4QXKqKPSuv1Mn8wTlQ+yIhSpntN708H/
	 DNYrVpxsCedtA==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom,aoss-qmp: document the SM8560 Always-On Subsystem side channel
Date: Fri,  8 Dec 2023 06:55:24 -0800
Message-ID: <170204733607.342318.965190606909408410.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025-topic-sm8650-upstream-bindings-aoss-qmp-v1-1-8940621d704c@linaro.org>
References: <20231025-topic-sm8650-upstream-bindings-aoss-qmp-v1-1-8940621d704c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Oct 2023 09:18:27 +0200, Neil Armstrong wrote:
> Document the Always-On Subsystem side channel on the SM8650 Platform.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom,aoss-qmp: document the SM8560 Always-On Subsystem side channel
      commit: 8c1f28ff1356dd1f0ede9b378c9dadbfa7539187

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

