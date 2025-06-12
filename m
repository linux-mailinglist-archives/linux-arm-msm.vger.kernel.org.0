Return-Path: <linux-arm-msm+bounces-61026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAE8AD64F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 03:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81EA13ACD28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 01:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75F0770FE;
	Thu, 12 Jun 2025 01:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GwSfncPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201C13C8EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690943; cv=none; b=gfC1gmUvQm/2CAJj+8Xsu693yfdQtb1yLQktnTEYYESFMDcXJDva5aq58E0OA24FtlMVkTCEhYnCh7OKPwO+3d6+2KHBRVz0efx8WvuNAm8EIUSSzGIhsTKp2WzBML5Ism8qc5SqbGbp+tRqJsZQEk6lKwI+mr5bYijNQ71Vbz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690943; c=relaxed/simple;
	bh=cTiCvc3M5D7VQS/RPNZMBcUtmTqxxVJOMqLiNgpATFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8Hx9Zz/if8zw8YECZUydWUQaV6pNlMrN0ohYJkO5kfZMfjmf/8eNhjdgWlwUfH9bwEJBCLQUnDnqs9uj/STi8q7pgyl9aTTELxx5KRdUQxAVKkjIoKdKio2NzaqnjbdJmmm6p/adlitQDuGxyHFWpEcg5jFBUZ9fwe9oEPY4RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GwSfncPl; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32a6a607465so635461fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 18:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690938; x=1750295738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MytdYQLPTBH+sqpGAkv07c7VyYUNYJf1+SknQylnEzo=;
        b=GwSfncPllO4TAQ5uNloUvjMaA3mS2eg8DKsjxYl058P5/p6Im6ZIOtBGo9qCLJIINZ
         /3lT+zApHwg+O36n8d/YDvCWUE2eIZ0VktH52OOHGcxmmasUsRzRLvj4xpzNAeitZzgz
         jEnIH68sb7cvID4bvEodXljSCKumGbhIQLViQLDYXaywVGPzRzLPEEjvStcqSLMcGYnT
         OYHx9WW2DdsmFQkSV+DedYpqtJ6+eMbHUw+24HP30PR+m7eef2gsAVnElIPhlu4HA8Ey
         obus20cBLOVKd6uf/1oOa+vjivHYXJemiAgKBKjqMTOz5QgiZbgmYK6cnzUPfjwVyYTR
         y96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690938; x=1750295738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MytdYQLPTBH+sqpGAkv07c7VyYUNYJf1+SknQylnEzo=;
        b=CKtlJvgyHYWVzR0lR+JjrvD23eFCMLdum7oVPzDL/a+hsHpDdq/mMWGrJPgzxPMnxB
         DTwxbF0RX1zqrAfk3b90nLbo4/ZQlSkfcTkhF01z+s+t1KVn9satw8XlmM8ARgSFLCh3
         mkCB24tVmk3LOmctXQUeYXTtZeJWMWZWmVzLCTtcQu0wu/u5/MUAaSebaxTpwaxGqLuM
         fzaWDsIFTOBfRK06inq+bkVjYTVdu+igLXi8xg1LNsUT8qKB+2ONPXKRDli6UqqiVBPX
         lBlUvur3kwiFFrqIgTZstApMI0rgFz4LzstjpynUUaAIMZIHeX1tJ1oCygN6DVMJW+BC
         sTMw==
X-Forwarded-Encrypted: i=1; AJvYcCU00z/VjPNZ6bBoxBWuMXsCG1cwCSUP2sMG3HxP016flXO89e7bOAOSf3Dti55QV7cEoywnUT2wvoorIoCW@vger.kernel.org
X-Gm-Message-State: AOJu0YwoRPaUHpRV0CqFxE3zIC3zLZ/tgVSywwv2jTSei53aXcVCOtov
	3XLlmJZubkElwSq5G/+Udmj8LKD/0Ry0S8zZpJVjkWwt1E8mgsFU4UaNIKnk76jbsXg=
X-Gm-Gg: ASbGncsXSnbP2GvHpR99MQOwRvDeeKKqxjkHTpBhdcqHbofj/1BHV9xb1p81j7Kcmrj
	USiBaXsb97wCrpuWkGjTuE4hM6fClBcsYCTmdyXmDQymf4v1bBQ/XF7YapaWKvoUZkoZSRrWLHm
	vhS1jeNacEneXM8+kdW0G8A7sEOyEVmSoRGBY9aV6yoJnt4nr8p0Vyg+Igw4RCSx7F3A9JMCrw7
	yF0NjiREZjiapQXbRwbO0QAlw5uowYr4bSclr+ZYKe9Aj/1TKZW2YSMwvhzsxwc0uOLKznEEh9l
	2+0Vftn8ky5pceFlQQ5MGS15i1klt11hU0+tYGXUclOeHe1cxXaE6Utd6rtD2SHWIJqrHXEy88r
	IyOrczNWbYUZDoHiXvAyVG29qtZkvMahaaD5NQr/4RULEYCC2bzw=
X-Google-Smtp-Source: AGHT+IHoUp0rBCvyGGy7XmIPKelgT4UaUs9romhC0d9m5fZfQ3Q0Ot+dNcpGlYOwVncG8cNIP4xyaQ==
X-Received: by 2002:a05:6512:68f:b0:553:1fee:4aaa with SMTP id 2adb3069b0e04-5539c247d66mr533854e87.16.1749690938552;
        Wed, 11 Jun 2025 18:15:38 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:37 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 01/10] media: qcom: camss: remove never used camss_vfe_get()/camss_vfe_put()
Date: Thu, 12 Jun 2025 04:15:22 +0300
Message-ID: <20250612011531.2923701-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two intended to be helpers camss_vfe_get()/camss_vfe_put() got their
declarations in commit b1e6eef535df ("media: qcom: camss: Decouple VFE
from CSID"), but the correspondent functions haven't beed even added.

Remove the unused declarations.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 1d0f83e4a2c9..99831846ebb5 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -160,8 +160,6 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
-int camss_vfe_get(struct camss *camss, int id);
-void camss_vfe_put(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
-- 
2.49.0


