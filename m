Return-Path: <linux-arm-msm+bounces-99881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F+ROz7fw2kgugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:12:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5579E32581B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82584301D326
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFB93C344E;
	Wed, 25 Mar 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hu9JckLz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRIeBNMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B543A4509
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441339; cv=none; b=a/tSjGtVK5O7rbUspNeL1HEAqD60KhCpM8ExvPiXrM7Fdy/axfPpPNZSPAaTYBuFi6kHxHBrpTtOZnUuG09tCfxIOHNkGcln+avgMQsq+BesX0zsc7zPjb2MqhCRwsWKsWW2CqvsB1empo11Cp+bgAsdeUK6sVfCokGFoSsAM0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441339; c=relaxed/simple;
	bh=QjvkBHN0Ynt5Jyhs8+7uWPeH0tUdVFEn5b4Dr7UXA5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BqjjXPO5EGcIjtiNFFhAhPMKQx6CsESwUK3cw9jbpktzqdkg/cbz42ujYA8siPXSsi/AarQK42aUKIBdZ+XMQigAoYS0Ckfmy91/pNHK050TU0PJUaa+kkeUwH/WfRD9+ur8qjGJw41g/ydlXjZ9mW+vF1LBUGT1YkwVlevvmO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hu9JckLz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRIeBNMk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGTEl1895529
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eHIn9NS0KiffR+kOG1GENdB2A7PEdYJt6Dc
	j0vJAwP0=; b=hu9JckLzgxV9D1/XwASg1OCyoW2Piy/+z7cf89BHIJMasg8LZI8
	lirq1Yk8Y3k+O0/5EpFpHV6lLqiImbxrXS67v93A7T+T0Pzhh5bdjekRTV1PADdA
	ozQaYRKqeO1BWEkhoM1YsDP8Jw71TAPcI/XV5XvsJikoBOWD1jSRtT+yxbKtG7AB
	mmKATCnBOz22nbygfGx27UKX4/w5JUTdtSh11EYhAqDRsYnjtngYgP4NZM788h/1
	qLG+mRgmNLoynPaxAuDOQ557x8dBJpWuk0mdg9yK7jNd5tAkj+xxrtXbo+VGwcGc
	FHkAnsxh4jAJgHoXC46GpfA5KV0m9dZLxIg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mhr5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:22:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899edf01747so483010856d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441336; x=1775046136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eHIn9NS0KiffR+kOG1GENdB2A7PEdYJt6Dcj0vJAwP0=;
        b=KRIeBNMk1v9JCjTw8KP2EcRejxEFPDFi6f38YGBBs8CTb5mu5N0qum9RtctaBsaIO5
         PXg9iGl6N9j0Fj2w8f7vfpmdkRrcd+JRa/gzZUCQ8du0HsoR8pgoKDJ4e31pexKYsDDd
         QL23XYxpFE9RKBBPBF0Rm/99geXqxQL0Occ1pVjqbIhIM7lPGKVA2rfilweslJRbBQ6V
         1YrOmWgpbqjp5nfphq2pjJTmAOs5izY6++z80PiqivCQg8gG9M72wBRq6Sr/1yT+5poO
         Mj8XFWf55pTbZPBZSfgE6wJcO1sDfXSKheoIReaI8JykCGQBf3Xw/ypAdHqNNahboJMr
         YiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441336; x=1775046136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHIn9NS0KiffR+kOG1GENdB2A7PEdYJt6Dcj0vJAwP0=;
        b=aeuAyXYy00HJPcLdCPFC2U+ePvhTaTXbylHOQIx1IltRlacQehhUhXnONbcHAGfE0m
         zMA9zjniXQPBMSYVeigWKGxX2jfw58m2W53dwt4J66rZut7G1PbYLU5MmKRfiPkgGIEe
         ZwXR/Jqi3bVbsQUyRQk9RsLqaNrKba1p/y33ESpQkX3uI/kDXc418RnMc2wq2sBg3JV7
         8vIupK8zCJX5rcKmO/OvD1BoJ/uxY2blo8k+tOqxg7owF341UrwrYBWZ/HfdYNUZ0ghk
         8PVncDDYGX3HxNHc8POa+NoReXziKFCp/wO5WH7TNXEWBqZ2vlBKFw7rdldqQ6ndkRcL
         0MzA==
X-Forwarded-Encrypted: i=1; AJvYcCX/Qu/EAGxttH3Cl9Yb4H1NbYu3elKxnI4ipyRWVh99oxMP5V+NT6+06o8PE+Pq26iCHoTVyAqvHDfrWntP@vger.kernel.org
X-Gm-Message-State: AOJu0YxOEZtDALvaaIElN2Z4wfO5nTwV/pSoJCsm09F5c32VTIQA8s27
	WOH1CVdnHi6NQ30KddSjuVE+Sv/LlaVgIg5KqP80Xn+G2mdjo9ofXHrGmVB5XM5EJXvo3e/K2M8
	xtSBUp5jAkmGM2AgiBpS57UtpbNAH6XfRJg58aFdMFpZsv5++DDKA5JXCPqzDcb241Fk7
