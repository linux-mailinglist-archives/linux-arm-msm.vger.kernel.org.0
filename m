Return-Path: <linux-arm-msm+bounces-91873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMnpDH1ehGnS2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:10:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C277EF05C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3925A30EEEFD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE183A0B32;
	Thu,  5 Feb 2026 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzfg5Krc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+ip/ycP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495C83A0B2A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282000; cv=none; b=W6h0Fl8ONmJrZnBePB4hd48xWZ6wqSyB+law3D868s+gTfP35/HJUV6jYs/x38GopzG6PY7FLwYKacaaNZR4HYB/cPXceDCyXruPbeWex5gaBX4NUWfVShc0HYe4O8i+HnFOTtD0+uYDWc4I8Tt16xjDMwNnBRdJXQwoFEhryCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282000; c=relaxed/simple;
	bh=K0Hlqcw5A+rhK7FsHnFpQxsTfYnGl8EFiUTUzT8q9i8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g5mgwVe7CtG6l8qZhMYIbre8DnBCkXX4OL1pj7/waPyUwQ5pJzmeTBcsXQHqRje5/dJG1gHWCLBq4M7CX788XgCEKKb5uydBW3jkxkuX3F4/nWWXcwWxEL+e4HOD51xpI3Cm8hA2Nur9BfT2wxN+V7GJPMGeiF89ewTmeKfV64M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzfg5Krc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+ip/ycP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dkaq2639675
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bo5PaD6emk2
	G+lzZ0FcQCvn5ZwHhFnphczsPPSrccXw=; b=fzfg5KrcOKQHXJSATXzRdBnV/QO
	5UKWQ2abfwjHM+yldnBxCIIC3zXaCM2jaxf9PyaBZD1+ggC0LSzBQzmcWFIIqHU/
	XlncirABrLswlJnGaEcCHLg/vtW3yk+7t5OVd6j60s9F4Aq51atwAGj5qzB6BOzW
	5O8YzuQP+IOrPjR5jLwX3szWetOKa714Yq3iCDEkkk4PIvSrPIk2u0ddIZa0Azf+
	nJLhPERVyw1V2MNZEAlCpdT8a4PAau48s4Z9nYsx1UuScQkq7QF6R/4X7zDdIbFo
	DSYLDren3KYHv/bghUxr+DKlpheIXCIOplu7oH9oD2UzHbXda53HeN0uKwQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qvb3q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:59:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso1890977a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770281999; x=1770886799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bo5PaD6emk2G+lzZ0FcQCvn5ZwHhFnphczsPPSrccXw=;
        b=D+ip/ycPEQa7h38XBjJ/eqVImH2Hx7JS96z0hYmB/N0p85fpE3uDSavErIsK5Sebh8
         zwRaR5Sw42SCOLFEpiB6OOO4/QrTW+TPKIkOU003E+kVYT93/AtmJ+07axPMHt4S41HW
         r6QL0nnpUZVHXeQ/CtKZ+H6/lcuQRjg7nPMSG7xTVIfV9ZKlIK3/zHagO9g2PMLpt4z0
         MBih3eZ2erPca9KyZyCPd3vMU09ZuOWwsfOts6fc6czRmidTH2GAqvjXwxmyXAf2YC8N
         kbUYDp6xi2wUHtRTfLoDsROe81P9KAZr13bAM5bS37s04kgN7NyAtUnPqXgHLQEQXp+i
         TVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281999; x=1770886799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bo5PaD6emk2G+lzZ0FcQCvn5ZwHhFnphczsPPSrccXw=;
        b=eUuZaNP68KCbcE/4YN0k2PsvVXAxC8kV119sXCn+DW6lINm0+4rYgEn3d4pcyVhxnq
         bY5sKPLwXos+AfD7q6SesciAnaA/Acm6yZm7IR1lD0MZVN8MsMODNeif2arAl3e8g1JU
         OQknjTNpd+QTz8HX2OUr82m7stQljhz+K+e+O5vmADmyvpYoJT/Be/RkvnuWGZEtj51i
         NlxlmvVxa2r2zh7J3eJ3F1TaEQreaUzJ28KkHxhkiJrtIxfRd6jYz2hS9hfMYnRY6bj9
         eaWTDXYGnOhDbfNjg5VLDKJaT6J+p+5S1KNx1aSW4z0kKrAkz7w0cqKqHxRc6VkMOqKQ
         kBGg==
