Return-Path: <linux-arm-msm+bounces-94034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILEoAYuhnmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:15:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF519324D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D6A323002F4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D3A125D0;
	Wed, 25 Feb 2026 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+0pmMsH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pkcw0MZb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886432D63E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772003717; cv=none; b=JiQaC9LbwXehBMPz+JbUc1CPI1OPZ51Es1UOgOYKOULu6ni0Ux7CNrI56fNqbbknH/Q03StbyuinySkc1K7sj97Q/eORNY+TYZTCFu8oBSgCa96vvhrbNWr0W44gpT60lGT3SBmqXFsrpO5uOwad86P5/kCE+5l8SxqOvLgnTZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772003717; c=relaxed/simple;
	bh=2FkuvrAL957feqAugl7hNC/uH7HEBQVrSNGLr8TfhMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUaJ7amgZIqN1z6uK/EcPWs4pTKDOMjcHiN2DEn5OGYhGFGTU6SxIxzgzTPhjJ+jA6b/abct/KwxMGrCrbPoc3Mp3GlO2gExYRSt5EA+iYErSiXWD9D4DaZemZUtf43y46eLZvTLU39h3fbmFxE4sVGuz7rKCxkI0z3MWsfanVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+0pmMsH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pkcw0MZb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P17n3E4148063
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ehd+jXMRqn16f0JHs38G+WSLps6pmBN5n4u
	w9sHEpOs=; b=g+0pmMsHNySLD0AwhKjvPl8ic6WlOM3tdSX/pDTsCMwdTau2p+g
	Z2h9u7noWOufDXXzdvzlyyEks7o/zFyADfL1zZ+dqI8U9Au5vrtkcl8sd63hmLYg
	Ld4CS6jwX1sakHgJIY5C0HnuHXXMYL6b6ffwUgFZkkVDPrPCKwKVe1yqyIczNP1p
	7GDSY/ZGAeVkEhISvaGdsrNDG2kw7PqyAFqTsNsD1fde9PN7iXk14fFLUu76JIVi
	Bq2iWIlmqDd2lcloFb4D964RGZMPHgYLvG/tQqY41zy529ZZAOmkmepUfjBHWpVE
	WwjBGRyeshkYBkwOQOmfFVLvaGKO7J9eOqw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57rugd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:15:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdbe1bd565so954735eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772003715; x=1772608515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ehd+jXMRqn16f0JHs38G+WSLps6pmBN5n4uw9sHEpOs=;
        b=Pkcw0MZbePbHErCyJ0fd5HLG6FQJRWg+DHHWBLMTGVXbVbFOMqWYMgnY2EBnZzENkm
         ZXfzcOyOvwvEyIPoj2co9LqiRoOG1oJTSoG3cGd0VVH0v8uU/IlDBZfNwjExrj6wDqyO
         nhZEcMfDNoOMQ1NGCi2CkWWB4OiKwJ0LUw97YzgdC+FTNZ7oDgil4nBI1sYNJjcroJPQ
         v6Nbkkel3RW7lDTXsdZG35WTyhBumkLSD74Z98Ue39JcJ6dmYCZ96xSSiQMTFc3yGGoW
         Vvk075MkxdU/NyIrsQXwLI0FVrrKHOjvIei+4CHQ0zrduJdu+GJKuPLvBvl9yzSykAGu
         9nNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772003715; x=1772608515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehd+jXMRqn16f0JHs38G+WSLps6pmBN5n4uw9sHEpOs=;
        b=GnNS59cFXHLfOl7fNdJ5ub1ZT2xNMnQWtYhJUPczAlCL43YaZCGUd1GwNKadsDiOfz
         damK0kYsi8IXm4kKHfn0Mj9iLtVL9JMaB/pduVwtWyzeXbRA6QleFD/pMFlVKlHIMDmZ
         RghIKT+B1Px05htLRupl8sYbjp2ahdVn1wRkvLDPVFg6vZuKH2H/K+NrC6L4tHKrEsYE
         DD7+RatV6F1QSySvpf8cjYn5Slx8mQdByZ4pLY/lgJrkhfT8OEOrdl+XrzSt1CpphFJp
         u2aE3pmOfOnc/a3mOh/o3QX+QeZ9EyuLfo2CN3g7usrxMyO+Xforv002xXUcacnEz1VM
         k9OQ==
