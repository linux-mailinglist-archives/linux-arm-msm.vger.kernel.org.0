Return-Path: <linux-arm-msm+bounces-79195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C7231C15080
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6F174ED14A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 14:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E495226CF9;
	Tue, 28 Oct 2025 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RqScxJoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9522376FD
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761660000; cv=none; b=g/AVbPGcLpurSEWAYTU8BBeysCTXg0HsWWL5jPVR97zr8L4VpBa29SZsxgc3w39/ooVIrg6bRRMXuU3B0hoRRaUEjSZ/LQPStdXyqtLlss2CoYKW9LJEc1N7DYwWnCfeVXUlR47PDeT5po8LxvCNH/5hqbyCevIL0akbIVz6uAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761660000; c=relaxed/simple;
	bh=k/z37DpcmFOOlEmrGToe3bvh5n9Z4BjEymbUZ1wVg7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m+bx62OEejdBloErdCUxDpNripQB/UPu6fZZ/fWv8zp3iPsdYt/8htaPk1cExI2z2KldsR0jlyqNivke16DAG+qLX+GZt3McAelv4rBsD6DLQAOTqKWyoCVN2Nd8di67gdVW9ENAhr3FgLKKU04KYi212wgUt5xu7nhobW+aZpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RqScxJoZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-421851bcb25so3742690f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761659997; x=1762264797; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9Ejc5yr7tR8RfXuGKte6rlzb1muxKUXvstz7F/NSU0=;
        b=RqScxJoZo/0OJI2SMN8pMBeN9gt31ihQLMY4ZOh4SgVWLQv7rCOU8LvLJXCkfR8ilI
         HJAM8Nyt0Fq94Yl0cZg/DGFcZ07eshWNqVuFruG6mDmUWCcXNtIhMdVsesrrDLUPVRQu
         DZaTDl2gmW+9MT8+6tUBoGnOmC+9U3Mg9h3JhcIz8cKknzIThFtieZXjHaWLKyeoD7U+
         1EnY1OjA3KCP+bkQ5KE2wG0aiPxWXCJehMXyi4ceAWisuJpb4JOrkIAbdkTl2JWiVwqw
         Ax/3vAlEDwYfreEf6mz/l+teimU69AVLz108hQuyAH6BkF0Rvdnnaas0IU0CZZ0J7ZE4
         qv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659997; x=1762264797;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9Ejc5yr7tR8RfXuGKte6rlzb1muxKUXvstz7F/NSU0=;
        b=rhB5n1xmHwOkYlIpl0CI++d+uCudNqsJlidus+9vykKKYyByIPjqjnOO5is0Gzv9R5
         fJP6eT+y61U/XOXos1uvOK5eHkxNNuWh3Q4H2rL7JDhKNvRuFxXolkRcvRc1YfEC9hTD
         OylJDsGb9nNpKHnlTgxqbA/Ek6lCLYwkoIoY6Q6ZN/z7Whlnzx6xDGz2Qr/Xx9C/hype
         8Q4p0DD6wV86otIrUxLfFZZbrFJext2wTRJjbGQ+ozkyMMq5GK9oSn/IRTwdjIIPAJG9
         G1BCiQvCTQnuNF4kuVriQjjxHBlCCxcEKCZiM98Qwi1ppEyKYq+TfJGNLDPjDE4g0e1W
         CPUQ==
X-Gm-Message-State: AOJu0Yyoh7cWNivOlmBpr0ZfpHG7n5dpAtg9ANjWoaunpasrsYnzEe86
	e308P61R++UwzOVLSCZkHw64aIwIC0VuzAYG8i3tRw2GUp8jtdG082u3byYsDqZVg8c=
