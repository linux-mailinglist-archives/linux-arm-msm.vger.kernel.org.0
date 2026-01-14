Return-Path: <linux-arm-msm+bounces-89073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A389ED214C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6F1F303F377
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EF3361676;
	Wed, 14 Jan 2026 21:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IC5K4dQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3UJh1YQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD4D356A30
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425486; cv=none; b=CH2/e0vUUg/VqwOckLx3LTahttmFWB5SD7vkQQYdvVGKnwKwFL1avFnkwuw6/L/3j0P7CPuqTF3ebx7+B4WuvqSAZKSC4L7L53p0KyIloe50f4O6gJBAyIyveSf5witARZXW3TLufa5I3EWzZ2LgrrLBcNQ9MG/2qcUVBtxDpcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425486; c=relaxed/simple;
	bh=KCD8mpSJBcMuXvj8iPeHFULwYB7wYTPxtG0IzBPkGlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bcz/78XED2eYWurKj7aNMs4Igt7J8Vq+5gRbSb0+E8ZkmecUKgZAUxySD4yiZudZn6axgbMs7IyPb3tkow8InEh7f0QODVmBY9C9GIQ+je879w42l+X5qYSG4xiQcuy2htOMVmzHR6D1i2pUd0AvsMn5aLLQyFfaHqcqszycHto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IC5K4dQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3UJh1YQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EFMMrN1943043
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tXkDQ3+jMXQ
	qPPuK6mMrk1+pxz6fxmsNJ1KrtU9GbaM=; b=IC5K4dQ0+436/BXNAjS8oJVTScv
	jTRPFiE1aDrwKV043bY3NPNeg2JvWTOMF2QEJDz9YyY7qTJmEYU/ZrOtRQAXwBZR
	EYhHfI1SPLfmSH3M0WJHFcjeSC8vvDyQ4CKUJEzMCJsu4FZDX5WFFkkjjwcFBxIU
	KQWGYoT+SLfcORi60uS0uuyhxsX50j7xaeTCA1/7oB1Pfz9cC4o126ijaWfs18ed
	/Ecj+pFNw9R5VP14/oQkcN9lvqpd9ixiyIOpnJH5doNwndXVbZiaCe/1OISusDoU
	3ZPLGCms8dICzu9/K7bhaoUtMPnC2FOkAjgA7NUSCTPCgk7cJ4J/IHMntzA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp7b6tq6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:03 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-122008d48e5so359014c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768425483; x=1769030283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXkDQ3+jMXQqPPuK6mMrk1+pxz6fxmsNJ1KrtU9GbaM=;
        b=U3UJh1YQsI+apIZHYyN1/c+KfwStoDpa7LBkCL5l2YsuxgwuePh8Ap3z2BQpvK7Ioz
         RZjHbkfrJRnGoXXqGhKemqrH5bZk/TcGpr3hIqiBpq+wGhqCAH0f9kxLHW5jHiWO40K1
         1XWs7ru7Is/TZcOT9mJ6YHmD3nmjmgyM9SSSvodGUkS8bYGlTZnJKtcEvLfMtqTtXzs6
         QiJrADy+Q+rPR22MCdwb7eoEse7aD4Ny3lzWO5qzyAw3Jp4f3HajAszqlu+UKwBbKReS
         MsuLTf6clNetd4z+TP11uTvFE5yckPNZ8MzJGMRI2AB1nVa5IZAr8yQn+PoboesDFs88
         /IWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768425483; x=1769030283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tXkDQ3+jMXQqPPuK6mMrk1+pxz6fxmsNJ1KrtU9GbaM=;
        b=rhyoRMQoEu5Nosxnkyj44ylmOlab4AAEpIVZsLuJ2S1OKzb6TR+FJ3BWH9pcjQxxV6
         Q02SukHQyq71Kd6oGdjZdZsV14v7RvsUvJrmI7+9hIJc1qlLymu9kbnvd+3K3+pRXsUM
         dimGBt0w/cMr7t1sYwPyTah+lbxz149O8TPM8jDxPhx7Jy1T57rFYKX1EduRAd9vj20n
         uTgqvVJnQUr71CL3G2AyK9tXSMwf/WLOk3oOn7fEXsOvtlvFH1xiysUeishJ22JJMr8l
         zdkzEzRzpyKvSkuQneU1XpG7VsrFPtczxzIpGvzk+gP1xYzDGMkLg1OZdeeB6SRBYs/s
         dhTg==