X-Gm-Message-State: AOJu0YxlDhTEzAzCvBzO4ZyrNqFg4NPXW87Hw2RqLauDAi8IZ6wj8/rK
	/Uvfbl0eFVXk3mI5teyfArTN6IXYzJYwgKig/IXbPxu8Q8xG8Er/cbIzNAaBip7W3tLZ8Mjd5E/
	YDadW7UeuVXLxUF9WCUMeDprIF3bUQh38GsdN40EDU3FtF7pXfCeMhwdy85ghS8q13c0q
X-Gm-Gg: ATEYQzzLEBOs+kem8KP0m0IzF88QD0BO64xtvdEi1QvPoUGzCTxmQtd6/oAxWF1s/1g
	9ezb0Vpn8zuz74Tdb1V+cNGpOlXeWKzXl85e9fb1o9rTEuLlEQTSvXijtItU8/++85eSHPiLoGD
	q1UsgCUi82aRWp9F+q8w2NajkTTPDjaOcaHBM4uJ507XnRhFKOnO4xCoG8klDfHXa2TjZk0Rq6Q
	NQqE18WdZ11TtEeBnyBguzNtS9g0oRX6OdkHDqegM09xskCY18r0HPj483CtXu5GK/t6zt3xefw
	O5wqL9u+KyxaauwhIyq37Gz8YONvRdcMESi7jhVFxtmx7T7/aOy2JzfcnQ0B9mfX5vCWwpUwMk9
	T7MPz9viODisilb8fN4B/YPDLBq0eBjdQRFfExQtNC9PVK/TBAUFmL4yVIkePk5JMpFR0Bosc8v
	HMuQ==
X-Received: by 2002:a05:7300:8c07:b0:2b7:f145:a9c with SMTP id 5a478bee46e88-2bd7bd4f31amr5546795eec.34.1772003714775;
        Tue, 24 Feb 2026 23:15:14 -0800 (PST)
X-Received: by 2002:a05:7300:8c07:b0:2b7:f145:a9c with SMTP id 5a478bee46e88-2bd7bd4f31amr5546775eec.34.1772003714138;
        Tue, 24 Feb 2026 23:15:14 -0800 (PST)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe8304sm8383932eec.17.2026.02.24.23.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:15:13 -0800 (PST)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Zhang <wei.zhang@oss.qualcomm.com>
Subject: [PATCH v10] arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride
Date: Tue, 24 Feb 2026 23:14:59 -0800
Message-ID: <20260225071459.1600394-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699ea183 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=b5B5FA7t-L3a07aDtOMA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jWSHFuZXSeXrvSVqONRu95uwpN_v9OXA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2OSBTYWx0ZWRfXxD2TjeBnwShh
 NxRc0zxcNFi2fwWPevTa1MrWB9LQ73ffMHTSxmuCSZzfoWU528h5i84rUrFY4obcLVzz3BAsG3u
 yQF+F/4xCQMVAGYAu/ZHi29vOj2T0FxF5Am3caqmgrvGe3DksWvYWmEjTQ0R46n/OZ0drr+Y3zS
 sHJwHj3P//A4PQe1Dmp7GWWNM/R6eOrME8cJvJY7EI9z01esEoOoVrlFP9VqT/KQRf6cv6Ql43c
 FnMfbubDjOD4iuboHcKKURa2zn3Jrst4o8EZvZN3THAUnIlOa+rMwHY/6al0hyfAB+Tc0juYUlP
 dE7WCo4gxXSEw+DOacIaRy8/83V6BBG6BWJNtsZ3foMd31dJ8Y3nL0OKbqGkQpxRwJV8NpjPLDl
 qhmcgR1wpevcIxW6XBukvhB5m7yKbncs90ihZXw0JdoIZJOfV7y1zGKhwyRctPmDPyxBLvMQZ5Q
 dauEekmJswfWv73pFEQ==
X-Proofpoint-GUID: jWSHFuZXSeXrvSVqONRu95uwpN_v9OXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250069
X-Rspamd-Server: lfdr
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94034-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48AF519324D
X-Rspamd-Action: no action

Enable WLAN on qcs8300-ride by adding a node for the PMU module
of the WCN6855 and assigning its LDO power outputs to the existing
WiFi module.

