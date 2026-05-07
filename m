Return-Path: <linux-arm-msm+bounces-106251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB3PNTsw/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:24:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C24E3753
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95C21301F9EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E17033B6C4;
	Thu,  7 May 2026 06:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKSvLFDa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MF6SnteI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9391C337BB5
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778134996; cv=none; b=QRahbueF6GNzmt1obclrBqvhd9GxBeKnIC8l/KEN8L6Y6t7JFtXxqUz0U0BwKjRzdfSyvLUS09aqtNWYHAzabXAAxSbJXEJ9mgEygUIo1nEbb5Y+3s7wpPXlzJIINC55JfcAMaX6g85HAuOUFDVo80eFp6SnZ2YivyqHeIO8EOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778134996; c=relaxed/simple;
	bh=TE4I9dLAziE4F6f8zleSD7WBcoGLgMMGcIxpRrGy/4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pi2OnD5I7WKc9EP1L0gpeTNaDHVD1cTWpD0B6+RILryDqL9hIeiOEoyRkv9VCyESa+DXrywN5/0pfnY7p6XkZkgYHr5bHHVFZeheU7Ev6LBXEOFpH2Xwr3b6GObg/NoA3k7UHFE2e0KFoTqj/Q4Uqm1iR/JF4DawAby+IbT4E2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKSvLFDa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MF6SnteI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475IMDF3924278
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4b06huhDhBP
	LgQXsILfi1dnmLMKdgyO1zEklZp2Wyqc=; b=cKSvLFDaeHA5jl47fC2yTYhRLH9
	KVIgCApPKLnuPVk2LTHTfwNPPR7OSTgCILVDh1xSmjDXIX82biexdVdB6PikHYl/
	3TF7VytTY6WF0UwYWRIVIHD3Wd8w42tU6a8oVlooshzOeTw1ock67uders5SyfmQ
	gzPGsIWfXoLTQd+81mn5v79ZziADqbHw1Qzux1ldnvgcpQExUPClsegAiqED0T6p
	A+CKcuV3jJQRNqDQEqFHDKhXcY3czbi6aMNUMGoMLEB0oiBhkDjdHdX3YmZ6CFx8
	mEU4M80BEkNGRaCq3qEOjv6Pd9gkFOLMwPlrylPxbz+CegmcyBcO3BCyLHw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c889r0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:23:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso577256b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778134991; x=1778739791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4b06huhDhBPLgQXsILfi1dnmLMKdgyO1zEklZp2Wyqc=;
        b=MF6SnteIzHWaeeNFbBcgvDApQKjghbu+kgySRybPtx1FisHFjMfeNHjcxZUUWLVl2Z
         9sAZLisgnJoagy0VdML4MyuURq1QCrkE3zyjX1oKGRJEYqFyRoNK2UaDjQ69SVvchjSU
         dYmeqgkwajtOj0c7CgCxrjJyOZFQ0rQbXFxJRYoDd67xQOAWospHI+r1agkcK9GJd/DF
         ueYkBvbW0utR/W5NJt71bP3AixMitzwe4ajwGK40Q6poR4WIYPd/xZnaj0Jb8hcI62mx
         T+sZfx1aFzme/eYnpRxy8H0/SGkYF97HVD9b5tMBLgepAl9+S+O0i+xxy9SD7Fry9mny
         MV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778134991; x=1778739791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4b06huhDhBPLgQXsILfi1dnmLMKdgyO1zEklZp2Wyqc=;
        b=B7fAUhCIRmFeXba1MWPXbpDRI088m0GRCoeqpd52LAUk3kVQdoY5vMcZiu2zYHUec/
         dcvUcyxydiAWikFsjlDWgENq4BIDniKhgH6XLuqWwWAj7/4Y1qh1Mxjppk8KeelDm+rz
         pcUGlJ6TcnsJl7qgcQkKLtcLLaDaGEDkR+l4ZTH8kIVMhpGRkIi4/04i8mSZ14DwRAmp
         hBuoBWe24gY4vlEkWwnHz1f5dhsIdOaYb+1t+5yeaLrmvgYfiURk3Gy6OpZYg5UBNVHL
         Wjav1i+lpwSOgSRy5yMNvb4/YIdWBkWcW87pWRsV6mi15WdexviQtlF+KVOnIYEw1xSK
         w8Pw==
