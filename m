Return-Path: <linux-arm-msm+bounces-91944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHXdGUC/hGnG4wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:03:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D73F4EBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 708623006467
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 16:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C50442EEDF;
	Thu,  5 Feb 2026 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnJid0gd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCWiCBer"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216D8428841
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 16:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307384; cv=none; b=EbVqVg7y2UQQCayj6q2kRvl/qz3/lRvysFKk8qrq+PE5CWb4VzjxKPovXLpMnWZUzBP5HQRM49SWppiyb4H9UAoo+84o9hymLHiMYSVmnBLnOv0ycL3M/bSg4X4qTcYHHxOYYr5sLgODZ7GZ4HIOzufiKJB2+QQ0mA9XW9phvsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307384; c=relaxed/simple;
	bh=Eqax1Cq8do8asHGgjKu8UU33SRBECiHneJqm2Qk+rFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qlSzMrUXww5dmsDp9hn5z7mKGBP0GIsnwXS9b2jaMBRS6o25VAUUEY8FW4vcaU33IcMfNo3ErsWF8yN4uOAP+QPll40JdhAT86b6TqDQemeaWYLo00EvZu5Ask+AiQtbHWIlqv3u/DfXPxc05Y9GXQuxKC2XPwINGRLjwY7HPEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnJid0gd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCWiCBer; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615E4lS5890160
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 16:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qHj45frK2CW
	TaWyU3a+r3SIT6ptBFPbjJMKlCBjfbww=; b=CnJid0gdrY+hXh9cv9WS4zfL71x
	YeS+spw3dn8kIgJdrU/LbUBcCdGTMOgm9SF+0dWpDAWCZwbHuMqBCDM9exaV9et7
	RtZYY8VZuX6Au3WG+VRwcudyjvsyHE5XNWS6BbS7170gQ68QuLBMnFnYDkj6RQvH
	Rel0HJG147wMoAawjzPc7A/whSriFBEsC4wjzjSSLsU+yzfiEcOKB2aUxqFNGXT5
	8wiAzGBFNB3vyxRy246mtYquVBy3AeDx7VuM2o4pDwYODNOG/0rZ/JK2uv7r0cAN
	U4/sbfne7cNgtPk7xg+ZKBIpeWLN9qi2DPzlexKEpDjs7kmFVOfxl3WzQfQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prx9mey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 16:03:03 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d192f35a9dso3561977a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770307382; x=1770912182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHj45frK2CWTaWyU3a+r3SIT6ptBFPbjJMKlCBjfbww=;
        b=hCWiCBerfi144ypQORoEsZZjjC6oSbWByoQqUmQagHBC2cm3carEBJV5Je5HzgBqc1
         FOOrRs3YQ5d1d2VE2mRw7WHHgC1634ZC9D+k6qwMS3Al2cuH0LhqdorT7nc5j41nJBTi
         f/6fn4HIS/RQWoUkGDSw/Dbp8lmHQYdX/3Nj6CljQ+3HrjMs0o3ZQ9pqpRy44uZRDZHu
         g2wM0QEOGtGSy17KthjRy0NI/jfTyrQM3nK7eWZxWaUypdJ28HYc6ZMGWQy3Tv8PiUSK
         phvpN6N2DRWO8t+lfJ0n5e4u4un19fjZ+9J55njIUF4Na8xjcmkcnUVuDRmrC4bARoU8
         eRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770307382; x=1770912182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qHj45frK2CWTaWyU3a+r3SIT6ptBFPbjJMKlCBjfbww=;
        b=fcLkCpQl4HzYtAgNfghTYvNeyVnyRzXeMQCkeGbXBQZ8+jXz83vV/USp2T1NN332PR
         3ZcAAZG6D6vcJFsOPwgAJAqFla/VaKoDu581C5FF2gPxS6TeJzU3Nsmy221xlMbcOpaN
         pZ1QMNWQJF7YgkBhPSoDNCESZZhbg0aYBJ/LiWsmXzaGVvs0X4+sGqLIeH37Mqp1XMH4
         WDr3idmW8LqOPFd5K1HyYEcwxzJNBU7J8UOFTEYncQ0KwBSf57oPRfzfNscK2KzSTnrA
         hotSt5bbFTDtwCy10eQKahXaSeDl6X/abe0e/xwVL0mZ2QvnDhSIcRAhA7clX9uPKTE6
         lJAQ==
X-Gm-Message-State: AOJu0YwRKkE9Yj+4gBvoND6ggRObixT7z/pwGHSCYimU1+ABpix4CyLH
	OT6nKBpH6NPcaf7kLjCALMCp9Ht4FEJQAXRgPQazHTgegG/2DXV7bwLS3uhsu98ceJLmrgreT/H
	EQwVyJY/XIB+9AAPZRrOz5hxdjC3WFsEmNbq3HsfIWsBVH1uj0F+jIjdBUYMctXmDTKlL
