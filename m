Return-Path: <linux-arm-msm+bounces-91942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DlJHNLAhGnG4wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:09:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D951F4FF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED760305148F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 16:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7629642EED9;
	Thu,  5 Feb 2026 16:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyXGwfIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/lbbZ6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B5042EED3
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307380; cv=none; b=LaR1qDBHQhV5R0cEDbh64ZiZEL3z8ZahbEZv2e1y7ENCr90gx+O6JjdIvTdziBeUcrmYoB+zIYVhRoUF9QeKWHuZR8I9GZgofPXXYZAn/fYDwPfFipdbaClRy4bzpWeXIGrBjoJDt1GSHrY/jxMHQbZEvyh6XIFO5vZ0pM4afwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307380; c=relaxed/simple;
	bh=23dCHo0XggCchHZbRAvrCzXV8vTchYWl/gCAD7MUpwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lkiyZdjIYKHHkPC3R53vCvo1qwvXpSI3dVe1EabycBza5vDUdJ+pPbwvMADKajlMVc214zpDtPuWYUX0mHCQpeC3rr1mXdZcjVWGzRstaBtWuBo22F8Yd84xiKjGwy+PQgPSPm2TtEHi6Z4JlJfJzE4LPxx9v3Owd+1SnOwGvZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyXGwfIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/lbbZ6i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615FriRP872496
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 16:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rnGgt0YwHMm
	re6GJPzCUCgXtdndj9ZK2y4jRuabow5Q=; b=YyXGwfIldMju2dW91YOSkdrL+i4
	FHF2d3hTKCGSnL3AS0MsDqDxJqVtBJkbyb0leUn79vTbr6jK3v3GgdVDzA49OV2V
	rgd0qfgjMIOVynROSapK9kx7Kr2zAaVSv2uO3iKFPliXsjPCAefbe5H3DQhebcMp
	kA7NHl+4RisYdkTKfheEPa6NbkgbtAojVaJof5i9dC7EHGXFXE2OSk4VOh0AZ/ky
	+WFQOyK/mVPeeLQgt7Q9/1CvOEclGIOCuSm33xsX1yxYjEmjRyEzoOIZgRrswLJN
	SKVpHWFetYNm6UoJGdMT7bb+TsTrUGviWFYzJVdQXrwGh/ENXINut3wv0gg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4x8bg19w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 16:02:59 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7cfd8a3db9cso6703656a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770307377; x=1770912177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnGgt0YwHMmre6GJPzCUCgXtdndj9ZK2y4jRuabow5Q=;
        b=j/lbbZ6i+vrN83Nkez32hhleijfH2mMOKwPpEzpfULcvmyLGyMcBVKYF7IB61Xe0Q/
         +SzqGE0D+wZSqz5e7w1+AGpUGYSzEZm++AJWeHvXrbfpea4opt59aanoF+RvlG6oTBQy
         WoC/l7L5wCeEvYEz9yM7MK3+pnrIxK2lH0kx3KQiaQ+su79ETvK0JWCMbH98qi0Kp8HJ
         /URwGszI7VqJeDUGX79WyJ7UvKUBFsnm7BC8RXK1ykiZSnVYZDQtDsL6JjtVqFdEUlht
         uqeE1/g9U2zvmWURkchu+4l1aOY2+okBu6D0K7Yh9WKkD2JNhTfMymqlEyATgVxVOnP7
         C4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770307377; x=1770912177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rnGgt0YwHMmre6GJPzCUCgXtdndj9ZK2y4jRuabow5Q=;
        b=OnpH1fen95XqQAmAupMDkZz7fV8ZHacj/vVHaAsgimKlQzl4j65F3IvS23byj77bau
         T6fusgKqm/JJHXKAXS4g2elOMqEWloAPMKfMIs3cuFEM4tnbwoHSjMGgOCCaq7s97ouA
         nBP0yIFWzW6zPqZrS42dfBf1Pkht3l43rsUnG1//IrD7tQ2xFxD7vHa0uZ7Dw4G0D653
         mxS0Dh6FJG/ckEKVlwRBMppBuP+476mkB9JnRM1Q3NjAIvHRit1DcKhrmnynyMN/oR/S
         bqbrQx98C4WXJYtV80sJMBRjeKkHJRpUeyZQ5/mv2IWj2pR89y8n3jSm79JaG8IG/x49
         bF1w==
X-Gm-Message-State: AOJu0YwYtrmnzvK3a4tD4ITAeigJn/8A+UUkCiqUpZ01+lvCvm5p72gC
	cIKJJmLyciTKoLjMhmo0HDVgqDo0Zgx6KlRtEOrNmaXpNAi38fuY3jOUgSozmsS2dnEA3K7GAoJ
	NJxirdsI5fBBPwbjmWWroE3WOlf6BAv2olDoikpRb6GNxz7CnbKGHRjVzsJPdHlDWHVEKXxPc3v
	ER
