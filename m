Return-Path: <linux-arm-msm+bounces-106746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uONqEqFW/mmupQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:33:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B124FBF23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7F72303E8D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 21:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F836274B53;
	Fri,  8 May 2026 21:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/Sg34Z1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e82jQ2IG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBAD30CD80
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275989; cv=none; b=cY00YrDvwTM7B35gnmWMaFJaLvuunIwTgTz0AyGYWVd2vD2p8vSJ45cM/vQRvq3T3n+wKYmgGFo4p8jc9HYOcgZRujOeDynfyfOsN4rR8bWI8PjeofeYWdqmj2R2YVvJqaWzsbheDUcI/29si3LNYmkF6OQTzKlgY5C7BQuUVjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275989; c=relaxed/simple;
	bh=Xi8+8vBpk72pueSbcHCY6ojLbswdddkKT2eKqWSkDDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bW/wTWWllUkTc1XvYCM1tzzVv4FVdL4w12aKsln7EgF3xHNiXMfGGnValEMD5rtuTIvMDHDnwG+uHvHZTWt52cx6pI4ORjPrXgvsE8zhGsAaMtF/BlI+MRIqOAvlnS3KvF7rFQYs560efaLjmz3C+iErKWEGA4fmRt2lZBr4lb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/Sg34Z1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e82jQ2IG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GWL8k2335585
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 21:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EkH62hBfkTl
	pUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=; b=c/Sg34Z13JGJrprRrYmjoW2KJlQ
	nCxnH11PY1RZxiTbM0zzIVYt8RPK2R8OsqE3yXy9T+7j7F6AxI/Rro9kd9ykKMKc
	YoRbKHx1d9bHmtE12dRvXrJelcfehh7+DUALqp+rNnazYV3vUjZrdkOg/tcnbpAy
	jKSNKHHvdJ8MyqInASOa3Mcg5vCQ0z3XIsK4P/k/4KnrOeWFl+8rl3n6eiFKWnPe
	PcAG8nDbSOF9qczxOWoF5P/Z5WYFRG3rv0nHqyxanxRzAMNLXMmwCbaPYaaSo7xj
	arkOyg8d65PJkKf7dtzZhTCrJfJXKDeHsBLy25HRdSDpLi1w8NiGcQcpVnQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1keh8xq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 21:33:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ef37c3f773so2885281eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275986; x=1778880786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkH62hBfkTlpUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=;
        b=e82jQ2IG3cyhQRzdLW6t13O35bHoqkU2i7ncnMpIvvQJjjHtKoS7NiD3PTAvAW10VZ
         sVKBJED2xSc/UHbKHt3Xnw2avW/cEQtzXUPiXcKP1IWNdSDvWvymq9PsFZna9r95MIKZ
         pktuwlEezYO6I49HcY4JAxcbCtxx+32DwkvKMWMsvo6maHvUGxYnK0T1wJKQu09jhHvL
         LN9UGz5eqcN9EHWzHjADm/QtU8DmeZuSKAtzrQ2ALjySaCI2LyTmw9Un3ggYAhlC1mDm
         reCnq2c3TP/gJfjHFmXCC4gQ63VGW8jMVOSNKJZCjkS6A5ccPQzrAO0TiWCLf7cJwvXs
         3EAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275986; x=1778880786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EkH62hBfkTlpUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=;
        b=TdcMbsgB9ibCSrVnppUfpwzbZI+8vIHwcyrnkcOY+e5/+rY5lXvop5ZxpwoETFwIwD
         8i7gYQNOo2mFshSpgMgxEcFcRuBdbNrN6N03WrYuhypsORHIlzWperx+B5+2phl2aBwg
         lPihJ4spgwrVfFreO7A+BNCX042KVMZvhahAy0Atoae40M4gIBJgSL+KLC9UGE/P7mMl
         9QZUNNUPQrbObWmHV70aA4+f8A60Opa2dqM8XhO2riJcsyV/3q4ElxBo0xgv4LfhZ9hH
         LLj8wgEHlyMBgBDJUyGZX+yBTewyJEv4NKrpSgOtPQqvlGmtRmUCjH+KRaFOHvu6g+ao
         1xpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8x72X69jOs08gpum78fVT+hDwF9KL2hFKZQp94nwniand1qvajoOMkFrNj1JYVjfGHkpag651k2JZoiRHP@vger.kernel.org
