Return-Path: <linux-arm-msm+bounces-117756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NuPfNyV0TmpVNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:00:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDD2728608
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:00:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YOxnlwK9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A9KafxZ4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117756-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117756-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9280D3033091
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365D3370AD6;
	Wed,  8 Jul 2026 15:30:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD3E34D3B9
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:30:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524621; cv=none; b=F6NnaUOyRkUj45NqCARGjp8wecgaszN7LumxmU0Yupq/L5Q/XsbZ5RsxZxuvxo+QCRYUZ52jCqRCQnJewbuJcc7W0dA4z44P7dW/UbjXe8R9lAkCtuuigzbiND6ucHWqa5tm93glr8NN46QD5QWRNri2HuqoSIgJQUJhIzIUhPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524621; c=relaxed/simple;
	bh=kExEI0u2FCHOGCzrs6gLrUUDf9Bz6z61FyEuo8oNCBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YNPyIQudMzTprDkO/1GdeWfy5vGBIqpHgBrUGfgCzsn1qAjjbw/E5tZTp1zcODsnFWI6RUYX4g6Ge4E1iJfhOE7d+5Aps4284wx78kGaDMCbS+5jDZeV3rEBqSl0QWEpImUfa/px7kopJqiOVJWZH6NDsGiPKZ4r32a05/wULB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOxnlwK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9KafxZ4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3DsC2751263
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WBZ5IOMfH4WhWXCherx//t
	8qk071J0231mN+6mZzkiI=; b=YOxnlwK9DfGuTaY4OT760BBWgI77cQclffgRkr
	GjBfBCXxnoqIAin4q7QAorNpeG897/ZoQoKQS7JHG2NHyPlC8KJykrnjHdmpqvI/
	08OrCy+IAwu3wuB3/5Yt8tAdUGvOtkuvepR6JkpYE0MqBy5028x9IUWoFJFEaZB1
	cP82EAbo0NjwkwQmF1XQgdsEyMAg4CEbzg4pAra+hiqK8WixvxZe13bp5FkXZYay
	lf7BEJ7wEESse8jCpi49y5nshhxAwJ1t+960Wv5gRdmQ7GwyeHoeRaJzluT7JYZ9
	ThA4KwlOrzSLeot7bWksM5G9SU3Q/5T1KLvsT97UE7p0QYKQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hjf5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:30:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eb8914e651so20941616d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783524618; x=1784129418; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WBZ5IOMfH4WhWXCherx//t8qk071J0231mN+6mZzkiI=;
        b=A9KafxZ420e+umJTZJZZsWXexWADZIKNKKmExVVMrd5HFENEIPbpctwpBrdUj05ndc
         SpxN8QiBnZRqOh7BJBsOS0xGRAydiNNNR3v9A8jGuBWDhrVmGdyQ3uBKcd8Fk93OAj12
         8uZCBQ9iNybFYmwD0V9mazhHZt+YDLoPC8v2EMYePk/QM6uq/rozAq/xlImOHPf/9vqf
         THo8ZNPAKEvn28p+Fz+5NitbNWwi8+kmM2mq6/4fsYFuV8DaqbDb6Wj7TcrUINQ/iDjZ
         1bGe2c9lyC0VTHU7B1SycEa+fllxAJPbdvyjf8QO/wnu0a57C5LU2wOTHeb6muUVfzyi
         869w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524618; x=1784129418;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WBZ5IOMfH4WhWXCherx//t8qk071J0231mN+6mZzkiI=;
        b=nHwMj1p9MYylih5g7cL89dMm2Kx8MRAIZ5rV5VMEGWbfE+DWcAzSxEd+HkFTrpq8sk
         G75HeAkHlqyfaiQ7FSTpphoed7qnrOVYcfe9LIitTBjoB/OioEnIz7CH2SRrNeFWbLt7
         5qDDoqPee9lAnRfRlfwrvRwJqFgo+tFZv4UvNS4mGN2vocH8bWYy64JzQO2i9v10TD9c
         M+0kuZJ+JazDBSRlKmTHzQaUtsH+Z5n8QFENBGj6tG0gCLn9cc7zY7Q5XuuDfbL01PUb
         ZjlBpm+vRELjcRfsuu2D4Qgf8tW2BovtVN+yO+fsvjawDM6SgoLbkMTi0TAOLTvVSMfE
         chsg==
X-Gm-Message-State: AOJu0YyB/huQ3k+B2GC/qo/PDhIipq/bAWEGqnCeJHXeH+SAH3+C+rqA
	GbjgykLkEsovsbU80pTj25UluVfILuUxgSOpELbwTzn+Xz+V92n4r6MdKrpmnXZh7+PMWa7Enhc
	5aoRlV50IjmKviBc230KXlywyyWqISexnj8iHLdam/xUkZ/3T5S9q91yU60wQBvdwHVm5
