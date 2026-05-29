Return-Path: <linux-arm-msm+bounces-110225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBoxJSZCGWqOuAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:37:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3713E5FE9F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E2B363081BD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 07:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0967D3AFD16;
	Fri, 29 May 2026 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Abxio93K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h57XX5N5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC25A37DEA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040131; cv=none; b=ayyJxnLfLzl1WWen25OkJ4V6mnbK0lX+tww9FLKs7Zcf5V4ar3Rl6OmCeKilbwZmW2+0R8GtoMI/lIJoRZmC9zWXt8vVzFGYGAhLvQycAfATHM1HAC4x+ZxCa91HcoKgM+aCqWYCz/fpDKn1Sg4m3U8L9XaLTLvu/7mA8WDzAiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040131; c=relaxed/simple;
	bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVrguv+MkzBPLx2DLgo81ZEsc2DTc9e593/OGP20UfatE0+OAcl263Y+PEfVeOLu3EsGTK9iUyTTGAm+cEyar5/RFYBwXpUN7ha5/YXeyFvzchEecBoNVA/rfoTXCmwsJaq20ZyPhwPmWcvDXhHSG5WtEU+auynYMdfBPaB5elI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Abxio93K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h57XX5N5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6p6973253257
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=; b=Abxio93KkxwDMH/q
	GivaRgY15OP6IUBTdTDtu+GahOpygbL1JPP5y0K7NOSWijyir1KvcV79isx2BpHc
	cwzeWW/L3ILzEgTPT1jvHWmDybWolV8n/xnBGZTY2bc+/cw+9K2z4NP/KfMJYxCw
	pYv9QjRut48yLYm6pAi0oIh3yCKmhlJXZU7H6zZeIsrFUxW/d5BUOcLkNqLuLekl
	vLffQcHgkirvdiqGPX9lrxFq+/DNZ2JqhjcMrLC5x/r6ssSeFscbOO+FVzolpXbt
	IO0JbAmmUZEKCgR6FXBNfEbCQsAclwqkpp9YxhIOofoRCv7jW4BrWshATdPT+W/S
	Jyz7kg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eespn39j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso106262485ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 00:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040129; x=1780644929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=h57XX5N5anR1K6FkzQ7B80lZyYHqf/0NgpgPuysLc7I/hYW4Y69Pe+5NrekBzfKKGz
         C06MOOaEY/YnEs0EEAcWN6LpSHjO83NRZKzxFN+IVLfTWcyna8j+JX/+mwG/aMHURY3Z
         Y+sL6yUicQItunLR9JsZ0nuspPGgCDGBmBT4PLA5tQ4rSWl/ZEo+KNtGXxTLlwkiDune
         2pNDgk4xN/Ky4f8Q3Jnlb9+bJ3rBlNuxjRFbpttNZ03K0pZidaIiXHzma4CXhBreszo9
         kDdEwZiB7p0N/qMBsm0gqcY1X3ePuNvY7vMuQGzpRjU0MKdm7swQAyeFmd2xF2h19MMf
         HZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040129; x=1780644929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=G1DiOic2cgv4I/rVEvcqVH7UcXo6Bf1ewO2lChvcm1f30vmSE4jmcHLIaHGxPMG2M7
         kEEJrQ/zH70QJMIiFJ5dscRatAbatcamWuS548fNbKsoZItsZiL1u4NQkZGP8WqvucBQ
         eYT6M26iEjL5UrEtWq/gFDbms2zyj87CsXIyBvJIMqYUlaUaCtQfjwfy4Mk4kyEYQjED
         BMgDzqR4AnwFHC+afqOa2+Z/kjtb0tOUvuvs55IwQv6N8pwPy4ZPUsC/qfNPLuepuGi/
         jkMsK3qP0E9KTrEKyo26qEblDiW6BiYtF+JQJd1geGRl4Qvmtm4aVhy4yZaEf9lH02uH
         deOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rvVDE20LeWCY8JRAPhp2J1/k3PcPzT3wWrHMAFAe7WauMyv0TrL07jjtc1iyQrPDEhtIbTVjpNo5tWNz6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ISv3Ur7RGYrBz+Gy3U4JoWoaQMIT1DSfeuJ1k0/8YEV84iw8
	fsUO/SqvFzFZjezRIdRM5w3sRKtbgMPpjSRFeGfak2Pzm+u7DAFU5dMwdYJ2vajLaVzaTi3dSYM
	fETjTwCS5DoVK7WOxzriAZJS4UeA+hqSu7nrJL3/R/iye65TC55QvGE59him57LVW84JW
