Return-Path: <linux-arm-msm+bounces-72932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47866B51210
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F374A16719B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 09:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD22313535;
	Wed, 10 Sep 2025 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/8wN+Ag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208D313529
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494992; cv=none; b=Prmmt/7bLq2l06nICIueKgGH28Uu/T9Kia6kI2a/v4a0J3FdzW9ltfTdnXrvhpS5CPfW9+8qYLLJwz/KxCAzu+AubhvZflCRnDq0Yz6zWBxekUKIQPUvXKqPLDrqiKDppoY/Fv1JziFhCkTRQ25IDktI6C1vV52t8GWfzabZtWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494992; c=relaxed/simple;
	bh=cdjypD0GQ90BYFaF0mM79sUabNOmmrylx+82LPmHlbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhmHSrlB7sqA5deJCi83nfNYBw2NA449mZ9MwPWCB7e2CJhLx14k0/6ojLTa7Dlw8nJARvNttNty+gBl7jMi3iPggTDBNR63/mudgaZkXP4jCskYoUgI9qzyYuKNr0ilNu7GzmH2IdoIsXDh5l3MNz+tpme4nnIvqs5qF2ULQYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/8wN+Ag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A7dCPn018126
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 09:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBjRZ4BA1fnNosNt1HhSCCjSq1RjNLTHOzKBYD39Oqs=; b=N/8wN+Ag8MzP+ue1
	tdYkPp5XW4And8438l/UZRf8+SDp7smUdJfh3SJQdGWavmFeroJxpPNr8J5Ztl+L
	I6S0jywWp5ZI+pUnnKZH8TM2HlV+mwfGh4QH7PogoYeSzdqqkJWaoCVlwkHO2xVS
	gbvuiigV7lLFZ3x7j7RNRxBosSlwR2jMp3fsv9vNZj3JM63ir7TSXk+x5TfjuqX/
	G3Z4PiSAcQGpCMuPAXxAqEa8hgQe9YNR5yWqzjEUdEaCkObAj2fpbFOoDKvMPIKq
	91689QeIBSO27KRFmFPH8olFqesgsHT2je7QWYSWi/Sk+6iWtUWzkOcVie8N9Sy4
	pepqCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8ka8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 09:03:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24b4aa90c20so82243065ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 02:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757494988; x=1758099788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBjRZ4BA1fnNosNt1HhSCCjSq1RjNLTHOzKBYD39Oqs=;
        b=ITnGypMbksUHos6la/sWEu8eHIDdMY8fTQQZJVRhdTAUkSIWopbhZXnH6JHh/fkEEr
         +wujX/DO8zHXViV6oQKS9TGuvtgAJ75cdvzLpL77fDTeDLMYt9cJWp6T/s5RNZi5OOwI
         kaykP3mVQt+45w1nGpjauCJ2AKrFtZ/Ewlv6SmSbPCnPrh6y3I2LL9ugN+ktF1tGe42v
         38hFhjWi90LWa0ybUSZ5pXWa0t8IK1tbak98vb9tmWGVGK5SI5r0Ml+W96Q2yBfJcUXk
         /PpRcM4Tf87B18zRbTVL63u7LoBi7nY84ohTXM+tTZcGDnXK5YEYxfELf5/WeVMoc0QJ
         iANQ==
X-Gm-Message-State: AOJu0YxzfJ8eNsEwwVP/dnUhYOOvqiSdRoCfaFpuR73VxcTTlgxhsbdH
	adrTX/WHT9QQjZi3P85Zaw0pTYxk5NGOE7UXew65Ke5gC+Lfj8yT8xiLRSlJFDT1DWNQ9nyN3lv
	pF+G0Z/xDXyepkod2zbEOJnOSvd2pOAlzUtX1Klyo87V4gcjh2Ic7B12+bubMOBR0pngL
