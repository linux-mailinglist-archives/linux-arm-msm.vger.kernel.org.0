Return-Path: <linux-arm-msm+bounces-90479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA9/APjMdmktWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 03:10:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E74836A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 03:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11A573001326
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 02:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104FA22424C;
	Mon, 26 Jan 2026 02:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAtayM8R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A95fjh5/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C15321257E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769393392; cv=none; b=kPWAr++YUGI3VDgSQW7m2tXBkwRenYuuEyL+KntOloAzFEEPycXrt1zzWrTZgVb/9ALgiGsmaFMeJ6CUoaDzIb17GKcbhWKHZOposWZxzI4ACWU0cLLDulWyNoMcNXvKX9AUv+2Vj0pkHoZqZvyz/Bro/ZNbXhZ+ohgh6CSR/LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769393392; c=relaxed/simple;
	bh=qAcp8mzrTR2YNg/h2RgYQ9MnbaU92InMMdC/2PvSTZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1VPbW63tCLAppKY2I98zxByXRRSxaItGf6WR9im+YcAInGyrPzBrs49K18rAAVlMBq78fL8YCf+cvohv8erHjZ/hyIKr37Ja5xdNVDrBf+7H+5W7WpzAYrf2lfSdKEyucOdqV6iKZyCzNN+5btZHuCkx6zRy0Pkokxq/V2xTm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAtayM8R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A95fjh5/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PNiosm1258051
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLpoe2WrWglxJlT6bTDJn8G3/t1K7ubvAPno0YGycwM=; b=HAtayM8Rbe3a4ZBu
	FgvTS9y19sl4lSMpvSQ8frbSJcecF1hqsnYGodZPh24oymyTRw3lAi5plM8/nMoT
	sNv8/MOtG89AOV1wgpDC1G3jruzr6C8M93tSpI3SPfJMNROYca2OT3PBhqsvAg81
	xIEJuO7grxa5h/tYrqkBV2rrss04venc3JEkHkT4oWCUzYL/awlNtaCPK0K7TZ04
	mAPJ+mofjSe4HuUmc4X4aTm5nvMgfBMVC4iZHdF6PySyqXpWqSxRJ4Zf7PjKJRYW
	WzEL6sJHcN9VlWYru7jOqrYJVxPiMAkskp1RvQWcybe3g+0ZpiCP5/tMoNgmmV7V
	A1Qh0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwtyaja5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a0ec2496so893637585a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 18:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769393383; x=1769998183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLpoe2WrWglxJlT6bTDJn8G3/t1K7ubvAPno0YGycwM=;
        b=A95fjh5/y1uGg80140jlfzdg2xzO21t5pbn71BLI+Lrx2Fy0lxMvml/MjvZmV618kv
         J5pWUPCGVRw3WsLiWt8O8wqLq406us3w83qVqc1oTStq5YWYfyr1yqLgl7QJ5mzOCDAG
         0u4/t2+/lUeZAda4vDSZOwtuU0Wdx2yc2+v9jXhaB14NE9MUfSytK7yTB2h70le7Xno2
         EAVW6n51FoOCrAhvM6Hs6EvmBYGapdBKfn+ypDjK1Nh71MIwsusUJkNMphX1QeK4DDiR
         FmrOfMzJ4NfrqUuQF5rPhllM0NLYWtNqckrj2Qkogxso/zIoTkNpLvWv1GwN5LejG9eA
         xc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393383; x=1769998183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vLpoe2WrWglxJlT6bTDJn8G3/t1K7ubvAPno0YGycwM=;
        b=m3T6S4o6OkMWPuvu+YDUI01Vz399+msEQ0fXvOJ/5742vIYONusny3vY+MedDSQ01C
         /Q+yi7IbLN45WebWYh2KZmd1tMUaJBcvPeqXdfoV0dyOpa7ehkbtNuxcDTfoG7qPnLnx
         Ba+zesfs7kWYUnGtNopduVH2jrT69UyWCU1yny8TY+GZkOeNwrpMXQyR+13Lp7+EC9nQ
         rR9WAmNvBcsFZopxES6zwYspndLYEqp6GMWIWKlbcgq3lbH9ZXFYAkBQ7Bdm5d4pq1kD
         bdSXEwGQFTwsKVcF19g0KBRRnCPPPoWfb2OvOzGav+/peKr/tbDH+D5j3dUfYNvCBA4r
         6Ieg==
X-Forwarded-Encrypted: i=1; AJvYcCVQP5bJR8dgf3HWEFiT0IRsP5Pyfg7LOo6pI+ID/zDNrUaGDau8VtpmJ0tNYJt7xqSHlrOU3b6n5LTXlMgc@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQRt/P17ZQ7fR/u0XFy1yHnWBomOwSF2vzRg6VyIwkOTHo2f4
	5J8LJ0gnqHUGQK4F9U3UlMGqy6OvOsQE0yMLQCQrdaK/Qa3uilJyAXkwu3WkkTjjGLZjR5yfjfj
	GXgpDR+JmCrcgLmU/k/RVBA2KjknJOwEssCzRY+UjSh/Z/la1dN4//TGhmZOoPUKRIaFZ
