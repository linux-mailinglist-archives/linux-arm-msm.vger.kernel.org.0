Return-Path: <linux-arm-msm+bounces-106246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA8uIgYs/GnVMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:07:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1724E34D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EBF330204E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4705C33A9E9;
	Thu,  7 May 2026 06:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVcYa5aR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7yOPGBh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC896330B32
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778133975; cv=none; b=o/OZQSnGEoFJuY57r/WXFtULtuqZ1nW6TasO6W4YRmqfjfmzJ0NzfYg0RUqA0EngUJ4U+cHCfk4soOYMC/yAr07PjmksGghKuYZQNfCinVSnj1xyJBtMSbaKKa87IMrTPRtXOQrezPBTifEHBrkuerTFehXPi003eX+m9+M62B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778133975; c=relaxed/simple;
	bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2Y8EbCoHHIR8bFG6x6SwlzSUvctIjZ5bxZ8sM96ntJx+ARD1/5UbIlZXNskwyRR3GIMAu8pHjwqYnxPBPejdVBK1pr2Cc1DBHIzcp5DxTag9xGSUTsTIrTRVzXhcGk+tYkI1LO4hknelN5AUSVQcQ4vhLRkKODI4z5XA/iODhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVcYa5aR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7yOPGBh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475M75B3156914
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=; b=GVcYa5aR9wisD7KS
	wvIZKrmf0leEN8fT0FPYJumMOT0PaDusgL7qOOX1nWZ/Z5W480bSA9D3bXFZNGlV
	zw3EX+FvRQ0NJsEEcsTve9DU98I1d3bqcEXbPp0nnyfGImk+jmJvmWmBIVgXvU8q
	XX4H/wgr7z2sGg3XBPbWLXEz4kOR1GJlteyrIxyFg0Kzd7VDA3MGjC8koHk9xRZ2
	CMA9+lQfqcQGukYXUT09V/kM0lXFCQeXXmPjGFcIkfE8g4w93fOrge+WTtsi5L2m
	sTREhL+vuWOXLcQX0IwrCqrmaiIOU7b9gccY6rC9ZmBtEByoSprm2ChCu4sQHqw3
	M8jAqQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf04bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:06:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so465020b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778133972; x=1778738772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=D7yOPGBhqNI5OINwJUHq/3qJrC3wU/yhqYEKND7WxWLuFGhSLoe9f1UEAKBDJkdAzF
         8TkxNT35zfR8UtxM8FJVg1GOIfd9UX+cMLejJkuLUVkEmUHAKdljeJAs5EOOu2/szPJ6
         vmFlreErYkxwnji2KWuS+VtHgxhQZB7WKaSoLEwoyxgPhRcB36Vo++5S/9hTZVEbbJUw
         vuO8Mruq3H+cMxH/Z1SPlAHOsgkmClTqJ0TWkluRZpbQMzsM2C3K4DvZWIEK4Q7fR4Jl
         BPwwsuukuQfgH+iBHfMkBa+tmqt34H5hd0OIYcGYJUmvethp4i9XaGuB9x1EBt7uWtTg
         wHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778133972; x=1778738772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=REfuSrYQDBnRgOZ34Xo6IgBGK74tdYTdssRcIODNPE8rMOwr10tpG8VJ4aP2DAkiz9
         Ea/q6aQXL5C951I7MJ823xP+j6xrYMr/FcSQxg8ulwrfh9MLkUZc4z41jpzvavwsLFz0
         TMxw7HUcJzxYKR7N1nGkUafDIWIpXNavLsYaD/v/Tn/xKaZhdtb2AKk79fgTn1cZUsfb
         QPoRH/gXvfpI87kStVUZPMZtOKaZKutkTAGUUCy3a9IkU/AgGoXLRWr3WMsdkboRLLe7
         P/fgAWLHoexoqoaJVGuk6+uZh20o8rAdYtdY4GNbVEMxIn7Sk25Wuoox7GMaM5L/OaEy
         ntdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SBWM0TObzCqRF38NZJr1HUrUoZUV1Qdc+HT1rBNtnlsD9AsyF3urKuVXbcQ7a87VeajoFJs1JwYPXCN3F@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4wCdvNyoVdX0yYS1kAeUL52cqRZUWwhhL4anw469SsmxA1Wm7
	UHqmqbmXgGQ2cy0kaivTozhde39GmTMDv0zr30aM6jvA1MVLIhmRwbFxW26o3HUHDmbIIPXeXZA
	3sgLJEE+yKqwzPmju1yheYn1E8mBTQlESU4FsQsLvfjDkOgmm9yuaAh4gJY9ovPdJ6fHz