X-Gm-Gg: ASbGncuEjaEh533GJ4xynhAbPxKceM50DZlPwwBGhNRPuO+msU6t1muBCrzn9h0cMsK
	m0dGHEZHMs5cu54n4G+DRBbT6746TuvcS2AJbDKojli4OXAJRh4RQfxKsIGMJePIPIK6o2V/G7v
	rXILoH/jA0WYt8+rPm/mnt6oAyKD/OL9XYZw+eGIJfmmJVZZy40cgBjouqJ96CikUWu+tMYkigG
	O5h5rE0i/I+OcXrY1SeVZK0qVe50Q8C6mv3sqoW0VO+O2BPhfDC7SWrc6r5FD63XBB4aGa2P2Yz
	iieUwthIzXvltfhHis+ZpTtR+SL4wGMkw7gO6XjxNYyhg4v53D47m8rgJtWYHD6vJHwt12biT25
	0ThGIf1ECSje4yvwW9d3/n1B/LQ3kFHFTqQ==
X-Received: by 2002:a17:903:3d06:b0:246:9e32:e83a with SMTP id d9443c01a7336-25174c1d145mr186319005ad.47.1757494987516;
        Wed, 10 Sep 2025 02:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtdchrKI9eiNyMpIN3Q4+JIjYTsadT8/Vlk99S+Goudc9T3vGe4DnozzmY6zySEDEZUrknqg==
X-Received: by 2002:a17:903:3d06:b0:246:9e32:e83a with SMTP id d9443c01a7336-25174c1d145mr186318265ad.47.1757494986487;
        Wed, 10 Sep 2025 02:03:06 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27c029ccsm21089155ad.41.2025.09.10.02.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 02:03:06 -0700 (PDT)
From: YijieYang <yijie.yang@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 17:02:10 +0800
Subject: [PATCH v11 2/4] arm64: dts: qcom: x1e80100: add video node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-hamoa_initial-v11-2-38ed7f2015f7@oss.qualcomm.com>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
In-Reply-To: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757494975; l=3021;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=sQQeMMHQQyZ+jOLzJfuQdFmPZbcfAe1LjwQ0p3k3Wr8=;
 b=LO90ADqRlRBqzjkvNrIHvspLPTQZ97aU+cfcsNuHrt6sepy5sfi4A9l2oIfHluXaf819BOcQK
 tLNLPBzmfmOC80118/3xYqhyZ+YpaYRexKCl6onuXvUJhcMxTOXIpJ4
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX2R93CcgEmPkN
 5Pk5MhCxsk+SGWiMYP121rmRcbKdZAscuQz+WYwbCBbzE0+3lDpiA322bD2gmfhrwAUx1ug3BJm
 Jciw7fsQunYvqeZLPZ0VwVf4bxqKC6ttsccT80PX+8khNPCl5xatcUCHjOOcRopkbu4FsKP5iKu
 G9P5NWqN3OlJo5jxu4lke5iPfzA1M61Nt6SVL5IP9DQxNfNT4PZgKl2WiEypGC6meM3Op7f2zN6
 P/PMoBgK72Fo/wTt+oNjIH68UZJUGGMJGOAx9hu3dpyEllJFINV7vBeFI7eDZcD0od1TiqLNS+M
 u+AxTKKsnUL3XW/CUWANUyGKsdIdp4L5QEhpb4IK1CLxCinBa3DI9C1h7hLCB3tW2EcPRKVvagi
 NE/HMfXn
X-Proofpoint-ORIG-GUID: VQtCUznx6JdO8zmDUzyFX6Ff3ZRs5d85
X-Proofpoint-GUID: VQtCUznx6JdO8zmDUzyFX6Ff3ZRs5d85
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c13ecd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=tEm64AmstYfONosBKmoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

From: Wangao Wang <quic_wangaow@quicinc.com>

Add the IRIS video-codec node on X1E80100 platform to support video
functionality.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <quic_wangaow@quicinc.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 82 ++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 737c5dbd1c80..4a450738b695 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5186,6 +5186,88 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,x1e80100-iris", "qcom,sm8550-iris";
+
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "bus";
+
+			iommus = <&apps_smmu 0x1940 0x0>,
+				 <&apps_smmu 0x1947 0x0>;
+			dma-coherent;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-481000000 {
+					opp-hz = /bits/ 64 <481000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,x1e80100-videocc";
 			reg = <0 0x0aaf0000 0 0x10000>;

-- 
2.34.1


