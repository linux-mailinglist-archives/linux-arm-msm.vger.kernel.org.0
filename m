Return-Path: <linux-arm-msm+bounces-112603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VXpVFHhDKmqflQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:11:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1B966E6AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:11:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fjVHrvSl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gmfoTYG+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112603-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112603-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FAE730623C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A753921C3;
	Thu, 11 Jun 2026 05:00:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51526385D79
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154053; cv=none; b=Vy+MmexxTtCFrrn3xK5HkQlGsb2ThLQqz9Yh0RYVIwxqouAJPspH7feazVYTT8ocFNZ0auyVC5GU28O/Mx9bx+c0OthgUiZcoSxgWNAaTKAvh9ftqup8LCi961OLjWGsae47LTXR5pkO/mRSwT6PtJtuHVN9FsL6CIhwHrbqp/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154053; c=relaxed/simple;
	bh=JYCBxKue2je4Cmcypa2TZclpOE9DovouCbVF1Pr3bBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMq1Si03OZhSE026M8z0WjEnJFFEqpneFl5zx9hmFfyg/GZF8HBdRvUQNvWctQopDElOE6u99+Srk3gL3VlUnH3nBx7awhtA5HB56LCre8Lz87TEE9JVGeYCYa4glHqvF7FuOfcNNTq+2+/1ePmMovSP02Jd722KZqmLJwXS2Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjVHrvSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmfoTYG+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NhuA1614764
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AulPtbKhKSl/jbs4Ey8L9/KWu9DlFR9KhR0INMBYR9M=; b=fjVHrvSl9ok0ZbYM
	ncS0rbg1b59KnUwZ0LLiP/VMGgDTew2I/3wiGZeRmoUtHP4cITJVQB2ZOVeoGJL7
	xcq/pr2ZJLoshC/FP1RFbKlMWUBjX35T/8dfSLHxlPaNWKvr3zXx1IfD+V5zhat8
	2j0KTt41GhPAnGyLzqqWgZpeU5crNOQuK3kdY7dVY2PWYUTdgOP8wWrHxEjUTccj
	2VLwSOm7uTVDV0dfSo5RkR297m4N1+6AEJu2+tfB/Mcg58wn9hIgzh3WKh/Lcc8x
	hed2qh8uDaqk9z2ZDa9G1vjiYToo1zhzj1GvFH25+RilQejz4lQec+L5TX7G3X/9
	eM60zQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79hne0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0bf6904a6so112543725ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154040; x=1781758840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AulPtbKhKSl/jbs4Ey8L9/KWu9DlFR9KhR0INMBYR9M=;
        b=gmfoTYG+Cz/xukdXV1EH+Kqq2GlOJbY6iHezyJ6gazix568X9KcOTGa4ROt/YLhdIa
         Hc4YNznndNYg3nlmGdivl9XsqfBdC4mMsCHnl+JrWKmK5YFwUm5J0oRqbCecFsG2c39P
         KhBFLT9m9D3AJiB4C79Elsv3xprtk0mTgY9LJa+d2IwF7DWZhD0s4IiqhQVl+KnJ0xwu
         j906iigC/ZaKU37Xe1eBcdZ4wWlSui8nXiWRvvPj6pO1mW6qDnJCJucbYa9JDvyZJQcA
         8PH68PFcX/ZQ0QaKdwOtaVSaIO6OSENfB7/YUHHCeMDW3K1iGni9zxxL272pPeP+FA4K
         PFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154040; x=1781758840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AulPtbKhKSl/jbs4Ey8L9/KWu9DlFR9KhR0INMBYR9M=;
        b=eHWEb4zsel/uVEnp7y72zpy6KitCmz2Lr4EdJhYB+nlzsIw+qjK9oegULdQerhBvjd
         Je4fI4V0wnB4SSPKpTHlVWRwnAWUttO2+j+eIKK1CQvTnxKwXSYoTsDV4RvZYdGY+Tus
         R2uwWAyYdZMhX6Aou7i0quKWqkKT0vI7SXblPRKcatlYbLKRJ1sHGKa4dvRNne8dizbD
         E/JWVYiqstFj4mMuY2qLzbYvw9DVSlFQH/Zt2M5fb0F31ocC8ME7TBVfr12NUshKpzFU
         k0st9/4unvK5zJYebC2qhM28SRagcd8uwmsQG1BHS38q5wwxG4meryHMZedPAOUBUZVy
         +ILw==
