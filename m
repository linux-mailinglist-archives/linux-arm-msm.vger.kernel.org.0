Return-Path: <linux-arm-msm+bounces-94868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPelL9dspWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:56:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 620C31D701A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A405A303DF7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6399035A933;
	Mon,  2 Mar 2026 10:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oeKy0eeA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+dPKhoO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844B035A3B9
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448826; cv=none; b=jC5eik1G3U2az2CWp9jOztLx+rFI43haZquHs6VfijbFYo2F7X6IQlhfX5qtAupb0LqSVen13gDYI72lgKTaHRHKz72lTWE4vuFiNU+r0nvOZKwFmDE3QXuh2nZl8Od99y4sQTChab+T/po9HSJdcs2/MzltCHBH4U7/du3Q8RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448826; c=relaxed/simple;
	bh=I/+CRpce1XiriRnEG9k0CUVvP2dGm+/iz+eD3GjQGuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzwG20w+1sdY4i/BHQ8UI1gvVfSwZAwbh9lQ1+Hx6KCgJNBImsS5ZMzOgtmGIm2kYopfmaMoL42rguGMuzWVal36vU43GlJlTkFnK3dSHsqtzujoxnRP2D/HOMMBNcjFD+IHN3c4nQhy2FrNpdBH98CCmNepITnFCniLSWjvB1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeKy0eeA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+dPKhoO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62280XYK2729394
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yOzFGp4JNyhYJP0AxtK8kPu6dVoCUhZdvr5f+DHYtl4=; b=oeKy0eeAYm6V1wKz
	/+Kcag4SNMyFuW5ijh84MKCZZwcJrAi1dAO3DndaBZJZEqNSe5ThVqrzTCPHOeJu
	f4ON8lQvlBc521x++hwG7zUKVeHL83LVfoUtLJ/I/FYkFA7lYgTeMJdUM4WkkuaV
	EL/jfvR12HzlSgbTH3fVUciFLQ6zLVR1yj64nlsx98FTi5Cv/ozU2goHY9OuOI9G
	i6TqC29b+6xQbEkXul2BH76FxzYtLMiBU0wcjRoNgDDqaziTifTG0KnZ6s0aYJGd
	AtsG8TaKKsIXZTegspLx0EaEXA0uga/ZDb3xcz6/pMuv0ctKyvYB6nDLO1q1qN3R
	3PdpDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbau1y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:53:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so3092281285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448823; x=1773053623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOzFGp4JNyhYJP0AxtK8kPu6dVoCUhZdvr5f+DHYtl4=;
        b=f+dPKhoOMHpfNMWQ8PDe1zdBw9xmaIFVbHfDwCfsMmlNddz9ih9+s0ZVQVg/q7Qbp3
         PVj/cfrEafgJQoyZ8cBh8aWZ7wthFOR7iJQODvroyAJjUVnZn2KSnhqOzS+9zwcWOns/
         LkuIwrrXcjz3u136EpwWPByHbQrr1w65sr1BjmWPA9sm2rJAlYF7iDZ7LBk9eI5//qO1
         irZNllnpr7PLQyiAAArbWEyC/Rmqx5Oyhsayh0mndXJHyWlqPX+2lVafXIK9xrO+itB0
         gIwtrxv56U4+ulpTRYGuR502a8qf3JeNzTmD/im2VqT3s/zXBHzirxrq5SZYwaPUOBNJ
         MQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448823; x=1773053623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yOzFGp4JNyhYJP0AxtK8kPu6dVoCUhZdvr5f+DHYtl4=;
        b=FMQ3D3r/kpR+GQGWRey1UbudnqnSpbS7EnncqiFwTkn6tA7XWFEHuVzk7kpqJnBsx9
         0AZPcSgt+qQZFmHY2atPTQ8p6Vll5CVbg1PyyQ1tSR4lSWKOzFquQSOaIXIvBbrN4aMl
         KzHmQs5qUbx+Q6fkRqCwbnpittkvBl+JDBMNzxofU2oc6Qhhqe5Athwe1kiVhuWOiET9
         fjJwvpyUPm5WrwnRCl3n6rv+4XjqpAUQE3canIvaNk/X+wmkRRcDsJaOr3uowy3/e+Ky
         KoV6XUvUDhRs1ZqY0u3OgEO7nS2jSLjs1LDVZ+y0HY9hNcU1cDM0vM0mUU7k1GtlWvLj
         nGqQ==
