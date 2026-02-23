Return-Path: <linux-arm-msm+bounces-93719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOECD7R0nGlrHwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:39:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB352178DAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF7D8306B2CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FC72F532F;
	Mon, 23 Feb 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtgeyQ8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IvjLZsOk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CCB2EC09B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861079; cv=none; b=L4HX6QskF0dLBuucFdj+G0ykd9vxuZBXeOY1xJ2T03b7xtpm9pzLBXgxHcW+SYFVKo0rch2rHFfZzo/0sg3do+XGx+ZX2mkzlmzbwgdnYOAe9WgpaJ7WEa0lcbknrYkKGzuVKbz9S8qvNCXLlT9l5CZXNOjZxsW2hLBlMtijUnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861079; c=relaxed/simple;
	bh=EoCXFpUebrCB3eLLljmtB175b7eB89tb2C5XolScFBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/ccX5oaPdDfNgzJdv3FDCPab5abNJaJtKaJlgjNKQAbaPoEdcehxn7zK2lHuVbYCnsiLx2WyL40Mrg/tA1JN5tlVSg9uFelPWo/hkCplL7DJYbUjoOCrAl3boEq4J8cseU+f13zqxZ9k8/lQIFCGH/4nKWPbvEQxuviZ/GibJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtgeyQ8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IvjLZsOk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYhFo322296
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=; b=WtgeyQ8CH4h/8SLK
	8FxD/Ygsel5q/trsE/FU1hxe5ez2PuqdZj7IgN7EpshLWYejux8TP+tSVZ8/c6dN
	kuwPuVFXbqgI+LkcgqEbHWh3TiBDTTyJBbTgNRfCal6Tg7opiPG/2aW+JvDlgv+C
	fOW9ycqpN4QFkqpqtYz54JfNXLAeCKsNj35gK/uG7OJ11qw1XzyaVXgA0sq/rfnP
	pKqlwABgRiLcYCOmKq5/SP6nBxhQzPRC9Zx1zH6uAfQQnnn4fxP1JLQi7ZbNMp/H
	EcUiLA8ky+ZGRIIfzVt9evYJjoWuUk86pU5UV6FK21PYKenehMedHDWjiH0MwFCD
	/sH62Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0wk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:37:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a129cd2so5762426585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 07:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771861077; x=1772465877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=;
        b=IvjLZsOkF298/AW5ks1EsFHkX4imXktLevc2brw2aOM326MPOgswgDxGPbtqBB0cmD
         LUcfIU1z+6kK8VNUmdVkLT7Wrrbv5aKJ82/cd0fRtn6ASw3Yp8Wv00NyXWRy2NxXAsQT
         EXbdDZUisUBLpL050sNdAcf5dWG0BBAy9eljbVMDJVe6aQh69AwMcaZhyX7MyThPoPQA
         JugVpSMRCQuim6ybKViN1EO/J8pcYvR0pnsb4QLevMfWRK0mSK6kc5F/e+mRuK8cHL9H
         /xIvOW4qkw+oJmxRQirR5fbJ8iT5PyU+5KYxjLC6gqiroI5NpMiIUXDcLRZN9SkTGKa/
         QtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861077; x=1772465877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=;
        b=qlHesZtTcjAIgG9d7Uwe+UGcSK9Ao89oeIfhx0uxnshOfJ70zrKTHOkr7LzD/jKIPi
         4ntcIlzw9GIn2Gc3zJGHR/G8BxlJ/0l4TXv+kip8k4nGZrXADuAM4K22mCozolwGiKKH
         1YDKYBKCOwle9G/HcsYBFL+ouRVa3+IlUBRcYqlGI076fZfcu9jJYSfmmR1Il9gpJ8ix
         eurUbAxtk/9TSCyrZYa1JD+KSmNfZDtfPTDNYqDYsbyToZYFuHkmwwd5A4scyjru4aK2
         zjEmLYXtHNHFxdrJFlAxSwXDXulGZySTVWLWLhYR+HHxw+AlHeTK1Mx89BKKLV4fZu4o
         nHSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3D9mCjoUy4uPTxS45TwSQMtvpzAISTxhkAiBgBPL5upgO8K9A7KuLMq0WHDHc68ICC27NgDU6AzwhMZti@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1IUIKn60O8wOoocfkWBQcq7UvpjvGoDqSx7LpKgb5e/6/h2ZE
	GAbelvBSP1q+4wqfAzKp+Q1/Y1t5GBzUvKf8B/1qD/uLFG6WE55o0/13odCGLf1eplSTXzxyXGV
	AwLwut8+SQl2yVEOAwSFHtGxiMuUwl8BpzalKCA2tVM/ZeDzr5oqpFiCbXP+Vnq2KV5wk
X-Gm-Gg: AZuq6aLc1o1jmRmZ9/OVyGyRLmdlCA5HyOb3xTwo0MTPsjXqK9YVR8cX/oUP1raug/O
	wk7hPiQKUpNXVjDjhxq7JvUUJocnUDqWIfHgPPpRHhxLNe9g/Kdw4fEbryVoaLe9ZZ7L5y7szM1
	f7m2brvft89SmZ9tnZ5uYzF4NJEEmoZ5v6fI/9XvG9PSXXQn2/s/bUyzDSeUskB7uiThQ2qkXbX
	SRnsKz8FH2w34pNrWIZOXj6Fl3UbCJVr7qYkJ0HgKbIbshiuSpVJhgzOQ+qElbvHnYdNd3yiS7M
	eojAkhJ3er6U2ZC6IkvoSRGtYibiP2d7WpWcaV9kPd7ZQZN+5YvJwgUbyHUTHO+ZlGAxyn7grP/
	LM0uMIze/FjaiMqL5AX1wN64ko1xT1A==
