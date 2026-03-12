Return-Path: <linux-arm-msm+bounces-97256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHs2AgfbsmmCQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:25:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 716E627461E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A69430BB249
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C803CAE79;
	Thu, 12 Mar 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KuNHMZsO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvkkeIM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413383CA483
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328478; cv=none; b=NaiuMqGGmpB0MxhGgMwReh/+trqImkKSEZXC3nZQGiTFxS6iA+qT2teMxlvyHr82kjcc1jOu2a49Ue1uyYgPyTlff2q7zQCsY8EYxOyNAgtxBvwedSUk5GQkrKIRjYa6G2bEL0RLzY2MeZrYlgm8zCRYsSbvjx8WzX9Kznn1bfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328478; c=relaxed/simple;
	bh=eKAozrQ4xY3ezZ+7fjpNR39Vr/lnm61hf+9j71Jz9qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eem9j+kZQG3h63lM4zrXBK9bQmsF5YyhonYAwD+2Xkv209JLXDZA9puBujKHB0alrrzAzLKdP4q1j1VEHYFVG36GLVyd4s2bQpjmP3A+fRoqejSlJx+dux05IOF01nfEl95fA9kXFqjfhq4/wD6cccXUhV+HwsHQd4NcUVT90QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KuNHMZsO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvkkeIM5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CACpnM4025778
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xED7xEN4TjTNrU5iXSzFR8ZMiko58ch87aq5Y7kzU5s=; b=KuNHMZsOmzOINone
	ZFNqGNlh4Deg5591dDvy187UjtYYDeYqUjePW9nt47veIpGvsdiesj7vfat58nmL
	93Z3QE3j6ZiAw0kSy7NfTpFEeVvJukViB3n5xnIWrcyp+KLoC1lcgyemp5LVXkt4
	pur6Y8LydoQW68lpogZGpPP45O1V7wLSkB07PpG6ZRO+yWCrN5BvrFdQVdGxxor8
	Z2GoQPl4hN3XwKJeQa6G1JZjTur7BR+37sjUN7G4Kn2b4w/prKgn7RoE+styH6dP
	NBrMNpX92nxTFcCdInqZhh78Uif7JUuen+TX9uPlnnzps12G4NiVxQAi9uhd1/Ck
	u8qKJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50tgr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd80bea54dso656029585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328475; x=1773933275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xED7xEN4TjTNrU5iXSzFR8ZMiko58ch87aq5Y7kzU5s=;
        b=fvkkeIM5KqR4t6/JbhPwh34d1KLkqW6KWgXily+M1y9gcOf4juhMDBW5FFL2dLX0Ys
         yfhC2egxeV3MzjjJg8ZW29q0z56c+CG1fSrnIWJxzSEF3uqsfK3Q07FDZ5Sx1ufe/9ww
         epcIIioVT08pXIWnTVzhlKPGbkzX+4sKlSEnB8zTCLD8NcgWadvbN4ZP58LIPnJOb4Z3
         SeFRA0pfFYsrzgxAF0meDUmo52CsMAR1ikpd2Mul25DJwNFDptW67HScTR7zIsQCMJz3
         Cqx3I76fa+8ahYQv2Xsgj+Lrkzqau4lZjtAfx2Hl1ENbjObBhWDtJHf4OKryzfhjMoYL
         CKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328475; x=1773933275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xED7xEN4TjTNrU5iXSzFR8ZMiko58ch87aq5Y7kzU5s=;
        b=VEZivd0sgl0yPnP+UCUxAjnH6tCTAu4NOpYFFTPhh8453SKDT/qPwnAsivHE4xvBAG
         47JEnOxx3Ds4wfHVs+FgYcGA4oZLmTGNuQDzzWrlrjueasdsCOKaENYT3kS/d20M+YKl
         kQrFT4FSjliqbL95DNDkwjlq7/iPjur7o+8cH3PBDqNXPztIwE0q5B86NEwNfuia9y4R
         XR+lbBRH+XaP7loLgUQnXvlGo8oeHYJgL6oqfBO2yJb8yttYAtTb8Pp9zKQCY0cwwKmj
         RzjgSfefrtlfsYsjabw03M0wcxxmdzNN/mZfs+Wxho1+eA9u86503jc6RVSTHVCnL9rr
         ew7w==
X-Forwarded-Encrypted: i=1; AJvYcCXc2VCIh/punxNEWqDMFChZcItmXcTwiSST8zWs/SBPuIc5YquV4fwYHGtCRIZtOIYGrnVg1+tBrZDlSioE@vger.kernel.org
X-Gm-Message-State: AOJu0YztdPa4OwRm26OPx9KOjSNXmDlGY2Xw6RYdJCDB2a6ACvDvvKuE
	D75uhTYMxONaS2+mkrMiZ6t2zW/bU3jrARo2CToj/DYGEqCHOfAhO8jy8sFICXlLq5jqP+BOIbY
	/MIjWQXIdMce0B91nd3b8xKsps7FJ0vsOJ4yFRyiO4S9friHn7VxeYUXaB/olAf0QOOox
