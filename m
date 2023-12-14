Return-Path: <linux-arm-msm+bounces-4799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFCF813834
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F10FB21B9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 17:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D2065EAA;
	Thu, 14 Dec 2023 17:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJRTAqQT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8591F124
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 09:16:13 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a1db6c63028so969337466b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 09:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702574172; x=1703178972; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecnta8fmq85962lS8hL+fAUj0iRD5WKCwqnVAGP2iIc=;
        b=DJRTAqQTYb5g5XBwNoiDQgAM4Nk82K09kycH3fC8q5whaLnbbjbbtNd2jdfWECDvQy
         fkdj/tApjWU+byQjNjUP8LY/j3pTK38x1PJiHQAO5pWd74wxWub4MMebw3QqtLjghHZU
         6/iiLEJ4lvzDFrqeAEHtxd+bkq3sdBcrk5hzDDZBdEVkrVy/5KpqRxCpviDZ9rWcVrTz
         Aj9w45hb0a/ql/3pCsEq4zT8oVMkGMD1Yf3RnP1kxypF8UkZpGYERXhePMYA2dny4zjz
         4tMgRX3Jbh17OaK9bhL68JgTWskzcxYQJvcykkJcfU04FauMWnMkC1oaMjHa6nLcIGr1
         ShVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574172; x=1703178972;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecnta8fmq85962lS8hL+fAUj0iRD5WKCwqnVAGP2iIc=;
        b=kGPw6CqAC1sR71tqR/hB1in5Nfr/1GZbdC3g8GKjzKSbEJbx0hKxcz8slgqeSqcEwW
         0H3qJYiu1k7wTw4STb+uaakNa/kQA0f4+lDTbSEGWPODZ11kNcg/VWEZmcyWc3i2vJqu
         239YEQYstmmibzKN13y2Iu5U43rlhAtkFLU97Z5SqIKBoswOspqlKm8LQSgdXTh9YCcE
         3Mcq/r5XYFgo2vbIEOvwgBKxrLCnNLlWePeCfl1N+ANkCaeR42dvQ5ucho1pzzLuPO32
         EeOdmf/X/tiF6vnebrb+PKGc3qU4FSm7JrkBd1USPVlthdRvracsEfh7j2JGO2P+1Qwd
         ED8w==
X-Gm-Message-State: AOJu0YzLbierxKDvGLbT/N/DAZ+Oo+xVSF74e4jrYu8kNimQp3OmnaI3
	Eef7hOMxm8cca47yRWYixmiqEg==
X-Google-Smtp-Source: AGHT+IG6Su9AcJ8UB8+CR3YvRwMsFViTW9KvL5ywNrTDS3Z7rvlSiHVZSb3ePy1KzoSttFUebNqOqw==
X-Received: by 2002:a17:906:3f13:b0:a1e:7683:4da4 with SMTP id c19-20020a1709063f1300b00a1e76834da4mr4450934ejj.11.1702574172010;
        Thu, 14 Dec 2023 09:16:12 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id rl19-20020a1709076c1300b00a1f8bae93d3sm7609398ejc.215.2023.12.14.09.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:16:11 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 14 Dec 2023 19:16:04 +0200
Subject: [PATCH] dt-bindings: mailbox: qcom-ipcc: document the X1E80100
 Inter-Processor Communication Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231214-x1e80100-mailbox-ipcc-v1-1-49d177238c9b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFM4e2UC/x3MSwqFMAxA0a1IxgaSKqJuRRzUGDXgjxYeBXHvr
 zg8g3sfiBpMI/TFA0F/Fu06M7gsQDZ/roo2Z4MjV7HjGhNrS0yEh7d9uhLaLYIteTdL11QydZD
 bO+hi6fsO4/v+AeE8+h5nAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=JIVsQfTi7l0HKesJJg+/gqxHs3KMNT6H5TGenNe67T8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlezhVBSG2LXnGFpw9Fd6d+VIQW1urKEo21MZzX
 q9y4MpVefyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXs4VQAKCRAbX0TJAJUV
 VgO1D/9KAMQ9QWuf3XCJCB2S1M27TbPpoQV1A94UzDvNuRAGDAWLL3rXWX3kLh8KepIwZO6a73m
 t0WVFEyfwL8jDs+FL9z4+voUe1WZhJzDoazN/5EgYoNPF2/ZC/s2czxnHL7awlq0N9LWUIxtbPo
 uKpvi75s2QGc+LXuwJAy27nQV99LU8LPbhJsNC1Ohsqn2ZUT3xddFFBC9J+XKZQs0lBkuUXj1Kh
 LLvHbzRc7NlFpV9XSege3G/NRydc9LCc2NR755GNeZRdut0sZdbRItQM7r755MMZTJlsrQflg+m
 yx/OfzFjCpoCFPAGPK9s0fKxxPh9eMkI8QQ5YUIRky6LCuNSAiTQaAGSA/q/8QT5QgUQi+ZAMFQ
 BL5nrZ3OoG6NmNcypJA73U1AgnccBinsqOcvdx257SBkDyTCJhTGchhOO6Ea8LcJkO7oyIjHOFY
 /PaIHTDoVIJIT8Y4RZH5gv7v480HovOak7pBWHNrvZfJyD3T/MmsQynKjOeavfwS4AkBSmKJ6ns
 Hj2vPVb4IfR+O8qkcNRIvpJTK6Zr3nN1f5vxLPz0LCM6JdkvOXFVkVbY3SK3DMWMEhbdEGK3ZW6
 Dt+Uob23ejAJVRnPkpKndyYxeiVp0TOoP15VlH0xBZnvaaopAcTwMQnuz00ZnMBDD6bI7e37L+7
 LtD0xYBzWWGUBtQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the Inter-Processor Communication Controller on the X1E80100 Platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index a35f9483dc71..8f004868aad9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -35,6 +35,7 @@ properties:
           - qcom,sm8450-ipcc
           - qcom,sm8550-ipcc
           - qcom,sm8650-ipcc
+          - qcom,x1e80100-ipcc
       - const: qcom,ipcc
 
   reg:

---
base-commit: 48e8992e33abf054bcc0bb2e77b2d43bb899212e
change-id: 20231214-x1e80100-mailbox-ipcc-80a2dc963cb9

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


