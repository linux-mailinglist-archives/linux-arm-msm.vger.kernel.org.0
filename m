Return-Path: <linux-arm-msm+bounces-101302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIoZKprzzGl9YQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:29:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90053378817
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96F4B3066607
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823AD3EFD2F;
	Wed,  1 Apr 2026 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7IPzeB/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3xywa70"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B13EF675
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039110; cv=none; b=gfhd5wPpUDQqj9F5cv48A7VrQGm4zLA3ezA0xuKkMjfg3utjXMoaRkRfUEyKDmgHPh+GEwBfGm7QrX+YxYQ40Tgkk3qLjAwzjDjhpPBIKNqE1180vUeAg4taQfNN5loRZ9qKC9Bf6Pu3BMCpCBp2K4ULFPrSF1SDbXnKWNs7f18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039110; c=relaxed/simple;
	bh=1dmiooNPQkr89APsW+bAkLHkyd+sCwxlLZbOfdbo8c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=np6oBS9SSwzt/gjDlcF47OZMygpgCuaTvuWdA77F0FRaMP4u287LnyQxgHXl+rU0xI8RJoX2UOO3+daWNZvZx9DIb/CHEUtBoBG0gxaFtgkXAUJs+cxF6zax6izo/6r0ROMYUVy77LtNNGs4nMZdvK33VprqZGQAxU8lLD8A6MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7IPzeB/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3xywa70; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63172q4U3103854
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuvnuIbyXBL9MReJmRv02x3/ZkWrCTMC8lwH6CcS2bc=; b=X7IPzeB/50VZdBfe
	WZdT8g5DHDDuHxY+IgZzKFbcWz/pqLcC9jHFdIW7zyiZUFD4GpeL4yjgFxjtPPuj
	qHg1+jUcVSTuB7YYlYSB1A6AaHWocwe9P8oQw+Mhac9qR+JKDtC/gQJVBtH51E/f
	3smL8iBcP0wsJVT+xMs7tpslxGR1dIS2jUERkoEV3rcYgqafTO/XYGyeAL89MRTA
	m9hke/b1yQXHIs3P5cErEUwWtTvFd1aYNubEJBBm9JQDayrIg6FCn4g254KClSd3
	5KMfD6N0DNGcW9t8NQG+Shl+hTLpfxhdVgh8JUTQ87yoKJZ4E3vSqDKKVfPnkwqw
	z9Zaxg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js23uv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:25:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7651644975so4039908a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039108; x=1775643908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuvnuIbyXBL9MReJmRv02x3/ZkWrCTMC8lwH6CcS2bc=;
        b=g3xywa70XLd0SA4syhIkaXwztbPGxGmvTX1UU5og+k0Mc6DubUHpqEoEAaDW5gu+U3
         jL2YJyvpVnRgvR5xo/JwiWV2UDAu3suIE/cZe9fk015SfYq16BmYkkUOipxg2u/RU9Pk
         L3YzuMP/GhS2fpZo9MJqOasviCs1LuddHUzA5DBkf1MYBI/3a7vi2DEVHuuY89BJU+eC
         HyAw5+GcRQjz/LXY+yjL7JJjvkAwTmEH6DGIT+OUcp+4SMvOUz4+RkKGQPZl+OCfHl1C
         Z8YzHRmBbI07gHqJOkqb9/UkqlxBgoUy9myVsvAfeImbxBWUrk/QO2RiGKdNCG73wLWV
         aa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039108; x=1775643908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HuvnuIbyXBL9MReJmRv02x3/ZkWrCTMC8lwH6CcS2bc=;
        b=pVQWXi/+DRfglzrRx8SwgeKR9Ck/fBA4Qzh/+qP5iCefNF/XMIa5RB6WgZWzpzXBmM
         CymPDrX2fqL4wyltMtb/vIFaF7J1RLNF/dIKfAlaaIXZ93EHheHygjr+DAUsbBWCplRJ
         jCrycNEausUzD6/ylIcbfryIU8qxz08HOl8WtdynFQBSVu2VgjI8IuWpdeu4PgI9YJ9Z
         aB5RGNqaPMJfooCO04ProZXlUjN7fGMJb45tQFKVQUBwiH2wGZV8BqIaOrSX/UMESRUQ
         KZpwVx75SHKwacCyipk6UGb1lzCEqlicMs9F4KXtOyMtAvwx65l/gv1XRnCylnV+vlNm
         g8yw==
