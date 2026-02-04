Return-Path: <linux-arm-msm+bounces-91752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GHsELatgmliYAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:23:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE242E0CC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2885430D27F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 02:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5777A299924;
	Wed,  4 Feb 2026 02:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RK2PCf4E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kKkImmEF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72542C08D4
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 02:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770171766; cv=none; b=ofSPjrSHzwzetyUwBOducOtPDM/YfC4aTCQK/wDkmrc/6ivTK0nPnwJdzUIvZ6xGQM0cj2bFGGkA172gkvtQJ1i93EoFiWjdzjKjWSIHxhWvwcsbVR5O7u+kZpLSk7O86YLDicqOivn/YfudIWcgHOqu5pfF963zNlTzSgzcxxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770171766; c=relaxed/simple;
	bh=qEpYK/03QWvL3WtM5ez+2Z27n/3QOHCo1LS7lv4T3GQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PxUFVaQPaHkXovI9teem9jakDBlUrkUagjPCPTR8V25qUab3+GISUyYDAPYPV8VLYOluzJQPugLobMg4r5q1vUbp5WqlBbiuWZCndqPHghKdOq0U7S0ZCkKfOuta54lSWXCr/kDI7gPs9sprq1hO2lqXofZmSno/do92g/Gcbjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RK2PCf4E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kKkImmEF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Im1qp2055079
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 02:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R0dHaDvrRvPS5SOe+bzZlfj8TW6nxvnK4LX8wAbwiXs=; b=RK2PCf4EsEBaCL19
	AMOZF3IfSvxdZtYA3uM3jVg2alvOP1i5yDPfbn+Yjteu38yIUpwuQ/M68KNQwl9C
	iOy6XDVsdn3r3ozBLTsVN4aR6avqt5V9ZWcqiHLZJDnLyLw/q3lX+9gKTUrnOeVa
	+t6bUv2WEsQtRfwn/NR23GbPw59dYKeqtU0ZThZizOgBgKLnRAcL5Bxe19+af3D/
	Osk8aQbmem1XU14IOzAAUB66jeER7CnNULIOL9/PNuKnYnZIk1Ba8IDBTSD35XbF
	IzfGAmVN4VfmcL3wvTo+ORjPaNXporqE7rDD4CUVNuQw8L8k8EWzROkXkn6+BUky
	kvfQbg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exkb0n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 02:22:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8230e2c00dfso3229779b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770171764; x=1770776564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0dHaDvrRvPS5SOe+bzZlfj8TW6nxvnK4LX8wAbwiXs=;
        b=kKkImmEF0/bPXz/uxUeDglWTEezYnOY72ieCeOJm7OoCU/GLZe1f17RwaLFF858wD+
         a2HNk1Cc2EP9hn98UC5A1DslNit7VbFRVPTfvmF4NMPb/RdMZ+DjiwJGvyg5x/XO7XLw
         h+mlXVO7L4XiC3O+ZSSFxpo2lEVvCC9HcZEuoxXhfzMLOjkdkZQHKX7mPjTf3ENtEX5+
         4evQty7MWRwZxK3/4CaZRQYQuIuUw35S9YGQdXwyywQCLSSNSjRg1BqvejJ3y/w/ld61
         kjh07osOgecfdnAOsFj3iOUyhipcklln1nZ8CBL94yO8Z690lc48W+SjXwIWue+3IQVt
         X81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770171764; x=1770776564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0dHaDvrRvPS5SOe+bzZlfj8TW6nxvnK4LX8wAbwiXs=;
        b=l7OIEUBRT1Tufpa+0JdqgtN9/y3CKehsf4FzWznddguSJh9VY5ZuI7cWHyDE53VhXT
         T3nyhPfH7k1k5FnTypd731BcZwKiiLM8MyaxFvDZZQJ9lF8lrRIjFacw6XdWT+8mpIBE
         vGA8IQ7RJtJgVFeTGW1z+9Iq0UwSerSfMVerVXVS1ta3//iBe1hvyI6wNpJ3rTvybFke
         0WgN1z8cZen6hLhsFc3E0dt31kSmymNOqAeB1vw7vLHiMaBpmUwJXXb6FljHhI+Cdejd
         CVA/8WT9xqhIGe/uNKjuKTwMgC+Cf2uAlhmr1cedQEfcr4KVXLn+M7iMWc2sHVXZ90oN
         gZJg==
X-Forwarded-Encrypted: i=1; AJvYcCUejeIiGBHKcgvnfZZVhGHTPqw7JIbrvS4gR7xC6Ltzluz9yzKFtzjbh3/p6GTQYIcRF3NNmOQU6cW8+tg2@vger.kernel.org
X-Gm-Message-State: AOJu0YxYmMBWGcYMxNCndu1NGMaDCJLxzjfHnn+d2X7m5xTM++O/OLNv
	vlYZh6eG4K/FfXTgQv4KFh27KO2NOspIs51bWBhvMiQ9psgLEPlVVwEgyQGMQisnsFkIlNVUAE/
	noTPrRMKjp1WYBc8PlAScnQzKkFY1ffGAGFxE3Z/L28ewvv4XbOdxlooQn6HFES2gPTaC
