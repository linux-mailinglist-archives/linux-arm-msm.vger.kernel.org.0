Return-Path: <linux-arm-msm+bounces-106256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EL6EiQx/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:28:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75D4E37EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7FBB30804FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5696D33BBA2;
	Thu,  7 May 2026 06:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+GcArRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQND9+EJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164403385AA
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135026; cv=none; b=cNo1hPBoUQQiHRhGePoVEODKeltq4dbS7oz8FT4i2liv+bLCSUSaSpxD4Ezn+rzNhTLszpgUjLoF3Ciuz4aRPH/H0tCnFGj5yKFQkP/1FMCw77wAtvA8yT7sNx7WAfKIwaYV4Lh946Iro7MH2VJdAZgg2x5Im+rZ86Y/6wb+c9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135026; c=relaxed/simple;
	bh=UgfBCZ1rMfVTJev0k1z1NyPZBVmzJ4hpyWJ3luahNzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N+g+aHcJU1S+NOJ1XPmYt9t2CdULlsBDjxNa5djao3Vt8QRMEhMvbVkZfe4zfW05i3cY1hmEBrvc2MapmIguU9AJzmxXGVYYHp+zXHdkT2/3wIF5DGsz1iKEXMgtIlsCrWBreQA4I3j18pqiLjUmW3lRcfEPiQ5XsZqHMFIsp/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+GcArRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQND9+EJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472LQpj3464724
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9rNAGIYUfdj
	1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=; b=S+GcArRVddDimIfm0VImbZsU8Jh
	BojGaEBTeO+nt1ue0Qo77p3y/UgonoABpbOevp9/nGuz9PW3MF8YD5gHhF3zl6D3
	hTbt6hN3PiAxkOddtM0HDKwxg/OVlFgQ3y+zFUoo+Ir757YYz0cSM3HdaX+Dc4g8
	JPOhe9WYHuv+8ys5rhJJS4AvMG1Nt/DiWN7ecMTuA8YRyDgBD+vIs10wF+mKJfPE
	sLqluSCWDcs9MXVlPhRwAWBCNFi0RtdqP0G5c3astwdk6iv7GGOBmCSmzCNXz636
	djZKA2peeZvhaK0RSj0lQgIs5gf5KcijeJQx9NmYIQFMRCOiydiW/FDeRsQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn0qn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:23:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso292724b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135024; x=1778739824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rNAGIYUfdj1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=;
        b=CQND9+EJRcAhFmF6niyChRLhH5wvmwVqjOn8lkMCUzLUu5oqhw7hgXR3VcoPMuHxJU
         m/y1pUp/p1SRC1i2fcBh/yF6MYyx7ZmzDrEc8+EpAIuQRMUHhj2izKa2ZIzKvHQ1RCpz
         mY6UYX5sL8S+Y/nbdmbdo4xS/2EaKKfUpAqy7WaqqPMOdYc5h6EZ1kpI13YigqNOvT9Z
         r0e+9B8boE9NnlApmaNjq2eBDDHjUQNxItUqb95X3pxO8UgG4q05DHaZwoetudlANUFA
         FD/qD3fDeaNCOWXTSyu7zTzGU2c8pNcdTaMqJWitll2zgBfeuBmVjBFsx6+u8kwv10nE
         jlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135024; x=1778739824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rNAGIYUfdj1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=;
        b=jh58/ZdAhnarqfupvRhf7dqkTQC1yhAbLjwf3c5UyyodGuVXevpfT3l7+CySA10c5P
         gakW5Qid7ZFmzoxQ4yi1vz69PBe6jnksvJ6xFjJWVoqJ3B5yobsd24VpFU/90VxWnUBj
         Jx8G3v6FxHDG53BceJo5CgB1eF0IAS+0f1tMr5F0ItIYkVA8dZs36laMICrXYOgTAHcm
         QkUnB1mTvCPRppPE8pxmMJmJUxXIB0MOEYBdOIv0HQvHoCYrak+MBXm54kBTEepRikfr
         q1ybkGkHp6dIfmmFcKjxIiPuSq7bOnFswjD+45/AVYccUUCNEMfWS7Y+Shy4t0HQxCXK
         cZjw==
