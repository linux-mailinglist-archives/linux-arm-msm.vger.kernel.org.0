Return-Path: <linux-arm-msm+bounces-107558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JF/I5afBWo1ZAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:10:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C14E54029E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B8343025AFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDBA395AD5;
	Thu, 14 May 2026 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTgCSQ3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7nF2xaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33853909AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753406; cv=none; b=u2PhaY/51oh79GzfpZN/IkQed6RsHG4CLok44RIyyL3DmFK90dmmjAuXTa7PSY/r9RjcJsq4ssHx+ubP/y2tpIgVG/qS+JEVwUPb99e1aYcGrzJ23FwtQIzZHFbUasNELRcoyDIevsZ7Mq87S7d5p/XvD5l246UNzHH4QT96Q/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753406; c=relaxed/simple;
	bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l30l+x6qV+HUaST8im2j8lbxMoxryeZdQF+wNd2T5CjZCVx1eGQNNOf+GsQM1CT+zvgXyZ/iFAirHG5lE0/YG4MPMU/uKNud8eIKn2/sjaNSyolSSdrTan34xus6R7GDscg+BwS58tuk6hXu9H2MEHYlvwtDm4lznBPXC+ADO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTgCSQ3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7nF2xaQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kF8M1989674
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=; b=QTgCSQ3ccGg43hiP
	Rwtraa8+7bMSJ9Wqx8jaRAT6r97OFgreQYfH5I5Ug+NxXZFQaF06nRXaHm88Wfg8
	LHFVBgBf+dGPjS2pMydTH2m86TNpXoc5x3MPMY9UMtP6/wGXhM4x0N+NbNKDrUEb
	VK2JfNrMklqepTZPTOdAElQ4tMPm4FWZ5TfxAX7WUNlAlE4dQGJkXfTcEo/D8PJS
	TR+I88ysaSCpXnVkZ8mGJFpUyfexBs0L6o2sJ9mo2cVaGU1lb9uB6JASwm7JZiwK
	b4XDmrCOig5T9SoR+jLdRLA3XnTi9LR893QRfrJ38hPeQsIetyMnt+cDnjOfJZoW
	yyckCw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bhb4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:10:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so5446769a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753403; x=1779358203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=g7nF2xaQAsZT6v7xYMDVe/giNiWH4by3pdiC/QTTshyi1llXBAT1/lGdoc3C3GUQy9
         lrdfApkGy6hD87mkO7VtfYHEWNMVUx11mX6EBO19n4jVP8U+aH76DsDbbmDIFdnCOGiQ
         EYxYx9ZXmlTiM+ALlK34guCJo10UDTnlkjYUU8aU4JI1M+8gEy/jByUr+/e86wj5wT0j
         rMAAr8gGVvXkHfO7ePFIPMzMcla2mxwlIyW88VqFwocycfXaqY6O6CI7drqJMvRT7BOS
         dHI05/XwF0KpBK66TR2M+McBqC09xMh1tLqGQskuG3qFNQ0bvfozvqGjuqjNmPylvTo9
         tS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753403; x=1779358203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=hDteR6t1tUi7DjthiAdgo7xl1wZ3ma/SDk/tFKnSOSc3LfPeUE0tB4nv2c3tnUyMDs
         yrpQOn9XzMMXBIjfv6n7Rj9C29sPXdt70gG3En2ese7N8+9Lr5EoNQ55MhCOTH7B6ujc
         Xt8Bet3507OFdJtdF4LhI80QUvk1rF87114eXbZKTFjG8QCT5+94idOX/kWSpYjeDCu9
         og4kj9dLG75u7PDCwGkUGISzruGUvZHKYaxBSgKuCD5Mn5VXdq++kyDYfeac7ViEgBEc
         vvSt/QYM3fbZLA9Ssfx+VwWJgDBABiG5K64oBT3NPmQfcQ3I8kMlCSO400YrA7/U4VuT
         VV7g==
X-Forwarded-Encrypted: i=1; AFNElJ8kGzjs7eDN+8BlfkIBNCIv6cyjNaahrrcQRk8alzbeiDLGl0HNSxcAZon28lba8Eu2SLr13DlNttF1RxCU@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJdQswL5Bx4cUTF9TUwotbg+v8MGbQZkrhd9DMPd7M3A5NBGa
	8/lhCcfz3u2nJCv/BIeJfAwUYQU/IkA1ymuy+5gAaCLu2O8hdM2Gz5XKYIY58oYI0eROQVcmHhF
	0OmWyHwz7fqhmU3/RPAfTCkONlI3wKTv6n0cEpMFP2BWr2ZMbGFFF9JDBdanBo2o9l15Ny01Os8
	7w
