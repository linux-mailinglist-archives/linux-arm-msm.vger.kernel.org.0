Return-Path: <linux-arm-msm+bounces-21840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 620EA8FDD48
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 05:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDA7EB22196
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 03:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1EB1DA4C;
	Thu,  6 Jun 2024 03:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoksV4wo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F59440C;
	Thu,  6 Jun 2024 03:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644040; cv=none; b=aA0SB6riK2pkaEaKKsYQ0a0uzTrbLqwDHauUAGINQmRAlTcY7BHmaGwSZ+HCu8c45CNZAwgI+080akP+XTAVGQQeq8/SPdOBY4UtjN7eTvB3jvCbfgSxl/rgw5hgrzUpBvkUpFr9FEIxw4aJc85k5+fq9o2V9O5TRmi7HaOmCyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644040; c=relaxed/simple;
	bh=jphOjgoz1IXbJxdYycZLQ2ACa7IfKebep1DTx2YA0uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=poEZkmY0Oi7Xb7spth5r5Eroo2f/C/fPqdaOaTJ82c035Lisx4jJ8xKX3pupqXr9r6N87vKjBqhGHOQQYhHUlEsY2NQg32G636Tui5cC9yODr/0Lg1vkxq+CjSKlG0kxqGP5hgca0EFRCQ4WS1bZ0R2lkXaTgupyzzG1btWoOGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoksV4wo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB28C2BD10;
	Thu,  6 Jun 2024 03:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717644039;
	bh=jphOjgoz1IXbJxdYycZLQ2ACa7IfKebep1DTx2YA0uQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UoksV4wo4wysryJGSDVhCv0cATV7YiIeJxFAk6cf0ZtXKBGZjywBYSaiEWB9D1rDV
	 Pr/qZlJqI6Iido0GZGvrC8pAa0/S1cME+dalj72U6TuC52avhg9HDeDbwYMAQcmbEJ
	 LrOlTdA7On3K9yApJKX8QcW9eBUx1d+z3i+N6hIrYJzimv+6EQqxhceZIHGd2NgdiL
	 1h37ym769dTXfohEB3O8d3/4O9tabm6pBlJ4OJMLFI4jQOXLLMmfo0ShJt58EgXbLb
	 FCP7B/wk6c9D0YfYVXt/3RtQS/n6+Du55GN4Dx1CNqocqIkNkum9cAQcWgYreUCZoH
	 mstSbUtY/TybA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Disable the SMB2360 4th instance by default
Date: Wed,  5 Jun 2024 22:20:26 -0500
Message-ID: <171764403333.730206.143061270623156081.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240603-x1e80100-dts-pmics-drop-4th-smb2360-from-crd-v2-1-fb63973cc07d@linaro.org>
References: <20240603-x1e80100-dts-pmics-drop-4th-smb2360-from-crd-v2-1-fb63973cc07d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Jun 2024 11:17:17 +0300, Abel Vesa wrote:
> The CRD board doesn't have the 4th SMB2360 PMIC populated while the QCP
> does. So enable it on QCP only. This fixes the warning for the missing
> PMIC on CRD as well.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Disable the SMB2360 4th instance by default
      commit: 0e500122d0e9932f985ba13b9f66e191ff604ffd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

