Return-Path: <linux-arm-msm+bounces-92307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOfdNEbliWnpDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:46:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6B410FDD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01B5B3004D95
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B052B378D91;
	Mon,  9 Feb 2026 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSA90deV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iB4fvRAE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696823093CF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770644802; cv=none; b=krI0K6jR8gpkI9Y3nfK33yNKZNUP3VSjmu093/Z5LeGSgJWS2/GnspUOLWsj8PnrAShPsog2G0YJE9aTpktZ8l+NrJi7fLRiZvsM/Kmhop9qp/q5Q9jArbLImQ2DXZTIfPwtmXzsNHbJqwySPckP0jALYB9jZBhKNba3uLdF2BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770644802; c=relaxed/simple;
	bh=fnOQnLODNQIhr6CssUQwPBrgabH81UaqvBrFTwQDb/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YNg8l/2aq5mtHQuCsd7VYyuxOxCrWuH2Dcsh4THfJYtFYDmltjFijGR7qcGouUTEeiXkN7/4qcjJv/OmMdBPKgf4TsQ0Ix+uhjLac0qlPSDVYZBs+DAletnNSYLfQtX4DbyuCgjylvtvCAiCThcst4AwLQ3Y1ilrl3nHka9WZIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSA90deV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iB4fvRAE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ApFST2586852
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 13:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bOk6xSYzwz58WXyx+KwiUtL/RsTQgy5B2cl
	OaWbtEU4=; b=KSA90deVh4vEJV+NKnwqlXPGLFidRB91KI0OhFDwpKdOQ8tICOc
	5fo+vOIpLr3ouf7FH2tx97UeL5J7eUlx1K/poinN0otIsk1Tax4GPz24ZCDkDaN4
	3QnEvUIYSYQorpvlI/bkkSqL9j6a5+fYyrlEqENDUQTD/04nrsbxIT9LHmveBh4F
	jawfI0Vqk/Veu+8g/0Fx+TN/cnJLjKzf6zuhXLfMELbRnfWrIiiOoPK4WV2MpGex
	wWbwxIQcIxvcb9fggNjO4ODcwA1QVa2x3UGeFhwZdHEg49VBgbS35maM3bfXUw5/
	KOYYJ2ZbY4aYq73Tj/eydaYtr3xreGukf8g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c793bhnry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 13:46:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35641c14663so1176108a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770644800; x=1771249600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bOk6xSYzwz58WXyx+KwiUtL/RsTQgy5B2clOaWbtEU4=;
        b=iB4fvRAEcv/2qZI6QGrEqlLo+kYL6KqE0FzpUpc8YyT15V4c6ZZzjCM/Yn27vbA4zX
         jRYUpqtA4w9TbvCC+kcYvjA14PgdzuHeGlPXEnmgphzYnDSU4FzxSzW5Q+fEZtAfmhIK
         0bGk2TNR+JwjtUiPJiSfYdGWV9VkQ5MFq726YOwLLYmbxlW4YfwlTW0or5iGcbP+DT5D
         gvM3AmAu97WHx5krsyw9uwgReuxhshg+6K4/rq18s7V32iNgl+vkovUJIhx001sSpWqr
         6YtjtHQUedTjtYz4AuVHOBY8q1YgK1F1G3fJs2/zqYkGtj9EkoYzIONLj2TtguLt1VXg
         z2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770644800; x=1771249600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOk6xSYzwz58WXyx+KwiUtL/RsTQgy5B2clOaWbtEU4=;
        b=MqwfaT1SDwKK5vgWbzAbmB3XYcRu3iWU0AMkRQCM4csn44xSBnn0V7ViMAeFXGhNra
         bAsI8HPYcaOZlmg8xClfG3cS9rqWl97Vwn/5sHvfOY4padcKxRwImQvv/XPQJYobBMqO
         QyHZxtkGY78JFNQnkm7rnUAygpYCsgMgrrqEGjEVp3WGCFh0ljRSLqckmJIvzOTZmNMj
         FvJhU5ap2djxzsXvOvBIkHbmohQ83foFmY/1j0dl4MIZSQh7MWOCk2fh0Cemw8ov8TJC
         VLTaifDPWKDePSfLO2bNfME23Ph+JwOlq6f07xoVt971buRn8z7h021Shjg3FsD+qXu2
         OtOg==
X-Gm-Message-State: AOJu0YxOga6S+wrcBuKPuGiHDKvhSiOW/k3ZMATVzkWWYE1qqc3s253D
	vLYWYqCIolafuwt/yvpnj1VA+tLcWX/lT27Nluxv2f1Lqa4HrsXCc4BP/SI5IiuDrjFUIwtGF/B
	NyD9VisFWbEDMYdbjZ3zZIJfZq7wlCNj9nVk/2PHU/1wQIQxLyjWzFBLOAi4RRk3u9qWk
