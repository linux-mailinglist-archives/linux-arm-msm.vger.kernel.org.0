Return-Path: <linux-arm-msm+bounces-112898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zlkCDcbLK2qtFAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:05:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B962D6780BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:05:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WpIbUnOf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g6gWjD92;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112898-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112898-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30C8E3041F18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9194D20C00C;
	Fri, 12 Jun 2026 09:04:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1E0352017
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:04:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255090; cv=none; b=mEDctO8GHXAvKn4uyu/QoVjVInjLSc+EFXjfhyTyVB93lPBEV53XHx2FnhpMKQIgXA0/Di7pl4VQzO29/ym2IrgHPjPwBsmkqiSmntUYwxc906ij3acjASmwtRAGOCh2aP98wFaJM34j68o0bU+Mf+JFGRpcDcSIGHOKRxrtbAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255090; c=relaxed/simple;
	bh=obLsNbstVPAwrtem9SkKGZENOSohwZyhu6y8SUHNiTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VQHfvINTd2WmKqSB/Ln26NpkSdtKYst7Soved+Bzem+4y+ShrLNPZ4vyxwYgpcDlc6twjH0CtJCZfK64A0Kr4DB6L5d5NVycQKkW9n13/3vW1oDX4JWjKb8hvGbZULjtP4fghogOAz+MrDqi2ZfMZA+8y+eqd/FdjVJwLRW56tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpIbUnOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6gWjD92; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bwtg2534608
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wLa9vOH6AETk8tl4PRPIwLQPPyC432A2nz5
	GRIPrZQM=; b=WpIbUnOfeDeeqW3Geih9HJ9pQmNp1TjaLLoQsCLmVRDcKcwAeIK
	Sp7lxq8il+vBlTPbPLzp75Cy6PAGqccs3l2IRPFm+6fX41SmlJPXcuMvzFwfqcwp
	zuG8OaX8AcIPs7ON8eWVVqvHT+ysMm+IZeyej6PQXU2zcexL+Tibz2T9wQLqn5oC
	mno98Gfu+Qa0vCXQOtvrg3JGvsBn2vDpaJszTXe0JZLq4hmrnFLo84qB5bLMV9iD
	djy1pd4a7rGXDy8j44Dn9uKiuK2Tw7Nr9Rz5+0R8xkwMoEw1BKnMOgcd9fxnIspb
	VbGS/fYXBEzY7nbw+dEZ1dZQMblNBaWuF/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76ehbbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:04:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177bddf6e0so16502051cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781255087; x=1781859887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLa9vOH6AETk8tl4PRPIwLQPPyC432A2nz5GRIPrZQM=;
        b=g6gWjD920JXUPSIY4eKBhQ4UmpMDAepZKhKzfe0rH9bkJHfBMTH20J9i76svJSK5om
         rIO7Oa2hWaAcUBSw+R9MWQYk8oE4KqMjkxTpH4j4ysRZD78DB3OLevaXXJw19/tItFRh
         oPlXmUB83O13Wjtt5mPJI0VBPE46AAnIHtSbmqBCCBYJkc+T1Y/cyf6yTgKD5d363Ug3
         3nuvXFfVPGvnT/fLAubTOARxBwljc5QQJM88fG1HYysGbamBc2uFfflvEOtQ4C+2t7kw
         8qn1kBm6uuDjD8hlVuIyYpI0LODPpvX/KqISJVec55OAMBRs/QqAhSMCd5VtMyk1tLMi
         t0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255087; x=1781859887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLa9vOH6AETk8tl4PRPIwLQPPyC432A2nz5GRIPrZQM=;
        b=BubXZZM1Zyk+zxYwYZ1xAnF7uxr50iNW3tgNwHAAd3E9XQ2urW8c9KGeVapZfFH3uo
         r2vUPm+8ShSNDc3UwFmP5kjh3dYj6By+bQGhC4ExwDfGoATNYhIms+PuTqdIS3S8x61z
         iyHm05q0FttENsAhZ9yT1JN5UxWBRwVj4GSRXCoglePtvz5RCIRcK9GGOi7q1t5cWmSG
         +RgIlsSDKXLUj5HLqDCMoIISendMC5PT2AGL7GCVH0xMR8FXkiKWcyFj8E2QypkD22q3
         M4WakupfHN6NSeQbyZpcgV7NGBFCA646eyeYjRq4ZiotMbnZeTYnd+s+y7Q3J7B6TIyU
         Tudw==
