Return-Path: <linux-arm-msm+bounces-27345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03E9403E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 03:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29A8228303F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 01:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD74CA6B;
	Tue, 30 Jul 2024 01:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlnENwmH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60708C1F;
	Tue, 30 Jul 2024 01:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722303534; cv=none; b=X3mf0P21o5FAFrURA2vTtlf/5uibsuLKUNHU1SFg4cLLBgIcobdauCYV2ekTUv7uBulQceEhdjERrMbyyy1iWcW6OyMfT9Er6cv5+C4cU+yUNF8rpaXOKjYnlB78vqyx3Xq4c8vJ0kZ3qUHnFWIdIpjgYVh/WpCEoCpcpefc/PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722303534; c=relaxed/simple;
	bh=dduTlr6uUWI8tNY2VGnFDDzuS6zEuw0++81bTrldRmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XtLjGZwtw/xpSrihradqeIUEZinquJ9JuYDUwpkCWc89X6IyKxBh+z7uAh8QPLTrbu+3andrO69ssA7oUoMCIQl/87MpOpUvVq/wKaAnGuf7UahW2e6r+JH6F5Wqt0Bsb4YNOteHYXkrrIEQ/24aBERvGtu7/byVaXFxevVHjmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlnENwmH; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6b7acf213a3so20841476d6.1;
        Mon, 29 Jul 2024 18:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722303532; x=1722908332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5V8v6mJVu45H98XTICckmU1hS1yE/o0aFhw7aKg4Kw=;
        b=FlnENwmHjuugozaxkTHl3ryrcZ8XTuQBkXLZpAztlEz3SXY3Cd3qXuelOycTuR1bnU
         COn6JFRHH3WFOtJMWoraoYlXSm0MpUInfXlRlfyF1qRl0cF7grQ7Ua2dBufefpP9H4MO
         XYwy4A84O0v7CgtRPDCgS5v9m1/4kKuK0t9NsO/+gUWnp3GrweduyeCrW6XC+4PQBkzA
         AMIQAPkIkFcxJk3NngagUjaTpT5n97/NyYt/VH38lWm1LDKTtIw6l+C7nu9DYC6pIot8
         +FCEGVDThkLmSUw2nUEOlS37+8+Rfh1Ja0xMcVbQx37ium6bFli4INKNW5/qzKA003jc
         8Whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722303532; x=1722908332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5V8v6mJVu45H98XTICckmU1hS1yE/o0aFhw7aKg4Kw=;
        b=CGb6Lwpfp5HW7eXHN0EXEsZb3KMv8RlCgWRfbj50ywyzNByhjUsL5QdrG7ZeO/tw46
         FSxHDfHKq7xoMo5mYO/4q2HbFvlBhmnYB6vw5bxYvLCX+/xJOl9AcvQQ8ADnybyo5Cb6
         sWTyeOKZmINjEEPrtJIhR8Y5cmv0FQNXX89uZZLfmc1hzW6gwTQ1AubxHRQRX0gYOMoO
         tZUmWZFKH+lWFHr2Qt4DTjyLRe0xnk2bW4OEdpAXsi38g3f+ariTa72dxWpjMFfa5M7P
         I1tOnqZaMbSx93JfWcPslys1OmfI9/vXMw4oZeZN4NqYMRFTWG+mvK96ypUMRqJhqb98
         DAkw==
X-Forwarded-Encrypted: i=1; AJvYcCUYddx+sxOBV1so1SngoFp3gzoo8gla5CvnUMNkXyYkpyhku1XuoxJWkOBBg6Hp6dQY/IviXYMZuTM71oZ3SeqTWeaaeB2DWx+sVW82UXqm3rnx/iJGBvMcqRKBm/93cVsIzQHLc8luSao=
X-Gm-Message-State: AOJu0Yxq0fcFiV19Jj5SuJLhA2TxbzQbgSgS1nt+ns3dnOYWbIPscTU8
	3+pLRzfxkO8XGIOqc7O7TA7Ngnru7RTJRhMpmZ44CBEH3vETBp57
X-Google-Smtp-Source: AGHT+IFAXnDbbOCYtDoXYpx9BApuVpqU8RCmPc/YjsBZVC5fX+KPk+EzHwB2giEEE4IPMKHBD+VtPg==
X-Received: by 2002:a05:6214:2501:b0:6bb:3f69:dd0b with SMTP id 6a1803df08f44-6bb55a1a621mr139961136d6.18.1722303531781;
        Mon, 29 Jul 2024 18:38:51 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb5bcffd18sm36115946d6.15.2024.07.29.18.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 18:38:51 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/4] dt-bindings: display/msm/gmu: Add SDM670 compatible
Date: Mon, 29 Jul 2024 21:38:46 -0400
Message-ID: <20240730013844.41951-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730013844.41951-6-mailingradian@gmail.com>
References: <20240730013844.41951-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Snapdragon 670 has a GMU. Add its compatible.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index b1bd372996d5..1c055ba64038 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -91,6 +91,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-615.0
               - qcom,adreno-gmu-618.0
               - qcom,adreno-gmu-630.2
     then:
-- 
2.45.2


