Return-Path: <linux-arm-msm+bounces-112075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6yBtCSHcJ2or3gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:25:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE4C65E4E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:25:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=anjuNBD4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KlJhd0sN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112075-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112075-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CDA63107D9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D993F0AB2;
	Tue,  9 Jun 2026 09:09:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710AA3DDDC4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:09:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996154; cv=none; b=HPGYjN8/aFuY+ArNJTMlt3a/Bcu1a6GI6AgsmLF2ukDSF+1vLmpXuOGcGCkiAADwkR0WuJEzueMQGKgfIrTv77Qy+vnPvmOppwftWxqzXnqWw8uXAu3ek9zDl35HsjQmAyeVLm4DEj27M4Ypp6hoDCxQBpWncjiamv6K0mG2tOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996154; c=relaxed/simple;
	bh=qkD7hfP5GdrLokwUs4o0VJbAwr0oen558Kmn380Nmbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FUVZoUAki5i5O5jsZqc1tgARnsqX9groNsRzzhgtm528i9gSWhCP8c/fEiLHDAil2YKTIe7YQlPcIhcimxb8eTTNyOJWOB8LwgDdDinsUcNlHK39bE7iPLxeKZipdlhC6VZPPc7In2uDkHyMXk8xy+BfgwImiduixWvqMSmyJFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anjuNBD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlJhd0sN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985Ut1006890
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uel7Dn8g9zRhKX5QtlCfVvgluNSy+/SDTRB8bCzSu6Q=; b=anjuNBD42C2wlCUQ
	YhAkT6p7GisTv/V2AdHaY5cdJeTLlNchamE0lQFdv3cGPnf416gHzrEv/66kkHoS
	qUBE+eJTN8VOwQm54OdLP6t/WtYmrw1fhLXE2zI9hlYxhWXfh7vs9z9xnlYVsElZ
	L8EHURrymBTpNy5zq3C5n/6nMAlhFl2f2hq8QlE9ANf7P61Oyeq3duoRWNV/b8+l
	LMkxPhJe0zPBD8g8hXjMbnVEXl5reKbbLZslYqpoRNiSd2bgxXVvyDlkLlpQP02a
	FIy66xjPuUFH71EET0vt+wNeYZOiocNFzl4UiLwIsCI42UceMfpiELh/gPrdrbE6
	nOHgyQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr8kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:09:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304ed777a96so3436158eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996152; x=1781600952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uel7Dn8g9zRhKX5QtlCfVvgluNSy+/SDTRB8bCzSu6Q=;
        b=KlJhd0sNIOndSkV1m2rWMSj5QewprTndMTPoIS7Gybg3EfWA/FaFyHLZTt243D2V8g
         ipE/MO8+r22yrVQuPxrYb5ls8VbyTFRVWehSV+1NovmJlAVpmSO1zwxij4cQ17iVBFfL
         iSaUTJ2CXlAOo+fkiS27r9qOCM102OxHG2X0Ne9dp0kdymx2XzIjDpLr2Mcf/ZaJuIl2
         7Rw13zI2Rc5PDN4zUSNNuTKItq8PFnEB1CNtyvI5kfpusB6GhcSv+oqXwGMQ9K2U0wTN
         q90OjOwMQy44bmROCaGjjUBtmIZeZrJnsrycX84DhpHN+LwGtQdm5OVq3cUwYnztH1RS
         pCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996152; x=1781600952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uel7Dn8g9zRhKX5QtlCfVvgluNSy+/SDTRB8bCzSu6Q=;
        b=dhlO5NwM97EY1RxIOUN9Cj21x8gL8++g5vWN1rT1n2YpgPX8pXtm/occf431WGg/ZB
         LB4SOfHQL/mo5YjMKJvz62/Ffok62UreANLYHJsEgwANijdPVMTZyj39RNkXvLqUW7he
         TnIwQh4XFAVRnJTJDmeMkFVWYmjQGFiYXMbjSE5/dDkBFx0MeMEYWDWYxtuLXPxuCasf
         wNTkT6eCOrdE//eni+CH+XBlO7sSf3mlG73S4p8PVw8JYav3yWvdDxogufCGW8tIAT58
         A8A0ycqvlsQTnwMJ3dTNBo3uDrzIoRaurvfM7iN5JIyTUIRZM035nS0ywSmOHhsbL6V6
         LS/w==
