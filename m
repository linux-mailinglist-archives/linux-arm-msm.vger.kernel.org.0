Return-Path: <linux-arm-msm+bounces-112455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8MY1CA9dKWoDVwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:48:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D5F6696CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:48:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N6KSz0ML;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=chDpFFS6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112455-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112455-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9426F3024142
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F655405C4E;
	Wed, 10 Jun 2026 12:41:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CBF3E317D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:41:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095290; cv=none; b=SULHGqQ4PUmrsGhXD1TromNufDxNH0cqFaQ/X4HyVjKXobcvtqPi8fj4g5EvCvupcpaLKYtDfqj73RGVqTuLdb3S/778wYYsPOyXps8AWOE3OLHjyJnqwyQB0WKkqzlFiQEkoBQFm8G2ZYYeGXlb3qoI0XfsUp2CDkqa1J0ChHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095290; c=relaxed/simple;
	bh=t4UFhLUWgfcf1dLvzHa9SEzyHPjh0D2eJPRUVWbi7Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=datrdHDe2xN3KtWPVogNfjrFBJ1+LmsswN79d3DSramSmS4H5Yde4MnUZXU/e7kphuof9o/rL59U7p49zBADNBTquFTQO2gKptol4cEeF71/yOBITgMeSb5XbEVZom72eynNaqQFn0LghL7E50GMoTRma8ycbRpVEWGtmLpt8wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6KSz0ML; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chDpFFS6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCoLe1598840
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GcMBOi0JK4zgVLQ3zdVYtV3Rxr2WltCs7Lt
	eawTchLw=; b=N6KSz0MLfiKJHys5hW5PESEfIP3MuMm9QKjaLo2HViMdSSqYw7X
	k1lNhkYjBU9UjLkBFko+mjmVB8SogMC7ut96XAyeWr9vIgoBn+B/ILA7hZZRa4p+
	rXsR+c8OSblrghPclHfc2aK0kLAanYb5BRZQSbQiHhSTDTsXIjxG+GLw48cFpPwg
	bCXDNLhMtKsc/AvrJuvJh1LWYZo6MOI7G6bY/xIo4Ag2aUeUiToSWkGyoqUn7pHj
	pOEuaV+CLDzuMMsod1Y7xb0foV5b+C1Aqt8+wu54mBB+7zFGMu3SJcZH58ihvYIg
	LN8JM+sIIrQ6m1algvuqJc9QChr7MCcDwFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2sehd46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:41:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51772325a64so93072181cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781095287; x=1781700087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GcMBOi0JK4zgVLQ3zdVYtV3Rxr2WltCs7LteawTchLw=;
        b=chDpFFS6dNkzCUDlP19otWJZkvuMpXK4Rw82BmD5zTMdWFftbNKb8u1hPm//v3M9MI
         UPZHdVBglCTysxhzrUiMWeLpKG2+z3s++j/jDSXdrCquv4Ap74eEusXvESXFKSNA7g0h
         WQrgOt8XcUeE5U2fnhP/3Io5iHGxMr9c+dqma+frSFsfDvS5YAQK+lLh+vYpS9mls1tt
         PcUZk2UetVAJqHYaNyfuRNawpuIja7mxoVVAPQnK8ws6YRnN9+W3Jw4P9cQqWtcQAnI4
         Ct1yfNQnJbFuhwnwPOONTvxSkQnaUE36fyM0GvvF+PQXos6+y+3KsYuyA0afsxfbLdy9
         1Xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781095287; x=1781700087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcMBOi0JK4zgVLQ3zdVYtV3Rxr2WltCs7LteawTchLw=;
        b=D6dmrWAmoHsq8Da/E0eklTNa4q4rL9c/i4Sj+t3eD8XGUFW5x3hSyLeGWZyg2TDQnn
         VDGy9Pt+Km5PBEcITZSpGouCJc13XxBe5lza79rmzz2QCmDAfgQ3ANgeXrgbPbreMZ7Y
         XVnyRVffd5wlyBR5s2yzkxLzPBp/fbK/8hH5Nn/sFlBOcvJXHHpa38Pr1B+QHEusaZ69
         nR2eN+fm1xSpajYTY9ulDPXokI7xA7aPJDBBiv6MBNHOaJfLLrElI+i0gYKrH+kt1H/m
         ZGuqsHOKvbh8lZJKE7S1qF2oFfHpYiwTdfhew8FgJOTYHZuhcH//IGWR5uS6+1lC81pc
         We/g==
X-Forwarded-Encrypted: i=1; AFNElJ9t8eGvlWWpyu2ywG8acfAUZTzM/9Kj5mOPAOsPOApVLmopWKYbb/jHJElybA6Ynt1+7pEgeZZEk0fLH7O5@vger.kernel.org
X-Gm-Message-State: AOJu0YyLsEHWy77zL9XWeso5/t1o7Mq7x1uVnvQ7gE0ZfpYYaNpzWIg+
	BoJWA+IAGSOgO+UVPw3xQWO//f2QLFiIwJGx1YB0tA0IvPJxM+ou69/5b1nojsjb+CSIEW8/KM4
	kNhuGxMqad0NytVFOxkerM9GNc3mf/U0RbFU6YYeoJBiqOqLcBhxfM9Htj0NYiOvXftw3