X-Gm-Message-State: AOJu0YxgPdV9qRFepwcwP7AynjDQpEilsXQ5bhOGrHuPeUU0WhWQOIlv
	MxNAg2om1aV1hLTfR8SSjwQIgZG8Nf7uQ5KEqjTfkgl38G19gX4AqVAQU39BiS3nDeF4HEsiWxW
	NLtK+JFiY68S+u57Pj/hANPp8yPWZHtphOWpDn0Ycpa6KzstPkwbh2fDnxhXemWIcdz83wZ3qvL
	f3
X-Gm-Gg: Acq92OFrF/8g8/SL2VbWRn9wKHRKFsP2oMRy6sBQ+6yA9ADH1zWBRw8/SPbdEFFgkC/
	3UDjbgG6h6/P9oRkoQFLoIYyXPclBI9aK+ubyWOXU41O+/l3+F22tIJxAZ1jPn4cOJoe5j4Ox4a
	Cyp+j3HMIJzy9aP4PHKqNPBC6425IHPQPxEJJuGdbKWiZO2FQJoD2oHEGAIyAE8HIp/UVnPNU9Q
	xDDJNt4oiN34KOVEBub+ZW9XJJEqrtnPfBGsEbZf4iwvL61ACG48usC8uYRP4cdFddHtkNUtdum
	m3K9COZq4qOmukMzB/+2tC0+DvZqXZYHh+dne+C97uNznhXUMcXVoppWL7Qrj3jPQXapiqFRb5A
	eUvGd9bXuJOR7JDAl5bDQY8P56NP94PgDOuuOpwFxltn8OFHTkeezLsu7jmXojMi60OFTHBM5Ph
	s=
X-Received: by 2002:a05:7300:4313:b0:2ed:e14:42e7 with SMTP id 5a478bee46e88-2f54b068c4fmr6969115eec.32.1778275986128;
        Fri, 08 May 2026 14:33:06 -0700 (PDT)
X-Received: by 2002:a05:7300:4313:b0:2ed:e14:42e7 with SMTP id 5a478bee46e88-2f54b068c4fmr6969082eec.32.1778275985563;
        Fri, 08 May 2026 14:33:05 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:05 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Fri,  8 May 2026 14:32:33 -0700
Message-Id: <20260508213234.4643-4-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CJIamxrD c=1 sm=1 tr=0 ts=69fe5692 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6lSwUGAo5LeF7p0M46YA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: RrYmH18csr4UQfMbltwzAZk7u9aVtnQP
X-Proofpoint-ORIG-GUID: RrYmH18csr4UQfMbltwzAZk7u9aVtnQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfXxDN1DBNmgGn9
 VQdVj3nQHLJkKA91M5llpuPNvnBR89ifdUZJWefEDTLT8bGtOxFdM06F7mXIKp3mioZ65TKONzA
 K6ylKLOwcFjpsbj+gEGyGPEiJ3uxuj7hfq7lHtwjm1psPdD0U8P3BfRPnNLUPf8s0CvDCJR3wlJ
 nPWiivXTl8DFKJXLpCiy6ijLBcPD4IN2VKcC13DKaDNlkPHzMWhdxDJrFj3FYV49hNIKsATcnG/
 RQjFCcYAC/dyIVYLp2WA+kaWte7tNndoEX7w50+/8wGybQvB4k3bxgj4NW54+/m0v+zYdTaBQ9l
 0okjCDKBMnp6sT5ct8x+7KS0wdVRV7143xA7NN3gst3Uzl1ls2Axd/1S5j086gAZ7lf7d7l8HMf
 J9IEP7uW3maCfXZLjWDqjX4esvdhQvm5EeAtLlR8WMjQIwa4hZTx3gjj6RjnpqUJdhCEA5MNwGY
 gE3WhA3wf5Zbs0IdoiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080213
X-Rspamd-Queue-Id: A4B124FBF23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106746-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..2d10994f7b44 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -203,6 +204,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
@@ -540,6 +542,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.34.1


