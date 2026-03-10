Return-Path: <linux-arm-msm+bounces-96477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COVCJUOZr2lbawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:08:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7BE24522A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 386B63035A7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF2C3CA4BC;
	Tue, 10 Mar 2026 04:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKZhGUCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEYVCiZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73E519EED3
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115706; cv=none; b=MzaiiHQh/IA7DsM6yYvXZo4ohHXjfMCuctVSU81vc3cEBTRZ40rQQxFiumlUNa7VPDRCJqgA/RKmcg01uxsNwCNiIrJz+emCrF73XLosX1Ye8pN1ekjcMqOZcsdE9iiCED3Ty/ObgAxNF3PEzdI3xotY2B4rbgtxpxqc7p4VY0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115706; c=relaxed/simple;
	bh=5WGjJQfPJnDuexpnhvHr50e95kQsz6NeADPV4jBOLw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WnrYGmLqu/4r/hSwbpwU4a0tE4N27Yy9KfwYN3L9DjsiesjVf78YuhBLoCdPrwrfhfyldruxziega6WOkgqGUUXYFYCm6jt+03lHZzhfa65mJtTlN9SIYiwTNyGz4NOBvEPyPYnUd/T2MRB8jMVKGv6WCdrRWWzdRAL1z8MJXJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKZhGUCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEYVCiZW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EPcs2817532
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l9mkcJOveNWh2bHKMgNj3rkVRVCgumwTi+W
	rvIaxz6w=; b=VKZhGUCmcGw8DCAOY/H6yEmLEqO2EY6D/++t/V61AIwhLcoHKOh
	kEmo+MjfEZDUbip/aZpqNBvWt1SRNmVkXJ+XpEsn/F76hS1CGju1dra4Vg/JPdM8
	tZpBWVUCdolBLSDula8LcFA86/RCb9AQEK47ZJKNNg4zF/YZEnn8llS1XFxBYodq
	D0yZq26nvAp1xZXroW2STj+jnefBWhaWdtTOMH8Idms8KQbVYiM+3t0GO9QqKTso
	spe5D1oNuLBJp7MCzy+t+XkM2652SrixaNOyoK5kWWjj92dc7ZC8s31zkcPPDsum
	p/M2ccSQOTxZ8FtOXD4qBBMc5vEArHM7RsA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr42dk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae49120e74so83727245ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115702; x=1773720502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l9mkcJOveNWh2bHKMgNj3rkVRVCgumwTi+WrvIaxz6w=;
        b=eEYVCiZWlvON2WfPouR7Ex496mZj2l98q0GoWbJITskPm4qcfNSguJD/YA1cR6vxZu
         yskFa7J0RHjEqVg8Lpa9gszaU1c6BC/0M4QBkkY37ZGaVXtsKkDCVDz2nisuBJrTzmLW
         bQFi9/Ar6d5xFhKsvduH1x3TyBMknAQ8suYuv1fR/pzf/lbFzwEobLX8/NKQpOK8x+oq
         jJ/+IEIo0ROaT2To0WCcT6IOJCaua1uZ4uZAmEN+x5nHWyxx95300X2YrNs4qArELmEi
         4e3xkDqUFoKDmtyWy0+sHEXmLRusWq1rtgbNpxuwuiUt5FeKnrOlHidUwbFyC4G+mIJ3
         /pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115702; x=1773720502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9mkcJOveNWh2bHKMgNj3rkVRVCgumwTi+WrvIaxz6w=;
        b=YD/8HWIvt4Xd8+e94V6fdANkeLnuqczd4Toq8AUfqWsDrjGevhtmQGP0A/JzAVzjt6
         loa1Xgo48wcfino6xknA5ygP+g7kTCw698heKBwDus8PUhLIUqCDBX2X/UWAA/9J6iXz
         PS2cjOEI2zNotRjS9yHS7F17hrLcpUH7SFiVL1rPTU/LcZF+UhCf1nCHBw4A+9vhXGKN
         AqzF+IgEQ1D/PlxzjeXg0nMTU1GmvIvcqVNihSC/QJ7246axPRGMmf+PALOt1YAH5j2E
         PsOn/Jiy7kBgIbKnBBi6zxIHeURPvC3qRMLU27HY9aObBR5AbK5JWbGdh6Q14RHQM2P5
         NFxA==
X-Forwarded-Encrypted: i=1; AJvYcCWft5uaOm51nzcCp2O0xlZKolDnQMncK7WiVO9gkatm2g8l8BKa4G/3l4+F4fVOdUZnIWA1d6vBSl9PYsQh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo/JT7ZD6+RV4BTTtWfb75ajQxypBIJJs3J/noDFOfzHLPEb1C
	KCc1wHETibVuD8l8kj0vIkT5NY8k+M5K8gSp5yVfGAH4Xfaa+/CP7oLpLt4zBlghF4dMFYMmOt9
	jbcIbwwLpbAXtiNjQLo/WhNcCcXsC5N/tCZ5IPMe0pDAkMEfwCCbOIFEV8RO6G3xgnHJ+
