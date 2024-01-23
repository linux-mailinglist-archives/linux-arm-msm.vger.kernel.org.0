Return-Path: <linux-arm-msm+bounces-7896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D3E838970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 09:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA14228C2AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 08:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B5358102;
	Tue, 23 Jan 2024 08:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tYY6FxVY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A557894
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705999751; cv=none; b=AwSa1AvqT5ZbGdlUk7h67e5TF8kgCJLxOcXDxix5/cLshkHoQ4O7+G/0as8g6/cGAc7SoPD9+/ikNn/O1EG+EljUU6fK+4ZuF/K62LpE1RJzLPf2Ez183DyAoW30uPDjgfySPiI6Rm8icCHgKzKrTRH0j+HTkRqNNUj/Q25E6eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705999751; c=relaxed/simple;
	bh=Ijb4cNUN6qT6KjrYfTKe64L5Bjvj6MAO6mPdifj/E9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fhjzVKibehG8s6yJIxJQ7k2+/QTixiHdEcuLRkKhMMAgsLORbjhYxYrJqGbNCO/d9cudMJmtCXbBHxr2WVXuhov20iaZH1ib0li+vDuGxnrUIf9W/Lzv42uvmt5lS0jTaOFd0NigdC5IwbZROm/yLCW3T0YpWvcXcBKlYsVdhRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tYY6FxVY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40ec048e0c1so586425e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705999747; x=1706604547; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UniTpQrqL4gEvFujj2TXerHH/FkdwNuatW9WdHjVmBI=;
        b=tYY6FxVYFkWLq8DL0GW4uTsShVl5Tzn1CruTA19WgGhBzox6FbepfU9YPuiVKUwQ6y
         ZjXqnnRGhfncmSedYjCym9Zx1z1H1pXVrpiP3hDSV9t+KdzcYS5JfIC0J9Gd2qlHxvL+
         i63IVECboHUiXdXgwnHrjx+rp3FibaGc6oRCaVZOf0R+nAbPwEeIpuzsb73DHr7+uX93
         1RB4fblOmYIBrYm8KCX0hVKyQUCgfiA8v5+YVvK1y0U2mBg6eS9q50wfatHwDKdq4PRU
         PkFTrv2v4zlA+QPWU3xrTkDSxbCpn4rIfiQOnUMa2BpFQwlxtkoJGeATeN4z+OHPbXuv
         9Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705999747; x=1706604547;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UniTpQrqL4gEvFujj2TXerHH/FkdwNuatW9WdHjVmBI=;
        b=n35w+3wNtnmih592hz5C7gj0q+vC+LtLMMxOEH34hgd7MquiROPjjF/HjPm2IXJB4Y
         uDeMzBhEkCcBg7hP65q3XqmIGsirC6WBU74gWaHSwsK0bLbghqGNvstSZGvrKmbyjtv9
         GpYhzY9unjZjFTREBY/BJQKZf7eTPdZIKgUlQtpyaZXw6MXW40/QXrR1YKthKflHQbOP
         G+oSnBrj3lUYAOr6NIfefJJMsTQCS8QQ50bpOVXhrI+z7gUmpDrt7AGFYRO3q0kUxyGm
         qXfRbg1WTkdIW6ob83LK9q23d10aeSYYKxcgfBxtOK7hhw43oWc+/SKOKvnapm3hb1/b
         mBPQ==
X-Gm-Message-State: AOJu0YwfxMLHyB2HQILgu5s3RBVCEixDQsQmVw4/nCpFEBBVF13kpDcM
	P7std2uc/NoRVaSzVx07fnIu2WgdDGLHcpIrWffNX+yCOFEaGLP+ow1qh30Zpnw=
X-Google-Smtp-Source: AGHT+IEkCcVPU/FK2inSNEvYVRWeDzN8ynD1UxoEOZsD3GAqwzodWEFehqcekVS9BEM5DzURtMlaTg==
X-Received: by 2002:a05:600c:358b:b0:40e:5aa4:44f9 with SMTP id p11-20020a05600c358b00b0040e5aa444f9mr348679wmq.10.1705999747583;
        Tue, 23 Jan 2024 00:49:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c1c0500b0040e9f7dadc6sm13991339wms.25.2024.01.23.00.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:49:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 23 Jan 2024 09:49:05 +0100
Subject: [PATCH] interconnect: qcom: sm8550: Enable sync_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240123-topic-sm8550-upstream-icc-sync-state-v1-1-a66259e0e176@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIB9r2UC/x2NQQqDMBBFryKz7kCMDTa9SnER4lRnYQyZKIp49
 w7dPHhv8f8FQoVJ4N1cUGhn4TWptI8G4hzSRMijOlhjn6a1HdY1c0RZXs4Z3LLUQmFBjtrOpKi
 hEvamd947P3ZkQadyoS8f/5vPcN8/0KCCdXYAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Ijb4cNUN6qT6KjrYfTKe64L5Bjvj6MAO6mPdifj/E9M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlr32CmM9RGz7SKz81e/YjcfXxear+XAPZ1lEqJAg0
 sC0HyAiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZa99ggAKCRB33NvayMhJ0SBkD/
 94Y9aB5H5NrNSHd4WYb+O6xnbh/v7BRwU3Il3CjmBwiQshTRV4VpIUeZIlvgYMMbXr9bcvyPPgxf8R
 CRyPzf1vcG/8AMstNrexUN9GkBMEJfJDCxmiuc88iWxTR7E7O9aExo/kiHWKF0syzhXaxoLAvhLTy3
 Qj9BmEjB6xEme7mpuIbzgtE9Jx2vXuQRQIaSIOjP2dM0+xljSFqwNdmdX+f6Fb0+CbBTkemR+Q75bk
 Ryqoan771vSqPplmA4ja4AOEhd5L6EU+EE8W6UBRa124CgvFpbb5okGq57Qf1cf4olRTspk5DcV5yG
 E913TK8ypoS7EeUZGAElGJ2Rwp5qFeFFdB8S7lTcoDJnkdD6ffF3XUNuuqgcqzK13hSEBUZ9DS6un+
 WAu1exPae/iNTGO9/qP9rF4PMXk/v+rmAXAGjpeUXj3hsX+QmlNNMvi8UkXdtYSNaRaF7EiF3VHywr
 bmv2zNkiiQgj5DhIZtAAcf6qbXTruJTR44nIZ9PJa3+X5GR/EZhBIS+hWLcis1V03rZ2CS8K1V0BGE
 8UiHi9d1hsk/C09YzLchlcsuM8mPeCbi+3LYdu+EFlLnco+y8apjbvg1PjgxqRkesfqYZ9+GOOoQJK
 Ds2ZnmL7eSlrO0XXtTPn6f9/kN6RRqIdGwttbEDuiKCwmGQi/y+c14evtZyg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable sync_state on sm8550 so that the interconnect votes actually mean
anything and aren't just pinned to INT_MAX.

Fixes: e6f0d6a30f73 ("interconnect: qcom: Add SM8550 interconnect provider driver")
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/interconnect/qcom/sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sm8550.c b/drivers/interconnect/qcom/sm8550.c
index 629faa4c9aae..fc22cecf650f 100644
--- a/drivers/interconnect/qcom/sm8550.c
+++ b/drivers/interconnect/qcom/sm8550.c
@@ -2223,6 +2223,7 @@ static struct platform_driver qnoc_driver = {
 	.driver = {
 		.name = "qnoc-sm8550",
 		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 

---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240123-topic-sm8550-upstream-icc-sync-state-70759959d3e2

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