X-Forwarded-Encrypted: i=1; AJvYcCVEJm7qwZUrLL5Qi7nBPF1Yki/+sMZibRJEOhDgd+fYTowOjZrF8M5OUDPocKoDloYnDzRiDaiqCKEu8w/J@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4UUA3SnbPrpOrCbMSb73hBbNCLtyzn82WqPaWILriJyYVwBe0
	wJ8hDWhELfKnDgN1YR5MWv7oOjyEgc+WHRCQH/qswraeGrbxvyh3iSbqBNob/5/f5iefBPvdSS/
	5SlhVZsLNrK+KV8Euz2tdJA0euOp3bGF2UvSb+/8jOX+Gy0cK8xJBBwaS5FdGZ0wNwhm4
X-Gm-Gg: AZuq6aLD7oIeTK/ykZC/BOKf7m41cHGxK35IjR8qgQGsKRIg4RCNdxAGf87rLbD/JRp
	GjHUBd19+C+vW05fN9QTxFBdE0Rt0rBw4qwgE05Cnzzq80tdLvZWZrTlwNOfRa1os7M9ZAAlUA4
	zTVQn3+B13v9n4Qw8nJgzSZxxfXjQiqYE8cr4avrqtEpKpm5FMx97KnG0E31YWA/FV7f1gpy44J
	lTuob4ds35hdjWDnbC17T2cFu9M45eXiyyyuPFqLuK9cAlk0ifVwc86Iqu2LmVEZMpCKXDLTFAv
	ggtBSqOTryEdSSbA2QKKSXdc0rQqE4XDbi1o59zoK+MGIXe0uCrVnNQBs0mFQ4knjBa6jNIWVU1
	7FpWMS6F3VoQbBNHWV4f7FNfRxRBOyoHwVeqj9e72Hn9iZ+3EYPj6fK+4XkeyodasmAvDC2doyZ
	/w/vxwjd8cAH7hk5NF+evSM9xNUHVQg+9sGXjEpgI=
X-Received: by 2002:a05:6a21:4d92:b0:342:2a1b:86fa with SMTP id adf61e73a8af0-393724056ffmr5834610637.45.1770281999099;
        Thu, 05 Feb 2026 00:59:59 -0800 (PST)
X-Received: by 2002:a05:6a21:4d92:b0:342:2a1b:86fa with SMTP id adf61e73a8af0-393724056ffmr5834584637.45.1770281998672;
        Thu, 05 Feb 2026 00:59:58 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8572b4e7sm4361984a12.33.2026.02.05.00.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 00:59:58 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v5 3/4] dt-bindings: arm: qcom: Add IPQ9574 AL02-c2 and AL02-c7 eMMC variant
Date: Thu,  5 Feb 2026 14:29:35 +0530
Message-Id: <20260205085936.3220108-4-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205085936.3220108-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260205085936.3220108-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=69845c0f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=M49wrMBf3ZJQRj5u-tcA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: T99_JGaHap6Qeo-kd_EDLmCp-fce3uXX
X-Proofpoint-ORIG-GUID: T99_JGaHap6Qeo-kd_EDLmCp-fce3uXX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NCBTYWx0ZWRfX67539tv+KR5O
 qKK3qFogsT6dhUyEFyM+VhK9c5STzA0ZOvwSLt1zVLi/cDUNymlCZKmx5v94j9+FaVcnecg+l2L
 trxDBI6choMAnurA1AG5pIFqlfFuZhqgJaG4hntqtQdmEHOaRV6eCX9B+KqNqAIASA6AC07BOMv
 +WwBxbz5FdpE5ZR0N/zm1otIGoqa3gcfiZBbuvr+l8APhkNs7Va3zz8axHWJHKiCn7Zkwh0D5ZE
 1FZZyGlQokPhMqaIbYppqeLM2+Otxygbi7N4bVgMlk8LGDGxmaLOzg2zBHpqBC70a6hKaZogl8r
 kBXobi8hS2RJi2tO6KzloAYzWzHR3qcKQlJqY9V7ZNPvUJzAbEUCsaSi/31HAADigxUeB2ODmDI
 gEnDjFCzU9zVSaeeV+2svffv1WzpDfaCATdtCGi+xPWuDLZTgG0zj6tzgyNNUZfjJDMeAmzWNP9
 GY/CLpgRXaQNsjcz7jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91873-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C277EF05C3
X-Rspamd-Action: no action

Document the IPQ9574 AL02-c2 and AL02-c7 eMMC variant.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v5: Add AL02-c2 eMMC variant also

v4: No changes

v3: No changes

v2: Update dt-bindings to include the new variant
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..1b1634b28bd5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -321,8 +321,10 @@ properties:
       - items:
           - enum:
               - qcom,ipq9574-ap-al02-c2
+              - qcom,ipq9574-ap-al02-c2-emmc
               - qcom,ipq9574-ap-al02-c6
               - qcom,ipq9574-ap-al02-c7
+              - qcom,ipq9574-ap-al02-c7-emmc
               - qcom,ipq9574-ap-al02-c8
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
-- 
2.34.1