X-Gm-Gg: Acq92OEsHXkyIY1OlWK4k946ZITvkRhPt5NY6vxlpHuHBIilx481lkaXjygaqt0Rzud
	glCxTpw1S2MgTWzwqfStc9DIXRjsi6N7XW6bcvUcK2dZpGoNLnW81bAvuQ3qMr8BrGtZBzmkFJ0
	slAACpSw4MbJN8slbZM9C1gMkliOodIfmijJ4t7xdcRDu5OATg0Yc/Xq+Mfbw8976ffoCE/hD+B
	RC0AOCBanhA90pbqqvNJgzmglMYBTcZ8AXalLDNH085w5bjy5vknbi16Bt68Jn50Dhr63ZCopb1
	ISbaMbkClQghov7FrQzwsEEUF4NBdwObRe72rMUFimiw5rUuLv2oBNRyzm3LhE1GI2TOpQL3aDS
	ifz0EFUCBS0qfmcXr2QzAo30WjVReorhP/MeAz83b2VyhWjsmLa9ExjKS6x5fpkaNfxPHdhoNGp
	/o4OXlp1YgEIZ3WrwI58/m
X-Received: by 2002:a05:6a20:a125:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3b0bf7bcc1cmr3011009637.12.1778753402711;
        Thu, 14 May 2026 03:10:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:a125:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3b0bf7bcc1cmr3010968637.12.1778753402080;
        Thu, 14 May 2026 03:10:02 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:10:01 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:36 +0800
Subject: [PATCH v7 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-4-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=2709;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
 b=jxlS3QPnZuGE8Gy7GXcXvsndcJWJfx+1EvrwrLWH5TDHJNIO+E006heIue79AaIhblhMGuOC9
 IoPMqF2icZ4AdjeHdHPe9EM26dzLkmvvKZasQIfn+gHvqvGJCjFQOSt
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: bh4mdHWrdMt6jHZ8josRxw-Pog3D6cHn
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a059f7b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfXzrL0sjAARyJn
 P53mcrvW/oiTj+JVuQ3qW5XFk0/8y9Mi9jTb5mqPkKlcpiFaMNI6PUysf6IiUc+BBPmrpjH5kbK
 xUzL/VKzUOg1Fs9pP9/70r+QBsxHiGGmhgdLoSTSn2LABNSRFibSZX7kO0dJG3j6y0z5qcQBMs0
 aivf9dTEj8BbKDeEc3U0Rke3+gtD0LlSRwQyLkB++N8sMeG7D9xW0fbGDN6kaAtf64VCcwag0Fa
 vV/RHnEAJsayEXtxhbNkUke99da2rjVjiXYfh+Pqiw+RqFzZDqaD7JkyvNKahtqO9sZk7lVx/eE
 PZObwQ7NNmkWQ5XWBhn4w6GucjUWf7GzFyxC9p7lT/kcngPJBUY36Htu8kfp8yvv1GVBRnlz9u5
 7enThQ9JMT5OAE2ICvOA4wGcJwwwWcoGdH3VX+kPXKZtXxraUm2kAwql3QUU5SCrDM0rN70WrZr
 AeUi0obfuqEU5JFQMJA==
X-Proofpoint-GUID: bh4mdHWrdMt6jHZ8josRxw-Pog3D6cHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140100
X-Rspamd-Queue-Id: 2C14E54029E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-107558-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Iris block on X1P differs from SM8550/X1E in its clock configuration
and requires a dedicated OPP table. The node inherited from the X1E cannot
be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
be applied.

Override the inherited clocks, clock-names, and operating points, and
replaces them with the X1P42100-specific definitions. A new OPP table
is provided to support the correct performance levels on this platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index ea65b8448836ead83f837e973ed536e8ea0ed8ef..a503deec97d75dcfb6792b007e0b74e517404cfc 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -21,6 +21,7 @@
 /delete-node/ &cpu_pd11;
 /delete-node/ &gpu_opp_table;
 /delete-node/ &gpu_speed_bin;
+/delete-node/ &iris_opp_table;
 /delete-node/ &pcie3_phy;
 /delete-node/ &thermal_aoss3;
 /delete-node/ &thermal_cpu2_0_btm;
@@ -167,6 +168,55 @@ &gpucc {
 	compatible = "qcom,x1p42100-gpucc";
 };
 
+&iris {
+	compatible = "qcom,x1p42100-iris";
+
+	clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&videocc VIDEO_CC_MVS0_BSE_CLK>;
+	clock-names = "iface",
+		      "core",
+		      "vcodec0_core",
+		      "vcodec0_bse";
+
+	operating-points-v2 = <&iris_opp_table_x1p42100>;
+
+	iris_opp_table_x1p42100: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-210000000 {
+			opp-hz = /bits/ 64 <210000000 105000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000 150000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-335000000 {
+			opp-hz = /bits/ 64 <335000000 167500000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-424000000 {
+			opp-hz = /bits/ 64 <424000000 212000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000 250000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_turbo>;
+		};
+	};
+};
+
 /* PCIe3 has half the lanes compared to X1E80100 */
 &pcie3 {
 	num-lanes = <4>;

-- 
2.43.0


