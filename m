Return-Path: <linux-arm-msm+bounces-91217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ERdB0Pve2keJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:37:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75600B5BA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE13D301E3D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 23:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93377376BE2;
	Thu, 29 Jan 2026 23:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrYMvPdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD0B36A004
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 23:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769729832; cv=none; b=alYaQWzcZKMdESlEsv4pd9nQa+qaS40VXzc+rlyqYv5W3zSraTANDJMMMs+MbBP8ZVHO8ogznLw5qhDbQMkS8890Lg9G4rnphqGNdsqhSAB6HM916/T6LCEsHicBzmiESurHd60kiJMvUziUwAbyqnwdzmdcCtSXymZMyuOANbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769729832; c=relaxed/simple;
	bh=n57vfxcyYsqejyOw8je+0D5WTFziz1fnLyQKVj/lanM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U1meuiao1anUigz7g25zTybZa9ENlMFWEz0AjPh4xlnAfXY1sQwXdoHVlzF5NtwBgcU8j+lP12rzlmfccLruOpaTkTOPimJ5500GrbXCwhTq6Va1Q9zWe38dvfO9++kP8bBx9BodW/Zy9Msj+xzFsSzzBBPFXCfHLVIEKFEZAy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrYMvPdm; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso834943b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769729830; x=1770334630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFIOgnH6m/Tp8biSOxBgIzwBRfAedBPa4QLS4k9B36A=;
        b=ZrYMvPdmrtG14eU8IQPHlMH5z8pFom9XEEq6aKScBNUi3X3RWYHoKltOdPvjFfWlkm
         sJQelBBvKsrSJpcoCQzAVBIxFE0qFNXZedFxj1tp/6sUSwKMX0oC2g+z+FWtyYmbeEZU
         qewvKaWTSiWJMqowB1XuK6Z3HXyfCoaxjDEwvmR3p6tFRFLvBqAzPJLF4dhBXyHExKMn
         FfkI1DY5W6nqKRssFzx+vDT8Px/bBm3QHA9dnVrx2cjV2IWKNsSBiXKAga2d12S55w91
         iHyNaUj6VbYWipDqqd4RExHG6IcNMLZhDj3Gpryvkce4Jc9tTMiLD+t+xAjC/Wi0FjNs
         OpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769729830; x=1770334630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFIOgnH6m/Tp8biSOxBgIzwBRfAedBPa4QLS4k9B36A=;
        b=q4LDphxUrrEuA0Le8rMlCmxccoBkegOqRw1iFgUNCIcXlwujDS+2rP0trhSPp733Hs
         kjgrds6+tpiQRcfVtqG1SXoo3dEyAxqgkQxgSaUDW1fp7K7gYwxWW2lXsSBbBxHNJPRg
         9qk3vJn+fRcNNcQPoQxw2oAykxilKKUlKQwoENJ9gXGsIUeZoZvD2qRuaJJyYVTxrrFs
         jwVlsowyBydlGfS+CBOM1yxDVUnKVFovPsPo9lF5qXnnTMy60fKQgUkmuCGe4hjY8OBW
         V5C93AeJjnsz1eGn8EXLENA9EVkW7miCGoqL2o9ZMfGFFPVnRG/NnQ0rPsdKHUSs1hqH
         2FKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4d3C9O8fCPXWBjcPVjHsS4Y/JPn/AmPzlZAphkyzt4RStXqgX36Zkk8yLM3CcHj1Hfcxkuk9PT0rXbP7/@vger.kernel.org
X-Gm-Message-State: AOJu0YxdS05gqmg/mj5kd+kiMBbRq67fHIv8pds5OnU9HfB3HFNAhbgs
	axTtfDuDrOsjR8creOmltNlkt39SZ0KQuApIExZNGDCkRmxq5fraN2/C
X-Gm-Gg: AZuq6aKfNEQHuXSZx7pW7kqznBWwJ4mlnKRcKEZmkNpM+nwB9NhkR8IJv4xijlrMrbi
	VU4fPSMFHtRYk2dmcZ14B2M5IAD6oMY2a4hwZ8UGhlSpt5fV7lcTEQmCTLNiW1XWG8Tx4IXYFNM
	ptN0pWMeA1AC2iY99NVoWSH/gxuAIOB/qKXvzmZS/xiPDfF/E/39qc5jlyp6ViiPPAg76M0+lq/
	yDxz1du0ZhpCkmQkryNas86/30olV1+w7doKClg+lTATVfT+zbAHD6HSKuHa17JykzgwHOuthaY
	SjUEloJ5+98fBg2pkN1WeXDB1hSqCXx9thT1mgaT4T3Qh8Vt5waaAQkwfW4huxMdTP+BwmjSwZV
	Aet97vETuqMwlLNxhnL0qJW+veO9YnGTAzED8Lu35m/y97vwktuiNbkKqheU3DZ3F+36Y9vXGPG
	ZyjNZzUpISOMCGQ26QgG0K
X-Received: by 2002:a05:6a00:8d87:b0:81f:4346:6870 with SMTP id d2e1a72fcca58-823ab695dd1mr915423b3a.28.1769729830385;
        Thu, 29 Jan 2026 15:37:10 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c5293dsm6256794b3a.61.2026.01.29.15.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 15:37:09 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org,
	amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH v7] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
Date: Fri, 30 Jan 2026 07:37:03 +0800
Message-Id: <20260129233703.407404-1-xjdeng@buaa.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91217-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,buaa.edu.cn:mid,buaa.edu.cn:email]
X-Rspamd-Queue-Id: 75600B5BA2
X-Rspamd-Action: no action

In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
reserved memory to the configured VMIDs, but its return value was not checked.

Fail the probe if the SCM call fails to avoid continuing with an
unexpected/incorrect memory permission configuration.

This issue was found by an in-house analysis workflow that extracts AST-based
information and runs static checks, with LLM assistance for triage, and was
confirmed by manual code review.
No hardware testing was performed.

Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
Cc: stable@vger.kernel.org # 6.11-rc1
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
v7:
- Add the detail description of how the tool detect.
- Link to v6: https://lore.kernel.org/linux-arm-msm/20260128033454.2614886-1-xjdeng@buaa.edu.cn/

v6:
- Add description of the detection tool.
- Link to v5: https://lore.kernel.org/linux-arm-msm/20260117140351.875511-1-xjdeng@buaa.edu.cn/T/#u

v5:
- Squash the functional change and indentation fix into a single patch.
- Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-showy-2c3f@gregkh/T/#t

v4:
- Format the indentation
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t

v3:
- Add missing linux-kernel@vger.kernel.org to cc list.
- Standarlize changelog placement/format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t

v2:
- Add Fixes: and Cc: stable tags.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
---
 drivers/misc/fastrpc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..8bac2216cb20 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2337,8 +2337,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		if (!err) {
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
 				    data->vmperms, data->vmcount);
+			if (err) {
+				goto err_free_data;
+			}
 		}
 
 	}
-- 
2.25.1