X-Gm-Message-State: AOJu0YzqGCc+uZv1Dp2xBpOBQDxpyD4XqwvDVs5gtdCwmF9Q+7LLEu0U
	KnhoJ58cVVmJmhG/LxnbzzRPqKLW3nMZPhQ7DQKP1vL/XGg4zsqAHEmc9y/Rw7iu65fdx0bznAf
	k6mRiRKjHALlqDBsgpRCPmFAFDYgw2JaroT/AQrwMpcP2fjpn7BzMWPnntCUGgMUim/U5
X-Gm-Gg: AY/fxX5qPNLIkjUFIA0EyC/2rS8fkqLlWASNLC5Eftxe0wOKRJtaC2oJIWy82Y72TcV
	6Gb1KJFJfalnM7cE8PE5zyZr8d6cczvH/09RyGKegPm+0aCGTIlbByJhJ/jj1jzXUnFnTS21etp
	20fUXtEFfyAaJBOT619xsh3kzhEQtt/IDreepq+31zT/inbcmXmYj/NLMUSFYvUD682wKYB1WHu
	lTid+4mk2jHiHg1pcybVzikBn0/rFf2wunChQL0E7Vc/WaWZGmD4Wruh80+uLV820v/rxLWhY/f
	4oghCjo/5+MSO+kMhO9bKXpr66U5FCbn55TSgaqD8KFK8zCiZF+Vm8Mc6Aluvc8ycJeRN6uUE8J
	gjxtn1zRMJcgDJB50ljPNTu56CS7vONPgetPPtrRTvhzzZmGKnhaiunzeszYGxUkwX6be3lC4
X-Received: by 2002:a05:7022:e1b:b0:11b:9e5e:1a66 with SMTP id a92af1059eb24-12336a39a19mr4656755c88.14.1768425482712;
        Wed, 14 Jan 2026 13:18:02 -0800 (PST)
X-Received: by 2002:a05:7022:e1b:b0:11b:9e5e:1a66 with SMTP id a92af1059eb24-12336a39a19mr4656729c88.14.1768425482161;
        Wed, 14 Jan 2026 13:18:02 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm32167118c88.2.2026.01.14.13.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:18:01 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: soc: qcom: qcom,pmic-glink: Update X1E80100 compatible string
Date: Wed, 14 Jan 2026 13:17:56 -0800
Message-Id: <20260114211759.2740309-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: E4Fq5aJ8YhS1GSNW07xyJtcZnU7KAjhy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3NCBTYWx0ZWRfX2goHTW+ZfOmI
 SvBRXLwooeROVmcVtyzMhBjW8P+ItJn7bL5ExrAPsV6ggBUAnul/Gvpc3mR3DJqr5cVKSjlEPX/
 LUvh/mSV/tSXoi4HBw5chtVRmWVcYMusck9a9/R3G2HiaoOUtzi1cMullTt1NqYqtJGhq0X/GEF
 0A9kgZ3ZSnTximOkaz2B0AhLFMgxvytfC3hLU92Wc2wGtwTFFbfn4fZUANOmLdbB1N3do1j1UH0
 ZpC9uxTFMiqw9ojeRQKHn6bch8tkeMqt7z2qDlZo3NIBcQvQiyHcuS6veh7g3Dr52udGgOw7QEl
 NeNkwPcmHn139cGMxuv+aQdPUHk1bAEpVrxGuBQRYqLYt97UgCigSkiFOknrKdSPkhgMQK8fl47
 03z2ZgTPmeaCBQ35KD6Cabhw4aqft7IarHk6AKk4IlceNBXCU4e/X1fhGc2SUg2hV76Z5VGMVc/
 66p4OaqATilEbVYoWhw==
X-Authority-Analysis: v=2.4 cv=W+w1lBWk c=1 sm=1 tr=0 ts=6968080b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=04UxXR2pUAMIs363SnUA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: E4Fq5aJ8YhS1GSNW07xyJtcZnU7KAjhy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140174

Currently, the X1E80100 compatible string is defined to fallback onto
SM8550 which is incorrect as X1E80100 and SM8550 are not compatible
devices. Update "qcom,x1e80100-pmic-glink" to be a standalone compatible
string.

For now leave the original X1E80100 definition with fallback to SM8550
as is inorder to not break current definitions. This will be removed after
a grace period.

Fixes: 0ebeba917f03 ("dt-bindings: soc: qcom: qcom,pmic-glink: document X1E80100 compatible")
Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 7085bf88afab..012c5661115d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sm8350-pmic-glink
               - qcom,sm8450-pmic-glink
               - qcom,sm8550-pmic-glink
+              - qcom,x1e80100-pmic-glink
           - const: qcom,pmic-glink
       - items:
           - enum:
-- 
2.34.1


