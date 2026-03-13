Return-Path: <linux-arm-msm+bounces-97549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBrrHSMutGkEigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:32:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B8C2860C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 844BA32B89CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5AF3B27CB;
	Fri, 13 Mar 2026 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fgie2GYp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WhjRpNZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E603B3BF9
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415648; cv=none; b=CPT8dNlW4eWpxlhihasttOi/UFZ0Mw+T4xN/9NAR+4pLyton2VTsK5RNm+fqf3dTFgUhdxrOSALh+OecpZ0kbBtyAkByOEfcRuy0MCBLi9JWN58rLaQ5TE9PW+5vG4NIlyB+bM0+0ONcBo0syJSIMQZCXEn/yXvHx6+5suonP20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415648; c=relaxed/simple;
	bh=D7IK+Apfe2hVzrVzXvtdvddQ3MUhzPUtjy629yP2z4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pc7ylrIM6v5h8CgGTV/6WM4CZq6KhuTBeHky6rb9zLPbJiBqvzoxmp9/W7Kr6a6NhfIBqIjfUgZRRxJ26ZemfYOVIF+lK34yBWt5WbgspfWvHPA/dDgAlgKwr9btVTSP3edQURzQpBlkZtIHxwHUdDnqlMhRf+2Hgx1I4W4Ougg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fgie2GYp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WhjRpNZ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCqZO33342938
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UeGYUlU46kYFNqJwl7FrZP1Se/bqih6mKwa8Gm6XGSc=; b=Fgie2GYp+lOamfJM
	4tfxorZgxjp88P9PgEziroAcqD/4tJDswVdpCPWVIsN49CgoV0V2QFLttKRcJz/g
	3fXHHYq9DzWLA1QJ5/mO7S1W+xWZeFOkbodbh9Dtv27YvKH4eQIjEqJT7jYy5Fzp
	i9BKX5GLeY2+gwwKPm4stgIB1GEu4lwsf5yBUaziduoLsqF+27wVx+7ZjLGmoYXB
	S1Q7Rcmerap399Rq+0hRqeoxUqpoeiITxLgWAcFDqqCMSTW+KekdAQgYYZqsHuTJ
	gWnXA5zVQrq71oWMSOqywbVuELq7gLL7+kl02lrRbhTBX4v0fbVdMf9gCbJcjhA+
	WbDh1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w5dee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd858e8709so2374619185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773415645; x=1774020445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UeGYUlU46kYFNqJwl7FrZP1Se/bqih6mKwa8Gm6XGSc=;
        b=WhjRpNZ8jHGADYFNpcfRiz5u5fK9xpQu2D0DKPpnCfY4Dl8b7tWQ5f02trfo3rn0bl
         tbIJ1QnjncU7r9zdDVTkGxG2VjtbOWlmgcu1Ke0jtWVI0oBEDDTZ1No+/ueUmB99Djd+
         ycXqLW4EBQldXlFkH90Rmtf5Nm5tWJ3dkZiAny3ay5j0r0KXgVheEIix11vkBOMWpHzz
         VIpV38AZoT32ec3WbaZDZU9HSmGqy07pv9O3FgL/8t82m38eoWqJBRhqOda9aECGEkb0
         7TUoz5sy1MVWj8Wy6P7S1aOO5l4W5RsaNVXAF+M/8BUXlz42Px5AY6BrRFridf2F73jZ
         uMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415645; x=1774020445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UeGYUlU46kYFNqJwl7FrZP1Se/bqih6mKwa8Gm6XGSc=;
        b=QL8raRzOasCMRmmXzOrHPm0Nb24+1oV0VQxJM6IjcIS0pCwTBItJ+3y6M1GiZaoQMK
         rhD18/1qE5yk+f+ESkN9FXbT6yvDsf7rUJlMxz8VoBO+Y0zrXeCsCgA7M1ZQ4tFY+TKs
         kz1+HOSLJW8/fuur3W7Gi6RCjVaiwxhF2AmCS7EZa5SLdRUtHuwIa2kIh087eTGtJ++o
         I3lfFby3NmuSvoCMWv194qFmx1CvYg/stQBHN8Frl4xJJKUWeGB9GK+G4oWJ0BCMQHHb
         EIDz10YSIBThUATnKY1OyTyylGt35oJUvmxV+bsFfgLP4BfAYkzxAJ7RokmTQKAx0b/9
         /2hg==
X-Forwarded-Encrypted: i=1; AJvYcCVKMAdmJaiTDcbnUTZqOU4sdSZ1diuF2eQ6yOy9d2WOevUvdCy25MY1slPrM1FLvWYo+vktKwJ59EcH6M1/@vger.kernel.org
X-Gm-Message-State: AOJu0YzWgnpxXD8dKg/lZG8IrZQgp3qmObUAfI7VyliayCE3FzgOa1rF
	C4GmCKJKe8n+uFkBfkdXsMmc28Gsm85FvVIXViBPKDbURQolHyXnis+1HHPgD2RnzsoSBXsPgVd
	HZ/siVXnO+GEwVMlV3U1pj6U2oceS7L+R3ERjUTVeN/u64/AldNjTEfZPmy6AljzRYzOq
