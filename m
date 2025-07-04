Return-Path: <linux-arm-msm+bounces-63731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 123DFAF9877
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C5AC1C47E66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFA82DC335;
	Fri,  4 Jul 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSerBA09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B9719259F
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646927; cv=none; b=twk1N7YDeiKAPPFMhGkr6VmYZ3OW+AALkt60BkLRoG5BZE6Bwt34qZL9dCC61py5PAuFqbA0HhIFk3q3SShOc++OBO5VDVrp1qlVeUYNZbB+SVmk6d+2wco9w16+NWL8YfsqNxIdxE/l1W2riCFoZ2oonq6YKkzoNibj4IWt4s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646927; c=relaxed/simple;
	bh=CyevXooayJgTRHhip0Jc/dJHXf5dF8Ulyrh+9bR9yQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hMgYpv9SJHQax31Rb5eihozn0gy0NZzwq1c/xztE8khGWwyYYCdBOCKTZklWMIpzgeAVPx5d8e1xJQKQl3bTyy5XYEdbiYNdeE5i3g+HaCTTZJuSbsYlXCGGHfQxQSKzvHlcGU+daJM2TCUPv22KFmOsZ4L+TmoZu9fSeG8FI24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSerBA09; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564B65OW019936
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDGlOHr4NgcDVCXG2RQ6GCKnY1CV3e4EG2J6GhifJ9w=; b=nSerBA09waORPynJ
	9xIJz0oKz7EZXriAz/0jiZ8Beju0h6pQcRh8kaZY/ZzRZ+goLMAL36IOkzpvDUQN
	AGNDulFozzwVO87CwSOZ/aHjPh/zofT0q951mI6dmNmPzRYuoRG7rPo1FWefinLv
	ZBB+m5th2K4N5WNAm3bQctupngU1DU79iE6c6QTt51rFHu5ZG80OQg68lEvG/pFa
	QVuSbRpnipGyKbzF3nVLNrNsvFu9chtsZpnpMkg9O5Y/0IhcFsbTdF/J+nQ/Oews
	qSpyEcaWxDGDwFtEgEEhrhg7eaVznJ83C1/V8YqFBXFXJfZFFFLbPgf+4O66zkiR
	Dl1CwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pdsh8sxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:35:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so149854285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646924; x=1752251724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDGlOHr4NgcDVCXG2RQ6GCKnY1CV3e4EG2J6GhifJ9w=;
        b=b7RiBJOrdbK7KRYfxSEd7C4qshpsrwqPaQ9x2Kt9x9c/7gQbowCHPeNml/qH7QJNvI
         U58GBWWISl9KiIY8doCXhhtDE7Gs55SEJNMFZqmLzmQRbQzDn7+v09dPKFvSbqm5ARfy
         Wd3YxIGfFEi1mZlLkU2mI9DGvbYtseAmPza5i2IJ7xh+fpHUjYqI+p3uCttV/xXh4aRc
         Y8VwKVotj0/BIKyFVm/8h0y0Ht8PKMuepPYTvwQNbkyjoSHvkwnktr3JSewxUmOQjaHx
         /Oc8hsglInHyLkJ3XPrdFvBvbDiQOMa4X1hbB+KPNNXsjZ8rngYNHH9unN0fUg/CAnSa
         GGEw==
X-Gm-Message-State: AOJu0YyOmzxvjt45wk/2V7EJqNjAH6OwFIRKWnGsGyaRDY3R6zBtWL2R
	LBCI6+75FEN3ZCB1+a2XFJVVtg9n/rEmuarKyyx6GRqDA/YTNelr324ADjJ1TNWmVPNkr5Jv+uE
	TbCeEteUiMoLVz9sCfTobVlwrea2wlUcSJrYBCEWvfxnwVIeGvJKHJ5eMmD2TaXq2b4KY
X-Gm-Gg: ASbGncvaz6sB3DaeYj3qX36d/C6GUuGxtS5cy6j2HWulXboUOKFi0gwa7fYisgSSKPI
	SKuAwZkmxije+jcwNwLAaCL3vuUhdrr6y8pqSaKeAuhXC2QS2cg3wzSUTsxAZnLY9c7czAJ16bi
	1fWjY25FPqv1SUpE0HB3g1dCVucWZf6zRbPGjsxm2Hk2LdDcRaneyX0Du7bwFnIlzQCx6OtHkZy
	DB2dO6eYk2dVESBQRV04UAxeyf9eV6E+MK8U6NZx+I+rRHdp3RePVWOvaJoqmLN1bRc+LriOSMn
	iHdNCGKQP0fxkhR9bPXtY7R+JZOkz5kmg043mEwlciGv/i1LgDlZn03DsdYQ3FsgqrUqPVyhLaA
	o0e7DHwr193l7KeYwVFxmNBYPqxpxSpI9ppQ=
