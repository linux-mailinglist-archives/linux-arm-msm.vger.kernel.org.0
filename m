Return-Path: <linux-arm-msm+bounces-106894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN5+IzW1AWr2igEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:53:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B53950C483
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A9673028EB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318343DA7FB;
	Mon, 11 May 2026 10:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDcuoxeq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1aAcvcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0969F3D9034
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496565; cv=none; b=FfxVtxqW5GoVQFy/UkzFZst48mTHxaqATBa0LbJXFH+RfLGJgvqR+WzxQeb6uyoenJdPB37U+rD5ZAp3PrLu6oNAlYKB0qlu5VkyDArbwp9OJ+ywanVHeF2xszE7IkBvLxLzZByl2TOaeDrYne03URAmQMozOBFBhKSOCfCHPJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496565; c=relaxed/simple;
	bh=rm2g+7WCJu3gDwkB9EAuBBjUl6hpY5pkc4BGZGxOr5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mxFWOhXhp+FBO5i+Zer54fD5y6zhVhud8S0dYqRqnMogw3COQ+ySSzg6lUVa7wPrEV+bShe9MSmyB2pT75l5L2Z0StVr5FUfd7p/Ic7tGKIU8Ooa2/WyRXFhebRdPOGowVv+pO5EcxwpB1FDRSPdpQifrJ9FRRIitjwc9D7YiDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDcuoxeq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1aAcvcd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9INqn652808
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tae5Yd+glqdsIfXCIHTUr6
	ZN2vtdU+CzMjAVlTQqV9Y=; b=KDcuoxequrHpJ8nmKUoBU8zbjCHGJzuF5/oOSz
	tnpD5inlo65fA0VuJ3ZChA7cA1NhwN/jIYjK9Otu3bTlYXXD2UrGwpUTWJ+jrP7m
	EcVGeu+XgxW+NQnykDOxoOGnCbYzjJwBYAKfh46HPY9ET3vvpmT5eAs9xhoniDvt
	no/wNjJd70oayVXvRmpZcSHvN0IqcOc30DzJ0Po+T7I+UQKulEk0io8daMxLchYw
	41S/ycZlRtW8dFvoJKiP0sC3GeIFqTPwmTCBOBjaQzyq3TTCeoT4vrJPYwTQLCiI
	t+nHzkkjijeVu5bOdB6Okmef7DlFl1KxBQcock5+fPhRplag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu9bks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:49:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b461b36990so46250595ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778496562; x=1779101362; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tae5Yd+glqdsIfXCIHTUr6ZN2vtdU+CzMjAVlTQqV9Y=;
        b=O1aAcvcdoFQNvhR8bEYGnfYQQMQQjLa0RPtADbsR0GnQ/+E/YsybDUvl2x2b+r5/jF
         GUUY6sqHlg64QACT0Zsk5zk4y6qWHZzu/YrEoJtLp2N192y2kEU2l6ln6GxGmoQKOoUu
         nryhGE0LXr8xrPR8H+QBAIifNLWHlvBp/YPJCN8JPBdlxzKF89K7WJHwhdEdO525UNwf
         G5qCuAUGRQyLDdMFUGBpLi4j3luVkEF9mJaVlT5kC++4cziiEaggLb6s3DQ/+SOD1FF2
         +070IJk+qw1GSzJBMyZ4dW3A8vCS9PAMRvw/vyTCHlQXMWWdYnwN8vuOWNtzTUypkxlM
         k4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496562; x=1779101362;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tae5Yd+glqdsIfXCIHTUr6ZN2vtdU+CzMjAVlTQqV9Y=;
        b=jxD3W9Kmpc0Ts3U6p5A9rrekznD/fzU92YPDMzLKJfqJ2nZU6Fk2zHmHe/H7a+PUPh
         Hf4o2yQwIqwanreh0qlgVJArpGwV9xeoF7hrX9mewwL/f19wCBmcnQHcEdvX9hUAZB4i
         1GoW7E5FB4BO4cemfvTD4g2EWQx+P6XaA1hjI6clvtCYbkoycrmDG/MgVTN6OD7sfuRn
         bnGVACD0ob1FjVGAy/5NrZ6QeggVnokEnn++PDHnEZoAxJS2Obz2uRgBbcGhIAyjf7wI
         qmng/c/0n3fkfkN23s7fLZJM9ac8ah3ez1nty3PhPspevui1Uq0+C4ezbNSSnbON5JiZ
         vC8g==
X-Gm-Message-State: AOJu0Yxk5YplVcyGYAxCulFZZCqFo3iQLP/zHlPq/QI3gfDMqIMyCXK6
	FP/Qysl8LOHoXbYtzHteMv2AewHQzh63tbazHzEKKMxQ5oQWYdK76edI4+Wg3pj1zuKYCaQLdg3
	s2+d6LBM4V2iV+Qp0FD/x0cYWGBS1NEW9ZhWOzQhkZ3AtejmwV3Z7JLg4NXXac8Axzphm