X-Gm-Gg: ATEYQzxlXbegcxVrlyWju9jSDp+PGtUXzf5c5fS28S++woedFomrpxlrAuu2kWP03ip
	KDKNvLFJmH+tew2dlem1yn7L9Rb0vGWk88MfwE9yQd9Nd/EDzN6nUU1yEri4dHEmzlWMsuQbzhC
	YVDkBB99lQnlFuDtTth1d4IhzMMi0VgV3nf9Ys4WI/r3XgvzrRg7kMCzSf9A/benMANf9HzUs+1
	RaBBj27f4Im2utk2oxjXTEPgMir43oC2W/RY6Qz7RVr038lTj943McdXn0b4jvyaEJzNqCkPNYm
	q6YXDsfO31g0ACJ70bF+A/Y2DbbM74BELQrS49Tc82/WNvBiwPD1k2OBV6SZWDF7d8iWWUjh94A
	2Wg9DIa6rP+LnUHg1/VVNuetATpaU9nhFgHQB
X-Received: by 2002:a05:622a:356:b0:50b:51eb:c353 with SMTP id d75a77b69052e-50b80d3aef2mr44187231cf.31.1774441336128;
        Wed, 25 Mar 2026 05:22:16 -0700 (PDT)
X-Received: by 2002:a05:622a:356:b0:50b:51eb:c353 with SMTP id d75a77b69052e-50b80d3aef2mr44186581cf.31.1774441335439;
        Wed, 25 Mar 2026 05:22:15 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48717346586sm22144265e9.20.2026.03.25.05.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:22:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example
Date: Wed, 25 Mar 2026 13:22:10 +0100
Message-ID: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=QjvkBHN0Ynt5Jyhs8+7uWPeH0tUdVFEn5b4Dr7UXA5I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9Nxm5PL7JhepvBXiMriG4QHuwZe/xicXV/X2
 LdVPi64EcSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPTcQAKCRDBN2bmhouD
 18VQD/9L9YY50PR5LIozttUq7VvDc/Zav5wjCsy66HYEO/CviFL14o1VuslvysysQHtUAQUOxfs
 ZU4he2eeCYS8g+6906mvRZeyDbYC9M/rs9H7OJhXtq0Jt0g/olh1tk9AGC/pLL+BOoP0e0YLf4s
 MLZcSu2CLsui+L3NwTpRTd6Zyurva98AwOZLeG4nCT5RD0BtiOujwp7vpLAIIPi++Z4EX3NHtiA
 GquD3taiXqidhgJSncgiKG0jJu4gzkOnwUqcNtE58FA0N/qd2VhwutBQEO7Wi+eAg0A9q8t4eCq
 Qfzlo7Ww1rllJtyL027qkWUfBSROzTAduF60YRZhrf/pgMu+nQ02Fg4orw712WPEV6LGBIztyTo
 4TCb23Ifk/p+3448PvxIQIpDGmbgDI5UgA4p+K/4xXcfK8Gxfr5ac6DgimoXvSLT8zBrpP7LpiA
 l9kxS820EG5annExGcaP2T1coGknn8VKrlUyYjw5WdO1w6NEDEz6S3PnjQehZr5VlQvj/N+VOUX
 ymmtRF5lOciXhs5cfqUjWXkmDgsGfJnhijbWdSkpJFUFE7qGSqe7tIVOKb3cCdAfDgowZfvh1b+
 7QBW2mwx31Wt+qILUO3m7t3g1RLVvvM3R8XY9R9bkySKnjmxuUT6RvvOVwwAyn87w1lTWjJfY8B mjMwb5NUCeh2Lhg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4OCBTYWx0ZWRfXzEqR5q73DJr+
 bSRlH6jbLYHdXZOOlx2LwrClHWhDdk/f01J4Lni3rpX8k78RseraNEDXEqGybgECRXHdEL4jcmj
 SLowJhs7zqQIM22uCmfqT16deUW+GGQ/VIFuDP4gwZZswXU3anRZtjKYx3/EvoDfQCasOB6MyuC
 deKPuzvC/g10TntOYEDGpYOyy9db8riVagJTOQbOeA6zCPKGtKOta7jrTFK4ENy0x6X6qPJS5/F
 UmJ4gEUqrUjs55kFmvD92YAmI4IWEP2e4fh81BvDOI/MM2mBCRtZYvsSU82UszFzZI2lJVJe+gL
 EPJLuuvqmD4ua+52+T8UJnBjb+bxnXbYff1sn68bWBrv0kDgFCSFfk2RP0ornKLVG9LTePJP8Fg
 0cjKzppPEVHWgXIeLH0QF5wex5F/zJzVfYC76U1JM7SXewja6tfb6HBWvXs5Nc7kbk+2p5J4TyJ
 wYgDKXZj0VTxPycRTFA==
X-Proofpoint-GUID: n_bhy-tLCM_hzutT3xnB7mDznrWPpcAN
X-Proofpoint-ORIG-GUID: n_bhy-tLCM_hzutT3xnB7mDznrWPpcAN
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3d379 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=u0WoYhsv3NxjMHURO3IA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250088
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99881-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[5e00000:email,5e01000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5579E32581B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Device node has children with MMIO addressing, so must have ranges:

  msm/qcom,qcm2290-mdss.example.dtb: display-subsystem@5e00000 (qcom,qcm2290-mdss): 'ranges' is a required property

Fixes: 966a08c293cb ("dt-bindings: display: msm: qcm2290-mdss: Fix iommus property")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Fix for commit taken by Bjorn (Qualcomm SoC).
---
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 2772cdec7e42..bb09ecd1a5b4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -108,6 +108,7 @@ examples:
                              "cpu-cfg";
 
         iommus = <&apps_smmu 0x420 0x2>;
+        ranges;
 
         display-controller@5e01000 {
             compatible = "qcom,qcm2290-dpu";
-- 
2.51.0


