Return-Path: <linux-arm-msm+bounces-107257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOcAFqtYBGqjHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:55:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E01531B4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAED83001A74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 10:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF7138F24F;
	Wed, 13 May 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AciS6BQG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jk5MOYGY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C48E3876C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669714; cv=none; b=BVUX9GvL2Gt0fKWv7bLJkEXLc3Bic2fbzFoKLpQu8ql9WCA7ATl6BINSXZGpJcoR7l6Ee6cvcZyPimJAqARdM3PyVNxyi8dnsnLJ5mcCTSKU7gJQ9ymYLKGWCil99AJ6nOv+9i+13b0eBiQDZcaooec/CCOrWbUzHmQrRK4MXNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669714; c=relaxed/simple;
	bh=ooZnQn6F2NRSSZn70qIovRKblRULNZ/w/cxqvktf8Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gwbUSaX6VjfsrX9ROx+qntluxnTiQ/3Qxi3YfW3o7Ews35HnmFluw0cCo17XWcOgSeOE2z716EqU6QS3tEG962Fw1hRTYTnva0aM01/SCMGPrKIrrlMu00McYukDS6Mn+hwmIzTSxvg1upRgMI+RBepWO1k9n8a54PDF3DMTZ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AciS6BQG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jk5MOYGY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVKZU2321247
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t+OfduLNHK+8RSPR+aMZoM
	7GpGt94ax1KW/1H3TVI9s=; b=AciS6BQGoPSj1RJ7ZDpUA38oiapDebGUnKmCrz
	2OMUEHTviwc2d6NY2TPDUxSo9yPSvkPPq/Nx+oSI3eN4qPvm4l/rvopAgsR9QKQu
	rE/EKED0jCK/hFzPr3+TTXEbj9izNV8NW6mnwt083v/4V/2fVphWHnapSs5vIwhv
	JF7IMHqZEuKC3CkqYZ0qC01+Cd7XFwSGyRGYWD1O9ZWDKpVrtQxzQB0Wavm84hzc
	viSpvVViCUAPVS3c4HhejFNGG6q1IjBMhefvXSQAZ7dc1QAXvXmvkbG722E0AQpi
	moBjX0ZrqUrwUvRoLjgHUEtFkxm4Agv/pQWNtDNWHZrK+EBA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu9ke8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:55:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368b01f8adeso2642041a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 03:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778669712; x=1779274512; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t+OfduLNHK+8RSPR+aMZoM7GpGt94ax1KW/1H3TVI9s=;
        b=Jk5MOYGYK1PO6FpIkDQm2tv2tMpBWb7RoHUVSIbnrRIPdZjtUZRIT4WA1NxtmJ6/pN
         s2l+2bdTSSWvFS6xruX6qgnCJdaYcMmGiqhaenNEJDLOOTnstuQdyd1woeMQLnlkZ1Ig
         xXP+TJtKZTA5fE4qXFigBMlLbpSUNTt4FeabxdzfSMWlsNZr7OhCqyv3JE2ZUmQfqBiU
         vs+B+J0Ki0oTbX+IsXmuUql5GwDU3oBYo756/gPcZZySDMgCHUoIZozw5GdlN/cf/cO4
         G12ul22xo8nuYE+MU57PXth0SveJjvAH0ZZc7okvlvWfGd82QjNWVwx6Q445EDU22xkQ
         lLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669712; x=1779274512;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+OfduLNHK+8RSPR+aMZoM7GpGt94ax1KW/1H3TVI9s=;
        b=WBrxSfMk8ps+Kfqs4ysQ6G8112JR+jWbOc3NwteCy9L27adid5vFsMjrkbzsDIURs0
         TU7klQRVt3RRXpkWprg5FcLbqt/E9YIGyQGmMGL8qeCpXZiJkXNJAz/6Ys1jJdgHmlRW
         TNrQvt5tNlWP+DAgTNuwh82K3GSgN7Cge9X1KjykxD8hANkdMUdmDBwUsOUu/r1ki82K
         Trfj7PIADTKx5WPwS2KICAAvUK08z3Ea5jrVg4zv5VUgwqKweeSrUBiECd+FBXzSDrmP
         ponm9iApPgG2KqgOI2zX0Nqpm6fLLahRvxQeo50GJCT4YjhvkFDzVe4E2O41rZ/leGjY
         eULQ==
X-Gm-Message-State: AOJu0YxrJyN+ECTvUN5quw3VX510abspturtwvtAkzWgFQyBISx7eX1w
	HCqD8UllIMXZYKXxTw8Z6xVmywEk5E638klmnRaAaea3QUesGQDcfkYJZoHdEVKqyu+ofJ2ADBq
	KqZx3v2yKEsrhNEchvvEgP8HOCTp5sDLl2biXZwCSPKvy+zRg8UXBYLDXXYbYNQsHChjizpsQ0z
	g4
