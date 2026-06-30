Return-Path: <linux-arm-msm+bounces-115519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CWQSCMT2Q2rdmAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:03:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8098D6E6B90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:02:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WHjaNpx8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iOl8RRta;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115519-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115519-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3FAA30CF98B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806523D9024;
	Tue, 30 Jun 2026 16:57:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9463D8132
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:57:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838653; cv=none; b=QaMnQk6m4yjldV3PdoNJN/mz9wuP6QCgqhVoYoVQLWZZruCy08CPd5QNHsSAu9qsPA0pKr49dQJ75JvA0f3VtqwiS4BqGRmrzirG4GkSCFheuSxJw0kY8Ky7W2vkYNpIJM08np/wVTHpz/mna70cRUYjsePdzBFnwZaL0CMKYH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838653; c=relaxed/simple;
	bh=FtSrgC45FXuU72qtV83eFk9spgUvKjy95UIvIbL30ec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mbzU96wIZrnlNzSJJeLjR7ALPyS1UjlOqbde2rcP0MhWZXUTnGNKiecXoEq3uVKIrY1L6VhKtTUPAzXHmIiwNHadQ3a0tlgs1SkrBj+XS4UDYhbnjSlLsFQtefF+ZEyDoxGi2So0rhqTgk2TNTIMuobdu/EHvlLz+bY6yLPm7WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHjaNpx8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOl8RRta; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDNmU2214648
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8YJC20VUmc8
	hG0TDIKBt7XhKJfZsFAsHt8W+4dAsV2E=; b=WHjaNpx8ZdH9l9N7AKcn3RmsStB
	L63mlhqo9Z72bhGi2ce3/Y20NPtFwoo2DatKVDWFL+Ajot/VpaTVa4aPKDmSBr6Y
	iRse/RcZgPvYULW6A2Tm+JoIDGE2yrf356yQC2f64bikg0kbAnD1CKXMV1te0DWR
	5njWZVHxuyhDaYZeUHDUDLxs+GJkTVjhJGl8qm9xL204i0JimQGK2rYvwY5cUcpR
	ueXYrmXsKGd2iwq9dxeSP4tB0cPhnR0yDCqZAWN5CWfZ3O07fSnExcI/M9eqU0la
	qWaSPIyPFbX+PCRIqHPZgWLo257koyjPdo7NKnwypFUjE8ZiAjesjjOCNZg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5uj0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:57:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137f3465368so7160181c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782838648; x=1783443448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YJC20VUmc8hG0TDIKBt7XhKJfZsFAsHt8W+4dAsV2E=;
        b=iOl8RRta71U5SEjbdNE7NBZvbFGTmsdn+oHe8DbM8zimF6aU9rvEbqN0ysbY+RkaQA
         OE1/mDPQ0NqtjPmJvAEBmsJOccAWF7zHr4LFKRu7fCKkNARgiXKreBpcQTzejk52rvwZ
         lX4EoUleMeRR9Q9eHWbT4dXcCrzqo0Lp5k3hcc32b2CF3VKrC+JKXmypdvtlw8oLlfT4
         IYE274MZqivNtmY05elXlb+/ZyNY3MEyfWwvAg5ee24Tm91E7Fj//Do9G6yfxzqUq85D
         5tRa4HRJVZUl9otpHkXAoAxCOVy0jkW4JpmR/isYtQ4R7G0FLkNnDBHuOQaC2YOafwxj
         QMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782838648; x=1783443448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8YJC20VUmc8hG0TDIKBt7XhKJfZsFAsHt8W+4dAsV2E=;
        b=c6WkJLLebDjW/7E3tuC4ZHZFUtagFbeT/hn7csklDkw0iK+sRaBwQsQS756WOhhzWe
         zN5185G3dZiH41LtTyglkjOsKr1JfGjfrFd+8Ax8KG6FiUVARVTBEsfSX89n1QOuGKWT
         3wjRzbHfqKUEgQb279vZdVfa778J0DIDINiZZUolth4E3jpAHkCEsf1l/uONLPFeHCR4
         Yz/pMnnDQtzWOntX9O2tFN4CwdF0jlOWVRMASKjFbc5TzSh1KUNzIsAwvyp6Ouc7emVf
         tMUJXpu1azxmiRkUlTxXEWnERkn9+1oHoraJBpl6P/08JxH7GwenIJQCl+awIBjBcGsq
         RWmw==