X-Forwarded-Encrypted: i=1; AFNElJ85LEduowQomF0zAyHoyGAAp9vXvFz6UkOJCyTJrwHRftDb0/H6b95NjocAhu8c1xBHBSTvSqPVK1sJ7L9P@vger.kernel.org
X-Gm-Message-State: AOJu0YxCp1XE736uEXErr0UQjosLRaz1Qp86c4MgZbYsPiQgi65/+b1L
	+7TdH2Lm7gxRE4p47lt+Vvn/ugjYse5R6FmtmLJP4hgbByms022xHrLLf97ZkgsADrwwXnPhngZ
	Azg4pGptriRf7mVbkz0cwgb0hPcoAaKczeIcNWEUROu1nohY9MxpL7bcsVO753v+ZRkQm
X-Gm-Gg: Acq92OFG5xlml6vO0UydPjXkVJmjEG3/IIY8cHuI8/AUyd7CktT0zV/bFE3f23OVWUK
	hMqXXqE3Hz5K4uzrPIbCsH+odMTYnnK66AHY4IYjyrkbHDsarhGYR8asOY3CV/v851vNsWAOkk8
	+Iazo4V1STWvxmQ/m/Zhj/+grfjoVGkfSTnfZ2BAk+FJm+zqqKjVVk8lpZ8Khw5AtkqZXOahTT8
	X1xA1dhDNdnFoBSsHAcQwdydmiQAd/9q+stf2WS7poqFPyW766xpGt0vhn8s/1r6O7v2ap/bWUC
	VG8mIxSiUzZPCxbq+viO3C2RX5hG6sFHNeCjL5HoIFFdX3AelKRuYbgeNvLOe8Wa9kOUrm5rUPg
	9tCQFJAkWodOvu+BklgFuStP94Y+pCsbt5X+8Dw==
X-Received: by 2002:a05:622a:244f:b0:517:64b2:2388 with SMTP id d75a77b69052e-517fbcc58bcmr26573421cf.15.1781255087100;
        Fri, 12 Jun 2026 02:04:47 -0700 (PDT)
X-Received: by 2002:a05:622a:244f:b0:517:64b2:2388 with SMTP id d75a77b69052e-517fbcc58bcmr26572851cf.15.1781255086480;
        Fri, 12 Jun 2026 02:04:46 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea7c8f49sm56318085e9.6.2026.06.12.02.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:04:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm PMK7750
Date: Fri, 12 Jun 2026 11:04:27 +0200
Message-ID: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5859; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=obLsNbstVPAwrtem9SkKGZENOSohwZyhu6y8SUHNiTY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqK8uab2y+ctPk+un5YikehDDsB11CXdCu9AHV7
 ttFg7khI7uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaivLmgAKCRDBN2bmhouD
 1wPID/4pss+s8qe5a0hilYLeffX2/W9AwAtqtxnHiDHapqYw/aJ/fGNrtbZX7ooBFT6X75j8XT6
 2+qP85fAlmJXT2XGPP13H2uGBGb3uLMCJwJXrV2Aik6J1ZitY3H+KF8N5t2xWTYNnjUxjJYKw9R
 o2N5h4nqpXyiafdMvFv+4kXwIuERwGmktWPImMj3yCkskTTWuSog3PMPy3p1n+zygAQe60Yk0q6
 a8H5mxSjRI7yyeg15Jh9gLjbnYo3plwiPObhHoqtZW32u4FATaATRMFojyVLbGtA90oTdftzg3q
 Ga3vtl39F1uVnMP76gOAsgS6AO21qDy54UOa3p+OQU7N8opp193eifToHcizecmDGTavTxR3CPK
 fVXHbSl92OS61os9+wSyldx9S9CNBeBT9wtCtuUDshpW8qMPC7WXPnUoY4+/ZpYu4f3syAWHQNB
 0dIW/Ly/0V4WO079GR5fUuAxzjMGI6BN6UE5IGLA8ZqFpRt3PFfdHKAr++euFGBQzYytIjUMu80
 bVYlspZJXECHtPmGvmcBrqg5fmY/jdElQn7hnRew6AQ+aAa+PuMpHynQvLVAKDIluhl0KhywXRf
 X2q+tivndzZfNgin/gfbtRcBKF8mqA50hiHRMrT2wa17Wj8q4XtgwU+ptqAj6PGxV6uIpncw2sy 1ox63wRvY6pAkMA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2bcbaf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Bpo9OX9RG45pMRazLfIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 52-92eVdJjsnFi1lozvdITQlnYKLmkpB
