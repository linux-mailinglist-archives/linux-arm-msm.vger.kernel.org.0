Return-Path: <linux-arm-msm+bounces-104772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDiRFimY72mLDAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:08:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A39FD476DAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 606D030815EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C8B3DCD8B;
	Mon, 27 Apr 2026 17:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkJpo/VE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aV/Pi15h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A85318EF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309521; cv=none; b=C5ZnxsVZvHkliiyfKPP7kPS+sEDy+eyEyLC6gSABZH1ZiWwR1dYhYEG+Qu67EoAMCymz32IZ/Jn3/xi1wdrB94oDknB2FdM6Lw1dJDcVmogmN95k/lDMI8ZmViRrl5ghPI1ZQMa3Bpd8/cRl5GHDmjU0lTiOJa9oApbnqxRPP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309521; c=relaxed/simple;
	bh=u5YVTWzjeELE7WBZQot3YdmwzBvnnEI8SQswOvEcJA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B3L4G7H2Ph7fPXE6mNzb2QNlz1wycXHPedYQKvsZe/35NOpubwzFnp9xK8uAX9CRT9Tmbp0pfhvMm5v+ryN8SSxPlrH8qHOmy3RdgQK2FiMzk7BLxG/lae291Lc76CJ6TMBqts+/hCPqpU265EQ+/QGunPTi8/+8L8zFsIcpCVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkJpo/VE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aV/Pi15h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDtvuN665792
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vmUmxy5hzED
	WCWvfis3daD8kXsR5TouT7mAOz9okgm8=; b=YkJpo/VECB48Q9/XD3+B4GJglrM
	HKQVnyCRadBfm3u45cmWSvCoAvqIzKPpJ6yCXD1O8/TnorlICiy1lEttF88jHFjN
	ysZZUycHif1/BrjMoZAr2Xmb580ErJF1FyTjkCmQ3M+EIMv8GAoOM0zZBNeX8ZfE
	MMme3BKlyurJtB229PlCOemKxoF//TwQ08o8HQQmgHj7fqGLlcayGrBR1mxPdNda
	uzbdKvwBbUXMSG207O2szcpdAXP4r39iavt2aaofk364CfJ3BuQk4Ac0G78Cnzma
	XbV8YND3vvNFVIQ3ESx1t1Tf8cqdMFNNXGUe0941rXRZ4dTprzaMFVuI8RQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n2dwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da09e73d5so2489286a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777309519; x=1777914319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmUmxy5hzEDWCWvfis3daD8kXsR5TouT7mAOz9okgm8=;
        b=aV/Pi15hqQU8sT2N++DVmwMuEgvK53mY2o3TLzdxNUNH6/0J0F4wAaHAdb9SUiLAgp
         rrKX7WWlGkNOoefwkOg+kw9aKjcnTgwgCvrvKJMOFVwMmsyAqbiLjcCUgG5FHYIzOTI0
         1/GfipwX2xx882MWo5WIWtwAJfvtLsio8g/PLoiV7YlinnkdQwQ0cnOMezeGDkU+9qJm
         0QKa2s8W1b2SPrqwHcj2yI96C3CvbmojJSxFHIjk5xbALT/JTgs5qOynXQ2rG8yASOob
         OTv8ZHe4hDJpZHJHZJtu5mdJ1Z2HC1g/UbcymPc2h3AIq2pff1P7xyoyVE3KXcjfoW7C
         u9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309519; x=1777914319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vmUmxy5hzEDWCWvfis3daD8kXsR5TouT7mAOz9okgm8=;
        b=bTeDVofrn9ObiBk0maGv+BQ/j0YXzz+YPS+3I/gytzihxJBnyyQ5j+cTNC6TPVbyZE
         jQeRdbBB7DDsRD/s75a+unQguPklE9uOOK7sbidORVr0BY5Ln9flqUA65zADKSNWQnDU
         3eS3StXFGy+gapqyOa6ULzmX/BeHqQeWsc32B5YnEbJmys3EYoImX+UQtawYwY1wamgX
         dkJk4CZNRzJ8Ei5V2RkmB/o0dI2iivSKzuwTh3od0i9f6QSN3pQURKLwTxQ7bsZ3IrsD
         SExK/gX19HV0vZuLWdEnJ7GjOXXh6q1wGss8jnt9Hvi9KIjLNjJUEHgQ1oOrDvQRMyT7
         f16w==
