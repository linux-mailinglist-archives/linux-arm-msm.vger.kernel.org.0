Return-Path: <linux-arm-msm+bounces-84427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610BCA7176
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C38A36C0739
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 08:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A164631329D;
	Fri,  5 Dec 2025 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgKVnoCu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L02e7jyJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E8F27990A
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764923813; cv=none; b=p1ZUxEV+VXVdviaKWGEk21mb4nRoCcNQxrYXhRrdoZD/KjoVsjynv9qVz++ny91cX/QaSFn3klvG9BPBMWPGWwjTPypDBw6t3FiofUYSjYdsB48Y7U1BD+rTC6P+I36iHojdo1febze72ruw9H5IuAkSnYEeVDYuwPWS0ePY3gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764923813; c=relaxed/simple;
	bh=YSPN9EsjZQTcAjfZEv/qtDM+dupUW2mh6DwsmmXzrOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RpFGpiVpGKXF+rVapzLuz52Mse2bloMMlIqqGof8bj92dTSCUQWjbW8pllFN600F89nQCSZhLeHh5BWgC2k9MZDTAD3crFH6woDShbsbxlQkGOS4guwcko65Ioko5M3MmHfsUqusHtJ6v1DrqmlrAsiubSVJrdK5fx76n8ykfKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgKVnoCu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L02e7jyJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B54axQj1915953
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 08:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EoHMtMKJn8FkRVV80ZIDLD
	9oCvHd6rSTLiDxCD6KTq4=; b=BgKVnoCuHefrSh54FsVRTZquMLOXwNhDDGRwGG
	UXJ2dPfBExrHH3K9lMTuCpq5NTyRNlyEzdcgeSjaf+hh4J7JkDgceRNZPj6Maa89
	6ba9FAUSsZjru6g9ttDbGXqMlS2bkH9OtoJfWpOpiL/bgZH/RyQgfIk4yz8wDRnu
	6XTbezVxI4M9hwdmgUwawvr24v6QOvFBEjhj135e4hFhuq5TuKj1rqBJlAmGp7rw
	OmJOxJ8Lfi2cR90iIZIMgzYWcva4bAASFNpC3UH+zfqQWAZoWtodvljs/f3mglvo
	dKd2a1i3rjBh+Lals1RN24SyJ/zhhMKmgUa8zQPKCQiClAag==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auec1t74h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 08:36:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9208e1976so3679065b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 00:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764923803; x=1765528603; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EoHMtMKJn8FkRVV80ZIDLD9oCvHd6rSTLiDxCD6KTq4=;
        b=L02e7jyJWkoJtjGnaIrTfFCJgVyvdM5a9I21aMXJ07alu8YF1+mVB5PeMWzCeVjo1H
         TgDXZMm4t6VBexWr8JAZBqH+zIAKf1d4kC5KwY0SpVM2MfWKV8i4BcbdtbT+8j2qYcN9
         07xy9T+aVMK7sCGqzjDrr69h3BQzz2kwRopc1pPwbhXbfcc/5ja5gb99DIAs2xTCNTb+
         NeL5hQF6qzSwszfCxggVEphiC4uo5lDXHzFHWC0lsGxVKVwhpp86+0/UzPnlwz3aPHgw
         Uv4jC/ILTxeD75nl2xFDrT2mrvRfL34ojEIJPMXWPZ0r+PL8Wy4X8mY/HbP+MCR0du7n
         X/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764923803; x=1765528603;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoHMtMKJn8FkRVV80ZIDLD9oCvHd6rSTLiDxCD6KTq4=;
        b=DiCsHvqaAhslPaba7oR8uRjqm1t2l+VFwtkYD4BO/wyHdllix2t+Azck4wUFHjJKBM
         vahhm+biKnyVAy+AeL2GeUJSyh2eFUI3MpC1oQcKSIZpQbqVbyaUCkp88J9PzeB04KRN
         qtJm5qfrzTYI2x2uJ/YfaAULnCfjhutx7usbhOCdZguTDvC0phvoEg07Oy9kk4VgXVY/
         v9QEYZk9bEBbIIOtON+ZNIFNpX1ZoO43meB9ziqvR4ONzSi4S+qXmbsEXtjY8z/Ig66U
         6Vq6AJUuRvR40m4QccclpMf61XQEah1QnfkViW7PEGMO1JfyVui4WOeWVn1/kt5mN47r
         S9Cw==
