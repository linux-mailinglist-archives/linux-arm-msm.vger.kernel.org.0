Return-Path: <linux-arm-msm+bounces-44806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8930A0A50B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 18:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B51AC1685C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 17:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3741B0F00;
	Sat, 11 Jan 2025 17:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RlsBwICA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864751B0103
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 17:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736616214; cv=none; b=ibolBCw24+/hw93xLiLjNEvAjfn5Y+JGqwNiA1DvApJ2pgB7YoCBIlwOs0vNciNiQP6ZAccRMYeK/ui6iCYQ0RYZdEurCoFIVxFO9t3k4Ts6jWuxLSncSGBQR8UrZ5RVYBKX1hNc4uWnUS5vGXBktV1Zx4GE0CtI+5NEE/Dg9Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736616214; c=relaxed/simple;
	bh=V2p6jytTQKGiEmPQe29SqBxcakRMLi096kL+i7bFG3M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=BLt1Seq8xhy4tR5USIObBR5FwxWxhT3PkZa7uXiVm6LTar2k7YzdfCms+inoRr75u7Xz0H7EO55ivBijlZWccbPOjvH8jdFixh3gr/6FWXUEuQWjiVeEzEAwJPz+HoJtpw54/MKTaZV5dPmjiZ/IvMlTldSnezMSlT9ru40LPH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RlsBwICA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-387897fae5dso133233f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 09:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736616211; x=1737221011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmNQrzqje9KtCH6g1oIC4MoY0fv63GkJQiqDscYa1aY=;
        b=RlsBwICANNt0RxTn1Bl8dLz8KuuWFRlg2otwEAq3n5An1vJVTAR1aYAWCErZ+l3ApM
         2A/DfF+duLELoX55tHqJBOlVldBw9Y2eF9R8v99q8XIu1ohSv2TSQew2EFGMK/YxJjSd
         02aF8n5ZX2699lq7EaQ09aE26OxaPRGVujuLDY7miPOcTjDCIrti7Fp5/ljs7nWWgDu4
         ut46GduVpN67Hc9ZcURZV2h/WfY/TLVNOK9+h5HdLDQvNhKgQsXC7I0CVm9p3vYiKaQb
         sg6gj1vFDPMp7FHoNX3cdw6bUyKX9Ry6ieMxYTHWFYvxi4EMu5zZwxTH0Az+ctutadrW
         bWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736616211; x=1737221011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmNQrzqje9KtCH6g1oIC4MoY0fv63GkJQiqDscYa1aY=;
        b=n/isozARm1hBjvh1rldbkVN6ws/OgzLWrFfG0IH3QHedia4jyMYIC5LRNFMtIIJpU3
         CTMKMOQkAc2jPGl8ZiNKCcRMN612UXuJZy/nBWoJHBgUwAxXvLCMU6Bp08IPcBfDdqee
         SpZFxbEjD6OA0nYPn9EGPIf9AnzVOTKXZkg4bC8SbtezdLQwHtK0wBmeWjGIAy8LEXTT
         a/au6svD2xVxV8fMbCQs+74Y4orBJlUxWyCF9v4tNElIfw0plIg7dH+pOybkUhkgQG7m
         ossl/JWhjABjqXun2Fz140DnpEf+kjxIoUHDbg+6hyB6Rs+F0oqbkwcbRcIT3/fhGaDv
         NxFw==
X-Forwarded-Encrypted: i=1; AJvYcCVSSgockG+59Tfd09AMyjXtf+qpgmN7lkfFG4XVUsIJSv/x3+k51odEW7G2M2tEhp78QlI+c0VONlj0b9C3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc8/p0JcT/vUWzp7HVAiPkAnegI3fori0LmQncOR5dPlTTKE+p
	CXbY9+A4DbJLKgTmHLWSo0+eyNxvYzw8eQZxk2lB/dxxY+3C5TCKWtsEBqs9+Ng=
X-Gm-Gg: ASbGncu8WZPMG6QFrXHKeD0Jc4OOw7T49yfKRLZI5zpSRwqrHXhwkwIOsgkYem/8Jf+
	KvCH4BuEtAnCP3Q0ZxfX8slfbGAZvzAMfBCgGJhjZA0QVsCr1ISwH0tdFDzFIQaHYMe8+9vexGl
	WrtDkuz92esnKt0eZ+A5SFDDSf8VmJnN2Rc53KE3yp2Iqgar6qPfDjLPMRvrP0AnaC2a/nLvKyt
	7CdM/qdh6DwJyZF6C87DrVfv1YjB8A2lah8ok9pjLZWuG8y3Ttmb2ibrVYYNDW1vNvFk8A=
X-Google-Smtp-Source: AGHT+IHlFg9MRUuBMT41LOH603/jT4byiUO7SLcOVAlIC3sgyjmaz0RlcOxVnCxCRWtexRNR/Fj2kg==
X-Received: by 2002:a5d:4888:0:b0:38a:8984:888 with SMTP id ffacd0b85a97d-38a89840a5amr4302842f8f.8.1736616210113;
        Sat, 11 Jan 2025 09:23:30 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80c9sm7636600f8f.84.2025.01.11.09.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 09:23:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: pmic_glink: Drop redundant pg assignment before taking lock
Date: Sat, 11 Jan 2025 18:23:26 +0100
Message-ID: <20250111172326.101779-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e9f826b0459f ("soc: qcom: pmic_glink: simplify locking with
guard()") was on top of a fix [1] which was moving the 'pg =
__pmic_glink' assignment into the critical section.  Unfortunately the
actual fix was not applied and instead rebased version of the next patch
got in.  The resulting code is in general correct, but now there is a
duplicated assignment 'pg = __pmic_glink'.

[1] https://lore.kernel.org/all/20240822164815.230167-1-krzysztof.kozlowski@linaro.org/

Fixes: e9f826b0459f ("soc: qcom: pmic_glink: simplify locking with guard()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 052c292eeda6..cde19cdfd3c7 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -233,7 +233,7 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
 
 static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
 {
-	struct pmic_glink *pg = __pmic_glink;
+	struct pmic_glink *pg;
 
 	guard(mutex)(&__pmic_glink_lock);
 	pg = __pmic_glink;
-- 
2.43.0


