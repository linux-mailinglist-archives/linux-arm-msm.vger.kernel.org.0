Return-Path: <linux-arm-msm+bounces-94215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HHHGJXRn2mSeAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 05:52:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C51A0E88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 05:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B3C13061E39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6411738A298;
	Thu, 26 Feb 2026 04:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVzMzRd9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/tgm5iE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4373876DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772081547; cv=none; b=GiqLvIc7uoUa2OK+ITWQxfTBzj4mtlHblRxL4Y1+HUwHc2KeGM9eCgqijd+FM+SS3h/x/Lfb0WdsybCrZVwZM5My5xF7KhkdOD1yJllsOG6tABRHH0zaHpnn+MOdql5VShudN74mJ7+FtjOHpzXWB8jFLWtaxJKqnbqc5SVMhSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772081547; c=relaxed/simple;
	bh=vLdj3B1jQPRgWbscBTiqCTeFKntrD1geF72D+7wghxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NykgdxpyQrGduECypGM6+XBdTo8536hEinEE/KExSTP+TFAwHTDu26kza0evigbTlvE1N7WrtvSb/XrbvHaNMU4Vo8mEE3oqum6UR/ZBhx9KFuZmZW34svHC6iMBdZRDrB3SYIBcyx1JxIQUDFKLzfYcphPY6UxXgV8TwmrTh9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVzMzRd9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/tgm5iE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4Vjj51280800
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWV4k21xN90qYzLHH1hU2Cz+AC1ZwZNUglGaqJt87Cc=; b=aVzMzRd9PhyVp58G
	8ECnNAIC3UYVT/m5vk0bVNAB76qkfWGGHk3DnLwt2nh6JnH+HJ3iZSOZs7iWxLPP
	dX27EY/XawnbmXnAfnpsJmQ/4XmQs01QsLZY4D/9ALKRVQcGz/Teo1IXQ1Z4IaD4
	ZJdZoFTZcWNXJK4bmCMUxxg5Tb3gaIs08n53e8NBop0VpRDCOsDqBmbbL42/2Tzi
	spufJLQ1AHv2N1bjk6klKwcIzJv0QmKIepYwPBYwglqRutdtlGsAcEVzL4i2gZA5
	0etqA9OjQfo2eNnTlnkyXycGfZAWX9l8FYvgFvt49JLHOsbKuXrS676/+AmxXCvl
	PJH9CQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39k914-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:52:25 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-679c5fde4c7so12319727eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 20:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772081545; x=1772686345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWV4k21xN90qYzLHH1hU2Cz+AC1ZwZNUglGaqJt87Cc=;
        b=g/tgm5iEauXoZK5O3xz82TVSr0qVjGEKpvLwluzXoHH15DzL6wqY5hJouR3UbDRIHC
         X7uFmqIz9jdE2kA297FkPZkBxvbmYgv5JFkFGnFyHkNiJ+nNZcV6iiC7Dqc/GYfxRF46
         2PrnQNonA8QmkgQY16eHIp0SkL9krYn0p4/ngmwNINt/xCIPXLlfHcu8dryyrtsAh0ar
         HIeEOOPfExJ/5CJFCA/1saBgGldgBI0hsvHj+xIzx/lRUxQ1VksNwe2v16kzWwBBmbvE
         AB5FDNIYPr7pDVbgV8abAZnjxj2kQA6NhJTk1IjPSRddcA+/uSDcLTDCFyJWjBnu4ECv
         jCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772081545; x=1772686345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KWV4k21xN90qYzLHH1hU2Cz+AC1ZwZNUglGaqJt87Cc=;
        b=kD6ffQKOGBHDG+rPKovtBeZBWY3lD8vvzB9rXGK9KKzUm0BDMOlxRi57KQiNZ0wdoZ
         kxcOIMrEEZnoVlc2EiBFyoBkcyUXCSe+so0sDQNiO67g1GlJM1O6Tjr+ERA0OTDkukWn
         F6VMjEhERLD5nKGM8rx75CWA8BmqLi0jhkld3rjD4OScZwoHy5zXxomDZ15Lw1vHlr3q
         AKyHgyHCU0shj0uJdatUbLPv+ILKT7Q5z7ZkYhBqAdt136mrQlbjt/muVwLIB9m1rLjY
         sr9wweXLQqBqlFBZ6NSWTIqUKvO5We0jSex7m9d1aXGBUuvlQA+NhPYUFUoweRKU7f04
         ck0w==
X-Gm-Message-State: AOJu0YwLQwx5cfJhbZmNgkj3mD98FjsI87xglyDNyxtLok1pwkCHVvLJ
	uEds19/V46YT9Cb4yZa4uKOBBJbz9n60yWjhoZWbj2YVQCw4aDfy+i6WwCXWV8y/ffJzAhBn7Ll
	Q4vA7R9pYZW+wWxupXcAxLk8LUcedYkuWxrUkfWnbqsj02BB2fWzBB0mAHpGzXLhbfzez