X-Gm-Message-State: AOJu0Yz6d3uh9zF+k0HZXQxJ/uxAmZs7F5hf7JFkC+c/8gLkdQwN4cy4
	zko95DG4zNNQRz4tJZ/tFyTB5aU5rke1bDEu4JO0a9KPQuLEP1I55uYfgY8R7xIjfG/FiNv67aG
	Ya4KsL/hCc4NfHaBcwFkqBPOJTt19lLpIMyNoPVdAN3e+VRQnq2EKh0oqmZ5NFP1uP+Se
X-Gm-Gg: ASbGncu+FVLp7TzH39kycme5M/rap8moVFpCWQkjsiRrxcR0XMaOo+EHuNMJGZM3rKT
	sd+5fnYpa0AuNmuZyZUVvmcOUFdMnkPhCTw/w+Y6AjyvNHSxKZLzst3vq6jzUKCwRF/prI0+ziT
	VUu3LvmJt8fIig/5JwocXJmAwor6JIkcU5pfCB4LyIi7A6bgowajkMaM1/2vCU3+1cxff4j+fsX
	+eNztOLSOZvL2yGhjWFXXL74+p2Lqrwk8Ol7P70ZNjBEI8Eh4SE3M8isqFmDE0dnsSiGinU2AxX
	LCg/fT0jqVHbz4oqEgb9JrWHl0iOjAbIrvzPUAblkUKubH24deYvDB8BuMHBHqbrjaKoL3NrXTi
	NOAKx0BNfiHoYKpBcGWtvUfzGXlHNyUNg3j2aEvJA8KM+0h8/Jgdr9NlTtL65ttYAUSsDMkXR
X-Received: by 2002:a05:6a00:a464:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7e1730a6f68mr6552231b3a.31.1764923802941;
        Fri, 05 Dec 2025 00:36:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHx7f9ghyYq4UAZiebvfmB7StCu03Z3vJNGGTkEYm6RaThycGwCrBSzFgIJ8C33JpnVk8ObaQ==
X-Received: by 2002:a05:6a00:a464:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7e1730a6f68mr6552202b3a.31.1764923802208;
        Fri, 05 Dec 2025 00:36:42 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ed30bsm4489276b3a.2.2025.12.05.00.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 00:36:41 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 05 Dec 2025 16:36:05 +0800
