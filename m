Return-Path: <linux-arm-msm+bounces-102459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCUiGFFv12k5OAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:20:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B63563C8600
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B3AB30416D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043423ACEEB;
	Thu,  9 Apr 2026 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWlXyZ2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLJCoW1O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8E73AA51A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725941; cv=none; b=bcm/190DiJc/A1qowGd+ikfVdk0GiBMYhKpSACp528pN914E90hqLkFqD0DAPSQddtG2hy7TRae4TrHtuMXXBxkp+AOBMOM/k6t+/ogchk6FQcbhiQp49RkaKYqNn24wt5rrg9iOd/uusWKOR2ucYcwhqIOWNOVLbHlq59/G0P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725941; c=relaxed/simple;
	bh=IsWusAWlosbM4j9npc6qxq97dbDQtPZwoYZI4+aRp5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmuSILp+K1CGNLddFWzDCnxYHAKzNrvvhL0VV3gOO5vGvJcddLwzbZEO7wFz+eH4sScLiuEhwrTG2aQ3vpWiz72/oeDGSHdzaDFPLRo6KDvPk6bGGLZCxzW1Ah3jRtAE4rINnPrKLM9ETHl5A+4cultvjGc4M4cW/cewzAfCZI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWlXyZ2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLJCoW1O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6393CIXw1727227
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YdYBqRFnyLV
	gWS2qLz1OhP44yxjNcNwnyE3ts9vB+mo=; b=WWlXyZ2SyYOeOevFQKbZB7X55jP
	WFQciUEoIJCkIqaVexo6JNnXn5HjAxNF4e5T8FRm3T4SP8vGEo1njGaEgnDE4lzc
	w+M89GKiVo+IQTC4KUqzP5o7H7H1JNIqHuuU3eTiEqPd9Pp+6xYyo3m8v+PizBIH
	g+x9kjREC0/QM0e1VylAzFbcZq1Zt3wAuP4rO/q4lorP2fg1C9Osp8XlG1bq4XCw
	XXIfflSDeq8bvrhB4W271/OuhdTS6NQnKKLNPJuZg9tmZnn36FD4mGAiEHBHNVN8
	igdhlPp6RubKRBDZ31iN1Jkw7Lzo/y2w2CW7YjDnb9/FaXbiGp6SmfUhFqg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrtgs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:12:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so670286eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725932; x=1776330732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdYBqRFnyLVgWS2qLz1OhP44yxjNcNwnyE3ts9vB+mo=;
        b=kLJCoW1OFlBB+o71G7ph6ZxrxGI7plV7e9mOwC/eKB6kH6hnKzXpAHNIe640CzeW0R
         H/pU8W1DwqdFJ3Fg0AQBwkitvUmYdRZ8xjN5irDcyzVYVJxd3hquC39GywuH7WX5tCPI
         /va8PJCjLIdCpSqiYDe2kliiiT1PGX7lMiFjR0t8ZHgLurdmZMCegQBDO7ovr8mlxVpI
         R/mVmfWkKnAvhqLheCJvTavVbUuVPQGtfFlm7+P3ANpY6a2PNeQYJduNtWzE2VDq5UuH
         WZ//7YJSDr/C7q/rF8n0fLTNNYwYnrx1J9lb58NmOLRhWTuaMp1G5YZtlxVhALx34loq
         7s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725932; x=1776330732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YdYBqRFnyLVgWS2qLz1OhP44yxjNcNwnyE3ts9vB+mo=;
        b=nBGhnN6ThfGxQTbsRWStY4itShYJAwT1xq29sWGnpsvYXxFgxrpjzWNfxFOdasiDhv
         A1z0RGFaMW/YTC/Jvbj+q165M4ZslnOdP2RYC6DcFq780AMzxTpWM3BzZB/C/R2dxdlE
         QzwElgp/eycHCV4Nb6KPWNTT/NtfA1gddoDRsRaFocUzOgqsC/p6ndarrBxyX67Mup6E
         F3+YVX+5PLn+dSbCcIQj1/EvxF1PkGbRQDiIc82+7xEpBa6ofHZos6/0hTpCXF1/ZBHw
         xXsTHedfD9F/L2VvXUzeBhp+AI+7MPOxqfSbCKCDj5YkHG8hi6scl+4ANOCv1Jy/wcDB
         RdEw==
