Return-Path: <linux-arm-msm+bounces-54427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D44AA89FF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 15:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0C25800FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B91F1E1E1D;
	Tue, 15 Apr 2025 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lc4NB5KQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09D1A76BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724885; cv=none; b=bJyhlQSkam07rCjaBlM/XS+As5o69a4hRI3chPKOu1+dlzErmvopdEpUemviX15a7fmlDq7cQhepdxBlpjlNMQtLfa5zDpNRtB8CD9mYqmn8EPtBGH/kMaQ+rtLahmA/MTJmFK7VGKD9RSSLFVjTvspcJu1scWYQY43w1brZBp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724885; c=relaxed/simple;
	bh=O1n9ZGon1tW89nP5AxkkAnhFJkmvU1gNvIer5n3oZ2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K39BgyBGEjIpApX5WN+95jtNT4yw9jClUbfDcAvZIoHilmtDxTngBP3c6RdW3diugBxg53fhvR+02idaf0fLNnWDAIbA/xGXO3N9XoSWClrRpqV5xt0W+2ShlcwCSlf7ecbrq4rcyT878lJk3zF1pU9jYtK1v8c/A0TJmXqEDkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lc4NB5KQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3215971f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 06:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724882; x=1745329682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4n33F861tnhB5yN6ZfC4Q2gxN/qYdWRlSL6Yjy0AeI=;
        b=Lc4NB5KQSUycJELk8zBhTPDspaSlP1ty01+waBpj3LgSnUaBjUb9TUCSLrs73DTtP5
         AVCFPX6vh5aYMFJUk+hE8PJXKUUPEKgiGGZCfKK/AA+QYf/pS1k7LEKt124T+erBx5+W
         rp4RH03NU/EiqgbTXfCwBxq9Z+FD2JTi5WJ1PkreQKgOU3QSg4fl4cm799EDfrs6zcFw
         ZU31QIWEHgf6q+WV0wGC+PNCoVGwavRHmrUUDt9ldgAvjnTIyYSwnccvNEYCJHcq1Hs4
         ujxTAEQqOjug3V7RXpiUG7r3OOCHiNF3gIrreFalwcLZpS3HInQFMudaEnIyYrowSdKS
         myiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724882; x=1745329682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4n33F861tnhB5yN6ZfC4Q2gxN/qYdWRlSL6Yjy0AeI=;
        b=XUEtjrBQuVShiEPiwZ4IXWnBEsdWnSTz/QMUBLoC+fc3//RdKPNNnILbmvvABgd5La
         de+W+Y8UgE5t2BuGxA4yBQgCCY44FzXnpfYNWkcAds+S/eoPRD7np1Gx2cgOKerZSL4k
         HMzVkO6TCZ0M5ywGSjCXGN+d4nSdzag+AITCxGS8M088f/1BEQqkIQVzxBfsmpXDYzY3
         jBsCDGLaP38PWGAYlFxRY8XMZ/ZFTN0zPzI3RoM9CWeYwdRIZZ0CS7J51I4A7k5T/Rm6
         fTxICxp34Ldxs3X37v/JTZPOiwZFEeWBBgJrVZ2PX2OH5Eur+SM2LbPiUr4bKzyWHqRs
         rlMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8nym1cRlrGcv6VkcAhHM4/+mV03UFp4SuvHGcvJUqCOkvpvgBBWAs2enEdNG4G81o6NF/yBHSbw569DC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+wRg+ev8Rbq4nDeN3lbxGSv4bjm2K8psuwFMW5eNpUajc9ZBY
	oy4ZxJ6TovCc7qurlktRkHgwZn8QQoE7VKoyoEHkRJyPBj+RuygHy0MyzFjVezQ=
