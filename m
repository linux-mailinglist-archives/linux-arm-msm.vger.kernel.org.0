Return-Path: <linux-arm-msm+bounces-116115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NswQDNGxRmombwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:45:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8936FC438
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:45:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="cl/CBsuA";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ge1JLyDY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116115-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116115-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA8BA3008265
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2042A3563FB;
	Thu,  2 Jul 2026 18:45:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D136E32B127
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:45:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017923; cv=none; b=FHQbxM5OaobS4ZQ86wSxRIEsUXEwpTjVHv3rFt6SGSupsebeW0BbXIE2QvY33+jhcu2mgyHv7IfpkEYvwcpxHtTesD2/W616QDC8o3NIkBCaZ+i0BwpI3FoaENceNt+/yNTt4KK9nwvBwwflrma2mRSeQzH81oGJDjr3rSLB1qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017923; c=relaxed/simple;
	bh=GuozTu4iKelbzrX4UB0Wz5NEYvlygReZmrmon6DC3Eo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q6Cbu1LEBFyCTA4hQmuSmr1E6vOTRsZ89jfopzJGfi5Nl/v3LSYAnCx20twg7Vrc686ubT6GRe+FctrGmS0fBr6vSCWr2Lp4cW8xvkHckbpPLAj8++jwSjk8LikXquA/oVMo58a7kxVmpnaXmh2A4zB68p+1xKeUYaXmGRnRzVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cl/CBsuA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ge1JLyDY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662FUW8q865956
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hzzoxlnxHfkJrok1DuaQwZg5yncgWl7H7sn
	GUfRF8+M=; b=cl/CBsuAufkrZ5fdC2RhXlUVq655BYBSycb0laGnKg5EZAeZZ3O
	pGU2ArI9LuOxWO3MQflk6wq5e6qqFgJjCfMBKECV7KX4dALTY94uSG553OnwWwAZ
	C3X/QHTfEkj7s4d54V2FP+WL2QAxM8Q3rNz9iDC2xGXnU1LQt5zQBnmCLTgJ0Oii
	o7ui80Dyk9VbZ92FT9Plb2oAh9aLBHTOUq3HiOKx8Jlrg+kjL8lSCO3e8WccFBdh
	OIF7ounQ6YN2lSNDebFYc99WHhjf3/wJVoKOPIFtR/bbtvqZ6TiJnSE3PWGWmOkK
	1PpL8zoNG1n4Hze1tAStMPk1YK9D3tWZDSA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpngsus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:45:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8478e603285so1145607b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017920; x=1783622720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzzoxlnxHfkJrok1DuaQwZg5yncgWl7H7snGUfRF8+M=;
        b=Ge1JLyDYh2wNbwsA7A3SKLDUzcxrqRA8woBg0sepHNAa3drz+NUgrWG8rRbUwGhyIr
         XKWFxEkTqpof3OktgVLbNZ2wN75ucAQP1DBF3MJSODdW1XItkQHekSPgx79MIZykrtEv
         GaWMan6FJkcQ6vCjVLnGJ+1YPw3Jfss+seb96Pgkjwq5Bz7vBz2Jxkbk7hmpbGL4HjQU
         Xqkmmut9xMMZoS90txGs4Cb44BAaujt+SXgPryyvVMgAgmksvhrreSM0rKfKHVk7zJtr
         jCJJsWs/B4S1a6oTqQve+vRBQmWivik+DW/sG0SIjsTM3LsUUZDt0vIK9SonxGYy7Cu0
         STtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017920; x=1783622720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzzoxlnxHfkJrok1DuaQwZg5yncgWl7H7snGUfRF8+M=;
        b=WAqpKMY+7wB6hh/5E/TtV6r4sp+2T+0e3YKRX04PFTBX/levVa68EImXKc++u6GTpI
         WZQ5WXUm1tXpZi4RuWe5cjPtedZxtFvYNricP84BQv3jYsg2vZJGJHadb5wBOwrT5zCY
         5sf2Ot4Ldw1adVz4o6xdoINK7nW7QGHNdoicoTdkH6Uoi+XqzpXZ1+1WgKQ0yJoWN4/E
         SsTOa19lKf6ei8PiE48o0Vr89sOB9WDJHV2UWXbHirph8IWgohrTrGKie3d5zjK1LaAZ
         gBDQjVvlZq66POLgWM00YAfZhGteqm5lF2Z/FR5P/j/oGlCVsW/O2BieEcto+a553u6J
         3S/Q==