X-Gm-Message-State: AOJu0YypP7cSftf59AQ4l2Xw/rbo8V8nbUYLo33J2rXZDWXx3otPLLWx
	fnJjgBlA/Ek6c6/ueYORrzEO20soHNlt0rnVPR9qU4AlM2fk2jFlp9J3rc0FWjCVjnravWwG1It
	CmX7IJwzgUmmdVix9/Og2fy6SKnzUFft9j1qGETo/658M8wKMX+jOhIGppSbdU8t9MewB
X-Gm-Gg: AeBDievUSFrwEDW3I+9DXjZrZI3HVOxhcbVAsDq8KLdKwPGMxZXko4wFtk5nBaZywCS
	t+2WkiGzyxyTlbp2pAmKB1YI3J+ODZWOqq+re225WNJ413zfalzQH6W4DHlMNGZ0V3iDBiQJEDh
	lwIU/UHBN29L6AAKFpjGLPZyN4y1TuB5BZiNb/gr/1m/UHJJPChnF2tqcCUOnh+sDCm4upxDG5V
	ZYh2ehwbth86PhjfJVTq+hKkGrtM0Ec32N/ww3kKjpgW6O2Voh6sZ4YTTfWgvzucyyHya9LDZLA
	wWiq8UyplA3SBqLY92xUlBhYo9adIjEBUVaI6JsLq8ZdZEdCG+DaNwo4XDNQVLgqKDUIyp4PdC7
	IYViDwkDjZd90wEHZC+fVUUD5r3q2FdiwSpGuN6Xdudk3a1s+yh/tb/aEv7VF0TZ/oARkmPExOy
	Rzn1SsSDkInTYK7/ygau2NEli9bvxhO69/cOeu08s8VBx7uKA=
X-Received: by 2002:a05:6a00:12d2:b0:835:cc47:6fe7 with SMTP id d2e1a72fcca58-83a5dd5c9f0mr6280902b3a.30.1778134991253;
        Wed, 06 May 2026 23:23:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d2:b0:835:cc47:6fe7 with SMTP id d2e1a72fcca58-83a5dd5c9f0mr6280877b3a.30.1778134990795;
        Wed, 06 May 2026 23:23:10 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:10 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: [RFC V6 3/8] PM / devfreq: Add new target_freq attribute flag for governors
Date: Thu,  7 May 2026 11:52:32 +0530
Message-Id: <20260507062237.78051-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jZcBA-q0kYytlLkardf8-5ekmwr-XRz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfXy4VgHFsEB07y
 Ncx14QvOGwJezuuZstAWSLpWPbBqX5qS0eM8bXP7BXe0FMq7m34Ifgc3i8kpDdy5yve+0RWus/2
 9ftQR3x2of34L6aTWnwrXeDuyUTMkkTXW+VFeOnzeaKMZgb4J8XoMzjk7zmZFAKlq/aJrOep26e
 FYBJOg7tqWimJO5aAjWogt48J/seP+iXUmbe1VmZ2NY7uS6/D1UFDilKnhG9OFSQtnu7XRSaYAA
 x9Nd6VzyfEQwMNTd+Yb+UvRJHnHxHlQb4Ya3s+DptRmjJwrKaGmf6xPDTsd6OhrDh34XnkLOKxT
 Nxi1xdx9s/PcHQUZKH4Gslk39MWQtL5x0iNd7tiu2v0jHxzODk5wOmyAZkjS5fscM2OPl30NqmJ
 dORvTmt+trqWRAZaB8KDJbWmfpPCXsCDWnwt3t96Gy0SBSFEJBvuOcEClOaCY2HrIVYVx2wI4l/
 w/bwxcyGz+RYxFlpHOw==
