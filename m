Return-Path: <linux-arm-msm+bounces-96829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCT3NDvgsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:23:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB0C25B6D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47C203037273
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B063F36E480;
	Wed, 11 Mar 2026 03:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eo9ERaAK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CMAZTrP0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5793736B046
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199408; cv=none; b=VG05v4z8a9n35kL13oR9MsWrMmxcp1H901nvo2obxOM+tn2E8YQczNotNgDt9JqmqUq+so8cJ1FVuS3qylS9BF6p+4jck88Epc8+N2tmKdOsuRQbAy7ELtY2PQ57F/q3UgD8spDE+itiWQHOR5LuuT0uHeQWZvpnVxwGKEFJbBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199408; c=relaxed/simple;
	bh=NJiVsMMKzJws+Cks3lRdvlT1mL0gwv+c/6r+WaGQjLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJoFzIb/0vK2N75yUNCpVz/hOxpvWZgfqbIz5K6I180tATLjKQHnw7wXdgQ2ZAD1mf+l8O3gPcgYiubKw3qSOygu4oZlfQ0JiU52RR7ZeyH75Up6P2RYZfphzo1MnlowkOb44LgmKrx/7KYasKgsVXVfZEBlLToFTDtRwzgR/dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eo9ERaAK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CMAZTrP0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHcn722179276
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=; b=eo9ERaAK+npHM8zl
	IjP3mRBBLEA9lsTTYMe8M8Fd3MKrzn5EEtC040VuRxU/wUhglUiaa2ePZXYq7SaX
	unThlzrc3NJfQwGLyM1lNHjXI3SRjTeRT0rAxqgRE9HITsE3OHEARLcWv6mEV8XY
	XxCdBLtovKnlBhgEbSRhDr6sDO0AwpYnyQRjQnI84CjZ5FdvA0KvF3vMVceesK8t
	0+ZDS9L0bpSzNdE3IWp4TV3fij89TtfDQDzGqmhHagRxyljN22XMAJp+xJvKgwKF
	YZYgzsECTfwDoO4vavBdR89YBCkvbjTdWb8lXQ0Tgr776tXu+z42VE6GRKTYT906
	Ddiwjw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvsspad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff9f727641so9059356137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199406; x=1773804206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=;
        b=CMAZTrP0e1s16iwDnVipYL+HKNybOwiTXoLM2CX5LD8H6cMGNUsGdw1Vwus9RFUJ5M
         ealVbdwv3L5f5EGV7mvKIFB/E4c8TdMWLX3l3QnKoGo9rJb+lQDzHQA5UO+VbcOEJjNF
         nfNWlZeDZpy/P7YzCyuHCVyd4lkzLqkEaA3sAffC5MEre2GANpekaU9UelikL39DMBWZ
         OG3bVzrdmCeAzdenpZmc202DIVP9CfsfAys6AVY7c3xZQsepcrzyNO+X9MIZeE4vqOwW
         EFYDuk/Ze+OVk5zmoK5SMQrtmgjvUOjbIT+gAIs0xZNJtUG+dZvl5m4ZQCulnlZU0D0n
         /enA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199406; x=1773804206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=;
        b=iiqRRzsPadccJb/0louHQ8VwbWX4rcutvAemRiXgm+jnI2EH7b3PrdeOyHwHsptkG2
         yx095E0g7MPQr3wBQMnAVpnDPugakAeWcsciRngKzWwx/93NPrg0Jh6yq2/+D3YfTSG8
         +hIcaqfMhwf0ez1wXRIGvHbkEeB+Z5KkabZG0A/KWS8ssbqFAwgBXlOm0Lb2LjjLrn9S
         h/aGqLKAOsMq7ydfH85AIgI4uixkT+SUelxpMTy+KYU2iJ6/WUPy/g1k8WrdK3kUWo46
         SJdQqbHVLr8+8tx0mLWbG+Luyn7Ei4yt+mYHvYx/HOmrSBP2Xu2cLcWqpLAMPeyiYVWq
         34zg==
X-Gm-Message-State: AOJu0YzHdYg+uEdOOkVFfxZVTZh0cNrwT/98xlrYBsjREjjziqP9p8t+
	hEQzVJxmX+HEP7Ny5K8MMdLaOh+KPeiUtoRxujw3KDavss7vmm4uAR3V8uw6fZnrOFM+G+LxcE3
	y0FGRvbOnTe1yGCJGzEeyWOLq1T8CICFn1KztsOUHZZnIz7CNSb9G+QMSkER0PS+6TmJ9
