Return-Path: <linux-arm-msm+bounces-101465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKThNCMlzmnElAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:13:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF782385B3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2E23304519A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A633A544B;
	Thu,  2 Apr 2026 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CfqF+dvo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DG1X5DSu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710D3A3E8E
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117507; cv=none; b=VYVDVobAQ2nndF98iz9f01ezXOWgwOYmDuVkN1sTef4D8HH1WkCoeiyRy0gR2G/dLr/3Y6KXHAJEo5J75aozgZuyxokV5HVcX+fWNtnjWQGT4xUadhQhVxNRYNM+I7YVhLDJulROXM3SwkhGUyf68yWtTQIHvIBrzF/YaEiumxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117507; c=relaxed/simple;
	bh=BssiN8tl0qU1iQXG8+lB5lBZKyz1PiocGJtwp+eWGEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CXuAclbHZe/ZjkYRkgbBDFSRFsLa97vmNb/GpQ/r4iBNMctChUDdMhJFDkq3sALuP6NaIoNqFIFvo2mmXqn7fw/zVI9OJ/np6TT5UZXlX+Dpvwmdedf419ezT8yRSAclUmnrkxCm6PefRPfHGuI4YfBzPPPtB2ySLvtoOCJDlpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfqF+dvo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DG1X5DSu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326lglH4009757
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eSDnacEmZXI
	09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=; b=CfqF+dvowD9s0QhWzwX1dXqey1Z
	T9ZpC4k8ZVF4hFHsP/E1TaJbOKyDE9GVQQoXhEUYzSYrpKTBassT9RppSxxb0/wQ
	ecWvwifwjmUlD1MUkWy+ZJVjwDGCSW3LVdhG1qpBxX0vMJCLJwUVb0zQYfaZSqpP
	+Goj4VaNHxV5V8CWZOLRV24/rxTLIY8/8VIuSAKDoMSR61+l19j2G56GNfLI1HPx
	QsmaHh3j9HKTu0Zus2BRTpjARINLso4ZjUcCxFalEbJBC2leozFT8mnDpNnnxJno
	ky1jgDPKnNcARi56KO9HsqiiLHfgfoy57SkqRqCR7/97hoThb9skwhOd5jg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e02y3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:11:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b6f869676so14347381cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117491; x=1775722291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSDnacEmZXI09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=;
        b=DG1X5DSu5SG0U95yTjCxBKKGUxnRBZWK7zjbYmkfJM9zNEUxPv42Z1OmpirO3bh4L/
         ISGUIIV0GmEvbe2/Q0ElAeCuKd4/ea1CPosbftMtB+rVqrINSJqJBjn397coYJE/GT/Z
         3xojJMFsy9SgSDxKVW+ZU3ExstjtIYgvVX0aCe5txHNHl/vpvu+nGPQMqNH7f/quc3kA
         UNL45lm9kigFMoJGZKjSppUy7h2UQn8l0dT2D4l4afc2D7mqZHwTnG/PMRm7qekUjAIx
         x9Xv4fQG/PtkqcN9TJ1PsiIXXPMMCj0BlwDWeIooTeB5V8gOugLp50BNOt1/UfwrvtqU
         Nhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117491; x=1775722291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSDnacEmZXI09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=;
        b=HHFWfZD+He3YKDMPHoQiMHjr/zkBUIRuOjZ12q+6aQLdKf5dVsXdDjXOLyf0K+7A8m
         LbpcdK1jLwivFE6jcYoFB9R6veuW2gLd0vbf+zxMuFO5egXR8lxolMFQrkQwVLP3R5Zr
         l8Qennzma+vLy1KudItzrnivRYAE1TFAbdZBxXZ93yE1PjTvNEPLXifEbaGXUYOePFgI
         Rk7YGaRTpIXl6RiwP7nGdvD4jWzRu2Q9ZPLbmd/5glFqdR3dvBLPL8KWrBuThiHiuLS/
         TVfbCs97KHdhYrlXmreTD459RFxbjuVNOyxzKb+eiapnv3stIPAc7WP16dY4MiJUtlVT
         dpqg==