X-Gm-Message-State: AOJu0YzEO+xneO3T8rhVwxy+EntzS3OYqvsLh0oW9+rMR5j4L3+HK6fA
	5xmaea/X+/SiDCY0xV3lTa3DJ1ada3GUO8FilBxJUZ5m/Ktnl5MrrG4kfOZGo5OkWJM9HFmrkyb
	+2xsREW0aE7/NPYBLF3KRduiSSjAcCxGEeDWm9fQTbNLTRWokjRiA2CVUURKuEWmY65Cg
X-Gm-Gg: ATEYQzyF4K0ewUjI7ppeocvzatHfTtdrGV6pTUTViKupr/8c6s30JfcMl4mxshu6Xfj
	lNOIvDj447L5mObPPIHwBLbYZ33OQBd6h6KX13fWe2JRXTXxQ8/dr5fJ1hzJNTCs+Wa0ISlSr3w
	KnS4o7GA0M/neacjve7+d14/u9Q2KqF0u7fj5r3I1D61NE+2S8RcHFCNGNngjdRUoGjny/8NQqX
	5N1qFb5sKDbhmfC4kWXr70p8NEvmrgxi5hOLrv3xi8nqMaWzanpkKjrHbQYMlv7GxOFiwY32aY1
	f/PpuzVOgbVpFpncIV/6T5EaTwrPXCieYAtvsPVl9l7dyE+RfsmEXD0ZWt9Drbt5MXhRXWjj4Zi
	SPJjhX1AzpOMY6spsLBA+aml9VK6m0Q==
X-Received: by 2002:a05:620a:690d:b0:8ca:2086:a148 with SMTP id af79cd13be357-8cbc8d9aef0mr1537757685a.28.1772448822433;
        Mon, 02 Mar 2026 02:53:42 -0800 (PST)
X-Received: by 2002:a05:620a:690d:b0:8ca:2086:a148 with SMTP id af79cd13be357-8cbc8d9aef0mr1537755285a.28.1772448821918;
        Mon, 02 Mar 2026 02:53:41 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm8399509f8f.38.2026.03.02.02.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:41 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 12:53:29 +0200
