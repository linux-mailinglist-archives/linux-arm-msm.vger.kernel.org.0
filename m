Return-Path: <linux-arm-msm+bounces-109474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDOYIqNrEWpLlwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 10:56:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 942645BE0B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 10:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F29693008D3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 08:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0463737FF57;
	Sat, 23 May 2026 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMql4sAb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PpEyA+1S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0937FF43
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526533; cv=none; b=HDMYRm1afNI52PMmpYpjfaG8kjdX4WTktuwNPHn+KV8wpleTTZLcB1nZ1ykipPb5xmxTYtk/m5hSmqmKrac5aUCqusWuIjA3Kz7/DJM7hT8IjRI06yWugELaANvfMLMZLzIVqGPzlmiYyZABMeyZetxKyrt0oipcT3xPLJCZj/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526533; c=relaxed/simple;
	bh=pgbdGtHi5ZL2V46f6Z9TdkDjE5Nb5V12hXCvR//Fvwc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SdpG4GSWMTBU+790LVcONXIdxDLCyk5lsCajyyzNgK1QuFtsRvZd7e88PBIWhlIPAqsNqkK83Cljwj6cqPrTcZP36+olWh9Db9ZgQug9nuvUE6WGD6DhXyeXRlHi/ZUOPTPLW3k2lONbjjR/Zq3/vynrc6M0qPh61NduzDkkdcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMql4sAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PpEyA+1S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N4BrUB1982758
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x6jniaZgxyb
	kMCO22rcadwBBrKk3Ke606PTcwbmWe58=; b=UMql4sAbkuVD/u6lMtbbQnkFYQu
	nPlU1l7/5JhwVVy5086Mx95U11jBhnuF+BZdtESvwl7Sw26cKMVhATeEkuXid3CV
	nAvpU3tmDV1SMs++kTsL4rLMzjIRHRZ4woU3aVY3HaV1DXzifblQIrq9cV3kiPBv
	IKWTFZw+poL/hL2dUmtLYVG4mJZI+d2dXR3BFKxKSDe+81WVPUazwVyLV7+5lBwi
	TXfm4ke/zBqTmoQpeWwMG48hRpO+zXkamNtnyBIKLZafg/VO9lkiLa3Pm/jnO93N
	+E0kSMdNTCt5SaoCFksRTAFLtD+nZjXw4yOZayP4CkpJs4wrju1/fiuraAA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb50freaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba054e0304so72374385ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 01:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779526527; x=1780131327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6jniaZgxybkMCO22rcadwBBrKk3Ke606PTcwbmWe58=;
        b=PpEyA+1SZmLB2DpXpQMUcdzgBjIj39K7Fr3b/nJjsKdAdPLGRBEo5YHaiAHwml0Lxn
         Zfw3oYk5nJGxKmtVbCJDLpghrkZj8tcSAfKLFcUyLMyrBHqot1aXT7Ay90fCBt245gPt
         ctWX/CEHS4UJML8yeEJw4kHnjN2ZLAbKlPKEuW5MzZIFrbRaCeXLCtobyz/iY0fX7J/V
         tegD4zaHe2Sz10h53Nvy9luRFJVgCvfy/Q2iX6qaWp7C6euwIdkq44PHpLh+KiUT7DUs
         jlBqMDp8omfOVerPPuhkZkFpo37IP6b/O2NoHpQWb+6NXs8vOOMmemOOj/LC1oyvBK4r
         LDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779526527; x=1780131327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x6jniaZgxybkMCO22rcadwBBrKk3Ke606PTcwbmWe58=;
        b=ghdtY+aKxypnPAmAtMCCrPtMSX9C9owZLodn3+fvxT6Q4VyYu+m83a0uzuLMxb37S+
         1Yx7D0rCXK6DU4/bdtzYD11LzoNr4cmW+/Rl/zy6N/gH4yd9EV7UsvG7iez94CRzhFHD
         v6+tRCUBmYa+uA6l+zWf8yaSIgBHlrxSyiHyFFk+PYSOQiKxuTnLARwSr1Bu/KaQpg7e
         BYKKA/WRflYMxFsGPyZ6b5NoZDWXLNaFXZvcGBZZloSDymqOeGqzDdn05hvO5PAJP2jV
         08+urjAH2fWYTS+66CFr1KsWWjpahI4ZGy5a4lSNQjadxhwrArHtkv+FPIYp7AzETotc
         Dttw==
X-Gm-Message-State: AOJu0YyliTqt84yi76+VeGdveNEadHJqadRbcJv12LAW/g/V9+E9wH/0
	JMU/AG4HQKCkK3Z/MwenyQsogF86QJjLEu2yKI8LXjARyXLKXJbaTifAZb6ARpwHGnC/8NIzUKx
	2+219fXN3WByIqprMa+Uo+H2M+insNQEOkQwh9M5WYuj6OA6YK7HOHXjF7aB7M9dX2aXk
X-Gm-Gg: Acq92OFewRIQqWvhe/bhYnF5dPKvCGLd0kt4+afLEoks1RCj8Vls89/EtfVTTj9U5Sc
	kUATHZEeT1wCjbsCuNU+prTlOyCKvK+lMGat7PUdi1/hFVpx3FHIWYV/uhgKw9fF3zG1qaTXB9x
	yFLj4ZKzfP4wb2ZB3qG864cS/Fe1FJkVmMFBftz8vdfVX8848hoX45wd1pKkZkCEunRtotVGh2+
	PzS/t7/zc0/j7rX0djhY5UpwZoNkXV4srOHnx5C3VB7stmS7bSvuzeg9AFdTXwwC1O2fSh1UnDY
	kEwO22XNEj96OXFmjRB/Lrxlpfug4Zuj8TseHsFpgyWQeRx7QwQee94FQfARjK3xyDu0DAEgPEp
	K/mXyLUGLS4WIGWMYJfEzhrE7ZBjDROh40hvLJcZ7SV2ILeD4E+8bG3ZtlL3GMomesCBk5J8CSW
	cOC4L+berLDrlxpwAF4FQXz1qgDVL9dIf3xCY9
