Return-Path: <linux-arm-msm+bounces-25029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836B392544C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE93F1C23768
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 07:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08C412FB2B;
	Wed,  3 Jul 2024 07:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FLdAN1GZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83DC2A1BB
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719990068; cv=none; b=mh4zMIPk7Vch8+6QOPE2/9DSAhwpSdjV+wU9Kz9qIEIzYENvE4CyOQ8rdJpMFUV45wkts1ythBkIKzZLoiP4j8VEQBwtaWT9w72wTP/Xtsr9LlHbiRk1qscUkJctMlWPw5Cg+OxeNNNQFSWJA/noJr+OcV4dtMh8RWiaBX0FlHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719990068; c=relaxed/simple;
	bh=f8D+Z2J34BSelEP0cWYV2FJmD9VvHWhRwMSvzZIllKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XMCTeRgNfT9IVAmaXXJM8BMxK2SRtr3+OkAzUAYiQFtsGb23kYFMSft/5+1mkEk7QcgJNOAfuGP6LoZt7iM88XN/kWf49aUAFAZyW8PnFmGN1cPj00ZYajz6LSYkIh8FepQmb2K2ES5MMAbD/2h7dQAy0+EQ7LuBtQV5AGqueiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FLdAN1GZ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-58b3fee65d8so2205202a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 00:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1719990065; x=1720594865; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+vwPCi5kZraK7fZ9+mWsGUSaE4NoFQJJBy15JehrMQY=;
        b=FLdAN1GZqccAhEDnoeYQHzuBTcicPagpHC0GiCkoRtdgE9rWl7z5djmOpdjB7QmZAf
         97MWkRlWwD2mydGhdK+/YnlyaFUvteegsxQQ2bLV1kidkUa7jPvbdMlFkYSIEog1j7QL
         AGEHROUV5G4IkswrrHZKMn7EgMHr8SgvJMZrxL/y7ays/u20S0cXk4HhTD2tuf4KjnGs
         SRNDt+AKeJHFKUIJxzLc22deMBToVLSGhMvrP1XUYz116MGYvX6bzktkOHbuVF3Fm0Hs
         cdx+n7LuGk6FuZQnv8mmXtH6/QMNC8wiQjzwFoRUQeSqjx2E+Kc4djsL1Kc4ZkcwOZke
         oSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719990065; x=1720594865;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vwPCi5kZraK7fZ9+mWsGUSaE4NoFQJJBy15JehrMQY=;
        b=RAcRhQaZPTE7CPoevli1TkcIOww1ITd8VAFzFUmzulFHc5VUsZtlJUetyjLLm7T71j
         SNtuT6nlTTjXLYgG8GgDfN0n6pjz+C1dnXP3a8txqY0j5KX7gBjCf8/f8ceWSfiqR27t
         G3dWzddq41V0prPp6kN9TFiX1VDN+5aNwihw//CEMbn6Iwd59Ygv87PKo7np0NxFaCfu
         zm5fFmxZx3d8qbXU1H6qk8DlFkxcJZRahBwGT7dmdObpf5LVp/R0nQvNd7zcQFxsb5Sj
         vyjOGUto3pcidPq55EIhsDwEk2EaLzt3DFyLRfMvBqRa6CJ/G66xxckbsmA0GihWhV3b
         Ux7A==
X-Forwarded-Encrypted: i=1; AJvYcCWxss4RR+UVNCe099w3Hz3DCa0FvSLKLxzkZcXS9UhlPqJCI4CkArC/qjqwRlkGXUcvGB+bwF7E+fz7g7hWp8TBszMZq2wtPz5PogU4RQ==
X-Gm-Message-State: AOJu0YwlkaEyA5g1e/A6SvkDagFF2gMRGQtgumBmBxj0qq8U5YOWQVre
	Gyqgl+TcXAlEPBLM+A1vdaCpzHxZdZkzZDlC2noKR7kwzJXQRiEXLSouR470Bg4=
X-Google-Smtp-Source: AGHT+IF+hNjOQ8pgB+LTiDmZIsDCqWlOmR/DaW18R//nPEntEnY4XXHH2GvdOuB2r4getznFqqVE+A==
X-Received: by 2002:a05:6402:13c5:b0:57c:c171:2fb4 with SMTP id 4fb4d7f45d1cf-587a0635d6cmr7965226a12.30.1719990064937;
        Wed, 03 Jul 2024 00:01:04 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58612c8371dsm6632834a12.9.2024.07.03.00.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 00:01:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 03 Jul 2024 09:01:03 +0200
Subject: [PATCH] soc: qcom: socinfo: Add PM6350 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-socinfo-pm6350-v1-1-e12369af3ed6@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAC73hGYC/x3MQQqAIBBA0avErBMmLYWuEi1qHGsWaShEEN09a
 fkW/z9QOAsXGJsHMl9SJMWKrm2A9iVurMRXg0bdo0OjSiKJIanzsGZARdpR8KhptRZqdGYOcv/
 DaX7fD16LoKBgAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.0

Add the ID for the PM6350 PMIC found on e.g. SM7225 Fairphone 4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index beb23e292323..d7359a235e3c 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -116,6 +116,7 @@ static const char *const pmic_models[] = {
 	[50] = "PM8350B",
 	[51] = "PMR735A",
 	[52] = "PMR735B",
+	[54] = "PM6350",
 	[55] = "PM4125",
 	[58] = "PM8450",
 	[65] = "PM8010",

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-socinfo-pm6350-c27cfd02cb66

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