X-Gm-Gg: ATEYQzz8YZKn6XI6Yqzyjz6fyxwf3BGT1YQnz4XWxRVg1LqqNcwmXIgyt5F/tc9qgCq
	mfSX6qvxopXCPVqbSjcVi3bheoUikzsc0pmHVqtALE84yhNeBQBMYdLADDkBRNuEMKWsERUqIXo
	B7npX4qGLkBFW0a5WGMb2L8SgjFIl0R9Xckif6ijKX4EqHG/wTh5CBMxFiyZ7ranKpac4SwFYtP
	71zyVKRc0VXkG0jYpJfZu5tQLg6igR/a79LEdpyNhENr/kGyPsCtoPy3VEU9Y2AImADS6j/4Va/
	mjHfno8kAheYhAWXSzRUZL+MR1OwWDy+5+yl8s1sB+BEcRU7mcTIwuF7Gftc30FMWvIrKi7GpvV
	WHyJ4xq3ql/c1T2mI8ls4Of+VqEMeQHlJNp4rA9DXULrMObb7rVYYWUq6semTnv/NAnkbnAoFdF
	PThuIGmdafStJhmDuUOuVW5VjhYSEsZXVeNRI=
X-Received: by 2002:a05:620a:2985:b0:8cd:99de:6b5c with SMTP id af79cd13be357-8cdb5be274dmr524447485a.74.1773415644644;
        Fri, 13 Mar 2026 08:27:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:8cd:99de:6b5c with SMTP id af79cd13be357-8cdb5be274dmr524444185a.74.1773415644214;
        Fri, 13 Mar 2026 08:27:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c0asm1603328e87.18.2026.03.13.08.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:27:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:27:13 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: sm8750: correct Iris corners for the
 MXC rail
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-fix-corners-v1-6-32a393c25dda@oss.qualcomm.com>
References: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
In-Reply-To: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D7IK+Apfe2hVzrVzXvtdvddQ3MUhzPUtjy629yP2z4I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptCzQy94k1iZfW8hsQB4S6BwR+fV/TZQsbYMOJ
 xmHnJSrT5uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabQs0AAKCRCLPIo+Aiko
 1TzFCACXU4Ebx3pvDtRPTH65878wtQDQI7VdbUkJnZuKaVlxr9emLvJxAvSbuJB8dtpXEMzfLlS
 NbiSJC3S7GgWW6VNPDttMV/WOpQMwrT0yaANjj0jQiZ4UQswgzNMMm66YJnu4ut0DtZGacsKGNl
 Y/ZZKsx6iMJz1wDJbf7AmU06cuCpK8DlgCRNTT8k3QlmCTEwza0CYev+nRSZs5qm0Ba6BHaYCT+
 FD9ZL2hQBTflXFuQyoQrrcrTUEmXhNiEvmCAsj62TQOUIMyPrnlaRPklNT9kOxcnYmtEU0mDkha
 42FxsMmHhBlYMRdD6soRaVfe3xbTtt5pLEb3Zt8mS00UQ6/M
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Oi_JXN9VUnXp_GB8Iw9H-iLUncqtIoAN
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b42cdd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=UouAheEfswbHdU7NjTAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyMyBTYWx0ZWRfX+FNRg0/IyENw
 nIrGT9YJhCNaYAPgeowJxvWRgzdwAqC1E4BWFOqwDF0J3hV7M5b98xIVa3Yil3lxl50rRXjDLYt
 +uMOJjJ8ZMYlW8JajeP5pbuQs6l3/aaVCD29IWLcuumfLVa2Gw26tQ/+GQ0qhh5A77EIbN6KMNL
 Jldv6SnOnuotkinIcbLUf2pVeL/U59IwtpuewEGEybou4y/8Iwl1NloTmZKVMDvTXjcl690k91b
 uOMvVp4Cvutc8GiKLm3yUVP6fP2HOVXSRO8jbE9c9mosFGfnxs7em3tp74nZ3Rt+nGYSam8Empf
 O36Rn0WPJeymiGfrqk9ArkMCnffzQGuZWMFs/W58urK/5UTwfYXYp4hiF3/1b8ydY9DjdSa2kO6
 nOvSu9CiWsQbNaoKsZwniY+MtnwM84DwxlKhBHT/pluxfhQ9iOIqNHc2YwffwuGJSUULCdnQB2e
 QqfuxgvpXM2GcLND4xQ==
X-Proofpoint-ORIG-GUID: Oi_JXN9VUnXp_GB8Iw9H-iLUncqtIoAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-97549-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8B8C2860C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The corners of the MVS0 / MVS0C clocks on the MMCX rail don't always
match the PLL corners on the MXC rail. Correct the performance corners
for the MXC rail following the PLL documentation.

Fixes: c0d11ff90475 ("arm64: dts: qcom: sm8750: Add Iris VPU v3.5")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b85..f34f112d3aa3 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2945,19 +2945,19 @@ iris_opp_table: opp-table {
 
 				opp-240000000 {
 					opp-hz = /bits/ 64 <240000000>;
-					required-opps = <&rpmhpd_opp_low_svs_d1>,
+					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_low_svs_d1>;
 				};
 
 				opp-338000000 {
 					opp-hz = /bits/ 64 <338000000>;
-					required-opps = <&rpmhpd_opp_low_svs>,
+					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-420000000 {
 					opp-hz = /bits/ 64 <420000000>;
-					required-opps = <&rpmhpd_opp_svs>,
+					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_svs>;
 				};
 
@@ -2969,19 +2969,19 @@ opp-444000000 {
 
 				opp-533333334 {
 					opp-hz = /bits/ 64 <533333334>;
-					required-opps = <&rpmhpd_opp_nom>,
+					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_nom>;
 				};
 
 				opp-570000000 {
 					opp-hz = /bits/ 64 <570000000>;
-					required-opps = <&rpmhpd_opp_nom_l1>,
+					required-opps = <&rpmhpd_opp_nom>,
 							<&rpmhpd_opp_nom_l1>;
 				};
 
 				opp-630000000 {
 					opp-hz = /bits/ 64 <630000000>;
-					required-opps = <&rpmhpd_opp_turbo>,
+					required-opps = <&rpmhpd_opp_nom>,
 							<&rpmhpd_opp_turbo>;
 				};
 			};

-- 
2.47.3


