Return-Path: <linux-arm-msm+bounces-114872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TvdRH2QiQmoz0wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:44:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D096D7221
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:44:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hqjETeMv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RgQnFyt3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114872-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114872-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A747130E6B7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA900343882;
	Mon, 29 Jun 2026 07:36:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358E035CB66
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:36:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718580; cv=none; b=nONrzMufF6IIs9nrVXsix6XVKO2HfKpR9PYlAIxtAfOupYzyOM08rjGi1N4l8zVNeunGGOwSEigwyrCN3MtcUPfJEjL7VedfwoH5BiXgs59Ub2SD0iyUnHZ8C1NlCr4XG1YClH0Ns3A+1FhZcEDPQx2VvMsrUJOjzL0+/Q3JvPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718580; c=relaxed/simple;
	bh=UG9Kp7jY662Of04sDVmPvTQnEYnBxLOiWQ1vf2oQK7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZ2ZTs67pyieuU7E43tPTOTLo50mM7mk87oOsOVnjbSVe5w1dnF3VHASDJYGKnz7OKopafD+RmybXnH+9IkENzWB1bD3fdCo88bknKiGy+isYVShgw9Xhrh7iLbY+yurUByddz/MEM1i0AJs5LuaaQeWDTNdIpElfIQ7hMf4xII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqjETeMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgQnFyt3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rQQu2089705
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	badozWK0W2Cr2Afkm10JULzGCoMptdbDOA7a+6f5rF0=; b=hqjETeMvFYVWdf8t
	FMhcAOlDxiA/vAvsKjSHGm02gm9MOHdrzSJawyAtAoJGh8Xz1C4hC1rjHlGZjLcb
	Fq0kmq0Zzt2V91LF2EDwbuWR5F0n7/m7cvlwbKI8BqIyw0ZJxGr6DHEjo+nM8EwP
	ErROz0K/zWKIDGNeg657fCKrN0HnDEkn5TKzRnPfI0XnQDDXFJ4F+0dwope/sxbO
	OZ0+XBznxX639+E/+urI90lVjh6VuKU0TBehSIu7vcE9mT4okwfLti5xWQZAYsY8
	WzX9MTGf//TGhnAMN8pguPVd4YS94v2B1iNhFtZcmPk0bHaOdfnYuW8NTSrI52c6
	MTKkfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vggag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:36:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fd8d36025so744265a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782718571; x=1783323371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=badozWK0W2Cr2Afkm10JULzGCoMptdbDOA7a+6f5rF0=;
        b=RgQnFyt3flSYfsWtTfXGT67cXACtfrHDVTcl+Q8YmpDIe9X+sy0YsELXL3bDOaxmeN
         HEy/OhukSeL7cTZih2Rh8KOCU/lfiwcxSpIFF6B4mGu+TBy8QqNCS15sY1D7cYITLkrN
         NSJK9IIr2CC4+6jdkpoo3+p0hqwVDa4+Zl3aJzMl5knMCGWXRtA0dDDn2swTYt6cCdCV
         9m5O/0DCF+as2Cy29wT4Ao89F8gZzAiPRf4sFzSXQTYmnwVI0tPlFOnZGifaIt4aLPZJ
         onqfxn1l5gyxpMSO4FXZv7/V8V491mvxHLeJx+cbJmdduDDKQPLoAUN3jt2Ike4kiU03
         1T3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718571; x=1783323371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=badozWK0W2Cr2Afkm10JULzGCoMptdbDOA7a+6f5rF0=;
        b=D0AoZOGxFLU1K0O1f7IIVnfhNXWlNA/g7XDsBOQfX6KraGtVVuldeLixplGVdmUfFo
         xe7AXQAzclaZ5rbhRXXips1LTaMn437LvLb+Ezrsqh7uqinokiJqnnbgd2h5Y1jz0Ju4
         yJ2Mpl3EkmMh66d7IDoDBWZcqdy2wVC0/jXeyIG+2M2F09eeoIKQCBj5R+TtrTkbLpsG
         nCV0mWDxY7z0bWiop6k7mjKyVuAXB0u90cBSJDAQ8CupDE/WWKSUG04Xjojry7pW0WGy
         kvbVVTTu798Nm8uxCXHFPx99xjT1tXO/gh13RaLJ8vQ74wUzUO6TcSOHIR3BOLM5PD/A
         Sopw==
X-Gm-Message-State: AOJu0YzAq4sDwPl8kWZwhdXbQNw+QJGk9g61uVdHAk+FUr2bha18K1N8
	bFa8hEvU34EYbt2BvDSpg1pANVAfWUbMPwe1m18WayFJLmvFxZ8d4Nc+4l2a/cYTGf60p/0DLjb
	EXqzBZ+lIW1rzP5uyD3++azGOEPZPfilHevxCs7trSlywpa+oKhMjcb3wwnnU3eI+X232
X-Gm-Gg: AfdE7ckvsaHUI0xzgawZCBk3gw6lngDqmU5gUUrGjPqCuYyTUFH7w1MDt8zu8CKJ9iF
	LFZMOVg568uGcFbr+oUMZcANPOdOZIoNCAe965cSdQJezjD6ht+PjfJ4trytRgndG2mm7ijpicq
	/J5Qc3NzeuSssxmAwnME3eH0uhjDnyeqeOkeYt3DriN+vOblImiWe/rx7IOgoFT6fCO4V/WyC80
	0JyfG3UCwatEE8AmE+iekiQqMoVJP1iY77kOAKRHl3Q98U4TRQ415Fj/BW8Wy7ZMZpHtSvQsDND
	Bd1fGCtD8+HSvtUtBTjOdAr49B9hShKdZV5YqPH05QfeZF2NdNnyk2kkoxCTrFbLK2oa8IiqFpn
	W6axd9wkDi5ZKCyzfg7hn7dx4hLOmGpCzkyLg8FvpKyN9
