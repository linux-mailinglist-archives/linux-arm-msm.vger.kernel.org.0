Return-Path: <linux-arm-msm+bounces-87697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A83ECCF8A24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 14:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B569302DD76
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFA5339708;
	Tue,  6 Jan 2026 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYFsNJUz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2n3R8KH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB0B338F5E
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706844; cv=none; b=e24f3vB02wsXnN5gEtgpfLgGUYlobFF8FwHJcZfPKuoF3PzC3irSRl5wYr8Ec8kuO8dDbHa/vkYCI/4LICmbeI/j9+iTwXNoBVaYjTB1uotRzjM6NB++4TZ6vmk7Kwlxp3kmYUn8i1FYLv9sqR4+r7cQOJuOngilw3XP0mz75lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706844; c=relaxed/simple;
	bh=XWp7COkoR50DXLNvgSau8lqHHHIoHPVakl6H9Mli0uU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4yAHmEpPIU42ThOJmZw5QR3IrOcr3QOakzUsxmCLJoA0ZuaeSzae4TbLa36Qk1F8Vj18Jq9TQrxWSELQuNt2H2PPOKKRZ4uQMEBHG+BCGsBeGb2/kO0rB7PBh6SKhjT0aIj8QxVEy9hTsKTps0/uNoRWNFuoLjvx8R5Dm6pafk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYFsNJUz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2n3R8KH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6069WZDR4091260
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 13:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hik6Yv4/FlA
	PL1T4IYbHNIfPpAtv/lW1BzmwFMKCUek=; b=TYFsNJUzgt7+Gp1KgJ2K60BG/a+
	g+4g5J5qMs7P88EoYzi1uR47oKPKSG78b5TROGjv/MGNYXwuJHq7yd2xY2dLDqSF
	xD6oFoWu0AqjUMmnEKNZLPySyqM1jcIzbPLDAQQT4swWSnYPzoFuXhGzNTBCWyQ3
	hKFP4FgvO0Ds3YyhH+Ipcyqbw3savvHrsDxJaSI2d48hipa8OlNZNo1O9/2QzF6v
	B+oy9lhxiAmngUgFWTeW59RoGeAr7s/DcxJyVx9aQPYSlEp55zndAN64kah7a5jG
	YOvInn+qLKw7wsQCG24jceFolrESqWzQ7Sn1ptv4zHjBIZ5Lo/Gsm+lOTCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun8mp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 13:40:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1450189eso10524605ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767706834; x=1768311634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hik6Yv4/FlAPL1T4IYbHNIfPpAtv/lW1BzmwFMKCUek=;
        b=e2n3R8KHT4kFQP4UPjFDu6EtY4+vEqpEV/jkwtL+ocU9NgIwdCGZuHjIaAy89AK6uM
         GYyJ58unPkSNnG8CJIwd7HFqIOs05+OthM3bCGp+Or4t3nA57zUFWzu+5OtaLvNTf15y
         lv2daZerYkEBqBxI2UChcvQ5hUXVQrKdnNlkaon1hFTJTPKwEdSM8Z3ad+y2/zAO8Vai
         WLg63t/ZasqH5Eez7J+xsV0t9u5bn6ZJUlLb55Id0yPLY/gnVH0vgTrOSJQJiYn0v73E
         N7jTSxUGwjHvHgu0oWF90dgzwrHW30lzn8sTSBvLKiUWdDDqkyeEdtKEXW0MjCJ3RnxX
         4eDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706834; x=1768311634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hik6Yv4/FlAPL1T4IYbHNIfPpAtv/lW1BzmwFMKCUek=;
        b=Can/2Am9gxgCCfZ4ull2JG/+fmDY11pQU7ZkifSLFnquTIxZDVnNYVN5ss11ivLF5W
         fh+Az3mPkCPIg96WFIZn5Wpzfztjf90LoiBjd4Zb8CxQJs9lxEJhM3vp8kkzSZurYPzk
         ifDUTbxuI6KWgwLB87itlCqF9p9jjCr0BWlVMeh2CdBi9BwY008Inc0PW+GTvY7nbUKM
         3F3s3KxjpVZqxIJ29cxOrxlewHZ/+n3DzcNL+fIAXat2T5D2mAn1yb8WMuPof0gu5a8A
         rJQZazY1L7ewTld1vWa7+phT+FVSRpdJV+kCMVAUYaR76Gv40O2+OJMHxUM7W2pHzKz9
         vTYg==
X-Gm-Message-State: AOJu0YwbfbXyd6V9NeGZHzPH+VGPOPkfSf2g/GlOw1Y3ipd4zfe9gtcJ
	09WQenZQv6rGLtN+L7uFQc1SX10REyKKpldd2x3t+xQlIrZ+SgmZQCsSJDryJjH2bks3HeMr3QN
	t31Rr2opRtVFXFZT4cmfPepQq1LHeJt/3Qg1npuxxoXfETiEla5NsoYuyo4nZPAuhWpWt
