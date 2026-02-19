Return-Path: <linux-arm-msm+bounces-93389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP3dKO8Ol2n7uAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:23:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F6F15F024
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 20AF630069B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEF3339858;
	Thu, 19 Feb 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paqbUlAW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nxs2HgQX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5726FBF
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771507431; cv=none; b=N3smrJ/UgxCEgJkMII0mHcaNlza/XhNKHq54+EJa1XPQU1kNuLOJT9XdEQznpi8WlIrQKLcIKZfR9yoF3wQicnAHHa+xvI93ER5LMf7aBx+7Lnnq3JaXRNoFikQsBZuQ3HA06QikG4+o/4V+upvKEwFCST1sggFvxz/oP2IKdXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771507431; c=relaxed/simple;
	bh=vj18HKwlLBOBW/CBpGSa1EAkWsG6FMfMLXNlSdzD/IY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UhDQEmxZRU9+w5kYofPVBNaS0hFHaRc/gk89iOj7XyUGr9kIuBZTrB2L5TtWzY9Xu69rNGUvzANy/V0qePffrtaGhyhJxap7MTxBLoVKni3rI8kqJH5O0M4j0TmWfOS5wKffEh6i7qKO5UFEC0TrZK/1qbrHLx246HllynLKs74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paqbUlAW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nxs2HgQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCOhgj1716101
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oO1w9M3ieZZsmi27RolSUjneLeuv4Im1ok18zsHVGYU=; b=paqbUlAWrdg3nFru
	Yas8CGgh+8mkWwvQvkJhMTIcYeTu0fKPSlfN8TYs1TlLQkfiLD06mYZdjs0h3Z0L
	YcFeIFr1cP5UumHykiLmHCf5yuczvPRzBvO1+pre1ekQpWhfwVC3W5VjE4ZtOYHd
	iG3JVYs2/R+bKlbuURXBhsdjPcAW3FNED5mGaWuuudql+iIgMUJzh/B4YQ2+c10a
	j+A7GyPyIVSpSaeziuMCzzjZhMGZ+N+culkGS8rs+7NCTqdsX/G5L7busKfkWuU/
	g1vZq6SJ25O/ClOI5pLSJzakFz+O+QrnHP9ltts2KcQXqTFp/3BUmaHMnQyyINy4
	JtcqfA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce2ghr55n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:23:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6de06e6c08so637614a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 05:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771507429; x=1772112229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oO1w9M3ieZZsmi27RolSUjneLeuv4Im1ok18zsHVGYU=;
        b=Nxs2HgQX3C6d+gREV1v5iH/wKasXWGovXvVylOWIlbybXWI8hcNQ1V6pX3bHYD+FDe
         7LD8BP/IYuY+R1MjOyzO7iUxJDqa60ng96mxNYE15WtByO9d1lJWoLVxJfg1Gflge8ha
         DBjk+YoJTLyrOtSj3OVW42U7uhIfZQ3IpcbUm1kwOYduBidwdtvxYb0DALODIWe8NYtb
         4Cq5KFlyrSICsWygahz9OpYVkc//IVQ32gCtw+Y9zWBzmTfHDAPANnq94HvqHpwcNJXD
         hckLAxh5RdcxiCxuL0Q2tWP9UiwYYQ/ZH0rRjNYErk8JgpPgzT8RPy8XgfP/m0s267pJ
         rCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771507429; x=1772112229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oO1w9M3ieZZsmi27RolSUjneLeuv4Im1ok18zsHVGYU=;
        b=LdNAzBscC+W7P8oABh6E+JyZ4GsF0EfLX6vOXifaa33cYpkRHdNXTh5t9r3kk94kwK
         eiRJcjQhy8UItb+CmhG9NoLR/N3LGcuCqtDDdGfwm+1yLeBwMBa50Hqh6Pzg7Z20LAdV
         gvOuVS9oSb7spgvQJIOxhZKthR33JpQIVfikkf3t/9idSK57embap3cdjPDwbn//+DGj
         RZNWW7+xahAqevWRPG3GThz8XAjRg/zI5QFtd8AonUsfeh5pFBW1YBXIUDvqGQ6WrsdP
         IFytIuqB7L3RgQEvIF8h73deheHNFg+piK8y/YXpvl5FUtu2xTeivX6005prYGki44Wi
         LwjQ==
X-Gm-Message-State: AOJu0Yz8vE5M6a4au8fZhtAz9IwC69wnNweXtTxW5C/llROOpx3DY2cL
	AXmq/wcpYcHWQyrta+PdGQKXN5mt9ih8JTPb974kITlNvbxVDcddAtXhWgUSpulF65GGMsa/B8I
	Q/cu19v4C6NiGP8oI0S1ILJUGhiH96Hm3CQuMAGVlWPejiE8Ji27XgmIYyX/KR4FWFBUT