X-Received: by 2002:a17:90b:17d1:b0:37f:133a:3e07 with SMTP id 98e67ed59e1d1-37f7a52c17dmr7650815a91.2.1782718570918;
        Mon, 29 Jun 2026 00:36:10 -0700 (PDT)
X-Received: by 2002:a17:90b:17d1:b0:37f:133a:3e07 with SMTP id 98e67ed59e1d1-37f7a52c17dmr7650789a91.2.1782718570446;
        Mon, 29 Jun 2026 00:36:10 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fa9629f8fsm4537979a91.8.2026.06.29.00.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:36:09 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:05:31 +0530
Subject: [PATCH v8 1/3] dt-bindings: mmc: sdhci-msm: add ICE phandle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ice_emmc_support-v8-1-1a26e1717b85@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
In-Reply-To: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: WEK9l0tQe8sIflRjTknRnKopRx91GetI
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a42206b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Hwb5qPKBi1csoFV4ZQQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfXw4nL8I03EEtc
 PHDtdtwpJkeuK3NgDGVY7anOlY4fnLd5tk+HTJjGEKXiYkxCdh+fL2PDH2oCk6TzsNT/WeZ2Ywg
 cUhcF+5gCgEbP4xpStYxuV53vHmeaMc=
X-Proofpoint-ORIG-GUID: WEK9l0tQe8sIflRjTknRnKopRx91GetI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfXxKE9J+mTrNbW
 oMOSMHqsWVq1Of1E6avOcWNHrngScl8B4/pUTx2XQah34cZVSbso28+lR+KOrTJBzE0dqitz9v3
 ZBRdRH8bOSZSh99N+olioQrvtYyDIP43M0rgxOGovpR0Ppz8FF//eqVXs0rJFapNVRjqnW3vR/c
 pQCRbuJyxzxqnOn3tW1ZhxB03GzLrv/DaiB/t/umQQ0J2G7RMhOIyLmhXB9v/kPekbI9k4g5+o5
 PKriFGxfGWAdg9JFWK5GR4okVNvml1yglEPZuupJRf87eUsJaSY3dUtcLzuJ+TSe2nrYRVmMVlX
 5xz2es9fE9ifnTNxbFMjQbTrLaxiJh5+X6DqEbSi4YoOjVZR+u1sqg3RBfurQVQC/GOX2vwQwRQ
 dxsDb2CNzQb3ZSGNEYSI8VpnwcSt7BA1rpzW43NRHfX0QZkfMT3edZCqKZ3bP4pRX6otXDh6Luo
 vnc0fLN1EfS+SdYnB8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114872-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:abhinaba.rakshit@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:abelvesa@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10D096D7221

From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

On newer Qualcomm SoCs (starting with sc7280/kodiak), ICE is modelled
as a dedicated DT node. Add the optional qcom,ice phandle to reference
that node from the SDHCI controller.

When qcom,ice is present, disallow an embedded ICE register region in
the SDHCI node to avoid double modelling. Older SoCs without qcom,ice
remain valid.

Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/qcom,sdhci-msm.yaml    | 95 +++++++++++++++-------
 1 file changed, 67 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
index bd558a11b792..b3fcc1673c10 100644
--- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
@@ -145,6 +145,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: platform specific settings for DLL_CONFIG reg.
 
+  qcom,ice:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the Inline Crypto Engine (ICE) hardware block for this controller.
+
   iommus:
     minItems: 1
     maxItems: 8
@@ -198,35 +203,69 @@ allOf:
             enum:
               - qcom,sdhci-msm-v4
     then:
-      properties:
-        reg:
-          minItems: 2
-          items:
-            - description: Host controller register map
-            - description: SD Core register map
-            - description: CQE register map
-            - description: Inline Crypto Engine register map
-        reg-names:
-          minItems: 2
-          items:
-            - const: hc
-            - const: core
-            - const: cqhci
-            - const: ice
+      if:
+        required:
+          - qcom,ice
+      then:
+        properties:
+          reg:
+            minItems: 2
+            items:
+              - description: Host controller register map
+              - description: SD Core register map
+              - description: CQE register map
+          reg-names:
+            minItems: 2
+            items:
+              - const: hc
+              - const: core
+              - const: cqhci
+      else:
+        properties:
+          reg:
+            minItems: 2
+            items:
+              - description: Host controller register map
+              - description: SD Core register map
+              - description: CQE register map
+              - description: Inline Crypto Engine register map
+          reg-names:
+            minItems: 2
+            items:
+              - const: hc
+              - const: core
+              - const: cqhci
+              - const: ice
     else:
-      properties:
-        reg:
-          minItems: 1
-          items:
-            - description: Host controller register map
-            - description: CQE register map
-            - description: Inline Crypto Engine register map
-        reg-names:
-          minItems: 1
-          items:
-            - const: hc
-            - const: cqhci
-            - const: ice
+      if:
+        required:
+          - qcom,ice
+      then:
+        properties:
+          reg:
+            minItems: 1
+            items:
+              - description: Host controller register map
+              - description: CQE register map
+          reg-names:
+            minItems: 1
+            items:
+              - const: hc
+              - const: cqhci
+      else:
+        properties:
+          reg:
+            minItems: 1
+            items:
+              - description: Host controller register map
+              - description: CQE register map
+              - description: Inline Crypto Engine register map
+          reg-names:
+            minItems: 1
+            items:
+              - const: hc
+              - const: cqhci
+              - const: ice
 
 unevaluatedProperties: false
 

-- 
2.34.1