X-Received: by 2002:a17:902:c946:b0:2bc:e299:4b3f with SMTP id d9443c01a7336-2beb085f3d0mr63900075ad.10.1779526526713;
        Sat, 23 May 2026 01:55:26 -0700 (PDT)
X-Received: by 2002:a17:902:c946:b0:2bc:e299:4b3f with SMTP id d9443c01a7336-2beb085f3d0mr63899735ad.10.1779526526193;
        Sat, 23 May 2026 01:55:26 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm49105395ad.32.2026.05.23.01.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:55:25 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V9 2/3] arm64: dts: glymur: Add LPASS macro codecs and pinctrl
Date: Sat, 23 May 2026 14:25:10 +0530
Message-Id: <20260523085511.2532669-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
References: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDA4NiBTYWx0ZWRfX2d4qTCB22Yl0
 o1egE6ioHeuZqGvJGlWIze3Ske3UNTJMgRJxyl3wZhVMKCdaI30I2TWftRDDQWEAhgRIKKkW2jG
 ryGVDVjY18ztvl4++uBB0K+HeMDsB3NEwIeMXXxOy3C4IXvp5gTpcblx6ZOt1xbDgjIfCir+7Hr
 +Oyvl8cKwBlt/nDVwFKpgWmCGjapOSrwsEpAGL7IjEI016uHEH/g4VLiDALWmfx4Wzm01tAqMsh
 A0SrAqyRb8Z5TDo3uMBQIlDRnispeI0Ml1q/XLXXZ+ISmMcaKPka4x8aSs1cVCXGkNxjlsnMu0M
 qlcbvfOH33GpjaaiAMc556Ig/mufEPypa+HzbPts4wOxc/HsFRnKPMAdBex8jVPvn0oq2X/v19X
 p85jdBszV2xzZg8vqDs8cEUAaQwR61CyYBYqJsRwP2LcsPnQIspt67RIYZC0UbsNwMI0e/i989T
 e4+OEqZDX2sGfymgZkw==
X-Proofpoint-ORIG-GUID: 4b6AOQDOoJtRkYfW4q2fhCWawzS7pJnP
X-Authority-Analysis: v=2.4 cv=UdBhjqSN c=1 sm=1 tr=0 ts=6a116b7f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=mx1dUFmayEYO8tNA33gA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 4b6AOQDOoJtRkYfW4q2fhCWawzS7pJnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605230086
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109474-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 942645BE0B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur
for proper sound support.

Also add GPR (Generic Pack router) node along with APM (Audio Process
Manager) and PRM (Proxy resource Manager) audio services.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 263 +++++++++++++++++++++++++++
 1 file changed, 263 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 72c7dc6e4f09..787d7d498bfe 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -20,7 +20,9 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/spmi/spmi.h>
 
 #include "glymur-ipcc.h"
@@ -3891,9 +3893,138 @@ compute-cb@8 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x80>,
+								 <&apps_smmu 0x1061 0x20>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
+		swr0: soundwire@6c80000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x06c80000 0x0 0x10000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+			label = "WSA";
+
+			pinctrl-0 = <&wsa_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x00 0x00 0x01 0x01 0x00 0x00 0x01 0x01>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x18 0x18 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0xff 0xff 0x06 0x0d 0x0 0x19 0x06 0x06>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0xff 0xff 0x0f 0x0f 0x31f 0x31f 0x0f 0x0f >;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0xf 0xf 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x0f 0x0f 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		lpass_wsamacro: codec@6c90000 {
+			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06c90000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "WSA";
+		};
+
+		swr3: soundwire@6ca0000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x06ca0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsa2macro>;
+			clock-names = "iface";
+			label = "WSA2";
+
+			pinctrl-0 = <&wsa2_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x00 0x00 0x01 0x01 0x00 0x00 0x01 0x01>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x18 0x18 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0xff 0xff 0x06 0x0d 0x0 0x19 0x06 0x06>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0xff 0xff 0x0f 0x0f 0x31f 0x31f 0x0f 0x0f >;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0xf 0xf 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x0f 0x0f 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		lpass_wsa2macro: codec@6cb0000 {
+			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06cb0000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "wsa2-mclk";
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "WSA2";
+		};
+
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,glymur-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -3908,6 +4039,138 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		lpass_vamacro: codec@7660000 {
+			compatible = "qcom,glymur-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
+			reg = <0x0 0x07660000 0x0 0x2000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_tlmm: pinctrl@7760000 {
+			compatible = "qcom,glymur-lpass-lpi-pinctrl", "qcom,sm8650-lpass-lpi-pinctrl";
+			reg = <0x0 0x07760000 0x0 0x20000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2";
+					function = "swr_tx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio7";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio8";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio9";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			wsa_swr_active: wsa-swr-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "wsa_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio11";
+					function = "wsa_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			wsa2_swr_active: wsa2-swr-active-state {
+				clk-pins {
+					pins = "gpio15";
+					function = "wsa2_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio16";
+					function = "wsa2_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,glymur-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
-- 
2.34.1


