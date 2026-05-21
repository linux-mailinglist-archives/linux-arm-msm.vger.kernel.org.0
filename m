Return-Path: <linux-arm-msm+bounces-109082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBbNMAwJD2rREQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E3B5A5CE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA05C305D94D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4963FD131;
	Thu, 21 May 2026 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUcrN4dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOIYRUA7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0713FC5DF
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368868; cv=none; b=fgD5Eqwzjk0mdplb7UqPN3cdiGNEWiTMD9+Dlb5BQI//RegtMim/pHDi6pP/mm3Qg7b8gUHhGqFDEDUxSdjDu6kZsKCyFHDvr/3uEwAqqnQGc0oQ1b3JsNkRXD3nA//cO0qbke3r6KhFn402QO3aiYBZPdhVXUBKA1/Sq8EoiGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368868; c=relaxed/simple;
	bh=YirJWrRqQcQlSKweDeLmHrzIa7EXeT47ncvGBD26WCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1gTMtx4vtGVoWX+eLYeapO/TDsjvM0pW6dEQm0rHofTefgwz+C2iG9080mFBRjUzbeADLXpr3DXizRfIZP3i7KHcXQSnvg0Y6JW5EPWYWwavs5kwyfzwWYm6Z4TN/4Ne3yLouZ3EcWqnjKX6x35N5DW78TeeRTzAznqw73Ad/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUcrN4dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOIYRUA7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99uPA2491817
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5kQo8V7wWn+KuMHE9EDLosuD36P1el60Z4Yxbyno+Y=; b=DUcrN4dzNb21GoA8
	bLwAgkK92MxaGr43xlyPhW/pbqfdTSvvOm5cbzgXYp5dXyHNwMEnp6RZkbQ+hkw9
	qSXIBQAFE0JR337OdFz/Wd7JhzFlXVMK28N8DxAigs7UOZZ6SqAvdARjcwYDSRzg
	vNg7uL8FH6tODiLDTmVSwnwV0M+kka+BWwYPP3hCFv1bGfHUJ46CIKuotlvukhAU
	G1c9sEU6ZieXqE/gIP5ylXjAASloIzFAo1pzuFmDudZfUMzlhEsecrzR95cCePjY
	0bHBRyELrDyAdnXLIDqUgYzAdGuteWPQ+bSM4LbuHWgcNSrJagRZZWHDFS7tHyz/
	nZ6MFg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j53bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-369467ab5bfso5476472a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368865; x=1779973665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5kQo8V7wWn+KuMHE9EDLosuD36P1el60Z4Yxbyno+Y=;
        b=jOIYRUA7PhwZLRvW7n+7X8Jh58RUdHzpJ4foocQCamnDA+cdnGFpkoMRhtPI6fVhGs
         NlGeX1cY/JBkqa5rv4hraLw0IxyF9l3BPlqyPDeJPA7kryUcUUqgiMH/S1vwBPoxVmR6
         4TK6sgwl4kiMnM5oHTF6frdTF9cLC5XYeh5CLmJ/Niznq6Vg8litOyuncGTNDvgOntK7
         ZwudQYyZF/vCl/0yvcO1CKoQt7RJ2e71lE0koAojCKgNA4UUSd+cSrNAmucWvBM2I8b1
         hP1YRq3CfXAKzUaieNT9/fGy4CZFx2ANjEusYv/uJ3kz9RuM9Ekfc0vZJ5ZCdafNdpfR
         lfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368865; x=1779973665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A5kQo8V7wWn+KuMHE9EDLosuD36P1el60Z4Yxbyno+Y=;
        b=mIU+luXPjsKEPDsDoFfdVLMbkk4h7Ag3JDVG27HTEhWO3ErViMg5LvJ5fWgMmXOY/R
         y1sw02stU+pLRm4hT9ag4mKQEBiaC0Wps6ju0Lfzfon4RbYFn+rhizV44M3LfH8NzU3G
         8UHLKQK048k2mL8RnQAey5JAHdL4Y2/7meio2eQjTUWRVkPXXLBShY8yWhtIz0SIRQ1w
         KmyNm7v574BVLZEhMVI1PmRb4swkFDVsbJF65G3mmPDujwJ5TCDplj8VcO6Sz5wwwuCe
         PMIH7ucIBbKIysG2OMcQMeZ4BzG0/5OJKp3e9+7aF1x778/qWVStf1BZpD4a+of/jFoW
         IawA==
