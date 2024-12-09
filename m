Return-Path: <linux-arm-msm+bounces-41040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1829E9306
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1A462873A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4F222370A;
	Mon,  9 Dec 2024 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/BQYd1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D46E2236E7
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745392; cv=none; b=mtgDKB7eCDsDlcqkxHzaz4qgm0AHNb4gnxS4fq1b4soHE7p8KkOezELJj5e34gsKOn8EcHPhXNpMp2HEKz1Lcn9Zgz9Lpfm3HbSiJHFsPQT4bkkSXrKG2l8Gh52EkSHswWwU3HhVi7nHkc0iAiD6GJsmxEJyauLwmxojQwILOb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745392; c=relaxed/simple;
	bh=njRJMFS53oVLlFPOfYmEgfNE0jHwMkDusGCNOuUeDQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UloTsBv0G987AymiqGsAc3CFkT2ebzV3TVmCzvIJEFiMxR21R0m+t/J77HNuFmvRs3mtbek/6y6k6uq/Wc7qer1cthvNzjO3GbM/Ydflxhl3L1Eha2JoaZn1RuoNHiC9ChhSwwBfvswM8oDceFeJDhY3OhCGjwItAErwJcRcDDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/BQYd1b; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa62fc2675cso64920066b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733745388; x=1734350188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDkrPmX+rnC8j6/Av609kaQIfkDAMEkIyzULcEtJ5go=;
        b=j/BQYd1bNGzUkFsKBJ97waycncUj6HWilLt2nGPQr9Wp3LE/rBSW1qHpru2HWJoQlO
         MRqLdiQSGJv7ewJXBGrY+Vnei/L0QJhg/NJTVdrvKtKfO42H7jcyHCwntu3aJhUIl8UY
         t0qj9Qdmu9+E5A36Lxn1ee0Pauim0RJLtyfeSxmlYODjfher7O6LKzeAoNeftXWAqipG
         sCky3v+8JHnfUzd6e3nQ9ruQl/zpbIg5R2hazKrLL1o3fmO5r/8mXAyoFizp0zMadLv3
         VKUw9LeYn5RJiP27gE9ydGgFq4kRocg80kt1/oWxkSx2MEFDaq20LIuDU9A8cPZw06KE
         MneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745388; x=1734350188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDkrPmX+rnC8j6/Av609kaQIfkDAMEkIyzULcEtJ5go=;
        b=jYZJxUUvco20y6+UQoKfjlJT/PVvYlTd2tr69p55pLdym6K4veB5b5o5MnLNxUgBbg
         3DkCobK0uAXMGXmpSSH1XaaS9J1kPXSFSOG/HHtg1Rm7zUW9FLXA2IjTx65pkKSPEGbJ
         1n6AR5NhEof+HYvwBFD4l2+6D8+wgQvreCjkNp6ECgvfEOitk6E4kS9lce5MHPSUKs31
         xnBzDYHmzoOP1fa8kgt5Djow7C4fYoBF7ia5nuex5EmUonpEINOQXuvFk6Y6sUdKxVUe
         doILV3y3a1IOXMjHt+wTSnbASV8L2PCW+Strx1TSdacobt2fdu29+QoNWqqjRvKTbN+K
         KgLA==
X-Forwarded-Encrypted: i=1; AJvYcCX53oGGW8ikM/CHcAeqOQAqost9BBGhHkSE8xlMrVZlYzmunC8UKqq3aFmUhj6J+rTQ0m/r3/W3vc87q5K/@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXBUWGuY8BY3JXDNoOaXss8iVKU8fMKwQnt8riRlCMAmR8Kyu
	XySS9ARM9GVsRr2CodaYvQTU1Ziq7G10E+vxknP2kXpBrKtZr7al9Y6RXiMuZkQ=
X-Gm-Gg: ASbGncuwQ9/K3B3osfs8bih540CcbPyuRgVxg5HwrjUqBoDYbECXYO3oxOyTGgTghKY
	nOzVGnVTjsKWgGUII3q4vLB4Sd2XvcoKrnYt72cKymCb8zGCN5bfEn6LtHGJ5sDjkQZDQiWmMbL
	Nc9O6oaYL5wcxM5uSXnqLPYkPm8wj7w+JkdEMOTWh+2jGeyClNH+sOk4Mp2zCFjwGjOS/0Ef1b6
	w6ol905K87UcFweTwuHWs5HNiKuhtu5UV1AyywWdtUZK313i5+3VzJFwguOn/Oy
X-Google-Smtp-Source: AGHT+IGaZyqKQzZD247wMomlUwBJH4NbdZftbTBnrY74rFdm2bKBbV7DjbALRQ98dOG8bxWswacXHw==
X-Received: by 2002:a17:907:3f1d:b0:aa6:2572:563a with SMTP id a640c23a62f3a-aa63a10f275mr510577066b.6.1733745387038;
        Mon, 09 Dec 2024 03:56:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6651c01c5sm343333766b.23.2024.12.09.03.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:56:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Gross <agross@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 3/4] soc: qcom: smem_state: fix missing of_node_put in error path
Date: Mon,  9 Dec 2024 12:56:12 +0100
Message-ID: <20241209115613.83675-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209115613.83675-1-krzysztof.kozlowski@linaro.org>
References: <20241209115613.83675-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If of_parse_phandle_with_args() succeeds, the OF node reference should
be dropped, regardless of number of phandle arguments.

Cc: stable@vger.kernel.org
Fixes: 9460ae2ff308 ("soc: qcom: Introduce common SMEM state machine code")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Add Rb tag, combine from other series.
I don't quite get why rest of other series was applied, but not this fix.
https://lore.kernel.org/all/20240822164853.231087-1-krzysztof.kozlowski@linaro.org/
---
 drivers/soc/qcom/smem_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem_state.c b/drivers/soc/qcom/smem_state.c
index d9bfac6c54fb..cc5be8019b6a 100644
--- a/drivers/soc/qcom/smem_state.c
+++ b/drivers/soc/qcom/smem_state.c
@@ -112,7 +112,8 @@ struct qcom_smem_state *qcom_smem_state_get(struct device *dev,
 
 	if (args.args_count != 1) {
 		dev_err(dev, "invalid #qcom,smem-state-cells\n");
-		return ERR_PTR(-EINVAL);
+		state = ERR_PTR(-EINVAL);
+		goto put;
 	}
 
 	state = of_node_to_state(args.np);
-- 
2.43.0


