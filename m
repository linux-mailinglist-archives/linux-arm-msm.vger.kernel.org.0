Return-Path: <linux-arm-msm+bounces-100916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE1NBMwXy2lrDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:39:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F1F362BBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E35743051C95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 00:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E2527FD44;
	Tue, 31 Mar 2026 00:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyk+194t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+yDx3Uq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DC1280037
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917315; cv=none; b=rHx0r2QJN5NHrRdzhHyJvTUgNP0jVNCv5iC/mLLTFD/lrZqO+EoFWCHv+zu0DUnTvupZ+OPFEqJyilkKG4xt3DICV7c+hXkslWW2vxSCRcTE1JaEwtfgsbKHC+tdL/wDIvgTIRcLx/Baq88N5cK+2IuMND+Z9TCx1z+VMchsxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917315; c=relaxed/simple;
	bh=NuyQAHxJ7FVYTy8chsueku004pgRLlFSwmWyBpbn+Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7znffxwBh6wG2IxwQqBkVZtvMrhuZqmR6L8qLKlVcxXlCG0rZkQEybE1Z469TigQ6ewKHF4Wa875j+Zl+kfN7eqvUfCwwYaVymwnsCMKEqTpw+l6VH4ZN2rgLw5zHloj+bjtDTC0js0YgbVCw8VwAwI5lY3uwezsTbchQT/c8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyk+194t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+yDx3Uq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ULa6q31090724
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTkBt3+uyjXrQqC62M4i2BlypS4CIigIokuIjFRzDvY=; b=dyk+194tnB1nRJix
	bm8GhYsQwCh3JE5SKQ/HjCVKS6XMeiUz3/8Ztt9hyevhXOaTaK61vTwqJKw+thaT
	kYi2k4NA7Z5bp9OffQsOt/ObkO0jhBBVEWKGeUVYPOUDo7bgR5n4spP97NPhKZAz
	MGR5es9CH8G5KeriFB3YX63s2o0sMhvmtJEJrOKy46ML0cbJvj2wNwCPDDOLfbIL
	Jt4k5Z8WTiDpWDSjN87kmmPy42J7MXiB9JHC9byY3YjuL2UDWjvQNhzTAw63xrJo
	4h2JaNBnTH20HTLTna8ey9riiIUIAvcvNkvO3456XcdC+0e8eji/xOQaawGZlbt3
	y6arxg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd249e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so3920971eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 17:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917313; x=1775522113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTkBt3+uyjXrQqC62M4i2BlypS4CIigIokuIjFRzDvY=;
        b=h+yDx3Uq4Jk5Qs0fVAyWHNYk5BhQaOmxZHi04xwGH8J1OAMtJvrL909Kg+wvqh3afa
         hnPQ9OlgQ6cSNBv4guaX9hSF9G8nLKkjcyhrqVTzDBvrE+GtNuiD5IF6gEUxciTDwXhZ
         9FxQBPmCrsivQIOyCMoQnybI4rg8VefsPpEKlJ9ALnvdL4SBcZVGIUg8FDud8JIGchtc
         55hSGbg/0M/q/5uGZGdxVxuk7gtDtTCnDikY25EFt3bzTHUYFcae7jw2jXuEzmEbnz+J
         Icb7jN88Zi9YbGyLAa+H0quwkvNinSWyuzH0nD2wi1I97kE74rNG07tViefuFKnDX8JF
         y/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917313; x=1775522113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KTkBt3+uyjXrQqC62M4i2BlypS4CIigIokuIjFRzDvY=;
        b=Qc+DQ9jxvwDvuzCeVypSfCADP0ZvVQBLb2R60O/rRmS/yAn024U/kOyBEAzETGqmrW
         cND01Z5UB+Y2rUgSfeRSbmkoEpN1t2PcsoyBbnevgBO4OljUNjFeHLvKseoIXQ20+upF
         8KI3+WHQ0khpUqvvDVtvsokWuH1AooFBTrz09iS3zaExFnYf3c6QX72Rjk7gK6S1qKAD
         vO8xTTDjVj3L47QC76i0jyVojNd+/gpbEcKuyj5DhY3L++QiNs0IJrna3MjGQQrHtpuW
         tIwjysTTTS9Pnp7oUK2U/0OcYqGeOezar9Z+3wGlGzr2bxSenclYLyyhWlnD7Io9+IgS
         ULuw==
