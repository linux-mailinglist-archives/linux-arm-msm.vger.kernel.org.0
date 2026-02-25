Return-Path: <linux-arm-msm+bounces-94036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHd2L/yinmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:21:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0646519346A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E13CA302E1CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A689C2F25E4;
	Wed, 25 Feb 2026 07:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4yuxfm9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c39M+TV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F732E0938
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004027; cv=none; b=uPyXXN3X08Al1PJJ770Db3/J0lb0pze0vtT82qBMKUB62VR3jIwRFvQ2MUZei9quPG14gpLH/iR3JIMTJlN0ebq5PukCdmz+R8QKHggPYQ/iNjo+6WIhxBv9tf4wk9+LMGCF3Iig9nkYE2cPEXRWsS4Q29MeaOt5ZUaRF5HYwcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004027; c=relaxed/simple;
	bh=kis3v3C4nt56BQx6xUh4uIxkHwEc/Uiuo+OqAzr1aDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FjT+zwgwZfo8QpZMWUxgbXuw6kBHy13UHc9QDMqu0pV67T8FtYVgnAEsgV8SkXKepADTAItSWvOR+UQXKmnKD/mUWrwmr4ZCEoFvseY0nOTw5k/PyMDHjtgf7TVcyPyjAoHUn7xnlVeDCRwhERsNNGiHLWsFhl7+aO8w+UQAwwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4yuxfm9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c39M+TV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P3rEeV3334071
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kE1rjB/lsvoFa7tCLLzzkKUQ38cbbk46rGHBjoQOA5s=; b=h4yuxfm9RscZCyMA
	hYQzKoe53cXOd2+rTKcYVZjyZ3D09Fbr+WdaDmuaOngN7HLwSI0de/3ctw9d6NtL
	GSbP+cjsL+rh3hYo23XDycd1PdWSeuIdLhyceXUSf4gNpmg14l5lG/DUfeJC+gAr
	EmdC80sMCzpUOfIOO/L+kajaIz+qBBcyJ7owFvJDXCpqeMv4858R15Qt1xpTP7a2
	aQrG29NrjzXqkqtk3GkujiyaHWHnS/jGMDdaMc6rm1JAxmycHg7XhsojToJhuErt
	nKniGnGCFIVuQ4WOZaM5ZsTRM9LFhywCdZoJFYKHp5hn+UXPhlIGJ9lZK1SlY0jT
	wAdvzg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh4721h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:24 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4c14c60faso79585311a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772004023; x=1772608823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kE1rjB/lsvoFa7tCLLzzkKUQ38cbbk46rGHBjoQOA5s=;
        b=c39M+TV0Eov9TUAsp7zQfhyaYrQPcCv7lx0sU9ijS+O8USJfbz0LdjauqXs+MA3dRu
         6XSXDKYr1izEgDs+kqRfNUDKX1aHUkj+bt6oWiFy4NKQRgc80V5uLwC2pEO/nkQPZHJK
         lLf1TICYER8Cz22igfOmfvtjk+yholYxk1Y1qnsDmq8GYt9QyMNm/VwcJe6sqv55gFz1
         fwTW/k/Pw2a8TTJJTuGllzpnaNbJHeNp5UMDAdrLj1Dsts/Nahyw1XUGLE2mku1cSJzd
         owImbkvYeWqwG+/fuMGeuJMZCO20ZZHpLt86d7mY9BnGXUpMTSBertofZUuxsdOsBiLB
         4Ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004023; x=1772608823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kE1rjB/lsvoFa7tCLLzzkKUQ38cbbk46rGHBjoQOA5s=;
        b=cRnQS/IGcSAH+CwCdEc8RWVT7cZ8GcHypAloxA+V3U6L8+4JkXhvbAelfvCH1t7ISi
         o59OrQLYuT2bfxFqgOQzjFdC5AvrbSvhC9y8DCJInzm2ehZEUA08PkAwdkqXtZbYJnLS
         AwJgHyUO3BB8tIjChbmoGZqCcsf9Pvo0d+SjJhqZxmEPufVBkTIIquEvfLDUajYLXkAO
         QuWrM0ZbMF95hGf5249Q4wO8a4ZQBbGONMtlTpNYfAow6n62KZA8reMos5CHEgJzBQQZ
         wtKsSnWp6ig3jPMTls2uD2KvraNCwpbMs6D/ykAqEjuNmrYIL2aWiP+TYtURANxbJlUy
         nffw==
