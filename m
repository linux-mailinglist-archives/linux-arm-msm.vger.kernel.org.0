Return-Path: <linux-arm-msm+bounces-98075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEhtCRnvuGnflwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:05:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E42A4347
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0636301C915
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4866437D106;
	Tue, 17 Mar 2026 06:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="momi1/7T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObvJSxKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9D228314C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773727504; cv=none; b=P9w4gWdaKBg2MKbDZh+Qn3hPujr2N0s17UhY+4wX5AasKotMU0fX1yRjLBJeip4CcDYlFvUA3U4I6B1rKeOu8MpND95LVlBXJDRwHr05Wxx5liqC9U411qEXwW6VcZdFR09PGYHeIjKmr6BXm8jgOAMNiseei4eSBgs14oqKfJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773727504; c=relaxed/simple;
	bh=/Fa03eoQgpFXARtDwq8aOH5SfajQBgKaHIz/wxzR2dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qurlGSmgwPVYP6wGsKH0l7lB+KpuKssW7Yd9z+iIE0gxcYqHV13Uq9NeAqdC0IQH+hjF2jykCMt5MbCWx+DOG2mz8sYkmS8Kp5YCIOyvvOfUpw1+bAQDKtfQx6wBmdrGvR5b17whx2JCsdkEODHkDmC1LP5fee9q4I16SeeHZdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=momi1/7T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObvJSxKA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H503No1428820
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gpMypRxtPMnAHpdP/PXeh4q3Zq1Ep5QLNunrygxBcA=; b=momi1/7TeOKK5HtP
	4BfloLRYi4OfvYDxQlp23IYcVU82j9eXCVKRiiBWF0ZKqUZiBPytxPJyesl/CIye
	uMhUaKPEhUNV/drzZKahrNB3lFjMBFuUZVmyPlwTGQGd7UyHElZgTXXtmsVuY/IW
	2eV8iIoouHK7hqfndooujRNq2JGTBZ1Anp53vCBJ8rUQ2NBf8p4yM4I9p8F0MoFs
	+Rvg4S55FAUqMj6mBtrG8xydF7SNNIR7MNDZPlvdkMxN1EJVusjUTC57zJ95gler
	gTroIyu7Jpx9oy5DM9DWYqowDHOioQ9pJ4SBkD6ZmK2A4mb/T/h7LP+yCVP56AgD
	2uleOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99bd19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:05:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b04959ec10so16043105ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 23:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773727501; x=1774332301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gpMypRxtPMnAHpdP/PXeh4q3Zq1Ep5QLNunrygxBcA=;
        b=ObvJSxKAoU+Mcwiw2uiSbmOPnpBEltNIhLXSM48x/m8aNhUSjUthbhmcA3erjYSgy+
         TTesUkbM1mezurAzAbHM0f6wjMP8gSQdqu3tAW2ciV1DY+K84VEL7jEipJeCfZqx4KaY
         dnbG3hsFw7l20yZZgyAPxdpLwNuIEVH8ubRenm/UJ+phxrIeBmAtq6B6surUV68TTPmb
         dPPQD19m/2DyTYyYSklKeYhVGZbsfTP3WYbAzY1s1aiY6fooXFC7byOvEiDk2WRTsT/I
         8sl2eNjqBM9SI+wf62IEAlGOJ7yyYVqFmF43JaVxno+G5AIexnIhw1AChUJJw0zTi4lS
         ZX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773727501; x=1774332301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8gpMypRxtPMnAHpdP/PXeh4q3Zq1Ep5QLNunrygxBcA=;
        b=YjGoMZDfroc0kURPvN3+iooQ1AQx3uAGLcaaVseAjkbVyVXp/6VhIdzYtDD+Wxe5i0
         T5xpLCJASnj7QO2Iee71n/nb9i2DeFjCesomSJlwLv8WW3XNX4wigPLpyXM8pCW3KvZ9
         rvZXXw5DscvUmaRyWileJfaxaa8c0Qiv2nA50PqtfT47IL0t/1d2QIjH1T6n33f9hN1k
         Xq6StBpiJXpDp1dut8RwN/XoWo+YSuiIJZXRTJwc+H3MB/t3u7flkaUsCB1MtgjVTz8m
         aZ1nKbAgVFRoEbg8TAj2W8usPx5La/FFAc8wF5t66egwQIUnOoUSTjwLrbROPqf0CdcC
         SV6Q==
