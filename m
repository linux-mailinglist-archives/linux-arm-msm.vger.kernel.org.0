Return-Path: <linux-arm-msm+bounces-104689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOx/IrU172kw+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:08:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 271924709B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A27D13023A73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF553B6BF4;
	Mon, 27 Apr 2026 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKRkAvsh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFAI4wDf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC73E3B6C05
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284360; cv=none; b=Fkqe+8GID5nzEyW2yC96tABxTZTLF1Rc5P4YHTKxsH05c1NbmlFsfiV8VGlrlIPVfAH7fHfyXz4fLC73W8yCe5gTo0KNlNJ05FP6W74aqEL4kGoGIW1LdP8XEkUp0I2qb4G6RBk/wmapBTm8AsMtKBZicA0IsZLuw1o9ikFiAr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284360; c=relaxed/simple;
	bh=p8M74poezKvw740VE4mBcYJSH1dA6AFy8jlB9yXNq+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tjDUggt8hCZQU5Pb85H9rRE/AU7x4k4kj8AogRhn9wIefFtxGRVJvsnW59BZFYuOJ/Y0s2I/dTOxo5Zmo+NIKF1fvvt24QR/HIDT1VRKOiYMgffr2/K28RPyTW4uUuKe0gaPnacIX2xPjZImnQkAKH6G1GkxCEuWG4pRWmVp/7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKRkAvsh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFAI4wDf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBEe665650
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OAC9CanJ/+2Zt8Fy1VZoGxcKLS/SkOBP6k3HJ1PIPg=; b=PKRkAvshUAiu6Ds3
	aTvEBHlxyA84HxwK/1h6/TGJeOPtWhk5Cbl5AS9dKvpN7m0JZQJFeEhdAug+mNXN
	L+g/fOlyO/Hz1K9ALJZnKRtqdmYxskHfKhNmrVk/zycXyINUgPKvX5T8X/n2KdaB
	IHtiDFc4uiYLabT8Jz0I9PYCM25xpjCsIaCHZbkHvNmeafq5uxvTN+rlZYrb4bo6
	ViRHr5TNUIaz6tqnGfOx7ZpHcrhq746w3fQsgQMPZJUt+c7YFB+v9k7LNR765AEj
	lVSZTp6y3XSMCS+J5huwR9cbu+DQ4DefbriJ1807qd8HjqNwjLVtLe03J28254au
	FzYJZg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n0ut9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so10352523b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284357; x=1777889157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OAC9CanJ/+2Zt8Fy1VZoGxcKLS/SkOBP6k3HJ1PIPg=;
        b=QFAI4wDfKqAxNYha5ZZ5l+oUkv9AtA5wpGeF2TLj+x8kNSrD+JhN2b5Tf+2ZpZrqUp
         5OD9IGTzvOFizBWN+lOgI+TYbU7ew+RkOZBBVLtv78pRdqZOXl5cfFC40dCQt5Sfas+T
         bQtx5+mEOMpLwErXLV6XYVQt/rJJsxBzTd/XQHXp3So+jAORbNT0g1vdDdwzazQ1Kzml
         NKavLXp2c1hi0ic6cVKqQ4hpFEIYozBqanPUKI75GF3ChVm1X7MSWyv8+peWhMH4WHGA
         28mdvpy+DTtZZkEZFYPLO+FYcL6TtYpyog1rDSqGeUmGxRaepUfOZ1d1U4yKVCsVuSxb
         G7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284357; x=1777889157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5OAC9CanJ/+2Zt8Fy1VZoGxcKLS/SkOBP6k3HJ1PIPg=;
        b=IEavSk08eEmVxOWHudX+uDNHd0ZbeBLvMj+rbRWnYxVe/LGOHvP86P4TIiY4uOahmF
         KTEgtNs9oVyiIFN1xVVBHqoaMguu7zr18VeDKTRQgOhZfR4Uy/MEFpf0VA8uCqAj3HQ7
         t43e5WRcOkcddZbNDtR9q9sZAuiOTe3wUGyrov28O6qWlDiLfbpxX6YBdD7byQ7O+k5p
         XqvsLOxhYjPiuoD62vgHV7c46k6m3XnLi9d8oArUwDIlzIkSS/V3VTYcrctG5J1eBSsl
         0RQ4Tgh6oDUjWzEZgEg5FZwsorwjJOtd8LSgI6lGcUlbsxqmzIDnFxdmFG7GPc0JAxvt
         fUbg==
