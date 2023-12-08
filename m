Return-Path: <linux-arm-msm+bounces-3972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE84680A5FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 682341F212F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6F1200A0;
	Fri,  8 Dec 2023 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4DnV1nb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298081E4A9;
	Fri,  8 Dec 2023 14:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E236DC433D9;
	Fri,  8 Dec 2023 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047076;
	bh=WnmqcMPpVIektD3QGorz6YQXFsBIVPz0fTyEU6733OQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p4DnV1nbIM+icwnNCABoVOMtKtP3Po6RaN2cFNS8rc0mO8e2pjpYGVvxMUfklKPgu
	 ChJgPoaCwm/AMZ69YD18bBcbQhJG+qL3HCX1yz2cX0BokD6EayFtRvfd0TyvPIcAhe
	 /5ye6bpuH6X19/D3FZYzrOmYwdaV/dN2E6eclZ2kaq7RE/Qkf0GE/KV/C05MohZc5d
	 EMAxSu9F9BMvVYQRsisWl/gUSzmm7WMCQzL0P+qdmGiIx5zO1XrQZgCYoyxIxlNILi
	 q67YFNtsDdzwtrHcJvGxbM31aCv5RRebtAj3+oRRgZJRNHuYvlKXMsNv+b+BvPi5bY
	 w9TjfSfC4b9qw==
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
Subject: Re: [PATCH] dt-bindings: soc: qcom: pmic-glink: document SM8650 compatible
Date: Fri,  8 Dec 2023 06:55:25 -0800
Message-ID: <170204733634.342318.4541849857881584524.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025-topic-sm8650-upstream-bindings-pmic-glink-v1-1-0c2829a62565@linaro.org>
References: <20231025-topic-sm8650-upstream-bindings-pmic-glink-v1-1-0c2829a62565@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Oct 2023 09:27:57 +0200, Neil Armstrong wrote:
> Document the PMIC GLINK firmware interface on the SM8650 Platform
> by using the SM8550 bindings as fallback.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom: pmic-glink: document SM8650 compatible
      commit: 98e8bc43c225d77966fde6e0138e3ee307d3c208

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

