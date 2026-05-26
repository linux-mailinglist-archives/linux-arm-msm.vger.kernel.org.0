Return-Path: <linux-arm-msm+bounces-109783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCGaNx99FWpEVwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:59:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F365D4893
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7B1A306125F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148033DDDB4;
	Tue, 26 May 2026 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPFR0NuB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6P0Ands"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8410F3D891A
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793008; cv=none; b=jF/Ec4DblM3CXpVo4I9zVFv1DVRaRbPRc0gJkLx14oadyWbzjqSxrUnVq2xqclLJKhLKSNNtstGIEzYaVxddvYHNZ4jzkCX11355mc3RmrkbMOmcDMiI5YPFvjh+njV+MlqtDLKrfdjOHYn/EBW1ZSDx2f01PDTd1kPhicOBRJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793008; c=relaxed/simple;
	bh=fZUAHgFFpfaJAmoSiC3JvpGwOqresAsnjpVdJZz+XwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k0P7r6FkFXRn4qQ/OYkocpj/G+EwwPtQSAH4Je+V0byvY+KTHpR22de5wYbNbOqhVggr0gFyS5uS3KQKAPOSmJob3vUUfjru37NWpla9Zn2PoYPgjUHCgTRpd+KxueQ9NOuR3NiTeW0iinJpQAZfFFbw/S+wIGRgUA8/M8GRUnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPFR0NuB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6P0Ands; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5TNo31802378
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9I0llgMQyQrJrsOKaMc8lL+c18neUzInEhm5z0qbiec=; b=oPFR0NuBr4KGD5Bc
	jdsy912si6pdlAB0yy3WQtUXxPBkBN96vXN52Uo76dNJpWJxjflYXhCwG2suEstv
	0jQuvsfrqeqDrhN8gEZ/sP38/rruTV76A4CmBtOYmO/OncRIxo5/ob0sQq1d8MeK
	7IAe7c/w/1kqbfx6QSSbcUGfM5rEttEsaEtBuvqxtzJDgLejDKexvdP7TNKUInWI
	6f7SYtpMCJqtskvD1CjZ+p+c7hBK68EsoTRRIHdbgcxfi56o6BT22F62MFhjrQUg
	Uid1zI+1XP7/TvtBfXr5YsMtlrMuEU7FTns0gugQIWW2U1NWQJ7Lh/CFaxcUVfjv
	MKtJNA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqmcdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:56:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso11191304a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779793005; x=1780397805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9I0llgMQyQrJrsOKaMc8lL+c18neUzInEhm5z0qbiec=;
        b=H6P0Andsj3G1PS49VPPkYipZ08nymUi7h2YtNMIc++ZLNQSjcy0+7lotvA+1bbwQEv
         2H9lx5WjJKhyfSN7ENxZmoI+AcRaLUSQAvCYhP/DzXSmL6NZeBXTtTgt6tzuqR9BdKCn
         dmUfoLZzqmhkRw/v19VBnAYaVAZ3SyIoP98Gbx6F0QPD1oBeZDeRTdixikD8NVQcjnJJ
         T3QIXIosmYc6QRhXfeokxQOgF5f7bMcXWpPyNzeX9IUwqD4pxRcHyzyJJa8PJMZOce2g
         UV2uvM2TA0cjhW7AGW0QPGDyx3dRfBR+ECCIfcJRR/s8YiNDT0AHZNXwE70R9BzKHimD
         64Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779793005; x=1780397805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9I0llgMQyQrJrsOKaMc8lL+c18neUzInEhm5z0qbiec=;
        b=Nkl9Lj/pygihnOeGYQMpJ31PJ6cYMxaMjSBsJse+45Z84p5gprQgCbNqlKRkcSZn1/
         pxWtpwQ6ZAJSTeKSwOZ+dwSZaeOG5lxsiQm4QrgwvKpGjr2FJHpM4tpnHuxCxR1SGtXH
         GbYU4PPU5nDU8bwh0OKi6FSPTNIBbhoK2UR0NlNtKwdXLY6BebKUx1jYvJ7g1GZ/8hIg
         hWb0S3K1anx8qqMr4cseZKzZdGqytBNDw38jUpBNZ7qGeEAENdSy91jNU8OM6Q+Hxd15
         cJN9LScGk19Jr07vwvIx8tjauTgWVSLwABqPp3YvZD93zSjCrRJrd87kf0DFkJI+5wTm
         Ug+Q==
X-Gm-Message-State: AOJu0YyWxPf9F6/rXju0cM3Q4cGRu0KSeaXkXgvu2rS8IBT6McwnQvG2
	gaXleP4QlwX7QtphwZEch5dCSzAITYI2kmpFclVOSbQVlfJLPJaqQElCxuP1bTRvJ8tMpuKnXbr
	b5uKnuuTozfQhhs+rcbD407KZHg2KUA60HS3gIBHYuqRDhrZFSr5u3Z2Jb6ihAvvOCRSM