X-Forwarded-Encrypted: i=1; AJvYcCVw8KN1zNEEVwwTbcANiYHMlAykjScekskm4Weo1lWhbZ2kUdOBpcmc5QTWP0GV2Hzjf31W8OLTC5HJO8rY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6zD1SjEavWLhe54Kmjdp7voa8tIATfDOvJyURTfbrSZjO9wLV
	K1l7c1WHyXS0TmRI7OMZY1bdT+dNXye+UjAK+W5FXnJ7C3YkYLGDqurakvnFEbBhfbp3NXlggcA
	GGkPeW+s1wvWDAB2LjuXcjWa1OVhEjyEslbqs2+vfKAE7FWygIfSBI2yFInJhskgufdHw
X-Gm-Gg: ATEYQzy0CJr+h1K103lUM7wqGeyi15OSiUxQvfeFwISpq9anMhCq/oJdM6zWKHZO7UZ
	hqF/5F3oG8xbclLJ1ynPnZ4jCPJ1MS6fGR0GWPrbYkP1wO+JMFU/DYgXpdbgInRvj+2j52kkQ1b
	NQuCy0DgSD034eI7rhrAZQUv/8dzhXgxQ1Bu8Oojk8gF0SS+MK6zE23HQt7t+c/YXvEibD2SE1X
	edR7Ohv7zmmqfeB4NXAuQt+17TU2MtiX339qGx+J+9hfN7/wPBT5nLLYPis99ijdAN8C41eXph+
	nvdVD1lwVkQRLFocGBqQgCLCcgcjK6Nirq16X7D4z5L/1NqlKzNWxi6GwdB6z/dbAHrR7D69Z7U
	p7r8k5LL1BMQt0r7eXJO4NkKpKnWrJh0guy9PXufjZxx/RwA36mJ7tj/Wmz9C3+El0U4ZJbT8v5
	2x4GjyQ0Ul445u/gScWQFo
X-Received: by 2002:a05:6a00:4215:b0:82c:693e:54f1 with SMTP id d2e1a72fcca58-82ce8abdb19mr3408340b3a.45.1775039107499;
        Wed, 01 Apr 2026 03:25:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:4215:b0:82c:693e:54f1 with SMTP id d2e1a72fcca58-82ce8abdb19mr3408295b3a.45.1775039107027;
        Wed, 01 Apr 2026 03:25:07 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843bd8bsm13348329b3a.10.2026.04.01.03.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:25:06 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 18:24:41 +0800
Subject: [PATCH v4 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775039081; l=2683;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=1dmiooNPQkr89APsW+bAkLHkyd+sCwxlLZbOfdbo8c8=;
 b=eL11ZkegQ9t6Bk4BhAQFCZ5TfjIVkGGknaDa8boLZszHRJBbjaUgifBFNLKX44TK4AMHlhl9f
 NEg2BQNY0DVDIwW5XQwIRDHG0SN8YtKEg4VxUXqHi2EepvYq1HLiqVi
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: yX96VQTLa21oJMSkNOSi93oKxNLjc4ne
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccf284 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NSBTYWx0ZWRfX45KC3MbZz02S
 IZ0rzueEe+dmpwTkdD23ZTvd5YZODO2+4ywBVqJBiUOe43qeukV4M9/MXQ/QyJtNDbVe8mLhkwV
 jRcdzhrOqjOTUbOUFYTaoCC3e0kD6o1haBoPv7iOASuw9TxOFsEOMUVGnag5wBxkOl1DLY/wtau
 Wrs6ZaYg6cnbTqq7kLpZ4mjpFImAfHM6U1u+8l5HCds4SfMF4rXsoranmxyDYE+E/JPH3t/UBsu
 HloCOy3jk49Da+qWgWENrjryAKJU6DRAjk9wp05XgMkGrF+Jn69CWGFbKkNpTMw/G3GmX7DL/mN
 wlgdvDOTY+m0EcEGIjyCGM1K5HK3hBwItn+DfxGI/CZe/uusBsI4SG0dXu6wV9WnWUlT/8rbehf
 e8G5PpOtE7PCTFkPNXozOW8sarw0R40KIc4okUC1tuGRfs8yK4tAuZG6FkRFKz33p38uR6AL43e
 fykhj1zZNeC27GYdqrw==
X-Proofpoint-GUID: yX96VQTLa21oJMSkNOSi93oKxNLjc4ne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-101302-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90053378817
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Iris block on X1P differs from SM8550/X1E in its clock configuration
and requires a dedicated OPP table. The node inherited from the X1E cannot
be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
be applied.

Override the inherited clocks, clock-names, and operating points, and
replaces them with the X1P42100-specific definitions. A new OPP table
is provided to support the correct performance levels on this platform.

Depends-on: https://lore.kernel.org/all/20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com/

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 70e37fa91f5db83e66f9706b62637f6e18dffa89..c2f4457b83e193cff20120c50b53bf4c67e57239 100644
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


