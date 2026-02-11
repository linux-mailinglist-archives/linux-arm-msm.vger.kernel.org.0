Return-Path: <linux-arm-msm+bounces-92591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ0hDkJRjGmukgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:52:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E05AE122FEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60B4A309CB19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 09:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821DC366DD7;
	Wed, 11 Feb 2026 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/Ac56Cq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NSQfJLrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6798367F54
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803298; cv=none; b=OBCWFFRV5OY5s3AiDl3JtwEM+YtOKECVx1IOOxXLyNA7XXg6eIWy3HEJPZqrQg5H4vod2tzZvH5MrIi+tagoinNKSsRT8HCdUGiSLWzMYbUf/hSg4J3Q4vCiwimo35xzGgs2vfDah6rMyMeI2OhipgRg0GydqieIiRD0EaKal4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803298; c=relaxed/simple;
	bh=ErJkRgjBn3kKndkizVQHXkQsIRTnMx+SsxhZmXO0g4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CHtO8rJ+LSLq+LN6NjM0hS3fk3MOGqO7DiMx8+4w5rQmwgoUc83BVOrzK4jEtnJ40NkTlEfm12rwryKnCV7QJN7t4SADikjoQPUOijOdR3n/EkfiM8Jdi1/aQW5XhoyZEpA335yEWEUMpSlf2OVEbb50ub+rgUkw3N95RRcRb+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/Ac56Cq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NSQfJLrt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B7ajqk3919364
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TsVRt6v8DspztJLCo2JToFVZCJzTWengupu9/MmG2/c=; b=H/Ac56CqqD9ny6nO
	sFV6m0DbpMQZbIyeahh+s5P10jaay2+Vk5ESk5ASNCVw0abuT4pZ2+yLfNXF8Hit
	BuTpgyQFjl8VxvkoJRgj0dRcLGq5+vbfRoC5Fi66tR909+RnHGWfOxumxYGMrI1j
	IB3G0/Zt1obrrY4W4qtchJCY9GhUyn1FHsGTm2ts2lORfmfYM9neBO9Dmmc8xM4H
	NV/obGSGx3THDn0dd60sWNZqKWiGyvZZdsO0L/mMBZSSYP/5Wvh96nWClmxXNmzD
	il5LuqS2ARn2QfBlsmZZs9hwGeCFMf2o+POUtT8/Ei9wNLoN4esoJ/WNNIicGiI+
	bY+TXg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c86akkdk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:48:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352de7a89e1so1632909a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770803295; x=1771408095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsVRt6v8DspztJLCo2JToFVZCJzTWengupu9/MmG2/c=;
        b=NSQfJLrtPIvjYGk6UFT+yTZngHIbq+HeVGmjCNjty57WhdDyD7IDAJVSZpo0b08EQN
         LXtmROK89hSa41w7N8d5w2onUJzRmRpzcsgFLVc2ocYPXdL/c+W3ZxQ1TB1ALJ6ZW6aW
         PgMUJuk7XafkLHIzpxf745NAUbO1s95urQNKpvKuqTPTXVkeA2RzgE6ve4pFIYCnS7Nv
         Mzv8nLk0DUHyjrmdyui9fFozv3aymWDecQ1FHhyQORx9FLzja3JB+yLJMp0aeKkG2YlU
         ZOmWcdgEWvnDBApEZBekuLkAo5j5+mdi2Y0lwmr9oa8K3nyIGoQJC0Oypz/KEF+hd58K
         tUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803295; x=1771408095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TsVRt6v8DspztJLCo2JToFVZCJzTWengupu9/MmG2/c=;
        b=f0PbBB/Ty7pK6/3SkZ6krTb4f7pWqYMfEScHhyHuYiem9/f3Lcf+cZJ4u+9i5o7tno
         3YQF9bNJtyKfBOG7IUO5hpADZM9VcWF9+GrXOY4J9plfd6loHy+vY8UekmpcJWMgUDK8
         zB3vmuga719gsvyK3PKyktiAy6WCgzir/I68oJFByhhx8Iz16zsy4A4awJIWXvLmUxyC
         oXlErv9NSjoLO+kjSHt2tL/761OIGLEdJlPAWiG5eOMneyScmr+geUJYHWi2AWvgOUqX
         1NdoV+txXZGitqMRQj8q6jpNHkEqVMOlhoU6aydfDsyRDjHgi7RFCZjZwqzMYsKvfuyJ
         hUWw==