X-Gm-Message-State: AOJu0Yx8MgHCt5pyuJgDY+egVCWaM+4e5P9us0EzNXiiGZfLP9xxUQaJ
	GZTk+zl/Ng5v7vDElE2EmCpcqKzASsMfeVehzOP1srJmU7DByVjpiFLU5NzeP1WE2bPuZ2nTahx
	4cs9Pf68xlzZu7FX4el53nA0FCBa56zTOElMNR5UUVveJaHZ0vpn+LKXC8owdLBY7SQoP
X-Gm-Gg: AfdE7cmAoohAIF2ykBuGkXCdq/KvX684fomHY3GYrlfI5Y8TXlbm81iHjXfzyL2gYC2
	KrrA9vQDcgK5azmx/V06oswYQZsq3dQQeSWFU/gxA2u6Wa4hyxoP1V4HioySIxAu6uS9K3J23mb
	Flfd9OZ4gnYqeMYzhN56SutMjuBOJVl3rUl/g05hZhqW1jGolkX9vGvRwh4i6Sa5i15gKaiCYKu
	8EurNWf3+RSPfUrbwdWvOeZDYs3jQ41EUzCIwhM39Et9yHppazWfwSTZZJU9ZJBW/ofYME7670H
	SQRxkUqc+QqihhotDX70g9ewJF0Tm+P5kuO31oK6NPa/qlrIrymbkelwLb1zbuwLZQRFV9cl8bD
	+/yuy7VWiYXNff+Aev2/H2tKBji44pVeLEJaK+UlU0EO739bKI2ZPJo77kJ+P1vPQBqDLiNfqQC
	/MuQzO
X-Received: by 2002:a05:6a00:3c90:b0:847:87d7:ac64 with SMTP id d2e1a72fcca58-847e18bb2abmr878080b3a.23.1783017919750;
        Thu, 02 Jul 2026 11:45:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c90:b0:847:87d7:ac64 with SMTP id d2e1a72fcca58-847e18bb2abmr878042b3a.23.1783017919293;
        Thu, 02 Jul 2026 11:45:19 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dba0asm1745547b3a.7.2026.07.02.11.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:45:18 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: sm8750: Add wakeup-source property to usb controller
Date: Fri,  3 Jul 2026 00:15:11 +0530
Message-Id: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HpY3eNDr03q1Zy85QEXxAFjC8gfRF1jB
X-Proofpoint-ORIG-GUID: HpY3eNDr03q1Zy85QEXxAFjC8gfRF1jB
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a46b1c0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=U7BYSfXuTy1Osme1jwwA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NyBTYWx0ZWRfX/2Qspty/msPr
 Tr+m179XMfnKcHQOAhBv43+Pk6z8GwxfD42FYjIQLRMpPHoXL9klUT5FDX/Qpojq5S+KEZWSAbv
 dHBxCfYGE8t1ygbo+TlAXlnZFAVKV5U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NyBTYWx0ZWRfX7QMzM+qhhoUZ
 Y0tn5jYFHkfHaCO6zINr+kyJ2Gwe5PNGp0RIaNY61S38clp3/WzrTUZ5mXDSaidP8sWZUDCbnVB
 z1DWJErYhtrf94/n0CK6yVOiLkoI5NXQb01ZWt7LAjvcLRMO17VNeS+pilySFbK6EtuYjOy7oCf
 miZ/Nt27gW7PXeJ5O+s/spIea81Vh67tDarZL6kiK2Zj0eyMptfcIGXFWMFPqmEqAFMmxrDtnNA
 5HdEJs1lbby34WS92DLnPLPA8K+DICn1zNnoUVe/YQdSApzZ98+vytGF8FfK/zDTyZ2UgGdsvwT
 aksbHbwQOOXUYJo1iODAv48jg98SFgaQgMyM5eH1EKzsr4FoC30tJN7k67Q/QNh52I5c68O/3i6
 SQKa7nG6Eo7IZqQjtCm3U24JKITFWEpH7Lwffb4A37/pkZ33d6osNZng6eEeEeiTfEzkBdGrD9S
 8jKPDyyz7minLO5xdKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116115-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD8936FC438

USB controller on SM8750 can be configured as a wakeup capable device.
Add wakeup-source property indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..88a7c9ac05ef 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2893,6 +2893,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			dma-coherent;
 			usb-role-switch;
+			wakeup-source;
 
 			status = "disabled";
 
-- 
2.34.1


