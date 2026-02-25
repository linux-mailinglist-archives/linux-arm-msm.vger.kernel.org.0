Return-Path: <linux-arm-msm+bounces-94073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPaFA7jLnmm0XQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:15:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 569EB19599C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10E05300F12E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2133921E7;
	Wed, 25 Feb 2026 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCg1uehz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xn4r73jE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA9939280A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 10:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014345; cv=none; b=RL/8s5U/oDHJ11O45MXjaJTu+XcFrFtGLRXPf5IcGjUZ8+dAXnQ9SgbLgmQf6CniMF4LIY2n5Qv6dyL+++Unos6hnm0xxolmENkPU4IuxcFJSux1CCZ/yzc5fYUB5mNCKcrJrkwBtaUshCEpzUNVKxnm/wTqfmUyW7MlIYb+kwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014345; c=relaxed/simple;
	bh=8jpYo4YkcUmjzTfGOaiuzbQPSPd9RgyNT6SBn4G+CVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Gj7o0SZayiIogAw+ZY23cbISlz+W/Zi0wzt1D8I7F0yQzrMQAges5++CtjvcmsHDwS0X+/TgiCO18lZJVQ1j82M87rTzZw46F5HRnOrmEecXm/CFjL/cXrUktTbIPxB2jdlhts/Iq44/mzd69qf+cLzixNC3p+EuCjyIEYiMgeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCg1uehz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xn4r73jE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SM4u1025100
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 10:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KEV6Gv6OpFMz1/cpmkAVMy
	QSIesDewDASdQlYVj4AVQ=; b=LCg1uehzlDtq923nnLwauTwGSzvPUMT1xsM5nx
	vwqE3ycDT4PjRsK8lh7h5rQ+7r0IMeI6DgTMI4pYLonBVdE6kF0QJPCfEsoNP+4g
	aH047wo/lDkvT59u+e0+B348+YLahGQYkTqSf0iT83ktC65o5W/rcPJxvHR04UNn
	GrBKJ7zaHdrtTFc8wB6WIF2Pmv0uU45RudgL6AahKvxvBxMFBUYaZpoXwq7ncZB6
	V4lFMpUaajV8FB1KqfBxhPrjRN1gzE39UR3ACK+od5y72ME/l7cwZUdOv5UsYXNb
	kYev1oZllmucs0ZOXW1KVTgyA6Z6qPdgy2tgtsTWkBmciRRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57sdwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 10:12:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adb085735bso17201535ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 02:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772014339; x=1772619139; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KEV6Gv6OpFMz1/cpmkAVMyQSIesDewDASdQlYVj4AVQ=;
        b=Xn4r73jEUEE6OC998eTpkjAw+UKrggYSA85fk0TEdCw/mZaup1H7DM3HjKpgmY82cc
         9IFxaWEZUMkgjG0MXrDGeL/cxCs+qP73Q+L/8W1bf3UJ2S7wqGIuvz5/Pse0majOlCaa
         yPD99jxPfzkeKew9M8Vd46iN34Q25LYEttzR77zm7/HCIIFS8u7N65nIbL2ih2PI5MHb
         yCxVXBdj5+JcsKnh8AAbnyXsi35PAl6xjn4srh5rNHdJ5ZpGwlO/L9Mc1N4rhqdwWDQX
         xfiqTMyH2IGsniz8/asriAiCrxUaYiB0gauHJsP0U00jSng2FwYKl1GTLcJrhQo5hCLT
         319g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772014339; x=1772619139;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEV6Gv6OpFMz1/cpmkAVMyQSIesDewDASdQlYVj4AVQ=;
        b=Op4Ww8mP9LLhAzZ8JxfAfutdGp0K5VV/pZhy8spIwaYISS3NW2BDKMVgwZhGzcd7dW
         +1D/0RbAbAEphLmRv2xTBaIE2Bqzh6CqG7PkFn1CwkPzMGydLpyezzQzb1b9q8ubkXUu
         ZeukltFkfkS3TUv7fJqtLWusTy25Gixx8+By4yE0AgANPcYHL5MKILz1gQJZQ2FgmSCx
         MUP1gToTatW/HAHGWKg1J322UO7aJ45kLC3rxFsLxBNkxdH65zX0Z8pUYuXwCrA/QJGU
         t2VoUhu2lYxLdJ+avFOX9FP2WWBM868TaAgzEVZ6K8mIvyPjz2479KufrFS3HtvGbsqQ
         sm7A==
X-Forwarded-Encrypted: i=1; AJvYcCVdwdGT3ymHja0ufFXoOOFmyodjYQu/3CqM6JsyC6hG4Tt5eyVP8h+ekDJi+O6L6xMFVk/dDy0ZaP9gJBgl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqc2jemSXYkefjeVZlKjJ7p2/iEvBlz2CPaai8UaLWBPr1NvuW
	QgmFStDlgSr062kvCQTuxC8zOoKbP832ejWKsnXiCPIcDUrZKsUe/5dSrAZTJc0kxLmjT4Dt8/d
	G9YCshwALr9lecs017VbpAkzj72v424HQp+r0NtEqSUgI8JV7iHWB4R3YZXGDdGa96JRt
