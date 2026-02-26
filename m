Return-Path: <linux-arm-msm+bounces-94331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD3SEal/oGnxkQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:15:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D611AC086
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 824CA343798C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 17:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B082241C2E6;
	Thu, 26 Feb 2026 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/epo8/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mk/M67uV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FC13E9F7C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125198; cv=none; b=f1j3Lw46wozipbWqolR/4zYFmRoPmbx4VDbvw00yHYtjbYXJD6QG8CjL81ROBWAs7E5Lju5yuu2q4IU5QDr5/RSuLTBhm5kqT+JPcozX4OkOvnp4JJrGrz+3HK8HnEoEe3TzW3DxnLBswxBDx2sS74BCWVLym7q3K+yNuW1ZtMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125198; c=relaxed/simple;
	bh=WXyLbdHHmaOuMbGg7y5AY3ajr9TOq0bVXg5HkjDwCF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9rk+YW8uvQbBCl1AhBTmR975y0VHlHXLfHtqtNWi7/G4uB18RxvbmL8ByQOaQF0U6AXJzPaRFYVIewaLvL0k7nXSjks6i7zoMoA5m9nC5ZFOHPgBD43ytogA3mtaofDWWr/zTlMYDQQO1EVV7AC/VUaOiPTB/qTRQqvIaGybRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/epo8/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mk/M67uV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QGhoMM626463
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 16:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1MQLiFKQb2Y85kMTYM9yyEMENzkMHyVgI924UYJr8w=; b=o/epo8/aQfAqXpsM
	wKTYfhRJFqw5AQgbU8aG6snAme+8eJHAXlV722jVQ5o5jlLH2ZbGbLYXwNT43gUA
	drUUL578QQiSrz4HpbILzJxIeTL13nEIgFa51s+qyQvUcd/gCC8Iv5VcbTi9ayHf
	/Idit6fxjTwkigDbIV6/x3wyyJy1kPYxYU8ZsCcTmXP3bDVQ4aTCC3VdZ23E+D+6
	9XlEDyO5X+HFkc+L6qNpejFQhI9cm8OvIyIuCBmbd3psnTO3xf6/UB4jFgikMynN
	J6HC3aQ5KF46YpLSSCPGhl6y3+xqxfehD88hcW9clz9q6xzQvPCVPlvRVXOUVMFt
	ks95Og==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjdph2jrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 16:59:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso4276358a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 08:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772125195; x=1772729995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1MQLiFKQb2Y85kMTYM9yyEMENzkMHyVgI924UYJr8w=;
        b=Mk/M67uV6PXaZRPhfAdv0w3XbMsox21F5Zwp3/DHJtX9WuTLXIWeH20N0W4n3boL/N
         C74ypKrTrKqcpImCDfGxMsiWoNvgIN7OrXnyc8A+GWxr5hux4B8cNot+fCxzf+BIJLAc
         crGHwxfLDcdFx0z5RXL7S58cMneZf5gAqkkV3o7e/gZcFI3hexffi/HwgiDixwCS25a7
         cMM8+28F/zyXrG0aEziIdszMWH9+ujFWM45/zPuSXzNxjSYN0hC/0Cq/+MvAgzFUCnCs
         +4DjlZkocKrmLyTMX5HEEbbShhX+JD9lVOT27wN8gs3Hdxe9Mg/ChkxWAC8ef8j7UUAJ
         YnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125195; x=1772729995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E1MQLiFKQb2Y85kMTYM9yyEMENzkMHyVgI924UYJr8w=;
        b=ZlfO0Zxtt5KQCAejY9/WVYTRU+PfjtbJDmTQpoZGzgnZtYXfdXaJ6cHpdyByT4NQkC
         jsStvCG8E2buijTAU6f96xaj1kOmcMVshgvnkkrXUOvDpA1H+OB/YkvYCAdlNPSRjNOv
         OLPMuVFg/2qj5iKrAaI9xlLQRj3jFnuam5WNoqWC2VkJLVaHjzCqekkBdJuBXSmHJ2MT
         q0ZUeA7JP0+VNGAA4KivYCoB6PzBJOnL8fDtNuz4hNzHFhXoBIlBAOx9gq0+ttqG8cqV
         0zuov/4JriBOynKzGngssQHcrD5LSIUGwshu1hsL4S8txy8AGNLU3JyzMGLPrz17fhH8
         4Mvw==
X-Gm-Message-State: AOJu0YzGZdnNrTJKAflZu4Lh3K+kI5p7G8iU4gaFYx6s9+3d7x2lkOlh
	glrvY5WBbyj7+YeNd/lQ24ESOylWFuG3kg1eGXi63ERlumkdHxnni6r1ZWqx/Lyw+BM1jzwYb66
	Y41jJpqdkdB70M8xj/RxaHtCm2IMFUp8CwRlCzy41+6i2hpVmFqGEmz72e58HPQH8a76C