X-Gm-Gg: Acq92OHLCjCF6zhBphiO9qABnRZq9xOchxLfvDVGAWBJqT/cc1YnmAkvYO5cUuQ4iNy
	hUdUOtXX41RFIJRPGjmeDty/dBGtO4U7D/UNW85X96lMzTxXL+FdDB2YNwyVtXJxg3mDCuK96hl
	6ib7ThSCdIwLWS1yYDIqs32fP3N82eEs9m8HTcKXkQayCEY/C9M0uYwZFnANUkUGeWjNcUJ3Lcc
	60x73AHn6FRp9b4t/kK0wz0yDLthooptodmCD6qy4MQEGxsDmNdYKgsaba8nOnf7X/SGOkSIX8h
	Fhpg8zMzqKBT5XmzdZJ0x3uXwxtjXcTxI4U77N0NmtBUt+h9DrknbPBoi4+Uod8nCI9q4622tI3
	p7jQOZ41U3ZNZhQ52+ZPv/I6RaHfjMcaGawSsgLobjuDiuCuO1GOsdYg/BQ==
X-Received: by 2002:a17:90a:f946:b0:364:e97f:64e7 with SMTP id 98e67ed59e1d1-368f3e69a23mr3313489a91.27.1778669711892;
        Wed, 13 May 2026 03:55:11 -0700 (PDT)
X-Received: by 2002:a17:90a:f946:b0:364:e97f:64e7 with SMTP id 98e67ed59e1d1-368f3e69a23mr3313462a91.27.1778669711457;
        Wed, 13 May 2026 03:55:11 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ed962120sm2677492a91.0.2026.05.13.03.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:55:11 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 13 May 2026 16:25:04 +0530
Subject: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on
 spi18
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIdYBGoC/yWMQQ6CQAwAv0J6tgm7IIhfMR5Kt0BNXMgWiQnh7
 656nElmdjBJKgbXYockm5rOMYM7FcATxVFQQ2bwpW/Ks6twoudMaIsiU8SQE5Y1iWDN3Hbh4ru
 KPOR8STLo+7e+webg/nf26h/C6/cJx/EBJ/5IwIAAAAA=
X-Change-ID: 20260513-hamoa-spi-can-devicetree-4cc79d8293a2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778669708; l=1394;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=ooZnQn6F2NRSSZn70qIovRKblRULNZ/w/cxqvktf8Kk=;
 b=yBNhfwfodeQE9spmKtl+p5HeCSAPCfTSwJaOB385b1Z5ii7cQr86DPZ8KVoVkU997lw0I+sbv
 zEfNFnqiWDgB4ZJaNkBUGFW5MDf6Ky3GW9arXB8Qnxh/5CnH1VZ5KcM
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a045890 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TpTkcx8jwH4tlQ9npv0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: zNopf1aM3ci44lrmm1SKSiFNqqqrKoBu
X-Proofpoint-ORIG-GUID: zNopf1aM3ci44lrmm1SKSiFNqqqrKoBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNCBTYWx0ZWRfXzyIes+i3p3gV
 uzLAlfFo5fRz/SVeBWvCYVvmlQJBxJwiBbmpxuCdwYAEEVMGsfGfIHpOQGGyD/SehRoQ32dj87v
 DL4WgdaQ/vxZH8KTeX03Y4g1mSjwSTb+4xvYZ753K3YNCNQoF9rOZvK87rb4JWRSzlNKiyU5p1i
 6pq5GF4jyK7Tt4hd25xfVf+BA3CdV2jHYJ9TEHJm86y5orEVC4BgcrkfKqmKbjKh7V7O4w4QzSn
 8itvzObUDQBfa4lHPS6VfcP4vEXDprjwOQ6yly9orzKYRdNiXiISRQbMhANJWatc+TibgS0lgJ/
 7WLQH0zp26JqLQYdF1yNS/hCjK3dNd8ypY1CISHSsckR8A7tz9amXPKe3MNX1nDm07yRxBOe1wj
 j8ztHmh7Uc/YtV7Xdo2YWpdgNc4wB8BV4Jg+KNe0qZshUjKS6w/49IzcW6nJ5/lHAnjjdeHi7q4
 gltJoioLw8pVVEvmlyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130114
X-Rspamd-Queue-Id: 47E01531B4E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107257-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable the Microchip MCP2518FD CAN-FD controller on hamoa. The controller
is connected via SPI18 and uses a 40 MHz oscillator.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..f260f23d2597 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -29,6 +29,14 @@ backlight: backlight {
 		pinctrl-names = "default";
 	};
 
+	clocks {
+		mcp2518fd_osc: can-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <40000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -1227,6 +1235,19 @@ tpm@0 {
 	};
 };
 
+&spi18 {
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		interrupts-extended = <&tlmm 68 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mcp2518fd_osc>;
+		spi-max-frequency = <14000000>;
+		microchip,xstbyen;
+	};
+};
+
 &swr0 {
 	status = "okay";
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-hamoa-spi-can-devicetree-4cc79d8293a2

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