X-Gm-Gg: Acq92OGZivF3b1H8Y4vbwNVPt+VDd9bpOlpMHn1uYNd0oYGUCKzSzxrqaYIYKsagOsK
	4EtXHJfF2e3SFiqTz++CsxeiDGMEN1nW7ddxkv4SSrBsuJlO5RWHdCNAxHZSFSUG74tIIDny0B3
	/On3c/dYy94u9f0+9NoTcbU4JFU5HlZ++hbLoDUDS6C8eBTRuTv1p/CaDrc3XVX4re6CazVkGuA
	8G+GUM5TuHapO0p9fvruu5eiGJi/uOMj2RFyBw0dJZjOgbysSdQL24ylnC3/YTK12BUPRPx87n/
	PA4FV6Ri8Ybncj6zqphfF4BiGz5DnS0Z9bR7v/07XInD4OL1iruArWm+RCoEHALKQ7QGP4Dwl5y
	dc+MbvHqgF0mlMOlo3ZCk3p3f8ycsgl9tsCVR+RPKSVfnS0LapoUUcJwUGBCesEqIFIuffzpmrW
	cKbAOphjW16RKsFb4b0uMTfI+2NUX/5+k=
X-Received: by 2002:a17:902:f601:b0:2bc:ac76:c1c9 with SMTP id d9443c01a7336-2bf20639bfcmr22651485ad.16.1780040129504;
        Fri, 29 May 2026 00:35:29 -0700 (PDT)
X-Received: by 2002:a17:902:f601:b0:2bc:ac76:c1c9 with SMTP id d9443c01a7336-2bf20639bfcmr22650465ad.16.1780040128310;
        Fri, 29 May 2026 00:35:28 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:27 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:35:01 +0800
Subject: [PATCH v8 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-enable_iris_on_purwa-v8-4-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=2709;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
 b=YRBWp6Nmnxj1NLZ3SmAqYZLxZbS7upY2RlHghXw2JU4k+DrxOO7d6mNiCr4tINfW7Dh4lKWVU
 dIYtBVX14qGCPj1TyD4iyTQnCuVqkSKejthc442czcqXfcZTZUopbKi
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: Asz2hVdT4CfGqEHXOtOrSdFyUp2Wi_as
X-Proofpoint-ORIG-GUID: Asz2hVdT4CfGqEHXOtOrSdFyUp2Wi_as
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a1941c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfXzrex29I8akJN
 lhBIfC+slTz01h+/zQtuufB8TBIzSxl4LBsiGgrZxKTdIxnENnGjokgcBKuBPXM8Ov16rDV+pIA
 4F2JPe8OSJnxWFgl5lyeLy6J6eUDmboch1viFxQDBo8//MHhEkUSAyFmso0wskaOuzzLqRRHNDJ
 nziwTF1UJu/N90YEbzKsvNDxw5OjVmKvYv4RrjG+SdSdSmE+FpUsy7iaf9ia5FBQ05F0XyNQmx3
 VEBwPQzs1lY7dMpGwcslQhslyrJSPgwyeClg1MfJWXem6POooAYZO7sjvmlsplwF+nuf61sL1iq
 kFBt/ldBBFnI4XaoI33sMbtJKF7um2IWE/YxgNJjmZoUH2rRZGeReALG3cBqDbRCV8jbSKDrNm4
 3JNT2OEdn9KMFWV0s1PD7Fr4qIObnv6o6Z20yli6wmCBNLawSOacWYKZfdLW4nLwRO79vOrN9Yq
 XHoKmzTw+l1ik1EqRRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290072
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
	TAGGED_FROM(0.00)[bounces-110225-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 3713E5FE9F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


