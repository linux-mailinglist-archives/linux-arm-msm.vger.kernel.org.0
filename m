Return-Path: <linux-arm-msm+bounces-107555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLh5JVygBWo1ZAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:13:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0244254039A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B46AA3074BF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BD338E8A6;
	Thu, 14 May 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaPqxgdo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XT/PFZi2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4E738F923
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753393; cv=none; b=pvYGV02zkkJo05SWB5/bdCvF7hX0HrSnUlxo03ZvD1ih/hovtWuWsLj6JNchAO+E8rAdSPpFMczrGwSCLinDYm39KVh7aUiQgG8w7oTdkTtSrB3QMsh52s+1F9jm49O418nnXKHlYRRruUR+DXe99mW/4vWSsGxWKyJz210MOoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753393; c=relaxed/simple;
	bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f9Oz0XSuJgbd/VADPN3Zd5f+JvUT8DYGSctQEU9THuby33Oa+e1QnKieCH4sBaytsznORAhUbM1NM3ctH2PB+730Cip2z2ZVtaV7ERSC/fReAXz/8HSySAMh4NisXp3PbNhqP/hOfuK6oTwns1vyLWHAwyvEFjMRzjB5vmWtow4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaPqxgdo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XT/PFZi2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kK4h3641017
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=; b=kaPqxgdotF8HSTsz
	LpFohmizT3y3giUL6pPTMQUG9YWLTXRlCvKrj92u0EPsC1ps5ZzefK12dIV/g2vh
	95VqlcmITakvQKnWXAtVabkdtfw2MsUmh/rlH50f1Z7UT9BTIJWLUh8VJvSxT5qT
	62tOi4rAn4SK0agQQpU7E2TRrY6wUacGZtVP4sRrYcaGtx+06/AX35y+pbziy0mP
	ZWfQg90FLk3djfbPS1DtLt9Y3LpJD6JPKGaDJ0j1oxV6LP4lkmtqLcyIGFuV1i4/
	FXbLQgtFA5clJkOuadTwuavxY0Xw2wr+GuzXyaZMSsYu0tCM7nEuyOO2lonQIDFm
	lXkDDQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tuhpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:09:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8294d8c48eso2696312a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753389; x=1779358189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=XT/PFZi2DZ+hvtWN5TDBSCWeqKvbImEGB3VCSK3y5ksFO+e+h2BEFIvWW9lWcJBkLe
         Yz6/omKjMGdiUaEQCJ4jT+EsJjKVwAOeWFNmCeWFKcFtL/m28JVwRiKesra2AXISWL5I
         kMfvswnGk4yDwP2WX8z8mmOyTJy7kdKplS4lCzEc2OvblhZwnMiY13LEYsXTmVFaykKJ
         aemMVYz0GsGZ3pz4GrWOWAGR0uY6zstXou/p6+PVf8Hvg/ECnbVHYxZS4ssbHo/E7C3R
         /VXKEdUSgxcRvVVS2VYlG16fJfCJbraPz6oD8GcaPgiqMg+srQLsrmq1WFoGqb2+OXAz
         LrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753389; x=1779358189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=a3KENYgoEoPPzNP23AQIjN4hiHnVO5IFByxLQ4RiLrQ3LfVl9+ZbxdYUlIxw+Lxr03
         i2xkyd2Ft0TnxOBYUdEQvRPhVC/jn1GnbMIS26IQeCFfucDQov+fLDWN9nYXvmnxfdE/
         7uiEwqS1ZClG71p/YoexhE0azHsRSOsiyut5GksAnCiv/FbEtYkTvF0Ioq+yROOnj0Lv
         BQds/ObY/JH13GAvZwfUvNsEF+I/bBhfygdE+zENYkAtvy5BZlVDyGD48qCskSCPO4ci
         tLuKguAM11imV8ACPDBqPy4PzmE1/v+cq632gntqmjU6dUB5hddXQ9GnNpOZaK9ZCW5R
         j1/A==
X-Forwarded-Encrypted: i=1; AFNElJ+Hl5HEFkFCI82t5mZUMzsc4F9TI3faMttgRSyIamI3rrixpWcJBjy+DXOxxjhhPCwgV3EsO1vRBQ6A9Wle@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhzy1yoI+gtHCZuRFFehijURkFME8HACkvp3AvtQ8UDC1bR+qV
	qpRikY6arg/mK5UtFEaxUTQiy7dkVEMCUbtiHzsp7GYX7JADdKsb4iLx/046W5qVbySW1k85f9m
	GQjQzDdvipVDptdKAVdvoioBnjUMpNwalANQZ2VBrhM5mJ9SGHI2coO1I1Pd5wS7364Ij