X-Gm-Gg: AeBDietCR2iUXIXCXNBwgGa0QJ2Vop8CB46zD3tD8S58UdSxIhu+7xbE0DN/5cl/DXo
	bV9u5E3hHoD39vnjrJJs1LHiDCAU7THFlG5eGVM5Sa5mIiWmMkxjX2qrFaOi9jKM/Wvm0SMkzI1
	Mw8B1knZDImtu13iZ/ixLT4SEBr+0GBZyKMNjt2W9o74bBbXMt5aDr3PV4IfD4+/zVJcmQ9V2o7
	ZwIJQ/6X+akiSO7igLtRY6WYd994+1M/qfj7yCqHFUqWC3+t9p37ddBhmHrKQz4YSi0/27nnwE1
	cLUsY+21vEfS7WEsFnzho+RtROwnK7GNNBZQy0ilxIP5XiSvOglx4fjtQJ+qj8s2qdhCQmnNvHI
	g6I6FfncDqk3T1WeZ6+7OpCy85bwQPh1uftVnbLFSV6MXrF8SjKwXa6hB/HAlqDmNvdgBE9wuaX
	6OZro0qFXF/H71RRLtW2cIEoFJH79Eozg=
X-Received: by 2002:a05:6a00:27a1:b0:835:388c:9764 with SMTP id d2e1a72fcca58-83a5e3519fbmr6514378b3a.37.1778133971589;
        Wed, 06 May 2026 23:06:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a1:b0:835:388c:9764 with SMTP id d2e1a72fcca58-83a5e3519fbmr6514341b3a.37.1778133971099;
        Wed, 06 May 2026 23:06:11 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a3187sm7566187b3a.60.2026.05.06.23.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:06:10 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 07 May 2026 14:05:47 +0800
Subject: [PATCH v6 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable_iris_on_purwa-v6-4-48da505e23bf@oss.qualcomm.com>
References: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
In-Reply-To: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778133946; l=2709;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
 b=ga4anJqCIUkaAV1pOfW7w/z8td+tCnbSaOuHupy+vkEM9yQf7+3ZcnsChAJVSbin594v6UdaY
 Y0C0PW2xyiXBp7xscpwcKIamc40KT4600N7vLvAd7iytQt892mgASqb
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1NyBTYWx0ZWRfXyCPnWlKgHeCE
 Sjxx76aftUB1o3bkrKRNYyFpd89Vy6GqukGwxrBAt8o7hwtRmWJ3U59e4CH6WHSqL8qSqBpdAC7
 MvF0S1CnhLTsgpvySrpxVUFJszVYPHa6dDPqZh9fvlpxpI/QCGI94oP7RRT2DQg8pao9wbHDSm8
 MgE1OK9oz0chsEQ1hxB07b4G/XOrCwPbsTMNJ/uE8wjGNFyC51GSO/fZDlwrglccbddxbp7adQg
 vEzh+ycY9WDSetT0XmAKiDztbfeRJTfasK/kL0+9PC4wMuX+1BBsqSfuVeTjWlM0buRzRrGkdZn
 beNaVaqTnHrzT89viXicGykyEexF3D7/RjT1Pc5wQa7EwafolPJPGpjsXD5UhppW40hQ+zJ3jcx
 UX8Rdl7YEnbTdoCgvOJdAwJuuYgtRVxKjOCpizwiKRsaCTT8DZs4Mc3AwE3pughs+d/mvNtFrzG
 6tVIdY2f9V6Iyof9QBg==
X-Proofpoint-ORIG-GUID: jFYDk7bCQ7pxebWWCn6XV5STaRs9gLzP
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc2bd4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: jFYDk7bCQ7pxebWWCn6XV5STaRs9gLzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070057
X-Rspamd-Queue-Id: 6A1724E34D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-106246-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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


