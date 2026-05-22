Return-Path: <linux-arm-msm+bounces-109186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGE6JZUEEGqLSQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:24:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7F85AFF2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85BDD302A6BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 07:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BC738AC75;
	Fri, 22 May 2026 07:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJ3zWXQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HneRAwwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F5036729F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434521; cv=none; b=s2RrkoBxHFChkvVPSEL2sPHQYTP+KCBcXJDomZRWr3y86Nwo3iF0pguLu/pB/IDv2CLoFdsbv14xoDJx2w/wnFMbXBN1euOCsCedITCFRwXp2DYMii9jWhbusmbuO2Ab5JMAdOzqWfldv7s04CNC7ldccezmAAp4RDrXS+SQSi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434521; c=relaxed/simple;
	bh=dg9NOhV6/SIfqxfwMkvBfzMjsirXjescaeTVZvwF3gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hEleYwNLaFYbKuzLu/FKYrgE4S/4aLo1651Dkk0wBJlHBm+4WxLKFyU3ynIaIlEhqzoA38wf+rR/QuNG2chb7qUYlXYuyALpC//Q76m8iFjuzraEuy2Wza4sgxP9Y1gQvDolUASI2tve8XyvKQSqa6sO5XukNWwh5weUPo0Qf6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJ3zWXQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HneRAwwi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M4AloU2765202
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nzKILimKpNNt0iA97G7g72
	iyWQY2OcX2RXhAx4Oyz+o=; b=DJ3zWXQFM4LtD1bn7ZRBM72gC2yd3fOtf7tGlg
	HsamWp2zd9w4zBueRpTVsbFcfBr6z25T+YhoqiLkijx9vpOjvhUKPspZXrF49xm8
	GO/bIGoDI8QPItMmfSGrGgfjg30PKxDVO20QVBTBfo67fR6ljQ4ELXGvVJAywRk7
	VENLyOkxmXBUdGarSEb4yqIF3givft5nliQBd5XujIdwASmM4HlDHNm0c1hIxIYT
	Cf+Q6uJ/IFOzg643xobZU4hJ8robDjdm4mDibv0Yt9ivPyzXncPeRSxWKY+yDeqj
	bidMojuviSDkuUcNM6Hf/GLd/AdaomTmWFta6xa39aWWC3Kg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7uknw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:21:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so6557064a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 00:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779434518; x=1780039318; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nzKILimKpNNt0iA97G7g72iyWQY2OcX2RXhAx4Oyz+o=;
        b=HneRAwwiKG8Hgrp3oNB8Z7henBNm4lZA3Krt8l53QM6qkMhRnF4RvqG23Hg0RFLW8b
         KCcTbvuVdzZs+7CsrwXrzUNdqzFBpaaS89lSpvRoArtsMX3DxyOvdaBQGVy/sN+WyL+w
         Xvf/9sHFrF72PqfpwahBVsjEAU0k4d60rVtHYYf1gMND/2ukX+v6RUO0pVi8giAD3TW8
         3k6gAqQ9Eld1Ap5HBc+7xyNZ+Lo9uwoHuzkUdtQr+o+Ypibl1430xsxR1DPRu2QT6Xur
         UiSO2iNd1I3RzAQlQHI3gXENhx/qNjmY847aOISosWEpTB7B0qx8IUE962x4rNKpqJcB
         E48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434518; x=1780039318;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzKILimKpNNt0iA97G7g72iyWQY2OcX2RXhAx4Oyz+o=;
        b=FD+NDtpYM4fEqjgx1NZZBe6awC0qF0tiSImaOj/g2DP+rAkslxXgCSXlildnTTiHcn
         VcpyEk2PQndxEQvgMByTBRU6ChkIM6JGYTo11OLdbBkwLGF6uIH9g914XlRX9UuU84Cf
         p+3UTuWY6UQurxZ/XgxSK/inrlKH3EalgvIOFGdiDhOygtilULerAyNmbPZbBkzTMrtF
         MWZJl4OO+N8O7zwTblVd7ZB2q704OBbDrd/Yxy+OxXUX882TcdnHKz57/qY1HsyGL2f8
         RV3mP2R6wNdE4uuf8yB9FBWdvB4nyZxhglgGtRalibjnJq9ic9yOTv6E9t+K4LajeJxF
         o7pw==
X-Gm-Message-State: AOJu0YwfDObTAoeEk16+uuceFBKgoPKTYE7ZeJhNK8pmkiLEuUvafbE9
	wKQm/gKEv43cHtfxf1nqle4IMgx4YSoTmlPddOQ6VjPkYzzg8ziiGrI3KCoVjxypRz5AW2vCx6v
	BysXeofhj/nmNX1OPoeUIIckTSdX5HqJ8vghxrGorRhZPfn2a9G5iYzSOqG5jzw+vuqsIil94kP
	jF
