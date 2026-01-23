Return-Path: <linux-arm-msm+bounces-90339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOh2D/tic2mivQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:00:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF557757D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9687302E7ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A65B2E0418;
	Fri, 23 Jan 2026 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDhPzC4K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsYsPaae"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A2C332EB8
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169631; cv=none; b=RTxjRmz4+NV4gMk9g8N1prLkuS1ViYv2qXkR3lfpInIxkMfEOxRul5e3tHhcpKTqB/bv4BN0gB5bv+bFL7rLo60apFZcCZGbVeevzbeiutWFAWJctdgwxrGYNt4mweUptgkF7cNYFkyi/AsljyesUFgCgvex9Sb1WVZSqlvQ6So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169631; c=relaxed/simple;
	bh=sIZVCb1uTu5DdGLRHhXwdtx9yqw7RQmKAc8mDL4Mcl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GA73iqa+HRJeRsy1UXRdxkPAZe1MJROXylT9kzttV5oc6/UuYuLygtGHHDD87odMol3zGhOr26FOd/Xi2eEyXKo9xom7x+r8TbbvULWbP3HE4DBByvqACEf0RT+uU1HZvK8+r+s/YK7qgr5rfXGSKFXagNDcUoR+c0KFjTVCMYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDhPzC4K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsYsPaae; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6LxDm324419
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vLuFy4Q1i82
	wDIyVXWorPzk11znjiwoUOziygd9uzhg=; b=BDhPzC4K/AweVel2BHfmQpGP3NI
	p9mVznaGMhB+SHRlf9rHjGn6NZNjB8wOSMVenNZHINy1XY+s0kMQ5aUMHeSxsvgl
	IHOxx6QhYg2jMonyvhn5xiEK2D76n1Yg8J+nmceXK8xI521sz/JUuk+w/KJ6aqmR
	ep3qHt/prKZrfGf5ZqG3cTXLsvu80DRLMG6Qdell2SYmI01cIrbahAOeGhnbyAMP
	KmO21ZGyW8jH/oNvIN3w2Yj+6Obk+LoDyL1KfWh53AuoQ0wemsyh/S10qbV95iHP
	WT/D3ZZ51y2CRzf+2wjRQwDOPHXN5Q+k5To/EBDIbq95sJuERVE5TdnWghg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv3mq97ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7b7f04a11so22688585ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 04:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769169628; x=1769774428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLuFy4Q1i82wDIyVXWorPzk11znjiwoUOziygd9uzhg=;
        b=WsYsPaaeNZ0L05CSUpGIolLRUuM19+sas3TBiIx1dSaPvV6iBUPPLRqShXk4qz5lxl
         PZDbO9npN3xNiveH9PhJY/xlNas2ppHCXinuSrD5OaibHHr4PZrBpzwVRi/rZ9JVUA0E
         Vhfb4vTrPQ/GlCrZmPbjia5g1xs8XucnuSZPQCMStQM70V/Tjh/h9SBbjRby8kcvHQU2
         QVpZoFt+lnHd7BFM1R8afNPTuGLfa8zxOuZcpB+oTLjfahpr/UtSg59OtaKrdFoLBs3O
         +du6/aaShgDVS5WEVD2c5GPgOSovleIxOJv/0HpilGUuaKVVbzn4cd6F4kSBPMLdmaLp
         zR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769169628; x=1769774428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vLuFy4Q1i82wDIyVXWorPzk11znjiwoUOziygd9uzhg=;
        b=LEdCodRYczM9ig2Vwr8J+PJF119f1xZlJf+VP3gK7rqcpzIt4bUv5dSGjdN7xokl0g
         LAgmqeVWtLWkrRwJvDfnmSkCJwj0Qa37XfKOjDJgPzHpU5yTEJzR6GaAJfM/3snZctIc
         +C58rPqWVO/iwoR0PJsRuKdw1xol0WC/TSYW2kQz1F2ELQhipi0iXtJQRtdjFrjI23s4
         LO6uVuCU52+kpkHAqGJWRmi3QxU3EW9LKFLWK0gSmN6jTGiEx38jVKI74hBYjgTWgzoV
         7klcb7Ra8XJhZxuyPVsP9FiVS0ri5VyK1D93MDGrSuaUiNvn7xm/03CR4uBGePkZ/1bA
         XzKw==