X-Gm-Message-State: AOJu0Ywejycpy+/lRCsxBAdwhx8JheHsxAuo7NtwUB7PODuzIzzZ1X3o
	q6dJm8pzgWgiE0QIm52IA77XsOLjyxKhGJu+jmqQenJJ+S753UebvN9XAGRNuge5rbJqVJbcxLE
	WIOau8K3h2VdtRm0LkTy5DGDnC5t6IDpyihVOzWeGHhfHCPro4nrvJO6ab2j9x8LwSpUJgFHVt9
	Tf
X-Gm-Gg: Acq92OGXjtSostIFf/RxwA0qGjlReZEZ/6vtqMMRLgCuW4/NPwOYkVl3nitwoYiRt08
	UFVsY0T8mtj8+FXtBKvJ/TobAYd56cwJVwXRmVFpdoIIF7RsiR1UONyO3yyx+/2+2MqXmMHiVLd
	riPcsWOPAjwcy7+UZhYFkrcsq12Q7n4igWqvmfO7KNqbn0hNHIYtIpxoGAM9Zsem8/5mPpsYOAK
	auSwoshURN9jde1DttoMD1iDJLyoeUDXtI5ZwAUhWbGa5QCnr8X32PmPaWkt2ljOJ1xSFMTBlVp
	oZC9ACPCiLjhaGVyAw+I9T5L999c89uCfuoaDc/90t2T90kDcomP9mYwr6VLs0B4qpop75Ih5Lv
	hwTta5YAQ+JErgjh2qcbe0eHPd3CriWe4pHA6I2te3hqWgexr6FsvhUJNvSO7hMPvzWw=
X-Received: by 2002:a17:903:13c7:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c2f0930222mr14081285ad.14.1781154039239;
        Wed, 10 Jun 2026 22:00:39 -0700 (PDT)
X-Received: by 2002:a17:903:13c7:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c2f0930222mr14075715ad.14.1781154033843;
        Wed, 10 Jun 2026 22:00:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:01 +0530
Subject: [PATCH v2 25/37] arm64: dts: qcom: sar2130p: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-25-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=2554;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JYCBxKue2je4Cmcypa2TZclpOE9DovouCbVF1Pr3bBk=;
 b=eEgY/3wI3+5IdOPwcE8JlVYdoFWiLvdzEJ4O4HDtnb2oqDTFj0axDzLPGCsGmvOWveRHR7abn
 RcgL44G7P5ICa5/1a7pdL9DZrbivFlZMw30xLXHl0B02ZnPqrIr7yTY
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: YDtLV27WmY8y3xVvanWdzSLsKB43aDZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXwyR1dIwSjsMv
 LL8fcmXcRrJ5VhYMY3ndRQPgnPF3hUW3mwmjJfOI2fT14EuX2TXL7WMKHG1xh4+hcuR7pPK6LSx
 PNXljnVDKHRQl/QkonCjlCdD2+PTL3dhUEo6xcdJ4YmuIGGbwji6NAN0q+pv6IdQ/9KFQeVPTir
 BYs7MTkZpdEKOGDXxXLUtfAvRvHsx1hjCbT9RWn2OIwvMbkGEoQtE1SbxtWyEeISbHTsKS5z6TX
 6r4ugYkuHFHoagPnbHuFaq9P/HXHF0dorIuE6Jh692xmrxzJ96sa0/grG72WoYc67z0PtE9/Zot
 0y/vLIkiRm/qybkBaUjOgoWcR22+VLxj2IZap0p5lfadtezzm81feNHn99p6QqjtRoVAvU33IZ1
 HAV4/bqCnYPnkfqCOAzjEPjLRs11o9+/08m0BTPVMP4i6hamGt3RouZF5xFAPdH08tjT8G6X2Om
 dqYgBxt1fXDa6Tx/z/Q==
X-Proofpoint-GUID: YDtLV27WmY8y3xVvanWdzSLsKB43aDZ3
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a40f8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX61eh/HE42A4C
 CIeW4Y0dTSNZ9GulvxlSkl0vftiIuvyvW/7uOrIwfNv0VIeLSuW+TmGwuaCBJIKhfXJ1TnRSOxZ
 cqizvnp5pRIgL/GcE1568DjSgIxlJBI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112603-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA1B966E6AE

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and newly labeled pcie1_port0, allowing
board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
controller override to &pcieport0 in the board file, renaming
perst-gpios to reset-gpios to match the binding used in the root
port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts |  6 +++---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi         | 12 +++++-------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 71a09e76b359..6e0557f1c14b 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -357,9 +357,6 @@ &i2c10 {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -367,6 +364,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index d65ad0df6865..804ccfbdb091 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1337,9 +1337,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcieport0: pcie@0 {
@@ -1350,6 +1347,8 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -1464,12 +1463,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1477,6 +1473,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.34.1


