Return-Path: <linux-arm-msm+bounces-8861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6C6840716
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 14:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3A1DB2494D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 13:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B13657BC;
	Mon, 29 Jan 2024 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fwuUF+1p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD66518B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706535297; cv=none; b=sH/oItmKc+DVgTm9ZTOV1vKbiknr0JUnRgfTRTpzfuA2I7R9NtlNUr5zqQiXOsfaPbCy/kK/wvtTscIpgbaqXhlGqFyph7e6e23TPYctbi7vQZH+Vygtx9kR6JAmKWm7Q5h86SzgYlZINne6MY/XzF/vprurONl42RUklq5R5Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706535297; c=relaxed/simple;
	bh=flicCfqngKIW3zeJAOSjBz4FeMqtB9eKYKJzdn+m+m0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8NM7+YZAs+Cowm3eTyIBEOYvlK+eCgWyuPyLNC3u+O17HlpX9+SKaQlhPvjTBVCXPh+NykN7vF9vEcXu28VlNpqa7t4yq6JdwG9TkmTzE6NH8nNb67kU4ZCH1i5D6TN/X21fhXyz8NadFqtISf5EgvN130k64VUVtE9fjBeN3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fwuUF+1p; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55ef4a66008so1264046a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 05:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706535292; x=1707140092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJ4qQ0eECaBxK5wIYNRpchzy4eFlwHhLiJlk9IpbxIw=;
        b=fwuUF+1pyMIG9H4Z3J/lcHY1Xq1DEpZ0yDsP8yhUTBtPk9fM0YofeZXquwpOn9PsTz
         pbA8y1jK2r2dsmnRHKhdWXgT0RDlhzxyIQBRUZrs+fNBS/jx0KunKkMEr1CLuhH1NPJP
         O4+vq9o75mNsuDTIlsFMMPVOmYdYb555q6BBZ/f0+8wWuyTevZ+LsJxzRdogmGqg+YlV
         4UoOBAHFbWMLIiy2/5LH/8cJg9Nv6NzTHLKoDmnPOVRYWfqCxiyHHvyQDaAnsAtf9Hae
         iQEBpdCcFIFeDw/YF/rBAWMWHkD9Hf+HlTwzn6ND2rVGgDFpncdtnrH5Yhl05bzQpEfe
         f87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706535292; x=1707140092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJ4qQ0eECaBxK5wIYNRpchzy4eFlwHhLiJlk9IpbxIw=;
        b=ThxvdMx+0K9REm5+mtFLFl8HbHi4iZuHYxpnySKmCnyltyj/C2F0ZMTrKO5f3P3nkY
         wEpn0LWWdHTcmjfAWbvBMTZlf6bmQM/DI2t7DSEzbK1EXJ643Cu8ATMVfLJojlDtkhj6
         GXmDlbIeBywywBAMqjoZxh1t6Dc/wGpZmGzN5Yp/o6I3Gfmut2OWKphe97v3ria3KS+N
         8xvc/S3fLeDBzxjk4AYh2Lxo1A7cJFGuhynKY0WTWfyZTQuRvcdZN2eUOGfKy59RMZzW
         90fiu4JzVuhEyutzV6SS16tnKC6pUqwF1gyVY2UJBdyGWv3EYjMiemn2yDx/8OjfUUbT
         AbBQ==
X-Gm-Message-State: AOJu0Yzc0acxhZ46Muwtgz5Ak0L3wAurIcSDACouePW4Vzg34sdKQ2JG
	yxERS/WlipAp6Ami/oEtsx04QfdWC6DCpiAepguoiexPuqK6RIYJpP/ip8aOtcI=
X-Google-Smtp-Source: AGHT+IHCog9ng7nG8mwlAJ0EvaLusfKdmX0v5Fypp66prrrEgSafknWTbNyzVpYHrU0T8fbS43hhDA==
X-Received: by 2002:a17:906:fa97:b0:a35:9e3c:80dd with SMTP id lt23-20020a170906fa9700b00a359e3c80ddmr2719499ejb.5.1706535292479;
        Mon, 29 Jan 2024 05:34:52 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vi1-20020a170907d40100b00a2f48a43c3esm3911483ejc.7.2024.01.29.05.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 05:34:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 15:34:37 +0200