X-Gm-Gg: AfdE7clSLMDHeYhcfmnxUXcOAn6eH3sMJch+A+yfek+y4gi80v+uobBYLO/zeJS9gea
	ZJpZ8lRZYUrPtXGDmuQoEuVZLvn2WDLE7m+5Y4CjYAiwqlZysHJfi88Ax8TSNBsV0xCsJIfOtt3
	pJgeeZVPP6zChjamVGO6a/WCS5lNVmF9w/Z5zFwpOZFuPyGXH8byibs7QtjhQY2xtVFRXQbPoew
	WsDjao4dklNqXjGUjAD7RMg6DYxTwjX57cHXabgropgt0uBdzepAjhxul/ATlp43Jqp07/Ft8rb
	+/JzXpo5VOG/7iqzTi8IrgkhRi46zsfcECXQSpg8CnlRTIexvIVZAIFV3SoFKuZQ06Ami2lHZv4
	jRqoaGNkDOF+bmgFYEbvyhc3DOEgBzlpMLip5Pi/YtaEj8HEhu6+OkPsosJ4bXy5p/OQjbajmkO
	DgSAmxPVy3+kN8pRs8bgEXlvEveVA8buBCnHajtXzqsNSA1Gb3uZBYczOX4GOyrijQ8bSzm/P6Y
	HXTRqB8yP73T4YOKps2
X-Received: by 2002:ac8:5fcd:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-51c8b39902fmr31419091cf.16.1783524617943;
        Wed, 08 Jul 2026 08:30:17 -0700 (PDT)
X-Received: by 2002:ac8:5fcd:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-51c8b39902fmr31418391cf.16.1783524617372;
        Wed, 08 Jul 2026 08:30:17 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb482f7sm348665666b.59.2026.07.08.08.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:30:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 17:30:13 +0200
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add sleep button
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAARtTmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwML3aTSkpL8vGLdzPxi3TTDNLPEREuLJLPURCWgjoKi1LTMCrBp0bG
 1tQA0yNmbXQAAAA==
X-Change-ID: 20260708-buttons-ios-f1f6aa98b6ea
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MiBTYWx0ZWRfX3vlWtcS21NoB
 7N2oDdUho6W8YxL7xFXg4bWkrl0JGvF6DMtbk7Ngl0AiZ3IR87T+/rAy3+3ku3b2xBW1fK76Wwh
 0bwt2gMWFj+WJISYQIxiIAfNgWh5z16r5bANWP5EijpfTAMkouucLBTNGrB5w+lZjxm+FanAfnY
 3KofXY1gD17OzLX/lcMUO5xpGGBR8VXH9pZX+et+sV2NTNWnu+3CNchwddWjWC6ZIE8xRm7NAW2
 hGXg88W4SWFtx4DgKgg8tM7wylzxNhHCQYjC1YqJN3LE0fRRalw/eiYi7MZWQ8VLiNIUQjdW4XM
 n5KsYx49rDyLQPR6ZOffynE0kkJa2cD8V3vdIxjqrfJh4D9Fqat2dEIYZwKlxmT6ynNR4zdP/oN
 DVBWo0hmMyhkgidQi6VSluK5SNgP4KnXxBs2XAPnxqS244ZfPCUzsuOcMHHL7etNlbnzG3nBe3f
 WwCtMIa2sJ2el4Yzk7A==
X-Proofpoint-GUID: cHZUs4ud_kr5xMBPEdqGTyJoH8eR9Ut9
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e6d0b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gjCkitBQ8UzLeNF7HDgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MiBTYWx0ZWRfX7a6dZxIhqs0m
 GJmgStaANlFjyZo1L4jxOz//aSAXtoYUnezWWdZ9h+uuWeXBJZQdC6ADbjSTansF70Gvu5CH0Zk
 vM5E3zDbeEvtEEpf1D58Wt/R1TLoHWc=
X-Proofpoint-ORIG-GUID: cHZUs4ud_kr5xMBPEdqGTyJoH8eR9Ut9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117756-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DDD2728608

Add the board's horizontal button connected to GPIO69 as a gpio-keys input.
The button generates KEY_SLEEP events and is configured as a wakeup source.

Note: The button is actually connected to the onboard MCU, and forwarded
to the SoC via an active-high GPIO.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 8b3ed73feb6eca6578382beca588baf42b8c9bb6..0407b700f6087c9350e9142027e085ebb87f0406 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -33,6 +33,14 @@ gpio-keys {
 		pinctrl-0 = <&gpio_keys_default>;
 		pinctrl-names = "default";
 
+		button-sleep {
+			label = "Sleep Key";
+			linux,code = <KEY_SLEEP>;
+			gpios = <&tlmm 69 GPIO_ACTIVE_HIGH>;
+			debounce-interval = <60>;
+			wakeup-source;
+		};
+
 		button-home {
 			label = "Home Key";
 			linux,code = <KEY_HOMEPAGE>;
@@ -501,9 +509,17 @@ perst-pins {
 	};
 
 	gpio_keys_default: gpio-keys-default-state {
-		pins = "gpio79";
-		function = "gpio";
-		bias-disable;
+		horizontal-button-pins {
+			pins = "gpio69";
+			function = "gpio";
+			bias-pull-down;
+		};
+
+		vertical-button-pins {
+			pins = "gpio79";
+			function = "gpio";
+			bias-disable;
+		};
 	};
 
 	adv7535_default: adv7535-default-state {

---
base-commit: f86573e68e56a7df7d54eb58101ac413ba731996
change-id: 20260708-buttons-ios-f1f6aa98b6ea

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


