Return-Path: <linux-arm-msm+bounces-115848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AThNGFwWRmpcJgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:42:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C74F6F44B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:42:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GFPnwKRu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ADws6Da/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115848-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115848-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3F9130B624E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D04392C4B;
	Thu,  2 Jul 2026 07:34:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15BA3921E7
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 07:34:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977654; cv=none; b=g3H2iRcF0A8b4ipnQPRxSqz1aYuR57Esrzj72SYksJBsl3du9DVj2HBzCAISCc6sRPouNsJlTqJR4aVmEGUrpd5psvepbRpt4qF8+DrZ3eNdiJl34IYcZF6alsdw9xYqtzQxqMEui73biGXuhZGhafI4srT/5AQpszeCzQPm9Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977654; c=relaxed/simple;
	bh=B+5F0jXQKJiQbvv/XTXZjn525cwtwuKuRgNUoxwKI1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iCq/d15iVDUaF2kEbxbCgTtpcMpXYwYAt8xfhgcvSfv7jFAD3VJ0JbT3JIGXWxnVfM2CVxEMr/WCtoHOkqxbeGJc2CWx3ea+xWXsFAflbb66wBne+nD9CV/oEQMdK4wcfXdQO17afZRvoFDPDDHa4b+pl/DcWyeZlFcMqAieV8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFPnwKRu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADws6Da/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KMYH2960153
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 07:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JitEdvI6i7d
	f8QMRAibL59DICOV+9hKv9N6JWPI62GQ=; b=GFPnwKRu188+Ve0Co85KecIiVff
	c4VyemtlfV8/zZTC4H/cfF4jP+cO+bvPKXhsK+v7+LndnGMdHCYmq3bbm15q0aEw
	jPYbVw+IStGn+UKh+GyH6g0jX9o9tiG9YPA1dR+Mqr9TVFAG3R/Sg1AzQrdOs14r
	hIt13i5N/OmOC4d9586tBx/po/pLgnJkRCx9H+ThNl3lFzb2P12Xl+WvLvz8sKGy
	Ed7CFbnfXF1uWBcxa6Yg3Oy/5fw29nNj2gt3h8n9jsj/pXJ3NAHxdw3MWyoKLD4Q
	xQpbppD4kFrJLJphhV06k59ChfuFz4qW5n0pYlK2LE9eoTLUquF1V7DM5fA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mk0w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:34:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2402075a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 00:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977652; x=1783582452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JitEdvI6i7df8QMRAibL59DICOV+9hKv9N6JWPI62GQ=;
        b=ADws6Da/GsWtp3M4Do7OG1tnhOJGXV2+Ef6QfaficFvnhFx+uOj16gTYRnpQ5yf7xr
         Z0E2APjbEzlPdODT8fTMBoOqnDGGmsyxdz75vWw+ygtstTMOKt0t0sXBoHwC0PKQL4tA
         bUUlCui8BSz3uh9rH8i5iiKnMzsi6m98hx0CBF9d9d/RfYm5J0oCpY/AJ8foBmphJkAJ
         PiDUy+hjSIliKnmg0GIFCWgYSk57g2uOGRQAcEIqJaHwqQOkLcrghcL0R1heAFZM/6eB
         BbzyeL+LH9fGO2/1HgsUYYXMHKhbvW80Nqb9r/y21r0ESgKCu8vuH7dLVO9hqQ1R+2FX
         GAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977652; x=1783582452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JitEdvI6i7df8QMRAibL59DICOV+9hKv9N6JWPI62GQ=;
        b=dbzbRPFopWusPWQq5mwqUhoOLGsXLdE6IEMXwOwkgUmI6U4VsUe3XvKNZriFz/rBm4
         /+4cmFENSol1apdf+QUADPB+SAaBCz+DAo3Qn0DRZMG4Yu5xl1Q5e4nqfjGLt1T5urPm
         MsYc4wRVLXKEj2DVJtEj2y0M47Xo6oF2iKvaZSyJk44IfPDENEZtw+RaDQT/PUpfycLe
         PBhcbjQ+0cfcpJnJGX6yaSEcO1oBVQiUtbHJ/H13oyv46VRbF71xZ3O2r2CXpuec6w0X
         qHbJmZ5oRmRHmjeYyexa3xLvK8tYLtb66r7zpzrYnz6hGsz8qANxddYMpKiTox8RArYl
         pBJA==
X-Gm-Message-State: AOJu0YzSiUi0u8nHKVxQdSNTFynqeLQIQYyelBbUnz1gandT3z3avUFl
	2MZbT1zqwYa+81xVtXx5QhJpoGdZt8Q5uHDc5daElfAOnoTjDUUwBxU8x9lG6JuKLKpHZB2l5Rw
	d3QgTvpNpkM8o6NUYOgMd8HmYruXYrZwSZlCMYvRX/tQ1zXMPZb+m5JkkybyVTqUaL4Mb
