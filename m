Return-Path: <linux-arm-msm+bounces-72242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B062B45434
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01D6E1BC6B72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800EB28D8D0;
	Fri,  5 Sep 2025 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R21J42/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C72C08D1
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067178; cv=none; b=sIomhoIbV804ImKu/L92XDHpgHlgGvy7AJyA+ZBS2+Pw7JK00h0vsPx3sS/3Bq4yGJCOoGBUUD+N8HM3h5uLVL+EKCENoGONJs8hRPG1qv9lSh0JPIEVMTB63x+5GWl4ikdcwKYzxxI9787DlmMPYODLi4/tOmUnEmR3Vi/ZxX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067178; c=relaxed/simple;
	bh=0a1aeU90EQ+A03GlHHwBOCtK0GG5iwSC4jZv8deRBm4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=aOyCra3YeE+ZcFbdAJXkn5KlC321lnUPdUlvpwVnW/JE1hFw5lLxhT89zAcknKUNAam9dmNVFHhjW24Kw3ydEYerr5vNaZDciLWyF5wqHE2FSoxvp3AAfGt2upHFSA4e1V7VEgghTwRkWRbeeu7b6Y1yy5lavKoNAW5UqhdMUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R21J42/g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856VUxD013631
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 10:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=BPWrSW4OlmxV
	S+oW/yAP6q3qPb7cDC+1hkUG3VlnF/Q=; b=R21J42/gc/bHLcWdV5WnkB+GVY7l
	vJwvcJ4Fv7TZLVnAAhMXXwH663DqLur4oPbnXx1yhCab1Se1VipHwsleNXCvPyCv
	LTv746TWqABs8alMCvk0D2Y389k9TeG76TSKOwEtPc9io2sSffzpbbN4PTvrZSqn
	s1jrR8f73uSIsSqWl74IiRDl5UkiNH3FSmZ5Unx1s90i5YCtxzub/xBxx5uzbMr3
	QXCdbvS7KFunm5NtlB9jqikpDCh8rfS4MN/JdFzzPt+9xjeOUDnOldRq9R2TrPqh
	ffiRj1AHvsm4ffX9o67tWJ6CE06/2XG/AK9LNFDdKItra8Kox/VB1eubNA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyepkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 10:12:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7725c995dd0so2016677b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067174; x=1757671974;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPWrSW4OlmxVS+oW/yAP6q3qPb7cDC+1hkUG3VlnF/Q=;
        b=WicaPkn7kC9DvWiyBnJth8U9/L9wHT4DnUuKPvOShJr0zBoJHi4wKLLMZLIZxQNPvl
         MflEurcHtPOF/QqvVk9Uh7y1WtEwC8UhqnPf5xsjWZfgyMTtezt4Mp5T2mIdv0OB3Bha
         S6NPFjQihw1ie0BYRa9eGrf1naHJAodUawwjAVB419W308hL462VbqMibwZRQkA5+iLs
         bn9U4CSW/V5VhCndQ+VSiGnS/GAcYBp1wdPNSrhn9nL7kgZSd0hEcTeM5TAUp3vFsttz
         yvRrUupJ8qJugePkHLcV2vHsR/7OxhqFUs7f4s1BoUp6PcC+WIQAkZo2elh1k7E51e5X
         6LOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7rpslLbQNWAmoZu7IiKP/JatkUAr7rDtczgdkxtDYF+/x3qGovJF4Tf+0AAXKWop1LcnbmHILjSNAuL7J@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz6gG4i4iiZNMqhYsQ8ZhxPcBpzfgkueDHeEhctr4ACc8WP//C
	PBczFIy7V2j0lIDou6gbj3JgdYTrJ6f4jtkMEcDx+3OazbL7No42+bZa3e+AwlLy/eye9KaoAxs
	2A0gWQUU4k8NVautDCrMpQLwPEWfeiSPXtRBaamDSyiFyvD3Y5n80vOp85xpXxcl8+bS+fr4jjg
	eKviA=
X-Gm-Gg: ASbGnct0itAGXD65AUCeJFS+F/+5tDUpDLPiDCcn+SZEt1zlVyfQvaoBEArPRMdMccM
	YWg4uh2j4jNFHRziRS1J4qK2AAe+7t8ng542Sd42WRSZOFV0rr/F75wqr9aA7Zx+tFVVIlAgiVY
	pXmarrt4Jua+jXU/NCXZGWn/P33+xE1zk+HKWoeLvDWDFVGj/9L3yNuJbQEOUuYphgbva19ld9U
	4/JB8Qv4TktTfkYdjhsbgldqm5zTUSwLbVdrNFjj7pu2L0Vut4/DG1UcQ0iZ83xgMC3dlsBWH9j
	lWw/lBJFELSUJ9ZbV1pwndBN9P3r/TpsvX9rsqB9NJ/2KCylEgzOkJkUywDdXrZqz23wpRyc