X-Gm-Gg: AZuq6aJcV/d4Y2j+dVaDDcd5HlH5qzQuiRKlH8sTYYoki1U+AuNJpnSDWYVy5Byj2gp
	EuED92MStio8wzp1/2L/C/q2IiQJBA1m30ASTT7GQvdmglYDbBjM3to2NdxOzYhTlmO3oRtLIBD
	o6BRfSzucOREhFQ6MaMQHZFHrn6czRhbTZSoFg9yxuGvtEdiH3IbnfKleH52UAGA34FrY9ZQZ0K
	Zg9lzCx8qo8DtR0lC58BY9rJmCtXTtubowQLrPDTqV5EIiPdQR4ZZq1J/pkXBgqQBagd7+Vj2lG
	i+DyjzbGhwTbxPZb17i4X0LWYtIjX6RbA/oRX1i3KO6KoRktGDBTMb3tv3g5JF+HZBaUOYae6GV
	XXM8FyDvv1d7A+ihZgqK5wyleSG8tcD9g4J5psbmCNG4RrA==
X-Received: by 2002:a17:90b:5748:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-354b3bd326dmr11289316a91.12.1770644800263;
        Mon, 09 Feb 2026 05:46:40 -0800 (PST)
X-Received: by 2002:a17:90b:5748:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-354b3bd326dmr11289289a91.12.1770644799772;
        Mon, 09 Feb 2026 05:46:39 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3561f4e0dffsm8238024a91.11.2026.02.09.05.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:46:39 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl: Add SA8775P and QCS8300 pinctrl
Date: Mon,  9 Feb 2026 19:15:29 +0530
Message-Id: <20260209134529.725573-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ctOWUl4i c=1 sm=1 tr=0 ts=6989e541 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=a0HnErEHd3o58QWwnPEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: --eO9VgQbphprm-5FJNHPeMWBOC-gvEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExNiBTYWx0ZWRfX8k7BTV/p9X5j
 lstszP3pMoyIxAukXdCZ1qVzgF7QrOYMtrIpVAiBkhCl5SqAZ55SzGyJVeSFbmiX/eZJYgK5xy3
 XEiImC7kycpTBulDV294HkbXv+W8IUBm1nUUb9QTlpCiXzuzQonr5GqqkuhokKq+9vLNNdT0/zl
 6aKyQQaxSKDxgPEhtbMHc9GJOZlIutMLR2JSg0XL9LgrxL3KS5JQQcA5uoX92jKLkFbE3OZC9p5
 XglWUYzSjN3BK+ycKJmRjO1b+FM2MjYwisI5fKBf7PP2Dqyzp371XFfPRd9ulcv3g4+1ZfuWeqF
 tol/04uZKuOL4vog8X7H5tEIXFulA2R81MizdiZnr50QhWTvvkogf1Nj5QZdo0cu0fnYJ7DJK2Y
 WfkDaS+oczhqezn82zqmyFbDYLJIgVVmbHFDb/+WRBASVzyy3wBs2uojzIXqhq/e7miJ/Ww4Yrq
 A6Avd4N58GYZ9PFMxlw==
X-Proofpoint-GUID: --eO9VgQbphprm-5FJNHPeMWBOC-gvEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92307-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E6B410FDD3
X-Rspamd-Action: no action

Document compatible for Qualcomm SA8775P and QCS8300 SoC LPASS TLMM
pin controller, fully compatible with previous SM8450 generation
(same amount of pins and functions).

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
changes in [v4]:
 - Fixed dt-binding errors reported by Rob.
 - Link to V3: https://lore.kernel.org/all/176951636220.1230755.4335541729269457450.robh@kernel.org/

changes in [v3]:
 - Removed the duplicate driver code patch as suggested by Krzysztof.
 - Reused the existing SM8490 pinctrl, which is fully compatible with SA8775P and QCS8300.
 - Link to V2: https://lore.kernel.org/all/20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
 - Fixed dt-binding errors reported by Krzysztof and Rob.
 - Added proper slew rate value for wsa2_swr_data GPIO, as suggested by Konrad.
 - Documented Monaco compatible as suggested by Konrad.
 - Link to V1: https://lore.kernel.org/all/20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
 .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml   | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index e7565592d..541c1c54d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -15,7 +15,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,sm8450-lpass-lpi-pinctrl
+    oneOf:
+      - const: qcom,sm8450-lpass-lpi-pinctrl
+      - items:
+          - enum:
+              - qcom,qcs8300-lpass-lpi-pinctrl
+              - qcom,sa8775p-lpass-lpi-pinctrl
+          - const: qcom,sm8450-lpass-lpi-pinctrl
 
   reg:
     items:
-- 
2.34.1


