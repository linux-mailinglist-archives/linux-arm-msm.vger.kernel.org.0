Return-Path: <linux-arm-msm+bounces-74986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAD5B9DCC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6377E16E86E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D992EA48D;
	Thu, 25 Sep 2025 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N32WQhdq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84832E9EC6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758783993; cv=none; b=Jv+dhv6Bewhcqa4SDQl6LJB0HTiGlN5fOWtQdWJ/HXwiNxBDg67n+Ol/cOPMoUtl7UryB8WGAvcZhl30lgtSMsn+ZH1TQTHN7I+/IvL6ywkvEhuyCrn8LGoydCXfSMdw/TdAYtt6kCpzDZMxP03rDXvWf9gUrx1I1/TXz4QUAYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758783993; c=relaxed/simple;
	bh=X4PFHrUfP0rzxFwmdjEfi+hC/7SrgdK5syWA8qItXag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0kpjP7TL9qE48uwaEojsjCbsHY0y6UX4eXHbUF/IzyLsx4li2QINBP6cLMypATP3dkDJhOvX2pbh6ZLQ07401aesvjv4smI3jpG10NKLcw5pNICDP2zo3PFv3DN+SAZviygK20dTdj0Te+3bLeWlBkF25Ot4dhUtIwftq7aiBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N32WQhdq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0XFQX025105
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOHfeo7BhLeEryk+wi9AeSYQSxkknTWJ2p+RSrBRhUI=; b=N32WQhdq3ymRD3Zo
	i4qGopQmu+qbIGWgAlWPAKBRLjAyD+amd3AK1kTYO7nMAgcFZDLsIDafvzHyKRL+
	AmL7lroXwB35S+aHUKb5sZWzv80k0QoXCDw80ae4yRo/eNCh4FndPB+ruIHdK24W
	8NUkW13KHN6EdNYsU2fCynL4Hm5GTi1wk5ukRP2YBtIx/kbZqP5Q+fvD9hGpvRAQ
	Rxfbdo15Tv7AFRE+RBCWShwyLYRDxIZcpCmYrycuVAWHir6ylBV7SiB6yvdtWg//
	jIzaVumtPYmyYFoqoHWpQR2+YxIoh2gHBD4kMJAk8FACQ64bcWTrPfPf6A+ah0mS
	pxGqiA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv175bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:06:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3253ba05aa7so174585a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758783989; x=1759388789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOHfeo7BhLeEryk+wi9AeSYQSxkknTWJ2p+RSrBRhUI=;
        b=Qgsg1uvGwVIRiDOglJ8DsedcDslfQNR2GV6f3RmfMVOuxQVbiM77enUw7hLsVrB14S
         +pky0j+ki82HYUQrvYRGFPTX9IIBxzF91+s04o7Ge2hOR5ivvQo+h4yLD9hxG4mJboT3
         Ywub/KchjPhUUTseLtkJVpfeiQmS+kHdnfmyXJMSkuz+hH1naQucG8TxWW7gNCKRiGhB
         IOETtf6xx/kvvmAtjanmfLg7HnWJ6FPP5AHO0V/ui2goTAk8WgnsXCSdv2Cbyc/DzXGo
         vzS5uUoxeCh/1njYqdQUK8bDzoBEkRCyjL44vsBiPYO1h0iNxJq2nlEHhGJZ7lsA76Yr
         OzwQ==
X-Gm-Message-State: AOJu0YyWHoxkrRPAM97uwrC5dEBr7jEoFZBLNzSDPF60Zb2IP3fYATbO
	OeAW2uOokcBpETUIt5ms94LE2fx1BegAp0tfskzqtAhlUAqWYC1R1VIEurgE+hyiG3F71CLyVaw
	ahHmRm4AycK459Vbg6QCnjpcWFLNO6YyvSAeRUgeI0LSXerlpl6FBsDnyq9ZS6IuhPdTS