X-Gm-Gg: AZuq6aLDFcMgFDiIo7W3OASUAi9lQ169zu5Z3yFt/O+eOJPbDwVBtYw8fI4AeiWXr9D
	er4viBpdt9Wi96D71UIJmFbLJJDcjuMDfnU6NlrfCRdzqr5wU9O2Arbxk8JBXifLryijAJvoxzx
	BP3ZZyGXJm2yA2rbUjoStjCw9llKTds7wM/GQGEtuus7ASOWa6bbch9DWw19fXHuDV0iO8YCoXW
	lQwTztNgdQ/2lY2A7WWclFCNU/mbjL+doFHgra2c+Zvz0xCPOe4dDIN7oMSq4X14Vr76h8i0bH3
	xyz36ewI+GFBwMCDfp7S+xj0i1FDcP6mtjxEYlxs66lZEqDITBfCXP9Tty/kx9iKGIxo3ODAs6R
	Un/SZLv69kXiGi3gyB9F3dHaj/3zHUAS9G7Bv92ZDT9MszQcWly9tuxpcjZtV+ZmPIeEtPYiK9/
	DxhsG3Yo+mQP0kUQCvauCKauM=
X-Received: by 2002:a05:620a:4723:b0:8c6:a034:9225 with SMTP id af79cd13be357-8c6f95cd6bfmr332110685a.35.1769393383499;
        Sun, 25 Jan 2026 18:09:43 -0800 (PST)
X-Received: by 2002:a05:620a:4723:b0:8c6:a034:9225 with SMTP id af79cd13be357-8c6f95cd6bfmr332107185a.35.1769393382972;
        Sun, 25 Jan 2026 18:09:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faed52sm22778201fa.2.2026.01.25.18.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 18:09:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 04:09:36 +0200
Subject: [PATCH v2 1/4] arm64: dts: qcom: sc7280-chrome-common: disable
 Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-venus-iris-flip-switch-v2-1-b0ea05e1739a@oss.qualcomm.com>
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qAcp8mzrTR2YNg/h2RgYQ9MnbaU92InMMdC/2PvSTZA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdszj8gB0es0zPr2Dd/YWcc7q+IXX0RFuMrki1
 wqx3nCCJv2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXbM4wAKCRCLPIo+Aiko
 1cW3CACUesFpfmmuc+SbBNU3gHUA/xi40138YmAFoXQ4wqUCRe5wphXpiuz5ZcaNdndOL6HSHsH
 6nRkXQTbS8uaDBvZi55s65IT3IkpaAfAOmWj6rS9AksQ8bM9XWmVMFYS7HKgJsIufesc5JPiYUM
 bXwXw5+Cw1Ji2jDcozwYlqnwQzk22ryIVHkoGPq9aU3B8lqZ9D+5rGF3N7qVNNpjoDSwWtaxS6R
 9y3IGVDQ7qh2vLeGdS11/IlNGRpzskADxsr6fksckyawKRCKzGcoSmhtW31RaG9MqUthbYxRNm0
 Jx4vOKp3+4OGXQBOq4erQXyZvMWHKFwDTpxriacbz58xh5id
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: i7CXKBU-0G-ZodrgoIRkbRUKbibPTi2R
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=6976cce8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=foIlI7qs2i6qjVKSRT4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: i7CXKBU-0G-ZodrgoIRkbRUKbibPTi2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAxNyBTYWx0ZWRfX4DxZ3zSPcH9B
 1CEl3k2fFLhXZ+7v+t5+mU9j38M4J/QcTYROfikoEKxgv+qsDoBEpFObjJ+RNyx4DTlMP822bHy
 +u7lMjBMy6PGIdIJERkXoCnF0Dosde3OHf3rSQo65wmHzmRQjNNiN2iHoYNU2aiWSzZvLUYVQKO
 8SSXu4I049CG59N6A0rABTiHxiylAMr2VEX67UwfeRCKn04bxr51AtGeZmoseFOqIg+4e00ImRR
 lgwHZ6HQis3ZCkighDblYiDHgbaARCKAaRcmisaJUShhbaXp3QZkE39HebiRmaNRtiU3++2e1To
 9fBQMknUBA311o1KFjG/QTP32p6gc8ZeEpLpoKdERkFLagi2EKt/DO2/Sf6PwPcBeLjiRjCFXpA
 s1/GvL/5C9I2FIR5bZsnqcSyKUoVpy02uxPs564Gxa2C6eKQvvOarOJh0JmlcQrRqHlmWqAI+ED
 AtC23ZDgchVgw16i1jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-90479-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90E74836A7
X-Rspamd-Action: no action

Iris driver doesn't support non-PAS/TZ setup for setting up the Iris
core. It's expected that the ABI that is going to be used in a long-term
would be different from the defined venus-firmware subnode.

Granted that the SC7280 Chromebooks were cancelled before reaching wide
audience and granted the feature ABI changes, drop venus configuration
for SC7280 ChromeOS devices.

Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 617a39d32488..debf62baec9b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -140,17 +140,6 @@ &scm {
 	dma-coherent;
 };
 
-&venus {
-	iommus = <&apps_smmu 0x2180 0x20>,
-		 <&apps_smmu 0x2184 0x20>;
-
-	status = "okay";
-
-	video-firmware {
-		iommus = <&apps_smmu 0x21a2 0x0>;
-	};
-};
-
 &watchdog {
 	status = "okay";
 };

-- 
2.47.3