Subject: [PATCH v6 1/6] dt-bindings: clock: qcom: document the Eliza Global
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-eliza-clocks-v6-1-6f42d8a9d25c@oss.qualcomm.com>
References: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
In-Reply-To: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9930;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=j9DYzOsnDGdpwgJbOPis1A0xVmxQC+mYTY2zHyH88h8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppWwrUnNYccdAh99PQrh0daipb+k+hvP7jUe3B
 d5XUELbvUiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVsKwAKCRAbX0TJAJUV
 VujAD/4ienKgkPcZH7MrX9Z82xeUTU8wBGs8VGge7eXkyewqWseYnHeOUKuRpO7HPCBUOp/93jy
 F3188QrJR6w5FzbnRs1UFMpAdX//q+bTPgWTiXKB7a24HV8nauvkz5VVK4pt1GgScg/SB8WNfXP
 UQWKTdyCfPQJQmej49K2o63/0rZ0iWSGevMPMa0s0+syV8HU5OUyWLHnScChPOGP1GBjdJIKi3/
 /5aWh17PaDLD3BnUSwc2Y3GM5kfZ0VJLzec5G51kVFoHHqlVXyYa0cZsm0S0LFNP89mcdnbsioI
 eAHyAePSjbzoiVWJdxkvWAwto6IqJAkFnZCqRH/Yc1lfcgCfvX8NjdwoYhg8pdBZc9yslp4IcEQ
 JE3PprRpXH3XyrFCXcdxs7vviHLbyH/952X6ZicwmQLej6OOqu+TqjmkKbM7ZhuRFXYK3wm6mpM
 Gml8qC+K98jzcr5M6fV6ppgAUJDidJ6Mdoar8LfCb1DANkgLL5uRcvomOx63E8NSpQgf2SwRrPv
 LngRYqpxbxsaIg5b3X6E9WzaoUXN9mhFeYQ2QSRfEAqVM8Nzhn/DOD+itgXbKKPjGwtO72fgse/
 kQSaxL69/ZvbBkQqDFLNBSECw9sO6dVKVG23uGW9QP6zIiIRA/EmzUsHt9lHXzcnwNH9JthCGLu
 EItCw5Cq2w6LyTQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfX+5m6Y0E3sKyf
 W3HPGASnVOOxr4F2QzYS0vffLmmUuxtOsKgdqaOJb6L4bmzB5a044HNM62Bjz54M5utY1hhy4OU
 yV/Ry7O50WM1XQMuj58xtbRvmsXuVfYTCoaR0jX+Mvg1TJjykEX2M1RAH3GBeYdCvHeC0sYfNYM
 OFvtWu1MG84c1mYTVbNDF2mE4wsYgrrVguwSzCJULXOHxYduaEUpgBoXLruo01vHUvEC1lEGnZ+
 LnqqAu29zjgmKG6MwA2Fzec7u442lJP4I236EHRv3HF2RRGrGHqow9Yi128tdNq28YzAzMcGrxp
 HCV5lF35F0OfgpvbWhA5Q/lzrACIgNJXIRtFljIEhM9ilbZ1E4p2HIB8W7+9NbqHcbSQQ8WPjop
 VS8AuIqKKaUjNhaBhD4WxYEf5lFHtiAPJ36NBR0RoD5mYQLs0optWYeasB41hCe9CPCeH/XlxDc
 zJHhxMmENz+zkZaVAmA==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a56c37 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=QumFvB_LMSHuJXskJCsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: TDu4ZuqkOjjRilC5LQNB0b3_4fktSVXM
X-Proofpoint-GUID: TDu4ZuqkOjjRilC5LQNB0b3_4fktSVXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94868-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,fairphone.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 620C31D701A
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for the Global Clock Controller on Qualcomm
Eliza SoC. Reuse the Milos bindings schema since the controller resources
are exactly the same, even though the controllers are incompatible between
them.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   9 +-
 include/dt-bindings/clock/qcom,eliza-gcc.h         | 210 +++++++++++++++++++++
 2 files changed, 217 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
index cf244c155f9a..60f1c8ca2c13 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Global Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-gcc.h
+  See also:
+   - include/dt-bindings/clock/qcom,eliza-gcc.h
+   - include/dt-bindings/clock/qcom,milos-gcc.h
 
 properties:
   compatible:
