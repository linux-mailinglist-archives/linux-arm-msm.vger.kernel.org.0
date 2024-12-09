Return-Path: <linux-arm-msm+bounces-41108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD239E98CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8E711883725
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 14:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAD51B0420;
	Mon,  9 Dec 2024 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FkT8paB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD9F1B042E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 14:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754489; cv=none; b=irRk/spx2cN/PbqZvOi5KbeYk7Hqlf1rcB0s7hyncWQtoyGD9m3cu971N6TrXnB+l/tS2LSOgOgaOBVdiN8yzojbHBdre8xmrzKOSHP0fmiPPqtxMHKZX01rG07uGiYYijT7RgReE8B/EmItNFKVkDsu2Vu5czyiAJHxOenQeY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754489; c=relaxed/simple;
	bh=5RyUOr3QrW/O4bHLJREt2wIOvq1gkSc98ga8ZwgfQQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NQAg0/ahZvjUEIfuHVvDXOMRVIpbF1OnAYP3ZY/jbJGE1tu8YXeYq++Lw01AI1BJp0sadF3Us/SJGgwoFTsv7SOFvIMPLrNynw/CgLn7QVs4pIy5AVnqiwOTYcef2QuASSxK7QRGAUGZqym8JosBOgCGi50yh3wBQTM2cAFlbC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FkT8paB5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d0bf4ec53fso697755a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 06:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733754486; x=1734359286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9z3NSZ89oX+1aCU37jpGmvgiUM/f0IkRVAkdzRLUng=;
        b=FkT8paB5WxO5gTDPCQtGFrDTQ+cw2TvnDhH8xn48oNpVTBo1Aunwpa3us079/fz/+c
         RFZM91oed/43wibHOHRa6AD/EYRVaBS1lzeswf6H4k43/W1ihLzFcspZLYLKxF+B9UX4
         16u1+8FlQ7I+cbqJkzIwvv2RP4UJz2fDY+U5jaFgoGMS0e+nMWoGCzpQL4N3XbPK/Mze
         xq83xgo749O/p1jTfclKRaN9/2Iw3w/YJIxSW5uZW/8zyxK+o3iI+M+BXKC6fct5cDS2
         AxAuvWAYMpXMIIGtUt1pniN6QZAla7h8Je/T6r1Gj1l41YXTe01quNu+f+ACObQ4JCkJ
         A1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754486; x=1734359286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9z3NSZ89oX+1aCU37jpGmvgiUM/f0IkRVAkdzRLUng=;
        b=EWWX5o/cmRnLSwgaFWVnwdre0Efaa1yC1Qju77TfVQC65UNR0UKOEJtQ/47zZytAmS
         eDsWBWnuowAcMRQ/CcLNs5nF9FOJxAZkS3k0Mx8tBQrLzVj+Fl1FrWndwEUQpgKJX3HX
         7hxgFke01NPvuWe5K3DN39Xv01mvS8QEhUj9MVgGmA/voOgqUZxfvYMMbcqmoX0qNBiK
         /+7k93p+IAYvmmC+ombbGezG1NiuRok3XTbXR3/UFguE38nTesdaLVYMamKaHhruSgWu
         3ZJuqIXt0AkxT6Ti8ZKNK8ycju6mDD8sIuNu0/uU+/9VCMprNDXc9hQQh7Vxa188nVAP
         QXSg==
X-Gm-Message-State: AOJu0Yxzu56is09CaJTqvPOA8LJebcPcnhqfK/GMh+Enypc8Dh92AGs7
	VeRcuC1KpgYDjvgz0nLRMu87G/2BMs2okiD6CPlkJ5XzZBv01gRVW6RGnBJn2CUt1l0rQJcqcaA
	H
X-Gm-Gg: ASbGncs0IL1uuqzlY/EgPDhOa9ZcphKdio07TPgxwGD7GoV0XrUeZEK8h4kzgmIviXg
	AAT0gBQecCx/P4yNX42xawUuqRy6LALD/CvaKQgKUDLmnONisS1115LOLKBT8fvCBD/1SqjWJcy
	pLG9oAB0pYl3TBiYb1Jek1FQREsoYOzJCk+1CqE7rls32xL7JlmFS5/Nx92+Ef38iF99ulHRIsa
	pNbqOU5e1gmqNChsxQtirKpjUDkQ+AtVT/rDYkkCFPUNnAi4Q2QG4eXnZtDA/NEGA==
