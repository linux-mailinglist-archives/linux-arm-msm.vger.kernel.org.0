Return-Path: <linux-arm-msm+bounces-116798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GiuML+m1S2oMZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:04:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9C711B25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:04:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="U9k/eB8n";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EJIkRm8Y;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116798-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116798-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B72A2329FEFE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE5042DFF4;
	Mon,  6 Jul 2026 12:31:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A16C42CAFC
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:31:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341098; cv=none; b=cY6Q9AY7/ZuwZ0dpsvDzc84ewsQew4DiluV7T8IlrJ4VqyWJcRjtYWhMfzH0Y/vckjiH5VdMo/VSltfmc538zVqCWs47XvsBSd1L7BJD65VpFIKOJEKv752asie6weq9wXknubzLL3bcCA7uxvfpBVjp4qKPcYV41pAuXgI6u4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341098; c=relaxed/simple;
	bh=wcaDAcJbxEOLbIDYL7Yv7cDA2DO4yoqD9dV8JvZuO34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7ixx4gY250OLym8IPR8pL4WRKSbws8qGFiSv7r4Wr8Waofhd3gUgXk0jkSRRJZP5/REgkPPmdc75P9BDkbP2LktiwIGAjoF5MFohsEY+UdiRe/y+oRr3DAireDoARtZTsCBn6+JeSPjfnObhTCR8x3E7E4oJUEe31xG4vWM5NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9k/eB8n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJIkRm8Y; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDcP366717
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IknsrGHJP1iQr5TspskyHtFF58EhBmo2rNT3Q8qunWY=; b=U9k/eB8nz7NfX4WC
	A+cqPIHmGSKR7aBvDKrkW9SqKNDvLwWokaSRgnjbbXeBFAgVUqCU4xAocrM64X8T
	jfr3XAwSJu/PYfB0mVdYTKoHuyFlo7Bk79uuOgRLEpIruU69wcOxlca7Hyu/NRkS
	soVgLiuZ7EfqNCDACqBYFkufs0MjyC/cof0gmdfxUeu52+h0K2/F2uOMiy0ZQeIF
	KwapRMp0J6uF00ZF1WYB6HSJEga7swR2WtVJdKK1y8SJ2aIyyXeQtU9P1BugQM3K
	Z5W9IQklSMt/t/yJGPFhNkqpL8ol+eJOv7dnPhzKVHLL6Y4DNlmb9KvBxdWWE2qZ
	0Zfvug==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891uruy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:31:36 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738b76cfe03so3441088137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341095; x=1783945895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IknsrGHJP1iQr5TspskyHtFF58EhBmo2rNT3Q8qunWY=;
        b=EJIkRm8YPfV2iQYvZViFJOk2bUYD6TmCXWjaIjYf1MgnOtsY9E8NEmHBcqHPHY4ser
         CjPXXFkS1IV8jDpbos/HJV32M1yayshRguG/0tQX/fAfvZcH1YySNYkFUnvcXANMb9ll
         nGpVewe5bUq6cepawCQhr5OAkgeD7fW+91GfUlkBZiV58DHfCXz+uSZ0+BqAVTJNuy4C
         GLQxfjhIEsEnusOHEyvu6X0gOARNlqNbtVL+NIJj0LXlzIW3Kl86bMEO98MrBSWp0Q7M
         xhvLp64OEKIF7SvwN/VhlH3b0zQTOh97o6Qwp9ceXvr2ci/nEAMGxtwb/BVH0tXIVI1p
         uThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341095; x=1783945895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IknsrGHJP1iQr5TspskyHtFF58EhBmo2rNT3Q8qunWY=;
        b=pTBIKGstWTO6tOLEsQUHfqN9WRKtWzlsw2tXjT0n+opABQL+LaoeS/wx5ounPFgoXY
         UmpAkW0GN9TFsYQpr+lVsCRoRdrDtyjcOBHQSYmvInUSGgBML4DRW/BopVUPtIjeZmlO
         4m5/HRusgAQxP3Wm4KW9xvglKwFuoy+SHXLPBYMlSG/iXeETIMxczUvxwAeyaLE+mWbJ
         5EH3XSPByDOpah0Lhww0luUnQ7J7X+/cOu+N5NfbPNUO03ZyE2srXDqTF7YDkzQe8AZD
         htiPiEm1V0tNX7WISzDgBmEMo6S82zLzn0Z0tn9Zk46affBA5aLMFnK0mAlkEEwwWK6J
         5Fvg==