X-Gm-Gg: ATEYQzxe6KwWYJcYLRZGzDvy4ctZczQDE9CKLp4I7wSMvJSyaEZNWUpPX8hPfaFFxTx
	AIJ+kM8e1rY/PqnLp+ON2rkgGUbvKMAbx/BeOcUUJxOcKzlZW/3eaeX3Pf9AE+KGc/p+c8jEQDG
	XxR71+o3XEW8kCzEW+W0AJCfyMRNfykeLj1JM5HgNJeTRQIJHF+DyRPnO1Lqm6uXGd3Tb4DQFxJ
	OH22iLJNKJ0sxJBI4zKerQIhUh3EpB7kBZhnLweWXj2MWViKkYSzjwtqr7D0i2eUAK/QKN56crI
	gCPt9odLUVvKGlTETB5EWrt7TbBUFVIVdQnG5vPdabpZHWGT0bQIJ5U7U21QTD/7bYJ1hWaKM7S
	FIW7pTGGcZfv9ip3BSU1hYPff6Ctic91DVZ88fPApjcLZKD8MCjX+UCAcjDA4Xn32XcO4ZUuGS2
	dnWxznjD6WOqk9gUj/nqK9kR3X3QgjwpXqpxEM
X-Received: by 2002:a17:903:18d:b0:2ae:5eee:7a5 with SMTP id d9443c01a7336-2ae8241df4emr150168515ad.12.1773115701591;
        Mon, 09 Mar 2026 21:08:21 -0700 (PDT)
X-Received: by 2002:a17:903:18d:b0:2ae:5eee:7a5 with SMTP id d9443c01a7336-2ae8241df4emr150167985ad.12.1773115701065;
        Mon, 09 Mar 2026 21:08:21 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aea4eed00fsm9797975ad.80.2026.03.09.21.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:08:20 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: sudeep.holla@kernel.org, angelogioacchino.delregno@collabora.com,
        viresh.kumar@linaro.org, neil.armstrong@linaro.org, festevam@gmail.com,
        Frank.Li@nxp.com, danila@jiaxyga.com, lpieralisi@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings: arm: cpus: Extend Qualcomm Oryon compatibles
Date: Tue, 10 Mar 2026 09:37:48 +0530
Message-Id: <20260310040751.3132523-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX9Mu2TUzIG8pj
 8dMQ4V29ov5CdKec8gEXSzozInD1KaIPY9sBRXlt0k40zMNCBNEpb8Cnfru7UVVO27kU1auVtWy
 UYF8/Cd8Iv0wDrBxMP58CXqwynUM5neBJk+ev2V21soSCSwa+Cmsz9x6A4yYtTVb/BnZGbfmszy
 uILRaOmoa2xLVku7Ud4M+pse925GnV6b1KSlG08FsxV0HfzOsHU23PxgbrIZHC0FytThYKca+if
 hEh5A0b4oeU8eiKjKJ38bU2iNgxunY2n9LjrjFGET95hbAntz2aJIFfLyXeDVqQxYdOTyPc3R0X
 J0xebSbmUFilndMJNJB2idmBxp0yIREszLQWhLKKpTn13lx/yO9bus2cMj9S6nby6VuSRQYgbyT
 dtmSg4eYDRa/H35jr0Vbqll+YJ8EgBx95kgnwH6CPwOAKf11ang13wDLAKF6EHkHAsmU3aN5kC/
 5/zddyggc7g4f6m73mA==
X-Proofpoint-GUID: W0mvod-yQWeVVaPhH10XjKM1G8uV1tOe
X-Proofpoint-ORIG-GUID: W0mvod-yQWeVVaPhH10XjKM1G8uV1tOe
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69af9936 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=nkOEx1FirZyerjKjVqcA:9
 a=zgiPjhLxNE0A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031
X-Rspamd-Queue-Id: 4D7BE24522A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,gmail.com,nxp.com,jiaxyga.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96477-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The generic Qualcomm Oryon CPU compatible documented in the binding
doesn't account for differences between core types and has been
deprecated. Introduce core-specific compatibles, based on MIDR part and
variant numbers.

Glymur:
MIDR_EL1[PART_NUM] - 0x2
MIDR_EL1[VARIANT] - 0x1/0x2

Kaanapali:
MIDR_EL1[PART_NUM] - 0x2
MIDR_EL1[VARIANT] - 0x2/0x3

Sibi Sankar (3):
  dt-bindings: arm: cpus: Extend Qualcomm Oryon compatibles
  arm64: dts: qcom: glymur: Fix deprecated cpu compatibles
  arm64: dts: qcom: kaanapali: Fix deprecated cpu compatibles

 .../devicetree/bindings/arm/cpus.yaml         |  7 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 36 +++++++++----------
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       | 16 ++++-----
 3 files changed, 33 insertions(+), 26 deletions(-)


base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
-- 
2.34.1


