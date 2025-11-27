Return-Path: <linux-arm-msm+bounces-83549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D1C8D9C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4C283A8B6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 09:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BB0329C4A;
	Thu, 27 Nov 2025 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyYQ+Jxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3I/Lr7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AD1325725
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236647; cv=none; b=MlhoH3Xc6hWSCNAnort+Ydh1th3Wc7v3aRqoLODTsEwTmvGM9EQNXy06UHPYwsaRaxzfW8LzqP7xV8T/ym+QadwnZrmg876Gpdcp07GeMNsknjME45ubTwWCW0kD09rzoqqVlLN2hKE34904H47mKxxE8Lgo3AlUyo+qPhweEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236647; c=relaxed/simple;
	bh=rgcNCiRxdnXSE4KyK9BTo72/+F/pMdgGWPs0MxC6gQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ozytwwsIZcC2FdaGlCF6eY1PCSF5RSQvAynsaOyALVyiwn4bGIdCHtKBNZaHRi9zPpU8r8DOTh7OLoNeotQ0ixzyKWF4A9EMURGcDX5MuAu077DAEyIWaHsUuLWpn4mpotC95RLbxw7DWDS3YsrLdXw5QZ+W7YE1d+HIEZTIxbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fyYQ+Jxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3I/Lr7p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9UEsj685251
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G0yr6suiarUZve/hKFnOGb
	Tg5k2/yELTDVerAw5I988=; b=fyYQ+JxbvcyTl/txdAl8M23JmDUpz2opUQNg/m
	lP6/2HVuN9UB450aLeH8789uvNkRGar5b6ILgkfdbcYHsHkvEweiEfXI8u6B1Ekb
	xOFjD6fpxxJUAIY+rts98jdRCqDxL4SmsMc+SBUSMtnbSP0qDlnGMmgdhRofohoX
	H8zfan1/V3UNi7rmiSjMTONM/oUn5ltQujxK2CmcLKRMvrGKi5RUo3XQMyojBhuo
	hnbdIsIDQ+vv0aXZ2JpOCMUZb8g5fwEyNas9/uwlPan+sMJyMfPGw6frJXO29npP
	SIzFdbjDzRGx/FWpo1CJzNClZDp2JNYu2B8P/MtiCWcMnDPQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2rr1g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:44:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-341aec498fdso842276a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 01:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764236644; x=1764841444; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G0yr6suiarUZve/hKFnOGbTg5k2/yELTDVerAw5I988=;
        b=G3I/Lr7pzcYnBbvRYlNigx9gmIgmJ50uhNlvZGBLHLdzWbD+fQm5b37qI7vavGSN6J
         5y3MW79ImLIzii44zxzzn/Hh9L3ruhNKTF3C86HSJUUoURlruuHaZ3pkEETj0/vHF+S5
         Y+NdGWhbc4NXU6QCxWXpCcJcLqfkOyXbnx4mVC7HGscZjMtMo2cbUdy+BlS1TjlxQTNc
         zfivTZOpJ7PEm0gZROe3plBaKXPrRsJYSYru1fnB8ThCX+jz0Xg+CPWrjo21CQzUfNLH
         FnL3OpIwtLh4zho5P+hNsIVUUZy7nipifr+uUed/WtzLfcY51FO8lbK7Cd31yy17k3O+
         Fu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236644; x=1764841444;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0yr6suiarUZve/hKFnOGbTg5k2/yELTDVerAw5I988=;
        b=ELe+ITdKsI+ydsAe1i1ECkAR0TpyDqfWgcQtYrF9LHJ5u4vPpA4SX4F1lj6neJ0oxu
         wDB0CuEQft/Y2e/rDQAGvdJ5gysLKG7M3fMmVJlU9XlvVLa79VQ7pMZzdnZ8OVxqFSJq
         Z1pHN0TOSddn9OnlVQ2EPhwJ9AtGQ5vSnNg6PN/8EzJc03HCVLGlbpqLWCrQRlhK4Ry/
         Bf7ympaRm9+pIqmTMOtgk/oXtR9XhTHU81c2lo7sHZK4ig8EHyHwZ16JpGXSp9dTOGNc
         JgZRXVKaLxX5npxIVgudiqoBQplhIPTTDOqWwC6Xb1quoFyQmEeqnX5l3jx8PNtu8nQl
         nedw==
X-Gm-Message-State: AOJu0Yxim6qUCYUaWByvp7kMAxn/X8UTspohDswyIH93K4JjdSa8DxUx
	sev9xi8hC0cVaI6e3sW54ZO8fDaNhexFuigUAhWS2gYXGrVp+U1Bqphb96vLlqVtvRqiRN088fQ
	h2EPraaIz9+78Bzs02U+PI1Ao+8zc4Xrh/gVpJzzuTHGn0pjX15vIR+V5PRrZH25t8lm9
