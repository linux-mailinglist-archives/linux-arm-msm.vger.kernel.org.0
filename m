Return-Path: <linux-arm-msm+bounces-15246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BAD88CB3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 18:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1F59308471
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 17:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC48B84D34;
	Tue, 26 Mar 2024 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EDGlAL5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0577420DD3
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711475202; cv=none; b=iSrhIoWV07KKlNK3XXwTMAXVvBfNka8mhhCQUO/1uRXsnRl+PEEFF6AazCsmS4p4SahkLVqW8egCmZOEo54HF67pnfmrzLUDYuc3EKBH0VCi3zHsRREp+27F7Wc6if17jPhHbX/AzeePmVTIwqFuksHjCRXymvULmAZ+BdzzSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711475202; c=relaxed/simple;
	bh=GDUp9wJ+UoTRfjRoqI2yRMLcZ251pIUop5pxEzpVuSA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xo3PyoNoasvfMqckcHAZ/pKk6YzQJjw+Ge9oPdiivs/JcSo4Vn9IrryWpw4fAgv9NanQuoqUPxjSkQyhLTsmTeQVxOEDL9JpDRJ3htrDB9zwAnzdgUKdDunyz+0sKohtV8vLpIEpYAzWtXZnDIXq+f0Ei1a6kXg0taCb4xr16hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EDGlAL5g; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d4a901e284so111378651fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 10:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711475199; x=1712079999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C14gSplgZGLWljRtlb00xiW+Ox3cRsPiTyqaLpAbCSM=;
        b=EDGlAL5g1Jx8bB1Of9FgZ8go2VdRt1LLnRIRO2L6e49nKA93A1JuRRAzYoo2NZPRJ6
         Th48OaLsf2GwjU0T2+hZIcdoy/QLqjx99qbVCfK3IcNI49zwF5tgldYgHJEraEaThLra
         1i/EUt9hj/DIVmQLko/0hv02eiH14e+HAdI75H7ryfAgb5tgB6T+iGZKCAGt1h7c2el1
         FK1ECPrOF/f/h1VfoC19ezxr4gKvtlNiPYNxInwnT7aKUVq0YhwshSX1yjVAouXGCVnU
         pqelCO0k4NNIipo7lxKs3TAm+RfV58Nj49Q+YEc6PETYltVOQxtn5Oz7HR3uLSYJq3kc
         CLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711475199; x=1712079999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C14gSplgZGLWljRtlb00xiW+Ox3cRsPiTyqaLpAbCSM=;
        b=ke0w2aQb6pW0tRkrZQjpKgZew1tuv4mmlR6LuqERC7qk8CmmQrlMA3gz0kk/vFqNr0
         0ROWozPCFBTMykurbgoPliqeETfi9UgZbyLjT0ykL3Il1rPQfPlOJe4xxOTBKad8V1+R
         7kgbcP/bgn07V/YmH+z+J+UPqU8CREi7YKUHHCbalXDDtROEvmOpf6WGm24iZQuM7w9z
         QiDOWrR0mw9Mhr+TCp9n/t/iz1OTZ/7z1E9Qx7hI7gDvCh+q6gJG9HqNpHwVi/GHKQDd
         rSswWQC5H2Eqq8p7hkkIrMaELQMdizE7HHeNYQihVM69xc0H6G14UfSH239yckGtNFyR
         aFMA==
X-Forwarded-Encrypted: i=1; AJvYcCXMf1KhNFe81SHWrDd4IhVTESPb8GinNZ7x3agSGniMOgfM6iD8Ui/BI0aMjxhOstF5ltONeR6VOk69hAKiLyrwYXrgaA0bBidmwCy+JQ==
X-Gm-Message-State: AOJu0YyWe70HTa/EkrvqmhShukvEjY8skL6WjoRBxb4f8JWS91mIG/7c
	KR9SKEnbOZ6vx1YLaKBMMD1Iyhfl+GTjKgHQzT8zHe06A7RgxlA4B8xKDmrKKd4=
X-Google-Smtp-Source: AGHT+IHpjlYocgfcalACtbl2UwhjQKJtDVwl7I/xmVa1t7F1W8q/ciAzRtEpdbYUZ9Xfi6NEZgRCTA==
X-Received: by 2002:a2e:b34a:0:b0:2d4:7455:89f6 with SMTP id q10-20020a2eb34a000000b002d4745589f6mr291125lja.40.1711475199130;
        Tue, 26 Mar 2024 10:46:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id l19-20020a17090612d300b00a46cffe6d06sm4451438ejb.42.2024.03.26.10.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 10:46:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] dt-bindings: ufs: qcom: document SM6125 UFS
Date: Tue, 26 Mar 2024 18:46:32 +0100
Message-Id: <20240326174632.209745-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326174632.209745-1-krzysztof.kozlowski@linaro.org>
References: <20240326174632.209745-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document already upstreamed and used Qualcomm SM6125 UFS host controller to fix
dtbs_check warnings like:

  sm6125-xiaomi-laurel-sprout.dtb: ufs@4804000: compatible:0: 'qcom,sm6125-ufshc' is not one of ['qcom,msm8994-ufshc', ...
  sm6125-xiaomi-laurel-sprout.dtb: ufs@4804000: Unevaluated properties are not allowed ('compatible' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 7e6d442545ad..cd3680dc002f 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,sc8280xp-ufshc
           - qcom,sdm845-ufshc
           - qcom,sm6115-ufshc
+          - qcom,sm6125-ufshc
           - qcom,sm6350-ufshc
           - qcom,sm8150-ufshc
           - qcom,sm8250-ufshc
@@ -243,6 +244,7 @@ allOf:
           contains:
             enum:
               - qcom,sm6115-ufshc
+              - qcom,sm6125-ufshc
     then:
       properties:
         clocks:
-- 
2.34.1


