Return-Path: <linux-arm-msm+bounces-105260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLJCM9s58mlopAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:03:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D350497ECF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 108B530211EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DF2413244;
	Wed, 29 Apr 2026 17:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="estCKPI2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dvjb+P3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0357D413233
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482129; cv=none; b=MuVWAa+0j+hQqfbSlpt/CrJPKYsFtlw5vzlv2WZD0NpVixZJ8+G1tA5gsAQmI5Z/GLgBnzzk3RMvWdFDrVrP47JHlK5VvreaLU2Dwpqg3RYB1GMLTsgforvW1if9oDSdv+IN/Q8TO9jujlfKZEfRyqHadyQnoUy/0lXH+DUTfhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482129; c=relaxed/simple;
	bh=NbxUVY7Cr8u27hZfVARiPe/uaWSuVRtYLFGamRIaT1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oqz5rIY19hCuuRxlfLZTUtZLNEZL9lD4r88WQLPLx6tq/qVvWOjk8yceazS7EUDXPq3OXR7zD2GOY7ZnofVVny9ZBKvEbOkFvSEf8/ABhlaqDbDMxEU1eIx0/0ruU52hTQJPlo8TyjBZkJLoe0O9TgAJVtD3ZpJ/0z/e6QQc0SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=estCKPI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dvjb+P3l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFEBWA963229
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/jn7w3CeadBy1OTnp4vTqdzsrafgI/os35ZMqljkHg8=; b=estCKPI2ws23d/AA
	AR1ifEluxBtzakSnnSYxXRZRA8nrbB9o9R+2NAmpGfd5iJOOLoV3QlTCB0mEQw5W
	aKvg1rDFvootFysOIAu7qf9Cuk0rXWpTJFbX9bsXwso/27Vdy5MhyAMNRfu8/2wn
	feAivWYMI9pU/bBjnV/qE6qPmphz3WsOD4i4SVgVEyd7v1pN+O20VcUA08LikguL
	BOOJ7XcHHkkz1Gec6tEKiix9/dWYQFh9ytGX74yE+I6VgvwEYXT9sRCRX3eb5zms
	LnbKIZkZwl/Gn0ttpgFnZ5q+qANnCKbUvJLHYuTTn6YzxF3NaZkdf/8nEOqJjcjz
	Kxj+Dg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4vgn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b7c904d476so38375ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482126; x=1778086926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jn7w3CeadBy1OTnp4vTqdzsrafgI/os35ZMqljkHg8=;
        b=Dvjb+P3lwHPnCHe2dBBsfbQYo3w3a4CeGqGUO+iiJ1waZaHapkeKCgwecTlf4i0wMx
         gKPi1iCAW2jICSVCNuXXulnETVBhtGbLxEnjKP0dNv0N9E+hqN7neaX+owrHE1uQawU/
         RqVeU4OsSCmZDwC8kop0w7OOYL8CPq19lRXU9eEW5OEPY73RONiwolckpMVa0WMai8JA
         YD9j5AZRs0FczxKDdYw5ZAFqO4qqbfkhaAXIjvXcxgQoYtjhglqD6l1zrL74IqaJu55z
         d1oM3SLk3W+UBBqThY8zeVtLgNxqVvq3UkzlvGnHEzskHmpV4m/FaHZHIKT6SSl8eFP6
         LImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482126; x=1778086926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/jn7w3CeadBy1OTnp4vTqdzsrafgI/os35ZMqljkHg8=;
        b=UWPXA+4WCGPleyLVrEv9XhujIpY5aW60ZhmzE9THIbBQBZRfl+yVVWcXPyQNNSbXS5
         r4nMfbKwEgtQ3kFTB9dzBFvmTONZ8EG3wnhGhn0sYI5BT7X7QLUv0dIXmc5aq/ic3sPs
         HrTPTEfK9CN3NKIj5q8n2rFoVD5me+lqUc118ROyMYXVd+2cS3wNl/JvFGCTzM1iBeOr
         d+SFAKUQIzIeuFnMHoYcIOOAyCl6yP9iYTvambr6afiufAGcgqrvzdp2g6qnN34QsNFk
         t2ke9N4KRiY4PQYJz9sUV6utH4kZFdCbWDRRnQhowvUW4jMFte2L6qK8Bic95nkHVBIj
         SRCw==
X-Gm-Message-State: AOJu0Yygoocfq8LTaSLxXPGAP4Wx4KZ/Ksh9Ic5wxtLvK4x4JG9BuQYK
	cxUeMOOb2B+pd8XVCvRlbn104K0LDxXQYhhgvv7LNEi3bZxjeY/jrHzWgsZ347XPQKXXFgWjtZz
	Qwu97Nc1hmBTEX2Ym3v9sEikXm9YaUf/lmhbwZVh6L8Z3T0EVc091gWKQ6i2UgzAEfI7U
