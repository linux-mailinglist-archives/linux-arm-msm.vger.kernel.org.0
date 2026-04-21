Return-Path: <linux-arm-msm+bounces-103960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI2kLnSA52k+9gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:49:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEEB43B87C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE7E93062C0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 13:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C5C3D75C9;
	Tue, 21 Apr 2026 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCOqt47r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6EodVmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FAC3D7D6D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779163; cv=none; b=hC8E1H9a0r+S8IdwITSGStUKv3xVU2U6v0WJ4HvqvNQyNYcf4Ec6y2uz4zqhH9W9vzdLfYQaCxW9vgztPV5dP1AK+9/k/jHQP816N/K25ur1DF0xMP0rh/b5gPxbFPyFoEqogIhH1DJifKpq5xeZrOUU33luZ4zauh19FFZ1V6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779163; c=relaxed/simple;
	bh=zq00MUR4VzZHCrO8T74cf9Zv1o195VSggZgok5yyGxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eP22mhi0w5Who3nk7ZC4r154P9ajf3AS/ndeKesDVX/b6DfWnK5Jc7YfUuG2nTTTmRZ0fOttTfVN6feZg6wJUO+scmleJE5tOYE0+UWusjI3PlHW1dCl/cEAK+NR2qdp75h/L/Qyg9hq+dJcoRbi5pTu8RFmEDEjp3qBWsLulSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCOqt47r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6EodVmM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LBNj0J1015347
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rM0RZikHJ9qo4pCCQws3oQ6VZi1pdvIXQNyXziTUXhs=; b=KCOqt47rpwC3Vk9Q
	wT8WmCqag5U1KJFlbkfRoXoCI4kUbQTtSaRKy+agtKwQa8GDTRI+Gq+IgErsjb7D
	rbuGucjfMqATjAvTUDXaoz3ORJXR9MG0uDhxyjeS0uM8A1xsPckB3kNXG4bgp9sR
	Pb73Au2AdBXDLaAVpemG6Bb1UlSjSylNBY1ZXldAusOlrHAMjep5Jyl/aaFei+89
	9byDsdwfzBvY2sw99p4iO+k3PQXFijnNogeExiI1j43z+nIXHBvw5qZb1tAIS6la
	AmvMxv8sDCVwDtyJBTvbL+cgSQAv9PwHjM8V08zFofqgRwBgW7QdrwvYSiF8MLEM
	/QrlsQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt903d2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56fab6d9242so7068841e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776779156; x=1777383956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rM0RZikHJ9qo4pCCQws3oQ6VZi1pdvIXQNyXziTUXhs=;
        b=R6EodVmMRMkj4nXePJWskn4MbZ/vy5OgeHoGQ3xHCDAOFlRzIsgtvmUKxS95uqlW6v
         dYoppCVsPg7+j0vxkxorRPWn38BcAFj9dbZjA9JfSqIF6QTX2Q+w+pjUO/q1kPv1HZQf
         h++ttf31RgBajpwRAZU3qHJ2KgO9SYgQhTMSf3A5YvWMBxrqTkJAN+B/nJ4ADaMbqD1b
         ufAsv6e+Jo5a+PNfaZSYbEfqfcpkmTzWC5/8abaC0/hRUD+wfHQvmAdzcLOsV7iESWs+
         c7LhDYxLLH3yGmHLfa9WR41aKzz0PeWus5WYUTHrW1r0xDTJi1ToWri9H4eG69S76K1l
         pNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779156; x=1777383956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rM0RZikHJ9qo4pCCQws3oQ6VZi1pdvIXQNyXziTUXhs=;
        b=tLFGeOXh06lOsXQtvRzQv1SjMP9cg9iygzRjwLGhxcw5bF51T+jdfXQHZwd0qYI2FJ
         QWf7lk+Ytfz3usJI2hT3xaMlbuiDdqQrycU/VO2x1pgLGLRQ8n7aNewKSjZUJpM5C8hg
         xrVRlSsVawRai7INn3GWt9JDe6inXVVIikXjiKAiFyYwmT/vtKxqQTJ86KTgOnOarCD3
         QV9i9GmvcN06WtlHaK+sTF7nppQGpbdh9oDy0sT/+2tirArycGkb8QfoYbe+PmCFrGxE
         fTsBM85neqpaD67Cbsm81RHJvK/nQeLI8JmqkIl0MZ1VhoXM87/l5+XCmr2e9SEAniMv
         m8Kg==
X-Gm-Message-State: AOJu0YwypIP5P/xfSJ8TbLFS2B0vb9mre0BMHDpDD9CTd2kMDdD6R//B
	DyE8rMavT053sLXRTqWdcDV/V4cYNypBwyY9B3ysvLq5RfCFpXK0xZHJMYy/yhTuDCZAxFi88qa
	EdC1AFnb3tKJKE30gxSBa4LH3sysC64EeiGBj6LI0LVidgb8LQG/YLYlxEtG3QPNZtoc1gZhhIi
	qr