X-Forwarded-Encrypted: i=1; AJvYcCUja3GgBqvWt4n/CIBiHgGePoRfJPvLWPsE179KJtEPWi/23u5dp4Jbe4ymGxbg6pntKuGL3sHg/SchtHCD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/iYxZo31Ij6Yo/GQgQ/EffBYzKTamBufH3MLw+6XouCfA2LlT
	2CKF6BEgK8xGktuncLbwwvt5+zOnsabsjD/pC/40Tesgf9EfmH41cqoyTSlOIePrHuTTz1AC8PZ
	NfgvnlC0ihrp1AviRy+4C/9+Hd7T2N3nV1Ir0M7sghtprMejn8q6bY3oibC2USHj3bf1y
X-Gm-Gg: AZuq6aL7+qhGfK9gr4Nqx6APpNUZQDyN5gvfnkyKmBlyu8I1l4wjV84id0zENTEMjD0
	Vjk45+5PDPH7SvZgWt0OWYQKrOHZ6fIWIuwMJIxEJH8/9v9RteNWrpHPYaPyrviRMAE3Qc76bkt
	5AzxFyLOH9/nO2yiINRmEvOUgu+7PlTxHp/R0Z4BLqRprlE7AohTXGw5PxwhdcjWRWWqd6o5vsk
	9x/JNZCPr65qLXRAQk1bEGdHqUsVlOMoEtZMhc4DtZ0/mNlH718e70qEQfdrdFlZE+wniHTN+qz
	vv+8rtixHQqAcRbRKqT5V42iaTYUswxQLP3Qk64KCbMqskRYty3/hC5bq37aI1nD4byAKF2Y0ke
	VIU+eUIfwH6oL7RtauXv10czxA3ikrZqjUDAvTkJNE2JoRzKpFlV3hvLpJeTvTBl0jQcKpdIuPn
	DfSVLL6yONbePwHw1BxmJwswVL6hwuQ2QEa4oOYcA=
X-Received: by 2002:a17:902:e54e:b0:2a0:d5bf:b271 with SMTP id d9443c01a7336-2a7fe625e4amr25485375ad.32.1769169627792;
        Fri, 23 Jan 2026 04:00:27 -0800 (PST)
X-Received: by 2002:a17:902:e54e:b0:2a0:d5bf:b271 with SMTP id d9443c01a7336-2a7fe625e4amr25485075ad.32.1769169627271;
        Fri, 23 Jan 2026 04:00:27 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dce0ccsm19047295ad.32.2026.01.23.04.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:00:27 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 1/4] arm64: dts: qcom: ipq9574: Add gpio details for eMMC
Date: Fri, 23 Jan 2026 17:30:13 +0530
Message-Id: <20260123120016.3671812-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: POtQhrged6Z1GMqeCNJvk935fsl0jwyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5OCBTYWx0ZWRfX+fW9qf7gVpmD
 MoBaMv/9uTBL9P86bgVeBR7kRZRAWuroR7BnEt9k2X3/Q68MdmxC6A0HyDZs7RAJ0o5y8+Q2Nit
 XMOGvAyufvQxMi1QyFpdRbPDCcP8gwpYAxU0F2VdcF/O7F4GDgCq/8i5v+9yADM7zNExcKep6Mf
 26JwirOhL1kQ8H8/OKtbxtIlWjcMZbzU58AS1zF1oGF1KkOLKmz7eIePqyjcvywn06064qUEy0g
 SZ1VTpFl9PNGsRzhCHbnh0KrVb68wc8fsqTNJASxKM401tOIyGRAhKUuhoY7nt4+hWG5zDcM/2Z
 FCOdnvipdXKuNo4CTePlYvgD61DzsmluaZMVa/LNPU/Dcg2rCneDAc2CoGkhSZjbPZHIG1wtd9e
 wjx5Xv2pfAeoj1hCx0SvFmIfGWoCxGngMu57WZWRBuXp/x4JLVgME15aiuJ/r7E8nIHwiov6MDx
 doLPpRsOn8vpDZHxtyA==
X-Authority-Analysis: v=2.4 cv=SMpPlevH c=1 sm=1 tr=0 ts=697362dc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=y1XfHMPh6Rf9dVgtnHMA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: POtQhrged6Z1GMqeCNJvk935fsl0jwyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90339-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF557757D0
X-Rspamd-Action: no action

The RDP433 has NAND and eMMC variants. Presently, only NAND variant is
supported. To enable support for eMMC variant, add the relevant GPIO
related information.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index bdb396afb992..e4ae79b2fcd9 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -169,6 +169,38 @@ data-pins {
 			bias-disable;
 		};
 	};
+
+	sdc_default_state: sdc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2",
+			       "gpio3", "gpio6", "gpio7",
+			       "gpio8", "gpio9";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		rclk-pins {
+			pins = "gpio10";
+			function = "sdc_rclk";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+	};
 };
 
 &qpic_bam {
-- 
2.34.1


