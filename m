Return-Path: <linux-arm-msm+bounces-32027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E236497CCCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 19:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAAD2284106
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 17:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402271A2564;
	Thu, 19 Sep 2024 17:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ddomzj3B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896FD1A2547;
	Thu, 19 Sep 2024 17:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726765261; cv=none; b=kcFz7GuXppwHYoZ32lVSitAP6jQ8HqWIQ8KTN0O5JDdWwm4td60fdVn8EllsWrEyu4jd/i43Biatep+lFKyF6ZGvaFtLEoS/X28kNvIwXOropYkivQPKVisxvSLiB5GgFgFcFWCm1DsN/0m0MCp3vZQD6PcmlJ6f/owRWK57ElE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726765261; c=relaxed/simple;
	bh=pwYSFK8CNwkivKxIA4vjEVquKLP6QGlBai8mnTcEbfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNQbRLugffsUugfjBvvUpGQafbvJFhwhwjzJgmU4zi/RnQbeKgnXUp18PzyBU2iVM76X3aTS/B68cm87Rg0Yuh8877N63V9qSInaQIDpmbmFR/e1ITNpZqVqQUvjGJMs1VNYcqQRMj6jWEM8Zw/hJ80etUGv0UwGlHUaib04Mig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ddomzj3B; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3780c8d689aso709824f8f.0;
        Thu, 19 Sep 2024 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726765258; x=1727370058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02z3BueeEMQVvMcXxvrC8DgCvw6rPVfONTZ3zehPzWw=;
        b=Ddomzj3BipBply7kTkJURl7Z/JhtlMXTq22A+E03n3r5uHOw4MHIr82hcsvOfdQ+28
         qGmw3+aqu8x8BzJYakGyGZHYJCmrhaoaWXvgVkh+vfkHLsfegOKZUNkptyoW8xKLLQLq
         WWVFBH9WjMbXnkPhTyAZUeZRLx0Bth23W5oxo6zY+5ZiwlGTP+sPPdcU/xmjukwbyQPr
         zLc534n0bQwcj6EPrdSTsv4T69qdKEr7uhzhd+xXW+XPb2U9a0aiWG977+wt2/KqmTJ6
         Vy28j+HNqbUFI46DYEoRFp+R2wFQe/ARYIbJBXIyYPxgUd3IPhrVst4Ku8ZiFGwj7O5o
         7ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726765258; x=1727370058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02z3BueeEMQVvMcXxvrC8DgCvw6rPVfONTZ3zehPzWw=;
        b=cjOe5xsLh+zaTzLmr1+CZ8xtZ2Kad84hBOsZoPT/YqPfKH4kFKKEnyH9SpdvwBrk+o
         1N/RytQYxgtc+vaTbMMrzpeVhIK63ZDydPVk67jYeSLflSU0wUXZC2++oTUvMcq4uHug
         R4QyseqWYKsQ3cXiS9AptJnZps4s11DlH1FTcbiQktFBZ3YouJW7wkJyg4R1+cxP2epm
         m+0MxDRkXpnw2iTxz8d4RecC3Tzqu8y3Br1rc3/O/QLa8LO67EvMTJ32HvrldgWtXrLI
         D2WOyT/g0scN+vazAEf0bkj+9Y+9Svh+NaQmQDQaUL2ZAYDGI830QQQOgNgHSY9IhMtc
         z2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCV67rZVwBq/4vPRpHVH5qfWyRD8RCETwusWA2/QfG2Q44/aSuR3EJAWLW9eAFntsIkeHHysOiPYeCA/@vger.kernel.org, AJvYcCVL2Y7LbWR0OiQmDZecOY1DeoZmxeMtz7ftOiey4QO+YbtDnAsEI3XfsYzk71bZXxVhwkKYhS2Izs0Fpwr/NA==@vger.kernel.org, AJvYcCVc7hVdh+XUqWRoYDEU6KrSAmGf6xJvgDK+UorD6/i+cpIhAFJ295YNC4Pt0Hu+G6zAPqhKdbORNZPSCnOI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6oop/E7YjvmUcLq81Sl/1DWiLfsbP1kAhck2VxZv6W28ic/7U
	xHUY3mS4vEpePsLAEIRcFggJWlLvkWTCoBHOHEfdDWGmAry9kH0=
X-Google-Smtp-Source: AGHT+IGk2XhS6C+z5uaMnKZE8Rpzgl5YYDuEp82yzizTILoZdMffKArFlUE9PUk2DyZWaSSyOZ/djQ==
X-Received: by 2002:a5d:4811:0:b0:374:b9a7:5ed6 with SMTP id ffacd0b85a97d-378c2d064c2mr16823672f8f.22.1726765257373;
        Thu, 19 Sep 2024 10:00:57 -0700 (PDT)
Received: from localhost.localdomain (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780dcf1sm15469282f8f.114.2024.09.19.10.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 10:00:57 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: qcom: Add Dell XPS 13 9345
Date: Thu, 19 Sep 2024 18:59:32 +0200
Message-ID: <20240919170018.13672-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240919170018.13672-1-alex.vinarskis@gmail.com>
References: <20240919170018.13672-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E80100-based Dell XPS laptop.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..a1ae01a9d581 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1058,6 +1058,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15
+              - dell,tributo-13
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15
-- 
2.43.0


