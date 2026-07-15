Return-Path: <linux-arm-msm+bounces-119173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NfUdOf06V2oVHwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:47:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF275B92D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:47:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oy8AevXN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bAbIgFtC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119173-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119173-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 226F530DC583
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AAA3C4168;
	Wed, 15 Jul 2026 07:42:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF213C2BB4
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101369; cv=none; b=chELk2kB8rBG8BAyuj2sD9uOCxyjfQJ3eYHZ3z4GDu9pU3+nBDuzOzfrKs3YdN4C6RfYcg3yf5cjYkg1cCEGlh4T1pGpG4y3KcOZCKbAPV8eF1K+c8YAsOTe79PG5xVUA8MLJc8NjSZboarf1MT1JEja0ypRl9lY7AIAfXBe1PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101369; c=relaxed/simple;
	bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYcXUn28b0IOnzU3AAQ/y9Wg9QyE8QwvE265c+B9qbhAag5YlUiq9bdk3EQcRiNRFrrpqgFFD14GVFW6K39sujFvwEzsFjkoGtmRRpFQoOzmfsDSQyrASla4/eeETwhE+jFGLzbs/cmiwcQLswEPVJ/Uyg3ojfun9AtYboqikSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oy8AevXN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAbIgFtC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l0F62372467
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=; b=oy8AevXNB0LSISVb
	cX6v0nR5GMqv5EloE3yVpCLVujCK7v/D7N+usuLNkH325G5Fr5DVdnJOvKtoVwFT
	yME+mwOGU/+OKc/3rCTfwVq3d+TKFBIGPNeHJH+BJ8dR51KFqtb1tJipiMUZCZrU
	qbQDbVSzSUl19M9BCDIUHeXLge/kmAUyR10a+sesKw7hrHEq8AX8WRZOB8L40VIO
	91/A42gGSTB7vJECXJaG96fqQ1d4BOM4LCivw/c9JsuKfMj/ovw5fMcYR3ZuvIT7
	NNr4wbWqo9Cj7quPVEgZPal9Q5pjfiJaUEwWaAW4JNvsl2Q0dOOCzrm2VInbLyen
	4iV8iA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk3w5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so7798094a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101367; x=1784706167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=bAbIgFtCzmdEDhm9qlWkNeJaGcSq8oEdR290TqJjQC/VweUCCszm8T7LypMWJ/cZGD
         q1bCFNyw7IPfWm/XJY3WUaPQAmU38w2qTWx7EsQfVz0bTD6i+oDmK2B7tKPoSKc2K4lN
         p133AFPVk6Lvh+UiSUCvCD8kHZHktFgT92MNnVr6B0S6u179S8FjWW0qKzDDfgAda4Gl
         zSglTvn2uns3mrDZXAyg/ojciflMeknp+ig9/DMw4nibb5OfJGDgjTh3HnWBg2nZNals
         MTnOkCLVwRdDAs1yiYnqJohbDlHW0IYoFooI1QxN0RYy3uul1opxCBBcZeJYgDz3ON9t
         czrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101367; x=1784706167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=eLCmXrK7CuM1lq5/OqZW3xT79Rw4K5rkwS4O+CziMtncFOQFDm1dqusokr3PDK+TAI
         sMa+YLX1zLtXtJn+XSlFFroKIyTnrAaCEoHJhAuYCh/ZjFYqLBDp0KhRtD6PW+XRkDkE
         pNNGIVTYe/pRVdwBIonTYtIcH4x/rA3zlQEByIlyoZ89uLjXw1R/PjeKziAIPWX6kjj/
         ycr15P4gSsnL6yZfqNUes38NHvit+1Mkjj8IJzGkZn3TJecGgCf6VoPU0ZKP9F65sPeM
         WZpCZ4LAOKChEojR28LzBWWGN5bgg9aH91xx0cyWPmkCbaG+ZTni4qTarO2kdEvAThom
         Qd3Q==
X-Gm-Message-State: AOJu0Yy7AvraHCz4xE5aZ2DA053oMR2jefZRlMQUGfsUv7NN0OEWZoiS
	CNtlc/Hb/KPDMFA1Y6ATDkh9468N1bAMM6CIsdoETLbvqNjszuzOCqw/d2C6c/ZLz0o0KslwBFr
	azOOdEp/dmFucddOaK1qp0pJtvNoi53VdiQcymJ/tNZioE1pab2rmAIz8DycyhNswqhpX
