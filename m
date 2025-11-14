Return-Path: <linux-arm-msm+bounces-81891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A61CBC5DF73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 16:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 03B5D504B8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0F832F762;
	Fri, 14 Nov 2025 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfxLfM/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anklPcdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C2933B94B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132239; cv=none; b=nOphgE0TCw5Z7Y2IMQz9qE9q3y6oVhr2GNQ107833Vvd7dcZztDHIfgS6xTcBrvF3wzEkRiBaNwaCddi25Ve7AHRsecj+RSnGMIL4NJSclloMZ8gzi60VlJV+rXr1FXCt10ERkrbxaewqYsJSLGUi6zsB7wsQLwjv7BcoERbqfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132239; c=relaxed/simple;
	bh=2Tps5f1Fyw8EQWXWQD6thZKjGk5FwlpUaqUe/ah92YM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=axuuab2QVsu/yS/heeVx2dcwpKnycHfMibTgbicRE4AWtdMM6wrdHNk2o1SyGR2RY8yySa+nMB0hGmVSTmFvei4zHp17MZoKpxmk9E9NKuvFz+Ux5DvOlaeI5mGLV2Y2dHAdEbxkjy6BimSuILrFEJqmSIKK9bhFR1VIuwrm+iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfxLfM/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anklPcdl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8VgbO1488265
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g65rZQuL+DW
	NmeD3XddH64dFlYKY4T/kqk9emttSerM=; b=QfxLfM/nMmqDYpNzlt05IGvZIml
	3SIS49rg0gpKaNFQlFsoJKgYfWEehTA7kOGxr1P67GPiaXI3wTcd36FZ48Wt6dpY
	SXSonze2ITw5e4vH7iYi5vZb4Xl4DvgwUIGPMmKBfXeFdtixmj02ySDXn34CJ0aZ
	jjhjt527siatmUWsbnXODK8aGE266J7x2+Fm30S4QbpFGs2tAaEFCMBu0Z9sLONO
	VLGo5dtDi8PTa+JovBxgmP6UhaQYbT/y7zdeAzJH+9DovaZ9oxHjpDA660JbqMa2
	/DL0KlNip4J0kHn2PVUcc6wsX6PfV4zO+yxtMIYoA93bNvPWyvVG4bwc7kA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hth1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:57:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2980ef53fc5so63208385ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763132235; x=1763737035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g65rZQuL+DWNmeD3XddH64dFlYKY4T/kqk9emttSerM=;
        b=anklPcdlGGMfapzYcfqc2csPwmguB72kEFsKaJfRoVGfy+dBl1hiEXrTBgZZkFfBMl
         8LN63JSbC/IPnH2UqNJIiaSCLxRudysz1ZInscPMw5++usagT/9Jkb4vXnDZb1xENMoD
         XjepOW0tO+ks3fYBFFpXx6jhXe2yDmZDF/HmOTSD06j+NIEflzbHTE5fWkQ0VolHBfhY
         zZjV5Q60FNWPto9HIlGMABW0ViV7Nj/k7AWQknL/HaplsKcsOrdiEfUXxda1leFBIPB6
         lXRwpN+wFQOdUguZX1eOuo7DrWLvj+gFejC6oXdXaT3XCA5wWsJ/NEMoRYu2pHmxEduh
         hWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763132235; x=1763737035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g65rZQuL+DWNmeD3XddH64dFlYKY4T/kqk9emttSerM=;
        b=J+0fVYspvD4WGXcY83r8tgTW2asxIPimZzL/uxysKeELSHLhUt+h2hwNNw1lB37Nf4
         EFkdE2/t0jw3QQAtL32z57HySPOvO7Qd74/9VP8r9X9iBRlf2Ob/t+d+ecc18hS39xvI
         K+4y65w/lxDJ8bPn+le62DejRXTT9iI3NfB9hpZR4NCm+sPKceqMncZUEjw27sAapuhl
         Rs+JLAM+iuZSdLeM7bHhRKVxCDSyzVo94ih6yFOzhsXHbI+nQSd1FQSqrI3TmKF0gBrY
         I6DV7YB08qa3TJUyq+d92yYajk4Ite6SJhysEDPdxAqkFXTxNauODwHoJCWHVrukBWvF
         yIdQ==