X-Gm-Gg: AZuq6aIC63N8m5d+JoU1wQaC3ve+L99Ia1r3KH0y0jJS1c7DP+9fGnfyuI21GVt+Z63
	aPWesJA5w+rDbPk3XGRYSsDzHbh2wiHY5wINdd9eSjF2iDUcWO8Vluw+o92iAnT0Itl+0qEq6K9
	yXxaKZAWGbwCJrIp4FtVPlTyn8ia5DEmKh+0KsM00TSmeh60c9UKdpXONNjTCHDqEaTuWuBF8Kn
	UZgmsZ8M85M5y8unEA3zjF9f4xIe0Gsup5t1eNHCLJsfMNt6nw2lJ8YpOTneiM1H5LmutyqKAQn
	4opQwirAFgIocqiz3D9DEBTCi+DTD1GL0mUgO0oY+NlDHNI3xpu4eDaJLjscyteYVYKyS8mBdu7
	Fpr8mG7ENZ9MdtQ33Ft94+Pe2h+paYlxlEyvAITeFQx7DzlU7JJh41YeBOXLq/UqEkhp6czMaYj
	2m
X-Received: by 2002:a05:6830:81f7:b0:7c7:da3:ed27 with SMTP id 46e09a7af769-7d448c25513mr3281916a34.35.1770307377461;
        Thu, 05 Feb 2026 08:02:57 -0800 (PST)
X-Received: by 2002:a05:6830:81f7:b0:7c7:da3:ed27 with SMTP id 46e09a7af769-7d448c25513mr3281902a34.35.1770307376979;
        Thu, 05 Feb 2026 08:02:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:103a:9c65:ad2d:82fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180640e5sm13770002f8f.40.2026.02.05.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 08:02:55 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 3/5] phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime suspend
Date: Thu,  5 Feb 2026 17:02:38 +0100
Message-Id: <20260205160240.748371-4-loic.poulain@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GaoaXAXL c=1 sm=1 tr=0 ts=6984bf33 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=QCvEx_dtP_Vb2dzgXhUA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: 6wtZgZHWzdhukv3CbYHM6sw1mzaJCb1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyMCBTYWx0ZWRfXyhYwo0PAYC2k
 qEyNwzjcJ4Ps4D5phsryX3OfBi0VF2PvH271vTiN7hOiQ6SAaH2ZmvP7O3uqJxMcIvvT8azC02d
 /UAlDADRYC3S/ZG1R3YL1jksqRyYmuyMwbzAA2iJdIYt8WVORan2hYjkUDEFMwVmQPJjWAUuNTt
 ArhI038BENWGWICSLCLsQBXRgK/EQgnxkc8eUW1hhOnZgc+xtHc5+j33VSCbSGdae44wIkfRItV
 CtJNqV/JfxUvMNd+Yh0qV9KW4FzDfgHcXwhADI3VAGi0ccY4RUleO6JDocCeOPIagUmMFmx86JL
 G9zDYJYyJN9x9motD08C0uQe0M9Lexi9BDq5A57Q3W45LWP8VJqPk+lOJSUXc/J+XF/BQNzpmfn
 sXQH3kP3itSQu8qZ4HEXQdifEfYQVexP1uyJswujE6/05bEk6jGtDILfhyK1bf1cLu+wC+usIrq
 JqfuksR4ghxz+H7w4rg==
X-Proofpoint-GUID: 6wtZgZHWzdhukv3CbYHM6sw1mzaJCb1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91942-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1D951F4FF9
X-Rspamd-Action: no action

There is a small window where the runtime suspend callback may run
after pm_runtime_enable() and before pm_runtime_forbid(). In this
case, a crash occurs because runtime suspend/resume dereferences
qmp->phy pointer, which is not yet initialized:
        `if (!qmp->phy->init_count) {`

This can also happen if user re-enables runtime-pm via the sysfs
attribute before qmp phy is initialized.

Similarly to other qcom phy drivers, introduce a qmp->phy_initialized
variable that can be used to avoid relying on the possibly uninitialized
phy pointer.

Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 8bf951b0490c..258e0e966a02 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -541,6 +541,7 @@ struct qmp_usb {
 	struct regulator_bulk_data *vregs;
 
 	enum phy_mode mode;
+	bool phy_initialized;
 
 	struct phy *phy;
 
@@ -895,6 +896,7 @@ static int qmp_usb_legacy_power_off(struct phy *phy)
 
 static int qmp_usb_legacy_enable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	ret = qmp_usb_legacy_init(phy);
@@ -904,14 +906,19 @@ static int qmp_usb_legacy_enable(struct phy *phy)
 	ret = qmp_usb_legacy_power_on(phy);
 	if (ret)
 		qmp_usb_legacy_exit(phy);
+	else
+		qmp->phy_initialized = true;
 
 	return ret;
 }
 
 static int qmp_usb_legacy_disable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	qmp->phy_initialized = false;
+
 	ret = qmp_usb_legacy_power_off(phy);
 	if (ret)
 		return ret;
@@ -988,7 +995,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -1009,7 +1016,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
-- 
2.34.1


