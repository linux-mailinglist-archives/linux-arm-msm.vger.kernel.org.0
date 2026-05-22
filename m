Return-Path: <linux-arm-msm+bounces-109157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKphK4a/D2qUPQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 04:29:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 268E75AE017
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 04:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82F5430323AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 02:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004A03594A;
	Fri, 22 May 2026 02:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XaYOcVoK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEKznR5s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432C2F8EB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416947; cv=none; b=oDzVEZNib2Qyyz39vey1TXxUxZJkCrNBo5IOiCJ8L4MFvQl99xaz6dbsyklstM1+H/gZRxk4t7PZrNEn8Vk+sf8XatvPJQ9F1+LUqC4YydUG+A6AWtyF1VNi24pWjIcBESsc8NfyuFG76x+Yfl4cwqCIW93vD4z/3e9nFpz6lRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416947; c=relaxed/simple;
	bh=PF/JApBw3jU+G0w1YPNjhHQ0K+Kfl7EII6+7jylmzHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fJkcfaBMO72TYEku8i93GBIf5P7JwLuuMLa+Mpjrmtc0ZMqcVt+/64c4QzcY2Ci4ODIoVWhNJzXPFJNSPiMkNOxOh9jUrLcLj+SwAq1wL6XGgxQ9UhRGTiakZp/UlRAHNVwQmLKfv1EsmMu4yTfXIDqjsQFHBdSgkZCByLx8+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XaYOcVoK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEKznR5s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGk04E2765100
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L72rJ7gbfqTsuIIcEDgkzY
	59CvyMaa6z48PV5hmMSQQ=; b=XaYOcVoKcpMP9T/cQjvAQE3J4KKluQR3RKYJPJ
	4Pn5J68AG2ubNW+zIrO1N1VUoMQq9bpjpKvQUfa8zvUTsWTGAwOS3D4TeFj2iQhS
	8XIVLT0kuMrGGxFrlGQJQ4wz03JW5r8KNcdjJz1TO3aogD1a0PuIyqbczl3Qtjbf
	LHQ8a+NXNOhRHqKVq25bI7rg6jg0DfZR7JNb+PBJ2pn9ssOjsPm9BuO8iUYQDh31
	dR9YISkL3JtoaTs+R9u3+3D5J6mXGpEhDv4+u2MuZZrSnt1+7Wz1wiTfmw8njAxv
	Ulm5MkSVIcYLh/VYmXPa+fNdwGLc4GC368bV4DMvGJ3B1Ohg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7tpte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:29:05 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5751772dec6so14695394e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 19:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779416944; x=1780021744; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L72rJ7gbfqTsuIIcEDgkzY59CvyMaa6z48PV5hmMSQQ=;
        b=QEKznR5s1XPAXLozRG3E/jUEdj+3+lGuhBkcrWpYi7TdZ+9ET2QhSzo4y/mTecrQRX
         JzImZ9Ocqp4WXZVHj298iL1MNstsTaOZ0Ns0kZbBYd4Lc17E72DDx7EhgHl1l/bqAiOI
         61I9Goj59lVcwzasOpMcMd2vDREF/rfLlG0s8//r1L0G+FIhLq/ZLvG4pvvahzyGSwUV
         YwEw8eYZ9g2x67Noa8gb3Qml219zmI/zESWiLd429gjbC/Azy1VeptClSwqBsY8wXiU0
         ASby/vpDBCYSF9g4BvhljvNd8LAyT4vCdC04yAvWwEsqD7Ypi/GOhrs06vc7MqEHFZqt
         hTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779416944; x=1780021744;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L72rJ7gbfqTsuIIcEDgkzY59CvyMaa6z48PV5hmMSQQ=;
        b=c1fR8oUhAXmZDuxKTGeLtqpchhhwdTIZwEigDl/LJkaELQJ8F2zAiq0uCOusHANret
         zeXz9MQ015cFvozrlNSJ8zbo3rlZWlTni2qAVSTfK96SsPTeOu+lBeZ9acnFVZHTwBFD
         P9Qi3S9dXOQMKHVLgSq4YCj06ChPvcjHnEwKfe8MNQD9gI3W85/igjjR3pxtsaIrfmRT
         pCiRGzWL6i5XIPFsVzV1bfWd/oNP9DDXPbpVbw5+fiEMLC7yQ0eAY0lzp712IUAyyADg
         rlfiupjsI3ijzTeEjjaoK/hDO9qmhTyj459wYpTIIIVViUCm/Ww4hXWsb8LMw98MHFGz
         GeTw==
X-Gm-Message-State: AOJu0YwCEmM/AkBikEHx6+UYfu6EzNepOQ2O3n4bm2ZsGEc8Elf5Tyhu
	wVhh9uG+WZWUtBt+fJO/RHSw9fEyUNIyKutofM+ejvaojWHnGsbee4JwtgqK3xLMBVNrbqaVCAd
	nlzCIwUeLoHik8rMA5ObVR+mfY/4wQqvHndNBu9C5979WYJVmxqs4E9FqiJJPF/WDv9xa