X-Gm-Message-State: AOJu0Yxe9RoHdBh2ZoWAnGB8ylYOsyJCC8qn/dSS2XSG1Xiee6yjb02J
	0rSBhOtKPwR7dPCpx5paYCUV7HiIj0K99wvR3HySIcGr1wfe3odzHLLtdb1nauItapH9feUTJlO
	GXnCVRlbAy0sQ69l9UQTx24qOZEPcZNfugRVu1mvrp03zJbP3PIWJUrBIXyPNKoM8gNhdOXYaFk
	jB
X-Gm-Gg: ASbGncsBKME5MDZ4v9kLyQnsVxtyk/u2t7VOcz9GSQOwKewteObSPQS4gI0eoYpwb0J
	/Iaq7YwdL9hddlKhRghdtSTrTClW5nIhoHGD7GrSulggaByvtQETD5EDdadYElzlAh7y1DWZRDz
	ocKjvjWjj+QxJsZZ9wwmBrl4ReLDcEIXSzXKX6fYjf/iZI/1dAqkWX/RAVK1w/X6jZtXwaKip7I
	1qKpJTchy54wA5HC+04UkMgp0u0fpvFe1WfNrJhh72iL4nVAtqBqtYDAw1b6BsYy4X0G6c0R0YS
	ju+eD4mdxHsu+2pSeSTxdgwAG804Lq28effiIHpT9P61poNEQK23Oh4VsrH/3pntmrT3ERh4NPQ
	IMeUI2giMWer9n+O2+kDvES8DPNtT2w==
X-Received: by 2002:a17:903:1aed:b0:295:3eb5:6de1 with SMTP id d9443c01a7336-2986a7414d6mr33995115ad.34.1763132235495;
        Fri, 14 Nov 2025 06:57:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcURM2L9I1+OOyvpvUoXTqdprgHqwKbFhDjS5ARa2c04S0kA+aBdyLlgE7Rc9u1AAr9SgIRQ==
X-Received: by 2002:a17:903:1aed:b0:295:3eb5:6de1 with SMTP id d9443c01a7336-2986a7414d6mr33994885ad.34.1763132234969;
        Fri, 14 Nov 2025 06:57:14 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c244e13sm57548015ad.29.2025.11.14.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:57:14 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com,
        quic_ahari@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V1 1/3] MAINTAINERS: broaden UFS Qualcomm binding file pattern
Date: Fri, 14 Nov 2025 20:26:44 +0530
Message-Id: <20251114145646.2291324-2-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114145646.2291324-1-ram.dwivedi@oss.qualcomm.com>
References: <20251114145646.2291324-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: POkD9nf2T3NQjJXIjD-knmxAo_4IX-PD
X-Proofpoint-ORIG-GUID: POkD9nf2T3NQjJXIjD-knmxAo_4IX-PD
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=6917434c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=52jqHT57hFt4fz_33zkA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMCBTYWx0ZWRfXy4tcLcWuIgGw
 /8Lq4yVlZ407OUvWTA5WN1MZamBXxeNQvh7+LdHwskfS8MyEeVFfAZZY3kpojIG1mXR50FoDwOi
 mi63cUWWfqDyB3o1774D+S00Lw8zBXCHOJS4HW6lchKhxfSk2HVSk2pFgrq6Pa0cd3Jigiw5TpE
 d6jy91xZqqtZauqikgoCrXim0T/CZZSslE3L0DDEHWBKl6KuSn/iFWxNIqxmhSW7wbEk250y7FV
 XWZ1vgRpT6sD1SyeeSYh+Q3AKlyV7Gu+itkp28QHiKBvOcoOH1uII7kK6SzlMckEeyKL1qK+KOR
 XtCCLLn8uWIGc3UAK9WoB/iAxpSkuNuZwvTnoE7OlfgIsXL+enaITkTqiM40dBaOCWjti4BNrTM
 Tc9ty6ma/mHuksx5dJwWASwyThikeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140120

From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>

Update the file pattern for UFS Qualcomm devicetree bindings to match
all files under `Documentation/devicetree/bindings/ufs/qcom*` instead
of only `qcom,ufs.yaml`. This ensures maintainers are correctly
notified for any related binding changes.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 58c7e3f678d8..2d6a4ed4b10c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26574,7 +26574,7 @@ M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	linux-scsi@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+F:	Documentation/devicetree/bindings/ufs/qcom*
 F:	drivers/ufs/host/ufs-qcom*
 
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER RENESAS HOOKS
-- 
2.34.1


