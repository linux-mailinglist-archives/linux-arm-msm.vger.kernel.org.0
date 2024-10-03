Return-Path: <linux-arm-msm+bounces-33052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC398F8A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B3412825A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 21:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FEF1C2323;
	Thu,  3 Oct 2024 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONhbxHgU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EBA1B85FB;
	Thu,  3 Oct 2024 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727989922; cv=none; b=vGPgVuCg0XGTpcI6AZdbkX/y/Ytg+Dt/RzwC5eOZDAEwUbi5nFq0Gl/bCO2RhzEnqmyGAQQmUvlt6mFUYOTtkQZz1aVs1/Pdjm7JKQXmI7X1CbRkIhqY2Dj0R5+M0B2Z9rzAOccpUCzDr0erBZEj+626NcD2N+xO7VHqa9rdmqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727989922; c=relaxed/simple;
	bh=L+h0TsQpZBBqEi2YnS5+t9pMrub5eeVnNVR/fmROIu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXWnw5zZRuLRtiPwtliAHZMVrH6F32mDFEsx5AxkO0sI+XzlmQ2DHv+pTdz17glKK1qsQd9STsxk8umMrdeVXumcuonGqg8llz6dXV+0vDhTmKvj3Bgrpmoz3AS/HPHm5/99kNVxebO0cVFiH19//IY/jBCs63MsX8wcH2I8N4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONhbxHgU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so18119505e9.3;
        Thu, 03 Oct 2024 14:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727989919; x=1728594719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3dyGd8jOGCc25+iIGW8ldJiOxQTWWWxIlVqU6NNh24=;
        b=ONhbxHgU51clDNuux65ASIFMDcM2VSeASyN7Dy3Ccrg45LSJdVoombEudmK8OMZbvc
         VX9GEfz444S2ntiycROZAsTtCHJC03r6YM5ooZ88gpp5a84chfozNaddJJFe0hJuMicX
         Z5Plj0prM9i1ST6olmV0V5H3bv/E6h3sGsyD+k2AM0snxh8TH2o3MafBa9pMM+x9DxeJ
         CraFMQdseCiuXYzunBe3STmjoAza2TuhdocsuH0NJNbx5i7+5c6OMbCZD6NFba0RhbTa
         ndujIR0k7Vx5tl4lpNHGWod/LVR/zvghp5HvKSzWRIaIIZ4arHqvUAj/KOmHBfM7DIlr
         AwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727989919; x=1728594719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3dyGd8jOGCc25+iIGW8ldJiOxQTWWWxIlVqU6NNh24=;
        b=Kdw276TT6AU1rBYp2OJEc3Rloen6BwESJ6ZLoYwA50DRCy+xM+FMJ4uJ0V8Ei1X1dQ
         A156b1JbVJKIvA32SGG53EuhJX1yKuuQajdX1yEwHkztfQOmfpdaYus7KjMRbXqJi0kU
         Uag0R5V8N2Kr5LjLH2JHn1EADSZ7921jeGo5wyMOcJMRpp4W6B9xJkAo1NRmVBXynm/I
         E9Ici5uTbGwNWtQsIxS14LfQKSjq1xZPHdkiZh2KhH5McHzToLYgUxVb3txIlckHeWLX
         m8oN6tg6Qne5JvQrdSkz3hxLUGZ67TMqNexefwYWhvO1/VlQlDgXZCB4i8imh0Xx9R0H
         GXPw==
X-Forwarded-Encrypted: i=1; AJvYcCUugUJunI+fwK1A7qLEBv3ZSKmQskesTszUBHe4qs4N7sb+EJHkSQkYl0Gl/Z6S/Iy8Pc9hqxdAQASA@vger.kernel.org, AJvYcCWSbtdZi77eJxxl3upUn6Reu+3a6J0SzvwGGEYZiFCoCCSp4YqaM2X2DfKkOmVBt6phHKjyLlh5y8oA53uk@vger.kernel.org, AJvYcCX5WGa9NRCqFHdxgaa19Se/Y1kceAGXf7XGW/KsEnkV3RfQFC3PnieBqschSVl5CxC6JGZe5goLqPVXhnVCew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Gne41c37P3SRkyCOkMkJC0aHIUaHh83qw5snLHxRmCUOyufZ
	fzwKFnv7/pfpiLhV4w7han24bMpwVYG8eOhij1Oj8tYbcmsB6KU=
X-Google-Smtp-Source: AGHT+IFAawxDQvTMmBboCqkWlbamTLJHr1jK4Ozg9858pDMLiZoePfeoFbZBVAwGHH07eLBI06XUhw==
X-Received: by 2002:a05:600c:5494:b0:42f:8229:a09e with SMTP id 5b1f17b1804b1-42f85aef6e2mr3033285e9.29.1727989918265;
        Thu, 03 Oct 2024 14:11:58 -0700 (PDT)
Received: from localhost.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082e6dfesm2002073f8f.117.2024.10.03.14.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:11:57 -0700 (PDT)
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
	robdclark@gmail.com,
	peterdekraker@umito.nl,
	Bryan.Kemp@dell.com,
	tudor.laurentiu.oss@gmail.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Dell XPS 13 9345
Date: Thu,  3 Oct 2024 23:10:07 +0200
Message-ID: <20241003211139.9296-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003211139.9296-1-alex.vinarskis@gmail.com>
References: <20241003211139.9296-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E80100-based Dell XPS 13 9345 laptop, platform
codenamed 'Tributo'/'Tributo R'.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..7c01fe30dabc 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1058,6 +1058,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15
+              - dell,xps13-9345
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15
-- 
2.43.0


