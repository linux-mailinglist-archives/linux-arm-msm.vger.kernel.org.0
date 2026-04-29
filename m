Return-Path: <linux-arm-msm+bounces-105141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMo7Hre98WkbkQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:13:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3AD4910E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B45E630A71DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630813A8730;
	Wed, 29 Apr 2026 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXSm9CXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiABHpI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CDC32D0FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450234; cv=none; b=C2YNjtPkHkCJovxMwYn781Y9WZrgUo72A5Rddpt+H2QNDtRpAswqasFQj2YS3o8JYp75VnYjZdr/DxP34nEjEupqucoPwFq7J2B0un9Gp2IRmnE/odmzqwQ+ikL4p0suv1kCPCWggZ1rp6Qis1fMwWAEU0qJGKgrHo7I0BBdR0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450234; c=relaxed/simple;
	bh=ONwliSsILV/OrmkQojPFG5YHrHzHjk3tsmEhrJD5QGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhzQtdyNlnwCQz/seqXwc5H0lEPVLo0FJeyZ8RuM0Qh2sVGee58I6pYY8cnR5HiGj4xxUdUYJnL/Jhxj6lfRVmmUR5HNhb+ZUSYpsjV1L4H8t40QZ8JSadIYOK4gl7M7A9yJCQYSkKv7xlxk6a9xPhQF7E580IB0b6fr2QxElIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXSm9CXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiABHpI4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5HSnh418768
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zNEtTRHhsLDEYA5rua7jC9rsbB43fhK56EO
	ZzSeN9mw=; b=kXSm9CXuhgPwtjORcz1uNgQJhQWMsBpmNKaO6szQUWUIHtG+ydn
	srtB+NQELFSYLbF6/YYuVfmId9mo4JvxeCt6PiZNLFd/tmChG7d0Hniq4LfhE6D1
	j3QYWHOvSiD6wzjWCAd8eZofpoU+5RfJ9jn3kJe/SNMX4Na79TilCLkWDr3Qwl7Z
	wni1zOB3tFqliEzUtnu7+Fb2uDxJqVi6FxrSijb8vQic/F3Yex6TqQk8FdqdIV7e
	F1mSUUEhCDIHz7jzzEjKEbGA+azoMJnyjlJKvtki1m+C0AQbOP9wabyJIX9vs7FN
	hKvHgN1lC2RvcIaqUrtRKJj27DQjSLjKkPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9gpa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:10:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fcdd579e1so119096011cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777450231; x=1778055031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNEtTRHhsLDEYA5rua7jC9rsbB43fhK56EOZzSeN9mw=;
        b=EiABHpI4h96Q4WB8jz7N0Mg7ow7ebd1z5E0795/8Ki7cs9by0ZbvJw5jJfnW6uP35t
         OAJMf8k1dQpLIb9i6x3EEp8s57JDwHmP00NWpBqtPVMgegXp3IeBbTqzTMgvNWABj085
         Kvh+xRBjCFrCPPbOb4CXv0502/gjF35mpHWvVKwUaOsymuQ3cHw9ptuWGKwHbMn+nS1T
         KWfHnJFyHv0Jjer/ev74nu66//uRzVDIhMk9sRwthr8/j/DTgWoN6oD850UaVFoixybR
         l8hWiTHqUuG1XBx+sAYCJpeK00ptiIPuq99W2EOcQWIUlNcse65m2mnp1J6HpsJ6R5Rk
         bOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450231; x=1778055031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNEtTRHhsLDEYA5rua7jC9rsbB43fhK56EOZzSeN9mw=;
        b=oGExxqFv0QeEXJ/bg9by9b7v/EB6a+nIDKiFUlJbp9qHKFan8iWOcbKlWs6+NGUwYj
         Xl2xGK9qXDdUKxrMkGpkj2Q0Ir8pzD5FGb+0uuMf8UKSMM2kuRmHkjNCeeaotmuxJoHu
         6k4J3ou0SQrOcJ2kvbevVDxgp3l4Rt+iAkine3q1NgPJBJECy87NYBklofpoFQi7cbp7
         dmmrlYlOg1hJcA+k2Ll/+QwtVOqQY+lrnHTRLmbfebNSh2gCtF0tnTstHUCZMrGKW4CU
         l5IenwqtJw2wv5WgYl5jt7XPKAUSqFX4MaWXbeLemLjvlz7rdlNLQZgGGOH9u4Bd4IK7
         Zihw==
