Return-Path: <linux-arm-msm+bounces-108451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKTpFx1CDGq4bwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:57:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1289857D004
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CBF530A02C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D5E370AE7;
	Tue, 19 May 2026 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BThaFmD3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzGCluYl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3EF32B13C
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187694; cv=none; b=C9IekVp+jy6yXwpP3FlUs5DrS1D4j6keBlMc79C+kYB6N17eNGJ4EV3GbOW0AcBKoGRc0KSGZ4WS/IJoJ1bF35utz4nqacudyXM5VAlYGUO6AvAveqw3zK3plEI6uE5NYJZ1Q6TSVuyK91NkaW+mZSHFbN9/dPWu2r6KY554z64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187694; c=relaxed/simple;
	bh=APxUCObf8BVPKtv0F42GaM+94TzT8vxNnWzyBapE4EI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ktDzZDnRusRN7Xd67VxPFbLl8GgpnxplS/Tzox1dE+EegrPJpsxbDYHxeFlUhBmbndT40/poAx8kFoj7Vg4eg5+Bgl5GkDNRDMQJzK2G8ZWF2wOWmwzgqoCQ16IOEyfbWZJDY35Q2EIhnap12OSeG9w/vAeaWulfIMcbuZ+CowI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BThaFmD3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzGCluYl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9LphU4062966
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gDa9ZMVWMhuQ1GptplD39wcf8xmC1uYPFbYSE44QLjc=; b=BThaFmD3LgMtG9hO
	r1zVtSH4x1z1pj85LWEZMYuTJjKITxdDUHwKwPhrYmbEaXRMA/j0U8iMrFNE6sky
	NzzpoDXqNWRyxG7OaNjke+Ap+R84oUb5I8WjhJrOLrnf9Lz0C2OqLPoI0vXA+qLd
	iEkqztjoGjEnfk7DvycEJMklAt0VBsCxHSQS1rJTRIfXdww9xgi8+2oMUD3FbqQf
	bxxiK+Y3koykq17E/cpCL/hhrCo5wGWyPdaMtPRrrSjYjbt5LpgTxe6dTPgW4ccb
	4RLThpCPTnCtZovdpiOrUw+sXDff8jKgaeg7wlm1YeAOEk8l85Nhr/495w2u1PRR
	WtOfJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8n5u0b4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so100104331cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187692; x=1779792492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDa9ZMVWMhuQ1GptplD39wcf8xmC1uYPFbYSE44QLjc=;
        b=CzGCluYl1YSWCuJvqGNlW5uETxEYrRJMQDe7r3U9eJxQYUhT/D05tLdT2dmrscCqfa
         VYfU3zajlVZ8amaS4L5QECpv3RvhDkUXCA8y0zqEtskFpIuFD8vM9FT8t7mveMN3EeLT
         6/nHzm2ynznoIOCBglPH0jmcc9E76RauvTMPiUXl0BYQUqnApoLKWckz3i9OLpt6KzAN
         Hw/r/YBJJEuWOn0azRl7AmBdWjABEcMUBJMnrnCgXQ4o0gr9K7ihWqZlY4PLs+qn0tLp
         7GmhZFTUQODmsKhy4frwLIrwtOGnEcyWb2GNRFSdIU6s+OIQek/1YqpHyzqNwQxkrOEF
         Ik5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187692; x=1779792492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDa9ZMVWMhuQ1GptplD39wcf8xmC1uYPFbYSE44QLjc=;
        b=aj2lrzhLDobEsub94uiiqLb4vLWnhZKhDoBFzuocRre8luFSLyYS9a7d7iBaSLNXv9
         kurj5lOSajMGxrAtzBsyol3/8k3mDLW0NXAQQpoXjcqGzJAITcTxzY3w/eJxCBhgSKPG
         pZ7XTwlXcHaK15qXGIy8g2IBrMmbFfHmE/xWqAnlSUIrKEYyAnhJGFjXDKkdxXyusQki
         pC4s1RHi8YWkIg/yn3wfsbT4YBdvaq1mjImN1AVOGO845bAOFM3gVsoXMO1Scs44rX/M
         9GLkiYHnZp6zpmGm3IiSYBhYQKFt+AU2hthc+429m7ETmcEpJMjN6plxwNFHY9U8wfiV
         9Rug==
X-Gm-Message-State: AOJu0Yw5g68mi+1chqfvCRMETTB6tyutJOrengEvPBZM4a5wet/Y33sX
	f2yCAv1LU+tJNlmqKk3ZBpFKVUTcK6SjK+nGEtk4bqkyTFGdTDlbl+6goDkGly0Sq8P7f54uEqT
	9IcAGTbRH9Avo5ISINTF7U+k8x/sCms3mSaN8UEFUIcCTUwXzNq+eXVKPKyKT0beHkGlq