X-Gm-Gg: ATEYQzw0R03eR8fjJQXby05Gy0k4qqwFbwSBuPiNcQ8PAXPMyuSs1Uloy4tGyVFzQbN
	TfnkKe1QAFRo6/GRd+HxyG19YHrYG1eKQDCxeWF//g3hlN6r0hfgpvqC2ete5BuLqgJ8oIRjEOy
	1ZqXDH1IBjy26BxmVrIjvxISWmMxP0nMq8bU4QV/h3yFe8zGEo6jd3rYa2rBfShllXXYAmcryES
	7GHxYNkPsxdIr0pr25OP7RYh4wwu2vETAWhCKq72HMb0uvTImmllo1tMNIudbPeoOmQFs01aNjW
	7az1nEmDnlPhwQlE5B5TB7SN3ECU5W5llvAt2FxoE7rU2AOT0QJc7+bRd2frdL3lAYQiJtdVwjl
	C5rZZiTw/2oSlhykHPB1HLEdpxHq/ThXOvMkfMQRRojN6S3ZYw+rlCJwOdG+BXxawh1nN6YlIbQ
	==
X-Received: by 2002:a05:6820:62a:b0:679:a560:cac7 with SMTP id 006d021491bc7-679ef7e5978mr1648679eaf.7.1772081544729;
        Wed, 25 Feb 2026 20:52:24 -0800 (PST)
X-Received: by 2002:a05:6820:62a:b0:679:a560:cac7 with SMTP id 006d021491bc7-679ef7e5978mr1648669eaf.7.1772081544385;
        Wed, 25 Feb 2026 20:52:24 -0800 (PST)
Received: from hu-djaggi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cf239e0sm978431fac.1.2026.02.25.20.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 20:52:23 -0800 (PST)
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 20:51:06 -0800
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: add SA8255p Ride board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-scmi-upstream-v4-1-50cfba9e6a0f@oss.qualcomm.com>
References: <20260225-b4-scmi-upstream-v4-0-50cfba9e6a0f@oss.qualcomm.com>
In-Reply-To: <20260225-b4-scmi-upstream-v4-0-50cfba9e6a0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772081541; l=915;
 i=deepti.jaggi@oss.qualcomm.com; s=20250501; h=from:subject:message-id;
 bh=QnmqT25GQywckMFAOnXMqflitvwpMCh13NozaygAWDg=;
 b=oUVCwuFWJgpitJfbjxQD24WtzSepqs8Y6OnE3bXo0YVrsI7KtqQbty5125SOY35hJ7E58XUQS
 TEeUsLlNXNHDQ8mD5gbtlgh0abe1LXpp1gWMo6Rh4OPE5eoAqaY3yFf
X-Developer-Key: i=deepti.jaggi@oss.qualcomm.com; a=ed25519;
 pk=+b3H5UC/u0pUK5+btJ+35nW+6vKwJV1CfjJ1CJWuOZw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA0MCBTYWx0ZWRfX5ecTGMsHcFou
 lq5V05Uvm9Tj7dmalPweW3ocL+ZMLEjD0HGiWT9Jq4pzDngiqVhPzXUos8KNcplx2b/macElc7T
 HVFBbJxDe7Jtuloe3tXuUGBmA6KxfFOXKum6Z3nLim7XeAneS8Y8/0j/0tTUHWCnNczgchDlah1
 wiT6oEgvwJG08CWDRc1nHinrqfIbxiO9wxSIM2GbBDZOMW0011oGPa10YUF7FSS8/DlGIxV5pd/
 Xf/zKamKjybKNTl1WV81SA+QlIH07HMukevLSuvitesM/wtYU6+Pu6w70PpKn+wNgqwH/5vnGDM
 HAIRriglmhNI4uFJZgoRFa0TL58TD45yMwG8Z0psrpDRIMhC0PIwNf0sT99lBLCVor/ArCLN0DT
 vbt6U3/zrVDMDJylXlm1xMoDPwG7sZyoEFkfR831ZWSFJYiLq9semKgYrLmQ5c4tG7J4FVpErSv
 H6oqvuRnHgVlKuZIW7w==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699fd189 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=wDsz3shVdOXW4ZV74lIA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Eaor6hnPNcTa_QieUZzrwgpEBegPUqK_
X-Proofpoint-ORIG-GUID: Eaor6hnPNcTa_QieUZzrwgpEBegPUqK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260040
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94215-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 036C51A0E88
X-Rspamd-Action: no action

From: Nikunj Kela <quic_nkela@quicinc.com>

Document the SA8255p SoC and its reference board: sa8255p-ride.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..f9a04769e20b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -891,6 +891,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8255p-ride
+          - const: qcom,sa8255p
+
       - items:
           - enum:
               - qcom,sa8295p-adp

-- 
2.43.0