X-Received: by 2002:a05:620a:7084:b0:8cb:5c90:dd6f with SMTP id af79cd13be357-8cb7bfe78d2mr1824774585a.32.1771861076953;
        Mon, 23 Feb 2026 07:37:56 -0800 (PST)
X-Received: by 2002:a05:620a:7084:b0:8cb:5c90:dd6f with SMTP id af79cd13be357-8cb7bfe78d2mr1824768585a.32.1771861076381;
        Mon, 23 Feb 2026 07:37:56 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c96csm21880679f8f.30.2026.02.23.07.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:37:55 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 17:37:43 +0200
Subject: [PATCH RFT v2 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-dts-qcom-glymur-add-usb-support-v2-1-f4e0f38db21d@oss.qualcomm.com>
References: <20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com>
In-Reply-To: <20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EoCXFpUebrCB3eLLljmtB175b7eB89tb2C5XolScFBU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnHRNvDJNuSOOU8Moknm8nCyh463f6N4qISFfm
 l1Ni1fNSm+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZx0TQAKCRAbX0TJAJUV
 Vh2cEACSzKJZfc2msIEgk0z9fRaAfjmLOPKd2Hglx4+YIOL1fM5X1titesdT3hGKrX2MC8CH9Q4
 Xka0RPlQ7wqTkyIppmQSPDbNwr6GL0JRoaaAIWSiQg4zXyfAo/LW7XAex716XC+I5eszAKJWSHN
 uBK1Sp+GTQYFZpoSpgH/O3nUnbt3lmVum44d458lCUs42eNL9wCmzAQNswW84GCf5lE5sXIlPcw
 BYKDkJuQlTLvJD2PqN2zpZcFFmBc4+Rc5cQMnWRQBWRbctRC6OqHf/4Xd2dPwiOru77uEwm58kd
 K9F+8LAsTNWZvmroTiXXadNBYZM0pDJNmYqpb4HpO35o+NYJjy1qxZmQqDKF7kEOlDRQVK410l2
 qI6Dj6n2yOMuTLwkUFFwYFtSIACGXVkfjXF4truCs0uOSSIF02YjqXdeV30Y21qHUkbQffJJfBW
 UKElvMTrIZhdj6WRQ8eXyzOIvGOYtmhmU80qCm9uoXHfA0pGR6jAbkD/xzLrN4UYL+dnY94rVCe
 t/eEtUyc6DtxkJBr3KbHxl1ROM1KKBzn6vsir5dGusijex2Oe8Xo+m0HytG+KoKyzuEmTH5hgMm
 7sroz6skljuMldXtutk6oLoq3+FJGQ4Mes7yxFkA0LO0Pv6cUkPTv2trG3gOLA8ge3azH44BHYl
 mlQkbct/5oBzylg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzMyBTYWx0ZWRfX1qf0aWOUMBzu
 WTbxAmmCdZukViSJ9ZVzTm4O7uNCjoXrJFy8UWWzScbyOUnHQ571uwnlBX8mkGywu32rnmZ2lbQ
 Gy8a2G8HvfPmw5+Sw2Ti0E1pMf0eyDp667wElDb0T6g7y3jyyDTwiPyzl8KrmmBCKcR9xVDvV35
 k/QSy7Gx+rE4m3XGE8urKGMAjmvi97Vm7b/94ZK+S4MDeP+zR4pvlyCkXBeSJ2bcD0yu3E4SQ5b
 YCTcwggpHubwyLh9ttuXtd/z72gF5P6kvs2M2stXBt/OaOEvE/vMA59EXKKWuIUZaYd6OGP8dCx
 6tzjmTWrguLa+94bwHYB2ncr5zqO7syv8ULhiqS6KVvPwIEUwUWyPicu1/aZwyJzPYk+hNM0b4B
 yrF/pgdJeTHU3qVtfk5ZxIB40MOIg7HsgKpWIhDSj9N4naZOJ5CPHYprtkc7hax2dzmcf+UGSl/
 zZH5zSouMzhqWfvNYAA==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c7455 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vx3hbeaYKRubAM7LXykA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: FTfEa13ef28chAosEZtTiQhjCDFpaDsQ
X-Proofpoint-ORIG-GUID: FTfEa13ef28chAosEZtTiQhjCDFpaDsQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93719-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB352178DAD
X-Rspamd-Action: no action

Some of the controllers found of these platforms can be tied up to a
single high-speed PHY, basically rendering them as USB 2.0 controllers.
So in this case, the interrupt to the Synopsys DesignWare Core is coming
from the high-speed PHY, so allow the interrupt to reflect that.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 7d784a648b7d..f879e2e104c4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -500,7 +500,7 @@ allOf:
             - const: pwr_event
             - const: dp_hs_phy_irq
             - const: dm_hs_phy_irq
-            - const: ss_phy_irq
+            - enum: [hs_phy_irq, ss_phy_irq]
 
   - if:
       properties:

-- 
2.48.1