X-Gm-Gg: ASbGncvfXadpz333SYFv6Vd6bo33dz7B93cts/Nt4JeDcTSYPIGGrNacN5w9zY41IQc
	iiOB7aqs8ktEV9uJSaHGB3cUQlAqJMpgTttdOEVsV6CMAh27s+WSPvOyV1ic8gSuKWobetfxFtB
	aHuk1UBYngHB95wgoh8OuSqpfGHqLSUZDxk733oOZbDuHxGnjOkHC5/j7fqLqmt39JB5Na4AgSz
	IeqQccgUbt2bu9afYLre/4NpOYcg0wq6i/X5xnfRta0+vSnTZPgoD0oXpzP6Ls8cDvMvF5/otCh
	9LHGAGax1uf3jNsSqh2sgEYRtM7BgyReFwS4FpcTm0yy9TnB0jfqMJ9NmxDhDtE/JQSBf3EeKwV
	Oa4CVf8dXcztzTEiBJYjlawME32LBxD7V+/0oWSp6sGIHnLEJ7QAdwC6tO/EHCQk/tamtNPQgIA
	==
X-Google-Smtp-Source: AGHT+IETsjPvnsjFVCDSm/TO7QjcsLfsSZXAgNuLrX6SnQGm2ayMdGSoslgVrcjH6Vulpl+zZ2j7sg==
X-Received: by 2002:a05:6000:612:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-429a7e52f24mr3018753f8f.10.1761659996784;
        Tue, 28 Oct 2025 06:59:56 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7a7csm20688662f8f.8.2025.10.28.06.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 06:59:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 28 Oct 2025 15:59:49 +0200
Subject: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Document Glymur
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-bindings-pmic-glink-glymur-v1-1-f76f00161f46@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFTMAGkC/x3MQQqDMBBG4avIrDtggqJ4ldKFTSbpT3UqCUpFv
 LvBzYNv8w7KkiCZhuqgJBsyflpgHhW5z6hRGL6YbG1bU9ue31APjZmXGY7jBP2W7vOauLOm6cM
 YnA+eymBJEvC/58/XeV7AtUC2bAAAAA==
X-Change-ID: 20251028-bindings-pmic-glink-glymur-72148fafcdfd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=k/z37DpcmFOOlEmrGToe3bvh5n9Z4BjEymbUZ1wVg7w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpAMxaX/bi1pFIA5wKR27Jwg++6l+0cmBc1+YrL
 AlRZVJJNp6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQDMWgAKCRAbX0TJAJUV
 VgkqEAC73Vm3QgC4pcoDJ+OgxmAZBZQ+Rk6Y7ZbOScKYQ3OsITp8fEDqSqNXoCJpwkcXxZNqtti
 iXws0ZXte1rzvJ7PQrS/QdhrAH4WxFiIkKNlw4XG2bz7+3ZVYxEsiolzWEunXPnBkpEHpPHAjw3
 Z2pm2iFFCxvA0nNRki/jljZFlOKF0C2/bfDDLlfM828J90Vf/Z0s4+Z7SUJGnXsSbJT4UA4T6Rr
 DWtVk1LEusmwcoee3rFftsSOEzI7YMCI0cyni/eTUuGRzYPd9uL2jfNk11+t4vwiV/a5wMCD78w
 e91rC+wyW357aesrx7Ecn37bseYLZZIJBR7K3pNvhivuqrDudAn8JujhzdP/naJ/yzGDHt7dgTo
 qNTbsjcjL4xLZsIf6+Ypk+0nM5UZuB6L3IZkOwe3NsqL4sUSmMBoMDSXChmz432PIjuKMTxITGt
 1JzSeq7IXYM26VNNuc6H5jZeEEI+Zz86YDxp4Z2WR1hmCvmwbhOiHSTs/KNqIdr0WncYQwt3+XV
 hy722JPMkjAtKplSYxiqG4BMQm1jrMQZyygoQwODElTt8CNpDAgzk5oyj4NoaW+xFvs0PzsdSnb
 2nFoD9hZ75gZsDMimOUQ3GNG8t89yRVl9cxbPqNSsc0Xa3UL+iq3NuUHlB5npiNkE3y/JBodPhL
 XHxzMrPcheNksyg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the Glymur compatible used to describe the pmic glink on
this SoC.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 7085bf88afabaa3dd9d0387ec0c800019850a60c..fa7704fdb9eacb712653cc21fe5f25f2435d7847 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -37,6 +37,7 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,glymur-pmic-glink
               - qcom,milos-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink

---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-bindings-pmic-glink-glymur-72148fafcdfd

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