X-Proofpoint-GUID: jZcBA-q0kYytlLkardf8-5ekmwr-XRz9
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc2fd0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=K3uUPCIpGL4zgFOSzcMA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070060
X-Rspamd-Queue-Id: 7A1C24E3753
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,nvidia.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106251-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Introduce the target_freq attribute flag as a pre-cursor to adding support
for devfreq governors who do not explicitly allow for a method to get/set
target frequency.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/devfreq/devfreq.c                 | 4 ++++
 drivers/devfreq/governor_passive.c        | 1 +
 drivers/devfreq/governor_performance.c    | 1 +
 drivers/devfreq/governor_powersave.c      | 1 +
 drivers/devfreq/governor_simpleondemand.c | 1 +
 drivers/devfreq/governor_userspace.c      | 1 +
 drivers/devfreq/hisi_uncore_freq.c        | 1 +
 drivers/devfreq/tegra30-devfreq.c         | 3 ++-
 include/linux/devfreq-governor.h          | 3 +++
 9 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index e5d3f9cf94dc..85e937e321e8 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1526,6 +1526,10 @@ static ssize_t target_freq_show(struct device *dev,
 {
 	struct devfreq *df = to_devfreq(dev);
 
+	if (!df->profile || !df->governor ||
+	    !IS_SUPPORTED_ATTR(df->governor->attrs, TARGET_FREQ))
+		return -EINVAL;
+
 	return sprintf(buf, "%lu\n", df->previous_freq);
 }
 static DEVICE_ATTR_RO(target_freq);
diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
index d7feecd900f1..b75e4bbee4b1 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -448,6 +448,7 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_passive = {
 	.name = DEVFREQ_GOV_PASSIVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE,
 	.get_target_freq = devfreq_passive_get_target_freq,
 	.event_handler = devfreq_passive_event_handler,
diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
index fdb22bf512cf..b9ec587f582c 100644
--- a/drivers/devfreq/governor_performance.c
+++ b/drivers/devfreq/governor_performance.c
@@ -37,6 +37,7 @@ static int devfreq_performance_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_performance = {
 	.name = DEVFREQ_GOV_PERFORMANCE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_performance_func,
 	.event_handler = devfreq_performance_handler,
 };
diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
index ee2d6ec8a512..69eab1d0a7fc 100644
--- a/drivers/devfreq/governor_powersave.c
+++ b/drivers/devfreq/governor_powersave.c
@@ -37,6 +37,7 @@ static int devfreq_powersave_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_powersave = {
 	.name = DEVFREQ_GOV_POWERSAVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_powersave_func,
 	.event_handler = devfreq_powersave_handler,
 };
diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
index ac9c5e9e51a4..65ff9d912ef9 100644
--- a/drivers/devfreq/governor_simpleondemand.c
+++ b/drivers/devfreq/governor_simpleondemand.c
@@ -118,6 +118,7 @@ static int devfreq_simple_ondemand_handler(struct devfreq *devfreq,
 static struct devfreq_governor devfreq_simple_ondemand = {
 	.name = DEVFREQ_GOV_SIMPLE_ONDEMAND,
 	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ
 		| DEVFREQ_GOV_ATTR_TIMER,
 	.get_target_freq = devfreq_simple_ondemand_func,
 	.event_handler = devfreq_simple_ondemand_handler,
diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
index 3906ebedbae8..d1b765a7b8e5 100644
--- a/drivers/devfreq/governor_userspace.c
+++ b/drivers/devfreq/governor_userspace.c
@@ -135,6 +135,7 @@ static int devfreq_userspace_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_userspace = {
 	.name = DEVFREQ_GOV_USERSPACE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_userspace_func,
 	.event_handler = devfreq_userspace_handler,
 };
diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
index 4d00d813c8ac..0800116e3334 100644
--- a/drivers/devfreq/hisi_uncore_freq.c
+++ b/drivers/devfreq/hisi_uncore_freq.c
@@ -399,6 +399,7 @@ static struct devfreq_governor hisi_platform_governor = {
 	 * Set interrupt_driven to skip the devfreq monitor mechanism, though
 	 * this governor is not interrupt-driven.
 	 */
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = hisi_platform_gov_func,
 	.event_handler = hisi_platform_gov_handler,
diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 401aac6a9f07..fcb278c4a74c 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -776,7 +776,8 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor tegra_devfreq_governor = {
 	.name = "tegra_actmon",
-	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL,
+	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
 		| DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = tegra_governor_get_target,
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index dfdd0160a29f..2853f571dfdf 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -43,9 +43,12 @@
  *   : Indicate polling_interval sysfs attribute
  * - DEVFREQ_GOV_ATTR_TIMER
  *   : Indicate timer sysfs attribute
+ * - DEVFREQ_GOV_ATTR_TARGET_FREQ
+ *   : Indicate the target freq sysfs attribute
  */
 #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
 #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
+#define DEVFREQ_GOV_ATTR_TARGET_FREQ			BIT(2)
 
 /**
  * struct devfreq_governor - Devfreq policy governor
-- 
2.34.1


