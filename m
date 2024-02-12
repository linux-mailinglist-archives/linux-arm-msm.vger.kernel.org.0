Return-Path: <linux-arm-msm+bounces-10703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E34851A98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 18:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98ED0288B5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 17:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F26F3EA97;
	Mon, 12 Feb 2024 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dd3gyg2J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE113D56A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 17:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757379; cv=none; b=hGJJ7KaoRN77pN2k2Uv20ZyZNSkTI/KXuxufdYdkyUqD4fIDW7t1PstnCAhtDowBDajb8NQF2FAgwkHg0vKmjhqcNqnYib8QzKzfDfUA/WdzMoEjeazhzsI7Uwlx9zL0GhH5QkU1MeqNHCJhehzjiidcSUcwLU1rlnckrAMpU/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757379; c=relaxed/simple;
	bh=J7jd2gMJ3Tb9cXuCniE1aroUmfQInY2z+BgcvxEs/MY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDjuFZbGG9RmVM8R0w6mmmQf7Vrxh6Cz15UieSDGJG39quwXJDzWPpaWGEJdAJoDsEWYomMOLhuZtRmCf7RBPne69aKEPlrm5peImbxbzzxxXS8eBFq1PZYfSfz8co1VJKB7oI7ksjmj/D1ni3yNlUgySxHhh4m/W3yVSzfazEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dd3gyg2J; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56001b47285so44418a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 09:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757374; x=1708362174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/xOBeak0OAnwe9iXVzoh3J5oS3uEnYBKWEW1cqisNA=;
        b=dd3gyg2Jz/6SxKvjHq56YRXnvmLZrY3d9MiQ/GGQxuzjIdgn1m5k7pJwdxHqewY+iH
         lS8za3b5bBJ6dv1V76PprAHpwuzEZHAmauut8F/ISlk/e+v5xPPpVdzySH1FTCmNa/Hj
         tCAkHLoSFwvujt+9hdhBSBKONW0NYhsVJYQmhNGzPdDEGenDwen62bXdw56hKK1iz8qO
         EIWlsYdB7JV1pMC5aecMSQAR+L0ILRHjpQ2xt8msjt4pA4JZpWLhLwhY+A95NIo/noyy
         CjmYn3kSt15G6AEjy4/uCkNtTYa0XJ3owQeiy4WEC87YSvDreYKDD5wHLSgB82kiCgzm
         h8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757374; x=1708362174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/xOBeak0OAnwe9iXVzoh3J5oS3uEnYBKWEW1cqisNA=;
        b=K9xyos/bS6X9L/nmKnlXiX80T9y/kp4vxobnWUf2rSSttH5yv+YpZwSSHa4xrqWjYJ
         LejCbMA8DuZq+U50snY91IylRTQg5P+OTSExH+DzO0f2ReZOVU+GvrtIrzq5qtg90Fej
         aCaSHzYaUL1a3flZ+/cbknT5vutcZDtEkhv6pwq7ChLw7XUBBZWGxXMNDAypl4Zdpa3d
         tslPPCc5WMylv5DRd4Jc0s4PabYcwnOZNswzMDuN+uEYJerGtvHSGJAhdsYPIUMZShrl
         73CnCDmoCd67aE7bxnMwqJvvru+HgdgfbMXbJo/c4k/pfJIbTupVM6WWQz9hy4LitX1Y
         9zSA==
X-Gm-Message-State: AOJu0Yx+dOhb1FVeyJzaK8IGRby/bk0hk7DmdU0l22E7AFOETTvmHBh1
	nL5ay4iYCtwqN/qgZ+G6rw4XHuYf683dVYl54hqGI8TSUaUM6l9W1iPBNiLNTNQ=
