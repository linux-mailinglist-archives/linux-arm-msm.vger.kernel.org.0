Return-Path: <linux-arm-msm+bounces-115894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7YTLBbo2RmqCLwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:00:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8083C6F597B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:00:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ONU+GrkJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZkeOO1B8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115894-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115894-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D8463006165
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9785E49251D;
	Thu,  2 Jul 2026 09:41:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A22F480DC5
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:41:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985289; cv=none; b=YhLsgmYdyEWUTqyYlNQ18/XjT/6B4BIqU5NNkROs5lej6P3qCct9PZcf2tpOwD4rkNOR9kV7GEWTrPCDFMprUnGqxYhKaCji1HGD+OqWWHIVG46VnAWRYgOJUEgFUnk5GY4SeB4PiIolXj5JBkW0ONTzkH8c27q+x77OrLXaqXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985289; c=relaxed/simple;
	bh=e/d9Y32G5UNQuUM4EwtvkosLXFUT+qby0rqA6HKsbQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f+dB/aLLQeU8WKTenrBca/jUkuTDb00vC0H4R/Zd0WOnGCj1wiRDAUa+TdDF3bVRBvPBy1Ti384jOKT9lOTJ0wYtSgGtlm/bpqj1lmMhkLLBTYNumFMQLC+36kMOf8KY45neWpjvUMQ3fp7mhSZuHg40Ij27eP9NlehqgaTin1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONU+GrkJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZkeOO1B8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624iBqN3591072
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiXIqW2oqeN
	wOVB74YpZNvpA4JBn5gUrwtWAT9Tgkp0=; b=ONU+GrkJMR7AwI0nn9fasMEP7+O
	9DYv6YPp+OKh4LL4s7GXpZhAKSGLTjgsGeGp0w8UifuHWVFXvGTGSy4IivhOwHqV
	iGaOuIN+SwuRf8I0651Zc1KUR6gPFwsTjQ/Fj1TFRN3HM1cp+e24trQiehgMEXqb
	QoLRJurHm4nMqtYPbMyHjSAVyyBpwtZ5BXPmuDJe/wmsCM4cPdJAi3CmrmF9/Xvr
	UUiYx8lWtpwO/VcDcjKHxW9f/uQmG7Z93IaEc/2GsAkF+1n1NV3dc+E4ZWab7kTB
	ASlzMnxp3+EIwA+xjVFgC02GZbZcQvKI/rc5FAK0M1KTWctd6hJkjY6BiDQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n938m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:41:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8478e9c4bd2so1802568b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985287; x=1783590087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiXIqW2oqeNwOVB74YpZNvpA4JBn5gUrwtWAT9Tgkp0=;
        b=ZkeOO1B86XtY3LR9xWs9Dc8Oclcgh6Dp0o1m8Xksx8jGAsm9iQm29eYentgxLNsIi6
         Rd8ShKKqFlaHrg6496HTjXh/mznWANTWmvwqcJ5cGvDdYiwAbgpxy4gTdkVCfUaf8dkl
         HyG7XSJTsEjPpyvO4iP5c9/UGw4yN45acbSRtzG/iQAbYeK2MIKxJ40sR/qgUW8Xpyl/
         SFL1+0/H1iIbGOkbjmSQIBsr4Hz+7T9lrnRbQ4INQQhOP3NfjvZbIs/CGbG7ybU2i2mx
         SqVfldMvC8DGLp2IuG3qgqxvhTHFwTj6nd7H7x++igN4lKLeiPJiprUi95EDmia3MiK/
         QZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985287; x=1783590087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aiXIqW2oqeNwOVB74YpZNvpA4JBn5gUrwtWAT9Tgkp0=;
        b=ZOGPVHQ2bBpgKtYYSEp0CHgXtOds0AxC6apnj74AjNnHhohsoobR1m3l8RXrvPGFzi
         t0uQUGgw2pXQYZYpIpN5SOnQ/ZzEiPAzzEAAhgeEjms3VbPhCkTfV3sQFX/ELItyzR+y
         92fkyMoXOSoF/vGC++rCmW9y4MIalXEq8dPKJRFx4gjcWCoyvxH9Hlsg4PqgkcxN3nc0
         +VlR6vvHSi8N9ghxvzKQ8dwhdcdNRa7mKABcMEYXlO2lwPgcBIkT0Ch2LFcFnkbKVi/r
         AQyRKG42QK1u67yaPusm3yBFDvZSq3Gy/OhhWcPyI0E5JLX1WFyVKYGGmZaEHjpw+6L5
         ZSxA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7tFy0E9pKSb17g2+8Zjn+OGWwnHgXmptCIKIz3yj05T23X4HHIjKwDsz88gCc1ObfQe8vp9M2PPnoPm7M@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlahsqSdahlZX88iWT21ROfILhZN3FBg22NQ/xNpLYVrkLX/k
	VcYyhGjN2EJh5W+WZXhYLEzNc0njOSKH63XYaO8CA8M0jVIUDTIx3r5W+eGfzKbUTA3FRiqkXAW
	8d5PPJcRnbNzWulJkoaT0eN2iSFwJ5R/RUBjKT0oWcbATcsTSsO+mpDQpE5jYx0w+goAv
