Return-Path: <linux-arm-msm+bounces-96471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHogDEuSr2kragIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:38:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D1244E69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 312383164AAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099853B961B;
	Tue, 10 Mar 2026 03:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qzl6hekO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAwLZwIU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA32A3B961F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113807; cv=none; b=F2WVYxCWt4FgczKDu2/jjALQDgbFEuGbLWeEuVvL/alZZ17hKKmT5nBUDB0/m8/MldlGHDVKg4XLd88nyXDsc5M0TgA3JIHFBGXHEI6Zt8AORM2zhqrFnzgs6hxgaXudCtvkVIWejn7rVqfE/LONaX5NCBZUSwDfYWNmMhrKbB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113807; c=relaxed/simple;
	bh=McOFs17KMBE80Kx1yQ7dtWDsgmcWE2xvIe4QDqWpGkk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rKQbnQRmApgpKNsSUpIAN6M/wR+qqc0rqIUp91wieD4YacvCAPck0wpXr30sEh/7LbyqGH3CDZtPLwpnCqdbcQRJk6n5L+yqlarffPZtz+pltr9VjgMgNpfSoV6v0vmMEND19G9EkllnRLcWn8ZwuX59phs1clofV6dzlhGQ8vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qzl6hekO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAwLZwIU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2F53I3088460
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bjsGqclSC5A
	+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=; b=Qzl6hekObTVFaa3UXQUNoGPG7ZP
	/70nrB5uKeuszfajsc5RCxOjC3aNV2zPoYUkFzEbdOirelOfptjT5tHbKmtegA3V
	oD+JT95OKS54ukZMyH9/72U4WTmt0QAz6nFcTsFgOUZ8HUmvQmDbrBrlbmXZuOrw
	ZiRYHvpMZDLlqE95W+OhASdul+KQLzpcrbKmWo5wo1bW8QBX2UL8k+SS2YoeDNa7
	C+WiJWD/f+tK8NuOLyyINpHtt1PD8CCL2Kt7Zwitnx+Ub37MSB3nJMtZqIfDtttt
	oUV3146V/SGy1/gFN/GYEVHc1I7CI7tGmKQd5bynU7Dtqjd7++OtefpdYMQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy82kdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c737ced4036so3395896a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773113805; x=1773718605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjsGqclSC5A+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=;
        b=SAwLZwIUR9fNq8aUfksyOOreKYSnA8bt0HZTZagA/tiTv2woJ4pVTH0VQwcHD3NS+H
         yw5uJUo+x/zZshYhmYQFIfFR2KfvqoEvEcVPQ3XobPGOYRcjlWCcATYMoDhVVAOqi7em
         kdP+2DNrHbKw8zNBTkJ/LzBz5stag0+SZO33KhP5lS9XpCvVp9E9inkrwcoZHBLGXS0J
         4bvgASh2nqjyizPj260V4x/o/NLTNwNPBnW2/5RuS9NkYCLhZmZkklqVNJ7uESmTqCqI
         0O366SPJnSuAV8S6v0D7tILjAU6O1IZ2N+6uxMNtlveiRfNaumLMi7jNthRcxTq9RAoc
         L2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113805; x=1773718605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bjsGqclSC5A+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=;
        b=EmqZqzonFVlCmF1jDhJKF3xzKf550wERgrfy6kvVGGp89vJMXve3UI42o0SxnpEaDZ
         Wn2FSt/+ljP9CiOWfrEKe5gkX/qEZuKnv4OSThSvUbMCbsYc5B31a28SGbBT90m6I2SS
         KVUjO1InNn5DAYYDIkXcW2OoDELaHChXdCnukd2p95t11TVU1YtuzEehEQSlBlKV85TL
         qYEYJwbDDJRVzaeqzcbq50OyQFRqlTrAQ/Of4L7w+cNMuvI6sgCCnOA2Rm9hyhp2WOM4
         a6aVXJqzEztgsYwmXkVOtZsdxq8YrAaxeaLsfgmK39PWiukJws2ojWvSHjrjLKdvGeTp
         +ABw==
