Return-Path: <linux-arm-msm+bounces-29768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4396281D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4996F1C23FA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6B8184535;
	Wed, 28 Aug 2024 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXXxzklN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3577B184101;
	Wed, 28 Aug 2024 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724850065; cv=none; b=HS3g/mwvYn+BZxg/HWOmD3MU0iFnWDnn1guUCSpqpwlue/HbQkMPV6vn1Kq8jKlJO6sBrBI01h3vWzQTxNyE83cc/JPGMo98qPLMVsZWSrPP0sGnANk5Gyhpu6rN+HNb5zv/IG0qICyxRNFe/xcg015uLCcuR3bvN3nKeMJVNQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724850065; c=relaxed/simple;
	bh=4MqjuvOTgdAG6z38bgV8cG5wFVU/c5CcZ2m7/WlkeFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EseAlM0Vf//4eUDbUFgvY4aNYJlXBQraTT1nI+iTyd38h8RP2J9Bj5jTaSuvXEd4obCeLDkZS4l31MWJUtFJiuaZmd8qddQCYBexHVuE6Wv9BYd2lAGv8/T31bDG5D/7WnV1EMxrp9dw/XEyJ+J6kSAAuHTLUYY6ZuiHFbijBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXXxzklN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4D2C4CAD7;
	Wed, 28 Aug 2024 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724850064;
	bh=4MqjuvOTgdAG6z38bgV8cG5wFVU/c5CcZ2m7/WlkeFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tXXxzklN4ZyYaGMPRfOyW2goyZxLaxvQBeMUbf89sUoHmDuO7a7x5QfZxT5aqHU5p
	 sGDJ7nfZNcEl0NFjBXl/ibpJeM9hLQmxiwNBujFSg+NnvfAZ3OBJA42MlnpjJke+y7
	 G7LTm4GMOWpMSIXa57snRVy2N0C3eS/N46pDlVwSiFBo23p9XxkjdrtFXNWDOSYHZA
	 b4HEnZkaNDCxz140k19RXjgLP+ClnN+SDTub3mYgjPYgrmwhclJF7uOx2TtBqxN6pw
	 BD1luvOa+7SA3pXVs13LmYNmAYmKZdd4xd+f9gWfn8Mv2u0IIUDixSpLuumg8w5xKS
	 9QwfQoZPyhpPw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] regulator: qcom_spmi: Use of_property_read_bool()
Date: Wed, 28 Aug 2024 08:00:55 -0500
Message-ID: <20240828130056.3481050-2-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240828130056.3481050-1-robh@kernel.org>
References: <20240828130056.3481050-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_property_read_bool() to read boolean properties rather than
of_find_property(). This is part of a larger effort to remove callers
of of_find_property() and similar functions. of_find_property() leaks
the DT property pointer which is a problem for dynamically allocated
nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/regulator/qcom_spmi-regulator.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 68603649db48..89657e8eea82 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -2577,15 +2577,13 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 
 		if (saw_regmap) {
 			reg_node = of_get_child_by_name(node, reg->name);
-			reg_prop = of_find_property(reg_node, "qcom,saw-leader",
-						    &lenp);
-			of_node_put(reg_node);
-			if (reg_prop) {
+			if (of_property_read_bool(reg_node, "qcom,saw-leader")) {
 				spmi_saw_ops = *(vreg->desc.ops);
 				spmi_saw_ops.set_voltage_sel =
 					spmi_regulator_saw_set_voltage;
 				vreg->desc.ops = &spmi_saw_ops;
 			}
+			of_node_put(reg_node);
 		}
 
 		if (vreg->set_points && vreg->set_points->count == 1) {
-- 
2.45.2


