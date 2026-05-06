Return-Path: <linux-arm-msm+bounces-106103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF6pL84f+2kgWwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 13:02:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 239654D9915
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 13:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 643FC300FEC8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 11:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B8F36894D;
	Wed,  6 May 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edfiW4Aw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqP+s6+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D4E31F99A
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778065356; cv=none; b=oZLwLwoQmKF7F5Od1H8r1CdJvb/SLa4p8FUteFnwagTs+iTAQL6hsHElguSeC09Qgrb+ciOBJlyB0m8mTjrey5w3QjArqLdvpX1BTA/rBshTngQ/C/gnnflpfPQk6H6BViZF9QnDtOydDt3CANr9zGrXUGLbHz+eKdZD+ACI2sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778065356; c=relaxed/simple;
	bh=MSGcOpSmX6Xl6NgURaMXSYPZtDechIJul15Dp+iTxnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/6ckzc1MvednfeXDN42ap7Qxqd4rBw+9jaRiUDowDIaCorFr9lVnHA7Q3ZbVNjjmju4DGPLk6QJdWbBURChXYT404G2f+OKl+B/lulF51Ft3G6aLYtCAOXuWkjTbLF4nOY0ykK0TbG5OCbveNj1Ih5NA52F86/E78HvhId6Arc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edfiW4Aw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqP+s6+e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A3UZC1953101
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 11:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zzBDUJIg/8Pybw6aNYXm+VsLNZTwGcg40c8
	juw5gsb4=; b=edfiW4Awih96gofu1bfDNoHU4X1oIcsTgidjZ97unGaQUMdfkdQ
	qu4P9fpeyf/XtnH3K26AdUQA4s6Y1rU/gyeBO3Hhf71EWhzmvK+vZBFhi3i4bSpF
	R6QoAgLBtCxP0K5830dnPAwlD5vZwzLamLWe41CFAvwmZz1Vp+EBn/jm5RJvEzDg
	oPXrWk8hmO+0wcmXQq2l4szAgpDTOW0btJB3zolZCz2eDuxPunXR53Fm9PBpVrFe
	R2doJXFL6vUgmThyg6rNaY43spYJ5zrfDfS5TjKf+J2dH++mh3YQRpSagAT34yMq
	tn+BE2IMd4MOCZ0jTkg1bzP+lh/oe35yAKA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc05rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 11:02:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c822fba6b4cso1270458a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 04:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778065353; x=1778670153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zzBDUJIg/8Pybw6aNYXm+VsLNZTwGcg40c8juw5gsb4=;
        b=gqP+s6+efYEMukzbTvpp7ooDhAvx/vrEL0vcvwpc/PBSmpVp7yqkVM1tLWFmrrorvQ
         qFq/EL9/nVj/FSa+N6hMPClt6pk5RXBq1c+p68ICexUUIGLTm/B2MyHI7zqHPc8dw7Ll
         NKm3x+/xzv+AaB9OzeSQN/Q0zHSnuLtYVE7nGm24IRuVZ/YejW2ObU140h+GVSmQxfYH
         3QFLMrz6K1+vym9IkuFPRTce+2Oz+5LzEpdjjApG48yl71qS1w75+90G1BsKQCjWEUII
         xHX40V3exDmV+GA/2dh4Ir6X1Ptg6Dzv3Maas5O9ix6NE06+SDUivB39BLivuRJ6Wou5
         0YKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778065353; x=1778670153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzBDUJIg/8Pybw6aNYXm+VsLNZTwGcg40c8juw5gsb4=;
        b=lwwW1oAqxuow2EojuucJeLCmB9QPUxQKs3ty85JufYz0sPwqJJMvWjiruND4IOWv/r
         Kw03Bu49OTjK4fWGINzqxarzOv4QZwLOsxZv2944cnNX3DHYDhhQ5/oCIuTJtZlYxc0h
         K93+wNiEfNJZ2j9QmWC88cpoBLJo6Drg5dNfYXTtCdfJu5Z7PooUNugYk/FBH97j/m5O
         c4b2cK1F/hz5W3JmqFOHNWpcL5DJnu0n7TKmW3O0Gg6NKdWcPN+wBuUvSRsk/QhfOOE9
         EXGiOs5mRkwiFcDxbxK+KYRrW7d9ZpCCGsjvhktaeWDY5jsCRHbt7G5MGhZ0iySVphzz
         Ns6g==
X-Gm-Message-State: AOJu0YxmEfbKO51yoalb1iNZsBMBXK4S6GIrcvq0knfgA//HM9UG9rhN
	3geI30FmN1ae5ulK2pPsE8q8Y/SZ0CFijhBMa4waJ4CwNsEzucUicYtV3dJOIVV6zVmFgNaaDnB
	+oWc1rK4+RnNg4rEdpZymje2xqBuDyoX/rr/mGuiSBZCNbI5FMmZ+9MPI1XVlMEQhGOZF