X-Forwarded-Encrypted: i=1; AJvYcCVUNlZuCMp0ZVDJ1vUiE7YcJy2TX1oDTRNMhqklOil+vrP19GvyuX/eU8+qywZorOHlReweMwov09M/2L+m@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy/Osps3NJ6zsx1j7/NgmTOYmLxufJGtva5jp54YKM9INV6fFt
	xTwLQq5Xo9CfYVGgOyte+K0Khdp/2pZHn1H53atfxOM4+g76eRd8EnmaiYw2A/6U7kLhzGOkBVM
	zU2WYN2ojJMkhL46J5+GBdHJO/vdwOK+EMcK6wuMkN13xxsqG3IXhawisYo+0MuRwK0ks
X-Gm-Gg: ATEYQzx7gsedKpPhvECHKMuM3nWyw9rMqWez21bK6CbB8En1fCflVCEhs7F9ziOUC2+
	7LzfYuJUhcY/4379ruwG4j63Y114GVW67aMnRXg8ivjGljCuQPWPT293vDrlQ9fGMv4eabon4GD
	EXmC/i6Y6Z+6kwSpWi/0n5iRdG32SdN9olAk3ZV2qxkkn+y2zdgJ/+/5CNesN0RQhint8XROvx+
	NSu8RUYVgizuDMYXKXvKVRDci9FSopybmvej0WMi8WpclqbSKUnRg2EJ6M1+cqZ44xGHydihnNi
	gck+BVT49MEz4GespT+QEzDvLUqzkEZ7ImiQEMqA9TRpzwaL+t6HK5Xnv536T4Gn/jw8VtgxuhJ
	VU7y29OB3GjiEOM94y6DmO0+r5x0kUxkrrkNX0OHT7aHOOxce0W5kHOMFjPLYFF0sJfWxHRPp1o
	70vXb0BPp5+rfCpU/Kz8pwp6MnsuyqQHJkWk5n
X-Received: by 2002:a05:6a21:112:b0:398:a6ae:9882 with SMTP id adf61e73a8af0-398a6aea519mr2681089637.50.1773113805289;
        Mon, 09 Mar 2026 20:36:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:112:b0:398:a6ae:9882 with SMTP id adf61e73a8af0-398a6aea519mr2681064637.50.1773113804848;
        Mon, 09 Mar 2026 20:36:44 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm10272923a12.25.2026.03.09.20.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:36:44 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V4 3/5] dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
Date: Tue, 10 Mar 2026 09:06:15 +0530
Message-Id: <20260310033617.3108675-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af91cd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Eu9c2-cO-uz-pbzhnSkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: m0WfVbXER4hXILgKKcQYhvaax4G53GZ7
X-Proofpoint-ORIG-GUID: m0WfVbXER4hXILgKKcQYhvaax4G53GZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNSBTYWx0ZWRfX6phAi9O+aG0w
 BcDMepPS9G7ZFuMK4FCkI20UiA6G0U0GQKZLfoScHMgXftETucf8+juDmZJb74uYVhXP3bZfYGd
 r5ZhPs64gXGsg8apWmo9XLLGmbtS9kElf2m46moDCf2zFjN7q2ISqRWQ+OZ+7G4clbgUSoI6QiX
 bZD3r+RAbYTa72rV0vDf3r/OMpdWOURNiiRcTDG6V6ER38+B4zrm68+xW1MNDyhn7rYdv8WZY4W
 DbwZrJbx0PbpzlkXYz1TFvzypciPioNzL7mQow8t/DIDHTg4GF7+NxmnuUeV1UpPZHlNC9VN0E+
 lhAud1371Ypk06EeG6DpjEPoM6BH9q7BKu9I/UlllTj6QFgQ0DVp2KSSJmUu2pY5UFhp4CMZLCL
 RxZmfBt4J10AQCYt/u19DAhT8e49cm+l/+m4FUaHrHCsfFd/CD30cKIe+v2A3PKPbKyyjKIG28T
 KckfFisHWp6vTG2BBww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100025
X-Rspamd-Queue-Id: CC0D1244E69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96471-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document compatible for Qualcomm Glymur fastrpc which is fully compatible
with Qualcomm Kaanapali fastrpc.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index d8e47db677cc..ca830dd06de2 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-fastrpc
-      - qcom,fastrpc
+    oneOf:
+      - enum:
+          - qcom,kaanapali-fastrpc
+          - qcom,fastrpc
+      - items:
+          - enum:
+              - qcom,glymur-fastrpc
+          - const: qcom,kaanapali-fastrpc
 
   label:
     enum:
-- 
2.34.1


