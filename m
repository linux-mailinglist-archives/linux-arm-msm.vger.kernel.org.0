Return-Path: <linux-arm-msm+bounces-26758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D70938CBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C0A41F24320
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C947916D4E6;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rM83Hcf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3E16C84A;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642120; cv=none; b=rwHblV2NBjkby+od/aOHZvUJrsXZi8jER6PWE/td+AZ56lnOQLqiwAWXmhFUMK0Bg1OxfXiRcvzGDEY1xhFWGWfgkmgShBx5hkiyhdD+jE7Df6xQxoiaT+9GMCp1ODruSPk02dHgFInfuP3CqKNf7+Jb56xRb/K0ovaiu56tbgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642120; c=relaxed/simple;
	bh=jWLnYM2jfTmwijyJy6MijsD/KmzgNL2miAnBtjS1YHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnrO0Mhay8i/GG56qNfHVKhMoKS8Rhj0QwkrQ1r2v8EjzIy5CFguehmFbfZARIWxRVHXYNc9OlYHFNdNIrEuCCrlB6d6zbE/zVyqovQ4FeEnQupgh9aIKr0S74XNHc6TtSGEX3cmQ8KP5YVmRhLolvk4XeZirx8R+8yBtZvSrQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rM83Hcf0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452F5C4AF10;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642120;
	bh=jWLnYM2jfTmwijyJy6MijsD/KmzgNL2miAnBtjS1YHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rM83Hcf02/77W+aO0gumPYF/SfntKNUpt/3bOH0+R+JmuCgnN0i5JWhYOzgnqy384
	 Sx0bp+wVxg+enpx9pqGFHb0abJT7NuyDk2fYs6wnnEWEOzqiUTMfwaksnJ3v7zYQE7
	 PT3rGn02Pyvks2K0TeYTzMiHY6X8v4nnLxYB7vetekm/5Egx557sb+at7CJXadOW0y
	 VZ4SOs0lrrM6/IURQJjf0bAxMUO0huWJd0j1HjheqAI9A69vL7EJkV49uC6vSXeC47
	 R1UV6ISAtzFgZcsWWFE2iiOP7FmsMEzMUtybTWxKKPOZdK5eRG+sUxo3nYp5WiqpOX
	 9YtrARNLz2Y1A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVplH-0000000079M-0ewj;
	Mon, 22 Jul 2024 11:55:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 02/12] arm64: dts: qcom: x1e80100-qcp: fix up PCIe6a pinctrl node
Date: Mon, 22 Jul 2024 11:54:49 +0200
Message-ID: <20240722095459.27437-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722095459.27437-1-johan+linaro@kernel.org>
References: <20240722095459.27437-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe6a pinctrl node appears to have been copied from the sc8280xp
CRD dts, which has the NVMe on pcie2a and uses some funny indentation.

Fix up the node name to match the x1e80100 use and label and use only
tabs for indentation.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 212ed20b3369..86735f07fbb5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -665,7 +665,7 @@ nvme_reg_en: nvme-reg-en-state {
 		bias-disable;
 	};
 
-	pcie6a_default: pcie2a-default-state {
+	pcie6a_default: pcie6a-default-state {
 		clkreq-n-pins {
 			pins = "gpio153";
 			function = "pcie6a_clk";
@@ -681,11 +681,11 @@ perst-n-pins {
 		};
 
 		wake-n-pins {
-		       pins = "gpio154";
-		       function = "gpio";
-		       drive-strength = <2>;
-		       bias-pull-up;
-	       };
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
 	};
 };
 
-- 
2.44.2


