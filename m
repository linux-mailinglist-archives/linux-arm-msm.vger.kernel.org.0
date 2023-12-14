Return-Path: <linux-arm-msm+bounces-4803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F518138A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9C781F210D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 17:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF25D65EDC;
	Thu, 14 Dec 2023 17:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CjfBQl2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B06114
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 09:36:05 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a1f5cb80a91so980598466b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 09:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702575364; x=1703180164; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mne296aPJtU4QgTaZarV9zfnR0z7R06yN21F5bc4Dts=;
        b=CjfBQl2wcqcyZ1n8uat/93pazT4dUGZJ4uB5iCYppKV/LsCIZzpphxxCfoKK7sCxm6
         VAe7eueUH5uYB8EScXXqeieAyibAyVTzaFneJG5UThHBgw7rdmIuG1iWWHMDg2M8v9/F
         2wrOhJo2vfSDkAsm3oOZDOHj0B3rjk9z3v6Iz+pM7YxWaSsFZ71lfsPgmVM5cLgjIob2
         /MUb/Fc6e61uT8byNyF00oZWlU4fkXesl/73AOw9W/e37t8YF6T7OiQCh+SbpG1yLLA7
         THTOaCn6mQU+px45QYGB2jZdwD6u6WlDshLgPz/qex+eK2EJB2PK11kwS8JQUJg7UBoQ
         d+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702575364; x=1703180164;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mne296aPJtU4QgTaZarV9zfnR0z7R06yN21F5bc4Dts=;
        b=DIEEnMnw4p7aXniUZGfnTwaCllWFFwgKjKAbrMfQBGCBBBU1qGpe8DxOq9JOzc3kCI
         33Dh7gh2L3wdeqdSEiaqmwfHw6fK1vhQ/717s3K3KI3eBopbYEAB+pgEcFzjPQeUOGIt
         3nO99BojZrxDKWFV2clRyw6KKDf/vTBiHSL0RU1e8/SJYjmdq0kYGW1xw7qMlBxJA+uP
         FYoCMvIw/SZrtMdKcf1IpcNn1HY2mgYE9W/kseSki6bV9xUD8ksYr+8OzevRcsidr16j
         DQ7IyMaJbrMPsxyZPKxyV48u/L5m92jh2eX6gGfFXuNfyqxelStIahjEZYjo0CT3Qb0a
         DsQQ==
X-Gm-Message-State: AOJu0YzATuwckubOEbO/pfcueLypvApmdVrm2M6Tyktz8rOjEJucS9UR
	3BEWVSC6i855ntXSasTdzM1k339hZyvBNZR+log=
X-Google-Smtp-Source: AGHT+IFeRbq/P0rFVY/jZj2F38qeGhn7vCHi5uvfFQGtWJNc8iTb9zwtG5dTkEQUc16IMLebQlhOtg==
X-Received: by 2002:a17:907:94c9:b0:a18:eb7d:9424 with SMTP id dn9-20020a17090794c900b00a18eb7d9424mr3783906ejc.27.1702575364125;
        Thu, 14 Dec 2023 09:36:04 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vw15-20020a170907a70f00b00a22ff4994e9sm2725086ejc.214.2023.12.14.09.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:36:03 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 14 Dec 2023 19:35:50 +0200
Subject: [PATCH] dt-bindings: soc: qcom,aoss-qmp: document the X1E80100
 Always-On Subsystem side channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231214-x1e80100-soc-qcom-aoss-v1-1-94c46c5182fd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPU8e2UC/x3MMQqAMAxA0atIZgNNKyheRRxqGzWDVhsQQby7x
 fEN/z+gnIUV+uqBzJeopL2A6grC6veFUWIxWGMdWWrwJu4MGYOaAp4hbeiTKlK03jXd1DoXocR
 H5lnufzyM7/sBmbM+L2gAAAA=
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=944; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Hep+DHPXJuUzQ7KO0AE21Mq91lRuEtDe6OG3PuWcLSo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlezz+VP8l5zwR6k4mCNsMqm2+p7ow3ZpLhK8vb
 wo0TGrWMReJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXs8/gAKCRAbX0TJAJUV
 Vu6qEAC5PCwBaBNdR2gtdLVYHZK9mnqofbsxDHQm1mYOhy+7E7Plmt2GrSqc96eJikFLjJhLLFd
 J8NnqJfnZh12udrLCGlT8hqb+ayjxqxW6zQpC/3IqIxsqPgBwMYop9/mS4lW5EDLYce1y/3SCM1
 gsmOrWJA0LC4/4aYg7+t9BEGJsCvJGRaK12gA+yVVcAxoYiDwM2t2wCciVRrovr/AkDC9bSvH5u
 Dn8phCPODJOroOge5GdS/00IHEJdstjfy/hQteELbbgATiJoWVhwolDll3Zc/6uX4U6dFge4XB+
 dBjSHDe0VhlrCmgRcdhOF1TSQvpKmx0WOdYs9FN/C5IueIV6HufQ/uRTyVCe3HvYHz6CitsmD3e
 /IIdMocyIfX8ztyt9uhESYvZGW962h8AIbBLyxFyOGNqrxLmSCh8V1G9rvtbjmfACC45Iw4ONCm
 zkFywPmqgr7XIU+ytR0WZ0vZ1+V9+WjjOrJUzkthdHIND9HFo3BEQLCZ9LqSL7hNTzc6iO95rfp
 tiuXjkGk859D/r6Qk2w13pymo9U+fl2epmf2Hmx0NvLShTMtUNTko4zVDsDNYUqG03A3z2q7nAa
 iLuhux5nNkK6WPrvBxVKp3Q2kAEUHU7gRJjejLiwBY/XNuYDBmy9iWpbGq5l31oEnue7AJ37tjF
 jfZ9vXVVMAq/M9g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the Always-On Subsystem side channel on the X1E80100 Platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 109f52a0b524..b4478f417edc 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sm8450-aoss-qmp
           - qcom,sm8550-aoss-qmp
           - qcom,sm8650-aoss-qmp
+          - qcom,x1e80100-aoss-qmp
       - const: qcom,aoss-qmp
 
   reg:

---
base-commit: 48e8992e33abf054bcc0bb2e77b2d43bb899212e
change-id: 20231214-x1e80100-soc-qcom-aoss-1d2a348b733d

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


