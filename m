Return-Path: <linux-arm-msm+bounces-16688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5089B2DC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 18:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CB0F281285
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 16:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B113BBCF;
	Sun,  7 Apr 2024 16:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VotZmg7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687B3A1BC
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Apr 2024 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712507028; cv=none; b=EK2XbJrL5XlusE+sj4VBWYFOO+mTyP+6nFha22yXyy9rqkzu4e1cCQDMA/2jQjLkoNVAxmackKWgLdkf+XWT0xEuojaGbUIFa8s3vkOh8vjnscGA+q0GcbXiVlu5Ku0OcfntTO8eUsAt/L0kp5vlU9KLhb0Gz8ZL77gPyJZ7h3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712507028; c=relaxed/simple;
	bh=f1k2/XtnKKT0QabjDTtzy+0Tu+D0+1BkiYHMuQzuNWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e3jn4Vx2A/CKfQXoQNlUjC7OViWgSJRKIGPlrhsiQ0GYgxzXCaXqi5Ko9/AohkasK+o0lwHd7unDCd+lxTayVndGizUiSMGs/PfUzl1CzL0JJahJdlVEcgxCIkJTUrsRvzX5s9mNZUQTycDKcTVneTYq3FNpFsND+eeHlXxEzWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VotZmg7p; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a51d0dda061so41873866b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712507024; x=1713111824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=VotZmg7p6gA2qZ6KULVYyC8KxTcWKhhFBZIVFUD9JdF7OtyLDzTqJ3NKMv9WqQvJDP
         wdRDOCodtQlvje4PdNKt/8pV+DRrU7D0Z5QXsjNaMomxZJC4MGBd7I+/mASaSYgUcIL3
         kdZjX/dLiWj7yz7lS3AUaTcw1vXyfuDSZWWxMJVR6WcicSE/jPM0FFAI37Uoo9NxPdLx
         REXixIAN1f8y+NHtTh1UUieU24ghvHNdgVtvab7m5VasnWUEI3Kj670jsd7K1H7qJ8tS
         qihV1YrOySdNIpIhxKgKvcPN2UrLrQEZEcTOd1YUfxa70tcVvs90rul3necjyr4Souey
         L3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712507024; x=1713111824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=ENm2ojZMyi5hJEedmOUgjCaVKCo2VYDye3OJpYDnf15VZK41l0FZ9xr6V6p7WghrHS
         iUMrG8scZDUuzbed7rV76K1ZDqWWI9jCJIuncMydoQUm2LWkrbuUaW3n7uROfeL+G9gj
         xb2txAvQv0rH+47b9XPcaxPmn0SjS9lEo42WJf79X71OZAEOcqcJ1Bxf+VCJRVnI3wtx
         Lwc3wALCYw5O+hJKysc7Xw+cc6/tvvWI22xiz0xtDSubJ2RDO7cWIhhr6+WGamZpv80O
         GhXp7wSqrb5feqdky6sJC9b8Hhcdob/MtPi0VwCEHdGCn2UtsYtpwbDjl7mB7Gb91pq1
         yK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOBhnhm+EyxMZM18RQ6T5qQ5GOw2HwUX16uz4a12vtbmWq/9P6c8esOuPiObrd36Vb15aRfJe6CRiZMPNvlH6Zyqx/KgDs6hhGbzXGaw==
X-Gm-Message-State: AOJu0YyNrleQUYsNXRPw9q7+IMz4Tzx7rwuXMKTHdRajZTi80yIPhqrE
	qQ0Z4lm4wz6gT729q738B+9JkjDsb20KeJ+C+YQyJWQFiafnP9hX9pHYMPchPQs=
X-Google-Smtp-Source: AGHT+IG0AkCZSMmS2Shl9d8nSs/2eGpGUav3paUeGvD+v9WFbHkTskXsEsX11+oPqTjTyn4PFFndIw==
X-Received: by 2002:a17:907:72cc:b0:a51:c311:8199 with SMTP id du12-20020a17090772cc00b00a51c3118199mr3500827ejc.31.1712507023717;
        Sun, 07 Apr 2024 09:23:43 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id qs28-20020a170906459c00b00a51bed388a4sm1811626ejc.139.2024.04.07.09.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 09:23:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sun, 07 Apr 2024 19:23:22 +0300
Subject: [PATCH v9 2/7] dt-bindings: spmi: Deprecate qcom,bus-id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240407-spmi-multi-master-support-v9-2-fa151c1391f3@linaro.org>
References: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
In-Reply-To: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=f1k2/XtnKKT0QabjDTtzy+0Tu+D0+1BkiYHMuQzuNWI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmEsiDgoBJu10bDGjkOQlKiFUR111JqKL1uRRLf
 +Orxj0NzwSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZhLIgwAKCRAbX0TJAJUV
 VpuFD/9xdy5gdxKjuK6+FBvj7w9TUiK3bvGSdZfyhJYT4IETt5y9sQWDAPeewM/RVFWmv0a+3gs
 5e67bCsLjPLbGIoqsEvwDhvPazDDlY10RZ4vGjiY3W5TRNA5eETaj44FeY+HlLOpX/Bvqia63UU
 w9oJsDq+eFDj1HVl3lekceaddpU0OewBWyXlzubTBQQpYk/xd4N4jdy1GDclQeRhN6Nfa/VeTMR
 vyhra4UDl6mXlPa5BHT9qvTXP7pVF0zB5dyobZizK9YjRsPigYS+LX3OmOjV2m7ti5gC8iwq8wn
 KIZi86jwYArLO0U5wjbHn6zaxddpd1lveGBk2IPRt2E0o5P+5jnYJuSjoICp7AGISqiBAG7AxLR
 p7Jdz4hNRH340QueE3OD/1VrnG4vYNBy83kcFkTdBipe3j3nUsBSZoTaOgs9gDhAlf/qn7K1PrF
 ccNgxTWKq5byQofdhdkCQH2QIFXLQ6/Fl18fQndw3cSjCmkoPcZkqKdinfJIPLIeaB4+LDPIiuW
 ewtzleOdG1yjZ9m3OlJkdHE1nTSeyMENyZSr0ZuhenAVfLebsoOakxnENYyAUxLscr8UVAo6aQF
 BXemxECrdwsZOoWJJlq+yUz/oO3s0bSt1tLivZ2mOImaxLHVatvOR6djmJENISR0BGLQiIdmx1o
 7ZtdFW9QbkbTqiA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

As it is optional and no platform is actually using the secondary bus,
deprecate the qcom,bus-id property. For newer platforms that implement
SPMI PMIC ARB v7 in HW, the X1E80100 approach should be used.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
index f983b4af6db9..51daf1b847a9 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
@@ -92,6 +92,7 @@ properties:
     description: >
       SPMI bus instance. only applicable to PMIC arbiter version 7 and beyond.
       Supported values, 0 = primary bus, 1 = secondary bus
+    deprecated: true
 
 required:
   - compatible

-- 
2.34.1