X-Gm-Gg: Acq92OFhBEV+fyHQW5F0y+2a7052UuFduLwJi9fiBX1mmSLol0q3xd0bzz/JzsasUhj
	laEshiRpEIl4fhTGXLaKXqoIeUNai8s/EAwTzncsHMmO2LPIWNQRyYBF3LkjTCeeb03DegccC1H
	LKrpbhbxdUF8zTFFWEuzNalEkjLhwyfizFuiMtTjAoeVCaYKg2JBO5b0plHm2ohbaydy/ZvX5vy
	CVbPM/YsUIYbW8cbosA290qrL5nfLFuZ2MTq3VYq2OwnKa73M7N1jFPxk3ev938iIm7st8au49R
	x9JCCx88D+ZfUJp9hW63cr8twDGpKaY9Bqp+OnjNoXbu3ijIbdI/JByxaNxvQpqTtzo71sWZjdO
	N7Gwv2mm5Nhn0x/MJLb4oKDCRr/4o9bohCdSk6eCTh9zN+yw5TcqeQuE5Pg==
X-Received: by 2002:a05:6a20:2324:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3b329413b55mr2447494637.49.1779434517528;
        Fri, 22 May 2026 00:21:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:2324:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3b329413b55mr2447464637.49.1779434517044;
        Fri, 22 May 2026 00:21:57 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852054e0cbsm659736a12.20.2026.05.22.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 00:21:56 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:51:49 +0530
Subject: [PATCH v1] soc: qcom: geni-se: Increase MAX_GENI_CFG_RAMn_CNT to
 1020
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qup-se-increase-ram-cnt-v1-1-71854d0b2ef0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAwEEGoC/yWMQQ6CQAxFr0K6tsnMYF14FeNiGIvWxBFbICaEu
 1th999L/lvAWIUNzs0CyrOYvKtDPDRQHrneGeXmDCmkU6CU8DMNaG5rUc4+NL+w1BHjkdrQh5Y
 6IvD3oNzLdytfYI5w3Z1N3ZPL+E/Cuv4ATowzUH8AAAA=
X-Change-ID: 20260522-qup-se-increase-ram-cnt-14530f035b55
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779434514; l=1208;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=dg9NOhV6/SIfqxfwMkvBfzMjsirXjescaeTVZvwF3gw=;
 b=MphxCZHj0GzrpIoRcFoMfcsCN2rZ5oDgouzHHXtvp99snaNDTzVeLi0VeqPb1fZjm0IheN3kI
 W5skVQ1EojnDIz0xplMOER0qeLfLvonnHzaYXi6NWmRilYeBZGrpAB3
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a100417 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Iy_rUMc9i2zLLGa9GiAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: P6XSSXGwp0yJlP5mqyUiF73Rw1qL3LIQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3MiBTYWx0ZWRfXys1Le3SuWbXC
 1laUOhojJGbhStEzirRiSu/tvluX4kvDXaVxm1vq+YB4CZPvtKS+mHLd7V3iu8AMdjIDyAGtTl1
 j+u11IWiCnrcT071BVcy/MsW4D9U1wyPTl0fRuuplbZzsr8v/LWAxXB3slLLUeyuaKKDC/Wvv3O
 Og7F65MMmP9Viz6axbtdQiv/Uj2AF7DD+c4sIlWCFCj8iA7LPeP1aQ6hq5K1VJIJoGbeeiR+96o
 n8dWGa7NGez5tOXdhVdGuKqtfRlXW8u5Vft1kLwzLV6ryWYupyWuLo23o6P4A4T9f26dXz1xQsI
 9LGALIbswuSfDIbXhfDFLs3GRnS39dGfIuIyH8kxe6K3o/l1V4s0AgBz1uS8rmE6URO9b4DSEx9
 76U8aO05uTsqi5SlHwR6Cc/WMOO7grB/9PY/+7M0OYjE1BX4FncmDFPqM0W1nDPKKZByUX42g2C
 aLxHG1T/SVYxvT3E3gw==
X-Proofpoint-ORIG-GUID: P6XSSXGwp0yJlP5mqyUiF73Rw1qL3LIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-109186-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE7F85AFF2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current MAX_GENI_CFG_RAMn_CNT value of 455 is insufficient for
certain Qualcomm SoCs whose GENI firmware requires up to 1020 RAM
entries, causing incorrect bounds checking and preventing firmware
loading on those targets.

Increase MAX_GENI_CFG_RAMn_CNT to 1020 to match the hardware-supported
limit and ensure correct handling of configuration RAM regions across
GENI-based SE blocks.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index cd1779b6a91a..d0810960f3da 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -152,7 +152,7 @@ struct se_fw_hdr {
 /*Magic numbers*/
 #define SE_MAGIC_NUM			0x57464553
 
-#define MAX_GENI_CFG_RAMn_CNT		455
+#define MAX_GENI_CFG_RAMn_CNT		1020
 
 #define MI_PBT_NON_PAGED_SEGMENT	0x0
 #define MI_PBT_HASH_SEGMENT		0x2

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260522-qup-se-increase-ram-cnt-14530f035b55

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