X-Gm-Gg: Acq92OGCp+rmW0PZLepJYEBox86W+K7sWs0xLaioDPl6Me96BCaSIzTOHAx2nesuhYm
	bD7/7lOiEXz9AHAuSSl7jz+7k9T2QBPRKG3XYyItLV83Wwp0ESDzbRlqtys0/VzCMCLbeUKx2Hl
	jqw/urnJXj/iXpgHZPPlR8iG9m3HzNf479asW6YK4xRjs2O81Sg2bxKb66HCGGFNIzitblA6jS0
	UU4uUHSP1BJYeW++PoK8eBmG4o/Mn/vDHmBrlFM5Mq5ccRGO9RLDeSxnpNdu1Z+1RCwWTbddPL7
	D0IXcAg/9q1smVM6RO575J4QRcVeQC1goZUCB8ElTFWXft+P0remoKXhaUo+yHtrEMqR60Sy8xA
	5l1aak40/FLU/NXqCdo42PzD2dRJbRt0ZLFcpochZ5tfyLNyp2aXRCTC+AA05FJUR8pwNLSJNA7
	t8ChH44lHF8eF1Okfwq6p8YD+TOx1aanDAW5Y=
X-Received: by 2002:a05:6102:3e88:b0:631:ec2d:12bd with SMTP id ada2fe7eead31-67c798ee724mr848364137.5.1779416944563;
        Thu, 21 May 2026 19:29:04 -0700 (PDT)
X-Received: by 2002:a05:6102:3e88:b0:631:ec2d:12bd with SMTP id ada2fe7eead31-67c798ee724mr848273137.5.1779416939397;
        Thu, 21 May 2026 19:28:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf939fsm65739e87.76.2026.05.21.19.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 19:28:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 22 May 2026 05:28:55 +0300
Subject: [PATCH] drm/ci: disable mr-label-maker-test
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-drm-ci-mr-label-v1-1-39f778123b30@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGa/D2oC/yXMQQqDMBBA0avIrB2wIybYqxQXMZm2I2ploiKId
 zfa5Vv8v0NkFY7wzHZQXiXKb0x45Bn4rxs/jBKSgQoyRUWEQQf0goNi71ru0ZK1xgRbcl1Bqib
 lt2z38dX8HZe2Yz9fGziOE7e16CFzAAAA
X-Change-ID: 20260522-drm-ci-mr-label-727766d73e95
To: Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=952;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PF/JApBw3jU+G0w1YPNjhHQ0K+Kfl7EII6+7jylmzHo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqD79nphHZ1DEfGwHja0hR8+HnYab3Tu2gksfIS
 h0gt+twevCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag+/ZwAKCRCLPIo+Aiko
 1fyZB/sFkRLW0u7tdo21qpSYKut09e3SLBIxH6d9IooE90MC02NVZXolZTC7WKj/vTDnuSySZtM
 hYXMur8QZ5WadRJeQEfvtIH804eYau228rz5K3enPb+k5LzEEIFlAiy6Uc4kjUc1qK01GlsgAGG
 S7PQWvzlp+s/+EM1Feb6VHuMYJTzXHZ0bt6D0mTzZpEOO5ulmpnWEWwPxYIS761xDwLWashMz8I
 2V9cLma4HkhYsqO5BbXT/Ay5Gg3Q5XOGmWOEN65v6o8t50gROc4oQyaco7aEYhx/UoJXusTq7eP
 NoOhgyKcyAL3fgLkIpwmfz5LNCMjy95E1ABv3UFdmtutRDD4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a0fbf71 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=_dksh78a8adESa04-_QA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: IDXtSzb6XD03qytW-nTHZWuG7SvsUDkf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDAyMiBTYWx0ZWRfXw2bpD4/WUUyG
 wsaOy7VRZxZg84U6xuLH9o8C6/h/ClZtygD7lBFWa2JXGDd1Q9k3gLS2nJh5rS7jYjBzs3y3puA
 N9wKcVPVJxSxHApvZPnRJwIkumOzmathyNqFpec3LBYQfTgvcnrsb2M4qY5YbfA+uk3Zw80SRJb
 6puwsksbrXDtP466pF9sgaHR6B/IVv7tJ/W2Ws05nYAWB2J1ktANS+3S/8IHhzliygO7O/+wpPp
 6M+20LMxKdm4WPhlg+100UJ6TKKozn5QEUM+nx16c0ljuqbdKt3YfWBV5zbm8gvf/jFsd5f9TJ3
 4Jcyj1kLch7WFx5bAaLKX99TymUaoYoCIsX8HaojSOhylt3xKI8Efgvqn9JRUYDzi8ldbXlX77y
 Q1LrBUiPO/Puikw3SLHCPJH33yClYpgW6s/Bu2XQNDfV8hYkJefzSwbkKq0yoor3vxfz/f/w5pe
 b0cUsFVUkK1CaRcYodw==
X-Proofpoint-ORIG-GUID: IDXtSzb6XD03qytW-nTHZWuG7SvsUDkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220022
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109157-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gitlab.freedesktop.org:url,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,collabora.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,oss.qualcomm.com,poorly.run];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 268E75AE017
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MR labelling is not used for DRM CI, however the job got enabled as
a part of the CI pipeline and now prevents it from being executed.
Disable the mr-label-maker-test job implicitly.

Link: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1672049
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 56088c5393cd..c1087731d1a2 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -386,6 +386,10 @@ linkcheck-docs:
    rules:
     - when: never
 
+mr-label-maker-test:
+   rules:
+    - when: never
+
 test-docs:
    rules:
     - when: never

---
base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
change-id: 20260522-drm-ci-mr-label-727766d73e95

Best regards,
--  
With best wishes
Dmitry