X-Forwarded-Encrypted: i=1; AJvYcCV8+i/68Ou7WlJxZjCe+GG0MZyLfJWx75aUrdlYwqONsz3D89fmVHeCddtahsc1hdqGThfR9hAkd+ZXuj3W@vger.kernel.org
X-Gm-Message-State: AOJu0YwmyVELDGyIzy4Y3m20rPI5al9rVREdrmOalYonq9+IlbA1Exdd
	XmdypDk/m3I8d1Z8byyXxOyQIBM8b37Z/D21tMDZbWosdlsxs1Z7GyW5R57hzTouNaNyfLGsPUs
	BGL1sFeC1gZ7J87XUt9d/7rHJBRbz+bTOI7BqpCLULsKHlJYq8yLdmfLPK1kaWod07HAT
X-Gm-Gg: ATEYQzxohLvFs7cE24h2stSAo2ifXpSIvrObuNEQ+XeMlzi/He1S+eN1IgEKicPe6Zr
	HqM8wZ9GfjOsa5hJuXFiP9iWyddfFI1iB4fU6dfjonRNdEmnjb+OXFmAYsYGsWVdNVk/5DWVKfo
	ltEDHe4KEe5aC7FBz8V6l9fK+QAt0XnjTjy8Wg4UTDYJnjxECBL4cM6TlKON4gbGqzFIF5VRJxt
	Ll4dOkLRVe/R5YYWUXJGtwg/sUcr12J6/HzktBaK02IrwwQpFBjzPCy8jSDfnQ7o0+HX/hX3Ocm
	cqCohR+7qdxeCvxlW9CkyosO8YgeIkKwGwOzh5MaC4U42Z8AXx/D8TyUhuNL8s/D6u3pzGzb2dp
	z/FfgbLeB/UX+xd8y+txQ1wtFCANeSwYShNNawTIAVPeWN7IV7WItzrA=
X-Received: by 2002:a05:622a:54:b0:509:2858:3c63 with SMTP id d75a77b69052e-50d4bb5f1c9mr36507631cf.23.1775117491408;
        Thu, 02 Apr 2026 01:11:31 -0700 (PDT)
X-Received: by 2002:a05:622a:54:b0:509:2858:3c63 with SMTP id d75a77b69052e-50d4bb5f1c9mr36507241cf.23.1775117490889;
        Thu, 02 Apr 2026 01:11:30 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v9 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Thu,  2 Apr 2026 08:11:07 +0000
Message-ID: <20260402081118.348071-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce24b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WbEMVPVtDBSXEMPt_8MA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: lUNaAwuq_-0u-SOfqwlH2uCzyqniEaLI
X-Proofpoint-GUID: lUNaAwuq_-0u-SOfqwlH2uCzyqniEaLI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX3fuv0w6ZkCgq
 ITEFHuz6GEtALPLi269F/H9tOYcX4JrmOMSqDpCf1G4t9XA3xTEcVbjLnmGgeCFaJDtJoGqP3jV
 F1+tiHX1FmVKSHSRwzvIcK0wCXI1igahpNSEQvCh03lwZT3zDtHxPJyZJe8X2A3+NvuoXc1UmWt
 52Nh9R7UmLLFcqN8E+8sPhDdtXd0LPK1yoRz5xQQ35jUv0+7rmQ9pohkwOMYnkLb0Yy3IuU7kwz
 adRz9Ie1nJnQ7KRUUVNZuZQQ21H9b0mtuBuzdhSYNRXFSEuXChxLpghAGmignKXOrbWmRrs0Tcw
 AZLsFGkKi2hE+qvm0BEwwpiYYiBFTNXV5q8hMC0maMY3hdTVrbfmEyu8zRGfMm9vbAVDWQQxD2E
 t7z76MmDeDuhF907O+Zp9xvjLMwGtWz3kMsviNKxCNXOfeWDKDyBqUqdG6CyxhnbyljaDCDtw99
 vWIfON41XbeD9zyxNfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020072
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101465-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF782385B3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by depopulating them in remove callback.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 069048db5367..2dc525c8be42 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -762,6 +762,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }
 
-- 
2.47.3