X-Proofpoint-GUID: 52-92eVdJjsnFi1lozvdITQlnYKLmkpB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4MSBTYWx0ZWRfX2iRuNxwVScx0
 a261USZoDfeqzC8owJaW8wXaudbRa9te1ltYeFascxKZTcm0XZmk3AgkevtSKjIV2ICrT3EZCrv
 jlFZeixkIm5LRDNlciE74xCUSUF0DNQFdObUyEhlnVU1UTllJpeUaCGeNC/hX8PhD9teweg2C6P
 mpFt9gc/90vMl3RoSKa2jgesq384OUfhRAx+UPwvGLxkucHn1r3Rf9yIVQKle/DqYjWeFF52D58
 4aywoaTlCPU0Eg3gqXky6VnatcyYVGn9Fwk7Se770Wgsa9x0lFBNdK81/qReSi0Z/evYpDTrEfe
 hEKUZkNyt9mKbO/71GjLI33bA1CHes0BpykXmnE4NYBNg63AlfDSHuuPuO/tCZA6HRDpF8BzD9B
 1qa0/PhOVP5fnWX0FcmVZr+JNI0d3U0yjX094pqyn4pvCqu6lkoQnGgsdVvtxHMzXPl746ulgsd
 BltJbLZuWmITrr2/BLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4MSBTYWx0ZWRfX0mqfrbB4c9jU
 HK+NMq03rmpusMfEMRdf/qsv6SZVy5XLV7UM3Kvlv1wanqe2ae84GqIrX7G4B+DRM9WySkqEX3r
 CZuEVsrfL/OLWCk71bhfjcYlaTItnaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112898-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B962D6780BA

Document Qualcomm PMK7750 GPIO used with Eliza SoC.  PMIC is almost the
same as PMK8550, thus compatible with it.

Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. Drop stale pmk7750 from main enum lisrt (the big one) - leftover of
   previous version

Changes in v2:
1. Add fallback compatible.
---
 .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 151 +++++++++---------
 1 file changed, 78 insertions(+), 73 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..5ecf5da3d100 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -15,79 +15,84 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,pm2250-gpio
