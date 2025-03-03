Return-Path: <linux-arm-msm+bounces-50075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B89A4CE85
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 23:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD2B118811A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 22:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9818022FF4F;
	Mon,  3 Mar 2025 22:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjQyC9Rd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC02163A0
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041586; cv=none; b=pQrOXAtUiYuf5x0eTkZ8ZVAUoQmn9LhJ3cM584iuwgFfO3eCd7RVl35GDnBmKFld5ag9tSVLqQ3aYXI1mFQk5UU5+yEqZZesMkDsf6976a5qbgYFCRUsR8bavvKdHfpbbvWABn7bGhVnieNRNu1kWpOBR60Y52iGz6IcK0DOcuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041586; c=relaxed/simple;
	bh=F2BPRhnYI4/oT4PuPb232wQyV65ROpE/B2Cw23k2FBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tqThpTfRP+DaGzHu9ifm5fcq2L8EzuosYGB6Jm6dU6ESpf/iQrrHQw8EVA+r0djTyhx7aDCt92DmbGTvSg4qXW94Z71qwWDXuxiDmD2EMs8NpkeLXn1f+B4XiAu0GOkCRPgNp223WOHSE6d1PIoAFsgYTR4vJUs81U7BXpoqy+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjQyC9Rd; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5495fcb78easo362248e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 14:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741041583; x=1741646383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lU0Ty4Rv1+MR/rM5LdY8GrZthMLsgmGzQN5S3dlbH40=;
        b=bjQyC9RdSxyoL04+I/uKZLIr9CF8mbi/W931SFEwHf4FGbH/rmvQzw32Z69Oir6GGQ
         q1qgi08vN9uw+h/nDeLDeWNVFs276UXCZ2/RRv87Xbn/2Z41u0exrTRDmfBIaHFcS4GB
         dokNIMQzwBwyO5S8glAdfHwoqvJbrnJuUnLeBrCIZp94tA8wKp8eDa6LEvH4x/TbGyN9
         qG8UAjKx3lpBmEnEsqI+5Zz9evSbZPH32qbjJ3ZWEeT9J758nGnm6fbuHZnDgxAuTmWK
         CrRe/53s403fe2N5UY1JDtOqddC0gjEvJBUAMuugy76+J7HStsh8G/kv3zFakmjcr9+/
         RPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741041583; x=1741646383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lU0Ty4Rv1+MR/rM5LdY8GrZthMLsgmGzQN5S3dlbH40=;
        b=WhNWhKosrBEwLdSQ5tVbi7efpzrdzFrNmnbsMXCjU15f4PWb+5FEF8GxDKQ0EYxIkN
         o84nsEf00OEBHR1796NjonN2btxfwLNdsOTpHuSvEVnmC1+yf93nhe/aboZdpoMz+lUA
         OQfE+ugMye6ZyjfpCuIAc33qN97bQZ9b38sIwn8deyL12hE3CtDZOH1SmNhJEPnjjZZo
         +H2cWjs1b2fsl7B3Cq5s5XnDnTrI9hPRCIy8z7a4La1DZHtUgPu96L7e44Ut+yFPwnZN
         EPPLMQQyOFvCraAi0J+3rR6Cji14ujfP3TMqBbz+PAV8hfY8QxIY4cSORv3Mg4ULz07l
         CBAw==
X-Forwarded-Encrypted: i=1; AJvYcCVUUjlVS58ZFtOtSUfhA2PbhrGGraTprPK0qpEM8FxTQpFJfbUYv9y3WQCycfCPhDAv77+AJeEYAFehFMpj@vger.kernel.org
X-Gm-Message-State: AOJu0YzLeZm2FgPazauEk01FG/1U1isszblpydi0TKaBvafCf+OfCPbl
	x9JPTgCAdt//oUuMQngVmiggVwDgy9e2erBzG39SNWbrGpq7N6wEGcfgTnbduX8=
X-Gm-Gg: ASbGncul/awqMpU8RqQBsND7G+pTg5m3ndHXUBULxvaFLNboVRcTYo5CzoTf/Y5wYQy
	ZLQeeoB8Vkz3xRDifSFyn0uL36W4wA3OrP36Bi2sdJPfHbn9fJhy/MTil6K2f72S42xe4PLqISm
	MZyYTPy8B0dMRsetkX+9BMvoRSPqRgVpxG6VKGLqovSNqitqUW55daEoQuNaZ1Xnf06mXbBK+HS
	WISY2FQw9AyO1sn8Wsjh60IZhHvWiBFeCTf7zeg2qGvE9vIGl8ReqYkGnGjIRI+9Op9UzTmfiuo
	VSRci/Zmt1mcQnaNqlJGf+Sq2iJKsgyKkC0MGaEc14UzzxCTTLO+ifEZQX++kZz+4Qzd6xqaJ4L
	Z6+dYhrgTb3bHyU5JA/quLPORswBZnXkxWg==
X-Google-Smtp-Source: AGHT+IEoOUau6O8fOgldkkrcY4yXopOzPJmbwXvQjDy3D2WrJL1U4OpUpUuUU0DL/6OV3m1+vwjrdQ==
X-Received: by 2002:a05:6512:2383:b0:545:2338:f5f8 with SMTP id 2adb3069b0e04-549763c219amr41679e87.6.1741041582737;
        Mon, 03 Mar 2025 14:39:42 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54950e2d386sm1106706e87.17.2025.03.03.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:39:41 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: qcom: sm8450-camcc: Remove qcom,x1e80100-camcc leftover
Date: Tue,  4 Mar 2025 00:39:36 +0200
Message-ID: <20250303223936.1780441-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm x1e80100-camcc was moved to its own dt bindings description
file, however a small leftover was left, remove it.

Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index b88b6c9b399a..9e79f8fec437 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -64,7 +64,6 @@ allOf:
               - qcom,sc8280xp-camcc
               - qcom,sm8450-camcc
               - qcom,sm8550-camcc
-              - qcom,x1e80100-camcc
     then:
       required:
         - required-opps
-- 
2.43.0


