Return-Path: <linux-arm-msm+bounces-2116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 142EC7FA487
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71E3EB21443
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB48328D1;
	Mon, 27 Nov 2023 15:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JMTMsEIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B661A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:29:02 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54af4f2838dso4181619a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701098941; x=1701703741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhPk3gIHMkcRIIJu/Q2shfUhw94w8SwgcuUapNUkT6Q=;
        b=JMTMsEIa4aYIfTM32dTzBCzsEWNB9ToYFbhkklHOIgdXjuflKRgY2xx58MdM2+fBiH
         /dB2B8S/U8NCFvQsDstc66Ay4RuPbRBuytFOrQxCNow8jIWftuOEB+55aElpxDZ6Q9fE
         EGhm6J0SAg0ijEkXJRO5mk4yDXp1LSfzE4g33RgKuhAifCftQV6++jHSaTbRNt5uzaxu
         OLYXJI0jyO6RRmmdTVWHaRgF6frJqr5KqlKhE8EokVdVm088V/jbtXqXwWuFH8bCdaN0
         BXLHoU6G72Y7D8+NNctnwPIo5wF8srvE+jXs176C6t+NBv2h3Zjv52eoNdm30N2tT4MP
         Cy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701098941; x=1701703741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhPk3gIHMkcRIIJu/Q2shfUhw94w8SwgcuUapNUkT6Q=;
        b=WsUguul/wYaH7a9YxA8dh4UVbuMODfBqXDBiwvgJSls9+PDYrx5hy2P5fh9UakDmRd
         bJ8O8IMhNIQsi/2+CwxbwJJZ6OdR8LiuVpVBvxnZbbU9FZ99FqsicvbIk+9SOoPEbarR
         n56pt82NFGAw5kUaRCcGLtRZwK5oT8W97+TQ8cRCJ0ElwyGkrhwetJFDXo1hEcT2sjFK
         h/MUJ6wg19lWiRDF3Rwi5+4Q5T8Znt0DfTHQiBxOOJg8IaLCBK2nBvAIQ1EMl6z92Aeo
         HEMDeK5AttkCDFqhEP0nSChcf0ASreZwkQI3IfrA2TSFHi7tD5NlXcxhrCjZnozXfwk0
         Ixdw==
X-Gm-Message-State: AOJu0YxLOqBGANmdR7V3YH98dsb7K/+fjr0wN+9dDJkbQxrnQYyT02M0
	PdZweMUiYOsjtVk2DS/I8QWAhQ==
X-Google-Smtp-Source: AGHT+IHaZ/5ZPExAgDq0L4FyfPmoaHa3HQflZh0/a5XkKNZ1bg9JP8bP1GFa6VnYYjaQd4f0weiiqg==
X-Received: by 2002:a05:6402:26c5:b0:54b:516f:4bd2 with SMTP id x5-20020a05640226c500b0054b516f4bd2mr4076156edd.35.1701098940866;
        Mon, 27 Nov 2023 07:29:00 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id e7-20020a056402104700b00542db304680sm5321002edu.63.2023.11.27.07.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 07:29:00 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 16:28:43 +0100
Subject: [PATCH v2 03/12] dt-bindings: interconnect: qcom,msm8998-bwmon:
 Add QCM2290 bwmon instance
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v2-3-979b28f35e4a@linaro.org>
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701098925; l=959;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1AOnfLSu9gHpTFJJhxoEDrJmbQSA5ACPtQkIorVkBaU=;
 b=JAKQLFdPAmDQ4J/cUUjfVGrZb07Fv/d/o7HuoV2jIu/p0pE4NhSeFPRmHRQ/v8fdmvADNoz+J
 73OV7Zypoy6Cxob7ipNfb32n7IddSCx5wqWOafi/eG5wday4YORBD/Q
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

QCM2290 has a single BWMONv4 intance for CPU. Document it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 7cb8df757477..a88cea732370 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -25,6 +25,7 @@ properties:
       - const: qcom,msm8998-bwmon       # BWMON v4
       - items:
           - enum:
+              - qcom,qcm2290-cpu-bwmon
               - qcom,sc7180-cpu-bwmon
               - qcom,sc7280-cpu-bwmon
               - qcom,sc8280xp-cpu-bwmon

-- 
2.43.0