X-Forwarded-Encrypted: i=1; AJvYcCUb2jbb2baCVAwrSJkTrwgbWa7ngpRlL260R59HUf15G0sAKsWpjakC9N2LA5EETwMhCjRI3rZCpDGqsC+6@vger.kernel.org
X-Gm-Message-State: AOJu0YyyhwAEa14O+BtZZhyjcIdRTHSryRfq/z7F757ImZgQ8yBvNiPX
	5BG9eb4f+HjQ2Gb7rScgh2m2ALYlTTKW8WDBMyKVBbi7Y8DrHKGTBCTQbyrNmdVHGU1Q71jf4g8
	cYqDAdfZ6RBWD6obqBJa4HtT7q+LCjkWenvy/CPA3IJz3oE20uknLZr5ksqEkhc+4qfUF
X-Gm-Gg: ATEYQzxwRWcfXjlieJBovlQMHI4CKl6+9RxdncBZNhsKBB/ferRQ3QdXIh1xH22sU5L
	3qxkJbn8Zgf1TqG8ZXqRfJ8tvXkjax5krld8zaEKQt+zi+RYZnAdlAB1agxAVPwK4urEoQmnTJz
	JnTwH1ZchuQY76vxZz08307DEiA7p2bKOocSOjayRYRNkXfoTdWH/zFLQuPez+U5v4lJ1boJeZ+
	EuZzeUiwdvImQvMbFvXxndZdcTGCCmFZa39OU8fEgC1LF1lIUYQitlzhqCUMT4ktr/WMQDjNsGx
	5jkUQA6TZDTpDFRnK0E8v8L594pXLhH7V6nM0511pxJnONGKaRxRpZla0xXSiSGgGenqLOv2gz2
	gB4dEdJy7k/8/jrUC/7w3vs79VmHP5t5NpeHAKuVhadiC/jHFj7FG+RO90fxkgXdJo61iaaJZ
X-Received: by 2002:a05:6830:4908:b0:7c7:3402:7d74 with SMTP id 46e09a7af769-7d52bf20168mr12269305a34.18.1772004023405;
        Tue, 24 Feb 2026 23:20:23 -0800 (PST)
X-Received: by 2002:a05:6830:4908:b0:7c7:3402:7d74 with SMTP id 46e09a7af769-7d52bf20168mr12269292a34.18.1772004022966;
        Tue, 24 Feb 2026 23:20:22 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d038dcdsm11711730a34.16.2026.02.24.23.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:20:22 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 23:19:16 -0800
Subject: [PATCH v6 01/10] arm64: dts: qcom: kaanapali: add coresight nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-knp-dts-misc-v6-1-79d20dab8a60@oss.qualcomm.com>
References: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
In-Reply-To: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772004019; l=23499;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=prYMCbFhtJWKvpHLod3UOeIGs03j5Ip2+BricOoj6iE=;
 b=TUysr7ZbxAEdK0o32oW1oNovLee21Sdk5VV4r/pRCtHnQZgekrzj9l0PLKF3TfZz8fOp5F9+C
 PmBtQvKGfnTAzfOpFYtgY173yFM+m85gUMvCrCfJQMr5kSYE/WH5dK8
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: y6Dii0djMVYmTultaBuyxZZR5zhdgeyI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3MCBTYWx0ZWRfX5mdHplk/RlaT
 YIptTqIOucUh3pdy7z8JOdZ9yWtKasc6kLIlhZyvttcVHgVjMLytHrp3stHahojVP1aY3Kb2jb2
 zbner+QO+OqFCHlYLPZ7OFsyBXnieIjE3WmlIUSaJ+xzejCRDKPPpXRrgnlS0+DRtr9WIp4aR1k
 tiBnPMlkoU8GzIEj6k/cvYqw3fUGCmoCPwgOIM+fBnUODTY8bddmpbuJW6k0lFnuKRt2JXcuv4f
 nxsjLFZkUmBVmyBI+MkgifqeFCTCjgMgyfGTPsoHldFYwv8EOj7fa5N8dTg6+Zv9rl1foi7GGpc
 xRwUtmNQtbuoBUkEVj2aBCx6/h207eZiHE4rovzwSn7ag6mrN9kEJA2qHPv/PZiAFjOKlNqrqCR
 tR12TyiTvzhB3h/J0e0m1FZ4AuUrBJW8J0ajAgxvqK2PPkdeysmNE8uv5TCE+/3dUvCQTvSb4Tj
 qg3BmrlUSLGQg8EN9wA==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699ea2b8 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7UlbJtpOWuNyX1kucuYA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: y6Dii0djMVYmTultaBuyxZZR5zhdgeyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-94036-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0646519346A
X-Rspamd-Action: no action

From: Jie Gan <jie.gan@oss.qualcomm.com>

Add CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
These devices are part of the AOSS, CDSP, QDSS, modem and some small
subsystems, such as DCC, GCC, ipcc and so on.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1160 +++++++++++++++++++++++++++++++
 1 file changed, 1160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9ef57ad0ca71..6e231850d5d6 100644
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

-- 
2.25.1


