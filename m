Return-Path: <linux-arm-msm+bounces-74276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB227B8C6BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 13:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E41B27E0309
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 11:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5295A2FB96A;
	Sat, 20 Sep 2025 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYTlVtsc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917CC2627F9
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 11:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758367885; cv=none; b=iIULkkD+SL9w6pwr1cd1aqxMlMDgB9m6UuqJGpzeMW7ZkDGPi5wA56rWI+FNygiG+1RwCmGRg4pFH+m2lJ+YXVHY/SFDa1Giw2moBVnONJw6U6dExHioD/mX6pZ0r46uHWoXNTiSWtTWzYtJiqRSrVk42L8JE1ZJIjNxbMKvIz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758367885; c=relaxed/simple;
	bh=wRFzW4gTxw8RSbwpMQZx26SwQa/TSHZp7SP5PI7C/IA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fn3tYDU5yisEUM+zpRa3ruVGPKObabPzRZyrXCfpQDc0MWWapxR/211FT9zJm+L+mluBiQVl5ebfvrpu25aGAE6/Fj/raPaRMlmQU5A+IOolJOAMyFpOWFhN+D535tARmLVP9ed7FZdPFE9/7H35F+7ZF8/sLVKFeGAIu8T6WkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYTlVtsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3PmQd018187
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 11:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t2PWzWr+rmTAvxWPqAkysS0sBuB2h0DCVbB
	pWs6MT24=; b=kYTlVtscNrzvQuS/Nwh+4aZA/gfZ32XyClXtFdtfoejSUezMiKf
	TSk3wj0It1Auae/zTngf7dispx4oOGBx6t/lPmLzOMl7sLP73RzkQSqJSqFsndyY
	xBfEkzogyJhnwdm1txuHg4XN3A/SZZhXlNAn/D6IyvJR+w81oiajEPKpKX0NtXD2
	nZPUqKBPtdc+gI2Bn3Z6JNX0+ymgXtr566yo4CjUjJwLiSdkoKHukrKGHGHJvebj
	2PoP1vICOWKeLmYPmVz6Smh1WanWIt7g0359JQbH6kzGubkKLmpKDiQPH2wk6Isv
	Sv5srQXMSN+lF5OK1ZGWj6htkQY5k4u6klQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mbv0kyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 11:31:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-252afdfafe1so30923435ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 04:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758367874; x=1758972674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2PWzWr+rmTAvxWPqAkysS0sBuB2h0DCVbBpWs6MT24=;
        b=UGDRvGC1pHaGT+09MIMRGZwq3g6DCs13IMUdbubtY2Rpwcu71mEQvyH8WmXt6BiCPg
         jrCPUHqeMGA82uSc8R97K96OW5uerSpbiKkw7sy6k2CDJdvQL9djT+2+R/NbEa8WyNqx
         9phVZwh978Ss+u0DnRGT0YhVdZtlLcIytFy559vosCT0wMN+MPMRx25OvdWWNAGWq70O
         WYnSfVK5DrHzYZTbA7QlGmf+3pRij40JsVcw0UFQ2//rw8j9BX1AJd+c4hP8srda6O1K
         ULTSUjRwo6Ev/ZHTnxrY7FtZ3HL98nE79h1rXR8zDkzinuXoJcsFAUAqzE1eiKxyu74I
         tydg==
X-Forwarded-Encrypted: i=1; AJvYcCXtb1JRTSqv9XhbqTCUqPUn0IQziIQM01t2V1S4JhRk8wlDG0r9e4KdUGjQbK1TiT2MYQzP6nCnjZc6id+1@vger.kernel.org
X-Gm-Message-State: AOJu0YzzqQ2yAtBNTbVoBOxV6IwfmmieAEDFj/O0Mepdr/1oC7ivS77P
	bxCgp8VT0ssj9gGLAoYpnBLAvSQwhdETUYrbRm17Oa1E6FtwKN+vsr9mk8ijR29WC4psi52mZ0v
	5msl3n/oDCHjH2FiHZH2aFhENDQaaaGo7sQ2MuwhEyxvZw2ATrsIt2GiBQdner/gUq943