X-Gm-Message-State: AOJu0Yz6T2/aPA4XI7jE1K9q1vWX266eT8vemQZKZ1WlI8SKXNCpK/bX
	Wcz4PLzlNrMv96KNPBhHbj3sLC3fU65criDaErMV/AKzGYjMW+pR4zMVBS1NvkBgXNy0UmMZ941
	niZq3J32yqkobaT7umqtcX94beckHNMxRi+eFRJgsHkuohlK+0XH+Jpj0S0ejOF3XcWXh
X-Gm-Gg: Acq92OG27ZiFh/Aujx204LzSBPaSYO8hs3DRuXCk2kKTuBQUc+Y8pCj4ds0G282m/cR
	XNk9VFlNJs9GKxT3M3O4mXyQG5RTVOh8w7O3rSONQhqVaV4LIxkaFZv2DihCz4sw0h9Pai0wd8y
	8wg3FxBaqkTrdtF21hQ4OBl37kFuCNAmmmiBnmD1DB5FleakeHhgTmHV60tI8V9SsGP7qe/p3ez
	SYZL6BzvIb8ankcbn3W4bv5bT+d2AY+g8shYw3HG5V7nZpo1L2xt/uNdIZpch1pXCZfVESXi5Yu
	rRrUy6ZD+yyatTt0YYBpZKmVZcyOJoMQ4mXoRg9NDYfCg0PxGeel+E8iiE4hTDRDlZl2FaozcoW
	nSdSuCR1ck71HA0s1xUb7nyX7nlhDdrJsoTy5feUfRvQqJz8FYcDKMJtd
X-Received: by 2002:a17:90b:548b:b0:369:996d:282c with SMTP id 98e67ed59e1d1-36a4518224amr2783807a91.9.1779368865166;
        Thu, 21 May 2026 06:07:45 -0700 (PDT)
X-Received: by 2002:a17:90b:548b:b0:369:996d:282c with SMTP id 98e67ed59e1d1-36a4518224amr2783773a91.9.1779368864679;
        Thu, 21 May 2026 06:07:44 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:44 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:45 +0530
Subject: [PATCH 12/18] arm64: dts: qcom: kaanapali: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-12-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=933;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YirJWrRqQcQlSKweDeLmHrzIa7EXeT47ncvGBD26WCU=;
 b=Jvl45V7OgOUM8aYV8R148D/rmh90XxOkj/uzYbOYvGkjVVlhglof2QRAN5uENR5TNsle408HH
 KXl1h2m0pMDBfce6Awn/BSg4H2GhoNBfx1uyDIDKL2SKmKF0W0PG9QE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0f03a1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 95NbmlLewZtRYjlRILaILViIF8nBJWPO
X-Proofpoint-ORIG-GUID: 95NbmlLewZtRYjlRILaILViIF8nBJWPO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX5BtHmVExwadm
 HVRKlIReXclRYPusaZ3lFhSSYlIM/PyBf7A8cYfd3eIR4PmZS3w2AFJRAr/ogaDM0+12eXyY4Ih
 eTEnh8y70g3mUEXDcqFc4ckkabHXVH1iNjGtdiFA5Fva2eiYZdz7vkySpQDaKR1effxqWsC6Zyb
 0EGszi05TavjOBSOLm37hsKCSzdUqIxVcryht7pE5aDmxegI07dYzK5Foojmkg61Ecv/F565bXl
 1VBYAaq6PrIAQt/xX/F7HqajZpV3LnHK+zGjhEcB6/7QAFcwxbE1Y28O5iLfdbcItOxCWJtuWht
 mpcPvh1B9JVUGwh/V/FLqUzgHBqjCmcdwt0oQAKvplH/ETdcwnK3N6VENtyNBr57jma2SNKOcrN
 weecdhFEsbJZR7Ofu/g5Q0+392+RNmAEC13hL8fdMxZ0Aczvlu+2dMBLHH8dkCOzwG91shMM/eg
 L2KLoDkOpRkB1Q8PwTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109082-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67E3B5A5CE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 07247dc98b70..dc773da863c0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -933,7 +933,7 @@ &pcie0_phy {
 };
 
 &pcie_port0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1