X-Gm-Message-State: AOJu0YzOcG9pFpP9pJdzdDNVM3gSPpkhDrBlve0JoS/QPDZI6jV6NxI/
	Gre2uQNRcbfuFTL11WNvsi7RwgdTYEos0/u2QhxK3q8pf1tZumunseMYKnJ9iwCYoWE5wtv2ucP
	QRmtMq3mTEkVuv4y/mGjA/GBeLBklkXSVVljuLXd8TOK/qD9ZT4WTtd+lz/K3RqlrzwFaMd15X+
	Py
X-Gm-Gg: AZuq6aIR29jMJyJuFEaDRVtqJXW0tkm8IL+3u9TNRdLVo/kt+VoMsSGBOQ8gXgG2hpp
	O5SfXu2Ha08LrdIBhNKkmXl+fJI2M026WsqnxHiovObaYPzlGSKK887c2gvJKinzKVvHqketzjv
	YZg3n4KFo8wnkBM8Q9T1kQuUkNmDaOsSOAvAkVX43J8e9+69T9YuHTzBpVL9n7Y8M6kmXT4FO7d
	eP0f/SZRgAgjd/T/ZGgE5N1W2OSw1ozjFvsVeYrriqDTZxk9a1TZIXgFdw0yfSXpTmAjIl3DSE1
	ktZDtXKnANkwNlKUuWX3whwTDvbQplrdVATyqYYWyRgB3RpERh747VZ3NaKIocKKMtB41X0pICY
	g/By9ubNdxhCrS8nb8Yev8UjLk2OMT5tHNMOUN7RzB+qdzm2Ok6rw0l+VsXo=
X-Received: by 2002:a17:90b:2750:b0:354:c3a4:3a2 with SMTP id 98e67ed59e1d1-354c3a40bcamr11698254a91.29.1770803294434;
        Wed, 11 Feb 2026 01:48:14 -0800 (PST)
X-Received: by 2002:a17:90b:2750:b0:354:c3a4:3a2 with SMTP id 98e67ed59e1d1-354c3a40bcamr11698226a91.29.1770803293978;
        Wed, 11 Feb 2026 01:48:13 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f6b84dsm7526640a91.10.2026.02.11.01.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:48:13 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 15:17:46 +0530
Subject: [PATCH v5 3/4] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-enable-ufs-ice-clock-scaling-v5-3-221c520a1f2e@oss.qualcomm.com>
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
In-Reply-To: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=698c505f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6u5mSuNpuy9df7-r3awA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: WoQnMUaV0aPnGC0YtcZ5piYNJ2O99REJ
X-Proofpoint-ORIG-GUID: WoQnMUaV0aPnGC0YtcZ5piYNJ2O99REJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA3OSBTYWx0ZWRfX9uW8fTNDueya
 s1R9Ok1zKLGb2gfyk/UuYHBzhvN8e6S+JFCe9DgGSW+NCg7/nH2jolGBo6QGDWNYtRXXqanluuO
 zFap3mM+RBo4Ajh/9+CUSOukU8WYpFaLLo7LXXc5u87FZU/wGlqZLIkY2C4dqZTzATTkV+uRKrI
 OCJHKkK0nMm+NmoCFPaCFPyyOymJ/l2jY7UztDBTmahR8Bt9EdLWOwmK3fCrhrt6uyySaQlFfiA
 hXwmXkLoWu4DRe3KVUqXe8M1+vZYPyUKfh9Dj1Q/1ztvASPPK7MOYoCAOLnr59xErXh+xuJPbLJ
 e8wsHTg/JOv3pKkEjsWAYwhqxAVKNKnW/gaWTFkMbOy8n+navTzolj+5rQq34oKvFtNpIi4W4RV
 f3GdzQmaTc0y+GpAQrGtSarB7uplygXGhtFN6+FeLLhQD1RNZPrkLjHekFmXJcUiTAz+Eg381TG
 Qb1K7MnFFlm6Irl9Dbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92591-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E05AE122FEA
X-Rspamd-Action: no action

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8d119b3223cbdaa3297d2beabced0962a1a847d5..00cb9cde760380e7e4213095b9c66657a23b13ee 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -305,6 +305,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool scale_up, unsigned int flags)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, scale_up, flags);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -339,6 +348,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool scale_up, unsigned int flags)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1646,6 +1661,8 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		else
 			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
 
+		if (!err)
+			err = ufs_qcom_ice_scale_clk(host, target_freq, scale_up, 0);
 
 		if (err) {
 			ufshcd_uic_hibern8_exit(hba);

-- 
2.34.1