X-Gm-Gg: Acq92OG9JnA8UD1nLYHF086lot9bgpDZq+BQ85r4dAEcHmEYDlppcYEQaXSbp4FhLck
	npZawe8Rhj8EEYJkJCuvOC8Hp494JTjBfj+je0lJA79pRu1ou6pY5E/QAtM+4rRc8kI2fME7yyr
	tsdLC8/iBI69LQPfshnzT/8AlQaUL0HtXzlDs5hLV/G4sEHO8i7w1a4AOMEyjC2BgtuopU7JOeW
	ukTrOvCtuDgfzANi+ABJXZTScaPuuDIgqh1AMQU4GR3krUwxUXHoVd53N5kdTFeMs7GVs2A9mwX
	uVqwERU1tcPKW81yWsKq+BBCqhIo5XWB7JI9RymYZt73Ve7kJhT1kdYmEfMCuuUVK6XPAoLzBHZ
	SIuX/tedTjHewShNjsvghQt5jljA4MnyYWrS6lVQcdy+4ozWGfu4058rW5R0oHqIDVixI2Rb3cF
	Du0Z6SsElaPJDa2XzSHOdG
X-Received: by 2002:a05:6a20:3955:b0:3aa:f9cb:d43c with SMTP id adf61e73a8af0-3af80c7df00mr8203325637.34.1778753389121;
        Thu, 14 May 2026 03:09:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:3955:b0:3aa:f9cb:d43c with SMTP id adf61e73a8af0-3af80c7df00mr8203279637.34.1778753388454;
        Thu, 14 May 2026 03:09:48 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:09:47 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:33 +0800
Subject: [PATCH v7 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-1-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=2090;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
 b=LMuK4N3K3iRXR9uDO9yPF60v1xg0w83b3UFfvpAmAljL+QJiXGy9CE91vy1tD/tzk+qdRvDFJ
 RrRisRH2HzkANtypoIiMNnHdegXZoqXUEycn1x3j6GxP07UIkPRkFCq
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a059f6e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vdEEYnp-zpI4J6gZ5dEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfX2qdLfNEhPN1E
 3G8eQbMRsXMEswBPbTj+eS7sKwbALXj7V6LWD0ejo/hqUoadA5TPnSH+xuW7QDwgQ2dehaKFH+6
 khcWpkeDqMNe849KW7+qRlHsn0DiyFw7qEJDPPtVZksIQ7fmMikqmbxsTvB3e0AfTV89e1OQHZr
 feMlSXZuvFAqb/GtheAtFuW5mFX812809EiQk2/U8ciGerRykP7mOasNPsFo5IiRW3uIl27aNEJ
 szeeUZ6BTtP6DOoJyHbkn10S05nPT3PjnFT2xQ3sMUiof1mr3myo5WigAUxXFsm1HQhWWpi9CMA
 WXnK1pENwYGzkSSlm98/RcqAeWgFg5cQTm5xY5DV4QPrKBHv0dI6X81cBG2VtTumEMlEXqpBbMl
 xu5ADEG657T+jo6vFsHsEROZ+3WW5UgUFb4lOgvU8Y/xMC6xVxSDLt5UE41o/ZH5jqobkFOUPFK
 NVpLNgXJi9zefirrAFg==
X-Proofpoint-ORIG-GUID: 94cM2-dQHqH_fLfs6mv8HJxw-A8Qr6OP
X-Proofpoint-GUID: 94cM2-dQHqH_fLfs6mv8HJxw-A8Qr6OP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140100
X-Rspamd-Queue-Id: 0244254039A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107555-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the new compatible string "qcom,x1p42100-iris".

Unlike SM8550 where the BSE (Bitstream Engine) is clocked implicitly
via vcodec0_core, x1p42100 exposes a dedicated BSE clock vcodec0_bse
that requires explicit enable/disable and frequency configuration.
The SM8550 driver has no knowledge of this clock and therefore cannot
operate x1p42100 hardware correctly.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b50251ac467ad44a366689260bfc0d..0400ca1bff05dcef6b742c3fbf77e38adca9f280 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,x1p42100-iris
 
   reg:
     maxItems: 1
@@ -41,13 +42,16 @@ properties:
       - const: mmcx
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   clock-names:
+    minItems: 3
     items:
       - const: iface
       - const: core
       - const: vcodec0_core
+      - const: vcodec0_bse
 
   firmware-name:
     maxItems: 1
@@ -115,6 +119,23 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1p42100-iris
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 unevaluatedProperties: false
 

-- 
2.43.0