X-Gm-Gg: Acq92OGuM42yYmEoRAhagO4MiVLRGw1kPXUXi6PuefCnFHodCCIMuRUy88FsIx5isjY
	/GCXA4rlwEJ6aL778GUBlDe9wiEN1CPWOHuJMLtvHrmeP+VNWyf5OLaGBs6hExhxRQbSlo9fue2
	ltse72aL+Is0JdiKBIn42q27b5PMIxTodgO2jGY4DSgL2gQjtk/aKsNnO/CLz4rW5XP2mr0eimH
	Zd3/mbppF80SewaKQQkeI/lHehtU99aCCKBpvUV4cMeAlAZOw4lcFE96myYt39Jcgd/Yd/EI2Xp
	AgQQ4ixYeMv02L7NiD7onOuCIttzkXTsT5wHujjXguk1ecQLxNux8wScoT74LVx3RF5musL6mpU
	Xps5CcUo9njhM5uMOHINiLTm7zyF+a/vjhabmM9V0
X-Received: by 2002:a17:90b:224d:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-36a6ba2a4a3mr13051818a91.1.1779793005071;
        Tue, 26 May 2026 03:56:45 -0700 (PDT)
X-Received: by 2002:a17:90b:224d:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-36a6ba2a4a3mr13051770a91.1.1779793004532;
        Tue, 26 May 2026 03:56:44 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d9416csm16601070a91.3.2026.05.26.03.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:56:44 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:26:09 +0530
Subject: [PATCH v2 1/2] iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ with
 ADC_TM auxiliary driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-gen3_adc_tm-v2-1-702fbac919ac@oss.qualcomm.com>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
In-Reply-To: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792992; l=6203;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=fZUAHgFFpfaJAmoSiC3JvpGwOqresAsnjpVdJZz+XwA=;
 b=y+Ql2hF1W/brwYSCVSE4Y8tkU52NsUsCkar613/yUFX2E6ZKszGVZx2cG+3NBnxY7qP4Q0u3y
 WD0IZKPW6LYB7zAY3cB+4XgKIaKjiuA3Jxqaa2QGA6MG0lVlox8S8kj
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a157c6e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=g_6YNVtFXVELDihYPjMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: LO36dNOWFsQYZosh734z7_sBAKeehel9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX2PgGlfFpTx1m
 evsZYp0irWnm/7G3z/0RZnYZhTgKr+PWogKc3cHocucLezSUX8Ap7F/GaUS0LNjqGh26ZxOEEdN
 a0jEosBZMOICan5g28PQPsnCKCNC5XKcy3ilD53OgaG6wqW4pJzrMGmrDyN5Z/p+KHPiXPwTfIX
 VYMkYeVuTBb90c6jZ9LZKBhGaZOmWO/KicqLg20H/0qMqNXsSEjBnaKDuEvxuFuCGf/X/g5JKGQ
 5MQEb7ncDgCjRxawLQxz12HFeHJnr+3hNGUcS8FyFPJ96txVZYLOdIj/Gc/En4ngdei8oPJKFA6
 VeXP9kNlXUbWv+pqLwa2c+STZ9gSpBsoKUZAN436u1JZgEsOfbnBFewcpNay9iZRS3FAC1Ty9d5
 VxNmDJjBa8aK8S6IfeGPO5mdkM3qwATt8M5n7w6StZoJ4TZh5qEYqDsIfNgJYq0aeZ9eJ9JCnYW
 VtsLKDEOD9PtlLd/2YQ==
X-Proofpoint-GUID: LO36dNOWFsQYZosh734z7_sBAKeehel9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109783-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64F365D4893
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SDAM0 IRQ can be triggered for both EOC (end of conversion) events for
immediate ADC reads done in this driver and for threshold violation events,
based on ADC_TM thresholds configured from the auxiliary ADC_TM driver on
TM channels on the first SDAM.

At present, this interrupt is handled only in the ISR in the main ADC driver.
When the ISR is triggered for an ADC_TM event, this driver notifies the ADC_TM
driver by calling a notifier callback exposed from it for this purpose.