X-Gm-Gg: ASbGncvkMp7RGwL82j/rYcp7/zjS9oRz5ULzxfuhXNX0D8pqnRr2D3qQIiDpd3kPCV5
	TT8CDag6vOzTVJT+lP7/eTuktnM2RN9UxN01KMj2WtWDOZ7tQiCG+5HGYpqIUpp4foBCx8SPwDz
	C7xUBbEe2QNxqF7LB5NwJP1fB80NcnJrUXXtuXdNjsrakDCJa0qS0QvZAPzu9D1Oisli2TtNfRI
	bNpRiHoGjW+q+zrc3/hfbMlup2Cy6YPn9P9MsVVwYHowh0FB6Mc12TCX5oOj75HkajDB1ptdXT0
	NLAmTeItMVDIezcjhrRkuCNYOdZYdBLPaolBcObYUMEBUXm1g0QTsEyTJoivaw==
X-Google-Smtp-Source: AGHT+IE9Bo9OcdxYfX6Y1XgaMV+4pQztLxWbZFC1dP2QObOpKvvzEGVHf+XpA1Yx6ubagR8CD6fUGQ==
X-Received: by 2002:a05:6000:4022:b0:390:e1c5:fe2 with SMTP id ffacd0b85a97d-39eaaecdb2dmr12138455f8f.38.1744724881876;
        Tue, 15 Apr 2025 06:48:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d0fcsm210434195e9.19.2025.04.15.06.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:48:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 15 Apr 2025 15:47:56 +0200
Subject: [PATCH v6 4/7] media: platform: qcom/iris: rename iris_vpu3 to
 iris_vpu3x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-topic-sm8x50-iris-v10-v6-4-8ad319094055@linaro.org>
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
In-Reply-To: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=O1n9ZGon1tW89nP5AxkkAnhFJkmvU1gNvIer5n3oZ2U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn/mOMxxYMjEkfSo3SVieulxkuOX2P+XVFOKE30ngY
 GccHUM+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/5jjAAKCRB33NvayMhJ0e/3D/
 9rk90C4tjSLedAYkr2ynbVw03itSUIL62YIxs/SY+SDO6QinBqxn56kc4oOr1mzEM9+jWg4/jYdhKE
 qFhLnzu8vi7sIFkibv48g8YbTswI1lZekAwb1onQbu12KUBFbTKIXpfwnh4MzaJNaDUm5HNYX4iCn7
 cy77+qSMPxeEevp/Ha1Fs6EwfXqXqyRPdJtnQt8i3QYJBm5B58gC6OkxGiC9yOiIC8k6/dntyfMx14
 QjLaVnxruWMrBz7L2ks/64nMdzuV5ij+kaoL0Pjw8nNQk25LwSfTfTtUYC92SS+vm8bLQC+6O9jsgp
 qZgmMJ/UQYDX1PW9gC4Grk0H8T5e5IFdT+0yv7H6WY84cxmNgMvztzGzrXL8FprY5D4ETk49OxULLs
 m6ohaQ91A+26+n3RDQFRpE9bS8hPj+Kbw3AnMrGF5V12tAiNqH8qvd+mi8A45I2Vl4VgVD1RTrOE90
 1b8xU2AiErsZ78l4y+XnwmmEkjedetO4DrOLwm5Sa1ivLVrJDdalBCAH/lDXN7bbCi8A8ISW5Pik0A
 93izjEBNIfxznq0xg8Ew/dncoAjqi84X0cwPAxwvx2CS9LWN287KRzyyR0jXAixawblP++A8M7Q0NK
 NdnjGr68HuiVA2kM6ss8aFyzKEFI25E2deriJx65p6U1W6BiBqYFZGrlznTg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The vpu33 HW is very close to vpu3, and shares most of the
operations, so rename file to vpu3x since we'll handle all vpu3
variants in it.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile                      | 2 +-
 drivers/media/platform/qcom/iris/{iris_vpu3.c => iris_vpu3x.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 35390534534e93f4617c1036a05ca0921567ba1d..473aaf655448180ade917e642289677fc1277f99 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -20,7 +20,7 @@ qcom-iris-objs += \
              iris_vb2.o \
              iris_vdec.o \
              iris_vpu2.o \
-             iris_vpu3.o \
+             iris_vpu3x.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_vpu3.c
rename to drivers/media/platform/qcom/iris/iris_vpu3x.c

-- 
2.34.1