X-Gm-Gg: Acq92OGkY3d6eETBl6F3KY2KClWCxP/Cm+Yb5yxfWiEqkV9lXXNhu9rR0QQ18KzXpKc
	1HzmYqidNHf1xXAbhL06VmyVWEeWaw9y+7rc7SlbTrivI47Ty8rIAXnIqvwFAMpg5Nh3Pb5TcHg
	I0NTSLw5IIybxKVV2tEGtUZEma0K+rzcHlUsgl2Bb60nqxjx4PrUJoPYRxF1n271m2PX42GGAq/
	l1A5HrW+bAKqKCOPrRUSK8jlVKQdCon95o0GV33jnDq9GZpIcUEMZx/6Tlo1smXZZd9MQdKHQZB
	2nfz4wRZ/6bcIftJ4x9Bgq9Khiyq1fU2W2UxQzQtaNmGBUxtugWwqH02uakUb9goLJ6Kh0TyxIq
	ryNnSfM20DFU1swGrrw3XO7XxIjWucjBq0eJetmt1dKnbq723
X-Received: by 2002:a05:622a:586:b0:517:899b:7f7f with SMTP id d75a77b69052e-51795be149emr353929211cf.34.1781095287294;
        Wed, 10 Jun 2026 05:41:27 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:517:899b:7f7f with SMTP id d75a77b69052e-51795be149emr353928821cf.34.1781095286827;
        Wed, 10 Jun 2026 05:41:26 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bda4fd52sm555105625e9.0.2026.06.10.05.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:41:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Add Qualcomm PMK7750
Date: Wed, 10 Jun 2026 14:41:20 +0200
Message-ID: <20260610124119.253456-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=873; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=t4UFhLUWgfcf1dLvzHa9SEzyHPjh0D2eJPRUVWbi7Jw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKVtva9iSep3/8CwqSmZjcpucyjaFeevTqXOeB
 kbXznc06oKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCailbbwAKCRDBN2bmhouD
 1xouD/4x81wfnhsPpXQWZog6AkBavo7xnpl2mnBj8t07zrjU8K/3IRITF3+UmBrKxLBIzzW6jrc
 AoSeYfddaA+1ne2GUAIvdgoL4cyqk2FJRO7pug+9uPN8GeQj+o9KYoOUAyRxz1EBmifWVAoxTLe
 dX9DBDj8Wj7JN2syenApJHXtzvTwLPj1RUtZC8fsrmc4ydLIkfdiSGkyWBPR495k9ynHzlG3tw9
 Zx0FEWvZdvTK6zchixgCFouqQh2qESZZe9NJqSYwAtSmI0Ytkxmql41QHEWF+XqqbkMqDWKHK/8
 uAqkdjQx1FM5WScm7Atoer63WF/huIW4btt+8hyDzabQxTJiWDi5YBvV0Y/gn9GS62N4yVPCQj+
 9dd3t8vgTnY3eqx3MG8hS+mVo4kD4ROaXNICbWppkIqtOqMn5oCqys7w5C3tiaQRBChrWTMkc7a
 YIeemCrzoHSLo3SfKlLeH9GmgQMSSk6vXIPX1vvQZXpNqQKejL00oHLfusFoUndOk1aDpPKx5VJ
 V6F8RTbDBHnD/rqW86KnZQmY/gDDPY3dv5Rgf6xLcwO8CQzxVvvXGpQ5hUQxT//5LyZVHsZNhNC
 /DCzbNeOuF7R2me0nQoQuXYuloFeCBOxfeMTOoS6yPuYhx5AO9+pqcmCAuqZ5yfTqImGSUigR3f zG0V5TnoS1pQqYQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xZ6vbAeh3LJC2p0BUH01QYybLovwxPgi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMSBTYWx0ZWRfX8l9bPEg6FlaE
 qJ3erADLf+dp5wugN38pAcF+GfUee3Je52Ehe3O7kLP4W87ExqufrUvZ1sRa0rkoffm8li8rk+h
 JcaMUrthz+U6EaP9MjDDttLSMGaz6zV2iGP94iuZSif9Ndg+I+afDkVF4wOvR0KeRg81xKCHbc7
 32Qvx595z3sk7/dncn3knm20dCcqxIsFDanKYR1l+8n9gdkRCO4qpft/WaWonUdD5bBWAni5yDq
 g7Dti3WoEi0m0F+XeUvDUTXKlXegg1LzKHadrZR01r2eGtrwS422lR5PQQRGmIX4FXL55cJqqHq
 3C6Qp9+lXCYryXPz0RlyIn6xOAE0c5/Y5mdC0HuuzcbE4mw09Ly1DRODhufNLfetces6290E0Pq
 Ry4ePQZQMwYC1WqGcrjhOqfHXEiiojNFRN9tQVVWHZYuoAXZJprxlzzzdMwYnYaMuLaF7Rm1NXM
 XYNf7j6CeMB4w6bTy8w==
X-Proofpoint-ORIG-GUID: xZ6vbAeh3LJC2p0BUH01QYybLovwxPgi
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a295b77 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ICkWozapxVMSujomlaYA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112455-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67D5F6696CF

Document Qualcomm PMK7750 used with Eliza SoC.  PMIC is almost the same
as (and compatible with) PMK8550.

Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..ae7f91914b2f 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -90,6 +90,7 @@ properties:
           - qcom,pmi8998
           - qcom,pmih0108
           - qcom,pmiv0104
+          - qcom,pmk7750
           - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmk8550
-- 
2.53.0


