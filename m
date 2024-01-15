Return-Path: <linux-arm-msm+bounces-7273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 237F682DC64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 16:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3796E1C21D2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 15:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59D717747;
	Mon, 15 Jan 2024 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhucPRlf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA617981
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 15:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5592d2bc270so1416958a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 07:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705332869; x=1705937669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rmavEwniKj+GORH2KWsSxI48O1fqG3CA/6A3JkOsRZ4=;
        b=hhucPRlfCXgeN6cS7vjMBCEO3Nqpcpwi2qvTRRHXo34AxIxcSfDI2qqRSt6UZkiQkd
         nRWGr+fVvfSdwX3XHVmShmOJsLVmt6E4Ivy4JEUUfzq9LBgjcY+wA/bmLH7Vr7BVZFXz
         iWXSbF7uW7Fnl1fXt0eBMdQuykgo5O/fKDPn/2l4JCWuepp3klmCjC6E9SOlrfI7c6R9
         kvfrvUEcra5N2pZO3vD4SwlrK/MGtw4veZpez0vnlpW2J1oWewPVAIFg16oFZrm2wB2N
         gJEWdWVFNzQ7qq5Y3tTvVG3srdEcre8pZf/W5DvGGpp0cEQXzMsqK/VWDyvUx2ZtCZaE
         /ClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705332869; x=1705937669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmavEwniKj+GORH2KWsSxI48O1fqG3CA/6A3JkOsRZ4=;
        b=Jo2cLOgZtxH4tCl7iG48n80P5B2y2VIcTxHcZfKIsTAznSuhr3gWlylzgQzKxnQ4gc
         VQ5DNP3YGChdY+jF5FDQoFoh6ge33IAfwufBNWKzyNCPJ4y+zSwVfswBXI1zV6l28hB3
         30i1fTRnqr70y07gqdfF7o7cxhVRnujKgL2hSbDCaTOysbbZnAtbxQfxfyQZCzp6AN8R
         4sx5D0NWYgACIHBEgU3XixBE0+gUgcL0z31vHK1g5VHmNh5CyuZw+aUUjn0btq51PwhE
         GudRsdQWzJsOISBN3Lc0Ga4W+jB2PYSGUEZuOzFJQ4dlN42m6PQVkkXq3z2pkKIESmEU
         BVzw==
X-Gm-Message-State: AOJu0Yxfg9Q4YQl9NhbcVFRFlIMi0gti1DREMD692tP1n3Ik+aUYWfJa
	6xaAZOMw4xBsfb/NlVfJ+t253oYCDTF0sQ==
X-Google-Smtp-Source: AGHT+IEwU+HMP2ZxSul0UPiJaIrNclergG4x8eorh9X4vewB9SAVKg5i/Pw4/KLbpnvd4dGFIgmcNA==
X-Received: by 2002:a05:6402:31e4:b0:559:3aef:235a with SMTP id dy4-20020a05640231e400b005593aef235amr997796edb.13.1705332869499;
        Mon, 15 Jan 2024 07:34:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id j20-20020aa7c0d4000000b005576f4471besm5578604edp.42.2024.01.15.07.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:34:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Georgi Djakov <djakov@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] interconnect: qcom: sm8450: Revert "interconnect: qcom: sm8450: Enable sync_state"
Date: Mon, 15 Jan 2024 16:34:20 +0100
Message-Id: <20240115153420.1525037-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revert commit 16862f1b2110 ("interconnect: qcom: sm8450: Enable
sync_state"), because it causes serial console to corrupt, later freeze
and become either entirely corrupted or only print without accepting any
input.

Cc: <stable@vger.kernel.org>
Fixes: 16862f1b2110 ("interconnect: qcom: sm8450: Enable sync_state")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/interconnect/qcom/sm8450.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/interconnect/qcom/sm8450.c b/drivers/interconnect/qcom/sm8450.c
index b3cd0087377c..952017940b02 100644
--- a/drivers/interconnect/qcom/sm8450.c
+++ b/drivers/interconnect/qcom/sm8450.c
@@ -1888,7 +1888,6 @@ static struct platform_driver qnoc_driver = {
 	.driver = {
 		.name = "qnoc-sm8450",
 		.of_match_table = qnoc_of_match,
-		.sync_state = icc_sync_state,
 	},
 };
 
-- 
2.34.1