X-Gm-Message-State: AOJu0YyYynhvJTWrJN1xQaMVQGXiva0SmaYI3bz50qrcZLq7GFKINfyL
	3HsvVX1y86plekgRnigL2pFhD1QbvSSKGjexTzMhhFui+jXYVzb7U3XrSj7N8eOc+g6EiehjSif
	puiEgoLHau+s6Dx6wzHgz+ZJCyNzxfKS2pEPt2t1BnLgoZLruhXtWKubmxELT/Pc5NjoB
X-Gm-Gg: AeBDiesw1CXlGq4yBkhbPjPtcZZSuuIfuL975kQb9D3ZlNidqNxzgwFvwlm6M/xpwTC
	kpLO0YhR9r52ONsEdE+swuUjGpoFAtSLs7xG/FkKzS1nHlSrbpcvQ6qsQBis09w4X2O2sMqJnjI
	KtgljUWxtkPeOmJG9s/EObe/EnEa7ypatTpMBvONNMnOu5PFqIDZ2De4uXxXa7yyfg4+Y4dP8KH
	XyVAy2JcYH8utWRbexmQLfnpyXW4qqoQsnsZ7KizfQf/nysi9/b5/W8f8GosnRiEUO739gUIomW
	gdl9mhByVOZ2VVwR5LSv+YctbRSC2plD8GpUeP+ungB+OpKGbQVQneZhHeQJVvjetj4upgBSHUR
	YAiZDJ0e0mX5u9g6jYUXf4nKNKQEnj8wSlKf6i6jSaraD2Vk9K7dYSjz6jwxocML8CCFyrzFUCH
	y6YVGEn/T29c1mfwqjZRERaPbFhnPw3+5adh74cpAs3AERSo7L/On3YqoXvA==
X-Received: by 2002:a05:6a00:460e:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-83a5b2d3078mr6499160b3a.4.1778135023527;
        Wed, 06 May 2026 23:23:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:460e:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-83a5b2d3078mr6499131b3a.4.1778135023021;
        Wed, 06 May 2026 23:23:43 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:42 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: [RFC V6 8/8] arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS dvfs
Date: Thu,  7 May 2026 11:52:37 +0530
Message-Id: <20260507062237.78051-9-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfXzdbY2GU8Hx6C
 gZldsIDRRbKVGpdhFFBiK7JwiaVCWlFZs7pITpTTvvYHelBdfsQ7BFWnm4A0+5LHUbn9Vzj41as
 CgSwKG9peEKdeiVEvIbrkOV5yk03FsVQxXKZ1ZHnBLctDd+mcvWAROz1Kyi+yWFQLIJmbXU2Tks
 7wJNjfCKAF8jXaIYyd1Fl9J8pCGlOONhrdJx4j+hdni0o9hwqXpkHOFsaf1PbRkZUTxSFJaXrmD
 iD12too2LHUAHKt2zCgthQApPvEYACGUjYjaTcRzJNUiquwJrLwqb3t9pKE2mBVgbs5s9neYHmJ
 30kKfCrLmY37d8OMarJ7dJPZ2c4oxudWaiWajMuMi2P8AYfl5FaMhmGEPDb4HeDuFlFNHioG93H
 EIXOMV9ywTC74u0O5Ss0dErviVhy7+km48PyrCQcxdvDolpfwawLsJQkNcZJBkb6BfaaqhKRm+C
 DN3hR2joVyNqUZqpyIQ==
X-Proofpoint-ORIG-GUID: 3SUNXrQ047BJEy3cMq-icc0ZrvXqEm8Z
X-Proofpoint-GUID: 3SUNXrQ047BJEy3cMq-icc0ZrvXqEm8Z
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc2ff0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=gKi3Cb3mJvt5RuhTHbAA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070060
X-Rspamd-Queue-Id: 9E75D4E37EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-106256-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,nvidia.com,kernel.org,gmail.com];
	URIBL_MULTI_FAIL(0.00)[0.0.0.80:server fail,0.0.0.13:server fail,oss.qualcomm.com:server fail,sea.lore.kernel.org:server fail,qualcomm.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[21];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.13:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.80:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism
to control the LLCC and DDR/DDR_QOS is hosted on the CPU Control
Processor (CPUCP). Enable the nodes required to get QCOM SCMI
Generic Extension protocol to probe on Hamoa and Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..a2d5c9db984d 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -338,6 +338,10 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
 		};
 	};
 
-- 
2.34.1


