Return-Path: <linux-arm-msm+bounces-118308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3S0qKaL5UGo+9QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:54:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5681573B77D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:54:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oD2z+ZjE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N1btpA3l;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118308-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118308-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AE6F303D96F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4092C3261;
	Fri, 10 Jul 2026 13:49:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE5A282F3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691395; cv=none; b=tsm6Yz9+n2+uGs1/HNFtle1lFDwsjcqXr3k1xRGZVnd7e3GvBscmAG7kXvT5Vaq9maxuquUxzrAtJN5coDN7Sx/SMZ76lFPcSLOvKRWAQ93/FYCKH98RSqhgludip7kUqk6QEVYWMkTJYHImBKDOdHZXcfTSDSFnUz67OoecSUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691395; c=relaxed/simple;
	bh=d09lYffK7NKQtWks133wtN3qnkJ/qWtJQRxHm1karAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CujX1dAAu4+3GNkk/v9TmanAaGstmrLtcQPcQoeYQ4IR08AcfJwMhgwzFwrYM4PEJAPbMrovogU5f8b/v95AfQwfVa3mMRMHyjWmEjm/p5G/dOwlqwNdKD6AHlM/zYWjsKdOwbTxQ+5rqXzMM1PU1XjxqKnzQnOVzidt/uIn0Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oD2z+ZjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N1btpA3l; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6YHu730199
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=; b=oD2z+ZjE+c/m/MoI
	MjqxMNUP0+Eoif9yAsCdqYqFUVOkyJXw0zrDKJyWDdaTBK/h+exCq4zptZo1KMdR
	D9ux4oY/YJwLn4hUTCpWsFeM7bUjVGpa4oyLT/2+MLrYukTrUtyjL7ftzoSqlw0m
	rRUcNMkSxiHCGIrR51guUxVPN0TgaoFN9jLTOQpi+SitNmvMXRfFFd5E09Q1GIAz
	WsWJWVzoaiGirPs03VLdxHRX0BISn9hpN2dA+HNLAcJr9mBJI2LJbdCY+RjigEd9
	K0Si5D8x8oTajWCASY9zT4qC0CSo3xm4dDHRexMAHO4x22yT16TK110qGqgCj19i
	RDY39g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24vgkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso9795551cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691392; x=1784296192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=N1btpA3lWYt5ZTufaMmgC9lIjTtXfUDcg7DOQE5ZD0aEeGqtLVniseNeEmwIYBKzeX
         KtazlAx3/apA3hrONPL/iu8G1HvF8VinAd7qVXlolUi5OfB9dqPLVJ6IIh4OxEgVCMSp
         dgqrj9QMQaqKTfd4cWD5F9DF4wfi+6XUcWkGdb+M1Op1XwY3Bq+eEFHka4fY2vONqTNY
         TZZM/yAp47L1q/Uu2963yUlMUmMZtnWztXUml7KRj0U6Np//vk+yJdE/mCO9T/z1e6WW
         WmNDkoysLUEcEHY6VZL/BS2HWztC26I9bqrYf5p8fCrCcGqT/BBTZ8Laa5E25AuGb+uY
         lr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691392; x=1784296192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=LktTzy7I5hKB4xSq4WzkfVOegjs7hLcu17cgwaHd5NJaUnaiUpY7g/4Ym2ADg3XEwF
         zsEofDqy/03dXrDxr/9UnNZW871eabMcdx4uW4pm2N+nqk83AbKmNpm9TeqP67C8nUUu
         wJpRyfH6FP2DPDY9qne2Upto8iQ1fZX3wfjQfVvoBPVh9/5yPCEHKK7s2hgJcYZpe4Gp
         7Gfv8TN4Ct+P39G27XJ5AYox5rhH14v4DuG6680u8yBhY+YEXIsVfu7GMjEtrQOczm/Y
         21TaKsssQ3zOcwk6mpoP8njcwjrp2K3fJ3lG19jqnZckuGba5n8iFlwtiVJVsLPh6svj
         JBYg==
X-Forwarded-Encrypted: i=1; AHgh+RrSK8rx+g1aURcrKrU173sY4tlFwAeBsS3RcVd2ZNGauasVdTESdcW39C3gLOEPCLQDk7sXdXSEUxp+amhx@vger.kernel.org
X-Gm-Message-State: AOJu0YxDVTg0BZD+MU4OJ6Zg9eHa+Z9BC/zWLEWSHTy+fBsQ3GRv8/RC
	onTS71nqWb1Rk/zsl5O3saydQOwr8LZkNNUuSb2o4psrmGvWoF6aeJ0e3mvousvUjGp3nmYqtBF
	DclZPVx6uFEKOeGs4MOwPKx8/U7UIRqeLFZRs74AC0BjVJP1mZOk+svA1+r5LgAxSxtA4