Subject: [PATCH 1/3] dt-bindings: remoteproc: qcom,sm8550-pas: document the
 X1E80100 aDSP & cDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-remoteproc-v1-1-15d21ef58a4b@linaro.org>
References: <20240129-x1e80100-remoteproc-v1-0-15d21ef58a4b@linaro.org>
In-Reply-To: <20240129-x1e80100-remoteproc-v1-0-15d21ef58a4b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=flicCfqngKIW3zeJAOSjBz4FeMqtB9eKYKJzdn+m+m0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt6l2phfhnajXDLtV+vW3u5qyfRgKguQo9eLiV
 ojQee/9tEGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbepdgAKCRAbX0TJAJUV
 Vjw/D/wNbhRk1lwXE1/jRT3HWG+Ko4TDujVe3Xak63OUDc+Y7k43YBNyJ8CSYQOFz4ONfpWG/Z3
 Cjn02Yu8FsycMQKIglZxHwRgIbV6Di1iKBNjVclzUGM2+bgDXh/jtyOZBRQehJ39BaA6/e58EJW
 Ij/CG15mpzZ3VVt11ACMETQrWqSypaZoeAbMCHIXHWBkUVY95qMIbsKbwXy4SD9Y/icqVCuI20T
 iiVf+cpSxMLpbV2IhfYcrAasP5mofTzLCeOQndI9cfjiTTjvVeD7aV26/eeP+7Ev5uUMiBcb+m2
 qKUf0/y5OIKll5GmIMhIx9rw+0fnVdvAuHppBOpk1EkNgQNjslKtWbncKzaa3nlOyXyJnmrGY1N
 AccbblLclG3HTFJ72KoOi5d2I8XPTZ8CHn03FigoULtZT6ZRC09Yxs0wNoqj2jPvUTUEQiu9Q4o
 75Fbj2I/i1OwZn4D17LigtUwGUM94J9e4jjuWb9pro9wBgT1MgIN/NfLf0lP6hpavoOdGsYbN4O
 Z+VshdNdJkc3aP09XizSJ+xMSf54YGL+diF8xv6XU+bDzTSzIfR0TTkbxV2LJp3kw7moCjVcdDr
 Oc7Nv1eOC5VBAaJL8Z2jioWiube86JXhOe0HSvQzOJlFtyRiMH4qeGnRDURL7RVILrccgFHb0Lt
 K7kboPFr/m4zbGw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the aDSP and cDSP Peripheral Authentication Service on the
X1E80100 Platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 58120829fb06..95ae32ea8a0a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -19,6 +19,8 @@ properties:
       - qcom,sm8550-adsp-pas
       - qcom,sm8550-cdsp-pas
       - qcom,sm8550-mpss-pas
+      - qcom,x1e80100-adsp-pas
+      - qcom,x1e80100-cdsp-pas
 
   reg:
     maxItems: 1
@@ -63,6 +65,8 @@ allOf:
           enum:
             - qcom,sm8550-adsp-pas
             - qcom,sm8550-cdsp-pas
+            - qcom,x1e80100-adsp-pas
+            - qcom,x1e80100-cdsp-pas
     then:
       properties:
         interrupts:
@@ -85,6 +89,7 @@ allOf:
         compatible:
           enum:
             - qcom,sm8550-adsp-pas
+            - qcom,x1e80100-adsp-pas
     then:
       properties:
         power-domains:
@@ -116,6 +121,7 @@ allOf:
         compatible:
           enum:
             - qcom,sm8550-cdsp-pas
+            - qcom,x1e80100-cdsp-pas
     then:
       properties:
         power-domains:

-- 
2.34.1