X-Gm-Gg: ASbGnctUDfUaH/1wPpV9qj4sn7ERpdkCxhN24Kocutk+QydXeITgXR/Z2CXSQBI9SDT
	fG7zbufbsmBVu4EsOKX8I6ZBCDBhB7iBSyM3JcDxgQm/NJa4E/89rVJlJge6wOI96hwmBRqxbFc
	NXElvKX9Iz3Gu3PLs+mtrtR/uyU41PXHLtWOBArcHCFK8R3f50x/dwzkYAVMCluIwF9yGG9plBc
	sTw6GaTUNJ+R0reLTJipawihzmdaa62Rj6mVbjvBcF6UOmPKa6JAcHRwhDRtCHtt6xN4dPVDoXF
	cKYYBxgwV2227LdqH1qnEknxuOkjhLGyuVZmzAxFX64YI9LI8S9NnXy8FhE9wU9qszq/KQPslax
	8SMZHXusy7fAu4HaXHmDy0ieURIgxuTm77YG3+Ep+bucjEW9qV7Hb3akd
X-Received: by 2002:a17:90b:1642:b0:32a:8b55:5b82 with SMTP id 98e67ed59e1d1-3342a138dafmr1622725a91.0.1758783988695;
        Thu, 25 Sep 2025 00:06:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFMPsmZvnd6dVbwELL53pC8yqLIr3147s8iCrXFpjob11Il+gTCOSC49HD8pbmJr5jpEtF9w==
X-Received: by 2002:a17:90b:1642:b0:32a:8b55:5b82 with SMTP id 98e67ed59e1d1-3342a138dafmr1622701a91.0.1758783988144;
        Thu, 25 Sep 2025 00:06:28 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:06:27 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:56 +0800
Subject: [PATCH v6 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-10-419fe5963819@oss.qualcomm.com>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783910; l=1866;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=X4PFHrUfP0rzxFwmdjEfi+hC/7SrgdK5syWA8qItXag=;
 b=w15jBmT/se5LKcZFvbQZtG5NncJK6g9/eYBpM53QIj2XHBW23jnAJfjZfDdu8EV5FM/icrIMI
 BaasMjAbiAKAsRn7tS72IxN0cw52XUOulIwMc629p4TQfSAOO9IN5Po
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: nyK_uSku8EoZsagLqPOGFrFU7C09AuO2
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4e9f6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RloG_8Ug8mropJZ47ewA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXyho5v3D3vMF1
 RL37GbnWXnI+6m5NXQGQLLy0DUy3cPfN5mHnak2XMBuCOeVpXksfDMsG+bBnpaPocyAr0oy9rO4
 rI2/Wvzp/k+HUt74igTxl4IQMvqcVv/gYxIEtHcVKfJf+nTiKedVSKEtiSF/9/CZm11n5TKCAwE
 wzPni+kxKwGDrMOwcSS1DeNu+BmWLMuEU8JU/hD6BsjrsSGDTMmIzMxqVpeoiOgz4DBqWQ0jRMj
 eBrX/ot9VfIBTN2jFas2Xzi6Io7fX4zBx1vYcsd1P9OeYAL+qPStmFPFo+DQuR55BnOpWzXhhrD
 1aQEqqSy3YFa3Qe/U1zCVMi+cUv6HRlitGLfWViDM4kXLWAKCQMgbWZGTJOAOTb0uaOv7hSd1wN
 BlRfzsIy
X-Proofpoint-ORIG-GUID: nyK_uSku8EoZsagLqPOGFrFU7C09AuO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

When both USB and DP PHY modes are enabled simultaneously on the same
QMP USBC PHY, it can lead to hardware misconfiguration and undefined
behavior. This happens because the PHY resources are not designed to
operate in both modes at the same time.

To prevent this, introduce a mutual exclusion check between USB and DP
PHY modes.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 3580c19fd62e02aa373cec42e9f53143f39214df..d84bf68940043bce13565503bb34796e653adbb7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -666,6 +666,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qmp_usbc_check_phy_status(struct qmp_usbc *qmp, bool is_dp)
+{
+	if ((is_dp && qmp->usb_init_count) ||
+	    (!is_dp && qmp->dp_init_count)) {
+		dev_err(qmp->dev,
+			"PHY is configured for %s, can not enable %s\n",
+			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
 static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -673,6 +686,10 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_usbc_check_phy_status(qmp, false);
+	if (ret)
+		goto out_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto out_unlock;
@@ -726,6 +743,10 @@ static int qmp_usbc_dp_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_usbc_check_phy_status(qmp, true);
+	if (ret)
+		goto dp_init_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto dp_init_unlock;

-- 
2.34.1