X-Gm-Gg: Acq92OFji/jRf01mdsABXVCWb5mYzqUvAKT6iQQSy/TDGTFlBVzr3xkffz0iN0c7rEu
	JIyhklZtOf3hvXtZ9rfOTSt7ThXqS/v7vMHa7RdQjmVRC3/ZIXtM5wVFh+PskUxRKSrGu3t+PjU
	amXhNSariQMTnwFdfbS6pNSZBTPp8jAa3x0RjExsLsSn9L11830ZNpEB326vaS060aaX8O8xrrf
	KPDVUZRh83Kb/77ARvvawy7QMI7QHvlHw+DQLFY6533QS37FtydrHbfqwL5K+CQrCIPN8v7mWq9
	uBB1TDeLx3oEHcrVkkll3zIrTDt9ddFWdXARC5HWESZECTZLCiDylusWRaojlpMG0O8mXSqDhd2
	2aYPj1Nv/Kfeh9b5Si2tCBoDGe/5WXUr+g0fkmsTARA9/w4lmB/krwzijf0bhe6iFPe8WS+6P51
	IbgRRvvBLwU8NNXODbJ1kOj50NLCI7e3bKJtqJUykMW5q4G2eWoWs2CzpE
X-Received: by 2002:a17:902:e547:b0:2b2:b117:1d5d with SMTP id d9443c01a7336-2baf0e4fedcmr143601655ad.33.1778496562042;
        Mon, 11 May 2026 03:49:22 -0700 (PDT)
X-Received: by 2002:a17:902:e547:b0:2b2:b117:1d5d with SMTP id d9443c01a7336-2baf0e4fedcmr143601215ad.33.1778496561438;
        Mon, 11 May 2026 03:49:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d26973sm103610245ad.12.2026.05.11.03.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:49:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:19:13 +0530
Subject: [PATCH] dt-bindings: watchdog: qcom-wdt: Document IPQ5210 watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACi0AWoC/yXMTQrDIBBA4avIrCuoYFJ7lVJCjKOdLqxV+wOSu
 8eky2/xXoOCmbDAhTXI+KFCz9ghTwyW+xwDcnLdoIQahJaSU3ppJcX0dXWyFB3FwI0fR2e0mdX
 ZQi9TRk+/43q9/V3e9oFL3Vewrhs9/t6EdwAAAA==
X-Change-ID: 20260511-ipq5210_wdt_binding-9f77d959a28b
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778496557; l=1071;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=rm2g+7WCJu3gDwkB9EAuBBjUl6hpY5pkc4BGZGxOr5I=;
 b=2C6wnhOrgRtGkh87K3ZV/0I4+Pda/KlnWA/nndO8Zy9Yu074ZXZstfitfc+xdQFM96Ykrqbpo
 tnC6j3sQJjYBcrtdsva+eZhXJpER++Rrv4Po/NS0CGOMtRssmhJZL6g
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01b433 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JxiR2JcaM4WusKbI-qIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExOSBTYWx0ZWRfX3bS7OuJyrIyj
 mYbgLlCjdfoQVkJbDp+JaUHpuICcKzfPj5HD5NbmSa1L4jKbGL5tGji6kaMikok9dCXQh4y7xUT
 42nDBWb949ZV4hbFrEqrDoEz7cTutzUoiVJyV+F8cV1r97cM3CbqpXTd8rPQz5h0j7RABUD5UBP
 KV7qMW00TktYR2hBYKxcXkVDcbI75Vz6NV5TtvXpiFr2fXzbokP9aj4161lB286xeVGjHpFlGhY
 FuioxdZM2eUiai0jEIWx3tQXi/bUoqRi2xLzI+rINYvK2+u4ofPjJBHFpjEnKVcRmHSApY/omu0
 16Lxzu2UnNCD/vW1UmYHdYm4DG3cx3RXQi8yWd+WY/E5e/apnYFoVY0fAJlT7YYkidwNyvN3ZY8
 kJUi5GsM5WkRZpuEnEKKhCWAIc1xtfNbPk47so53vr/z4fTFtb8To+uy8PbCFS48ARH0CXha8/T
 /KhSNMQ6R+cff0g1MiA==
X-Proofpoint-ORIG-GUID: QI5qGIZQRCtBh3MsESSLMpFUap0PrGcY
X-Proofpoint-GUID: QI5qGIZQRCtBh3MsESSLMpFUap0PrGcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110119
X-Rspamd-Queue-Id: 0B53950C483
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106894-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the watchdog device found on the Qualcomm IPQ5210 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..21f6f7db7f96 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -20,6 +20,7 @@ properties:
               - qcom,apss-wdt-glymur
               - qcom,kpss-wdt-ipq4019
               - qcom,apss-wdt-ipq5018
+              - qcom,apss-wdt-ipq5210
               - qcom,apss-wdt-ipq5332
               - qcom,apss-wdt-ipq5424
               - qcom,apss-wdt-ipq9574

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq5210_wdt_binding-9f77d959a28b

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