X-Gm-Gg: AeBDieuiCgtcmVhm+S6+UxULxmMJPAirsJ4DamQHdo7inJYfW0ZbdgoL9YxovXvtAIz
	cEPRUwzNcjAokncdPwnLTMaBXfpOiDHewHGAzk0clmJTV7ajUnEBgnH0h1Vve6d6H1vORetZ/aw
	+3QG1pF7x/S0b4gz0FJrGlM2aXzGyaIwW7t22CErax8XEqDuu50uuIxt5PqRuWGLB2RzC2r6fsB
	OWHpmEBI+xLVcOTPxdQNefbROti4JhkIInKGxT2coNJ2JtwwHRDx+YW39Gb085eccqDP8trbCS9
	ENfh8wypz8xKcrv36A/QePnB3cRFKKD/3BmfrLpUbegohLD7u0Vskkp9dw4f3mi9HHzHlWLvZmo
	p+2zAopRQt/c142OFulJpHMOWBxswp2DsloNPKeRA/gZAPp3z5ySqGzI=
X-Received: by 2002:a05:6102:109e:b0:61c:5310:e9d3 with SMTP id ada2fe7eead31-61c5310ec4emr1519522137.24.1776779155975;
        Tue, 21 Apr 2026 06:45:55 -0700 (PDT)
X-Received: by 2002:a05:6102:109e:b0:61c:5310:e9d3 with SMTP id ada2fe7eead31-61c5310ec4emr1519498137.24.1776779155572;
        Tue, 21 Apr 2026 06:45:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1249sm34508647f8f.5.2026.04.21.06.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:45:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 15:45:30 +0200
Subject: [PATCH RFC v2 3/3] arm64: dts: qcom: eliza-mtp: Enable DisplayPort
 on USB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-dts-qcom-eliza-display-v2-3-67f8cf155331@oss.qualcomm.com>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zq00MUR4VzZHCrO8T74cf9Zv1o195VSggZgok5yyGxw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp53+Ky2CIKzF8JhPxQlagKK+BOH5iGmGttLVx/
 itB2NH3wwqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaed/igAKCRDBN2bmhouD
 16ngD/9ba6pm8h4drq/MCBAs3mobapu4uFxeIdFpOCQdinTX+ATdcRNSfTLUr9HFYBLL0tG7j7f
 3mX4m19/OScvuBc36Ihdsh4isuy6AsmQdcPBQyPWkvs7IVUl+OYXLslZPabDhE2hh/6o7oraDxo
 q5hV11x8bUoOX8ByQBdMCQZxRG/IGvxpARArCCxWH+FWWeCn2Sz5xxjG5jrvQbU9u+LpkQ1XzoF
 OKg964pM4c0el4XPSwSgO62cmP6G6FBC80jfERyGKTxJMwtqklspVndQeFMsxHoZgHtq2lKhk+y
 CcKwTuJKRSLOOajQ2fp5cuL4hdh53SVFh2GQb90psyCdVfg+uIY4uaKL90bBuCsIZDBliuJJCg0
 eqLYawnDvjcxrKgzuGVRMhlgpknombUwO6wcShticM0PUYj5q56ZiN36qqtBG1RmOiaSqihqtiW
 dCo3ceHg5LLRwCncl+wIRhm0xiOptZKUj57zuvwDKXrhZEK4Kt+RHnV0Gqz+ZaQHlnpA/FvW/dq
 pHcSbOaaC0QR5MLM1FqmJZhDupGxplfEIvYYrLbZRsb9eLiWmaHU8G/W/USHuNRggQ1tzBSnnOz
 IjkiTFc8IzkPyQJm0TpxydC0kLSz2chPFpuEkEnu4c/Kd4Vs1pjyKO8mXEbiT/MuDgUjFrfRdv7
 J0n4sdoxgMhMp5Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e77f95 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=O309HYtxkqMLGareKSQA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: qvPWAKyOZrvBKS2Hlhm6ofFk5s9anXjs
X-Proofpoint-GUID: qvPWAKyOZrvBKS2Hlhm6ofFk5s9anXjs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEzNyBTYWx0ZWRfXxyTX11xEUkk4
 iZGbKVL053NEdZMT0255UueIoqWKQ4Xa4Xs5fMWC9apPZnZ5RkVTclOPEqGjN5iZPB8F0ldThM0
 JAyY7PGA+13Dx1xVEngYHAPM8YE2Dr4M0QzNhy6oUL9WUuw/7kMp/wlpbcDmWKVwGjVviRW0hQJ
 d5fCBeouk/PhGtFR1J6214iAaYGDZR14E1GE/+DYWjW8LP/YD6sViMWf4SebQTCcJLEPktIVJcT
 qNwzzF08XmQen5eVGnnCJqKdPGzMNbDn1jAKdh8PmO9eUxZrcrqIH+k1fvMQeZAr7WF5PHM5982
 ldGXXHPNNK7TGvs4AFPTaTftkI2rxV4zBQvF18NF/3yYAwmqDmhgNVoMZAkVzxMlDpe2nG/A38r
 f5qeTSM5uxmh6F1sp5VdkaTv2t5xlTWsdrAxZOVgtOMMzs1iFMJL2KUtYXoM7R0bly/HD81/+W8
 fgZArm/7gqFQMfAvP5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210137
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103960-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BEEB43B87C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable display on USB DisplayPort.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index df0cfffcef61..71c1ac934367 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -421,6 +421,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l4b>;
 
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index f235a72365f2..3ae5225024e3 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1010,6 +1010,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";

-- 
2.51.0