X-Gm-Gg: AfdE7cl0WIA7YLr5UL0rMbL/iVjAt6wNVvBukYEzWXsQA4Stm9zjufjS5u/4a8OqZl9
	852SkLM68SQyI8aOe69nmTcXVzhxvkJiSu/at05YjhBq5+btzsh7WGcDsIZkc14CZs14DXuq48x
	osI6zLJdzisMaaPBEoGyiDAIkQ7IxAOSkCLxYkmM3vvtrmnczuozbhUj3RnjsNqqkff6SLe0/3w
	YY6ONh/KekxhZ0IlxKB8UnPCAFNXK6XPdQvZpc8DK1dUwmyrKcNqh10qsZ7OgD50lCCJ/nz+meg
	/lbfSRdGb2mcvHqgnKYUshUzYtOX29ldSJXrHWIajplrzKEDEmJczvGJSlbNr4MGSEHzYubp2EQ
	9QBonDLGE/0Tno5SpKljirIfxgwwpJw==
X-Received: by 2002:a05:6a21:6b88:b0:39b:8905:4e13 with SMTP id adf61e73a8af0-3c356f75e9cmr6753666637.6.1784101366926;
        Wed, 15 Jul 2026 00:42:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b88:b0:39b:8905:4e13 with SMTP id adf61e73a8af0-3c356f75e9cmr6753633637.6.1784101366495;
        Wed, 15 Jul 2026 00:42:46 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58e8sm10921751a12.2.2026.07.15.00.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:42:46 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:12:21 +0530
Subject: [PATCH v4 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-shikra_adc_support-v4-1-5e07b6d21429@oss.qualcomm.com>
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
In-Reply-To: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784101358; l=3268;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
 b=c9rZgnxZkorBvD/E85VNY3RxRUY8iuaqbn8uR5QIEmbZz64gE8NkFsn160wML2HVcfZG9tNVS
 usbtQcjVrkLCyG58j8XH7XOZtZGUOSGsMY4ellWfzgVYSvSbILk+jle
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: dW9g3nDZQEdAf8IbgP2V_4q8E-t7scYp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX2tUIHP0ck1OU
 qujk+AThaAEZl+FnXnLAzOJaSfpeFCyZupSvBbrdU0gkGSgtA712uijYcgdpGQJAjZnsjGA2ADT
 pbV/K3UpmK78OHeRiAfElJ1PK44phSYnuIrEN0RA6kl5bW4bZ4sg6nh44RCGOA8C09jrEh+CTLX
 1fFMY1jjETq349XKYJVZJsqcAeFxr3oXAHpek7ZDp25rq5ttbBG/2wChoswpNIQxzwUGwOI1npR
 Q9LjwwgYfjxYEkRXOI6PXxNvCIwarIyxNu7QqP6ZEg2vMfr6ZRXnZcmDeCrmj+wwGEAfqLITzPh
 NQc19XKESDlSqbdSGlgmJr5rD7M8Jmm5d+5FAWN95uX/t48KW2KQZakYkh5rDpAxx2atxE2P11G
 JMzww64qO/0dvB/1C6ma5p2dGYGyNYunyl2SQUjMuiQcE5xlvObNBVpZmhl8OhLP19+wt7v8uoH
 vBZcgTJzo1YVk+GTlZw==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a5739f7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=32WKvE36LqkSdRhMvAkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: dW9g3nDZQEdAf8IbgP2V_4q8E-t7scYp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX03dpNCA9E6//
 ZQ0TYTYiEg6ly68RNnZ/3addanryyOXucx/aJ4FlGdGWC2tdNLS759nAhuVQWd6L1qowDNfuT3k
 qTfzoW9GY5cboQn3v03tjUUWqkR3cNA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119173-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56AF275B92D

Add VADC node with some channels under it, for voltage and
temperature readings. Add temperature alarm node, used for
PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 104 +++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 3dc8d667d091..77de9db8c119 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -8,6 +8,35 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm4125-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pm4125_tz>;
+
+			trips {
+				pm4125_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm4125_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm4125_trip2: trip2 {
+					temperature = <155000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmic@0 {
 		compatible = "qcom,pm2250", "qcom,spmi-pmic";
@@ -65,6 +94,81 @@ pm4125_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		pm4125_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm4125_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			/* Channel nodes */
+			channel@0 {
+				reg = <ADC5_REF_GND>;
+				label = "ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <ADC5_1P25VREF>;
+				label = "vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@6 {
+				reg = <ADC5_DIE_TEMP>;
+				label = "die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@7 {
+				reg = <ADC5_USB_IN_I>;
+				label = "usb_in_i_uv";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8 {
+				reg = <ADC5_USB_IN_V_16>;
+				label = "usb_in_v_div_16";
+				qcom,pre-scaling = <1 16>;
+			};
+
+			channel@9 {
+				reg = <ADC5_CHG_TEMP>;
+				label = "chg_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@4b {
+				reg = <ADC5_BAT_ID_100K_PU>;
+				label = "bat_id";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@83 {
+				reg = <ADC5_VPH_PWR>;
+				label = "vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@84 {
+				reg = <ADC5_VBAT_SNS>;
+				label = "vbat_sns";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.43.0