X-Gm-Gg: AfdE7ckmJp76hBMGnm5V2kYiKMnB4rNaGThdwIti8e1le0uoADaWRC/kfdat26xxIO6
	QLETjzSEe46ja9uKdMOzOiDy/9qYpmHNd1C56Ul3fR6GEj6jzAsyVF6VxbCNzlqjQOE/3G9qube
	+Q5aZc1nI+gRqNKHn9JlzjZwu4InFUuJIUhojEqbx70QLmflk2Vxda26lQS8Iz+mjGAUkdkeg6y
	aH7Fg0w6NXHXATVWLr7UeqTYQZAeb2TUZHEYhcNCU6koVMzoHJyZr7XYcCrbLd7RT/WWW/0pcj1
	W3pL7p1b9Iqw7rtTBh6sgCPjzq9eHZvZN8xCXpuAgksFz8YduRD2Sh1Fk0CbOMsMUK2/AadgtsH
	GXruWmI7n03WqRPYh6L+y826CEWQ0dI/zOvHCew==
X-Received: by 2002:a05:6a00:464e:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-847c4ffed35mr4034039b3a.2.1782985286852;
        Thu, 02 Jul 2026 02:41:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:464e:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-847c4ffed35mr4034007b3a.2.1782985286399;
        Thu, 02 Jul 2026 02:41:26 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb75d850sm1141595b3a.19.2026.07.02.02.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:41:26 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Date: Thu,  2 Jul 2026 15:10:56 +0530
Message-Id: <20260702094056.3755467-5-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX7fmWvSskNuWh
 vGKTssMZYdwIXDdl08rUaL7Kxqq/VhjOK1eCF1JjAWx3E42lSs7OJ95q/BzrSp5p/KOK82LrpFY
 hFHNxV0iNrbwp3qL9hP2CG1gOeszZ3Qw0j3o20ic5Mh/S9ra6gnJT+Pb4/XwYwmBUoUQSHZ4s+j
 03/Hp3V9Jlp04NldV2jp1nExgsqokAhtNBEG+KLFRDtQ9kgv/hLEeXXljMBPj/WGaCA6EQQAKZJ
 2+3Gi+3F7VDteH6MCJJDRVx+mHxMAYtSZCMPNZBQ9onLtdFSmr6vzcSDIVOJPAi/nP2czhrji+7
 cLrISzprc2TdDt+3j0sLpOd3ixpcXaDXW1ruZ1cXncFCDfKx2JoSofcjNiY/zkdmcnwXg8189Ho
 A2OtG2q2IQjN5s7leTquTKbSqjz6zl/VsJDV04pi03bqZvYvAT0BibKsb0dRUU1M4SCOgZxe9N7
 pJaNoHkmwqJaIdeDqoQ==
X-Proofpoint-ORIG-GUID: 7tQH8rX46qP7OPnac1I0M_T4bxp-uZSK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXwzVD3VMEjmIl
 3plfSPZ+Q4esmmEwWIS9RfWrbrtxh005Fkjc3PJ9BZDCkcc72kdpfaB5WzDqmTWJZhMEQByjOdf
 AhqDepCOAx+ZQ2b1RIrkftoJcchgoAg=
X-Proofpoint-GUID: 7tQH8rX46qP7OPnac1I0M_T4bxp-uZSK
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a463247 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BFOuVXoWwltGLQr-ouQA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-115894-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8083C6F597B

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
regulators and gpio-based card detection for the platform.

Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..48407e47aaca 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -268,6 +268,22 @@ misc_3p3_reg_en: misc-3p3-reg-en-state {
 	};
 };
 
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9b_e0_2p9>;
+	vqmmc-supply = <&vreg_l2b_e0_2p9>;
+
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 221 GPIO_ACTIVE_LOW>;
+
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
 &smb2370_j_e2_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_e0_1p8>;
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
@@ -319,6 +335,13 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio221";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &usb_0 {
@@ -427,3 +450,4 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
-- 
2.34.1


