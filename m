Return-Path: <linux-arm-msm+bounces-37231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779209C050C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 12:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A97291C21266
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 11:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9AF20EA33;
	Thu,  7 Nov 2024 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nd3VY7Aj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF9020CCD1;
	Thu,  7 Nov 2024 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730980696; cv=none; b=QA/WhC+S+JqRgst3v4tZxJdrE0ai21su36qXn76gBLXQQ3aJdsrX+7O/Ddinoi7vQubyy3zV5gghdr9RpH3WjEU4Pb3QdZd2EdkCa6KSaoqY5c+2sFgcTTf/XyUvR1I7dIiKzsDxPtHy/Zyv0uzZQW9E6F0BExVtnNrEgRygLjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730980696; c=relaxed/simple;
	bh=Gh/ompZkwURn0PwOkifty4Ajs5DMdgzLZxjoSuHPK3g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m8/vRrql6I2Yys3Jum57cgiaexR/V44b510tsRzGtlK1WsdEJAZMx9GdOV94efwVYYR9YYOlRrR0gVQlDbweZ27qX0r7lHG0MDw8JsG+AVSqeAn759o9RbTDOlH8Gb0pyFdUk0Ty9e2Sm7AjLIVCQiwiAOwKFU6FDFjs2LBrQIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nd3VY7Aj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9452C4CECE;
	Thu,  7 Nov 2024 11:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730980695;
	bh=Gh/ompZkwURn0PwOkifty4Ajs5DMdgzLZxjoSuHPK3g=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nd3VY7Aja2UhjCkdssEGJAn8WYU0/vn8jv5UgOSkD/HjAXbTssVVPy0hqXs87VwlG
	 AHu52Cx1kMuLMZZ4Y0V6JKnVGHprvgINzuR9/qtUrVDjQD1GNp7alw+KpJ50pWNKK9
	 SuA0Bja2bNSGiZ9/aLDECTDabmpxVwX6Q/dabRyQEVk43O9nxQceU6ql89BmN1MrCG
	 X3RUF4+enipJe8GLixJrj/jaksQ/OAtYKEbRhK2Z1XVk7e2DXvFtRQrpCD0lbzWb/+
	 tYZYjPG1o6dY3Pzqwo6sMbhKRd/W6RXq+Orfzb4OIk2nczJcYeFnKuANMkPrtUB1A8
	 JFZvoYfr/SJng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97515D43352;
	Thu,  7 Nov 2024 11:58:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH 0/2] clk: qcom: gcc-{sm8550/sm8650}: Fix UFS resume from
 suspend issue
Date: Thu, 07 Nov 2024 11:58:08 +0000
Message-Id: <20241107-ufs-clk-fix-v1-0-6032ff22a052@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFCrLGcC/x2MQQqAIBAAvyJ7bkHFEPtKdAhbaykslCIQ/550n
 IGZApkSU4ZBFEj0cOYzNlCdAL/NcSXkpTFoqY1S0uIdMvpjx8AvknFEWjrbOwOtuBI1/d/GqdY
 PcoxysV0AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Gh/ompZkwURn0PwOkifty4Ajs5DMdgzLZxjoSuHPK3g=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnLKtReLRazqpEK4DZPuTzY71FdYMrbx2WEhOnt
 pZm60uhuSqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZyyrUQAKCRBVnxHm/pHO
 9VgjB/4iieean0IziLGHHrJI59WIFDmy9utZzqMMwJ049ru36KmxBmdBfCp/UH9YzV1W8wEZal3
 AdKLjERvX+l+N16/j05L32RWjxq3y9usqz12ulTYMA4k9qi07uZEq4CRaYBNz505MdzGdxosVJq
 LcZZfRQMYTylWvl9rwXw5FcyDcmQ5Y//uRQLutgxRznjTOMEwAybvCLjt/qSDs8zUrEZ9aC2Nc+
 P87+TBbDA4mw/Y/90cJpPBEXoVLa2MgjzhUboLaQaMMZzXA448r8Fp+DL60/m4/U1dKveuK1NUN
 8UTh6pljk9YPKANcqyUalQkye156zFnanrZkGNU5VCYEfm65
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

Hi,

This series fixes the UFS resume from suspend issue by marking the UFS PHY GDSCs
as ALWAYS_ON. Starting from SM8550, UFS PHY GDSCs doesn't support retention
state. So we should keep them always on so that they don't loose the state
during suspend.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (2):
      clk: qcom: gcc-sm8550: Keep UFS PHY GDSCs ALWAYS_ON
      clk: qcom: gcc-sm8650: Keep UFS PHY GDSCs ALWAYS_ON

 drivers/clk/qcom/gcc-sm8550.c | 4 ++--
 drivers/clk/qcom/gcc-sm8650.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241107-ufs-clk-fix-e49ee2097594

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



