Return-Path: <linux-arm-msm+bounces-112316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LMG2DyMJKWqKPAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:50:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4299666628
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:50:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jm+5Qawj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eumv87tV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112316-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112316-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 785983041A9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F85C381AF1;
	Wed, 10 Jun 2026 06:50:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDD53769F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:50:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074205; cv=none; b=bj5dZ/afh/w38WmEMAZ8Y3LKr51NxD/9YXKlqB/WDtJ9j72AtTt/SGyo5FnJRL3wxUn47RvpzKSyOTP6KYGmoxzWQ1JZAcNTr0Zn8qkxqyVPx1vbhED+06dM8S00rUj3z2tHTDil1vwmEWUvhxXQps6SeVsp0nf0S5eVVFgex/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074205; c=relaxed/simple;
	bh=VrJim42FbHSy/OeG1J9YqcgVsPI6batE4df3YwB+vUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sKDkQ9BiGqt3XgAi/hgUpTDzIs2yqFwtQcCGom+anDY2rn6GYs8ZmDDRCkHufwk+uRW8l8Da9Ck7Q51yTp5Fo/FL5dWRoe1gPER4F8GFPFKzvbfNOJokBMmCEEOsPWx//Jw+XHda3PIQ2fjXSROEmHHzNE0tcVMo+V0b9IffHg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm+5Qawj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eumv87tV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2eidL241147
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J/sCpXlUxEW5l79X4rBueU
	wBetk/KTDxsJDk6SYuyzQ=; b=jm+5QawjVAmc4J8ptv8QH/Cy3Mun03klOz4VnG
	I4bz+uKDmShc0dir6ZhglGNHR4MgGaCR+pwFPhuUMymfMYfy+d6PEW7sb98PTcQy
	vXXl9XM4ypuyxqZywjZg79SK/1icf4BLP08oYX3xA71RCNdWyuuRWVHZi0nYp4yR
	mkAsZadQAwvUih1P8gy/T0CV1Ypm2aJ++uiJK9c2WIs+w4G3l7uNiq1355HuIdkT
	6CFT+WL8EcGDm9Vi1IKDk4+RBH/djOOnsEe9hpTPda7nX4w0etBgkFD7cyBjanQw
	d05Cry7Dbbs9OQRwslkw3jCujFwrzPk0GYrSCW8AY3bj8l0w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epukesnc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:50:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304f23c55b2so6725587eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781074202; x=1781679002; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J/sCpXlUxEW5l79X4rBueUwBetk/KTDxsJDk6SYuyzQ=;
        b=eumv87tVnj84i5eGxodgwzw4x5kfl9ndiyBP/4DhaVUlPAQasxzcJslW3Q1m4MRMLx
         yKftHBEqyGHo57Ywqm6yWgEw2j/mcLQhMSj1GPqI+/lazWVZxFJTJqAcP6bKE1dws9MP
         G0KD5yy4gqKx890CoMmyIMoD+c+P+IJHZXuigvkiHAGKqgt0uN7jnvnWqUeiw7eT5j+l
         VGvc/IJJtFwe+khvRHQot4mpbgN+dCrrQ52KPv7Pl9wGZM0HU/crsgsHE0d2D/jFXwNP
         6+4W0tsv2ogYjiF0VkqN0vcHcZNJfcWrT91z3n3wi4JcAeeGZocM/xHzlBhKk/a3zMJW
         B3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781074202; x=1781679002;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/sCpXlUxEW5l79X4rBueUwBetk/KTDxsJDk6SYuyzQ=;
        b=kPv06YahF6b7+0EuM6QHJb+Zm9sxWS8rxFTpZE6rbbRhDSZLQUuhKjJB67L7YHWB8i
         yPOQ4Ifvnv79j2syWH44+WBZ2cxydEWu+KXl6/PA5oGW+WDGwcX98ZpUVdmpeQcZoJZY
         5/Sk35sgvpRT8uBwH3y/nDlpSECbveC7yRyJ0FkjA83lOq9kR3jL94c/WP0yBPDlcvVw
         IKzILI5y+Odwyx3Qmun8UYNkaSCb6wvtbwM+vYuK+FgsCjiwG3ZpnAqv7q1JWK3kkCIt
         3MdDfgY9hG99mkZOcyMnV6ZVGPU32yLToz3Jex20fybJS7KS4ZknSVA63fx93TYf1tor
         dQ/w==
X-Gm-Message-State: AOJu0YxISJmmpWx9zdIW+6iPcZIx2ZUqhNaTlvliVOL4kcIgdBvR/OYn
	cGOmD32jbjOKVhCptlRYeMSoHMRUtn02CXH8xaTUtJXGup/SOdxDcc8s8cqsYZ3a0CVYAX0eoS1
	LzFd70llFeZdwC+/S5oCtKDrX5IsuTZKa3vQXjbxLG3gxw56MT9f9D/ZuzlSDQ9TPHqGV
