Return-Path: <linux-arm-msm+bounces-7051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F27B682B378
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 17:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93427B217A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 16:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8FA51C48;
	Thu, 11 Jan 2024 16:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DMeq0Be5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD2151007
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 16:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e6296635cso3888655e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 08:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704992335; x=1705597135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZlzI3ACs2ov6qeeNpcgEJ9I9uvuej4mLyFQ8uCjxoI=;
        b=DMeq0Be55dsovRrBqZDRDmqBKExR0fp2DZ7yDClDY8YhFoLfchl4hbFdwgEc2CiJ2g
         icb+dbcy4Anm1sYxpcnRaCkweoeyev/AuTIkwCtp6P8noGvFPYwaNCF+4qpipWzXeucP
         yC65eghFepqjEtBkDKfrq2UsnWgmkhSTyapjFkVnugldF5y/JUuhvW6QZb4zQzbz6NAL
         visL3GB7mS1bQZXwyFMeGQEo4dwyZbPqSV6FF0PCZ5Q34O89ICxtoLjiKsaWGJ1FT2YG
         OC0zR9ptgo+zdU5bVZjfBiBDKSkKcndXaHMozdG91Tmhs35M4l9yB1/5aem/hsAzTxJd
         WH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704992335; x=1705597135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZlzI3ACs2ov6qeeNpcgEJ9I9uvuej4mLyFQ8uCjxoI=;
        b=ZxvZ3P+22DDWpfKVPfSeeCFFbxj5OlTuZoiQ48hkQJix/CVQRvqOsnz/B17xvG8C/f
         2eGxfhIvRUgMmBwJP0alXWVqU29B9vMffvMzplxgeCOUpHdI9D8mTBvwlOtq3JwazaG4
         F2AXCMeEEw0fMLucSxAygVbx7XI/Qvo3NZEjeA8/5uOIEF71RyCeyI3t3Xy2lpA8B+Ni
         rGaDzXqMNbavgqJ+EK37Exegq4bq+FzCna6et0rsFvIOp7IcPiV74zxIXg5YuBBY82Vr
         anJyH87I27yj6tSeV23zmeap/32fdH6uCTnLP8NPJeUARZmYmSuRtXy6N7gx90IMKi7R
         hX7Q==
X-Gm-Message-State: AOJu0YwstbK3VsiLahSIQv0VNycFqTioL7FOy61+082WuQ8icZVMPajV
	ZcsEWPXzNkzV2HkiyYJ6he8iife5wG0RRRVX8fgrnfoeCEQmhQ==
X-Google-Smtp-Source: AGHT+IH+ef4PA+mJ0XYhf4QFfMG0ELcjZTdT0kAhoDvLGpXzHGZBfFo0ScZdhfRBq9k3ag6w8UnUhg==
X-Received: by 2002:a05:600c:4a15:b0:40e:5f64:a6a3 with SMTP id c21-20020a05600c4a1500b0040e5f64a6a3mr55165wmp.173.1704992335215;
        Thu, 11 Jan 2024 08:58:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id iv17-20020a05600c549100b0040e5034d8e0sm6501354wmb.43.2024.01.11.08.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:58:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 11 Jan 2024 17:58:50 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650-mtp: add gpio74 as reserved
 gpio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240111-topic-sm8650-upstream-qrd-fix-gpio-reserved-v1-2-fad39b4c5def@linaro.org>
References: <20240111-topic-sm8650-upstream-qrd-fix-gpio-reserved-v1-0-fad39b4c5def@linaro.org>
In-Reply-To: <20240111-topic-sm8650-upstream-qrd-fix-gpio-reserved-v1-0-fad39b4c5def@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IpHVsSLrzrFlQj9WcvV66G0BAS5oNYDE30snnElffk8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBloB5MW98u6vRkxaZLZQz5AAcrNMzWEDZW7c79gdjA
 wTFDLvuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZaAeTAAKCRB33NvayMhJ0XgFD/
 0TFA2QMS+7gPlp+tw6YTcWTxd1fzEFUJ6GDws3ScuCm0WkAnkSoSxCLFO14nPO6eclE+ENltpLk4yW
 4NBMzYz6YWS8KZ5GS3+O+daaxH6iD9iCl9RnimiAPTgGEY8GfzmYY6WjT64nwkFszFNjMIG2hDiqBu
 7AihSYs1BxPtA/Mt9yCA+k1NwpBIkZikD5kJ8KZVa1wByeWcLSr/QAZLttXYqsA2atw4n+C7gLhcE8
 gPtBusiXa1Ab48oeXXF4dKoU6/wO2HD+Pn98xZ4H3y8Lu+xvcVpo0Rrlc0sX+FSkO108nx3by7fHpd
 J405JM9gMuRBCWffyqPcIk/6z3EFqJXVwkqSoBUXSUC/ubJeOFJ9dh0HEFEOLcoEphQIGBijJNWLlp
 XJ+RpH5r7LBwv8lOKHHba/gvqhQtuLNV7xSNUWsUaakRJzB/Po8sFF7oQidXf1Ke5cL1+zLtz66mRB
 N4J7uLTkqlsvw3KDYdL6AHxOiLYSxwgJQ+LNzfm2iv6+GSLLGzPJkU0G504q04UNlil6OjDgulbCr/
 SztmioN1GRD4lMy+PJU0mhBPvCphENGsaA/ckpRGFfofVh6fsQo9qzCtuCkNjrDbPEHmbfwDXebRqc
 sbKCoqWBoT9dWWPyqNU3d0Xb9+RfwerU057du5JBDqZY6i3KBJKLubIsvlow==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The TLMM gpio74 is also used to communicate with the secure NFC
on-board module, some variants of the SM8650-MTP board requires
this GPIO to be dedicated to the secure firmware and set reserved
in order to successfully initialize the TLMM GPIOs from HLOS (Linux).
On the other boards this GPIO is unused so it's still safe to mark
the GPIO as reserved.

Fixes: 6fbdb3c1fac7 ("arm64: dts: qcom: sm8650: add initial SM8650 MTP dts")
Reported-by: Georgi Djakov <djakov@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 9d916edb1c73..be133a3d5cbe 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -622,7 +622,7 @@ right_spkr: speaker@0,1 {
 
 &tlmm {
 	/* Reserved I/Os for NFC */
-	gpio-reserved-ranges = <32 8>;
+	gpio-reserved-ranges = <32 8>, <74 1>;
 
 	disp0_reset_n_active: disp0-reset-n-active-state {
 		pins = "gpio133";

-- 
2.34.1