To simplify the interrupt handling in both drivers, share the interrupt between
the drivers. With this, ADC_TM interrupts on SDAM0 will be handled directly in
the ADC_TM driver, so remove the notifier callback and all TM interrupt
handling in the main ADC ISR.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/iio/adc/qcom-spmi-adc5-gen3.c         | 66 ++++++++-------------------
 include/linux/iio/adc/qcom-adc5-gen3-common.h |  2 -
 2 files changed, 19 insertions(+), 49 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index f8168a14b907..3085188e55d6 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -56,9 +56,6 @@ struct adc5_channel_prop {
  *	requests from multiple clients.
  * @data: software configuration data.
  * @n_tm_channels: number of ADC channels used for TM measurements.
- * @handler: TM callback to be called for threshold violation interrupt
- *	on first SDAM.
- * @tm_aux: pointer to auxiliary TM device.
  */
 struct adc5_chip {
 	struct device *dev;
@@ -70,8 +67,6 @@ struct adc5_chip {
 	struct mutex lock;
 	const struct adc5_data *data;
 	unsigned int n_tm_channels;
-	void (*handler)(struct auxiliary_device *tm_aux);
-	struct auxiliary_device *tm_aux;
 };
 
 int adc5_gen3_read(struct adc5_device_data *adc, unsigned int sdam_index,
@@ -287,23 +282,21 @@ static irqreturn_t adc5_gen3_isr(int irq, void *dev_id)
 {
 	struct adc5_chip *adc = dev_id;
 	struct device *dev = adc->dev;
-	struct auxiliary_device *adev;
 	u8 status, eoc_status, val;
-	u8 tm_status[2];
 	int ret;
 
 	ret = adc5_gen3_read(&adc->dev_data, ADC5_GEN3_VADC_SDAM,
 			     ADC5_GEN3_STATUS1, &status, sizeof(status));
 	if (ret) {
 		dev_err(dev, "adc read status1 failed with %d\n", ret);
-		return IRQ_HANDLED;
+		return IRQ_NONE;
 	}
 
 	ret = adc5_gen3_read(&adc->dev_data, ADC5_GEN3_VADC_SDAM,
 			     ADC5_GEN3_EOC_STS, &eoc_status, sizeof(eoc_status));
 	if (ret) {
 		dev_err(dev, "adc read eoc status failed with %d\n", ret);
-		return IRQ_HANDLED;
+		return IRQ_NONE;
 	}
 
 	if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
@@ -316,30 +309,13 @@ static irqreturn_t adc5_gen3_isr(int irq, void *dev_id)
 		return IRQ_HANDLED;
 	}
 
-	/* CHAN0 is the preconfigured channel for immediate conversion */
-	if (eoc_status & ADC5_GEN3_EOC_CHAN_0)
-		complete(&adc->complete);
-
-	ret = adc5_gen3_read(&adc->dev_data, ADC5_GEN3_VADC_SDAM,
-			     ADC5_GEN3_TM_HIGH_STS, tm_status, sizeof(tm_status));
-	if (ret) {
-		dev_err(dev, "adc read TM status failed with %d\n", ret);
-		return IRQ_HANDLED;
-	}
-
-	dev_dbg(dev, "Interrupt status:%#x, EOC status:%#x, high:%#x, low:%#x\n",
-		status, eoc_status, tm_status[0], tm_status[1]);
+	dev_dbg(dev, "Interrupt status:%#x, EOC status:%#x\n", status, eoc_status);
 
-	if (tm_status[0] || tm_status[1]) {
-		adev = adc->tm_aux;
-		if (!adev || !adev->dev.driver) {
-			dev_err(dev, "adc_tm auxiliary device not initialized\n");
-			return IRQ_HANDLED;
-		}
-
-		adc->handler(adev);
-	}
+	/* CHAN0 is the preconfigured channel for immediate conversion */
+	if (!(eoc_status & ADC5_GEN3_EOC_CHAN_0))
+		return IRQ_NONE;
 
+	complete(&adc->complete);
 	return IRQ_HANDLED;
 }
 
@@ -684,8 +660,6 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 	if (ret)
 		return ret;
 
-	adc->tm_aux = &aux_device->aux_dev;
-
 	return 0;
 }
 
@@ -741,16 +715,6 @@ int adc5_gen3_therm_code_to_temp(struct device *dev,
 }
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_therm_code_to_temp, "QCOM_SPMI_ADC5_GEN3");
 
-void adc5_gen3_register_tm_event_notifier(struct device *dev,
-					  void (*handler)(struct auxiliary_device *))
-{
-	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
-	struct adc5_chip *adc = iio_priv(indio_dev);
-
-	adc->handler = handler;
-}
-EXPORT_SYMBOL_NS_GPL(adc5_gen3_register_tm_event_notifier, "QCOM_SPMI_ADC5_GEN3");
-
 static int adc5_gen3_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -817,10 +781,18 @@ static int adc5_gen3_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
-	ret = devm_request_irq(dev, adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq,
-			       adc5_gen3_isr, 0,
-			       adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
-			       adc);
+	/*
+	 * This interrupt is shared with the ADC_TM auxiliary driver, which
+	 * is threaded and uses IRQF_ONESHOT. Since shared interrupts need
+	 * to agree on IRQF_ONESHOT configuration and there is a kernel
+	 * warning for using IRQF_ONESHOT with non-threaded interrupts,
+	 * make this also a threaded IRQ.
+	 */
+
+	ret = devm_request_threaded_irq(dev, adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq,
+					NULL, adc5_gen3_isr, IRQF_ONESHOT | IRQF_SHARED,
+					adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
+					adc);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to request SDAM%d irq\n",
diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
index 6303eaa6640b..39cbfcbdb101 100644
--- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
+++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
@@ -205,7 +205,5 @@ int adc5_gen3_get_scaled_reading(struct device *dev,
 int adc5_gen3_therm_code_to_temp(struct device *dev,
 				 struct adc5_channel_common_prop *common_props,
 				 u16 code, int *val);
-void adc5_gen3_register_tm_event_notifier(struct device *dev,
-					  void (*handler)(struct auxiliary_device *));
 
 #endif /* QCOM_ADC5_GEN3_COMMON_H */

-- 
2.43.0