X-Gm-Gg: ASbGncsKpzBAdXZgdfBJFZT4z9UG126JQDnrhzTGnSyGE/BWzBICsqjOn2sFwBXBPD6
	wo7+Iq9eq2mvk9r/2kgm0n4wTMRRWJFgsVUJqKtm//D/tKWfehnr5dXWkTHGBXhgYkgLtjMzlBw
	HKl/ELkOMFggkOtaa/+0jzCJCIaITrQ7SqD1KzC+LTh26OQ2c31/6lRsQQmJiqiV7xlbY4V73OT
	Q4q2GoKoYGGsNQlt7TUK7l9waABBSMPBJFCmZ845XGoVqUbyTtjFU/QKmKoKqbtxNVb4+bDeKHn
	hqmNk6PD7FHGx0SBxb1dlgQKsCe/hUvyDbjNCBZWyFVWJShHsLZUrYKdeqVRqyzL6BSbJppLnya
	xGvy/AKjKCRPJKzE6jkVRuaCYjGIsR57MtDg=
X-Received: by 2002:a17:90a:c2ce:b0:343:6c71:6d31 with SMTP id 98e67ed59e1d1-34733e93813mr22053546a91.11.1764236644142;
        Thu, 27 Nov 2025 01:44:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4PokER9ZIKbOOy+wWNEYanktaeMKRkdg/ap54snc6j0f9h3AGprhFZKLRhpx09LPhYb+/wA==
X-Received: by 2002:a17:90a:c2ce:b0:343:6c71:6d31 with SMTP id 98e67ed59e1d1-34733e93813mr22053530a91.11.1764236643616;
        Thu, 27 Nov 2025 01:44:03 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475ff0eae4sm3887766a91.4.2025.11.27.01.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:44:03 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 15:13:55 +0530
Subject: [PATCH v3] arm64: dts: qcom: x1e80100: Add crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-crypto_dt_node_x1e80100-v3-1-29722003fe83@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFodKGkC/x3MTQqAIBBA4avErBMcox+6SoSkTjUbDY0worsnL
 b/Few8kikwJxuqBSBcnDr6gqSuw++I3EuyKQUnVIqpe2HgfZ9Du1D440hlpkCilMNbgooamN20
 HpT4irZz/8zS/7weS988qaQAAAA==
X-Change-ID: 20251127-crypto_dt_node_x1e80100-bcb1a2837b56
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764236639; l=2343;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=rgcNCiRxdnXSE4KyK9BTo72/+F/pMdgGWPs0MxC6gQo=;
 b=6iG8aVxFP/faQB+G+sBsTb/Rl5Is8VlQMJebNYIxc1aTwe3bOwx8BvdcOhKqStKQGPdodU62+
 2a8DBc0f1DeC00+LI1lxyjsQrZc7c0X+pAu8NJjdGcy67RPVlK0lzTQ
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3MCBTYWx0ZWRfX8PXBVG84IkBS
 0rKjqYJXLpicJYm4YAuT1wmK5eym+dzwiyu6aiPZPuwWOfejnKTcHA6JAKE0nPb5JS4bm1RK0Iw
 rJYUzziKC7w0Ne7nfkShToNoiKVO7E7/lHOGgp7cnxh+WqloEdq1zi7gsBpaCrQrs0y9MQTFgpC
 c9CFvZ3Yt0YWKJ9LU5bhRnIriFrtZPwvDfqZiRn6UlkPc1S95AfHNeJ+TMOvVakEboV5BstZEXB
 iy6sJDGM8yo9UWzM5y4CDS0ayFKUhz76eanX8FSPMdP+fJ/lWgbF7rtsfDbvgr8VUx3D0LGfHM8
 1AyIrQRrEfGxCtfEPPSW6tKY6MXbsDhcjtmP4bC2qYUHuMwkGaTOvXBi5+C9MLMtgBRn7RRQPbG
 g0eIyfiUJxAsrWY0VcL7mctXhhtNRg==
X-Proofpoint-ORIG-GUID: dGGl1hrs07GC6J54FQionZrCMxlInmzh
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=69281d65 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dPaM2nV2qZi9JoseeaYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dGGl1hrs07GC6J54FQionZrCMxlInmzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270070

On X Elite, there is a crypto engine IP block similar to ones found on
SM8x50 platforms.

Describe the crypto engine and its BAM.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
The dt-binding schema update for the x1e80100 compatible is here
(already merged):

https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
---
Changes in v3:
- Fixed num-channels and qcom,num-ees properties by updating them to 20 and 4 respectively.
- Link to v2: https://lore.kernel.org/all/20250221-x1e80100-crypto-v2-1-413ecf68dcd7@linaro.org
Changes in v2:
- Added EE and channels numbers in BAM node, like Stephan suggested.
- Added v1.7.4 compatible as well.
- Link to v1: https://lore.kernel.org/r/20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935d..a1cadcce98e1 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3033,6 +3033,30 @@ usb_1_ss2_qmpphy_dp_in: endpoint {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x28000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0x480 0x0000>,
+				 <&apps_smmu 0x481 0x0000>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <20>;
+			qcom,num-ees = <4>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x480 0x0000>,
+				 <&apps_smmu 0x481 0x0000>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "memory";
+		};
+
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,x1e80100-cnoc-main";
 			reg = <0 0x01500000 0 0x14400>;

---
base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
change-id: 20251127-crypto_dt_node_x1e80100-bcb1a2837b56

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>