X-Google-Smtp-Source: AGHT+IHe3UBu5XjtW6IiNrTFMtxPVldP/Ul9CtM1yJKa6R+OxGphSbG9qDfVEsaeSxmW+gcPkK2fiA==
X-Received: by 2002:a17:906:e0d1:b0:a3c:ceff:e83 with SMTP id gl17-20020a170906e0d100b00a3cceff0e83mr1237231ejb.74.1707757374314;
        Mon, 12 Feb 2024 09:02:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJpWFp6a7r6ytMcJ1HbyUkfLc3x2Dn3zsZi2gAjN8qFgT22gwCVzYuImF47O1HGVS5asleme9K+yRSy4IqVDlevSecHhnx1hXCM0aoe5qTrodhfxiWoX88PoNQfC4BqihFd3zPOKX1h2ui8X8igHkXrizMkQQbjHXZ36Ti31/6CGLJxrgOwLfUqkdP4wcwpp/7E4X/pXSiyr1UgrMN9d3rkOjXWSO/oqPZvbBExVCKh0bfBL+WgLX8DsWrFD+uWz2RFy3pM4mv4V6LUZB4hqwdt/vUgLIWSju22z5+wZpqdTs6a0QWuFX3+KGbCQGoGEcSZ1oPdFQ7yRpds2oKQQx5TZiJpSLiHV1+Hr9CCzoy4BSLluuWX16P1VE5BaHMIcnboG7jGtsDlCXptLwPgARpTwkY7vTPVPm3F4uWVzXgkdsnt/1QN/X4jMOqIs6tRldYqno1trtnvQJZFbSFRkcSQoAzkfxThqhqNsr7KqpqbsA23TEi
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id h23-20020a170906261700b00a3c9951edf1sm379600ejc.115.2024.02.12.09.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:02:53 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 12 Feb 2024 19:02:42 +0200
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm8550-pas: document
 the X1E80100 aDSP & cDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-x1e80100-remoteproc-v2-1-604614367f38@linaro.org>
References: <20240212-x1e80100-remoteproc-v2-0-604614367f38@linaro.org>
In-Reply-To: <20240212-x1e80100-remoteproc-v2-0-604614367f38@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=J7jd2gMJ3Tb9cXuCniE1aroUmfQInY2z+BgcvxEs/MY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlyk84aFuNm4He6ERGeWKDXJGHHxrGQvV6hhEWk
 ymMwrW6YWOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZcpPOAAKCRAbX0TJAJUV
 VjpVD/9fAqOCHq/Lln43dvkvTYiijac1ab7ii12CHShHaN2vm3CFY7aYXj5yMyARJH+tsn+KlR4
 ipq+I8osZCnPP8Ye0dE11muyyOwR2w44YTQYeCxeEqGVRs0FchlWgBb1AXzpOfLY17aD5r6M4RS
 OKwz9IUlVa30vpa0fp7+e/cxgTpq1XJvBv+yePeVB3HIxKpjPUU4Z1tlmQGS1Ic/YxS8xqiKq6P
 CX1oKYf0YUvNzjqT3esKfqwFeLicoypYB34nK49Q0eKyZjwbWiuRExAj5i5wYxbJg7rrFTb7rrk
 w9wE3sWtqylcNgAmlHV4zFSJ1w9WU6+iArecFb/m0wlYFGWqx0S+4P33Mf3FFDh0aaET/uRF4DS
 GOZRn7rM0SUWFz6vR+tuuqHG/3X3+TC5+kPvt/Z85kwRcEidStSpn+NhoFTGouh4mo1znrA1ijA
 ZwJIuA8EIJFTcW3YVc3YzbTIcQEkBamxCw3EoEXjDtzsVh6vg+iaTqD2YXHeVs4YGY1zcvu/N1r
 WuH5O0lMa6vOE/SjtNf5d942Z0stTL1S32X6K3i7Jg3KRiBAzT6fDe5D51B9E0HdGh/n5S3M4Af
 0Acuvm+6SUAdHxr/5qf3ab31TyvnGIxGMcSwSvULA0n+6a6nIj4fzuWNmxKMmJJuqmC+vZLWBGX
 fBTljd1fcbnBWnQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the aDSP and cDSP Peripheral Authentication Service on the
X1E80100 Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 5f63b6b9a8f5..73fda7565cd1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -22,6 +22,8 @@ properties:
       - qcom,sm8650-adsp-pas
       - qcom,sm8650-cdsp-pas
       - qcom,sm8650-mpss-pas
+      - qcom,x1e80100-adsp-pas
+      - qcom,x1e80100-cdsp-pas
 
   reg:
     maxItems: 1
@@ -69,6 +71,8 @@ allOf:
             - qcom,sm8550-adsp-pas
             - qcom,sm8550-cdsp-pas
             - qcom,sm8650-adsp-pas
+            - qcom,x1e80100-adsp-pas
+            - qcom,x1e80100-cdsp-pas
     then:
       properties:
         interrupts:
@@ -126,6 +130,7 @@ allOf:
           enum:
             - qcom,sm8550-adsp-pas
             - qcom,sm8650-adsp-pas
+            - qcom,x1e80100-adsp-pas
     then:
       properties:
         power-domains:
@@ -159,6 +164,7 @@ allOf:
           enum:
             - qcom,sm8550-cdsp-pas
             - qcom,sm8650-cdsp-pas
+            - qcom,x1e80100-cdsp-pas
     then:
       properties:
         power-domains:

-- 
2.34.1