X-Gm-Message-State: AOJu0Yx/32JFQqtAtZROTZ4DwbPmXaCORQZvaP+EL2lz9gyGZpyXx6/4
	M0qOsz2JkbX1so4oYusMNdoT63o18XtUO2vUofhm6tq1NOLc/XNv/TnmSESMkEAOi1+nlzBUCXh
	tBpqn05Mg7c4FwnnjPU7Rp93OLNyPsveP/haiVg2k/xo1rfY7UrNOEzsld+jZlQXTaeQ=
X-Gm-Gg: AfdE7cmpgYHc+IBgBskmsuRl/4AC+55q597Adm+okKIGiiWhbFzUIyayQBu1qYva6Wj
	jYndvdYdECDLI9iOMIC9X0i/Y+mMzxDwL2hikXAI6Edwl/oCbsg0tIlMhr1O3h+jtI8hY/ODdkk
	JaaOT3eDJApQc9PceJ+WHTk3kEN/PFdrShxhMk5nnUekPbtictIVaXfUAGJOrgH5sflT5klATTY
	1zcX7wm6AXKwmSoNoK8i7RO7Slq95rubaBfcxtKr1KIXNnpHke7YSKUn8c7h3UeyI0S5MaMszav
	YMg5NiZzF6AhX5hy12U1sYlJAR/4L5vlqHWuxgO1GTcvbi72M2leLADum3p5CMjiJWuNfcNfp92
	HYpgwDP4KDXrGQR/NQyNU64421Dvwt/ld1Ta6jMUn
X-Received: by 2002:a05:6102:50a0:b0:737:9003:ac54 with SMTP id ada2fe7eead31-744b7855d90mr153471137.0.1783341095406;
        Mon, 06 Jul 2026 05:31:35 -0700 (PDT)
X-Received: by 2002:a05:6102:50a0:b0:737:9003:ac54 with SMTP id ada2fe7eead31-744b7855d90mr153429137.0.1783341094909;
        Mon, 06 Jul 2026 05:31:34 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838e1980sm5252990241.7.2026.07.06.05.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:31:34 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 18:01:05 +0530