X-Gm-Message-State: AOJu0YwlJKSAaC3uoSPsnmiswb2f8cG85jGrh7b+6fGm2LCPREZgLUPc
	QO9yT+bVmdL0OWyho3vwEY4sfakjhwI5J+sDUi3OB1Oc8Qti9QTagT2kJi9fhkubz9ZBqX2l1FT
	VKjF7xOM1dAnAp8MIVBOaPnnW2XYUPWTLj/kDrNtwzu4oN35sDbTZjwM4gWUKaleq7VA7
X-Gm-Gg: AeBDietKOOw0J1GxX9MaIl8Azp9E2cOu11fFAzVF2XesIOVbmV2bNrmFvUfdOxsNEb6
	NAPfTviprkYb37dPzPeoi/zbvWLOe+sDWvM61VOYgGybiSnZ9yTFRxxGLB+5MOywaBGm0T3oT+D
	8BAOsoM5cO22Gu2o0QdE2MBYIRSFmCp5p/rnCNETHLNRN9ZJV+oJlyiVsfapv6xXq2vWhCCdBVk
	7zQ7W6iXDO3CWUzETX4FQWe16SWoCUagHsKVe4m4a45Iyn2ZUsOD8WuicwvK1wJUpwFcMQERdpS
	9UmwcXZ09SMdj3CzOgUBWrpeEAs3sLvtED7/7C6gKQTAEZLyoWr2N7DDGUk+et8/IRvMtZFQ5uk
	AGspaec8Cd4Jsu2U4OZ7FjiE/ypRz9MaaTe5vdSvJtTRLNYSw5uAU18hD+yOEjKCf5KGKingn+m
	pYx2gnmRCNNT9xEkhDcjEqn5n45h5DkfB4TV9QKP9dIwaH
X-Received: by 2002:a05:6a00:800d:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82f8c7db124mr43091179b3a.1.1777284357512;
        Mon, 27 Apr 2026 03:05:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:800d:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82f8c7db124mr43091148b3a.1.1777284357113;
        Mon, 27 Apr 2026 03:05:57 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:56 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:57 +0530
Subject: [PATCH v8 6/6] arm64: defconfig: Enable Qualcomm reference device
 EC driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=724;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p8M74poezKvw740VE4mBcYJSH1dA6AFy8jlB9yXNq+E=;
 b=oMYB96eaiECDwGVUkuL+RkA5FxwlIxcIEjxby1XZC7sAyRDeIMSdYgkAQQDFMeIqIrLa7diBj
 AnHEYtv3xdXBGdy66tkLqg8i76OtRYzo8tM/kn7RJ9SH2tEW983X+MT
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNyBTYWx0ZWRfX9Ak+eMufCLgE
 IJGzXCSti36Z5M/yp6cUHyM0qh3/v1Dv9G7JlsL8ISKPzd92wKWlmH1xS9N92Pw291ApzE2NhS8
 j24dcyPvmG242cn3PWYOMt/4QAGO3hFUztKImQNc4NYj1p6DVdVKeJjQwUv4q7/PGZP4YGIKjG4
 aNgx5wOielmaXNJSH4deaEnSqCGaMh3GPKuO0pb8B55X8bZ/cjmenpd5Uj9SXW79e3Hm1VcS8bW
 omneXzwfRPYwIDU3Ex98Nzm4aks6YxNH2rPTFt0SZvcIu2wVrzBWrwFCDbm9aQ8ClRtEoVErucL
 JFmLLD0v08a0IVE+Me/rFEUzqEts6GQGfmkYnbZJe5WumLgeJQ4k29wXm+Q6BiamCCywyJ0RIeH
 WODPjZRf+GhgtHDVDv7zEB5r0d2FZFkWWabyqobshmDlpKBJteZkY/bdxr+iF6KLpRxWx26F5Jn
 jEZGPtVSEu5cCXxibUQ==
X-Proofpoint-GUID: GEHkGyUGIxQTLB0n_DLx0oAPS1R4t4MM
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef3506 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=p1egL3lCMx1E4hDV5aEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: GEHkGyUGIxQTLB0n_DLx0oAPS1R4t4MM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270107
X-Rspamd-Queue-Id: 271924709B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104689-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Enable EC_QCOM_HAMOA as a module to support the embedded controller
found on Qualcomm CRD reference devices such as Hamoa and Glymur.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..c48fce61d738 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1440,6 +1440,7 @@ CONFIG_EC_ACER_ASPIRE1=m
 CONFIG_EC_HUAWEI_GAOKUN=m
 CONFIG_EC_LENOVO_YOGA_C630=m
 CONFIG_EC_LENOVO_THINKPAD_T14S=m
+CONFIG_EC_QCOM_HAMOA=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_SCPI=y

-- 
2.34.1


