Return-Path: <linux-arm-msm+bounces-97020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +I8UJ4iBsWmjCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:51:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E987265C1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A57130BF2A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DB53DBD76;
	Wed, 11 Mar 2026 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NhRPigTw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjRzLPNY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652F43D34BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240437; cv=none; b=C+OHspwyOr0gBt7z+gsZE36b4eNASW1SnTImY121jP9Q5MDm73PWbBI3YAUxUqya/bgk9SDuVw5No4Srz+Vdxpkrq65w7A8DFLL/3fKCNUMuqjKHm/93j5OGjL7aYQnozyKUiQbkQYOWvqartk5KUo6pGdwHXbJoYGCTkRnOdfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240437; c=relaxed/simple;
	bh=ljNAanNsQX3haUgfK2VNArM8xCcxc69jvU1l9y/w+to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tEDXJRAW3goTPDT1kt8hDSThqCmhfrIQDwukMlMx1Ff/RxB9U4OGEd085Lt2Iu58DBCnYoYi91khPyNBHPkWgh+l11Tu36kxoRZfxFNOIG/1rQy4NMqlWSdwDv49tLJzIvYYCjgG+FnSoxQz4DM3jQTffwUUqYstbJxbTOaC+3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NhRPigTw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjRzLPNY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B8buuf508290
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=; b=NhRPigTwHLih9EER
	wE5ryBxfWWhnaoh22yjPkhScdiqLEKwf+Jui3KfuX/juZjFu0a7fN81BudsexAhD
	I9sAFYNW9yqisovv7p18UODuVs9M1Ix3WFQxUjGSCr56+4kCs29oVeTZoqelIRJE
	o2Gf8f4+UeG0TVGrqcOECHdLaTIV42Gqew1gER+e1dNvnTXSTrEy+h7Hxj8yL3+F
	6pI0ftbafqYyLE41UHSoDhC00nOY5fcATI4Yigym/lmgtneXrhkvT8LjwoDxfVtv
	ZA5Jc54jf7TKFKBCAANEcAKmwsNhyrjKSPrz3OApGHn0DFzCo89Q1lHX3Qs91cXG
	XdFGFw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppamaj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a15bb70easo16172446d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240435; x=1773845235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=hjRzLPNYnIOtwN8ib7pKFvXxtE96vntFUkEYgWxtpzFWf1ocKY1KeXREknJypf1Iwc
         n4DJaZZORmR4WYLQPcNxpHq0cTflWBg2QRhovhWMtAttFISqtjqnpoI03EOjfEc/yCLp
         PLXEFzq8vODK0bLNT+YPLWvBllF3tPKRXYWRgKJT+hxF4zsxuLnIuxquu8ZWU0EhqQsB
         g7QU18+DUp2ElXHoftX5zWdmoddOklhQFyGDLKyWZQaLnMh8KJdrpHSRq1rD1FCUpVgK
         CLbmRzDWLenzudLmyaTFnkX8GGJWJW9pMZFfOzn2qF9jL//QU+h7puHuQN5HClUSyE4g
         plPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240435; x=1773845235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=ww5hy6kjSPiadj7CaeSEqsdMzsAYTFZK1Q7rWTpOtZLBsGZQfP3BPZhwmX2nho7Sur
         8IhzPBuWxSNHkNhAhhxjYeTgqfgyisWnZqDkNFqgKUa1TGyHJULa2oX1B4CoYAuPJngo
         6pOEB6ny7uuTfByTIY0oWiHcd/kw/Emzsdxq8igKHj6a/igUnNh30NbQchxQtQbMmT2S
         goUJBJtweiGw1CfWhZOAfNivQO4rs+728KK211zIXz7pxzMz8L0Hgoex3RgSb/4Wv+mB
         SdjE+y7o78MWfTIdQuwIZzFHREbzJFpeeVgokhaLkmlufaDyGKBU1GfkItst1uJMuXak
         VaLg==
X-Gm-Message-State: AOJu0YzHj5j8zRk02riDK+FKAQ5HMZgRrv+3WXSjjCzEvgfFTFb+JfLB
	RSo3jrls3fvRYrVaOiHS1f9RVTYCYdLurDDy0YU+zSyHAw2Cx9VCJZqXpL9s7+Pib+P2QEX1e2V
	wopFCsmWGIP5MCIc/a+RqkjI/E+ypDnFbBxyN03oGL0BHtyhZ3SBnsrOaiIfZa2falzOT