X-Gm-Gg: Acq92OFVAYxEZBVMCSCgr8Tg0AUGtMHp13eIlDR9U6ajqoKCKF7iXw9CBCp+MrtIjqB
	2w9eU9B+mOM1RDT45fOIsX9qxDUf8NlYYytR1ChZquBtmuGrxds7BRelb/6ejzXvOYicIDI+ijb
	ywUrITwsKPS1GkX7ov1Sd5LXFTk+f+Up6X9kpGmTdes1zyOUR3q79QQH85mUI0JAzM4kwrf6/WG
	7cbY581ibUJnrqS/99oPJNgSI+nDzOPURM052Iji0j1DcOENompWQCAhLR8xCpnzgcO8/HUp2wC
	viik40ggoR/mcUTJ221fkvEd63gXaIE+EexN6Te5dthRco/v/PZiu7V3hB/0EDa8pUGmJRC0FEN
	VXdfo97BMteAI8/y3J4FrtF/dcwuwR5bEmj6gr4MQUhPHe+WcMyv5Xq8lUDuvJtLxIj60n6U+PI
	PX6Sy/3vmlF0vx9zN+OHNF37Xu7rehfceYwLQ=
X-Received: by 2002:a05:622a:544d:b0:50f:b17d:7e4a with SMTP id d75a77b69052e-5165a2766b0mr269662461cf.57.1779187691893;
        Tue, 19 May 2026 03:48:11 -0700 (PDT)
X-Received: by 2002:a05:622a:544d:b0:50f:b17d:7e4a with SMTP id d75a77b69052e-5165a2766b0mr269662001cf.57.1779187691409;
        Tue, 19 May 2026 03:48:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:04 +0300
Subject: [PATCH 2/6] usb: typec: tcpm: qcom: prefer VBUS supply from the
 connector node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-2-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=APxUCObf8BVPKtv0F42GaM+94TzT8vxNnWzyBapE4EI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mLbDeCaZaOwdAtlRsxQUtqIaE6KgbcJOqB
 4UxcFqW2qeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1aE3B/wM4WHeEGwJ8kusNlI/jxbyTXEEuI5rSqyleiLE/17Ept7BtiW9EI8ljRMaDlK95WE6MZI
 as8oX1aKHlLRAGoOy9f/QLlqTkpUAELGv7UfFEdKwlKn8qdzwmUrAYlZZyYl1n9tWVft8FHniz+
 FHNwB1hG4c56CCQ9cl/38ftQ07hsHJKEt7R+BCRx6DTrqX6JVKDlC17Kj3v6LfI22VVZNYlRGG4
 LQEpG1w284WX2/02V9zwAjuCyViouhT6S16PQV8uA1bUJrYcg2787R//x5SQbtHrN7anSBSIDVT
 8cJzshglqnRP2AepWiUDF54158Ek35ONbsHkdycPuKFsEsWn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MfBcfZ/f c=1 sm=1 tr=0 ts=6a0c3fec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3Ip0nfeMyQuR1jy_OcYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: jU10Fzd8BqzW9uk8DJsrwG77D7J5bm8r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX2bh9eJ9DSOAD
 kTmNXmx3X++BcFBXcWfYDcNC9LNxa0sOVAuFTLMcW1RKv1+jeJuce+cYlXNQ3phQ8kzFlvTKWkf
 uXkBSln7aewRBviJBIhRoh/dHTAXYyUESfzAYBnFZKsHlfytztO2o/cE5kK12GXRi4RoN3MNQBm
 Y4mF1bdb3pZfvnm0yb2ejDrkboXY39ehAs8ri4ZLCLaBpe36dmAvPtVzWr1W9/egJ0ERHvtRvxA
 auCtgfTE2kPfb9SMor4J1QbybCYedTT5EbqqEoTIvPwcvVWmTRGiMVxTaMAL0MoTxXsj/aXOkJy
 coC/0hoxgpIDfgypq4wpS7wCVBirkwedybNCLtImhkO+lDpr6rzLG4IJboS6ZU+Zg1C1FAt0unc
 heqURP6vPBb/JY1+VNc9BTcpS4y0Gr9gUSbsj7izKekdYhHjJkJ4PqRGo29kFcey4rYs5xCtlNL
 KzPTnIX12zrL634cT9Q==
X-Proofpoint-ORIG-GUID: jU10Fzd8BqzW9uk8DJsrwG77D7J5bm8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108451-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1289857D004
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Current way of specifying VBUS supply (via the device's vdd-vbus-supply
property) is not ideal. In the end, VBUS is supplied to the USB-C
connector rather than the Type-C block in the PMIC. Follow the standard
way of specifying it (via the connector node) and fallback to the old
property if there is no vbus-supply in the connector node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 8051eaa46991..429bd42a0e62 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -704,6 +705,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct pmic_typec_port_irq_data *irq_data;
 	struct pmic_typec_port *pmic_typec_port;
+	struct fwnode_handle *connector;
 	int i, ret, irq;
 
 	pmic_typec_port = devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KERNEL);
@@ -720,7 +722,15 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 
 	mutex_init(&pmic_typec_port->vbus_lock);
 
-	pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
+	connector = device_get_named_child_node(dev, "connector");
+	if (!connector)
+		return -EINVAL;
+
+	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
+								   to_of_node(connector),
+								   "vbus");
+	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
+		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
 	if (IS_ERR(pmic_typec_port->vdd_vbus))
 		return PTR_ERR(pmic_typec_port->vdd_vbus);
 

-- 
2.47.3