X-Gm-Message-State: AOJu0YxSHSEcMxk1dqm+yRoC0OeSDOGKFfw61QzvxmSrxQEX6UvBzwor
	t28c9RGEpzyQRJTD6pA43KvzxJL/U7I4TcnLf+v4OkCzYXMQYKR5MLw0kqD4hzm0IMhnJJyLEv5
	R/ejU7hp8ISOYenZB3UGwGOw64kOa3gDhJNg5CzWGlIa2+qeJ8n/RpJJD8vU2oIbo5ZWz
X-Gm-Gg: ATEYQzwDkj6HWHcPXdoIAc2GYNX4ZW569ryYWjoA99OtChODNv6m1lyOxGTLTRbFy+k
	1sdDkAmwQDBnKwDuy1eVSRPUIJBbVfBXUwKjIjbFfSya6O0JpOMtisXLu8Jf/EGpYdYPNh1doX5
	y8McRW45Mu+MhvcDkls08nZRWFSqDXN5DbiaSfQh3lhKDNFvSOsXMYAlbY20X1yfKBdVtAcYA8t
	90+9UXZYHxopO0Xlf22G/ZSnkz8/DjfV0Ttk+IRJgxs5oEJVta8Ir5h7jqV0/ixs9Sg4RbSOAoy
	3VhmXWigBcZF9kaW3/OGwgbqHjfJUi29DS3/32MRIbjQFLfa8jBBSAG+xnd9nATmgWMxNwhNRgU
	/liEYZ2rMySCsP24dB2gX774r6H3YNrzsalN+VNgFPbydHPSefbzytPdP4m5/enxiW6oS82UVW5
	GgmKjoDfVLa7ns2BRwJ7iHJ/KQ1nOJuKxxxtR3BmxgTw==
X-Received: by 2002:a17:903:3c45:b0:2ae:464f:fe3e with SMTP id d9443c01a7336-2aecab1fba5mr118695945ad.5.1773727501026;
        Mon, 16 Mar 2026 23:05:01 -0700 (PDT)
X-Received: by 2002:a17:903:3c45:b0:2ae:464f:fe3e with SMTP id d9443c01a7336-2aecab1fba5mr118691755ad.5.1773727490833;
        Mon, 16 Mar 2026 23:04:50 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05db37a8esm58125785ad.29.2026.03.16.23.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:04:50 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 11:33:58 +0530
Subject: [PATCH 2/2] arm64: defconfig: Enable Lontium LT8713sx driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-lt8713sx_dt_for_next-v1-2-8195fa931ff1@oss.qualcomm.com>
References: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
In-Reply-To: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773727478; l=724;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=/Fa03eoQgpFXARtDwq8aOH5SfajQBgKaHIz/wxzR2dE=;
 b=7/foImg8Xi+60wqU7QqFeyISYT9zAbKKh7f/49lkV8A67C1UvM9ymWg3/DixzuTSHsG3cLpMe
 QbO2t/OTrsQDGYXhSX+IoprX8xnfVHdulrSpd8LYaEhGzjOzLobW+T4
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b8ef0d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CI3YMI-dvsstCnLhLxUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA1MCBTYWx0ZWRfXzIIK7HW+Mcwb
 a83uTg1ekoLW2CGcgUx++j17SZoudE6pQZkET6D1OtD+cRM9GhDIelTe3TGEguSvdKQiVYNDI1/
 WCFhXAUIFvZMAtMX+DLUIHhi4kcpwkZZm1ftaOrf5CN1U+q7XYBCsJ6A9yFRmkk8+SeyEKoTXRa
 XSUoPpF4IWF/BU6/PT5I9VAwRDTqJWFDNXvfY3UEF6uADszSuISzTulo+5+HEliLyJtTp48LMrK
 +h6LsiEu42Q3Jzq92MFPx+qfrW3SknFI4z8Iz5XGpxIVcfnKaRxTsglHN5jTVjsdSEyLKKgcFWA
 CCA2jL9wlsv31X6JZm9rkzsHMjK19FDr2T1bf4xNdwRpI+6CtkGWuLIAdmRtI9+ZeZQPErccqha
 mzprDFoLugeNr83VFEX/wlH/YCj7QLj0polVZjLzgqu9z8QtqemEPeunn2EB+89INo0EsfJrPNf
 /c+ARXV3M1v3nLX/JTQ==
X-Proofpoint-ORIG-GUID: SHC33kYrpR6VXNSZsL7wjiQcebSAgE3T
X-Proofpoint-GUID: SHC33kYrpR6VXNSZsL7wjiQcebSAgE3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170050
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98075-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A86E42A4347
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Lontium LT8713sx DP bridge hub can be found on a Qualcomm
Monaco EVK board for converting 1 DP to 3 DP outputs.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1d967a81b82a..c8f89c87672b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1002,6 +1002,7 @@ CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_ITE_IT6263=m
+CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.34.1