X-Gm-Gg: ATEYQzz7lJPFA5jl2FZB3feYcD8s0m8JzH7VS5oZkXVGrx9fE9L2DI18f1eO+8EQA+F
	ODGSxgntzEPW4QIJ83rBA+iVyUlyBjrCkX0DmupmUOi+PImEPoe3oxS5i06pPy29HsnG8GpnRtn
	VQbqapzmJpG7R+FSA5eiP3MdSjmuWoIGAqNSQs2OLF/vh4WuAUDseRohd41REbCaKgsdGA3rffY
	VLmwfbi/+yuaUA15DEjHPhCibT1K03EoPc5QM94pCgH36YrdYGgIPTQKF/gPB/zYf/QS1LlaWFz
	MW8iYmNR078gJINrSRMJnesc6pu1dEl72kgvLetHPv3FY31WfJyixPtnAuekYCChnRCqUfJch93
	0igNFBVT0+UouAgEu7DEOWQzCTOIHgeWsFgrjriwT4vRVSLq9W5ZM2DMvYquw07EPqLhjg9BcCQ
	hL+e9U+Efty+YOHgDk7GHSWyOEnlHUQtR+m8Q=
X-Received: by 2002:a05:620a:2a0b:b0:8cd:85e1:e201 with SMTP id af79cd13be357-8cdb5a17fd9mr10917085a.11.1773328475568;
        Thu, 12 Mar 2026 08:14:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0b:b0:8cd:85e1:e201 with SMTP id af79cd13be357-8cdb5a17fd9mr10912685a.11.1773328475110;
        Thu, 12 Mar 2026 08:14:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm972822e87.61.2026.03.12.08.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:14:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:14:26 +0200
Subject: [PATCH v4 5/6] arm64: dts: qcom: sm8350: add Iris device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-iris-sc8280xp-v4-5-a047ef1e3c7d@oss.qualcomm.com>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3647;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eKAozrQ4xY3ezZ+7fjpNR39Vr/lnm61hf+9j71Jz9qI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsthRIr7rtq1/pB9nZ34ZekIr3uo0Gp67FKHfs
 S0O31N+lm2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabLYUQAKCRCLPIo+Aiko
 1YXIB/9d8I3nIzLbz+CrGH34ZYe/jmWl5OkbWwNUq00+TCd9VpSBsl4WlrR2RkWQr9GdrbaKAKB
 2NM/htvljw2Aqt36Vw8sKLEyDDhEgt7vbpiW941Gx+onh0O2RTTPwFjhxQSlj2b49EwUyzAPzQY
 wP4CW3CknrAkmlRgiuspqR4Obde7stOsewr5/N1Gbj31DrW4iq9EXK63yC2pXXbE8ookYxAXSpd
 TVyM8QB+nRXaIw1Bxedn1AVty/13i/01rK3SJmdsNll4+/WEIMtAObeNNA0nhlAH81UzyWcUbh0
 2bOs8w+ccnX0j6j8zhlC6xG2JgAZk4RtTR1ncYIizwce3r/Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: QmuOZI_W3ELtVRo5LJUoIyjWbDvwdkMd
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b2d85c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zXEy-fkF16KV5FEPuqEA:9 a=WGqYyZY0-yHm69Mv:21 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QmuOZI_W3ELtVRo5LJUoIyjWbDvwdkMd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfXzP/MLxfmX+Hr
 rOIzNy6ECZAULGjjnw+oWKL97G2nawVCSaUeQEt1SV7UONBYdc/hvPZagIRS/eouLhr2dY4au2N
 jlr7oH6gMeTDczJX08OT6/L3lNLNrxCp/2dBSGs73rsveqx41J9ljUgxtpbqR+xM55P0J1IG2cN
 Oivzd67vighhDgwSid+bFXQcwkW6gONKUXrY/F8LOp0rWtSikjeQ2ykDHm8IjfqTzORmhG5Lu9X
 fHtkRQYoTSwKbM/nswWUsLIv2Kwg/iXqhI2LwqlhbFA0HeJqvLQ+BkDAYf9y/UH2s2jVOEzMc+3
 vd0F2L7gnUlkieilEF+KhNYRAJUXD/jRorORqIhSJ09JURWe24velPpjKAdVjSQN9qenuvYSybC
 Qkp+qM90lyPcmmPnWu6y5a/HK3u5mmQRgMvpzFiWGmwLP2Lb2d8d7u59B4NTjQSNJPNwdfvH6bu
 lDd1zjxsXdkOigwswig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97256-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aa00000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,a800000:email,ae00000:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,abf0000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 716E627461E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Iris and video clock controller devices, describing the Iris2 core
present on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5c8fe213f5e4..eedf677a7070 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -19,6 +20,7 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -2745,6 +2747,85 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sm8350-iris", "qcom,sm8250-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus", "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&iris_opp_table>;
+			iommus = <&apps_smmu 0x2100 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sm8350-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8350-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.47.3


