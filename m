Return-Path: <linux-arm-msm+bounces-101640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBCeHNizz2l1zgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:34:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D6C3940D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9494300461C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 12:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3E9388380;
	Fri,  3 Apr 2026 12:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwzMt8pM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jiV1kSqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855BE3A0E8A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775219417; cv=none; b=HSkw7ZD/bTLRwChbk9opdTs41WuG5LjsVSUtXl9uxKB88g6TjXn5aSBxto6+XZFfJmo+nsDQj05E+fJa3RCfAkmJf95OAAIRchp81LnZJszEogDmkneyw29SYOFAJ0RRf+wtwwVxyAQ6nFvvMKPGiC6bGVqqmY+fb0liWNTfo2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775219417; c=relaxed/simple;
	bh=1qFlY5Q/B1pZqgQ2bNo2B7Gn3y/vtW9va/jkWsSbgh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pITQ2IlEogtO51DgMkQLz/+azldS+/K3vHPbnu1mI5gu+pxGNH+cPcsBYaF339FW0akQ+hH0jsAzA1hlPL7ZTl/JxxTfEnWz4IMjaIQVu5kWjPzFEA90F+GmV5rGqHAIHbO4xC1EuiuB02sOFHSorrUjic70cDcvzDCgoDeijTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwzMt8pM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jiV1kSqv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BrYVN823314
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 12:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GGelWyldEc4J81EM2vLt+9
	2SccC0QrtVDpSEEvt4yUY=; b=JwzMt8pMj6UusaPySS0NdMMpLqnCYv47uL0Wa5
	46Qo802Ee9gOfh4DaSG4IZSZdwVtj5+JdzapK3/gnDMjUOVWSk3jtvmpqDvRzlTo
	By0p4jca/Hf0UAONlcruoKfarLhuVp1QPDxF+I9nUqZ/1biAQjVBDHcAeSI4EgQn
	ApK70TVe8oOmlue/JNRrN3FIwIg2QTeONGUPoH8ygVMiT56elh/3pdDtkyqrp+3u
	mvSLeeVnUWGXsO2J24HXyWJsDQcZMMlt7o3MA6ojlcoKwNgaD74TpMgfNxRaJvJv
	5Kiaa1EdQ5pkgMk5kIQ4UVy9CiCAlz56j6uRxwaEZoElK+lQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da6739brd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:30:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24de0a376so7484855ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775219414; x=1775824214; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GGelWyldEc4J81EM2vLt+92SccC0QrtVDpSEEvt4yUY=;
        b=jiV1kSqv+B4gNQ1jV3wmaJEf1hOnEFeg2BfdARzF1gC8wA9qu0bh9chzPbIfrOWlei
         HnOIvlDQQTJWP7tFq72wX0ri/dPVmX/0S7grEu4Y3lnIE22lCV3A8R9Jd04ndDh+pr7M
         Z3EJfdqOWZ77DcO6mAXrK2nfQUFyeCgwiogrDGV+WAv+pmEd5jhK8M4ieXKHZdV3ybKK
         oe66PPqC5Gr8F/ue3kXIh7/gl49pWxETa6CaScEW3hiB4rSV60eJn2cwhCxTP6vkunDu
         r0cwcpSyJxfpMkKfzU/oGlNhagMZ/6DBvcuLya+A+miQxbqsBFEf+51yS30m579KMkgY
         HYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775219414; x=1775824214;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGelWyldEc4J81EM2vLt+92SccC0QrtVDpSEEvt4yUY=;
        b=i/4iYokqbE+0Y9MuKdIL/P5eyEB5SPD2TMymGy9PKpsPEOMy8QvftAJlZ9MtQS5LJ4
         bMKEAWuuTBdcD83EmKgKOap/HmC3dLz7QX5q1HA4DTR0k1GI0ailiOMszE8v+AzbJwfu
         XDqrwIMYwq8dD8JTY794SSFaeZtADdaSwIvq8Bk5qhs1cCAM3Rm/PIOkGVSAleOWXnnL
         S8S6wWxbERDvdaY7TdWbsgauwWy77nL98+X/1u8sEqe8UyDGugZyquqLIaEw+22FqkxG
         j6IO1M3AOh2JyxlbIdJ7Z2ASFnMPsX/3xEcaOo6iqNKSOptivHgsgOx6niyMtL+YLanX
         QeKQ==
X-Gm-Message-State: AOJu0YxKRhHL0g+6DTIVjf16KW91eusGL+ZkOw7ol1w5zgDsKQuGWTFy
	Jq2UWBN1r9beimylwyYQWri99nrj/SHIS5aoyPX+6YO1M+mmUXI6gxhzxNB0h1T3WWqvCiVW7EB
	tLbf88nqVvPvb9ViES7uR3FvgkqG7gwPxofbc4Q3bwlNSoRAK451mZYjgUbmAthJ3fnjCw3iAkC
	+z
