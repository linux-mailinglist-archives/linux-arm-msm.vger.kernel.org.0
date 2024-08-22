Return-Path: <linux-arm-msm+bounces-29291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3017895BC27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 18:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D76FB1F26CF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 16:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B561CDA1B;
	Thu, 22 Aug 2024 16:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jgoU3StG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA591D130F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724344990; cv=none; b=WGnjtzv52tJRLXUnlbCD95xezEEOTH/raHTj8L2q3B26Z4GsvL8YPh6km5o8XQ3Mumw1g6lxriSIE/2cX0BqibLaSlU/7fiSjLMKeeQFXc/TK+ZFx1mpzcFS/nKtXilsNlBI4a3DrEy2g3tnTvpQs4cx08i1plbPi90i56aA8TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724344990; c=relaxed/simple;
	bh=WORizGtRIG3wQEd5cKsiYTz4nE4FIsBA2fCtRinTt8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SS7SW75QYEyR/vgshqAE0hU5XHozoUrY/VSQd5+e7ztLWCK/ydNNW29DCdPFWKCNiop8mtfEUl2JmSmR+m+vSDrjFTnE9w/Qjnl476dC1sxSnFCwdmclMTMrAJPAIyxAQagjgz+T/ywMwe77B2JcvajYW3IxEQyFIzJIxIfEbhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jgoU3StG; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5bec67709easo130006a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 09:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724344987; x=1724949787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Jn92E/Ky5nVM/5+Oud+V0WsM8/cEIOvqMjdYQHvInY=;
        b=jgoU3StGDINJefkaofltccf/S+1Plw27anSoR1O3EoWYIGvT+xxlnNAvwsSodj6p83
         3cymQ5Z6Lfd7lvfvZhPeegdBZJaVsuI8rQePhwuhVOZuFo4omMqOiU8RmutK2q9Oc7v2
         8Cd3LDcwzoXlwPF21P3Vp/abChEcCwbt99Biz5ao7JoBNtCZJ/llSykNOgJtDQgOXQsQ
         XFsvpCNFV2KzV3yXBDPvJcmz+5XhaPulSTv/rer9IVRaf2WS6EaZDFjZyBIJRM5YhuP1
         /IQy9RjYANJUCEueyuSlJm1veRXqqXnsc4PF5KRsR5Fj1hjdGGt/A+mFtIGbuyGTQC6B
         QEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724344987; x=1724949787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Jn92E/Ky5nVM/5+Oud+V0WsM8/cEIOvqMjdYQHvInY=;
        b=qaDxK9xv95WfixLEwUqo86boqzokz61oq688S0DcokythdZ6kL1oszGIVwqGRXb0vy
         CwizN06GfzPZD+IA8mG8P29XcikMxxJmFJiyuOtlnyxB9lu0WWpnXWji75eV4o/0Egww
         avX2XdN+eWXWHXJah6+imBb0rmkAX8GWZERHlPVCWAmYXekXjA7X8gi8bUKmVkG1HdxE
         XoDSW1NGVU4+P8x0MCUuL/betMcA8EwpZCmkmjy2MB85bu0HOvk9bORGJKwtYEeoRil5
         r+Meiz8FbjUlSR//vYAJcxcCAr2z0YwHYGDoijx4gvUBtemNI7bcBUFDtpjDutbFyv95
         YWCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXaoMtJWPXcz1B62frI7QcQ/q6pxUN2xlI8jX9ibbgs2x1L958IA3xvZIN80Rn5/ZDxiSoiNq0O4hO2WZF@vger.kernel.org
X-Gm-Message-State: AOJu0YwFoURQG4t+ni5VfxsXZ4t9mYDkUPU29HqUmn0FyOdltfpNxO/H
	wUdfKHwTCfz4CnD0L1FBmCwjWuIhnOlklfKPTD6L2RcjexJjbOB1pLQH2k/2nsyNCA+/A8xfq1Z
	k
X-Google-Smtp-Source: AGHT+IFWHvOSWI8W904tEjwil9ah8KgnsIfJo4HPKhd1OzOwIfvV0E+wvnktUkdkVAXtJ+4ms/IStw==
X-Received: by 2002:a05:6402:34c6:b0:5aa:19b1:ffd6 with SMTP id 4fb4d7f45d1cf-5bf1f27b2camr2444941a12.4.1724344986388;
        Thu, 22 Aug 2024 09:43:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a4c59c5sm1103432a12.63.2024.08.22.09.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 09:43:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] soc: qcom: smem_state: fix missing of_node_put in error path
Date: Thu, 22 Aug 2024 18:43:03 +0200
Message-ID: <20240822164303.227021-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If of_parse_phandle_with_args() succeeds, the OF node reference should
be dropped, regardless of number of phandle arguments.

Cc: <stable@vger.kernel.org>
Fixes: 9460ae2ff308 ("soc: qcom: Introduce common SMEM state machine code")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