X-Gm-Gg: AeBDiesvzAoZLkM8HCNHDJPSQ239dIxPGgb+aEDrzTWUXSiXdr3zAul67cw10NIMsLJ
	lDSo9NME9pFnKX40DxwhRu94xtPo2R7+MNMnzHC1ieHsgRorm5Ax2vZzz5JZFWM17Ha1JMVox4l
	Rm6Qs5hfpu88wxyLF5Br/QrsJCtwR/GXWnO7erLCJLnUuCUgahrSB64PnehbbUt+D9nTmS2Onal
	W5fzEB1pTOuDZubR2Wze/ePtHizYNQKMz8QZ3FPZ113OQUbQE8QNG9/jcuV4XYz5mu79d7VVOuF
	WTGRE88IZzszvhMeHQrAMwFsvKrQgXU/SXgisGHJHbnvaQ2eIaub+8vs22h3tgoRL6jCtms0FD8
	z0ngzGf1S4VKDX4ijXSsK0MPr0R9AIzn5kyYsPibPmA4b0cVzhTTgg8tMA/o=
X-Received: by 2002:a05:6a20:1584:b0:39c:c07:1450 with SMTP id adf61e73a8af0-3aa5a9da657mr3334268637.42.1778065353321;
        Wed, 06 May 2026 04:02:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:1584:b0:39c:c07:1450 with SMTP id adf61e73a8af0-3aa5a9da657mr3334209637.42.1778065352710;
        Wed, 06 May 2026 04:02:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82429cc386sm1857685a12.0.2026.05.06.04.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:02:32 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: pd-mapper: Add support for Hawi SoC
Date: Wed,  6 May 2026 16:32:26 +0530
Message-ID: <20260506110226.2256249-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEwOCBTYWx0ZWRfX7w0f+gbK/UPY
 /5/Skr3MpDRhwJsVpcn3Dp5PUc8+3WO/UkPGapS+KDDaEP2/k/JTKaY+1I7gGLn/iXFRU4j12Bf
 zrV0AN1neR2wnN2DMZPQoYYn2LRMxlvX8Wg+tG8dIq0mzV0ia2bAJDnUM9eI/dTUB1h/5A496b7
 XVL+s1RcXtJsehmOmKS9V7N9Du6ieLzs2Y25clf2uWO1v3i6y1zgKA4Gp1l2f/V1rTmCc5SZwUk
 le6j833X6xI4lNLNrHB7RWCgE5BQktIWuYwIE/nobtM0jP4soA0tbh/swhvoqy+5QUg1Jnsjr0A
 iqqp7hmykokejz+vwLbm+QfqV25397Y4RXYLJSX/aoURR9GHOjDlizi5CexjHhHjaDS93nFKypR
 jE2xXNSB6CQHqcnau3uAZ5hYzpFeuAZ3UaRdCOl1bX7a29Tx1rzA9iWKOtoVvN+m5KMYIxE0sHN
 eQJafBhI/L1huqFPIWg==
X-Proofpoint-ORIG-GUID: ULxN8OqlShtMFErTmA5xr9XQRnt_ZjeD
X-Proofpoint-GUID: ULxN8OqlShtMFErTmA5xr9XQRnt_ZjeD
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb1fca cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=PBEn2T2uRcvH5sjDxyYA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060108
X-Rspamd-Queue-Id: 239654D9915
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106103-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]

Hawi uses the same protection domain layout as Kaanapali, so reuse the
kaanapali_domains table. Also add the missing adsp_ois_pd entry (OIS
protection domain, instance_id 74) to kaanapali_domains, which is
required by both Kaanapali and Hawi.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 7bb14c20ab5d..b99718e25f2f 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -266,6 +266,12 @@ static const struct qcom_pdm_domain_data adsp_charger_pd = {
 	.services = { NULL },
 };
 
+static const struct qcom_pdm_domain_data adsp_ois_pd = {
+	.domain = "msm/adsp/ois_pd",
+	.instance_id = 74,
+	.services = { NULL, },
+};
+
 static const struct qcom_pdm_domain_data adsp_root_pd = {
 	.domain = "msm/adsp/root_pd",
 	.instance_id = 74,
@@ -370,6 +376,7 @@ static const struct qcom_pdm_domain_data *glymur_domains[] = {
 
 static const struct qcom_pdm_domain_data *kaanapali_domains[] = {
 	&adsp_audio_pd,
+	&adsp_ois_pd,
 	&adsp_root_pd,
 	&adsp_sensor_pd,
 	&cdsp_root_pd,
@@ -581,6 +588,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,eliza", .data = sm8550_domains, },
 	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
 	{ .compatible = "qcom,glymur", .data = glymur_domains, },
+	{ .compatible = "qcom,hawi", .data = kaanapali_domains, },
 	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
 	{ .compatible = "qcom,mahua", .data = glymur_domains, },
 	{ .compatible = "qcom,milos", .data = sm8550_domains, },
-- 
2.53.0