X-Forwarded-Encrypted: i=1; AFNElJ+XJY/ujDYPe6+8DOrKYPfg5bCz+9N9J7Z0YWa+14B50DyV1tY96ndX+nUIpnH4hzRypx4zsb/xBr04C9nA@vger.kernel.org
X-Gm-Message-State: AOJu0YwxiGlmS803CLVwlMHJiGn1Pa/jv2CDor3uTiCzLQJlBt7fqrTy
	Eevc/lqx83SvrGSQ20WNmZNpmTe7KMeRJUjVLKarHikrW/fcV5JEjMbiC1ruNE2eGB0QN5qqLW6
	FZmyK1s6oeM1FEzn6f/E9Sc4xHRB4J2JG9tCb4B2O1PHqQX83WqpA6v8UsaPxUcgwA4yr
X-Gm-Gg: Acq92OFLo9hYlvB2qjbUm7LePAVHOQcQADIvYx2b9Y8W2hEur/IsH5cj8VAKR8RIDI7
	/PfaGIsmsZFT/obKz3nDxjF+MWuIxMBCEjiCAfEzE9JUPaOR0lQ6VgCzmSaMiElkeYgK/Fuz3gY
	rfPOpdxZwobp8CtJc/JgqoHV/pJ7R9JD12ooGnl7F/jwffdh+ISbvtofMcfJ9Ykuig5a9qK+1Bj
	f2P2jMNzmNWQN+hVG+qxfuP7hoP5gzf3QFx2dxaRKuwFgZ6+QykXdEXNPCfrnWsv2tnNf13mDOr
	Cm5YOoCg8uz0HDeU463MhzP2IT5pWDZ9pciVsONMa/VokCOutDy69TaaYTKxHWa9iPxFV/YfxUS
	MPU2lM4cOSld8p4685zkrHUiROanxttfSXTc0v4QpyN/qPsPjcX98jGfcEsAjwttuIdVNOdkoW+
	9MOlD4de4=
X-Received: by 2002:a05:7300:a887:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-3077ffb4d52mr8691057eec.10.1780996152189;
        Tue, 09 Jun 2026 02:09:12 -0700 (PDT)
X-Received: by 2002:a05:7300:a887:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-3077ffb4d52mr8691036eec.10.1780996151726;
        Tue, 09 Jun 2026 02:09:11 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df102a1sm19356606eec.20.2026.06.09.02.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:09:11 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 02:08:56 -0700
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,prng: Document Maili TRNG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-maili-crypto-v1-1-0f577df56a61@oss.qualcomm.com>
References: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
In-Reply-To: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780996150; l=902;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=qkD7hfP5GdrLokwUs4o0VJbAwr0oen558Kmn380Nmbg=;
 b=eEpItHIskxCiKI3mzi/3Qp/HdOJ5m+DT6L5nVBwhwChSI4HQ7f4spRIMI+hYp+ghURcv9j7Ej
 dd0hdKJFRswAEo8+mbY9ZtwB/zij2OXM4xjZJoe75qF06xED1z33DCk
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX2dhQOwlEMqnL
 W3oepTGET1onaADBgHUmUHrAHsXDb4jCtPjPsAnrzmgDagOvhEVGpJNrxtVuNve5OztHIItpcRe
 8iriHhcI7vqYDm8OTiQx9eKVzbwn4bINMLC2bg97KAVxKUoYznh8XMTglfNE4CDtRYwFdMonAgu
 pVCxZHMKtrswskmiWC+bkkyI4TriY5XHAfHzx/QLKr+nBAygSGun+VrPhNH8kOKU05ZBR6CVPIy
 wBetx+DFuXczDhZn4iJG4hOQd+aXWHHH9bc+Iwss9mbo+NGDCyEgCKJTFXqzYUJqOgDaOdY/eXc
 bgnGlObFNugOpQ/66dCpJz8Ghydd5TkVKTlsg7Bo68ilAFZAfSb6S/YgBzp0gyfcttmfQCG14Bn
 +/AhadYLFtbpxLHjEs1uZtbX7DmPPkR/hdrLw7pYC+Vqr7dB/iHaU7Kn3973+CLvRuqhbfzOjAN
 mARHaR1cR0Eepf9vmiQ==
X-Proofpoint-ORIG-GUID: OqU40-DAJR8kRCEkwzQi4BlcZjmli8e4
X-Proofpoint-GUID: OqU40-DAJR8kRCEkwzQi4BlcZjmli8e4
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27d838 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FNAlisUgfRrBHgIoG2YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112075-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BE4C65E4E6

Maili SoC has the True Random Number Generator (TRNG) which is compatible
with the baseline IP "qcom,trng". Hence, document the compatible as such.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index dc270c8aedf3..6116289ec413 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng
               - qcom,kaanapali-trng
+              - qcom,maili-trng
               - qcom,milos-trng
               - qcom,nord-trng
               - qcom,qcs615-trng

-- 
2.34.1