-          - qcom,pm660-gpio
-          - qcom,pm660l-gpio
-          - qcom,pm6125-gpio
-          - qcom,pm6150-gpio
-          - qcom,pm6150l-gpio
-          - qcom,pm6350-gpio
-          - qcom,pm6450-gpio
-          - qcom,pm7250b-gpio
-          - qcom,pm7325-gpio
-          - qcom,pm7550-gpio
-          - qcom,pm7550ba-gpio
-          - qcom,pm8005-gpio
-          - qcom,pm8018-gpio
-          - qcom,pm8019-gpio
-          - qcom,pm8038-gpio
-          - qcom,pm8058-gpio
-          - qcom,pm8150-gpio
-          - qcom,pm8150b-gpio
-          - qcom,pm8150l-gpio
-          - qcom,pm8226-gpio
-          - qcom,pm8350-gpio
-          - qcom,pm8350b-gpio
-          - qcom,pm8350c-gpio
-          - qcom,pm8450-gpio
-          - qcom,pm8550-gpio
-          - qcom,pm8550b-gpio
-          - qcom,pm8550ve-gpio
-          - qcom,pm8550vs-gpio
-          - qcom,pm8916-gpio
-          - qcom,pm8917-gpio
-          - qcom,pm8921-gpio
-          - qcom,pm8937-gpio
-          - qcom,pm8941-gpio
-          - qcom,pm8950-gpio
-          - qcom,pm8953-gpio
-          - qcom,pm8994-gpio
-          - qcom,pm8998-gpio
-          - qcom,pma8084-gpio
-          - qcom,pmc8180-gpio
-          - qcom,pmc8180c-gpio
-          - qcom,pmc8380-gpio
-          - qcom,pmcx0102-gpio
-          - qcom,pmd8028-gpio
-          - qcom,pmh0101-gpio
-          - qcom,pmh0104-gpio
-          - qcom,pmh0110-gpio
-          - qcom,pmi632-gpio
-          - qcom,pmi8950-gpio
-          - qcom,pmi8994-gpio
-          - qcom,pmi8998-gpio
-          - qcom,pmih0108-gpio
-          - qcom,pmiv0104-gpio
-          - qcom,pmk8350-gpio
-          - qcom,pmk8550-gpio
-          - qcom,pmk8850-gpio
-          - qcom,pmm8155au-gpio
-          - qcom,pmm8654au-gpio
-          - qcom,pmp8074-gpio
-          - qcom,pmr735a-gpio
-          - qcom,pmr735b-gpio
-          - qcom,pmr735d-gpio
-          - qcom,pms405-gpio
-          - qcom,pmx55-gpio
-          - qcom,pmx65-gpio
-          - qcom,pmx75-gpio
-          - qcom,pmxr2230-gpio
-
-      - enum:
-          - qcom,spmi-gpio
-          - qcom,ssbi-gpio
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm2250-gpio
+              - qcom,pm660-gpio
+              - qcom,pm660l-gpio
+              - qcom,pm6125-gpio
+              - qcom,pm6150-gpio
+              - qcom,pm6150l-gpio
+              - qcom,pm6350-gpio
+              - qcom,pm6450-gpio
+              - qcom,pm7250b-gpio
+              - qcom,pm7325-gpio
+              - qcom,pm7550-gpio
+              - qcom,pm7550ba-gpio
+              - qcom,pm8005-gpio
+              - qcom,pm8018-gpio
+              - qcom,pm8019-gpio
+              - qcom,pm8038-gpio
+              - qcom,pm8058-gpio
+              - qcom,pm8150-gpio
+              - qcom,pm8150b-gpio
+              - qcom,pm8150l-gpio
+              - qcom,pm8226-gpio
+              - qcom,pm8350-gpio
+              - qcom,pm8350b-gpio
+              - qcom,pm8350c-gpio
+              - qcom,pm8450-gpio
+              - qcom,pm8550-gpio
+              - qcom,pm8550b-gpio
+              - qcom,pm8550ve-gpio
+              - qcom,pm8550vs-gpio
+              - qcom,pm8916-gpio
+              - qcom,pm8917-gpio
+              - qcom,pm8921-gpio
+              - qcom,pm8937-gpio
+              - qcom,pm8941-gpio
+              - qcom,pm8950-gpio
+              - qcom,pm8953-gpio
+              - qcom,pm8994-gpio
+              - qcom,pm8998-gpio
+              - qcom,pma8084-gpio
+              - qcom,pmc8180-gpio
+              - qcom,pmc8180c-gpio
+              - qcom,pmc8380-gpio
+              - qcom,pmcx0102-gpio
+              - qcom,pmd8028-gpio
+              - qcom,pmh0101-gpio
+              - qcom,pmh0104-gpio
+              - qcom,pmh0110-gpio
+              - qcom,pmi632-gpio
+              - qcom,pmi8950-gpio
+              - qcom,pmi8994-gpio
+              - qcom,pmi8998-gpio
+              - qcom,pmih0108-gpio
+              - qcom,pmiv0104-gpio
+              - qcom,pmk8350-gpio
+              - qcom,pmk8550-gpio
+              - qcom,pmk8850-gpio
+              - qcom,pmm8155au-gpio
+              - qcom,pmm8654au-gpio
+              - qcom,pmp8074-gpio
+              - qcom,pmr735a-gpio
+              - qcom,pmr735b-gpio
+              - qcom,pmr735d-gpio
+              - qcom,pms405-gpio
+              - qcom,pmx55-gpio
+              - qcom,pmx65-gpio
+              - qcom,pmx75-gpio
+              - qcom,pmxr2230-gpio
+          - enum:
+              - qcom,spmi-gpio
+              - qcom,ssbi-gpio
+      - items:
+          - enum:
+              - qcom,pmk7750-gpio
+          - const: qcom,pmk8550-gpio
+          - const: qcom,spmi-gpio
 
   reg:
     maxItems: 1
-- 
2.53.0