X-Gm-Gg: AfdE7ckqpjUwd9xXkzN3w0OHjPJ4QJIn2nt8EGUTai6dgfdmJjeBRlVCNmZ4dsbc1Rs
	UUpkrKs2L3MrlnKckv/Hkw86LDRUvv2PHM+p8I0HrsPIGCJ+ZxkzRbxRZ4eC+u8M83LlcfQslMT
	VKTCG7WHRxdJDWllR9G1h7fZaeyYa8Ndvk23C9aXZcJUHVjSh1cbpw6GwIV2VdhhVepuOEnOExQ
	ma89PcWHjl41DLtRes9mE9StNav5uVvs9ybyBLO/J0+1UAqzIr7DhwUKez7LGXxoDck8QX5YEBK
	DTL8QdyK7+OMAIrPfxUpfyqdizdVA0ib1klvUtUu5KxS1V5ZhJbQJxnDlIexZ5jBrKW4A984QBO
	eQpsb6VeMxe/W8+d1P/HIBO//5XbDqUyYSuFGG90LjAwg4w==
X-Received: by 2002:a17:90b:3149:b0:37f:133a:3e01 with SMTP id 98e67ed59e1d1-380aa0abadfmr4951441a91.4.1782977652163;
        Thu, 02 Jul 2026 00:34:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3149:b0:37f:133a:3e01 with SMTP id 98e67ed59e1d1-380aa0abadfmr4951392a91.4.1782977651604;
        Thu, 02 Jul 2026 00:34:11 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e163211asm587380a91.3.2026.07.02.00.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:34:11 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V3 1/2] arm64: dts: qcom: Add SD Card support for Shikra SoC
Date: Thu,  2 Jul 2026 13:03:53 +0530
Message-Id: <20260702073354.3641966-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
References: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5Zg9uxwMWTSgbw-K3rCr7mrzCuSROOo6
X-Proofpoint-ORIG-GUID: 5Zg9uxwMWTSgbw-K3rCr7mrzCuSROOo6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX13+sUzTE0ixs
 kQJjwHmaD3JX1Ax9N5QeSmD0E40G9gBA8pGYU1FRbwj1a60abejm/OdUWbcZ1HcC4aJyoQq5Y2C
 +/iMoh0Njvu7l7IoHfDaHoijtMhG3lQRrFZ/nEPvEyvFpLw8PjDYdA0PUINtcShsQlFeoqF0YME
 2MNQIB8foy5IACHY4jwwhRrJyzPtKfKX8k09tgNttrEjcYvenxDyONYrnjwCdWTRGwKpuuuTAYR
 4WHHZ1lkeVKkJVp9pDDb8rL8e2tlTBdMAH+tegqkq0JEFs1W3BYK8vXFxxf4x7YqFDNncJnCsob
 BDx+SYNK2kKwTIPVNSKWKHskAEr5FeEqfBPH4eFYsc4YKscp2RdLUqoxHmYcO4DKC2KDa/1RnjF
 pNYwQa0DvVfMg0T0Y7HdIahzXJaeHhh0cqXSsmfrfcI6K/iOeSafErREGsdNJGwf2r7fYYW6fc5
 naPimkUqQMmsWmGf22g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX0N6ETz69hbb+
 5/btpfm7cyHOUoY/BCizE62PwxrZ/gCV2ZT5CWIoa25j19CPH298yG+ocKi+H00Qh6M8KQAjVSh
 +Hyj9tTchi+4yh27UdnFNIKRoJu4wBc=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a461474 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8A8miFJkZQRJ8vCztksA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-115848-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C74F6F44B6

Add support for SD card on Shikra SoC and enable the required pinctrl
configurations.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 97 ++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683..02997d603099 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -829,6 +829,53 @@ rclk-pins {
 					bias-bus-hold;
 				};
 			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <14>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_card_det_n: sd-card-det-n-state {
+				pins = "gpio89";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 		};
 
 		pmu@c91000 {
@@ -1081,6 +1128,56 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_2: mmc@4784000 {
+			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x04784000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			bus-width = <4>;
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x0a0 0x0>;
+
+			interconnects = <&system_noc MASTER_SDCC_2 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_SDCC_2 RPM_ACTIVE_TAG>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table-2 {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+			};
+		};
+
 		gpi_dma0: dma-controller@4a00000 {
 			compatible = "qcom,shikra-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x04a00000 0x0 0x60000>;
-- 
2.34.1