X-Forwarded-Encrypted: i=1; AJvYcCXMvuG8dPWElRsrEW8EMBm7jfylW8iWxCn9BwwCkP/cFigc+nFeiXjl/DuYvF7K+Nu3SAcOpRRBJ++OCC1y@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWPX5qRUjfI0TZOQtCnU1YdrDUT8QJintldrh4o4N/WeMBJkg
	5tbYuyP/bT50fFADQegzCTDeGVas96tVLm5/+HfwYVjAfr4eFJL7gEgVNGIxYNAeGaGktrmarHW
	ar1joqzLUupRK3PkypofFa9iFTJfHLge2Sv4KNadx3Y6t0bEEcpJoh+MzQy6/eQjLA/Pn
X-Gm-Gg: AeBDieunpqWTn3yUnwRy6i6RigSVV/Okei9tI0n+D68S8MDdDf/4QJxL/LiKc5FSRvB
	YW+PFadQ7+MXiEXtGb3liMVtLKQIxodmtCu79sQ6hAsZihi6pmH5lpC7izYXAX+L+EzoWJID9Gc
	ebNLWEqS++fhapIKn4lqtCEKmmegkFMeSkoUR8r/BFYwn+r6OxlISwCk/+Io1lAVyG1RvKHsRLp
	tHZt8S07dYebe05UT1H0IumIiQqu9wV3iA9yhw0BxEPIsWr1haJqEhLYwFu/D9KxrZSW4Ar4ycE
	cdF0CuFQ9XnFx0lgz4urcp4q8yIiV3WmEkOMwnqGgxxXKsoM4Yf+vcmyH24qUU/a/Pih0PMgmbY
	wG+XN1k0NpQEbiy6pt+tSgmCGVYWKdws2Vb6dgM9UVAfjd722i7UsB1svhb1adhFS1zWmli+HRd
	JrObws0Q==
X-Received: by 2002:a05:7301:d1b:b0:2c4:b5bf:1d7 with SMTP id 5a478bee46e88-2cbf9af8ba5mr12366816eec.3.1775725932047;
        Thu, 09 Apr 2026 02:12:12 -0700 (PDT)
X-Received: by 2002:a05:7301:d1b:b0:2c4:b5bf:1d7 with SMTP id 5a478bee46e88-2cbf9af8ba5mr12366784eec.3.1775725931433;
        Thu, 09 Apr 2026 02:12:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 7/8] dt-bindings: arm: qcom: add SA8255p Ride board
Date: Thu,  9 Apr 2026 17:10:59 +0800
Message-ID: <20260409091100.474358-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX7vgBqqBofQGk
 W+snFpCvPgpSAVut6CIujIjLgKZnyfFWWe8fXnSxtvxTd4qeLCNDIxclacvMTcaXGcg9gfu6xTM
 1LCascgUtCU7NCNcFo2d7sPQHZv7nMlbRNJcs6g517QrxdgHKhkqgrY8zVJWhnabBGfXaEFlltS
 LzTZPePpPZEB3AUEDHIWF9Zn+aaOnNKK+VIekfFKKhlwGx/1+db6WzWsc7Pg5Z0z7o5dBXwAgSe
 SgDE90RiHm0E8Tg/vdF0gqznEuagfa2wajUC3Y4NJjSExzRiJq1T+G9pYmrA4piqoHAEPtG+pPn
 ppAGLA3ONANMnklBqSKZn2pKvawQjtTkQiWTTMz3zcMZhilMPQCQdoBVKZk0XF7uvk1c5VnC+rD
 ke9DabmqkhTiJ+h0r9JE80z9NnlxI1/W/2smmh05+92+Q+6z/CCkGWoVaJBwZ8cIfUr7LeAj//+
 TaIgKdYLOdUHnLbFVVA==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d76d6d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uytbUiI1na4GE1GmpowA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: b3H9pWkNrl6k1bK3rl2ler_76kKrUfkI
X-Proofpoint-ORIG-GUID: b3H9pWkNrl6k1bK3rl2ler_76kKrUfkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090081
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102459-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B63563C8600
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Nikunj Kela <quic_nkela@quicinc.com>

Document the SA8255p SoC and its reference board: sa8255p-ride.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9f9930fb9a5e..9cb4a8623060 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -927,6 +927,11 @@ properties:
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


