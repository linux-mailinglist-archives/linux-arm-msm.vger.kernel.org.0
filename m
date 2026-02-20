Return-Path: <linux-arm-msm+bounces-93482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JmAACw1mGn/CgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:19:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5A166C63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43C463096591
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F08433C53D;
	Fri, 20 Feb 2026 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsd4XRje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUN1dj1k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1A033C532
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771582631; cv=none; b=XP6nKaD2TKOfleNeONJ15xaUFeCHukwcxbqDIvDYqx9uKvItC0k9dsDWmVO/fFsmwKj+M1GuNha5CQT48nGvtDfjxpbFYIVZQx8/94C3Dmp7paeT2ZX8LsYJeE5bQ6nv3EzQZBDFM5iYb5LB2yI3SFjEfMUc8HWxwdNIcWSGQ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771582631; c=relaxed/simple;
	bh=Rb2nxTI4KAJnon35XJ6d7KTZD7XnvL9pOmuZMjDQ7e4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFUOpwaYX48n0StTU73suMWBkeNOmM6d2MkYCZwR2jEpLyjdp0+Rcd1CUSbLWpkjr8imWfOwcuurWdLABtY6+aRc26YeZqQ4dAzFB30zU4HHuzGPKMtEFlcekgOdpckvUFZ1vlp88/RHYgHLiVE2qUsBQl5vRYontg9QTh3jNHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsd4XRje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUN1dj1k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rmaw3697705
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASzCDcZEXkKQtVSjQBJxsoyNVq/CMdlb4W61BP3yNPI=; b=hsd4XRjeNKVs+Wl0
	tFo6L2VZl6fo+gNOa+LI3DOfe2SoBPulOok6EQ/eR1arJqEFUlpB2g0W4YasGb1a
	yPnjGXszkeJHih08TWIliG5y/WHbeOizSl431pDRdX2KomCaIBXfEKfzg0s/gsdf
	uB+YquHOCvzfqg/3w0A6M2W6GrG6UqFVq1hcQrv5pt3DwJlb1ZRUcbH5wN/H7UII
	KM8yvyCbO/q03ZPq68FdkKto1E82BA+nzFjr6ampxP8494K8vhXoDk8SjF8T4U13
	gD/YUaSoPHMlsrrDG3v4KhdMdL7weVYoDFqGuAnXxtiqQDJBRAov0qiwD9EmVBST
	4Sz1Gg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh5jgq88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:17:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35658758045so1453336a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 02:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771582628; x=1772187428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASzCDcZEXkKQtVSjQBJxsoyNVq/CMdlb4W61BP3yNPI=;
        b=IUN1dj1koUSaiighEt0W09Q2+ItRGmM3eEDH6oo11Gn9GZsZrj1Y05mgynjsS8yTrk
         zFFAyMW2Z4bFK8K84zzF1N105PW1V9HFYFoRfdQ6ohFNucIlR3DIpI4PC8IiD4AaCYFi
         DhlyYz/BR3xDMhPjEHVOwNMIvEyc1fms2xS5IkhCi0YoTYm+9sS6aXsluHLq5/YNW+Tf
         r7cuH5UAni9ijdPSgDf7Ju2NlcfxlGR94Ky0lyFpTAb+PUXjBZhVdUpon88wbFT/429V
         4zoubsTp7Irk3UkNXosCIGkvgHHPG4tmO4kKzjdPjJ4jBggGUFp4a7eDoTFjMDsEMl+W
         WM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771582628; x=1772187428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ASzCDcZEXkKQtVSjQBJxsoyNVq/CMdlb4W61BP3yNPI=;
        b=loejRq3137wsk7qzWreEf81BC7vKFL7GZaYmsqzn6gNzbzroU97JckbxoRb9fln5w/
         1TbHMTAwW00hnhBeHVMdEWHlzJ35n9YwWvKN6JQ1tqK4O1iAk+XVrS6RGO5seMDh6fkw
         L8O9+A1+cg6NlM+HB9RkEinQBSm5jOIyUeg87ksa1eRc1+xTAULd3x+1m3UFYeuaa0kV
         6isfg5uYyELhxCQzUzqtAr05GxfVnmzAiTPmjoh9M71zrndsUsg1jwqxrcC1wsIVXCIe
         br2XJUUlAI0KhSCkuByq8S5iPLRceTee5t7JamZt3TMzT/P4chxuAhvBFXHGF3tnLcLj
         ie9A==
X-Forwarded-Encrypted: i=1; AJvYcCWYIFQS9RQbsYMcSkgsG0FXOgYVdwgq7WXRHLhx4kOD+f2YAGqxaDlVTal+vfZl7p8ND9OWxhPFvvgiyuOr@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHKFSlUPDgQsQJYwtGgY2FdfsKdGJ4UioBZ7om/JL619oU101
	3CwhSD8Qyh7AVT8kfeick/lK7cX8m7v1E3pIcDyoOHz031DYbX0oA0diVwg74OYBX8yqGpsmKjW
	JELXt6Rbt8tKfDd5p7ya8SROwaQRrxM3o2nRUqICZJkldjL/Dasu+vZPmISqcRdrz9nha
