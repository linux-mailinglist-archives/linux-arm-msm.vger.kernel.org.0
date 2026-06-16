Return-Path: <linux-arm-msm+bounces-113364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wN2sGLMgMWpJcAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:08:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A068DE73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:08:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TT0eTV02;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TegC2rxI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113364-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113364-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE7A030055D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E33428487;
	Tue, 16 Jun 2026 10:08:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD06E3DB31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604522; cv=none; b=Kl3Wg2iwuTTt7bQa19WxYVgaTr7V31pX7k6sYK4xDnNgOAfA0TRqxwDlbuQ8u1JvSHMKP3DOb9AfmQTTsoC7uPnaDkm3VsGaqbKZKa2xnQliifzZRFxulcVrJszAivlvUvXxIDIN4XzsBObZ/pmsleRSbPXiDQBDO+sXHN9xuZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604522; c=relaxed/simple;
	bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0KoIKp83O1ZPKcSi3nrQC8T/fXiJUTa7yy6Q8aDSqJS1IuNlOtFait1WMf8nFQRvA6li5vW49/WI2TJ5h99cN1samA9XSVDRZ4UaFBQ5WlGLYItkabCCToZNMSAlHKGWKv0R8jQafQTBwzWHwYE6kjVV1jA7W8Ocx+BUncChdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TT0eTV02; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TegC2rxI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65LYB2849828
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=; b=TT0eTV02YI+wKWrt
	F8WVVn6H3cP+WvKoZZ2XhLsUfnPL14DoT/IIAQx4NdzLSpptvGHhUdM9ZZrhMs+V
	E0kNuLGXMxuVfswCkXyC2CwWjj+s9RseWu/ltAS4VOuw+XlSFSxfDE0Ie/zWeGmB
	8OuHS4TGtLv32ahY+wEvMIaED6UGEA1k/65inisb6X+iFVVR0uUMXy8jYOy9zo2Z
	cGCdLIlykTzV8BwoLduQYi7+o6aQwlp1VFhG22jzxjaPyJ85bCFz2xdidoBK2nTk
	TtTzU21orUOaXHdFQvmlqtqWskIX1tl+0OVCeOWyDm0moVwBuPpWVx379z325cfJ
	h2li2w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09g96a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304f1820babso6479788eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604519; x=1782209319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=TegC2rxIhhdnr/zMi/13QQAmV0EETPtwmTd0juDlfcybb+siUXRRYFreOcV1XQHGtb
         svLB5Vl3Z/9/pP5mKwaMEygIAtJIHvJvCueQUOSrSKEeZQ/4NE6QS1WotOZfq4sD1TJB
         GxNnnIxH/MTKoMhWQ4Yxtttqtae59AnjwQnRgJj5mkOCrGPBIN398JrDYuWQ1lOHxD9b
         YELpyN+JBcGfis//qU+cEG+n2oTE8FsK3Wu6LGYBzwdY8p5kLEUvdXTr685FRQil3z4E
         Ml7Nok9T4XNHDoTW/d642vEXz9tLey9+6ATs/UhaEppHgbxgXJ238AVn20+LJzd6LHwm
         ijBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604519; x=1782209319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=PgB3D2JOge76k+BHp3dEF4WfATL3yLlUvS7fyhjCnV5RJgYBTWfvZ5cuVqQlMqhoRs
         PbEobUKJuDuNLeJEM6DkVF1hkN8xmSZZmytGd2Qny+OawwiM3W4UKCzETGNYA+Iob+ff
         +w7OjCUYan0YNuNM5kkGNxvcedaPWXNlUl0/bluhiQzbvz8hM71GUkZUj0O4M5YUajcD
         0SefNEkARajXZ+lxu8Mc9/SRMnd8hhXXozRnQMTiGIc0l+1ontlzp3tcQk5Yx2svuD2r
         0e/pzHo+54HauleoFmyFugsLDOQcPf3am4YywTj1ffgmqDHzvemKTBnBknBtkmgP2M2P
         hzAA==
X-Gm-Message-State: AOJu0YwKJs/gVEP0zqNS0UW9GhvGx3HK56vurhirCsgQJK9d7Kq0eoM8
	BnIzl+djOjY5gX50TLD9X8IlOka+hwjfhNlrUJAThImgQwZDqF2aAVPSDrQIxK9JjGpHoXx7xlu
	EKmaezozWPPfo2Ga2KzfmEUbjObM4/0m/2VcbH1pKP3yjfEzjkr/qqgvX+laZJ2FJ+Git
