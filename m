Return-Path: <linux-arm-msm+bounces-73341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A5CB54E60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAAC7BA07EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4810030AADC;
	Fri, 12 Sep 2025 12:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ok/Xn4Vw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C69E30AAA6;
	Fri, 12 Sep 2025 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681306; cv=none; b=dIPu+y+XZhSLHIVagH00RpNXGFycbzYyp5KBBbXX07XhYfxHEQVipGOMhvnHzsKxfHAeNIT8CfT3iNGujAQhjmEAJBH38wL9dez+3Am4PJurtzjnPNV/qVVJU737IxY2UbzGb7TqsNxVZZyVz0xKhOypxzEgFV0CTkJxhYV25/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681306; c=relaxed/simple;
	bh=O5W/iLg+SYsG8ivE2dyS3PJ1OuzWBrYBl+D/zbtlN5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aKf/7dGoDaRwW+MvND+ZHMFA2Q+AHi+T2PvMAnVlEwfEXeBg2dOLQvKXb70fx0VfEz8qGrHMIkrKPiwWEJoK6rUw+J9O+SmQlOvY9L0fVvVTKNMl8hMeQAm9IcGht3pAIjjNrX41litm+4G22qeOonYgAteBFfq/hIRNWiIgOVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ok/Xn4Vw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fNfG023198;
	Fri, 12 Sep 2025 12:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BY6w3MvDLSZbR17JImCgGxFMLaXFEJvQHvsEyXiClCk=; b=Ok/Xn4VwvENtkiTz
	NHAgAE7VpjnRg9VU7QxpH0cssO5HYLvYAB/MzI9ojYHOQIj8HY/KdtquRoGtaDSI
	pRkIKhSN0kdYSabFlhxG1ZCNhrV/8sFeHUdmgdCBYdrJNSAg1UMFvL9gX7dbtONJ
	EGHz1J7SJmW7YQXQxD8WuwzUdipLUe4Pi/CrBKfRBfG41sYEGa04FrFIJ+4EWdsS
	5u3n2sWo4V9Sd1YQcmUUD2Oh3pEhBNp5B/TBQgKgzHsnAF84aY2ExcjctmSdRf2V
	ZyhLELLd2t7QXanjkCmb+jMjjRjbvw/y71DfAJphwpQYCNzic78UeyhaNWmoORj8
	E3IRtQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2fs7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CCmJav001450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:19 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 05:48:17 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Fri, 12 Sep 2025 18:18:07 +0530
Subject: [PATCH v4 3/6] bus: mhi: host: pci_generic: Add SRIOV support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-uevent_vdev_next-20250911-v4-3-fa2f6ccd301b@quicinc.com>
References: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
In-Reply-To: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757681290; l=989;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=izD2tI5ZGDuScnRmiYlS6sDVEl3t132qF7TBwq8F4Xk=;
 b=qDfS9f+8c/u0k6qS+CNX/+Leg2u956TYri+eIo7nXplGUzdsjK9DXhcSG5d5ol7uNCD4WnSfD
 dabM2GIKLAXAN5ITi9dqYG51iwyrOe3+1NnQzj6rr3gzPbz9Rk/cGZi
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c41694 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=1E9kmim99rDzh7857o0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zMLTlOMwLeAfsJFO7M3ucCA77pfIx3wd
X-Proofpoint-GUID: zMLTlOMwLeAfsJFO7M3ucCA77pfIx3wd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX9WPH/APzwZBj
 saIHnj+8KpBVGMOzJzgL+wABnBTg3Kgy7PW0pl8QBG2+f3R2A6vN1shw50dRNu94XuqbHbCe7oX
 aa6guHx4Tylsg1hf2bgEF5M8AEpRyjnV+hi848SZVKSHvVZywk2xSczOBCrAWRru03k0MSqx81U
 TyBdSR2Ps6rd/DfqPvsWhBZvJDmW7qX1lIqOxXqO9/wl8BED/mKV/IgQQTwYlwlTiAiHgthPSTj
 p+xtAUt5xxZkuwyym486ngOthxPm/uggkrpQQGXNMR9OekkBxwNwhNWRmXZ0QF4oWTDcQ1YR1rW
 e5+F8eTAbZKFdwczThV43JtcTYNGGZJHQmT60A6nfptf9U6zCKBR7/ME5pr2XPIEn5y4HqUWEfq
 3AtE9Dmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

pci_sriov_configure_simple() will enable or disable SR-IOV for devices
that don't require any specific PF setup before enabling SR-IOV.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 6fa16975e320212a50e0b68ddb34db5ce711589c..6d0bade288265d9fdab8555c089c9153b642454f 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1685,7 +1685,8 @@ static struct pci_driver mhi_pci_driver = {
 	.remove		= mhi_pci_remove,
 	.shutdown	= mhi_pci_shutdown,
 	.err_handler	= &mhi_pci_err_handler,
-	.driver.pm	= &mhi_pci_pm_ops
+	.driver.pm	= &mhi_pci_pm_ops,
+	.sriov_configure = pci_sriov_configure_simple,
 };
 module_pci_driver(mhi_pci_driver);
 

-- 
2.34.1