X-Gm-Gg: AZuq6aKvFveVf1P4/D3ULOVc5CTPrPLt2zgvlUlPqdv7Gba7ooKpC5zleNmNvXIuZRF
	ZtQgh2AlISeCGPiUduyZzyj+fS8T6Y3cfTTKelSnff3YPGGb2ydyz3HgsjEmNhDDsdwqF4CSmgH
	Q0g5Z3oR5tWREOlkgdphBXSC1dZaeQ+YX2wWU0izk7InlUWedM1gj3REPj06+l8BwrTh419FPEJ
	IIkVL8ddcrvm8Nz2hDojglHgHXG9L96WFfN/s/xbBwQove77kRIjpBJMY+ixKdXP1e/nLWiPfCD
	KJ0YN16AcD/lFQQSBmXMlBTYYYw0k/qYfYozPxvIrBmSwCwpcS5cmtR+ajREpZypm51J3dkCtvw
	Dx1q2qLVBmeyXld5qYSFhI6j+hWmzqNaZgn9yRNsq0OJ8SQ==
X-Received: by 2002:a17:90b:548d:b0:33b:a906:e40 with SMTP id 98e67ed59e1d1-35844827350mr16081736a91.2.1771582628477;
        Fri, 20 Feb 2026 02:17:08 -0800 (PST)
X-Received: by 2002:a17:90b:548d:b0:33b:a906:e40 with SMTP id 98e67ed59e1d1-35844827350mr16081707a91.2.1771582628006;
        Fri, 20 Feb 2026 02:17:08 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d81c288sm2768391a91.5.2026.02.20.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 02:17:07 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 15:46:57 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: Add support for MM clock controllers
 for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-glymur_mmcc_dt_config-v1-1-e0e2f43a32af@oss.qualcomm.com>
References: <20260220-glymur_mmcc_dt_config-v1-0-e0e2f43a32af@oss.qualcomm.com>
In-Reply-To: <20260220-glymur_mmcc_dt_config-v1-0-e0e2f43a32af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Raedyltv c=1 sm=1 tr=0 ts=699834a5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=-oN0OLM605FvJlsggzQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4OSBTYWx0ZWRfX5MgkK/oJCSrc
 0JtkbkisitBUr8DskX0M9HzcHJnJqRcTEhcSlRQjSzByBVtMXG5BoI1lE+dgK5ePsajiF+NcSGG
 GuDqjrjd7PznrnseL92+240bqXlunK+WYpZJSXmkG9udsP/fU9sDKzOiMNZfTBwUfxMiW+N+de4
 u5NVNEG3/sKsYNxPkKZR1bWzDRbDxgM8UyGeoqyK1aKzLxQ9grIqoIDpqgfM0bS4cXm51ipq06g
 TeMj34nAWOAv4P3GJId5VcBhldZMLLrHFfEEAd2vpCtA7Xp9wp0TXQRmMTFLm8MtrEXSjpuJZLr
 QNOggWp3KZhIkz22ZkUnNMy0KeB9CXi+BnByJ+BmgHM+R93lbXxASBDiBUmEGdNgrY6uFtjq/yJ
 G7ujSHmZetCgMURUFT7yAo7dvWcpSveooUgGeNMr9UMHV1ZfnVVXZiI9RHN9HniZm1Sfn/qemZh
 EyJHB1VYSpJs+xUXj2g==
X-Proofpoint-GUID: gZFUs1D_y1SSM31UjYFk8XJTU0yvfGDa
X-Proofpoint-ORIG-GUID: gZFUs1D_y1SSM31UjYFk8XJTU0yvfGDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-93482-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3e04000:email,af00000:email,0.30.132.128:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,3d64000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CA5A166C63
X-Rspamd-Action: no action

Add the device nodes for the multimedia clock controllers videocc, gpucc
and gxclkctl.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c85447892c0661f83171eded94f3b..64ed707b8b24822d59e617851a35745acc366a09 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5,7 +5,10 @@
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
+#include <dt-bindings/clock/qcom,glymur-gpucc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
+#include <dt-bindings/clock/qcom,glymur-videocc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -3335,6 +3338,29 @@ hsc_noc: interconnect@2000000 {
 			#interconnect-cells = <2>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,glymur-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&rpmhpd RPMHPD_GMXC>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,glymur-gpucc";
+			reg = <0x0 0x03d90000 0x0 0x9800>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				<&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				<&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;
@@ -3367,6 +3393,22 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@0aaf0000 {
+			compatible = "qcom,glymur-videocc";
+			reg = <0 0x0aaf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