On the qcs8300-ride platform, the corresponding firmware and BDF
are QCA6698AQ instead of WCN6855, which have been added in the
20250211 release.

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
Changes in v10:
- Rebase patch
- Change WLAN EN gpio default state to pull-down (Konrad)
- Link to v9: https://lore.kernel.org/all/20260122053624.4068718-1-wei.zhang@oss.qualcomm.com/

Changes in v9:
- Refine and add precise descriptions of the WLAN voltage rails (Dmitry)
- Link to v8: https://lore.kernel.org/all/20260120070650.3192679-1-wei.zhang@oss.qualcomm.com/

Changes in v8:
- Reordered regulator nodes to maintain alphabetical consistency (Dmitry)
- Link to v7: https://lore.kernel.org/all/20260119090758.2780678-1-wei.zhang@oss.qualcomm.com/

Changes in v7:
- Align regulator node names to match the existing naming style in the dts (Dmitry)
- Link to v6: https://lore.kernel.org/all/20260119080125.2761623-1-wei.zhang@oss.qualcomm.com/

Changes in v6:
- Rebase patches
- Remove unintended 'output-low' from wlan-en-state pinctrl (Konrad)
- Link to v5: https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/

Changes in v5:
- Rebase patches
- Flip the order of property-n and property-names (Konrad)
- Flip the order of bias and output property (Konrad)
- Link to v4: https://lore.kernel.org/all/20250325075331.1662306-1-quic_stonez@quicinc.com/

Changes in v4:
- Rename the symbol pcieport0 to pcie0_port0 (Konrad)
- Adjust the property order in node pcie0_port0 (Konrad)
- Add to the commit message mentioning FW and BDF used by QCS8300 (Dmitry)
- Specify the calibration data using the correct variant (Dmitry)
- Link to v3: https://lore.kernel.org/all/20250318093350.2682132-1-quic_stonez@quicinc.com/

Changes in v3:
- Complete the nodes property definitions according to DTS binding requirements (Bjorn)
- Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-quic_stonez@quicinc.com/

Changes in v2:
- Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
- Provide regulator-min/max-microvolt to the regulators (Konrad)
- Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-quic_stonez@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 130 ++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index c04e0ad53eec..2ed1015b3465 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -36,6 +36,50 @@ dp0_connector_in: endpoint {
 		};
 	};
 
+	vreg_conn_1p05: regulator-conn-1p05 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p05";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		vin-supply = <&vreg_conn_1p8>;
+	};
+
+	vreg_conn_1p35: regulator-conn-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		vin-supply = <&vreg_conn_1p8>;
+	};
+
+	vreg_conn_1p8: regulator-conn-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_conn_1p95: regulator-conn-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		vin-supply = <&vreg_conn_1p8>;
+	};
+
+	vreg_conn_pa: regulator-conn-pa {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_pa";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
+	};
+
 	regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USB2_VBUS";
@@ -45,6 +89,69 @@ regulator-usb2-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&wlan_en_state>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_conn_pa>;
+		vddaon-supply = <&vreg_conn_1p8>;
+		vddpmu-supply = <&vreg_conn_pa>;
+		vddpmumx-supply = <&vreg_conn_1p8>;
+		vddpmucx-supply = <&vreg_conn_pa>;
+		/* WLAN rails: 1.05/1.35/1.95V (nominal 0.95/1.30/1.90V) */
+		vddrfa0p95-supply = <&vreg_conn_1p05>;
+		vddrfa1p3-supply = <&vreg_conn_1p35>;
+		vddrfa1p9-supply = <&vreg_conn_1p95>;
+		vddpcie1p3-supply = <&vreg_conn_1p35>;
+		vddpcie1p9-supply = <&vreg_conn_1p95>;
+
+		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -363,6 +470,23 @@ &pcie0 {
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		qcom,calibration-variant = "QC_QCS8300_Ride";
+	};
 };
 
 &pcie0_phy {
@@ -503,6 +627,12 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 		function = "edp0_hot";
 		bias-disable;
 	};
+
+	wlan_en_state: wlan-en-state {
+		pins = "gpio54";
+		function = "gpio";
+		bias-pull-down;
+	};
 };
 
 &uart7 {

base-commit: 7dff99b354601dd01829e1511711846e04340a69
-- 
2.34.1