X-Gm-Gg: ATEYQzy8W5+VhRiB05o+Cth1eJASBr8MlqhZp7XhiNEWiHQyDhksGzsZ7yheHkHHhV8
	R0jZtENAWpJuki3mJ35JKNP6WzOku3VQcMNLNkhOPo/3owWwMK8APxQCx5zHgC1saLNiaoSPYwl
	pKvgKzEZA2AaMPZZT0G2XhVcAlKgRyhMlzoXqoBjR9C+JjdlTUzWmOoC45sruRY/IaxbLuRA/Z6
	NA06uiqL7fcn7c0gUa90f2HLl/OmSNi7Eqc7erCi0bWFVii9og5DKJKsMB0gh5KcA1xPhKU1bIx
	1acFX93QfXt7BaxpEYCSA/ji40AEnJmAGneMstPf35L06LPggxLJo9SskJZFNgQeNzBWOtPZatS
	7m/2/HAzHF16Qrm6N1w6rCCfqwVXGHD1Ahw6tM8mvORekIh4BZxkjdVffAIJdN4mOYuUPj15Bmq
	g8QpoA6ZYt7QPTZpF4P54bN94q3a8Et/m7iPY=
X-Received: by 2002:a67:f44a:0:b0:5ff:c24c:5a09 with SMTP id ada2fe7eead31-601deed4a4amr260414137.25.1773199405586;
        Tue, 10 Mar 2026 20:23:25 -0700 (PDT)
X-Received: by 2002:a67:f44a:0:b0:5ff:c24c:5a09 with SMTP id ada2fe7eead31-601deed4a4amr260403137.25.1773199405080;
        Tue, 10 Mar 2026 20:23:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:22:57 +0200
Subject: [PATCH v2 03/25] soc: qcom: ubwc: define helper for MDSS and
 Adreno drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-3-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NJiVsMMKzJws+Cks3lRdvlT1mL0gwv+c/6r+WaGQjLw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAdm+RX1BKl9Utc9WZmugK/murlMTNVMaxQv
 cFLGBgSsfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHQAKCRCLPIo+Aiko
 1SHNCACU/0mPTlSy1CalUSoetffZqb95AjfoQ+qlVHfSiZCkWk7k8fXSKaws4i7tAahDqTpTmxi
 IDPukedlBqtQb49cJ6gskYE8kQLJI2IwZEVc4GhJyNKfOnEApyYx08hSTFJM/NQr8Hx+joM4V6T
 IRBm8nG2c2TLVbVhX9ybsfbsTQ4qd/k1urY8A+BVyHKUyDkmdl4njnlmm0HGOBpVBkMWBOdC4D2
 o+aWx2XPRZ4GqWCoAQJyS8r6VaLpP9kRR31/N9knZm36XuQlNynoX45KR7SWYOaMYaRLBDK8lhj
 Qqn8eOgQJoRa6QbpYMTM0YIjETnKEtOaLrLaqT6t3iLsTCVu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX1gPIcCyb+Xua
 fIF0ankKU+iMdfWRW52KkEDW6FsmNJz1dqRD2AKg+VGPpnOLlYvMCvk9lqGNHkr6Ga19xwsnFWJ
 lKlWcRl55IzKwo4j3q8RoK7FfA7v2k6+UJNnt1O2tforruHcJjpVdeLvbwdWoE5pZid//1l0PZ0
 AgWkGd+TWPt1TM/DKZUc6OjdoZsUDJlTH6fJDwK/mDWNUrsMsWUtwBPhzjQ7E1znDyc5ukzdLoB
 LH6HM3vyPglJBTev1RLubq4gKzu8NoIEaLkQhmmDufjKXDYR+Q6uY9E4BEcZ3l5b7qaFhKuA+tZ
 11FHkCnLybSHH5CDBzmMnFcv4VBF31oRKtAE3ScrjtSjHKHs4NJgRNikFtZcBf6hU3KnjMtIPwC
 5+fBFemXM+7IymHR5oyfyfegZ8yADfB2QS74vO0FRbcxvHmpXwr/2ofWC9p2Y1I3uqh4Rh67tNZ
 gbJ8B8YBCQdJDtFy1Ww==
X-Proofpoint-ORIG-GUID: QHXdt8ZK6hsNAI0LvLqEa1n9QLE4Pfy_
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b0e02e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=TXJx5zmxIxDbTTGRO54A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: QHXdt8ZK6hsNAI0LvLqEa1n9QLE4Pfy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 7EB0C25B6D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96829-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Define special helper returning version setting for MDSS and A8xx
drivers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 319caed88775..8355ffe40f88 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -100,4 +100,20 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 	return cfg->ubwc_swizzle;
 }
 
+static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)
+{
+	if (cfg->ubwc_enc_version >= UBWC_6_0)
+		return 5;
+	if (cfg->ubwc_enc_version >= UBWC_5_0)
+		return 4;
+	if (cfg->ubwc_enc_version >= UBWC_4_3)
+		return 3;
+	if (cfg->ubwc_enc_version >= UBWC_4_0)
+		return 2;
+	if (cfg->ubwc_enc_version >= UBWC_3_0)
+		return 1;
+
+	return 0;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