X-Gm-Gg: ATEYQzzcWKbDmCyscJ8Eix1RgW9ZrJih7b9p3iysrPJ7qgoH04K5lRn4YzXINwQ1Ryi
	D4yF3A570+zd4k7naz6ma49EJozwqXE4ZWseLLiL9MUbf6kQLRB/e1S3thJI9hdERcroGm/u8Qy
	9bDT+gf9oudCCqmAsboeJX043DOwWmYut0XldUMxglF5Eeng7d85kmzr62KEUMKYsyehzThQRIt
	hyaS4AwwzSDz/KMnLdLCBUD1KJkkNQnM4hR0JIP+zVLIXub3UGs7PYJcidseNUe9s0OqNSz1tUk
	5abZOi7gdZy2ku2YQyKobj/oueeAdWAlfIDug5bY6KAVerxZTS7JJP0C8JHkG45Dte8CB4YzmRH
	q3wf59WgBuwGMadm5Oo6fk+3mJi0VQA==
X-Received: by 2002:a05:620a:44c2:b0:8cd:79f2:dc36 with SMTP id af79cd13be357-8cda1a00219mr344392285a.31.1773240434591;
        Wed, 11 Mar 2026 07:47:14 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:8cd:79f2:dc36 with SMTP id af79cd13be357-8cda1a00219mr344387485a.31.1773240434091;
        Wed, 11 Mar 2026 07:47:14 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d61esm7992501f8f.8.2026.03.11.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:47:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 16:46:33 +0200
Subject: [PATCH RESEND v6 3/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-eliza-clocks-v6-3-453c4cf657a2@oss.qualcomm.com>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
In-Reply-To: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RKCYGsJFqEQSzos+9ejqQfu8ULxnCzq56BctAEfqjW4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpsYBazkQCjD1jdlLoYhC/2bidEor05LzBe6Pp7
 B8U64+yLeuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabGAWgAKCRAbX0TJAJUV
 VnYnEADOAphzFyZKVCYegJ82QLijWrnVnJ87tBA+Hyyep/9t9juBWB3cWEwU8iqhdJ7RTrb9dUT
 DZkCBuvwQ+hkfVGjkWrwAE3pqotRu3ezWYwQJFDl7LQr2zb3PaN5s4dX9gT48S4GF8fpsDTwbP1
 mav7Zfj+HBMXEeROa6pFJ0j8ubGldybH3BIAsTIcWhbrnzliyAnRaZKCgiWa8UydA/VA2N3LuIn
 FpA65ZObUgfjg7iYxaBC91rHUENWCIfcYBktlVa5hKY5hbIhZ7iYF2gQNyWUyHgiRqMpsmcTJqK
 PqBWat2bn68DOb1Ngcw4/yE7SRETBpalOoDFi3B3KJ96zItLZ2yr6FNnWE5YYjQ7wElxMUPRJUU
 JAFbep+JhSPiIuN4QDTTzMbzEPOcasJQd/VN7eCWhjJuqpbrqQPwkR86pc1pulsLOlRiaueQWxi
 jTI7mI3o1zAmnn72Of7+Ks9sBC8MDs29obvvdUsb622ywxPh01MHO5vPVVUePlm4vkiuKNILXG5
 yiYqonHKkSFeVNtp0uNhTT2m5oYK3+7kBhnaBBRfQyMZBbwG/lPXVYQmAE+V4kfOyiM0zstY+VL
 GOW4msG/cAZ3Lw2bb2xF7vOg+yKzCTru2XMQAADHXQkWY4cMsH/LOJEdfsMPudmaBMIyf049YNR
 eWB632XSMVZw+dg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: cW_peo8SNKJxkKN-Rs0-Uz3eVk9xMA8N
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b18073 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNCBTYWx0ZWRfX1jGRIiyWhqo/
 n/7wqaBnMmdStFMjAa4O18fp7ag2stbRJMbIHc8P8j1tRRDmlAJI4gndhN4CqoDAPCMRYm7/JWP
 mB+l5IxRF22SVZoOcI9Nh7fkyKZVHpaFMxm1dlrutyxte4cDBxrNCkGZz2170DP0Eh+hho8eVU/
 EVDIRsbs9ztFk7As+5dGtV40gB/n4WuSrp/89AeWYv4Z9iu+GQDu8v4suTthPNoS9COcuUJRx9G
 RzOFngFMkDBVK8N5iv9xpit1v4m5mK6pc/erXnwFHrUFWjX3VO5tDEW4/HIKF0ufrF+jP12KRTi
 VjNWJoUghN+V/t5BMK7nSx4EnMkaLKV8x3NMKZa6MJNSAikt4264uL7CJRX12n0Ypr3e4WPfHd3
 lL+iZvvNZPnEuGvp0FHrPUshTxIULFzDAgnWw9wci/x576jOYvToyuhMzCgob6g2IeckOyMQmMK
 qnq45VbipZtzOy8rgdg==
X-Proofpoint-ORIG-GUID: cW_peo8SNKJxkKN-Rs0-Uz3eVk9xMA8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110124
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97020-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E987265C1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for RPMH clock controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262e..9690169baa46 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.48.1