Subject: [PATCH] arm64: dts: qcom: kaanapali: add coresight nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-add-coresight-nodes-for-kaanapali-v1-1-d3d2099b9b24@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHmZMmkC/22P3W7DIAxGXyXiepaAQCC8ylRNBkyKuiYZZNGkq
 u8++iN1F7s81ufv2BdWqWSqzHUXVmjPNS9zA/HWsXDEeSLIsTGTXGohuQaMEcJSqObpuMG8RKq
 QlgInxBlX/Mwgzags6hhTQtZ61kIp/9wd74cHF/r6bqrtMXyZXPf0KDjNK8StgsI4cBJGD0q7X
 bK/hz3jQgqYQvh4nbD3gH4UJPigfVRuV//tcWnvmryGAINXwo7J3Nrc3t/yHiu1X8/nvLnOyyC
 NVdKj1b3m1vOInAtr0DQi3+M4BJsMO1yvvziIBF1WAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764923798; l=24763;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=YSPN9EsjZQTcAjfZEv/qtDM+dupUW2mh6DwsmmXzrOk=;
 b=EsAKE4Rfq93nx6cZzVL0EUt4oT74T4BVlMzTLbnESw6vkAuxb6t/5wHwLZz9uekpxTlJy0+pq
 DlcYbnhysOTBTxf9mhIWCsTTKgwO/AJ55ibpsQ89iortCx8yzvG38gd
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=HeAZjyE8 c=1 sm=1 tr=0 ts=6932999c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_iCkXBEGsdCD6sqBbH8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA2MSBTYWx0ZWRfXzz7thvmqPTtF
 DcY9t3/3dtakNfRbuQ2JQghrBqtOelgoi5OtPACSUMibxrtJgcTlP6Isbhh8VJXAzkWB+iP266m
 qyw0KNZ/MvOVflcZoRXpuRk9SZ23k5EUw3IfXfEJdUwQSPwIXcl77b1aEN4ROfyGc7Wdlc/92RJ
 dWBHM9DF8DP5L3wnzDhJNj/DqXJGwpE5uRMfXnEvSqveq6FQFUcrAbFyuApwMDqhxcZMMECfTwx
 T6esjRT2gHFZnKpkCjjaJMBjkhr/769VYGJKXQMgUb7owLlafa6TkFq/lu5uRftI1MuccdXEzUT
 V72I7tVwWVvnIFhSfbn4puS4XX/6oLIFTgLDOSy5GvdzCq5xamdy5z1Myj4aDmX5OckBcqZJvD2
 6YVwYoJmvvQXjeRe8RyiCEphJ1+6qw==
X-Proofpoint-ORIG-GUID: Bq0jWOwUnqZIWYIIq_D_GVMrTIzR4NQd
X-Proofpoint-GUID: Bq0jWOwUnqZIWYIIq_D_GVMrTIzR4NQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050061

Add CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
These devices are part of the AOSS, CDSP, QDSS, modem and some small
subsystems, such as DCC, GCC, ipcc and so on.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Dependency:
- gcc: https://lore.kernel.org/all/20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com/
- ipcc: https://lore.kernel.org/all/20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com/
- base dt: https://lore.kernel.org/all/20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1160 +++++++++++++++++++++++++++++++
 1 file changed, 1160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index db514359af4a..021db31b48c5 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -1080,6 +1080,1114 @@ card-detect-pins {
 			};
 		};
 