X-Gm-Gg: AfdE7ckDAnAa5EqiU9U50C2mOhfPlHgjeBEpDbRSgaCLr0D6cRsSXGqfz57BAARv1ki
	3onCq1iXdEUj9dp9dr7aJWucANJUfQOQDblAOHRqcMel/I0DJE/cHq3Ro8eGL0Ka14BQ1hiXGsU
	Xc/Nk1neDFHugrtue/iZVCjNqWo0O5AbcO799iU66oebOLtG9oRC/YH6Ar2kthkO8bAH3IBGCua
	zm21iHaqI6EQ9Hl3IP0Q+I+NmeT7MWS4cjlq7QJRNWEipSPyRGQRqYk9GQCVDgnBT7J0IWw2zJ0
	WF+guGgn1iQ6MQu8MHLJxm6iMLMQjWAi7mHfeqRYBKdsHO4SpFBLxr+6dZ+EGRRZ/0307pDpK51
	899kWlFTa/C/2VzzSJUD5k+h/cSSBfciIlHNZIzQ+LpEcQezlZ1G5G9lDOppJm3nKzI0X5HLnHl
	qAjtBC95S1PVySoGubXSFx2ANXAp8hOyyqOuQ5/a1SkVEZ1kgOYxysLgtC0J1O1aAKZb0UbLRs4
	s35sgmhzbYH4bsRusun
X-Received: by 2002:ac8:7f92:0:b0:51b:feb2:3827 with SMTP id d75a77b69052e-51caa1702a5mr36455221cf.32.1783691391838;
        Fri, 10 Jul 2026 06:49:51 -0700 (PDT)
X-Received: by 2002:ac8:7f92:0:b0:51b:feb2:3827 with SMTP id d75a77b69052e-51caa1702a5mr36452251cf.32.1783691386647;
        Fri, 10 Jul 2026 06:49:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:41 +0200
Subject: [PATCH v5 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for
 pca9635
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-leds-v5-1-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
In-Reply-To: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: FjYEp2TofI8uqfSbqPB6QV2duXHWQBwq
X-Proofpoint-ORIG-GUID: FjYEp2TofI8uqfSbqPB6QV2duXHWQBwq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX1B5vVLiukQW5
 t1ducUm47dnk55FK5Vb393pI022+HVmUlqpl10i7nymRygVRFsWGimENZsaieVUXsZtbhJs2DLq
 eG+b3C3v19l+zy5fZ+0hEPxdbaR+U+0=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50f880 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX651Y7KyG45Js
 A/2yzp8Ad24eitGJgNaimjKIHKkwtWaJ57v0CLv/1iE7GvmgT56XY9gWsB7KFQYTzVcFKr6DamZ
 8eXK4nROhkz8VxES5BXafAVwuYxzqdW7wxAPFnfPX04kw0EuQcNn2LgP4wVgKGouueuvigVEr6i
 zHKD40Y0Bvacp8W/r1bfF0EcQjAJKdK5bxMaj7QkBa4ciYFwyh5pilL7I3YTPiEo83vyDRenVPg
 XZUsLUjsdFOpZ+ui8E0SlIVoi/ejGdGDt8XC88+7wY/7CLG2zHjsBX6d0oUe6wGUBJ1Ik7tgxvC
 28VwhHtR0DoosKc8zoQa/Jsy9ifQvXYyag+HO8wYhNB5JK9Yf41LX+98Ei0j9+dIGkqR3j4eKh1
 Y1BLYwrEYfa3KkGwpUc+zyhmJvxgtZDKosu3PAO8UxCe8tLCcFw7ePBju2SiOUt1ZAgWAmBIeiy
 ejuSuT5kWp9ZphM9xGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118308-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5681573B77D

The pca9635 supports 16 LED channels, unlike the pca9634 which only
supports 8. The allOf conditional grouped both chips under a single
else branch capping reg at a maximum of 7.

Give pca9634 its own if/then block and set maximum: 15 unconditionally
in the top-level led@ node, making it the default for pca9635 and any
future compatible. Also tighten the node name regex from [0-9a-f]+ to
[0-9a-f] to match the single-digit hardware limit.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca963x.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..4fda602912f7a9443b8a77e46bc015e244f82e08 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -62,14 +62,14 @@ properties:
       open-drain, newer chips to totem pole).
 
 patternProperties:
-  "^led@[0-9a-f]+$":
+  "^led@[0-9a-f]$":
     type: object
     $ref: common.yaml#
     unevaluatedProperties: false
 
     properties:
       reg:
-        minimum: 0
+        maximum: 15
 
     required:
       - reg
@@ -88,7 +88,13 @@ allOf:
           properties:
             reg:
               maximum: 3
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9634
+    then:
       patternProperties:
         "^led@[0-9a-f]+$":
           properties:

-- 
2.34.1


