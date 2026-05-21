Return-Path: <linux-arm-msm+bounces-109037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO+GDTD0DmqmDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:01:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4395A46B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FA3D30056FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D395360EDA;
	Thu, 21 May 2026 12:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfPFOT3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKIHsJna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEA63C4B86
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364868; cv=none; b=QPf1TTJ9bvC1vLR+mBIPUOzkPh4CXqM4w52STPP9ZxfyTVi0ArEtLuTHYB+ZBeNcrMhdmo3wlmYvE517BZphEzacCTNX+7q2QRXDOQLImhCIlLH1aAH+LvAm23vpXMINNzEfbWHky11VjL2ah35fqSvuwXInPt6F7NJjwOX83w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364868; c=relaxed/simple;
	bh=b5GVsqiFRvyRNXuaoJrVvQ++KB3PSjMRJdFjuy/X++Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B1nUI7H02deKjqhFz40OTO8e36Yo0SO2GYdjupFugTqnGHkROQJOjB2SmuyjRKh1sLP7lVol2by+2inrO9sEV+NKKhsQQs0u97+ExTDDWnpXAdC25NlbHrWbAy+VL/XG0PjzTB2722aOmDT46oU2XEU8yCQHcML+4d42TNa9Kdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfPFOT3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKIHsJna; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99uuk3772801
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zuiIFZmi278YoDP8dW7O5YBXYG/k2Hucyz8
	pSyqs9ZY=; b=HfPFOT3IMnhcPAAoOD5eaSF7Yz+Euf+T/uav/QrtMc6pJNNZVWF
	CBNIEgAE+BBRcL1lGau5CqXdLiC9RdXc1+qX352HUa3SceSekmHXnC8sFd/T9qKC
	e2ksJrJ9Pn9dXslLrIuzulmH4skY3VdB0LufVqL8JhmSNLk0eXI4h8yaT6J+Zi1k
	rmFPrXLBfRuW0j/0rfGBWrVVGPYYdNijJlB8CnZqDZRMkyNSPoCnmRH9Pf8LgDar
	nn6/81XiUtwGGiKwAfNgW+ymUl8i0uBcpgNw/sgXSvl1TXgZRilfyuhmxifx9rfj
	GyuoMEymezwRDmW6U5xUCBYmrHK4DcLbPPQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma432rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:01:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8294d8c48eso3718131a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779364865; x=1779969665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuiIFZmi278YoDP8dW7O5YBXYG/k2Hucyz8pSyqs9ZY=;
        b=gKIHsJnaQaHzis2QnOhcJVuy3mUkljsQ54JFzdKon1BYevbvotoQYif8lsJnU5Bwgb
         ZoZn/7M38BaU4gXVQ+PlviDI+2UHNn12ndlxQiJP2A3ZCLOHKj7qY+KHac7va72UP9Lq
         sooQz0pi79OEbwXqN6IcInBtEqjeo1pMWLGWwfoF0MQGktzRgVvWbEHWYte/dkmhX5N+
         CbqmW5GO6Bt6NcB0/rhB/PBxfK7++FyHknXd1YBagTaMO6Jm88qsUeXhnBs3EJKtiHEW
         /aTgqcjrLeyu8pWIICiwmIj7U4cgnGQK9duZ+tOFz4fCbt4EIvhV/C0kn/M9pzHZykwz
         6stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364865; x=1779969665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuiIFZmi278YoDP8dW7O5YBXYG/k2Hucyz8pSyqs9ZY=;
        b=nI6K6ahk9o56cLR3/Aw3tUF+YLbk+0xusYCVxKl6IRus7fScAgNAu7QgPetLvQJttQ
         14LEDIu1kSIQjG9UUhvOKPu9ZvWBw+QdrE2uAdjnXhBV3NkxGc6Otaa97So+U/iX8+mY
         YUIdjouXUJLu3GEBfwiYOQ0jE2w8X8HofInZIq+8/KHrMtZ00w2WJwTPHCYqcRMHuusO
         ABBsPa0QRU8hVtgsrsqfHBEKfAPrC/hq4uslC+MVCLwRdA5jFumgnEJQQQqEfQSpz/Mq
         1GklF++19qRFeP/6ZXyjMD1H/DGYtt308StJOkc/JnwNPu/5PMojq/2yg+vX11PBuKjn
         KkOA==
X-Gm-Message-State: AOJu0Ywe1kQkYr6C0sK0AxYftr5/72yySg6c5P65Cc6FA0NzB9NIsCQC
	SJY54rW6nJY99QBsjTFyqY6N1GnPDCy9ZpliWn76YVFGSq33qs/1vM9RPQd8FZhKWt4xPSSSXXm
	EHwyzTpwGL10kowX+MCfLk229miZT3mhnICDqiHVXDdnwgEpUTWJub8APpF78YHJPdWmW