X-Gm-Gg: AeBDieuYnZUY+NJnvyyGTcPnbvdxwL+/Z501zfAKrjqMnSo7wOLEWoCm0BE2vDYXBb2
	aztuJG9HSxTsv/Al35rWdF90XbJTxhqM6xsDE9gpedKleXVxscz/NYUc7udjTgX/l4okpF4LEYH
	i9IS3Hwn/vJBAYO4Gt2OFURjnp1iICrXLK/M7mndfBPV1zfnlE4OIHnE/QRRs/bkegsmR3B1gx8
	A7VNVV1ijwfg5cHJzhWnv/vl1rfwKtASdv/qvG0fN2Yh/Ic8BjzWNiFMgx2Tj+xccUCYB0+XSld
	mHsCqQPhZC1uss2KT3sOCcLg5xhYN6RdVDI2n6mvGkz8UWF4hDi7BN+gkMhPODJ9Iv+2ACTpUCI
	I7QcKNGIDGhsaGePQPC0B3+J89LROuE5fACAZ7oUgdEiIQtxQHo3P/ifc1dZt9UFL4LCd3wBG3X
	NKRvWhpj0NBKOKv2rSklXm2hJwmcyFoxcel1RLddHRPQ==
X-Received: by 2002:a05:6a00:4c0d:b0:821:8145:6948 with SMTP id d2e1a72fcca58-82d0dbbca13mr1677055b3a.7.1775219413772;
        Fri, 03 Apr 2026 05:30:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0d:b0:821:8145:6948 with SMTP id d2e1a72fcca58-82d0dbbca13mr1677027b3a.7.1775219413266;
        Fri, 03 Apr 2026 05:30:13 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm5967653b3a.61.2026.04.03.05.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:30:12 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 17:54:56 +0530
Subject: [PATCH] phy: qcom: edp: Initialize swing_pre_emph_cfg for sc7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-phy_for_next-v1-1-3d336b555019@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJixz2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNj3YKMyvi0/KL4vNSKEt3kVOPERIPUJFNTszQloJaCotS0zAqwcdG
 xtbUAZRq4B14AAAA=
X-Change-ID: 20260403-phy_for_next-ce3aa0eb556f
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775219410; l=951;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=1qFlY5Q/B1pZqgQ2bNo2B7Gn3y/vtW9va/jkWsSbgh8=;
 b=ie6aBSJ9jq3b+K8szlZhmztVQEKwAN2LjpLmWvd6ZFfeCpO4egFltjYecqBgpHVezVxXhhh+g
 z4/CEPXXiP8AyS/HB6m07GPHq+DMpGeg7WkAC6ntb/rKWA/9z3KmM1+
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69cfb2d6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ywSsHIUjEAsI5Cpo3g8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: L6b9PywUyMo_R69B1j9UqaUuYiXayIZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDExMSBTYWx0ZWRfX7xHl1etW0Ltw
 /zOA0VQxq6ymq6/LXEMV2E2frEFkXQFZf5tbDa+2V07G6LKM7lNlIk+EKAzpMa0nHH5sA0FW139
 JHa3WxpYvSpkWG4jC75LaEOU497jLjp56oTTKjXNqj/nEPcaBklaX0jfQ+bdIA8HGbSo0GNemGI
 SISqB4ejZxDhBSIq2A8GoCORRkUMg4solAkchSyt+5gbTn0jUURZjctvmI0Psmeok1i6N53r9k/
 01nHJQpq9RYfqstDOUs5z5Ix83mAISMoceag6e6MuZvXGRl9/zrbQf/RYXbGQoUzeqm8PEXImJy
 H8qGnexi4nfOMf0VKOIIdRFoEm/Pu545eNIMBvrkmqUv8ZUnAQUI7yN5NwCqlmJKc9rR3OQsW55
 ZrOO1r3VRmWSkRraSbawjVaj8FvEeRT9xEf3iGBnD576jKvOi/1Ip5BJDMaqHY/ME/olEhiJrY+
 YCAHoRkVRO6qA+HIEzQ==
X-Proofpoint-GUID: L6b9PywUyMo_R69B1j9UqaUuYiXayIZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030111
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101640-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F0D6C3940D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Aux timeout is observed on few monitors like Benq BL2420-T due to
missing swing_pre_emph_cfg.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 7372de05a0b8..dd5cfc0eb09d 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -571,6 +571,7 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
+	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 

---
base-commit: 54f966f63b379d0c62bb044b7903319776443a4a
change-id: 20260403-phy_for_next-ce3aa0eb556f

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>


