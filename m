Return-Path: <linux-arm-msm+bounces-117366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sX/AJfErTWpwwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:40:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 084E471DEFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:40:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eD+qpjy6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hqYHdV3i;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117366-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117366-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24BCE307A8FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 16:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE974437846;
	Tue,  7 Jul 2026 16:37:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5817D436BD1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 16:37:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442239; cv=none; b=krV84RKlv5N9H8+2XKUD2PyU+BfjkCxjvxW5osBrQtN6fdnzvhdeva5hCsKyWejNayb/UlGcCYAfDnBPaJoags95+iSbr3SrAliHwyHprhKbXZ7dlYKH3+VGZkWVWFDkJt6CWjeYMb8sqcaTy2dWKpRAT+uuBEh9HwBtAVUasx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442239; c=relaxed/simple;
	bh=1pRcnJjp6HnPGF7Zr4pGgrauHhSfDRBnsJl/xn+e7ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkh8Ga/z/w46Hu87sT4XZ8abWigRcegYu0eyksyAssHAjiO7VID1x8PZfBvpUtlOXSd8W6kNOrEtRlP85ZaeoTJdsHRVrugKVmtp0+OuRi/X2ctmV6nNGFAWBZGgaGW8+dWXE6qZ7mP8fNWDoAfw/yntiA+AtLZl4sXG1CfAItE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eD+qpjy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqYHdV3i; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT06q002054
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 16:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dc3v8wlwZwc
	bDVCWkXzPT5udgXKUwWddG2yEhAPwIYI=; b=eD+qpjy6ngi0Mb0DF9mQpgSFZnP
	9t4L0UoM1K1IP3Dxb5STAvpFf4eK67djAGdJeoplZO8oeePkAuI7hBizA8arWemQ
	8Lk0qIhRFyjMd2JeBAnCjTZp/yh5rGvCoKYKR66L2v2RYCYZg73RbBuHen0lbNAj
	2uxak/hF6+qELGmtz1B156C99gRcyUjmxLuvWKAczjGCXKZ6iD3QkK+l6hebxJzD
	hsLDortYKlwB5eb2GIwYjOPFmYdIKh9ltMLKl8b4p/uJqdLM4jnRlEeb8Q8XXcWZ
	YZE7evWpwnrOu435zYqW+CzfeCu3O3BoZ8ydVAD7CDvQ0h4WuzEKK0/5OJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0hm5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:37:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso49562691cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442237; x=1784047037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dc3v8wlwZwcbDVCWkXzPT5udgXKUwWddG2yEhAPwIYI=;
        b=hqYHdV3ikYVhU5tp/s5rNKlHODoSe7933cy4r4spKKlkIgzskLXvdUZzvLepjFQReN
         FL0KCWed3+RrvBCSCVrP00g4FdEGy2GEfh4muEuV3fbM/yoviBWBqY+aSI5rxzZcm6wf
         BzvHtb6yVb71XBkC5RCuac+wyTReootz8Ie4pnyAQ3y6wSO9eF3pS9PDnFNAkUWVA0/q
         bwE7iJkwW6HZAv9wkN/ejdbKZa7zh1MW+JEOIAfxYIju3VEuQmr9DMQtSvZKOdhtgkuh
         ehWq55cZlRqP/X3FTCWyEyYksAV2TF+dAcad6UmS+r5ucr/AGWnXedLnR7lV5rGTfUDt
         vwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442237; x=1784047037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dc3v8wlwZwcbDVCWkXzPT5udgXKUwWddG2yEhAPwIYI=;
        b=WMhN6j3ij8qMmzIGeHWeda8NV65slFODSFKJ/FACB0vu9/sO2vQXCxkYkx7yWoNBZ8
         KEREJkg5PVoDlEcg/y1yU9wBrQlWbxgkyv0IKgQODZSY1GKfXE6EFlotwE5mTrKWb9PL
         Hx56kDSKbAIazw6FrKT23CGI9Zyn8oqDor5MEYQIGI7KTrt1DybkqpykidiD5PMK+akc
         EceQE5t2/zRKf1aGlAY1ea66Fr7WXJVsqjyMcNT7anr6gfqo1OCaWnYZb3LJC6hXK3aK
         pWWPho/7gHUjgkW+kbKWm4cSuxadaeS5IT6hiKA33/GwXG6gnkxWZz92X3l/AnBRH9Wy
         4uQg==