Subject: [PATCH v3 1/4] dt-bindings: regulator: qcom,usb-vbus-regulator:
 add qcom,pm4125-vbus-reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-add_pm4125-vbus-reg-v3-1-999d78a87b81@oss.qualcomm.com>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783341082; l=3484;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=wcaDAcJbxEOLbIDYL7Yv7cDA2DO4yoqD9dV8JvZuO34=;
 b=2jQ/lO3FvhUcsQ6YtlYpomVEr/QOxkX0m4JtsAFYOJdVLiMyp+w8lmsxN2zOa8l9fWF1lfOIQ
 EymZeMQUJrNCKKd9RpYiP6zVWek0dTASuLqfe726nxAOrvIo4MJjcqh
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: Hg5ARx3-hTlSD0hoIoiMm04Brcfso6Mx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfXxy3/+6+BDPBG
 oIBYFSQcNcHiYck2gCRCm4F2DIMyh5d1D9fA9x5ReqWcMNCMmM0e3ozHx1dOQPWAbtB31sPPd8n
 YIQ2/knrfM2xOmvnn1XxK9CrGbOvbRY=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4ba028 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nDMmG0lKkFKFsl1axvUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX3QUsYczf5A4u
 OV4A6J0iIpig3FXNHu2miH5zR6+wPsGCUgPB/1jir0Skz0H3Jn5BCYFLV8e1OWyPSHc5H+U469Y
 ApDBpYVxsjc2OYHph7/VWfsBqvaelehqrura/LjUcLZJeSCaLGF6/zC9knGQigUA0oGteNSiXUR
 NuBtXqdUHx/xzCl6hJ4Daes6Zn45LFQhRJfMMISdRzFaiFSEtfV+OifBDczx2Q+7Oidw86yP4NC
 fidkiBcLQznSm5NxlZeABW+gXl96LCCRpBsMbhATara+GdUJp+cVn9VfAH1nGv7isP9xqvI9b9g
 PNliYSh63QSHx987oNTe2wpb6OYZF6ltXxnQCZHmn7ssFCU9oOFQAzm4ZQAfZfj7Z+MDVnt55QW
 580HCyC50JZe3LYQr3s+dJHOZQLMqGtAb+v2+0v6gz7SPGyRVL96E7rNxavQadrnrNd4J3CTN2k
 bXphTRx2q23+N4LRv7g==
X-Proofpoint-ORIG-GUID: Hg5ARx3-hTlSD0hoIoiMm04Brcfso6Mx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116798-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:rakesh.kota@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01D9C711B25

The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
It uses a 2-bit VBOOST voltage selector supporting output voltages of
4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.

Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
standalone enum since the driver handles it with its own match-data and
register layout.

Make regulator-min/max-microamp conditional so they are only required
for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
max-microvolt instead, and update the pm4125 example accordingly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index fcefc722ee2a495837fedba026669de97350c566..024b34d0eb1a694b9e0ff530a35f787582caa425 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -14,17 +14,21 @@ description: |
   regulator will be enabled in situations where the device is required to
   provide power to the connected peripheral.
 
-allOf:
-  - $ref: regulator.yaml#
+  The pm8150b variant uses an OTG current-limit selector, supporting limits
+  of 500 mA, 1000 mA, 1500 mA, 2000 mA, 2500 mA and 3000 mA.
+
+  The pm4125 variant uses a different register layout with a 2-bit VBOOST
+  voltage selector supporting output voltages of 4.25 V, 4.5 V, 4.75 V
+  and 5.0 V.
 
 properties:
   compatible:
     oneOf:
       - enum:
           - qcom,pm8150b-vbus-reg
+          - qcom,pm4125-vbus-reg
       - items:
           - enum:
-              - qcom,pm4125-vbus-reg
               - qcom,pm6150-vbus-reg
               - qcom,pm7250b-vbus-reg
               - qcom,pmi632-vbus-reg
@@ -34,11 +38,35 @@ properties:
     maxItems: 1
     description: VBUS output base address
 
+allOf:
+  - $ref: regulator.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pm8150b-vbus-reg
+              - qcom,pm6150-vbus-reg
+              - qcom,pm7250b-vbus-reg
+              - qcom,pmi632-vbus-reg
+    then:
+      required:
+        - regulator-min-microamp
+        - regulator-max-microamp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,pm4125-vbus-reg
+    then:
+      required:
+        - regulator-min-microvolt
+        - regulator-max-microvolt
+
 required:
   - compatible
   - reg
-  - regulator-min-microamp
-  - regulator-max-microamp
 
 unevaluatedProperties: false
 
@@ -55,4 +83,16 @@ examples:
             regulator-max-microamp = <3000000>;
         };
      };
+  - |
+     pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb-vbus-regulator@1100 {
+            compatible = "qcom,pm4125-vbus-reg";
+            reg = <0x1100>;
+            regulator-min-microvolt = <4250000>;
+            regulator-max-microvolt = <5000000>;
+        };
+     };
 ...

-- 
2.34.1