X-Gm-Gg: Acq92OEySmnyMhLUuOzqsWrAYu4h8v7KbPMwLZdNQ5xEdsNUtdl0GmLS1aBgw6ifito
	11O3QvYanAezPNJKFr0okRrMl/aQx6PCqhNddMWLalXlhGJDeNzjiJSTMyuNxHJa4YPEi5lfl/O
	l8IwmRRxGqdBKopEPwyn348f1MRHoiJtmkbC+DFKrhi49yI7JX4/pt62BgRPxTHd8FUclWn8vyc
	XgFgQsLpf4rwouZpamNPiaUnihJBlmk8/yKeiOBiexz4S/ySxobBkO7jEXhatEWc8gp+OXC/Lb9
	6Z1o1/A70T5RCY/yMSEPJpF5HOMr+2aC5Ooe+L7/yMN6LzgKLn3HQNtnueL1ABqu2Ck0X20o/pp
	/xyeNCtUZEfAKvaHIm7i9KCZUlObLFXWwKVq/CwuB+dRE8c+TT3xNahZa09coSEw=
X-Received: by 2002:a05:6a20:12d0:b0:398:7357:bb91 with SMTP id adf61e73a8af0-3b30878f308mr3215380637.33.1779364865234;
        Thu, 21 May 2026 05:01:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d0:b0:398:7357:bb91 with SMTP id adf61e73a8af0-3b30878f308mr3215287637.33.1779364864642;
        Thu, 21 May 2026 05:01:04 -0700 (PDT)
Received: from hu-sauana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85198f4f98sm169544a12.15.2026.05.21.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:01:04 -0700 (PDT)
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_mkuntuma@quicinc.com,
        mahadevan.p@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: glymur: Configure DP endpoints for 2-lane operation
Date: Thu, 21 May 2026 17:30:58 +0530
Message-Id: <20260521120058.2966709-1-saurabh.anand@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0ef401 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=whlQpUbcimcIkjChax8A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 68kzS4EPWfDKDXwbYMiX7spvf_9yrxZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExOSBTYWx0ZWRfX7sWWysBLq8tS
 ztthQQOggVMeEMMrB23iG6XY2P3ZM3dmka+8ZKEWZ8gj1g6lJeEhBrvbOZwl1pVtkCL0eg/tgUo
 kfbMXhJrW5w2xUVwXz2jBQPL/dRo+qIKYZ6OIitZpnIUxRm+RAohwan9Poif62AqXCgHMGIkchS
 6vSRMNI2lBlsYQ8ZKDntRgcP4qIHdGneBGabti1Zp0aszvlJLZ06P8gEVc9FJQWLByY3mX2WQ9x
 9qiaG3bAGwa4P8CtJiPrI/ALtpJfNq42bF5R5N+7yPFdixHYaML/jkLH3rsr523fNbZlP3gcD8t
 SGzRdD32RB89ZobKw+X4O44OVXm4NMVWiFNICLJ6Rtw+KgwXJMcsr4afTNc1WawvfaZCblGfWPc
 FxdhjTklP0OIUi1pFGH8q+vfvzXLJWnB7e3yRpkz8irG9f8e0SM3rWODmsFB+cArX1F1I+0TG+P
 MqdSxuldadmu/qdqPaQ==
X-Proofpoint-ORIG-GUID: 68kzS4EPWfDKDXwbYMiX7spvf_9yrxZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210119
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out,qualcomm.com:query timed out];
	TAGGED_FROM(0.00)[bounces-109037-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[saurabh.anand@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[phy.fd5000:query timed out,port.0.0.0.1:query timed out,saurabh.anand.oss.qualcomm.com:query timed out];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,fd5000:email,fde000:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA4395A46B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add explicit data-lanes to the MDSS DP output endpoints to enable
display port in 2 lanes configuration and disable the mode-switch
property from the USB QMP PHY node.

Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 72c7dc6e4f09..d6b3c5bfebd5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2445,7 +2445,6 @@ usb_0_qmpphy: phy@fd5000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
-			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
@@ -2517,7 +2516,6 @@ usb_1_qmpphy: phy@fde000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
-			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
@@ -4550,6 +4548,7 @@ port@1 {
 						reg = <1>;
 
 						mdss_dp0_out: endpoint {
+							data-lanes = <0 1>;
 							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 						};
 					};
@@ -4641,6 +4640,7 @@ port@1 {
 						reg = <1>;
 
 						mdss_dp1_out: endpoint {
+							data-lanes = <0 1>;
 							remote-endpoint = <&usb_1_qmpphy_dp_in>;
 						};
 					};
-- 
2.34.1


