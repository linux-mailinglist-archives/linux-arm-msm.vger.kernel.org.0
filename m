Return-Path: <linux-arm-msm+bounces-17754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE38A8C94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 22:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D69E1285629
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B4A44C7C;
	Wed, 17 Apr 2024 20:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xKi98bHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E493C068
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 20:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713384189; cv=none; b=M2l6MEAeeNv9YNyLFNjKaEd0/aMmYdqbkHcPoPcl222c66qopXg09uc3z1RYweipv5J5cq9HXvVCP4k6HTnMRu4ksJ1swsrwq1hJX1PS99Ejgl9dMYmxIgbPXyanwV2QC3A9J+TqH3ztSMbw1KaxbCW1v6YQG6EZSCE+odT4eio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713384189; c=relaxed/simple;
	bh=SzNP2N4/yEVPoBdiAdbUx+XCYML6c4ZGxmfNNn0BMu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBq13ZkLWDl0J3vIdd6ReZIQTTGoliY6AjaIpXLp72SRuXg4Dkh0PK5oAD0I3YEJbA/WTzyU64iE3QH3TlIYsWNXEfpLV2YOvSfcbPQUZ2NBax0HOXjw2tsauiRmLoqdz3qxcPgVe8SDYemIfTK96GS1Ait22T93HCGPSg2ugZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xKi98bHb; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56c5d05128dso88349a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 13:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384186; x=1713988986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvZYT8UoRgpyqJ3Vaw4KePRJPRlpkh8fBDgHRFBePWw=;
        b=xKi98bHba+6QbYneAs/ZwpLzJvY5ZG0RQktXSMHK/W/xQMwsickdn1jkp47J4EgoDq
         VofAhzIrNoXv06LgufaXYtPzfrz/VYjGJLCabklBVV84/Wt2ojDubjcm+jkVRSMemG1/
         1D4SO6XltETa1Aqx8pZItYZa8p6iRkvqBoOKStpdDsuyFjSx7bdy57VaRKa8Jc/za5oy
         53wZ7K7s11hge5+jTk8NfSWzfDAUN3OMIBp4Xj95KiO9Gtmn1LFF+4cTTr3rMcBgWUl3
         veAspyfv6wRcWRlavfUjxCMJ0HggywL5i0LHlXLZnOYTthqPVrATDF3I1MjXprmRqREI
         sBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384186; x=1713988986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvZYT8UoRgpyqJ3Vaw4KePRJPRlpkh8fBDgHRFBePWw=;
        b=KGzO5hN5w/TX9h0+oZDiWACIK7XqdNiVuD/bHqWBUhyrFFPxbMeLB6916gctOmM0ak
         WbRG6Lv0HIChaRkgPv+af+tKFtSvY8rl1SpWOur0Im0yBOzS4fd9VBE6Y87U4GsfUI1y
         Ft+Bf4U8xdiZuH6ImQFaI290BAzaIwKX2tyM6rV2gOq6y8lEMNd4mQoYNAvYA2petkKm
         yRbFHCj0KEkrVpp97URIes4/6uzsADpgOAEnH9XlE7G78KxNNm/+NvQ6lSt/5mmjYNyq
         Mm0NC7Js2KL5RVBU6H8icau1oURnCHstPYtZesc5eQ06rTXRndJ6KviBBx+/hsyMMTWM
         gPiw==
X-Gm-Message-State: AOJu0YwhjJFOKypEirc4FZqnf1TfuF9Aiz/2jclB60cBvChsCJpSW1ER
	YC7JB643tjllz4MdE7zCOUeuI6PnapGwXJFcIvsNlgUTkivyzuVdkhYc91rHHsw=
X-Google-Smtp-Source: AGHT+IHeJx63U2SuWBabsr+jnCDt7p8kxECw4gkXzhp91g5G2n4sqYEssjkAMSGbTC/y0ce7j6eT7g==
X-Received: by 2002:a17:906:194d:b0:a55:63d3:7499 with SMTP id b13-20020a170906194d00b00a5563d37499mr308331eje.59.1713384185935;
        Wed, 17 Apr 2024 13:03:05 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id xa4-20020a170906fd8400b00a5252e69c7dsm5905590ejb.160.2024.04.17.13.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:03:05 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 Apr 2024 22:02:53 +0200
Subject: [PATCH v2 1/7] soc: qcom: Move some socinfo defines to the header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-topic-smem_speedbin-v2-1-c84f820b7e5b@linaro.org>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
In-Reply-To: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713384181; l=1887;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SzNP2N4/yEVPoBdiAdbUx+XCYML6c4ZGxmfNNn0BMu8=;
 b=HgK/hwJTnwdfBrYSRApX3bQaZFhSAeY+XugDa5UFxUJvYlnKS2mim2xdU0ygmIAUd1o8H5PKe
 hoI7SCi+pXUDqscrBcSuw569pKZD2VnMeWCfsnjxuDqUJ6dYW4fAVhS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

In preparation for parsing the chip "feature code" (FC) and "product
code" (PC) (essentially the parameters that let us conclusively
characterize the sillicon we're running on, including various speed
bins), move the socinfo version defines to the public header.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/socinfo.c       | 8 --------
 include/linux/soc/qcom/socinfo.h | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 277c07a6603d..cf4616a468f2 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -21,14 +21,6 @@
 
 #include <dt-bindings/arm/qcom,ids.h>
 
-/*
- * SoC version type with major number in the upper 16 bits and minor
- * number in the lower 16 bits.
- */
-#define SOCINFO_MAJOR(ver) (((ver) >> 16) & 0xffff)
-#define SOCINFO_MINOR(ver) ((ver) & 0xffff)
-#define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
-
 /* Helper macros to create soc_id table */
 #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
 #define qcom_board_id_named(id, name) QCOM_ID_ ## id, (name)
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index e78777bb0f4a..10e0a4c287f4 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -12,6 +12,14 @@
 #define SMEM_SOCINFO_BUILD_ID_LENGTH	32
 #define SMEM_SOCINFO_CHIP_ID_LENGTH	32
 
+/*
+ * SoC version type with major number in the upper 16 bits and minor
+ * number in the lower 16 bits.
+ */
+#define SOCINFO_MAJOR(ver) (((ver) >> 16) & 0xffff)
+#define SOCINFO_MINOR(ver) ((ver) & 0xffff)
+#define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
+
 /* Socinfo SMEM item structure */
 struct socinfo {
 	__le32 fmt;

-- 
2.44.0


