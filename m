Return-Path: <linux-arm-msm+bounces-20369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAABC8CDFBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 05:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD3CB1C20BAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 03:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9411EF01;
	Fri, 24 May 2024 03:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOx+5aMd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A881DA4E;
	Fri, 24 May 2024 03:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716521037; cv=none; b=tn9My+zsRelcfM/ON3HokRX2g6CLagIH5DQt4G2D8JU2Mmjb0XCn12dHLQQ7CjfzygJs1gZGgsByMBAZ2npcqEaV8tO37Vgb02XImvk+0peg3rr2YYjdaD+gLc2ubbraeTYgtWvrtLM29DclGT6GAJIhxaEbybuZ9cxstnD/DCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716521037; c=relaxed/simple;
	bh=ydtWc6Jqwh9jM1OclM0cKRCte/xIWkRER8JWVBlappk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mvwn6Cojkim/aZvpV0rrj0hnmy8TQoqoHJo/p0RmJ1fCfE2iLBz0xfvw7KH3WjSqyfR/bwx9GUq829iCN5Hw2dGWyqEb8/NHjOcK6mNK5u/6+ynUcv6q7nFpEA699EVeUErD3oGZEO2alvWtQfzO8qhXtQIl3iwAhZoikKK0sjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOx+5aMd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406D0C2BD10;
	Fri, 24 May 2024 03:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716521036;
	bh=ydtWc6Jqwh9jM1OclM0cKRCte/xIWkRER8JWVBlappk=;
	h=From:Date:Subject:To:Cc:From;
	b=gOx+5aMdT5Lg5igFK9U7XI0WDBDNo5+JC/9Pp2WIJ81MV8if2cDBNNfaBk43/WxrO
	 +1MyO0vryXkt32JmcdrYaIJkshWFZMk+Y07pTmnzkIJiBGwULadz8WyLziHhpwM3Ws
	 4Co1Ee0xTGwipURrPi7sT+XXd1qtwlaO/EGP44L7Gb7EUisz7w3PZ5n7NzpRU7WOnr
	 5YLCug8uyYmTNoVi8petUK8Chinkog1WEEjY0sm3H8ZVNcGy9DioFHhSA5MdX/TkIc
	 W2oHPC1PdV3s8rG9PVoKBmiDJ73Ue47vueV9fVB8siiAlasmcfbLthFT1OqDM+W2sZ
	 hlZhFGlsb0X+w==
From: Bjorn Andersson <andersson@kernel.org>
Date: Thu, 23 May 2024 20:28:41 -0700
Subject: [PATCH] firmware: qcom: uefisecapp: Allow on X1E devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240523-x1e-efivarfs-v1-1-5d986265b8e4@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGgJUGYC/x2MSwqAIBQAryJvneAnCbtKtLB81ttYKIgg3j1pO
 QwzDTImwgwra5CwUKYnDpATg/N28UJOfjAooWZhlOZVIsdAxaWQ+aJRSI/msFbDSN40VP13297
 7B4CxaPheAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=ERGpu8nKvI4MRFNSC0reaZS/RpSwo24aniqg0QkL33I=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUAlvrwj2bOwJHpUck0ZApMOmtxdYpn1mriVOf
 uWk++T1kBuJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlAJbxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVwFw//Va3M/fXnRGkOP3RD4UZSZ5k7rOWB9hVV1hGc66P
 y2G9dqA+4Ql3/W6NS9sxVc+4gnu1J5oH2zr0giDx233YS5Yc+QJ8bw9virEvlqBcqorhSVjExOY
 Xs4p5pm3sQ5UPBb7p+TLDxYlHER1IuydHBeTrmrgW58YV85lxEqANktu/l6IvFzfidc5pZIigPl
 V7VbCcBssbyfLDag5U8PFCAwAmyrmvpMMeg2BOR6BfC1uV03Xq3ZcBkqZxShFASHNvhgulfLr0f
 BoKfnk2QB5Doz4JRLU44Zd2lixeAIItH2osEQ/+fjj2E1pK+RTzdAZt0qcxMRqAFSbS2UVFm0jq
 z9J3KkO0fi1Wvp5IQBBgyBGpmZqx5u1wwNcT6kSV6fc920VSZHaATitms4QsglnRlObBCItPtib
 lFA97f6CNP7pvneBpVSmM3b4bmeLMxHGJ+pvgwPdSEkZr6CE1QMQCVrHv3TZ4gspFfCearu9ILj
 Ayk4ZoPOAbeFxmH/TT4kc7AtvnydpDpWiF710lpXEAKVUNSIptGQvvXkMzMmf2mawwv2lebc8Uk
 NwK/Q7KzZjyYZ0TNSpk7fqOiksZR1TzwrFcDYzHRxiMVqhEhf4A6WLWkYZW6ykuRF2ygsBqnI2Y
 171pl13hLZu7Ha82fJCp93dwfhdLP+VslLqCEz06Yptc=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

As with previous platforms, qseecom and the uefisecapp provides access
to EFI variables. Add X1E CRD and QCP devices to the allowlist.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
Only tested on CRD
---
 drivers/firmware/qcom/qcom_scm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 68f4df7e6c3c..1be5374cd3c9 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1649,6 +1649,8 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "qcom,sc8180x-primus" },
+	{ .compatible = "qcom,x1e80100-crd" },
+	{ .compatible = "qcom,x1e80100-qcp" },
 	{ }
 };
 

---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240523-x1e-efivarfs-73e01de5b993

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