X-Gm-Gg: Acq92OHA1G9wipi7jo7B/q4OrtQbTrDkAdeM4gckdBKlPJE3oUqo9gRMKsgn0ZY0Wiz
	NjUL/JBFyumdXcmL0jfkr4lYrw229FLPBQ396mfjXcCzQn9nFhirYwBfDhSXiC6V3/8ykTWNmMe
	Ye891h3YMxSQeQ+Dsn5oVLFWt0a8s8XDeblCgMrhFgmy9ZXNgpZBQLjw+nPvdHb+YM9fotE+qFc
	ee1zUIw9cBYfOts3Dg6rfU/rarTffdLOHC8OepqTbRH+eFqdkizFZrjxlCHJd6e37B/rWBQARcN
	PvCaCpLiwoQOnAb9aWe6qsAhS89NraWXHpUkrsQJeiB8LCedb4LgaVdDaQ/Q1clZd0wGWfks5hl
	a2or+1YkyfIPeJCGiLeM3q+TFOJT19DMl1ayOJGA/VWUXw51AnoQWvrzbAuyjn8VXIf1pg+cxfm
	aymAAzETwK
X-Received: by 2002:a05:7301:6794:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-3077b3908bdmr14107379eec.11.1781074201955;
        Tue, 09 Jun 2026 23:50:01 -0700 (PDT)
X-Received: by 2002:a05:7301:6794:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-3077b3908bdmr14107353eec.11.1781074201305;
        Tue, 09 Jun 2026 23:50:01 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea9226sm24420518eec.19.2026.06.09.23.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:50:00 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 23:49:59 -0700
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMG1110
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-pmg1110-v1-1-6604d0adc907@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABYJKWoC/yXM0QpAMBTG8VdZ59pqZ7TwKnLBHBxltCEl7264/
 NX/+y4I5JkClOICTwcHXlwEJgLs2LiBJHfRoJU2yqhCrvOAiEqatNCt7XWeWYRYr556Pr+nqv4
 d9nYiu71zuO8HC+3WP2sAAAA=
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781074200; l=925;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=VrJim42FbHSy/OeG1J9YqcgVsPI6batE4df3YwB+vUY=;
 b=omdgOQqdXWowyW+Bf8xdAAbBVlzzqrGCHkzANhtaFBfYKbB5kyLpfPoutCNNJUHoDOMq5MFvg
 BhA4skzUW57AplYk8iVe8kCTiSDh6Vlkp7AxMzx1iRmSJ07bP8r5iXJ
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2MiBTYWx0ZWRfXzU9u6xWbM5XL
 OgeJStUrucSw0LU8LjdD1lOwp8pueXECRBLSRFXlMJGuQDwYTHlQVIlBTkHaZcz+Trgi++cL5H5
 QWaCEuNtea6uBz5tE58kJZkXbOb0pt7ilCOI+K6V7Xh7dfk3685SVENThCB3q96YaGQJlMLUIUF
 xRn9cQW2P9pV+6lhDqsBV6UjdbdkHstd3083MgZezOZw+kUc7wF6ENYRgVa2RFvMyt4DroTrfJv
 3X2r7bgUXoLRxAA4AMpi9WvzJxOWeghDtdJbFcYBxnBR8umvPhiGkm4QpgbOxMba6TMLsMy2XJK
 L+5KNVHh4LeMgM5cbUiOkbihF4Xhn6d8/7+t+1OYmLx3ytI/6NYFBgk/wPz4Gg/i7gXVzTYkld0
 p3i0Dqo882WT5WZZZJgkmYuy7yhOQV6XTl2kOgQ+uKW/Xt7OkNk5z/I30ydt9alaZrmV99wjKkd
 +0RoCCqJyaE6MmjVziA==
X-Proofpoint-ORIG-GUID: F-whf4_3pHMA-3QigeS4KcsKGsQvmj7G
X-Proofpoint-GUID: F-whf4_3pHMA-3QigeS4KcsKGsQvmj7G
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a29091b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nbmi_X8hiBWjOgQv_TUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112316-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sboyd@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4299666628

Add compatible string for PMG1110 which is used on Maili platform.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..809be2756a0c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -80,6 +80,7 @@ properties:
           - qcom,pmcx0102
           - qcom,pmd8028
           - qcom,pmd9635
+          - qcom,pmg1110
           - qcom,pmh0101
           - qcom,pmh0104
           - qcom,pmh0110

---
base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
change-id: 20260609-pmg1110-6392bcf284c1

Best regards,
-- 
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