X-Gm-Message-State: AOJu0Yz202EVkmJbVI3aSMSukd3RcwTIYoLFP8gw2GiS8bGT7gSP1qjX
	m43Y/4otjTfWe45ec/ioQdXBI4RTPqcL3LYuuhYvvQBntPtbCRtSHmp+U96hzW9O1cK5sCEPFrx
	Oo1zPCYTCvrP9yApgzZFbDcVNoZ3MQvrQ6trBhthhlivKRr1LVQEgwNplNUepU7Ah2uIA
X-Gm-Gg: AeBDieshowFAteiPw0HZevxfw5BGFhcsZ+j60vCqhHcdNTf+KE/tw5RfhfzFUZl4/y+
	vDLHbDaLWxVmNrIEvmckpTaIjFrSiQNvvCm4RrwHO5N6MQ6ClLSQLkjRR5zWF6dtcmh3JtMfkqG
	KJBnd/o87e3krPzwJqFjN+YE4e1Q+cyO2NPP7oJdYkt4jd8sGfE8l81W62xdYF+QXW4I3g29cJV
	1thyw3bA2dGpCyXLcZp9GQg1N4+hrb5BWI+I2oY5l/iROxDP71GT3fOem09kFtBkmNwxaOm6m/o
	+AMciJ1GJFB30jOIvc/QvylW0sOT+OAv4/sIOKQkI4ofQdvk+6obxgor4D8XuKgJ94OdaauMRmf
	cKAA7B7UXMC7UuVGYu29Lk/V8D9hst323hNfxIFtIr59eEij8no7hca/JyRroaXs=
X-Received: by 2002:a17:90b:51d1:b0:35f:b204:c62c with SMTP id 98e67ed59e1d1-364908c0298mr6463a91.0.1777309519177;
        Mon, 27 Apr 2026 10:05:19 -0700 (PDT)
X-Received: by 2002:a17:90b:51d1:b0:35f:b204:c62c with SMTP id 98e67ed59e1d1-364908c0298mr6439a91.0.1777309518726;
        Mon, 27 Apr 2026 10:05:18 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490025d98sm99313a91.4.2026.04.27.10.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:05:18 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/4] dt-bindings: arm: qcom: Add monaco-ac-evk support
Date: Mon, 27 Apr 2026 22:35:03 +0530
Message-Id: <20260427170505.1494703-3-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4MSBTYWx0ZWRfX7E0BSCi6zAtQ
 vH8WbwMJA/jvvqDJqanbRmcb1ZJBi0ENtImj5oKPAL6chaESXwGj2g1MxOmDt94JWHLF43cq5yB
 1ly4cjC4Uo/EPFj3XommdbsY3npYQBSuDiikiX2BPWE/jHQOFs5D7gluCIHaaigcXfc7e7RTmNJ
 JOohs2u6dzMt+imwFryq+7erdXqrOEEwTE0Bq+EdM/FM32A0OvnljDD/d8fK0HcrVHtz+H6OEAd
 rPHpL0CaTEsJ+2RqCp2Ksg3gKBleHJKxL7BzRQ9xwSAYBJ4DpH86pG5Cm7FRJedZzOTAc9Siuiq
 a3WcVRaEEh0BYVOU1b7FfVxzshdYv+J1Mqu9tO+PQ+k0H329V2dnITEhScJE/avQlxCXextfXWA
 2Gv+zsRu8iKNGbk/xgsXm8G7wgdhEP9AvSMMZHwkAr+3CmQ35FNHuDbUlHL71PQvcInPIQGNSQo
 7urPm3F+XdhZP8fXSIA==
X-Proofpoint-GUID: -H_QnNODPR2Yv-NE9fjd6hNex5lYD3v1
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef974f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7Czdxb_1pZKpEXywf30A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: -H_QnNODPR2Yv-NE9fjd6hNex5lYD3v1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270181
X-Rspamd-Queue-Id: A39FD476DAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104772-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Introduce bindings for the monaco-ac-evk IoT board, which is
based on the monaco-ac (QCS8300-AC) SoC variant.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..7531ab3143a6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -918,6 +918,7 @@ properties:
       - items:
           - enum:
               - arduino,monza
+              - qcom,monaco-ac-evk
               - qcom,monaco-evk
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
--
2.34.1