X-Gm-Message-State: AOJu0Yz+x24j3TdtM/4FGBXnSYJodtS3kChClxGarEBHqkaNXejIGoke
	HUPfRLy+0cipcx5+6EyJ3FY1Q9F2Js3fRNyEINCHRS3yi7+QIvH3owcNl1fv903xootFmV07Tea
	JDaCZdEmKA6v2yUodiXjwzkrmidatOhl65zYEQkkiaO4qE8FRUBo9TCXuEHbCl87HkKRj
X-Gm-Gg: AfdE7cm3S7zV4UpJ/T1l41sEsPEIJpFkY6jM4hlm331KRG7EXYyCP+iRTO7dlJy5qud
	EvwuVtrn7LnhXEcmOgIAzFlbM853xBTU6JV2P6dt+qnuHWM9MFcxgvqBa72d9dXXwqMyY+2jMMO
	3gidPYbHNocSBaj5TN5W5XeTHkFLvqUibqeBLG7R2b8xcNf4MlJFi7guBwYxplCaiEE4Zgh2tiX
	c3nWL0lUDFKHFmLR9uXHO18dwz1c2/pwR9hw/ruNjmi9LoBfdM55bQjDAyUBtKk1QXV0WapVxTZ
	Cv0cXw4HFHzjSHF/pr96WyRwHqWy+hbzhxsy+9HUQriezIdhcDTJ1/CdpN+VjXgX19oPDqPd2HA
	JaK68VRIIhN36T9lStSeFdGqWgAHolaBs93/9YV+rmqhQcg==
X-Received: by 2002:a05:7022:1e10:b0:139:f6bb:c907 with SMTP id a92af1059eb24-13b3142abe4mr854586c88.18.1782838648452;
        Tue, 30 Jun 2026 09:57:28 -0700 (PDT)
X-Received: by 2002:a05:7022:1e10:b0:139:f6bb:c907 with SMTP id a92af1059eb24-13b3142abe4mr854548c88.18.1782838647886;
        Tue, 30 Jun 2026 09:57:27 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2a9b425asm12690272c88.0.2026.06.30.09.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:57:27 -0700 (PDT)
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
Subject: [PATCH V2 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
Date: Tue, 30 Jun 2026 22:27:00 +0530
Message-Id: <20260630165700.1886608-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
References: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43f579 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5uGxXp5b2Q1zeZBlDmAA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: bpKE55bAAMpcCp4TVWtqu15cGQlUctSH
X-Proofpoint-ORIG-GUID: bpKE55bAAMpcCp4TVWtqu15cGQlUctSH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE2MSBTYWx0ZWRfXzD3CW653Yhcc
 scLSEZn5OSqQVJjfafRslRAR2EYGVoFmamueMx53tdq7OBKjKwa20HNYbW8WF48F4Z0NCikDDXp
 CebdnED0mfIxtCCFlk9ZXrvgPWost5JfrWLB/Rz+b5trCg/dVkeTcAKlJ/3EbXSvR0gO5IZZl3r
 1Rwdbf9n/QwqcJbWnCg9T7RDYuQJ0M1e5GtuwVHAmRWG8YmpHCsqwHLnPc1/kFDOMZEUznmrjBF
 3iU0yBZskIzih6jRIW+YElaoskosXOw7ZL9iL5QikRTjtj08wSyXVeIKOQ2XrkYr5exacOpNYTn
 5SeZ51k9AsIolNRDc2EyYyIr/stcpFCJw59emg4aOWQc4UaDYgLLGb2J+vvbNIUopDSzpcsGNHu
 XHl5cR8qxegYkSsP4OcotK4aaa7R+pJT1qEfbgSkz9Yw2trK55xyXNhxxW2SQ32dpPsKynGHew/
 VhQ0EEV5hf4DniV+vbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE2MSBTYWx0ZWRfX7nOQ5bL9VZm3
 JLip+fB7v7v6s7iJHw3l5DDyvVvRCX1fKThV0W8DKPui+HBhn2b1Gmu72qH2od9cR890Xr4/SAm
 E1UINM6n1DUoxFTovuyiS95OAjIomgo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-115519-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8098D6E6B90

Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
vmmc/vqmmc regulators and gpio-based card detection for each board
variant.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923b..8212bd41f74e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -95,6 +97,22 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819..5341e145977c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -95,6 +97,22 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa..0548de0d3a74 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -103,6 +105,22 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm8150_l10>;
+	vqmmc-supply = <&pm8150_l2>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
-- 
2.34.1