-    const: qcom,milos-gcc
+    enum:
+      - qcom,eliza-gcc
+      - qcom,milos-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,eliza-gcc.h b/include/dt-bindings/clock/qcom,eliza-gcc.h
new file mode 100644
index 000000000000..4d27b329ae99
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gcc.h
@@ -0,0 +1,210 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_ELIZA_H
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_PCIE_AXI_CLK				0
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				1
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				2
+#define GCC_BOOT_ROM_AHB_CLK					3
+#define GCC_CAM_BIST_MCLK_AHB_CLK				4
+#define GCC_CAMERA_AHB_CLK					5
+#define GCC_CAMERA_HF_AXI_CLK					6
+#define GCC_CAMERA_SF_AXI_CLK					7
+#define GCC_CAMERA_XO_CLK					8
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				9
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				10
+#define GCC_CNOC_PCIE_SF_AXI_CLK				11
+#define GCC_DDRSS_GPU_AXI_CLK					12
+#define GCC_DDRSS_PCIE_SF_QTB_CLK				13
+#define GCC_DISP_AHB_CLK					14
+#define GCC_DISP_HF_AXI_CLK					15
+#define GCC_GP1_CLK						16
+#define GCC_GP1_CLK_SRC						17
+#define GCC_GP2_CLK						18
+#define GCC_GP2_CLK_SRC						19
+#define GCC_GP3_CLK						20
+#define GCC_GP3_CLK_SRC						21
+#define GCC_GPLL0						22
+#define GCC_GPLL0_OUT_EVEN					23
+#define GCC_GPLL4						24
+#define GCC_GPLL7						25
+#define GCC_GPLL8						26
+#define GCC_GPLL9						27
+#define GCC_GPU_CFG_AHB_CLK					28
+#define GCC_GPU_GEMNOC_GFX_CLK					29
+#define GCC_GPU_GPLL0_CPH_CLK_SRC				30
+#define GCC_GPU_GPLL0_DIV_CPH_CLK_SRC				31
+#define GCC_GPU_SMMU_VOTE_CLK					32
+#define GCC_MMU_TCU_VOTE_CLK					33
+#define GCC_PCIE_0_AUX_CLK					34
+#define GCC_PCIE_0_AUX_CLK_SRC					35
+#define GCC_PCIE_0_CFG_AHB_CLK					36
+#define GCC_PCIE_0_MSTR_AXI_CLK					37
+#define GCC_PCIE_0_PHY_RCHNG_CLK				38
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				39
+#define GCC_PCIE_0_PIPE_CLK					40
+#define GCC_PCIE_0_PIPE_CLK_SRC					41
+#define GCC_PCIE_0_PIPE_DIV2_CLK				42
+#define GCC_PCIE_0_PIPE_DIV2_CLK_SRC				43
+#define GCC_PCIE_0_SLV_AXI_CLK					44
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				45
+#define GCC_PCIE_1_AUX_CLK					46
+#define GCC_PCIE_1_AUX_CLK_SRC					47
+#define GCC_PCIE_1_CFG_AHB_CLK					48
+#define GCC_PCIE_1_MSTR_AXI_CLK					49
+#define GCC_PCIE_1_PHY_RCHNG_CLK				50
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				51
+#define GCC_PCIE_1_PIPE_CLK					52
+#define GCC_PCIE_1_PIPE_CLK_SRC					53
+#define GCC_PCIE_1_PIPE_DIV2_CLK				54
+#define GCC_PCIE_1_PIPE_DIV2_CLK_SRC				55
+#define GCC_PCIE_1_SLV_AXI_CLK					56
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				57
+#define GCC_PCIE_RSCC_CFG_AHB_CLK				58
+#define GCC_PCIE_RSCC_XO_CLK					59
+#define GCC_PDM2_CLK						60
+#define GCC_PDM2_CLK_SRC					61
+#define GCC_PDM_AHB_CLK						62
+#define GCC_PDM_XO4_CLK						63
+#define GCC_QMIP_CAMERA_CMD_AHB_CLK				64
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				65
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				66
+#define GCC_QMIP_GPU_AHB_CLK					67
+#define GCC_QMIP_PCIE_AHB_CLK					68
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK				69
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				70
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				71
+#define GCC_QUPV3_WRAP1_CORE_CLK				72
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK				73
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK_SRC			74
+#define GCC_QUPV3_WRAP1_S0_CLK					75
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				76
+#define GCC_QUPV3_WRAP1_S1_CLK					77
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				78
+#define GCC_QUPV3_WRAP1_S2_CLK					79
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				80
+#define GCC_QUPV3_WRAP1_S3_CLK					81
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				82
+#define GCC_QUPV3_WRAP1_S4_CLK					83
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				84
+#define GCC_QUPV3_WRAP1_S5_CLK					85
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				86
+#define GCC_QUPV3_WRAP1_S6_CLK					87
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				88
+#define GCC_QUPV3_WRAP1_S7_CLK					89
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				90
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				91
+#define GCC_QUPV3_WRAP2_CORE_CLK				92
+#define GCC_QUPV3_WRAP2_S0_CLK					93
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				94
+#define GCC_QUPV3_WRAP2_S1_CLK					95
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				96
+#define GCC_QUPV3_WRAP2_S2_CLK					97
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				98
+#define GCC_QUPV3_WRAP2_S3_CLK					99
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				100
+#define GCC_QUPV3_WRAP2_S4_CLK					101
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				102
+#define GCC_QUPV3_WRAP2_S5_CLK					103
+#define GCC_QUPV3_WRAP2_S5_CLK_SRC				104
+#define GCC_QUPV3_WRAP2_S6_CLK					105
+#define GCC_QUPV3_WRAP2_S6_CLK_SRC				106
+#define GCC_QUPV3_WRAP2_S7_CLK					107
+#define GCC_QUPV3_WRAP2_S7_CLK_SRC				108
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				109
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				110
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				111
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				112
+#define GCC_SDCC1_AHB_CLK					113
+#define GCC_SDCC1_APPS_CLK					114
+#define GCC_SDCC1_APPS_CLK_SRC					115
+#define GCC_SDCC1_ICE_CORE_CLK					116
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				117
+#define GCC_SDCC2_AHB_CLK					118
+#define GCC_SDCC2_APPS_CLK					119
+#define GCC_SDCC2_APPS_CLK_SRC					120
+#define GCC_UFS_PHY_AHB_CLK					121
+#define GCC_UFS_PHY_AXI_CLK					122
+#define GCC_UFS_PHY_AXI_CLK_SRC					123
+#define GCC_UFS_PHY_ICE_CORE_CLK				124
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				125
+#define GCC_UFS_PHY_PHY_AUX_CLK					126
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				127
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				128
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				129
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				130
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				131
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				132
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				133
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				134
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				135
+#define GCC_USB30_PRIM_ATB_CLK					136
+#define GCC_USB30_PRIM_MASTER_CLK				137
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				138
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				139
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			140
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		141
+#define GCC_USB30_PRIM_SLEEP_CLK				142
+#define GCC_USB3_PRIM_PHY_AUX_CLK				143
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				144
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				145
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				146
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				147
+#define GCC_VIDEO_AHB_CLK					148
+#define GCC_VIDEO_AXI0_CLK					149
+#define GCC_VIDEO_AXI1_CLK					150
+#define GCC_VIDEO_XO_CLK					151
+
+/* GCC power domains */
+#define GCC_PCIE_0_GDSC						0
+#define GCC_PCIE_0_PHY_GDSC					1
+#define GCC_PCIE_1_GDSC						2
+#define GCC_PCIE_1_PHY_GDSC					3
+#define GCC_UFS_MEM_PHY_GDSC					4
+#define GCC_UFS_PHY_GDSC					5
+#define GCC_USB30_PRIM_GDSC					6
+#define GCC_USB3_PHY_GDSC					7
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_DISPLAY_BCR						1
+#define GCC_GPU_BCR						2
+#define GCC_PCIE_0_BCR						3
+#define GCC_PCIE_0_LINK_DOWN_BCR				4
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				5
+#define GCC_PCIE_0_PHY_BCR					6
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			7
+#define GCC_PCIE_1_BCR						8
+#define GCC_PCIE_1_LINK_DOWN_BCR				9
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				10
+#define GCC_PCIE_1_PHY_BCR					11
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			12
+#define GCC_PCIE_PHY_BCR					13
+#define GCC_PCIE_PHY_CFG_AHB_BCR				14
+#define GCC_PCIE_PHY_COM_BCR					15
+#define GCC_PCIE_RSCC_BCR					16
+#define GCC_PDM_BCR						17
+#define GCC_QUPV3_WRAPPER_1_BCR					18
+#define GCC_QUPV3_WRAPPER_2_BCR					19
+#define GCC_QUSB2PHY_PRIM_BCR					20
+#define GCC_QUSB2PHY_SEC_BCR					21
+#define GCC_SDCC1_BCR						22
+#define GCC_SDCC2_BCR						23
+#define GCC_UFS_PHY_BCR						24
+#define GCC_USB30_PRIM_BCR					25
+#define GCC_USB3_DP_PHY_PRIM_BCR				26
+#define GCC_USB3_DP_PHY_SEC_BCR					27
+#define GCC_USB3_PHY_PRIM_BCR					28
+#define GCC_USB3_PHY_SEC_BCR					29
+#define GCC_USB3PHY_PHY_PRIM_BCR				30
+#define GCC_USB3PHY_PHY_SEC_BCR					31
+#define GCC_VIDEO_AXI0_CLK_ARES					32
+#define GCC_VIDEO_AXI1_CLK_ARES					33
+#define GCC_VIDEO_BCR						34
+
+#endif

-- 
2.48.1