X-Gm-Gg: AZuq6aLI8Ggoj4Vv8X1tfpVuCDG+RpuoeJTHhSIq18lNkBir8E3ipjAhXfSFcbmKMmQ
	Gp7qBfJng8q8vNYxXXQBs9lEr5gG9k+Ng9zZVN6Sahcsyy4MlRth1beR9YOZ1UyWiXORR4IG/FA
	IzVbLRZP02yqpk8Q+kYsm4F4mUFG6c/oMD76jD0+deu1pj/8AzoJsrRyn6JX+q2JOXITsNjaB/s
	83olneLoPOWJSRH7yCRIS4TpXnL376LpHvjCA5A0/JJ17zs8GV7ZxVDLinEc3+K8IomaB0G2J6r
	hZeH35PXPDXG8nxNPjDbO+owiaozaODBBK7uPkizINqeAQNfJheyun+ar6bQp+GpLepOVaMd2bi
	r1gsj0iynOr/cb496ZdaiY/m5CnzRcKWBqjW1Hh7LfqDHY7nT7pQYwFzeN6g54PBmcWIqJVbMAZ
	HQEMh7av3ZZ+V4hSJXyE92OtmtGWnUb/T2glSKx9JtpA==
X-Received: by 2002:a05:6a20:a122:b0:38d:b865:3a31 with SMTP id adf61e73a8af0-394fc2d985cmr4913074637.38.1771507429120;
        Thu, 19 Feb 2026 05:23:49 -0800 (PST)
X-Received: by 2002:a05:6a20:a122:b0:38d:b865:3a31 with SMTP id adf61e73a8af0-394fc2d985cmr4913040637.38.1771507428562;
        Thu, 19 Feb 2026 05:23:48 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fd0ecasm18489620a12.7.2026.02.19.05.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 05:23:48 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 18:53:27 +0530
Subject: [PATCH v8 2/4] arm64: defconfig: Enable configs for Qualcomm
 Glymur SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-upstream_v3_glymur_introduction-v8-2-8ce4e489ebb6@oss.qualcomm.com>
References: <20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com>
In-Reply-To: <20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771507414; l=1638;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=vj18HKwlLBOBW/CBpGSa1EAkWsG6FMfMLXNlSdzD/IY=;
 b=II4KKlj9kpWOxpjV0arRJgCNh23NVn1mawKUNq4zoI5XpSJ300JFkZJDP2/w9pCIKFU85fT+3
 6EYkxZXPqasDC7Bd2/ZvnK1L11300Dwat1lFkFNTzsRQTTOEkl/UYH/
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-ORIG-GUID: 4Tcl2SkFVIbC22FG4aDR1WCI4MY9QSkK
X-Authority-Analysis: v=2.4 cv=dqzWylg4 c=1 sm=1 tr=0 ts=69970ee5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=G4s3PgB1coGp2Q1p4bUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEyMSBTYWx0ZWRfX0NvL0lpjHZ0z
 sdvSqZHXKuGPSlTgbry5Pez8MLN/zh1KLNjXMDWIzfi7ZLbNXdpNo+qfhFx1NTRqL3rqeotRT7J
 Qbh+UWWIx8u9RqRGynVAVEpEKM69VFiWUOerQCF7fUTr9Vwso4UlScqztux9f1l3r+L8xzRdYDh
 RpuMTvdggZSEmM06sZVrmW1bMhc8dfJXFWPNrOZILT3nIAusUF1la2LiG20KRFFNWeUhgAHOw0W
 PF5upNov0A1OmaDSUfuJHFRtZKBYVi+H5M/1Q8rqfX4tv+WbF9qMEixpc+6XufTU/CYdn+P8Iz5
 JHxYW7/4rPJ9ZX/pEireUdDwNgF/CsS+qiLCtxcprocq3LgfGktsqSc9zEAVFMeq7iMgMzJgq45
 jR84MtA6lPoPI1EE9GAXYcOaPWJgNCuOgeoMXJbtLhDM5rIwp+viuwf1SA9Xp7Nznqw9fzxsIKV
 KatvZNGdqqQfcSbkMBQ==
X-Proofpoint-GUID: 4Tcl2SkFVIbC22FG4aDR1WCI4MY9QSkK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93389-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3F6F15F024
X-Rspamd-Action: no action

Enable pinctrl, clocks and interconnect drivers as built-in
in order for serial console to be available before kernel
reaches "init" on Qualcomm Glymur CRD.
Additionally, booting rootfs from NVMe requires TCSRCC to
be enabled as module
Enable dispcc as module which is a dependency for display enablement

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..d3ed35d3e6a4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -647,6 +647,7 @@ CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
+CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
@@ -1454,6 +1455,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_GLYMUR_DISPCC=m
+CONFIG_CLK_GLYMUR_GCC=y
+CONFIG_CLK_GLYMUR_TCSRCC=m
 CONFIG_CLK_KAANAPALI_GCC=y
 CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_X1E80100_CAMCC=m
@@ -1846,6 +1850,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_GLYMUR=y
 CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8953=y

-- 
2.34.1


