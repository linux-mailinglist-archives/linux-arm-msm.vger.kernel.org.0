Return-Path: <linux-arm-msm+bounces-32624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C9A987B7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 01:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFC501F23BBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252F2188CC4;
	Thu, 26 Sep 2024 23:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGbd8ZBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4428282FA;
	Thu, 26 Sep 2024 23:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392265; cv=none; b=C68ZoAWxZvLuPGshijcQY1J90HH++YBCYLPonxVondONGHj5tDO955VFqhUjNtqOW0H2L2/z1cjvL0PM/8D6ajL731svv0Fji8BTaIGtxTSLkKNoxDoIW+a+Nm7sETYTX67v4MgvaXjwDIRC+j0C8c29Ls0e0Z7fjiCeWT45OdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392265; c=relaxed/simple;
	bh=NuXoVhn/VY+NPvAHUjvVhb/s+/ZUMmU0/sKk5sKHH5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ORQ6Z+0AtwrzoLmToQYxBMVSUrgQShYJYlBqMZW8yvWyF2uVyaO7iJ+sET50MbTjQxOUuJJznkt9zZy9cweCJ4R15c15ACRmXiHo4TZn1yp5UdcSmcIcmraLhrnTNbMZZGagJGOQyCfK2sj5GRbIMW6qfzRRL+IvIeY5smEadHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGbd8ZBp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-205722ba00cso14302485ad.0;
        Thu, 26 Sep 2024 16:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392263; x=1727997063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/y2BsseFbccHmDcBudLCv67s4148Sh1VXV/ChQXGYK4=;
        b=TGbd8ZBptuOHkpTcGxZ78TQxMRdBePiy/J3wXSPkgbyqAfIf2/9Vy4SniRlSWaRCMA
         r2uH6wAHzo1GfTqUMPwpiGTetBelyrDnmXIsF6ipggzuOCDAPFaeSdvOjYNrznMHhwD1
         u39wSMcsSXr42nljujOqt2dLmiWEvFgD+lUqdXQL4qSCQraS679n9BqKSZDFLApatoxP
         lDFULp7JwUyYQ5wJjE9bwYcvf343KBM3uKHDs4mA52BcI/HCjnfjVMiIO7H+5Ci5ycJL
         pZqk119MCldlrwzfIJXphssZZxqS7yvOJPoDfetOamDQQSOzMZfJncN0PZKUQ5FN83mF
         0Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392263; x=1727997063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/y2BsseFbccHmDcBudLCv67s4148Sh1VXV/ChQXGYK4=;
        b=sXy+R9COEaOoVyO1myZjRhR/RTfE3b+G4NqPKIEGUq5J1mi2nC18LJJ9zhfcn5boXZ
         YEbAkqfpRk5zWlgnfe6OFiF4EBC54RRUlaboCUynqLOZJJ9Xpzj1dJ2b4fYk3kryU5m+
         lKBYvSSY6u0T8lPLR0NpBEdTxReTTaFPhzX8Be4ULuDkoLvmCuLUI+zvEfY+TPJ8e+AE
         zJ1vyWEEIGGkG9wY2P+DFkxL/bDs6aZsK3j2yNeECyNwo7QydV4BSBIhv5rzclFMLV/i
         j7MlmVcOk3j6HgBrtxpHIfrWuPBWPe6GVFrAPSLyFkCL/Q0wb3KkxgQxliV6yCrDHmi6
         bJZg==
X-Forwarded-Encrypted: i=1; AJvYcCVm4TxZ/cRTgAMzC4+xW+tAITILDhg8HVrwCR2huHIyLu+foZjWIoQOyn5MfJ33+mPYRWWM+uHqYFhm74Ke@vger.kernel.org, AJvYcCW608YF+fkQsZCuhVAfJGMSR/Qo/tMK+vp3jyCwWa4inBxr9jh7P8kwg0R5gv6zfIRXAnBR7O4GGF03JpD5@vger.kernel.org
X-Gm-Message-State: AOJu0YziotmcxJZ/ns4cJBuDUsJOSYK2GhlEj/rkBAdsqpqkELf3ZWJl
	Q+jCz9r2is9UBMh5h9RyG9s0wKIp3pyRg2ZqOpu7bE3f7P+eMxUR
X-Google-Smtp-Source: AGHT+IGLam89J49X5qsrqBE917oVUuFFnXPspoREaoDTh5bTOHMqF7m7+/wPp87hWJ8RPvmwzdipOA==
X-Received: by 2002:a17:902:e889:b0:206:b1fa:ccbb with SMTP id d9443c01a7336-20b367ca001mr18573935ad.9.1727392262881;
        Thu, 26 Sep 2024 16:11:02 -0700 (PDT)
Received: from localhost.localdomain (111-240-71-161.dynamic-ip.hinet.net. [111.240.71.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e14dd7sm3268375ad.138.2024.09.26.16.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:11:02 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-smd: make smd_vreg_rpm static
Date: Fri, 27 Sep 2024 07:10:36 +0800
Message-ID: <20240926231038.31916-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since smd_vreg_rpm is used only in
drivers/regulator/qcom_smd-regulator.c, make it static and fix the
following sparse warning:

drivers/regulator/qcom_smd-regulator.c:14:21: sparse: warning:
symbol 'smd_vreg_rpm' was not declared. Should it be static?

No functional changes intended.

Fixes: 5df3b41bd6b5 ("regulator: qcom_smd: Keep one rpm handle for all vregs")
Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 drivers/regulator/qcom_smd-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 28e7ce60cb61..25ed9f713974 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -11,7 +11,7 @@
 #include <linux/regulator/of_regulator.h>
 #include <linux/soc/qcom/smd-rpm.h>
 
-struct qcom_smd_rpm *smd_vreg_rpm;
+static struct qcom_smd_rpm *smd_vreg_rpm;
 
 struct qcom_rpm_reg {
 	struct device *dev;
-- 
2.43.0


