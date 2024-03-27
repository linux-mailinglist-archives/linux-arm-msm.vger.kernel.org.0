Return-Path: <linux-arm-msm+bounces-15337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F888D697
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 07:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E67921F2AE43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 06:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EC32577A;
	Wed, 27 Mar 2024 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IT0Myisn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A4431A83
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521474; cv=none; b=OjemHn9sBth/MLtmNVEfrYAZE6T6Bys2mUVE/3jgByk2Ua5iWOMmGmeB/hGdGOswtsM9GKPUpJxlCzd1l3vSIlSZwV5/TvP2f07eRewQr6zqSTfaHmaE7ROhhLq+hF1KezbCFMgr+E3nDdpfgeJlwXmDTuGfY7UILIisDBCpy+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521474; c=relaxed/simple;
	bh=rPfFrJBnAulSY0rHFnC89I3kUqU3f8YhptHrQUiyOjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QahEzbns6Q2VxDjx0DqyxfYSlniTl5RCyUCZuMc9+kkWl4/VNJy6qP4WXDjXkoIYvNdPIGltXTi57d2+YvXPHiFwh07e0Z29tRWrFJhR4srF6tx+b8kHxp2LH1exdI+HsprwB2uTOs4okUOyJ/oKiyYTzwC3Qwrg3JrIL/J6mec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IT0Myisn; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e6ce174d45so4778568b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 23:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711521472; x=1712126272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaoVf9eqjsot1BqIU97nmYIfRRMIaK539UE6et7+tDo=;
        b=IT0MyisnLu4Th6GpX55SDgnroU7masedlLrvG08ZOL+scjcNIkfgk5aE/tD8gW9Zg7
         h+YZJGrJGTaA1EBx/iCh+Vd9y98qLGrmzPJ/SoKUnzmxQpVCgd62QvFQD96j6Z8m77bA
         7gWnkf5msU+0xxeTmogfa9gNrwU/ToQedEzrhIPMBWdg34k5/Lyw07PJAfgJL3T5zaOk
         0qYLEn/txe5NWG1DBkX9c00W8nEDgrOxcj0SncobiY9mcs/UwEAUtn02XGTt1aIJeSao
         1bfuePGCXiyem6KA6+yPLt0JGst4ctb+sf39c3U/i4DXaUqwvuqsRWcO539Z09Lqs2On
         Gr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521472; x=1712126272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaoVf9eqjsot1BqIU97nmYIfRRMIaK539UE6et7+tDo=;
        b=nwwqT2DJ1hs0dKj5D+xd17mFjJlyuByz/h3jvgP6s28LstO8lCSm5wk5IFLYOgyc23
         rGU0EfDSxfO8QLEF3N7u/oL3u+twGmt7aPtJEwY9/TOYDpQQiJqo0iKnP4e/FS2sUJEx
         KHMnkByTBEjKg0udWtDuYjfeR2X+ZsHIHs5tboW4AdO8v8aofCuMNskA73oq4v3n9FeK
         XS498mix//VCjGHL/nsZkoC5B4eS6an59+nD+mflfo9nUYflkpKsKaaskEkHqRYEuAF9
         KGlpCS689BZJBIBLROX3g0+sjVew5R350gyDVX0vDRExzWZEkq6VJ6Gy5THYzPtvIlMN
         ULnA==
X-Gm-Message-State: AOJu0YzPoSZ8hs9P0yUonKEQyo9+IkK++F53fBy4PqEbM/xwVdjRCwpS
	7KvYQI1xysm+eMsDqgzBbzTXWJbMicjWWh7OkB2Rq0E1PZJmOhrLXGyqyWX5J59pfEh3ihFpssp
	h
X-Google-Smtp-Source: AGHT+IGMuZtHvazZJBQcFvWTWdLA5CF2Rtu8zNn8wDCz0Gyn60Y05qjs1srXfeJjghEVBNqAlY80gA==
X-Received: by 2002:a05:6a20:bb1f:b0:1a3:685f:9f48 with SMTP id fc31-20020a056a20bb1f00b001a3685f9f48mr259413pzb.30.1711521472055;
        Tue, 26 Mar 2024 23:37:52 -0700 (PDT)
Received: from sumit-X1.. ([223.178.208.127])
        by smtp.gmail.com with ESMTPSA id qd5-20020a17090b3cc500b002a02f8d350fsm772765pjb.53.2024.03.26.23.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:37:51 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	stephan@gerhold.net,
	caleb.connolly@linaro.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org,
	laetitia.mariottini@se.com,
	pascal.eberhard@se.com,
	abdou.saker@se.com,
	jimmy.lalande@se.com,
	benjamin.missey@non.se.com,
	daniel.thompson@linaro.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add Schneider Electric
Date: Wed, 27 Mar 2024 12:07:32 +0530
Message-Id: <20240327063734.3236117-2-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327063734.3236117-1-sumit.garg@linaro.org>
References: <20240327063734.3236117-1-sumit.garg@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Schneider Electric (https://www.se.com/).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1a0dc04f1db4..4ef38573e411 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1211,6 +1211,8 @@ patternProperties:
     description: Smart Battery System
   "^schindler,.*":
     description: Schindler
+  "^schneider,.*":
+    description: Schneider Electric
   "^seagate,.*":
     description: Seagate Technology PLC
   "^seeed,.*":
-- 
2.34.1