X-Gm-Gg: AZuq6aI5HL4whYvPjqiYMqr4SNmDL0SCtxZke2q1stFIicL2ZbEeZoy5WkoQRQF545B
	Nn/Ar+kPgebuIgC30yhSO477ovjGPh2CeqdQRE7z9M1eTiCMoB+/1U6wj0SnzfmneCa0VYk7znq
	gicwOSxB+HvU8/m5cNtPbooUIij35g3pGdlkpP+JJ3fdoJFl7pqIrSgxbKejXMaByZ73Z96F8cA
	Kax01Ydjb1eCv/IXZRVC554llavZsLvyELVHfLBoJ1O1TtqeSGF6CHVUpWUdunptSmOg/RrXb86
	8wu7+SuZCeRE0CCJ82bz5SJ+u8UsuY59WcE3GRnnGadoICjS9Z38U+hDG/CLJntjLUhZaT0aK6L
	tnM+Shge5ZFoxMZlXNt9/VRd0V3RYaj2j/w5WjLoFWKhvYaJ6C4XPaHg/atK7iO7K3gDuGtYwRT
	gP
X-Received: by 2002:a05:6830:6288:b0:7c7:266:392d with SMTP id 46e09a7af769-7d4489a722bmr4022748a34.13.1770307382287;
        Thu, 05 Feb 2026 08:03:02 -0800 (PST)
X-Received: by 2002:a05:6830:6288:b0:7c7:266:392d with SMTP id 46e09a7af769-7d4489a722bmr4022725a34.13.1770307381843;
        Thu, 05 Feb 2026 08:03:01 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:103a:9c65:ad2d:82fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180640e5sm13770002f8f.40.2026.02.05.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 08:03:00 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 5/5] phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime suspend
Date: Thu,  5 Feb 2026 17:02:40 +0100
Message-Id: <20260205160240.748371-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _GBOxnbV7pcU-2iSuTh0OCi2GDAlhyfq
X-Proofpoint-ORIG-GUID: _GBOxnbV7pcU-2iSuTh0OCi2GDAlhyfq
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=6984bf37 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=GnikDSHSz1V4xWV9RsQA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyMCBTYWx0ZWRfX8KXl0tN1eSl/
 L2RsBaglhThbDCVueTZqYw5tsCW/ArTrwnnILN9+Ti/4rmrYpCqQcdcQ6KS9rW0k0SaI7AtiVOE
 DyuYof0xFHxminknopjGANkL0RYUw/YxRZRVEBvOytL65ArzVLEg3zNsXUuvi1hfQM39uofxdEd
 q96902csa0RJkv06BND3lXpa4x+tFFoEKTqnxWvtFiI8c39omho+I2+y2L2uSVvrAz9yK6oKgC3
 jiqfGFZKC+lqM7I8LYxtlzqONE4ozerixjUOJTZ9cmx+GMI6GVm/wIIuxQhXRyKTLygb2MjSQBB
 rWq1m7F/+gG/ZS1mKmkTtiRo2zqEIoVsItdE+1TePt7qRyDTsgoPAw2KoK0MyXP94vbZtfUBHUa
 ufm1rH4VXqWKx3xjGEJvFkMCz0MRBGl5rC4wf9sfDTcE8+w7zVvNqivnT1BMl+ivVqeBS4rnPzL
 Lqq7gPZZAAM7IDi3VxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91944-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[loic.poulain.oss.qualcomm.com:query timed out];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55D73F4EBF
X-Rspamd-Action: no action

Enabling runtime PM before attaching the hsphy instance as driver data
can lead to a NULL pointer dereference in runtime PM callbacks that
expect valid driver data. There is a small window where the suspend
callback may run after PM runtime enabling and before runtime forbid.

Attach the hsphy instance as driver data before enabling runtime PM to
prevent NULL pointer dereference in runtime PM callbacks.

Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
short window where an unnecessary runtime suspend can occur.

Use the devres-managed version to ensure PM runtime is symmetrically
disabled during driver removal for proper cleanup.

Fixes: 0d75f508a9d5 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index eb0b0f61d98e..d1288a6c202e 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -599,13 +599,17 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	dev_set_drvdata(dev, hsphy);
+
 	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
 	 */
+	pm_runtime_set_active(dev);
 	pm_runtime_forbid(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_hsphy_gen_ops);
 	if (IS_ERR(generic_phy)) {
@@ -615,15 +619,12 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	}
 	hsphy->phy = generic_phy;
 
-	dev_set_drvdata(dev, hsphy);
 	phy_set_drvdata(generic_phy, hsphy);
 	qcom_snps_hsphy_read_override_param_seq(dev);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (!IS_ERR(phy_provider))
 		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
-	else
-		pm_runtime_disable(dev);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
-- 
2.34.1