X-Gm-Gg: AY/fxX61Bf3M3kcrydoO2dYpn0+G35nUITcHGHWpf7/7x9DFBDOzVsRhHa308mWqKjd
	13Rogqayx1miZZYZdcDEKaP8RB/9usvqCn4PJZBbR49KRP9ii1//Y7mgpZF0WeKD8d6jk0pxIot
	I40sjHxTByvGM5gpJKyKNWry5OED5zSBedOKh46/e7lX9rAJ1+mpduEOu8oZDWPMbZAW3O4nEzp
	8dmcdhUqyRKUXH3H/Bmj+b6I0hZNECJ3oApTyBa/azwwH8UlRVx4W1RPQ31ryurNA1h8cG5n5/G
	yZNWNzV63awy3SpxtfLQtXQ/SVLxB5WgmVKoLiRfx5WWzO0ypevu4fqiLS4L5GGgva0S8+rwO2s
	ixh9btV9enERJsJ3oMFSy4BueeddooXRIqVZskDY5
X-Received: by 2002:a17:902:c94c:b0:2a2:b620:12d9 with SMTP id d9443c01a7336-2a3e398e82emr28538535ad.5.1767706834205;
        Tue, 06 Jan 2026 05:40:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPXXNLeunS2BjceJQzS81yF1SGalnzfMf0xuwsb9X9HO5mpbz/Mj589G/FmMugANxNfE+/9w==
X-Received: by 2002:a17:902:c94c:b0:2a2:b620:12d9 with SMTP id d9443c01a7336-2a3e398e82emr28538275ad.5.1767706833732;
        Tue, 06 Jan 2026 05:40:33 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc7856sm24112515ad.68.2026.01.06.05.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:40:33 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V4 3/4] scsi: ufs: core Enforce minimum pm level for sysfs configuration
Date: Tue,  6 Jan 2026 19:10:07 +0530
Message-Id: <20260106134008.1969090-4-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExOSBTYWx0ZWRfXzxbZm9TtTk7x
 S24BjTCtgx/2xVw9PR/6SmIyHIPlVX2fbU32pFMnJvytbNzladdAM9ESB67vUjBGp8M9vupc3hU
 FDh8GInnc4Cb93v7tQf7jaSxlifyXk4AWo0Ab3qDDe714ME4pmD1mtW99TgthQHlzW87voQmUHv
 vhTW/tngSLkrR3VP2pZF80UfNUTF7EHoM8OZuKewjnGQ+NeLIP1iLYQ0z2GPmKxnAszeg4afWka
 8Wjo8ZFyf6Eityovbzy/gdqP07JfUPyl+dLX3LdHRE8N4iIozF20MqnadYhhBIIKpJyuW6fy4CW
 Kw/yYWViMsLt9CxavbKdSXp0uSQfzyFpzn28Oley85bdxVrQxwflCH5t4Fq8RicbNWFCaX/hHb4
 MuMb7ECt7sq6MmWLRG8e65eZyp001jOWWcBgEw2SL2IF3me+3NZpdWv3Nvvpbu7OOK4j73olgb/
 thcmbXXH/642JPGGt+w==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695d10d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_fLkURk_aflrY1IPiHIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: vKFbWlzuAG7Lp7MjWpwr2P6H78KsYEWt
X-Proofpoint-ORIG-GUID: vKFbWlzuAG7Lp7MjWpwr2P6H78KsYEWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060119

Some UFS platforms only support a limited subset of power levels.
Currently, the sysfs interface allows users to set any pm level
without validating the minimum supported value. If an unsupported
level is selected, suspend may fail.

Introduce an pm_lvl_min field in the ufs_hba structure and use it
to clamp the pm level requested via sysfs so that only supported
levels are accepted. Platforms that require a minimum pm level
can set this field during probe.

Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
---
 drivers/ufs/core/ufs-sysfs.c | 2 +-
 include/ufs/ufshcd.h         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
index b33f8656edb5..02e5468ad49d 100644
--- a/drivers/ufs/core/ufs-sysfs.c
+++ b/drivers/ufs/core/ufs-sysfs.c
@@ -141,7 +141,7 @@ static inline ssize_t ufs_sysfs_pm_lvl_store(struct device *dev,
 	if (kstrtoul(buf, 0, &value))
 		return -EINVAL;
 
-	if (value >= UFS_PM_LVL_MAX)
+	if (value >= UFS_PM_LVL_MAX || value < hba->pm_lvl_min)
 		return -EINVAL;
 
 	if (ufs_pm_lvl_states[value].dev_state == UFS_DEEPSLEEP_PWR_MODE &&
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 19154228780b..ac8697a7355b 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -972,6 +972,7 @@ struct ufs_hba {
 	enum ufs_pm_level rpm_lvl;
 	/* Desired UFS power management level during system PM */
 	enum ufs_pm_level spm_lvl;
+	enum ufs_pm_level pm_lvl_min;
 	int pm_op_in_progress;
 
 	/* Auto-Hibernate Idle Timer register value */
-- 
2.34.1