X-Gm-Gg: ASbGnct82bg2O2fj4jaYd5Y74yDsr+tqqPJXjA3LMLiO1takgg0XO177eX9PfNbRyIs
	RRUgy82wNpRmxUS2duskDvW5vZXdOrdFwD05lJLmj9FXOMovcTVMpUw7LMiy/gu5pSm9CgVjlg3
	SeCRCNpB3BmMQHTcv9PuU/iFMcJTDHai7u8KHBAj+CqWiVShrv4sCMTc39UP5YQRJdievpi4Qcf
	fl0QHLVBZbo8lRbl2llt6Cq3gfKdxU8bnssZDq+0zgeyUiQttmsFYvAImrH7hS8oJH6Rnzc4xIk
	Iih4X+oSTxNwZ6pV+FwBtQ0ZpmnhJ6rTWr/V93miSfIZqcNOeaY1jmlQ9dqJbsWcmRerXzZt0+j
	0XeYPPlNex8eSD13bpXjHVYVD4DGVWQZ+K9GxVK3s7GGQkAS0iw/Vy+Y6UmpS
X-Received: by 2002:a17:903:40cb:b0:26b:61d3:cd66 with SMTP id d9443c01a7336-26b62201c03mr69924745ad.29.1758367874213;
        Sat, 20 Sep 2025 04:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHhe73x0XLBwB2louUzFMWyY5HexOtrXj3J/yR43zYP6wQ+HGnLlOCgGTD/Jfpqkyg5lA9rQ==
X-Received: by 2002:a17:903:40cb:b0:26b:61d3:cd66 with SMTP id d9443c01a7336-26b62201c03mr69924465ad.29.1758367873744;
        Sat, 20 Sep 2025 04:31:13 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802deb3dsm81109635ad.93.2025.09.20.04.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 04:31:13 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: thermal: qcom-tsens: document the glymur Temperature Sensor
Date: Sat, 20 Sep 2025 17:00:52 +0530
Message-Id: <20250920113052.151370-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZcAdNtVA c=1 sm=1 tr=0 ts=68ce9083 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=zzSzb4EmsE6u5SiZLnAA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gWu1mwkeGOABTV5Py7P6T_8K_NV4uuOp
X-Proofpoint-GUID: gWu1mwkeGOABTV5Py7P6T_8K_NV4uuOp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMSBTYWx0ZWRfX2vOIbE8UdLy1
 eUskRA5xz03rtsJO9HFSR17wnS4SfZb/eVZTbfe4NaBzFWNwyLCbpK/USV/taJxE7xF+e52iDso
 /2gvvrN7BrKm5aLia/Tz2kPBv3Sq0yFrtPLtCVp0oteikMCHOyFvgtfmRmRKeDr2wY3Fm1DazjA
 5jUACZw2+Ec26wofov9eyrE4cLuEfneGYcoeEu/KOAu8JxA21l76C/Zq6952Ol52E1F4Fd2H1rq
 4RzgjDwt4shrtHTckMFnw/oSFh3Ts41ENb6ZJifHzJHcfXIqZ3+r4X885tjIRrY1qdzp/qQ+Puq
 hdn10rzPadLYxYiuneOArA4aAanA89aPTy9FEiTyE7upIiCxK07nbcKQcpI+hWFemvBHRjtsj74
 qAi14VjE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200031

From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>

Document the Temperature Sensor (TSENS) on the glymur Platform.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f65dc829574c..bfbacba1dc55 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -50,6 +50,7 @@ properties:
         items:
           - enum:
               - qcom,milos-tsens
+              - qcom,glymur-tsens
               - qcom,msm8953-tsens
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
-- 
2.34.1