X-Gm-Gg: ATEYQzwiaPetsMgznyYydawSg+xZIV0mA73ZjL97yl2H0WgORznqwLObMExrlfJoWGQ
	Ns6Z9sKkXJfQRSLIm7mKahhdereIAB1CWTZSFv/x1YPBdkQeccTTFSqVqqrPb/XWK4ib5+rNytK
	gfYbqbcO9lEU72c0I6imJVGMsJGWqelLNQKgmqbA3zBS7pcdH6wh8IfOKRh69iDbl5niMevpe82
	4ULTVzUBmqU1tPXjUZNhh4dQdG7MHRCZ3Y+3VVmN0E1Bbm2qjD0mToF85sGIqtv9gFsENU6cwUI
	CvgvppWApu0GB7fa5PQKocVjM37uQ2jzNmuoQFO5Z9BJ0aFRlwUa5+2eW/anE5eQEtn0QYMsvl7
	D3mvUoAme5/Mx2zN4KcZEeTxjRT9HZjORO+6yDtRRtjxBhkMAwDG0hsePPq0+DZ+7U1GONqwAGF
	uGtxnRedzGK6wDwBDFU4NN5CDYtGBoitIPaKesxbo5gbHMi+5FQmw6Ha1c
X-Received: by 2002:a05:6a00:23c2:b0:827:37d5:af5a with SMTP id d2e1a72fcca58-82737d5b32cmr3268399b3a.19.1772125194624;
        Thu, 26 Feb 2026 08:59:54 -0800 (PST)
X-Received: by 2002:a05:6a00:23c2:b0:827:37d5:af5a with SMTP id d2e1a72fcca58-82737d5b32cmr3268376b3a.19.1772125194123;
        Thu, 26 Feb 2026 08:59:54 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01054dsm3626286b3a.43.2026.02.26.08.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:59:53 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 22:29:37 +0530
Subject: [PATCH v8 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-wdt_reset_reason-v8-2-011c3a8cb6ff@oss.qualcomm.com>
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
In-Reply-To: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772125179; l=1779;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=WXyLbdHHmaOuMbGg7y5AY3ajr9TOq0bVXg5HkjDwCF4=;
 b=2DKetvF3EjZb8u/EVtyleuhpgkKt5YLfhHw784fM5ata8SBs4RU/ky6LZU8HXLM+b0a27VGAL
 iiox7ztdJR3BlrEU2Cw79wKUnsNACZUv5WKs/3arPkWitdVRuBG6yGa
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: FUXFAw4j8Vy7tabs6Bli4QkYLOCiVPw-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE1MyBTYWx0ZWRfX1jRN/KX/OM8Y
 bTiUadh7+FuaWPCFDhFIekQIbXbe6veZWvbfxfTNYynWw4QlpDaq5ZDxualI3bf2JrEqWCKDK5/
 Bpp/sjCWeKRcPS9A4Z7tNS9TvY+8YznWE0VNkokwjWZuUF3vvCZT0MG95qPUz+cbu2pHoFfvPr3
 cQRJ4Zg0rdLBMFmlOCf4dQXQn/kYCyKYBCKoGA3TeqxoUgSiOR1eBUSL4MHU98NvoJU9rtZIOgo
 2JU2/ArI0BbbfCUnPPRJn0joxzYXjGrXDeRqTykmSUEPQFDnE/Yf8LOpSH55JnxWZpBBNuKxiVw
 0qBh2hwzUNE6eH4eOakGIryRI+JF6WW5ygFsQ4xPO2jCWnkTWDuh+W6s9ZMHE8/PlGl4WyfONyg
 VpeLx/Pelplo4YxfIgcH6RLWpPfyHc+dFkNx+7afFXHVFQUPxZZcJpzUG39OhrM+L/XmbIlu/FD
 +6x9w1BGRAH6io80muQ==
X-Authority-Analysis: v=2.4 cv=NJLYOk6g c=1 sm=1 tr=0 ts=69a07c0b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: FUXFAw4j8Vy7tabs6Bli4QkYLOCiVPw-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94331-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,8a00000:email,qualcomm.com:email,qualcomm.com:dkim,0.131.57.192:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 98D611AC086
X-Rspamd-Action: no action

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v8:
	- Picked up the R-b tag
Changes in v7:
	- added the flag 'no-memory-wc'
	- Picked up the R-b tag
Changes in v6:
	- move to mmio-sram and drop the Konrad's R-b tag
Changes in v5:
	- No changes
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the R-b tag
Changes in v2:
	- Describe the entire IMEM region in the node
	- Explicitly call out that initial 4K only accessible by all
	  masters in the commit message
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index eb393f3fd728f0b2fc8cd93c849f8c170d76e312..491bc3b00494c47c5524df069e9d65bb4654e863 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -697,6 +697,17 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "mmio-sram";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1