X-Forwarded-Encrypted: i=1; AHgh+RruWpvWtBrsveexYX+QDyMPuEQDT3pRoIQKWiNoG15RHGlUAhXsgcYupJxQzf5in+mgu+A0O8qW3zjZrDdW@vger.kernel.org
X-Gm-Message-State: AOJu0YyJxrqq2Ma90VRosdR9XfVCVD3zIH4UZXhCFaE+dv6lGB6Oc8Dx
	JjT+aYfyhildMAG4naFUc3OUhigkJQtWlE7nHRwbb6iQdZh1pKOnMEjKMeSNpZEUJL0y/zPcgx5
	wQYgTo/00dqKgo4vVXp+cUzFb535p+8mS+vnhtuYvJKXDd1MV0NCu/7Ju+9dbWvvTqw98
X-Gm-Gg: AfdE7clMn0F06FJJDPiGDuVpq2ZCFmdDly0j3DP4zMipQvLh7MyA2BpbNH6qmwTaRNS
	9VYwFVY4uMCakaix0tRfqmKW5D4w6Lcabcf/c2VrN7BsCi//XphpE9a8XHynkulLDYon2id98+r
	RsPz/DUbjA7FbQEiIC5chnlfyNm1s9A3gTGYqoPOMO+wIzmB11g8JJMKCHjxFyFfvBcZzJMK0yJ
	lQ4ylldzRm6zZypO5v72m3WWV+Rqkk5M/a0Xn3F83nk/FWjWLADsK5XQW4QlmU6FVfIDga/+V/C
	cbbmPhrVt6jlYuxejj86rEQw5M2jAr+HMl2rD4D7Zcj3jzsn6Kdpb+d0vdKcH5i4AVqaZq/ZXY6
	zevvOxpGqorTuqSGNRoXc6cX1
X-Received: by 2002:ac8:6109:0:b0:51a:8c97:9389 with SMTP id d75a77b69052e-51c748f1f75mr68613881cf.64.1783442236588;
        Tue, 07 Jul 2026 09:37:16 -0700 (PDT)
X-Received: by 2002:ac8:6109:0:b0:51a:8c97:9389 with SMTP id d75a77b69052e-51c748f1f75mr68613081cf.64.1783442235658;
        Tue, 07 Jul 2026 09:37:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm34627699f8f.36.2026.07.07.09.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:37:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: monaco-arduino-monza: Add label to sound node
Date: Tue,  7 Jul 2026 17:37:02 +0100
Message-ID: <20260707163703.233405-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wkzaWbb6GhJvTiq98rV5PSucwZvRGiJq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX2FCcgSDQXL++
 AHpOX0xF3zd/Lr5EZR74vl9lIkx3IwGPiD8YmTsoYpUUctP/pdLHX1pYkwLgY/MJHDn8UPVN7wD
 hxlb3iiNmH0t+bQBaf6RUW6RdQOit/c=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4d2b3d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=T1UfASneSRU468WR1wEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: wkzaWbb6GhJvTiq98rV5PSucwZvRGiJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX8mhRsGZQYdbk
 TE40vxXctmLKGXjBcC5kDF6lLV9D2lgd3v8C35Y1o4CxerFSZAHk00ecUC8KshrW/eQ3kYfYftb
 iXV0AY9eSKZJEHBGKOxMJJA3Z7YFQYVv4WotWB/HUaIe0DTjXtQY5MvLg2Ea9n1V4Ujtk/7xCfS
 5CobYxWw0623vmbtmBa7uZXd3Ll8HvxtBLIWFjP1G6Yi37ljdpBVt1RYnHLaj8BvjiikS8akdnu
 QvDleKUs/folH38x+nYqjwilF+xRmv7/Ga8m9E4rpJCZGaln5dig8io9e6TE5f880xom7VvTeXa
 daDO7zCpQ9JoVNSDUOIeX2dkennkOONxrNsiI1bk9kdd9qiGxQLhkrO/IHPe8naahkDnesE+xp9
 9TbACICK8fjctei2EZfONo5tVmwqL4zqPkzkGvSJOct9SnBHO5r0oYXq7oSuxhZjYSysxBCrRYm
 SM5vwMI8k605jAon/qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117366-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 084E471DEFA

Add a label to the sound node to allow DT overlays to reference and
extend it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 4b1975dff885..1f27d92d9ec1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -55,7 +55,7 @@ hdmi_connector_in: endpoint {
 		};
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "arduino-monza";
 		audio-routing = "IN12",  "Headset Mic12",
-- 
2.53.0