X-Gm-Gg: AZuq6aJpFMktqXic9DKQAGH2jI/JWgkfGp+9KIf83YAjpJa47hnhCoGS1Iijhq4ljg0
	qieZiQUcqFKQz0sRNO0J3xn+NxKb8fRGVH6Ag3TROCqAbDaY1otUAYkLzAkwnyPxk/yyWYC7d6K
	pYM3kgzry2M6zptESstwF7M9EbWthL6QBn7sHOLBYkxXgX/EEFxDvGydoBcJlvBWesf5fCv7yGh
	kvBNPzO+d4v1k0UOO1RyHkc6+O5W60/YgoHLDcBamVg9XRlxRPhrbME1BULD667fVa3TU8aznpS
	9CpBb7FnVCMm+KvIECF4ah2EZ+fhoXt+p2TmTKsgFl4cJcPK1FmOSTkWODfMYG+Nr+zSyCGY/g8
	+hhltcQ9les5a0EHKd+2YaF2m92cIiXsZTed7vpgrMfUwttl/b/nW7I2Qq6cdH7faCVp7RMXA
X-Received: by 2002:a05:6a00:12cd:b0:81d:a1b1:731b with SMTP id d2e1a72fcca58-8241c1f9422mr1517827b3a.19.1770171763710;
        Tue, 03 Feb 2026 18:22:43 -0800 (PST)
X-Received: by 2002:a05:6a00:12cd:b0:81d:a1b1:731b with SMTP id d2e1a72fcca58-8241c1f9422mr1517800b3a.19.1770171763267;
        Tue, 03 Feb 2026 18:22:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4a5c28sm695598b3a.62.2026.02.03.18.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:22:42 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 10:22:02 +0800
Subject: [PATCH v3 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-enable-ctcu-and-etr-v3-2-0bb95c590ae1@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770171750; l=4207;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=qEpYK/03QWvL3WtM5ez+2Z27n/3QOHCo1LS7lv4T3GQ=;
 b=iowRs9Irvb+6EMSGVRkKm9fO2w1211EanmYUZBzovd0ZenCRSpaIin7lEPpOlTlswFzK+n3ig
 vAC6gh27CMqATLxex5AQkpL3KM+oRIzI4ueJ/ck+LgklPLlvHWnQXom
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNCBTYWx0ZWRfXzE9gHqlmAPI1
 Lq2u47lJF7GCvV6HClofXdI34N/FrO29iMtXfctzupXgVAPX++z+xVKj97jR2pxuHRo6W3Ii7Dk
 i7ctkRr1iVpoh47ewmQz05W+GjPIDogK/LaVcCmHScGWX7ErL6vOSjs7Eg7+sFZZIRSzUeaIKif
 hV906JdpHP5uRmsp3aWFHSRE1UG/+gEM7FGncNkrhL3D7YK9B33pNJCMw9t4kW8NfV59tH1XALZ
 jrwp+OmoWxiqbBtOcgVUvGxoiSASPyKPN5VjjSe1aV5ivN2fQxJIaNOLAp9PHPE9BdHcDhiqRhM
 8Svxd5YP1tt3V3VUzrNi3asnNIEa6q9lS0LpqwPzNHrx92S9Sy33o44275tLpx43RFcaw17E/qN
 LpJHlMDzy/daFNMEAUGhUuL+8Wu+WUUQ2tRVvb1sb4ChK4Jfhz3ivwSgqwjmR1OKq2KAZxrDn2F
 4mjAVzvXJl3C8R1NVIg==
X-Authority-Analysis: v=2.4 cv=XfOEDY55 c=1 sm=1 tr=0 ts=6982ad74 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zg5GTYui_k3rg6aU3KYA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: DWeX5wip2bctCO6jvvYMbgYvbSp4IOYy
X-Proofpoint-GUID: DWeX5wip2bctCO6jvvYMbgYvbSp4IOYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91752-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.153.74.48:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.164.203.128:email,0.0.0.1:email,0.153.82.0:email,0.152.154.104:email,0.152.158.80:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE242E0CC0
X-Rspamd-Action: no action

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device.

The CTCU serves as the control unit for the ETR device, managing its
behavior to determine how trace data is collected.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e618..2601abe002d9 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6771,6 +6771,35 @@ data-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,x1e80100-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm@10002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x10002000 0x0 0x1000>,
@@ -6985,6 +7014,122 @@ qdss_funnel_out: endpoint {
 			};
 		};
 
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_rep_in: endpoint {
+						remote-endpoint = <&swao_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_rep_out0: endpoint {
+						remote-endpoint = <&etr_rep_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etr: tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04e0 0x0>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&etr_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etr_rep_in: endpoint {
+						remote-endpoint = <&qdss_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					etr_rep_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					etr_rep_out1: endpoint {
+						remote-endpoint = <&etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etr1: tmc@1004f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x0500 0x0>;
+
+			arm,scatter-gather;
+			arm,buffer-size = <0x400000>;
+
+			in-ports {
+				port {
+					etr1_in: endpoint {
+						remote-endpoint = <&etr_rep_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@10800000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x10800000 0x0 0x1000>;
@@ -7298,7 +7443,20 @@ swao_rep_in: endpoint {
 			};
 
 			out-ports {
-				port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
 					swao_rep_out1: endpoint {
 						remote-endpoint = <&eud_in>;
 					};

-- 
2.34.1