+		stm@10002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x10002000 0x0 0x1000>,
+			      <0x0 0x16280000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel_in0_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@10003000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10003000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_dcc_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@10004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_qdss_in0: endpoint {
+						remote-endpoint = <&tpdm_dcc_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_qdss_in1: endpoint {
+						remote-endpoint = <&tpdm_spdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_qdss_out: endpoint {
+						remote-endpoint = <&funnel_in0_in6>;
+					};
+				};
+			};
+		};
+
+		funnel@10041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10041000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel_in0_in0: endpoint {
+						remote-endpoint = <&tn_ag_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_in0_in6: endpoint {
+						remote-endpoint = <&tpda_qdss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_in0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in0_out: endpoint {
+						remote-endpoint = <&funnel_aoss_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1000f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1000f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_spdm_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@11000000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11000000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_modem0_out: endpoint {
+						remote-endpoint = <&tpda_modem_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@11004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_modem_in0: endpoint {
+						remote-endpoint = <&tpdm_modem0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_modem_in1: endpoint {
+						remote-endpoint = <&tpdm_modem1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_modem_in2: endpoint {
+						remote-endpoint = <&tpdm_modem2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_modem_out: endpoint {
+						remote-endpoint = <&funnel_modem_dl_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@11005000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11005000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_modem_dl_in0: endpoint {
+						remote-endpoint = <&tpda_modem_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_modem_dl_out: endpoint {
+						remote-endpoint = <&tn_ag_in13>;
+					};
+				};
+			};
+		};
+
+		tpdm@1102c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1102c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_gcc_out: endpoint {
+						remote-endpoint = <&tn_ag_in17>;
+					};
+				};
+			};
+		};
+
+		tpdm@11180000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11180000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_out: endpoint {
+						remote-endpoint = <&tpda_cdsp_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11183000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11183000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_cmsr1_out: endpoint {
+						remote-endpoint = <&tpda_cdsp_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@11184000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11184000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_cmsr2_out: endpoint {
+						remote-endpoint = <&tpda_cdsp_in4>;
+					};
+				};
+			};
+		};
+
+		tpdm@11185000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11185000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_dpm1_out: endpoint {
+						remote-endpoint = <&tpda_cdsp_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11186000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11186000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_dpm2_out: endpoint {
+						remote-endpoint = <&tpda_cdsp_in6>;
+					};
+				};
+			};
+		};
+
+		tpda@11188000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11188000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_cdsp_in0: endpoint {
+						remote-endpoint = <&tpdm_cdsp_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_cdsp_in1: endpoint {
+						remote-endpoint = <&tpdm_cdsp_llm_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_cdsp_in2: endpoint {
+						remote-endpoint = <&tpdm_cdsp_llm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					tpda_cdsp_in3: endpoint {
+						remote-endpoint = <&tpdm_cdsp_cmsr1_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					tpda_cdsp_in4: endpoint {
+						remote-endpoint = <&tpdm_cdsp_cmsr2_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					tpda_cdsp_in5: endpoint {
+						remote-endpoint = <&tpdm_cdsp_dpm1_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					tpda_cdsp_in6: endpoint {
+						remote-endpoint = <&tpdm_cdsp_dpm2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_cdsp_out: endpoint {
+						remote-endpoint = <&funnel_cdsp_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@11189000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11189000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_cdsp_in0: endpoint {
+						remote-endpoint = <&tpda_cdsp_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_cdsp_out: endpoint {
+						remote-endpoint = <&tn_ag_in16>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a3000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_pmu_out: endpoint {
+						remote-endpoint = <&tn_ag_in29>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a4000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_qrng_out: endpoint {
+						remote-endpoint = <&tn_ag_in18>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a5000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_dlmm_out: endpoint {
+						remote-endpoint = <&tn_ag_in25>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a6000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a6000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_north_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in26>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a7000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a7000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_south_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in27>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a8000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a8000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_rdpm_cmb0_out: endpoint {
+						remote-endpoint = <&tn_ag_in30>;
+					};
+				};
+			};
+		};
+
+		tpdm@111a9000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111a9000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_rdpm_cmb1_out: endpoint {
+						remote-endpoint = <&tn_ag_in31>;
+					};
+				};
+			};
+		};
+
+		tpdm@111aa000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111aa000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_rdpm_cmb2_out: endpoint {
+						remote-endpoint = <&tn_ag_in32>;
+					};
+				};
+			};
+		};
+
+		tpdm@111ab000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111ab000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb0_out: endpoint {
+						remote-endpoint = <&tn_ag_in36>;
+					};
+				};
+			};
+		};
+
+		tpdm@111ac000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111ac000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb1_out: endpoint {
+						remote-endpoint = <&tn_ag_in28>;
+					};
+				};
+			};
+		};
+
+		tpdm@111ad000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111ad000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb2_out: endpoint {
+						remote-endpoint = <&tn_ag_in34>;
+					};
+				};
+			};
+		};
+
+		tpdm@111ae000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111ae000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb3_out: endpoint {
+						remote-endpoint = <&tn_ag_in37>;
+					};
+				};
+			};
+		};
+
+		tpdm@111af000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111af000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb4_out: endpoint {
+						remote-endpoint = <&tn_ag_in35>;
+					};
+				};
+			};
+		};
+
+		tpdm@111b3000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111b3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_pcie_rscc_out: endpoint {
+						remote-endpoint = <&tn_ag_in8>;
+					};
+				};
+			};
+		};
+
+		tn@111b8000 {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			reg = <0x0 0x111b8000 0x0 0x4200>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@8 {
+					reg = <8>;
+
+					tn_ag_in8: endpoint {
+						remote-endpoint = <&tpdm_pcie_rscc_out>;
+					};
+				};
+
+				port@d {
+					reg = <0xd>;
+
+					tn_ag_in13: endpoint {
+						remote-endpoint = <&funnel_modem_dl_out>;
+					};
+				};
+
+				port@10 {
+					reg = <0x10>;
+
+					tn_ag_in16: endpoint {
+						remote-endpoint = <&funnel_cdsp_out>;
+					};
+				};
+
+				port@11 {
+					reg = <0x11>;
+
+					tn_ag_in17: endpoint {
+						remote-endpoint = <&tpdm_gcc_out>;
+					};
+				};
+
+				port@12 {
+					reg = <0x12>;
+
+					tn_ag_in18: endpoint {
+						remote-endpoint = <&tpdm_qrng_out>;
+					};
+				};
+
+				port@13 {
+					reg = <0x13>;
+
+					tn_ag_in19: endpoint {
+						remote-endpoint = <&tpdm_qm_out>;
+					};
+				};
+
+				port@15 {
+					reg = <0x15>;
+
+					tn_ag_in21: endpoint {
+						remote-endpoint = <&tpdm_ipa_out>;
+					};
+				};
+
+				port@19 {
+					reg = <0x19>;
+
+					tn_ag_in25: endpoint {
+						remote-endpoint = <&tpdm_dlmm_out>;
+					};
+				};
+
+				port@1a {
+					reg = <0x1a>;
+
+					tn_ag_in26: endpoint {
+						remote-endpoint = <&tpdm_north_dsb_out>;
+					};
+				};
+
+				port@1b {
+					reg = <0x1b>;
+
+					tn_ag_in27: endpoint {
+						remote-endpoint = <&tpdm_south_dsb_out>;
+					};
+				};
+
+				port@1c {
+					reg = <0x1c>;
+
+					tn_ag_in28: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb1_out>;
+					};
+				};
+
+				port@1d {
+					reg = <0x1d>;
+
+					tn_ag_in29: endpoint {
+						remote-endpoint = <&tpdm_pmu_out>;
+					};
+				};
+
+				port@1e {
+					reg = <0x1e>;
+
+					tn_ag_in30: endpoint {
+						remote-endpoint = <&tpdm_rdpm_cmb0_out>;
+					};
+				};
+
+				port@1f {
+					reg = <0x1f>;
+
+					tn_ag_in31: endpoint {
+						remote-endpoint = <&tpdm_rdpm_cmb1_out>;
+					};
+				};
+
+				port@20 {
+					reg = <0x20>;
+
+					tn_ag_in32: endpoint {
+						remote-endpoint = <&tpdm_rdpm_cmb2_out>;
+					};
+				};
+
+				port@22 {
+					reg = <0x22>;
+
+					tn_ag_in34: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb2_out>;
+					};
+				};
+
+				port@23 {
+					reg = <0x23>;
+
+					tn_ag_in35: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb4_out>;
+					};
+				};
+
+				port@24 {
+					reg = <0x24>;
+
+					tn_ag_in36: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb0_out>;
+					};
+				};
+
+				port@25 {
+					reg = <37>;
+
+					tn_ag_in37: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb3_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_ag_out: endpoint {
+						remote-endpoint = <&funnel_in0_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@111d0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					tpdm_qm_out: endpoint {
+						remote-endpoint = <&tn_ag_in19>;
+					};
+				};
+			};
+		};
+
+		tpdm@11303000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11303000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio4_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in4>;
+					};
+				};
+			};
+		};
+
+		funnel@11304000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11304000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@5 {
+					reg = <5>;
+
+					funnel_aoss_in5: endpoint {
+						remote-endpoint = <&tpda_aoss_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_aoss_in6: endpoint {
+						remote-endpoint = <&funnel_in0_out>;
+					};
+				};
+
+			};
+
+			out-ports {
+				port {
+					funnel_aoss_out: endpoint {
+						remote-endpoint = <&tmc_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@11305000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x11305000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etf_in: endpoint {
+						remote-endpoint = <&funnel_aoss_out>;
+					};
+				};
+			};
+		};
+
+		tpda@11308000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11308000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_aoss_in0: endpoint {
+						remote-endpoint = <&tpdm_swao_prio0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_aoss_in1: endpoint {
+						remote-endpoint = <&tpdm_swao_prio1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_aoss_in2: endpoint {
+						remote-endpoint = <&tpdm_swao_prio2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					tpda_aoss_in3: endpoint {
+						remote-endpoint = <&tpdm_swao_prio3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					tpda_aoss_in4: endpoint {
+						remote-endpoint = <&tpdm_swao_prio4_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					tpda_aoss_in5: endpoint {
+						remote-endpoint = <&tpdm_swao_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_aoss_out: endpoint {
+						remote-endpoint = <&funnel_aoss_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11309000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11309000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio0_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@1130a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1130a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio1_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@1130b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1130b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio2_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@1130c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1130c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio3_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@1130d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1130d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_swao_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11422000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11422000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_ipa_out: endpoint {
+						remote-endpoint = <&tn_ag_in21>;
+					};
+				};
+			};
+		};
+
 		sram@14680000 {
 			compatible = "qcom,kaanapali-imem", "mmio-sram";
 			reg = <0x0 0x14680000 0x0 0x1000>;
@@ -1603,4 +2711,56 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	tpdm-cdsp-llm {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_cdsp_llm_out: endpoint {
+					remote-endpoint = <&tpda_cdsp_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-cdsp-llm2 {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_cdsp_llm2_out: endpoint {
+					remote-endpoint = <&tpda_cdsp_in2>;
+				};
+			};
+		};
+	};
+
+	tpdm-modem1 {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_modem1_out: endpoint {
+					remote-endpoint = <&tpda_modem_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-modem2 {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <64>;
+
+		out-ports {
+			port {
+				tpdm_modem2_out: endpoint {
+					remote-endpoint = <&tpda_modem_in2>;
+				};
+			};
+		};
+	};
 };

---
base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
change-id: 20251205-add-coresight-nodes-for-kaanapali-27948a5ddffa
prerequisite-change-id: 20251204-knp-dts-4ad60e175645:v2
prerequisite-patch-id: 1057cce23a42b5be40a6266d510bc62f756e3578
prerequisite-patch-id: 9924e37fffbad0125759ee3aff03137bd1cacfc1
prerequisite-patch-id: f7455dd4049ba647ed5f13e14fb99844340ccacc
prerequisite-patch-id: efa90c4f38d2e85476f22cc0081d7fbb8a34973a
prerequisite-patch-id: 7fc8429ae2438ddf1aa0f0aa005293cc76540f22
prerequisite-change-id: 20251121-gcc_kaanapali-v3-ab91e1065bd4:v4
prerequisite-patch-id: 9a9cd779ee23419a023893f357decbe09da1e42f
prerequisite-patch-id: b7d46739fd97b16bbf635569018bdd809fd30966
prerequisite-patch-id: 0baee9ea7681fe6b4ab1c69f1e087427ad0050e9
prerequisite-patch-id: a7ee79adf85ce9c5aedca168a561a9560fa59b44
prerequisite-change-id: 20251028-knp-ipcc-6b4189f71121:v3
prerequisite-patch-id: 6cf08b941741eff023e37a6a8afd5478bdf0788d
prerequisite-patch-id: 0ad500fc45e104a874839181b5ae59a4867ba1cb
prerequisite-patch-id: 628073856ba29bc3ed64f801dda4c9c7d767f327

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


