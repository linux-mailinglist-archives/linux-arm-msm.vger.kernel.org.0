Return-Path: <linux-arm-msm+bounces-1291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDDA7F2553
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 06:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 504A11C20943
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 05:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17704199D9;
	Tue, 21 Nov 2023 05:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="K4LotakT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEBC123;
	Mon, 20 Nov 2023 21:36:04 -0800 (PST)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4SZCll3nPKz9vYH;
	Tue, 21 Nov 2023 05:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1700544963; bh=q692EMLiwWELVU5OazHP7MapPL7Sxk2dJzZRLS2Ag4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K4LotakTbKKCdDu6ADKLldOTo6VrHU9LGkO5jn9dWnUyBBRBjaMgje2EmKfqXZFNw
	 vJtX05PU58RFxzqLBvowUqu6y703vx465Klrme9oX+fWC8/p7GUUJ2+5VItw26nX33
	 /bfM5n/wud3ITyFqusC3PaiuyqYzhxQ+humCiKgE=
X-Riseup-User-ID: D16D4989A101DBCC556D80F18CDBD3CF8A70E5B6A8F7F11519A499B2BB92C079
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4SZClh67VgzFrxv;
	Tue, 21 Nov 2023 05:36:00 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Tue, 21 Nov 2023 12:35:02 +0700
Subject: [PATCH v2 4/4] soc: qcom: socinfo: Add PM8937 Power IC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231121-pm8937-v2-4-b0171ab62075@riseup.net>
References: <20231121-pm8937-v2-0-b0171ab62075@riseup.net>
In-Reply-To: <20231121-pm8937-v2-0-b0171ab62075@riseup.net>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dang Huynh <danct12@riseup.net>

The PM8917 and PM8937 uses the same SUBTYPE ID.

The PM8937 is found in boards with MSM8917, MSM8937 and MSM8940
and APQ variants.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 drivers/soc/qcom/socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 51e05bec5bfc..37692fc1aefb 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -93,7 +93,7 @@ static const char *const pmic_models[] = {
 	[22] = "PM8821",
 	[23] = "PM8038",
 	[24] = "PM8005/PM8922",
-	[25] = "PM8917",
+	[25] = "PM8917/PM8937",
 	[26] = "PM660L",
 	[27] = "PM660",
 	[30] = "PM8150",

-- 
2.42.1