X-Gm-Gg: Acq92OEVFa9Cdm1vsh96lGoFWYr6zfid9zphqD9ZB/huhdtACAZ99+TIRijymzKr5tS
	NjLDOl2w2UyxVl/8R/LHRS+FyBCCW0NqcXg79dh74POQBApXLjYaWTYtw+qYWZn7oUnR2oBbEII
	KIXSfclGvVC4C30gdfKLOEsBcNIaRflDDhVFmDzv1tTqTTn7HOF+g38mQB6yDVeTa6uMZQVTxhm
	6FzdezQmxyNhAyiFRsVJh3gKg+GF8TMVUVph3JAy/gGPM0PEvLLRvWWZPmyZRj8wX9o718wkVU2
	S4iCMW3lUDKSylDaD3N9Dp2vDfvfmiBV6kd8huJwl38+or2HlN0Wm0cy+b8KmKPakOOrkcz8b3W
	4LhA9aIPfhbf9ZEC1Mc6n/841Jisk8aQdzk9fILnk35v4rJM1/rMbwNmsHWB/Q7Go21yqQdoHJA
	==
X-Received: by 2002:a05:7301:9e43:b0:304:cefc:5fd7 with SMTP id 5a478bee46e88-30ba5fd3dcdmr1724524eec.32.1781604518529;
        Tue, 16 Jun 2026 03:08:38 -0700 (PDT)
X-Received: by 2002:a05:7301:9e43:b0:304:cefc:5fd7 with SMTP id 5a478bee46e88-30ba5fd3dcdmr1724494eec.32.1781604518029;
        Tue, 16 Jun 2026 03:08:38 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48bfa7sm18401484eec.5.2026.06.16.03.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:08:37 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:08:25 -0700
Subject: [PATCH 2/4] dt-bindings: mfd: qcom,spmi-pmic: Document haptics
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-qcom-spmi-haptics-v1-2-d24e422de6b4@oss.qualcomm.com>
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781604514; l=891;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
 b=48XWeEtbee33WhaBiCWBr1iE9nVtAOrF+xNAPyMUznrOoUclZfGlbb/r6O7sYp0bkPNWbseQY
 jjCMfJCMSV7B/GB76UKz7DSXNKEQ38JLFRGy5M+yCeINH//5F8pRpVy
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX4dSQZk0Z2OtX
 0aVeGUYaDDlZqgYQ4JvyR7IBEBrMePhqPtswwPD0zp7//iGWebJ+4vY330lJhy1tz5PDon4Bllc
 Q6GXw9zPICYiZYBKad4Zqu4/D9vHl0P8zJBB9DOwgn6IyUC26PbTLa4q4aYV6586YUcXGYt0Evr
 g4az3/jOHQ1TkhW6f2VYUUxGvkR/FumQuEWpaGX8a2ioNVkKdiwggyis78SJQQl1sVvr+cOdQw+
 ETl7SJU0blRfpb7CVsY8Kfbf49jO4S94OhKXp3LUl7YUHTDK7nkyvsmHNjhIf29CkKJ0rm7Ge7a
 uRPRyFFxkwPQ8ODXzNMVw8kT39mdHGU4cQNM5wfQFKSqgKnRyrk/PyzhTmAUriJ+dlMYv8EdfEf
 tYbSuZdxHSTO8PHZSVdN70YQB0VJkLi0Wqr1aFIZVholWq77uVdL+R+EA5A7EYqtngoqDe3y+wv
 6RoOTxROrrsQhAczoPw==
X-Proofpoint-ORIG-GUID: Xh6BPGUZr9dSvpCJa1uk58_oGpXT0ikQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX5pDA/lXO1AtQ
 QlAsGKWK2R4R36yHM1HlkRIMo6y7kRt2a+3S7rYd+EJXSDmW8Kj4ohuJrRCjh6bgQ4OOhLIHkQB
 m4MdM9B+4hPuYRSr59bbRRVJ5BAU5E4=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a3120a7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aKV5VrVIVVfq6qmweGsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Xh6BPGUZr9dSvpCJa1uk58_oGpXT0ikQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113364-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 622A068DE73

Some of the Qualcomm SPMI PMIC has haptics device in it, add it in the
device list.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..773f4cba5935 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -165,6 +165,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "^haptics@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,spmi-haptics.yaml#
+
   "^led-controller@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,spmi-flash-led.yaml#

-- 
2.43.0