X-Gm-Message-State: AOJu0YyiMT/xTJGxU9QjhP32YxF6VbNiZ9y3/JFquRqOTuAusvIt1qQe
	1Fw9JGHr0eKb45hw2JMRCfejx3DV1V6VZXFHgvmhqHNcHk5lvxLMMeJFJmnd7MYdt6JXx6pePTS
	sDTmRdU9rWyp+sgusOZ8sqXEn4/MobyfsFax7fT6eQ01t8PQeg2EBhwHDBkCBsYPd/3zVWu092g
	os
X-Gm-Gg: ATEYQzwu76pedKM/oIgOm/DF9SWDMHBV9qT6C0UlAa2QogyL3wny93od8pYy+QNlLsy
	gb5urz9oQFpWIkvGZWBF5+5ce3B2jPibeRvbSkZbFqnJWOB0KFZTfGXAkGCw3ltZ+nwEf0V0j9e
	82wwuHS/gNlB/Gk8cI8a+FhS8lwwr4ClRCbTgUm+3chzW4RUcDLg+qn6zEPGdRPYGlo2XfrOZNm
	OGrqikZmLlfQmGRQmBnsViRyJCYetE1gTaOWR1XEJLWRg9OTM4J4MxCoxBKJPv8nlRoMo5bw9Y0
	RxafJatxk+5ad7Z0TNfJa+4LoKpOq1W8r3u9HU8Li4GdoElxMRI1TiU0FY+hTnj53wQc2Keo5VN
	BngZLcb+vPJL3wE3y5ktidy21Ah02/UA2c5cWcoGu1GC9MtHI9wubJ6iZv2CTR+6GELVxtrJygB
	hn
X-Received: by 2002:a05:7301:fa0a:b0:2c6:9dbc:c0ac with SMTP id 5a478bee46e88-2c7bae4f8b9mr812758eec.3.1774917312467;
        Mon, 30 Mar 2026 17:35:12 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0a:b0:2c6:9dbc:c0ac with SMTP id 5a478bee46e88-2c7bae4f8b9mr812741eec.3.1774917311936;
        Mon, 30 Mar 2026 17:35:11 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:11 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:34:56 -0700
Subject: [PATCH 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings
 for Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-hawi-v1-1-c2a663e1d35b@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=1263;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=NuyQAHxJ7FVYTy8chsueku004pgRLlFSwmWyBpbn+Fw=;
 b=N/dBcboAnyP/dMlu7cGvsNPBsgLxfFaExnmxF0X/GdN4B8cl5833mfMAWvHT8NbrAJ9u8FGXk
 UGg4jG1R7GzBpiADMhrq91nqb11ImIT3clrbb7hSClwPbhKcR09xmRu
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-GUID: Ah-vE4UR2MmIAM4XbEavzz6kbzxGzQKS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX/TbwETwQo30I
 KkQszqXDYXZSJK+jXM59Et7J8Ljyo8M7Pgw2gPjZShdYYglQ7qoDRqJk54G5VEfm0eh9A7jq/47
 UWmj8K5ug3mvlUN6kNI0D238gnZZaIkydqx9TSnGwkJD7iiDyMVghbetETE6peecrC/rMu5W/sO
 vnv3p3nXtt8AH/UVvXZ2OxGDWxm5CHHjw27EigWC17GbprYmHQY4TNAuV3SPQSebVYPvqWHU0H1
 jDpqWvM3lf9mzyQ4DpMjiOvQ9bLDdewZagWdxDKVxfi/CDS7UKQWMNv2dKkE/qixCH5iGxPbnbU
 aUGP0ym/9k9Q080hyDV/n8os8WVwEJ/5m8FAyEgo/SUuGYclGpbjXvp24dGpHShqgdLSVoV7vPr
 8x1GzhuvLCTqVLWTMtVd9nCt1q0DtjCh+4AG7kqbZ/KWlTcyL/c8TV17MqTpPBrsU0RKycfEwC6
 Z9xcXrUkPd+Q9LKSaNw==
X-Proofpoint-ORIG-GUID: Ah-vE4UR2MmIAM4XbEavzz6kbzxGzQKS
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb16c1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cY3P7eX-TFPFg106ArYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100916-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88F1F362BBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update documentation for the RPMH clock controller on the Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 9690169baa46..3d5a4d3cb00f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
+      - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..2d62d5d0b08d 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_LN_BB_CLK4				27
+#define RPMH_LN_BB_CLK4_A			28
 
 #endif

-- 
2.34.1