X-Gm-Gg: ATEYQzzCB4+yoRf6FX4eOEs74JMtkev24fZiKD0NSxkVYdiSvZ2heyWqvhrgi9kuwOx
	BRFQEyUbOmXqzjL6faW9WcmAiLfC1EtjQNfVoOVdrwcGYJ1eNSDcx3rTaMFfcsSxM7ghbRyMT8x
	rlRsTn5F4yIE7yzOCPFfNDILg0ZmZPoOQqOI/X3/TG0PYY0HXMKFs3BAChzgkR9zvOyoFM//G7Z
	IxmTi7seRdpNYb1haSKRpcdpGAwBoQZmXSYsRA28qyVy9jV372ViI32lI3//bO7R9D2Tc73k+8M
	X0mFIzbd2RD+hT/ynVOXRABmi77zWcLU2EpJZjZ7ybPfysyvaC9IxuHnAnQ+fBa8vemDrlBq5sV
	RVlKJ/HkdAJi4iVntvEq9UFaMvRabkjpH3XvrB2Zr2gTjMg==
X-Received: by 2002:a17:903:41c4:b0:2ad:ad0f:bbc3 with SMTP id d9443c01a7336-2adad0fbdaemr44605235ad.33.1772014338891;
        Wed, 25 Feb 2026 02:12:18 -0800 (PST)
X-Received: by 2002:a17:903:41c4:b0:2ad:ad0f:bbc3 with SMTP id d9443c01a7336-2adad0fbdaemr44604965ad.33.1772014338448;
        Wed, 25 Feb 2026 02:12:18 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adda769518sm14443135ad.82.2026.02.25.02.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:12:18 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 15:42:12 +0530
Subject: [PATCH v3] arm64: dts: qcom: sm8750: Add camera clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-sm8750_camcc_dt-v3-1-a19d3173a160@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPvKnmkC/3XNSwrCMBCA4auUrE3JswmuvIdIienUBkyjSQ1K6
 d1NC67UzcA/MN/MKEF0kNC+mlGE7JILYwm+q5AdzHgB7LrSiBEmKSMcJ6+VJK013tq2mzCXxOi
 OUcVVg8rVLULvnpt4PJUeXJpCfG0PMl23/61MMcWCamgkEBCgDyGl+v4wVxu8r8tAK5nZh2kIY
 +SbYYUBcVa96bnUUvxglmV5Ay2fPbH8AAAA
X-Change-ID: 20251203-sm8750_camcc_dt-350a8d217376
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699ecb03 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YRkI6OSQ6ZkYtCvnlTgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 3dm95dD_ZSH_uIsC6czePKE5HI3JEFJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5OSBTYWx0ZWRfX5r+YkjxkAz9T
 ltLk9LpJ/jDGw7Vf1QV8FF1i5Bze3q23knY+She9f894pycNifZufVpdycttqWpMNwYrqKBwI1k
 hw3YlF6Ta1oHrEX9EvuYescXRSS2EtIHFsNyumGNP5Md40YcPEBxezVoGYUPQkffhSKHHNQbacZ
 iR+0a+pXdmi2WbLNP/hWXL/kG/3r3Hn+vpTrMA7aYFPwh4pTHutLDlrl5vwGYk3hqXKtK/IGCZh
 XSQwp0sVTJ6o383KbENWPekmvdG6etKphU7Yl99C2TBC1qgWwe4npJpT2MsttkcXlOLuM01P9Bd
 MFrv/3gVCChqfMukRZN5+D7Cw0ize3/Pz0JJPPMzasfmzwz65kfXLKSYlHUZtvvfxu0iHHFv2+t
 K8gTYDfUoWO1YILLq/Rh7psUIGiGOLV0ka1XUKfyeeeTPQPRv5MtJGc8Tf+9tp6MjqJuBwzJiVc
 aGinSgIMSYbXCsE8XxQ==
X-Proofpoint-GUID: 3dm95dD_ZSH_uIsC6czePKE5HI3JEFJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94073-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,b220000:email,ade0000:email,0.25.240.160:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.26.219.0:email,0.27.41.32:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 569EB19599C
X-Rspamd-Action: no action

The camera clock controller is split into cambistmclk and camcc. The
cambist clock controller handles the mclks and the rest of the clocks of
camera are part of the camcc clock controller.
Add the camcc clock controller device node for SM8750 SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Changes in v3:
- Update the Mx phandle to use MXC for camcc node as it is a always ON
  rail and can sustain this usecase.
- Link to v2: https://lore.kernel.org/r/20260220-sm8750_camcc_dt-v2-1-e4b7faf35854@oss.qualcomm.com

Changes in v2:
- Update the MxC phandle to use MX for camcc node.
- Add RB tag [Abel Vesa] and update the commit message.
- Link to v1: https://lore.kernel.org/r/20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 37 +++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bbb388521c27d9ae96bbef3d62b2e2..fa3d933f26600e42cedc547422871cf12bdc6778 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2,7 +2,8 @@
 /*
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
-
+#include <dt-bindings/clock/qcom,sm8750-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,sm8750-camcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
@@ -2046,6 +2047,23 @@ aggre2_noc: interconnect@1700000 {
 			clocks = <&rpmhcc RPMH_IPA_CLK>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+		       compatible = "qcom,sm8750-cambistmclkcc";
+		       reg = <0x0 0x1760000 0x0 0x6000>;
+		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK> ,
+				<&bi_tcxo_div2>,
+				<&bi_tcxo_ao_div2>,
+				<&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,sm8750-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x5b800>;
@@ -2740,6 +2758,23 @@ usb_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sm8750-camcc";
+			reg = <0x0 0xade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-sm8750_camcc_dt-350a8d217376

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