X-Forwarded-Encrypted: i=1; AFNElJ/vnsKZ4/gb5eawiOEyLyCRMOke35p4+V9uo+3l5uEOQ2rlR/sY2WHbsg4PIJk03pIPS57PSsEvzXUnofEu@vger.kernel.org
X-Gm-Message-State: AOJu0YyWyvT/uFUgVpgA7CIK0g3evC5JAphGoJIvi+FCkR0dBUx/L0Mt
	xygq/5YUCpZCKKyC1ESSkeDwj0e9TOrH4hvZrqa9ZfhvFhEpt3S6fTqvsH31IDmq+UT1cCaYY7s
	1WwejcjXG1TvuPaZcK47qhKZ/XXYs+pTOvYukF+micBoW8KMt5ESsZ6G6YMqxe9hOi4Qh
X-Gm-Gg: AeBDieskQISx47ESaT8IJqsy3ERVtW5mcFrFIC1f9S6m2IN09sSOU89qleAlbIKT8Tu
	AxSxXvPew9IJC0u+hrJXwhtxZVHuAk3pdly++HkvDWhjpE10ZGP6ZaceltHeX+qpZbuuHqtCTRP
	Z2bzByXVNpi2H9oSxAlyiNrEMyTsOepzhvnomvd6+GfIHMlQAEV4zYiDI0Tj5P5Ui7mj9ftEJvr
	e9La+d7v2oTS6DHym6rGjkpZ+uJs/NNqZ3IqL2gCSgpSgQkHt6AdFwEQ2GpzshXH/AHbysy5tBf
	NFNub/MhqyPfnQ2II+6fqdqNgOqZh1QLcfENyo4oJt+niw+TPHAYMcXa3Lg+ReEzhHhYxy2cGyn
	6FOhSTuAf6Ufj3vtZVsXJ1QmFJy+H13p/aXKCe9AeF3Qu7phayDK5Pj8e8Prc
X-Received: by 2002:a05:622a:1792:b0:50d:7f66:dca with SMTP id d75a77b69052e-5100e1ab2d1mr93763241cf.33.1777450230889;
        Wed, 29 Apr 2026 01:10:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1792:b0:50d:7f66:dca with SMTP id d75a77b69052e-5100e1ab2d1mr93763061cf.33.1777450230479;
        Wed, 29 Apr 2026 01:10:30 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:668a:d11c:cbb3:a94f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c310048sm12779205e9.22.2026.04.29.01.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:10:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: crypto: qcom-qce: document the Nord crypto engine
Date: Wed, 29 Apr 2026 10:10:20 +0200
Message-ID: <20260429081021.16380-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r8X3TZNfkWF0xWyKV3aDnZAO9268b2oY
X-Proofpoint-ORIG-GUID: r8X3TZNfkWF0xWyKV3aDnZAO9268b2oY
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f1bcf7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=4UlrLoyY81mkaXUxjREA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4MCBTYWx0ZWRfX6rDFNIALlGUF
 S8iK2G3jyqAbWCmSzAUF6zskt7xwq9QoWBN5cc88TVjtAVCv2u5AZIDBaMjVeAtvnfM9BLQqZ4j
 24GPIJCQROUZYdzM6BT4k7swF2KbJ4hFSWfDUj0ARo9zsHTpE23z1QUJAtZvwXdHEYuugYioe/c
 lZWwJecaS/RucwfQhDpdWt/fDBQ6I2zKu79DNyPwpZ5swjNktI6XiqCA9ZXiRqj8ncIT8caVDZ+
 vppsL4ujvb94WY9ucQrrsvL4wzhOoYtuqwFExqE5cuil5vzJE3BimmrxTlNRL+xDJf3XsapFtnT
 1kWn+zaCsduMmBJTSwG1cr6EtcB7rIOS8+oW98jYgsqWGyjjlUgKtp6IIF7u/zsBhF9sDVCRI2L
 aP9fOLJVcYou1Z8LHJTkDuIpGdeG0Od4lWgVi2MUg44E7EsawSF/fDAcgzhZfzE0bRjqfp3Ndi6
 PvtMh+XduwChSNeioPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290080
X-Rspamd-Queue-Id: CA3AD4910E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105141-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the crypto engine on the Qualcomm Nord Platform.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 79d5be2548bc5..d3af7706376fa 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -46,6 +46,7 @@ properties:
       - items:
           - enum:
               - qcom,kaanapali-qce
+              - qcom,nord-qce
               - qcom,qcs615-qce
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
-- 
2.47.3