X-Gm-Gg: AeBDietf6td193WS+XZQITqSU7KiheZAq4ae/ytJFQfJ9JJ6dKKR4T+ONAQ2zTPOybv
	faqk2m6cGo8ms1RrYApwliXavsxwst5Ax4JqvAl1T+Pc6rXomG/wn6AUfplwPRHtbmY1Ev0bzZk
	zTy8yYcfzCpxItrc0c1a30hy4E10TeEpgUzCN/daMUO2e8IwsS2EpN6AePlvenNcYoz6uqW7tKJ
	SrIFiYTLYRI/BugZgxQRlkeeQ6ZU9bEYCbBH2rSotzMlGK2UbRKlvxkZCqNrG4nVdNEpCKLI1AC
	YBMqUcsSp3rPHCVRqan0MREdKsmkkhVE+HbhkSSK3n66H70fZr38V1uqXZW1KzGmyZ7QMg1NGxQ
	Ri7bAvqOFHzVV3mOhTelWQfPyQAGvJWcr91Zr0OyUtnSU92J+OTdSRq84eFL0m9Zequaq
X-Received: by 2002:a17:903:32ce:b0:2b9:8ee1:73ac with SMTP id d9443c01a7336-2b98ee176f1mr24235285ad.11.1777482123973;
        Wed, 29 Apr 2026 10:02:03 -0700 (PDT)
X-Received: by 2002:a17:903:32ce:b0:2b9:8ee1:73ac with SMTP id d9443c01a7336-2b98ee176f1mr24234485ad.11.1777482123162;
        Wed, 29 Apr 2026 10:02:03 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm29530195ad.18.2026.04.29.10.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:02:02 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:31:39 +0530
Subject: [PATCH v5 4/7] arm64: dts: qcom: talos: Add QSPI support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v5-4-993016c9711e@oss.qualcomm.com>
References: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777482100; l=3170;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=NbxUVY7Cr8u27hZfVARiPe/uaWSuVRtYLFGamRIaT1Q=;
 b=nH4uu+GeW60QZJNodnvtK4N7vGyIkYvXMgy0WWvBuxYK/rrvOsp4Kwn6KiXc2xvqRdMAw9JwO
 gEa1LT6ckG+AxvemqB4K0sVM6tPSoEQlqDbOzMVuf48S+oOXlGU0HDU
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX5HWpM61mjfGr
 AtW9YbLWIKmnqQA2K+vwAIFa3gHgsTJwXXbgq681DBt1sKmh7JbiPChClLgCpEnL5kx2+eNhDu2
 opikftlW2m8S37KAy5DqrhDqMhfVAtzHapWmZnyLLgK07rnXPj3JXlDGCOme8pFBqgKggDb95VV
 ppk2k9T4IHqyOzY3zoVm5GBu9zJF/347UHOoI54N/XAP6bgjqClzvy/ubIl5DKR8lve5Ybg6wqK
 dB9AvLtlbl7jgovXUxyTiC7I7p3vqIZRazHxqWkjohI3JmH5s3YhFKx+2qqwCGMw25idWniEyNX
 /zvY6Zm6AGcGdo9VExTqIobAKYrP7RVstHZUpVFcHUy1VAp00KgRVC/AEx7gXxWaEyGMVbsbMzj
 WQmPqV6bQC7ecK6k0z9DdaBIHUgcUtTsjAnZP8VC0nfIZnj/9c96SwGPRCo2tUiAahaCpTEhsbA
 wULXs2urHNEdDBDoTZg==
X-Proofpoint-GUID: 9J4vqU25fiXyab4Jv6PgN1iOXPDesR24
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f2398e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NWNfpJqe0LLSB_FnjTEA:9 a=oMVJaGz166wJ4grX:21
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 9J4vqU25fiXyab4Jv6PgN1iOXPDesR24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290171
X-Rspamd-Queue-Id: 9D350497ECF
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-105260-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.139.197.64:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,88df000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The Talos (QCS615) platform includes a QSPI controller used for accessing
external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
the QSPI controller node to enable support for this hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..8c7ea369a332 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -531,6 +531,25 @@ cdsp_smp2p_in: slave-kernel {
 
 	};
 
+	qspi_opp_table: opp-table-qspi {
+		compatible = "operating-points-v2";
+
+		opp-60000000 {
+			opp-hz = /bits/ 64 <60000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-133250000 {
+			opp-hz = /bits/ 64 <133250000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-266500000 {
+			opp-hz = /bits/ 64 <266500000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
 	qup_opp_table: opp-table-qup {
 		compatible = "operating-points-v2";
 
@@ -1610,6 +1629,34 @@ cci_i2c1_default: cci-i2c1-default-state {
 				bias-pull-up;
 			};
 
+			qspi_cs0: qspi-cs0-state {
+				pins = "gpio44";
+				function = "qspi";
+				bias-disable;
+				drive-strength = <6>;
+			};
+
+			qspi_data0123: qspi-data0123-state {
+				pins = "gpio45", "gpio46", "gpio47", "gpio49";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_clk: qspi-clk-state {
+				pins = "gpio48";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_cs1: qspi-cs1-state {
+				pins = "gpio50";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3896,6 +3943,39 @@ opp-202000000 {
 			};
 		};
 
+		qspi: spi@88df000 {
+			compatible = "qcom,qcs615-qspi",
+				     "qcom,qspi-v1";
+			reg = <0x0 0x088df000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+				 <&gcc GCC_QSPI_CORE_CLK>;
+			clock-names = "iface",
+				      "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_QSPI QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&qspi_opp_table>;
+
+			iommus = <&apps_smmu 0x160 0x0>;
+
+			pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data0123>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		dc_noc: interconnect@9160000 {
 			reg = <0x0 0x09160000 0x0 0x3200>;
 			compatible = "qcom,qcs615-dc-noc";

-- 
2.34.1


