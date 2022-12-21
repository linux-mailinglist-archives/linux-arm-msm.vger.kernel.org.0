Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2B96534D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 18:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234786AbiLURPs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Dec 2022 12:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234641AbiLURPV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Dec 2022 12:15:21 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0819060CB;
        Wed, 21 Dec 2022 09:14:42 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLFUkJq007601;
        Wed, 21 Dec 2022 17:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=kTRNd0ZWlY5KuPVYgpIN99RcdLmVOyb2yNRO1k0We5s=;
 b=Ip8nBKYGA0hGRZhc9nYHz3gnoI68/ecFKxjfc4Ey0xBZr2QJ6LGav7xG9q8ts9Kl5DGx
 BHzd+OyN/J3PVRBEVx05TXjUnrbxX5RUWQ15iG2ySuWVk1TZ43m5VTZXd8eu8soA+HEH
 nfIoUAvJO0JCmFSEqFNwm12tFfCm8I+KV04kCJ0jF4sCIPX2JVTLGAaVZUbqRTt9gqpS
 EvQB8ym4+C5yTNOw1bqNGizHgjBonfaTHbz0P6/z2pKFXlTaz5hGwgQg7grI3L7Rp0e8
 QR0YQgj9W4FM+Z6RMvsxi19c4z5ZK9k/3QdlAlaNc82CIMz1i++adecQX/2QlSVTMUaM gg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mkkxctbj1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Dec 2022 17:14:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLHEUCs024137
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Dec 2022 17:14:30 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 09:14:25 -0800
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@kernel.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: [PATCH v4 1/5] PM: domains: Allow a genpd consumer to require a synced power off
Date:   Wed, 21 Dec 2022 22:43:59 +0530
Message-ID: <20221221224338.v4.1.I3e6b1f078ad0f1ca9358c573daa7b70ec132cdbe@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nxnlkiM3p5S542DpfjpQ4Typjqz_ei4L
X-Proofpoint-ORIG-GUID: nxnlkiM3p5S542DpfjpQ4Typjqz_ei4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_09,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=938
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210144
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ulf Hansson <ulf.hansson@linaro.org>

Some genpd providers doesn't ensure that it has turned off at hardware.
This is fine until the consumer really requires during some special
scenarios that the power domain collapse at hardware before it is
turned ON again.

An example is the reset sequence of Adreno GPU which requires that the
'gpucc cx gdsc' power domain should move to OFF state in hardware at
least once before turning in ON again to clear the internal state.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

Changes in v4:
- Update genpd function documentation (Ulf)

Changes in v2:
- Minor formatting fix

 drivers/base/power/domain.c | 26 ++++++++++++++++++++++++++
 include/linux/pm_domain.h   |  5 +++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 967bcf9d415e..84662d338188 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -519,6 +519,31 @@ ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_get_next_hrtimer);
 
+/*
+ * dev_pm_genpd_synced_poweroff - Next power off should be synchronous
+ *
+ * @dev: A device that is attached to the genpd.
+ *
+ * Allows a consumer of the genpd to notify the provider that the next power off
+ * should be synchronous.
+ *
+ * It is assumed that the users guarantee that the genpd wouldn't be detached
+ * while this routine is getting called.
+ */
+void dev_pm_genpd_synced_poweroff(struct device *dev)
+{
+	struct generic_pm_domain *genpd;
+
+	genpd = dev_to_genpd_safe(dev);
+	if (!genpd)
+		return;
+
+	genpd_lock(genpd);
+	genpd->synced_poweroff = true;
+	genpd_unlock(genpd);
+}
+EXPORT_SYMBOL_GPL(dev_pm_genpd_synced_poweroff);
+
 static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 {
 	unsigned int state_idx = genpd->state_idx;
@@ -562,6 +587,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 
 out:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
+	genpd->synced_poweroff = false;
 	return 0;
 err:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 1cd41bdf73cf..f776fb93eaa0 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -136,6 +136,7 @@ struct generic_pm_domain {
 	unsigned int prepared_count;	/* Suspend counter of prepared devices */
 	unsigned int performance_state;	/* Aggregated max performance state */
 	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
+	bool synced_poweroff;		/* A consumer needs a synced poweroff */
 	int (*power_off)(struct generic_pm_domain *domain);
 	int (*power_on)(struct generic_pm_domain *domain);
 	struct raw_notifier_head power_notifiers; /* Power on/off notifiers */
@@ -235,6 +236,7 @@ int dev_pm_genpd_add_notifier(struct device *dev, struct notifier_block *nb);
 int dev_pm_genpd_remove_notifier(struct device *dev);
 void dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next);
 ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev);
+void dev_pm_genpd_synced_poweroff(struct device *dev);
 
 extern struct dev_power_governor simple_qos_governor;
 extern struct dev_power_governor pm_domain_always_on_gov;
@@ -300,6 +302,9 @@ static inline ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev)
 {
 	return KTIME_MAX;
 }
+static inline void dev_pm_genpd_synced_poweroff(struct device *dev)
+{ }
+
 #define simple_qos_governor		(*(struct dev_power_governor *)(NULL))
 #define pm_domain_always_on_gov		(*(struct dev_power_governor *)(NULL))
 #endif
-- 
2.7.4