X-Received: by 2002:a05:6a00:b84:b0:772:1a18:b8d0 with SMTP id d2e1a72fcca58-7723e3d1d5bmr21965267b3a.30.1757067174248;
        Fri, 05 Sep 2025 03:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8uip5UcAX565qPWYQVvmWp5U2Fhaj75hFuYOARXkIDt89oWgdIYRjf28xKlHYEZosYe2y6w==
X-Received: by 2002:a05:6a00:b84:b0:772:1a18:b8d0 with SMTP id d2e1a72fcca58-7723e3d1d5bmr21965243b3a.30.1757067173742;
        Fri, 05 Sep 2025 03:12:53 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a269f27sm21897417b3a.12.2025.09.05.03.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:12:53 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Chenyuan Yang <chenyuan0y@gmail.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH] phy: qcom-qmp-usb: Set regulator load before enabling
Date: Fri,  5 Sep 2025 15:42:43 +0530
Message-Id: <20250905101243.14815-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bab7a7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=PsZWotwSXc4B6IEee8oA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: vd6o7olsCoDjiNByViWBi1M0B0qteP8A
X-Proofpoint-ORIG-GUID: vd6o7olsCoDjiNByViWBi1M0B0qteP8A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX+uGrdlt5LCy+
 6KoUi40FS8IbRbnLZHT7ec/VDZeYzMg0/3nPaS+qhcIWcixpo8NovyJTRTGDYm3EUGptM/Bpxkt
 wgTjMfiY1CbIm1tSInUWmkmkCPbPl2VQa1IFx05/toemq85NCAsFWXdIX63F4QTHh+XKdjCu4wI
 wjK+PQaH1F+rVo+ZVeDmn34AYLOFHqwwDObGiWcUoOgV33gPRV9jvkiEq0EQw2c6rATM8S5ChtW
 o9XKldGD5qBygSfOqiMYltPeNfmHWop2UdiET+9TL4SPh/NRth8JW/4zBWObXbvfobcewpl2TxR
 sZemHYq4ZbArMf3odQu96ZomSJeP1VhULdpjp51aB9E8wQ6hVXB6Mrg0SQxzdvZJLcokTvWZdfA
 dxDvC0V+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Set the regulator load before enabling the regulators to ensure stable
operation and proper power management on platforms where regulators are
shared between the QMP USB PHY and other IP blocks.

Introduce a regulator data structure with explicit enable load values and
use the regulator framework's `init_load_uA` field along with
`devm_regulator_bulk_get_const()` to ensure that `regulator_set_load()` is
applied automatically before the first enable, providing consistent power
management behavior across platforms.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 27 ++++++-------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index ed646a7e705b..8bc2dc975870 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1266,7 +1266,7 @@ struct qmp_phy_cfg {
 	int pcs_usb_tbl_num;
 
 	/* regulators to be requested */
-	const char * const *vreg_list;
+	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;
 
 	/* array of registers with different offsets */
@@ -1344,8 +1344,9 @@ static const char * const usb3phy_reset_l[] = {
 };
 
 /* list of regulators */
-static const char * const qmp_phy_vreg_l[] = {
-	"vdda-phy", "vdda-pll",
+static const struct regulator_bulk_data qmp_phy_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 21800, },
+	{ .supply = "vdda-pll", .init_load_uA = 36000, },
 };
 
 static const struct qmp_usb_offsets qmp_usb_offsets_v3 = {
@@ -1986,23 +1987,6 @@ static const struct dev_pm_ops qmp_usb_pm_ops = {
 			   qmp_usb_runtime_resume, NULL)
 };
 
-static int qmp_usb_vreg_init(struct qmp_usb *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	struct device *dev = qmp->dev;
-	int num = cfg->num_vregs;
-	int i;
-
-	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
-	if (!qmp->vregs)
-		return -ENOMEM;
-
-	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
-
-	return devm_regulator_bulk_get(dev, num, qmp->vregs);
-}
-
 static int qmp_usb_reset_init(struct qmp_usb *qmp,
 			      const char *const *reset_list,
 			      int num_resets)
@@ -2251,7 +2235,8 @@ static int qmp_usb_probe(struct platform_device *pdev)
 	if (!qmp->cfg)
 		return -EINVAL;
 
-	ret = qmp_usb_vreg_init(qmp);
+	ret = devm_regulator_bulk_get_const(dev, qmp->cfg->num_vregs,
+					qmp->cfg->vreg_list, &qmp->vregs);
 	if (ret)
 		return ret;
 
-- 
2.17.1