X-Google-Smtp-Source: AGHT+IFIgdJJhInSnlqruzVbSu59rrKt4qd7stV49lWAt/BO7iNwOqoQYHrJ2/vjw5/XCTccLzxlYg==
X-Received: by 2002:a05:6402:254b:b0:5d2:d72a:77f2 with SMTP id 4fb4d7f45d1cf-5d3be78e16dmr4723573a12.7.1733754485993;
        Mon, 09 Dec 2024 06:28:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3eb109bc9sm2887141a12.42.2024.12.09.06.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:28:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 15:27:54 +0100
Subject: [PATCH v2 1/6] firmware: qcom: scm: Fix missing read barrier in
 qcom_scm_is_available()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-1-9061013c8d92@linaro.org>
References: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
In-Reply-To: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Kuldeep Singh <quic_kuldsing@quicinc.com>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, 
 Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5RyUOr3QrW/O4bHLJREt2wIOvq1gkSc98ga8ZwgfQQM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVv5t2ppbxpCTSeg/Ip6ddBRRIP72FLeLtADYv
 bKf/Eruxw6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1b+bQAKCRDBN2bmhouD
 1xr0D/4psbFJW3Y+ZvRr+dJ/9Kv2CD5E71832DYsB/5J9nwnFqX5pJUSN6brjyaAwpAFHrHXUDy
 N6Scan0veYW/WmKEriULU8B0e6t9RMCPp14ySZpw9n36vVdlgNxXH5yzIhxTYVDLWQ47tZAjDCG
 0dI8+FaZJ3xoYFvoyHQvPKPlaQGHdcsNObvR761iSzvNO9CDfwxcuaaHkifi70QA0Hsii3s7/AR
 yBvQ9HNN6b51gDuvKw4Qp/5YfQSNsfODPtaGsfGMQk4LC9OQLthVq1KUlHn+tDbwgiJzEPMYOdg
 ecYUM4ekhryP8HSMPb/SxaoSWnQzilY6Of9lIGcE+JVLtGsL7Shg0WYJxZAz7E6c1sQpnUlXH27
 AhSE+mDmNO9EhnqOYDLfagJx5SG6eMjL4OllUwZjhHdbO5K6vcHRI7dm0QzhH5c0jdNrWAYX/Mj
 JIWppBCZxZ34v72E/SlR32N9b8dlvznV+LNHwDyIbhzJaqRum1r2ipEqkmCxFgYxfPvVPh2wl6o
 ibtg4z1ukAgmmC3+rY6OH0Czz8AnNJyLG/TGTJ8Zv5/SQQXqID7wIOKEtwPtsY26WtW0mghbz0N
 riHgoeNc+Shlj/RnrqI7awlxHLdeV3KPnIiL1UXYEyIEGpmY4hrL0d7+RWIqF/SXHCsxy55Sh2H
 lGpJwmtIfqd6BNg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit 2e4955167ec5 ("firmware: qcom: scm: Fix __scm and waitq
completion variable initialization") introduced a write barrier in probe
function to store global '__scm' variable.  It also claimed that it
added a read barrier, because as we all known barriers are paired (see
memory-barriers.txt: "Note that write barriers should normally be paired
with read or address-dependency barriers"), however it did not really
add it.

The offending commit used READ_ONCE() to access '__scm' global which is
not a barrier.

The barrier is needed so the store to '__scm' will be properly visible.
This is most likely not fatal in current driver design, because missing
read barrier would mean qcom_scm_is_available() callers will access old
value, NULL.  Driver does not support unbinding and does not correctly
handle probe failures, thus there is no risk of stale or old pointer in
'__scm' variable.

However for code correctness, readability and to be sure that we did not
mess up something in this tricky topic of SMP barriers, add a read
barrier for accessing '__scm'.  Change also comment from useless/obvious
what does barrier do, to what is expected: which other parts of the code
are involved here.

Fixes: 2e4955167ec5 ("firmware: qcom: scm: Fix __scm and waitq completion variable initialization")
Cc: stable@vger.kernel.org
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 72bf87ddcd969834609cda2aa915b67505e93943..246d672e8f7f0e2a326a03a5af40cd434a665e67 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1867,7 +1867,8 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
  */
 bool qcom_scm_is_available(void)
 {
-	return !!READ_ONCE(__scm);
+	/* Paired with smp_store_release() in qcom_scm_probe */
+	return !!smp_load_acquire(&__scm);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_is_available);
 
@@ -2024,7 +2025,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Let all above stores be available after this */
+	/* Paired with smp_load_acquire() in qcom_scm_is_available(). */
 	smp_store_release(&__scm, scm);
 
 	irq = platform_get_irq_optional(pdev, 0);

-- 
2.43.0