X-Received: by 2002:a05:620a:29d0:b0:7d3:a61d:9e4d with SMTP id af79cd13be357-7d5ddc5f858mr369919885a.45.1751646924203;
        Fri, 04 Jul 2025 09:35:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLgf6c81tKZ5NAfW7cyZOGRND2Paw2Q8ymoDznjdqog2ztFHlBz2dit3m7A9pCGMNdlb9WBw==
X-Received: by 2002:a05:620a:29d0:b0:7d3:a61d:9e4d with SMTP id af79cd13be357-7d5ddc5f858mr369916485a.45.1751646923757;
        Fri, 04 Jul 2025 09:35:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d33f3sm298321e87.68.2025.07.04.09.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:35:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:35:13 +0300
Subject: [PATCH v2 01/28] interconnect: qcom: sc8280xp: specify num_links
 for qnm_a1noc_cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rework-icc-v2-1-875fac996ef5@oss.qualcomm.com>
References: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
In-Reply-To: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=814;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CyevXooayJgTRHhip0Jc/dJHXf5dF8Ulyrh+9bR9yQI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaALEUkxoA8bxEagDcx68Lh+2gKsTDnXtlpWqL
 z73yeeeQoKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgCxAAKCRCLPIo+Aiko
 1ZoLB/981MU0dCx+HBy92JpsRasCdM8V5lTEdIQ5glGSvM8ujEutrmleQROs5AEti58NczfoDVf
 w3aW/RCp4hwoQzl1XnckcyPI57FAGlpIsKPVIjG5/MUdKW6tbcA7xlJWiFY2QBIZSxTSjxkQg18
 OfhLyfBlk9SohYp2u9OALgOsjOypY+xgY7Fwn9y4BJvGFTeaWqC5+kKCnv+L+cBMf6In97xRrcU
 7StHoIns5j4BrGgvgAwGsZiTsIboQZZ5/dfbojHPLNeGqaacpYlFuPxMFldh8mLl/SMj97K8Lqh
 l8+RZgWT4MEPf82rbJ0C/g7UHTnN2arKI9OF6U/ppawN8YAg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNiBTYWx0ZWRfX3J/Mi/oHhkKZ
 Bj1iVheu+hkfB9V3CIFrLNvagQdXC47q7XTGJZJKdrBGjLEjJ/g90XLjvS55N4kdfsPRsGCouaB
 hXXhjbnOZUdy8WoXGMp9paKCpXiAmL+D69msrCdCBp7OBAs5v6ho6dQxofn5IjxH6JEjJ1JKveV
 ozvlFF6xtfjppH8R3Mb6BoWEEc3I8CqNqsZmJr5ikA32dn0lXpnGJ6C6ftSxGlJG5m+MRL9B1hm
 phydcjfuhDc2MssfY+SroLHnne0hgf5qiNJhj1BQw+jl8fGMxLbYX91iZMX6gZ6A1ELDzM6h6ef
 CGTS9SaqA7+1g5kBxKbhPs/z9YKZOpn6G6YOU6Y3Kdwiycmkxt6YWUTUtIpnKMvZbK7/p25HdcY
 SwTdzh2Y5w1BrucX/bywofjU/xgoAZy7j9XovILFSVuTNXsyj/bj+KB4eLEffwVoAPxcmXqq
X-Authority-Analysis: v=2.4 cv=RJKzH5i+ c=1 sm=1 tr=0 ts=686802cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=lLMxHPiN_djQrzgEttIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: IA1pMmiYzYnxA6g34bIiEmE9a9_DW-bR
X-Proofpoint-GUID: IA1pMmiYzYnxA6g34bIiEmE9a9_DW-bR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040126

The qnm_a1noc_cfg declaration didn't include .num_links definition, fix
it.

Fixes: f29dabda7917 ("interconnect: qcom: Add SC8280XP interconnect provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sc8280xp.c b/drivers/interconnect/qcom/sc8280xp.c
index 0270f6c64481a92149cb19556acdc6e2fead39c9..c646cdf8a19bf6f5a581cd9491b104259259fff3 100644
--- a/drivers/interconnect/qcom/sc8280xp.c
+++ b/drivers/interconnect/qcom/sc8280xp.c
@@ -48,6 +48,7 @@ static struct qcom_icc_node qnm_a1noc_cfg = {
 	.id = SC8280XP_MASTER_A1NOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.num_links = 1,
 	.links = { SC8280XP_SLAVE_SERVICE_A1NOC },
 };
 

-- 
2.39.5


