Return-Path: <linux-arm-msm+bounces-106493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OfOD+nH/Gn0TgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 19:12:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5504ECB7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 19:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5D4B305DEED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 17:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF7D3EC2F4;
	Thu,  7 May 2026 17:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5D4cKL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyqKXgJR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ADF423A9F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173737; cv=none; b=XZCZ4ZuxwEiRvd0JwpEziVQk4R4NE/XZO9uPHN8RELvQHaG3vkM6v/eY7101z9A+4bhB81sj53T+Swizlb5mAw1araBiuTIVmG0dKlCR4kwHBUpNYVHZwMckrVbksTWECc+OxyIxucoQG9JZBURXVVaDnIIkOmbNBqqmLtxK3HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173737; c=relaxed/simple;
	bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfRbM60vX4Iwz5fdlb+tEqZGl5aT4sXszkr95gYC8VefdnTjllWkTMpYUFRa5sfg/26NlbIsSDPR8PzueMaIQXSl2k0hTJlhVyjlkYLaZkYC6c9L390UL53jJVEaYqf91LbgfWXF/VES0qRWKJRNg72d24h29qnbyrVfLWGNxNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5D4cKL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyqKXgJR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647GGuTu026511
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 17:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=; b=c5D4cKL0hRwkdsXP
	pYTtYVJW18vLeCzo2cbDYEd772/10tGRJEJzYrHna8GYTwGvZzbBGtedH8R2kjqp
	zpOTk+ACYn74kRvTbUUbMhyg4L6pyO7rlSSi11P83FmtGAn86hAHIm5RZbzz1MDA
	Hk53gKF38ap3vIi0wT/NMqSEosHGHDaqmD7Y06VJIzpfjvUhM1JNn8WbP2ZT85uC
	3GxI8suS21x+Ktpxg3oag0yf29qAMEG2abtMhCFOSAOSQXJRq3014LgiZagrVb34
	Er424XLgFWvhaJuz7IIgyAt7/tehj/bYzZNasSOOkMNseLEW69ySryv74vh3fFIh
	erNdlg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t33a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 17:08:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2babc42244aso20447415ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778173735; x=1778778535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=QyqKXgJRlsrYHMqnJotNRbgp8U3TdP5yYlACpiTaYM1jpZDoJgbAcC8Fhb79LaFv9P
         3ljdPHnnME+6XeoxBxcNEC18HK+df6S29yI9t8/IiVffNzokmyLtU7XCZAPlylC2gSmN
         7dYjY6VlGRYnJqD2vVuAvLQGWNnn2mbkbwLXZHUpL/xEpoYs61IGkzVMT3/Sr9HyMTRV
         /4jKWFqVOhR9o258wmfFRsgA2ae2ivdImg42kPWL1xYMbJQ/kprmn9fAkqeZMPThU4k/
         ZJ4ZGZLCzq3fmVdZSE6f1fBmKdw0lhd3KjE17bcvTntE6NWFb8n42dDKl2JgiI0BhZ8W
         sTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173735; x=1778778535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=QzCMbHGdO8bxqc/427fVodG31eJ6/gKQTDUaJ08RjsqVPfLN4XhDxkyKdulGc1VKpw
         CjaHh6a+D3e1+lNRwSdkppFTxLhEKIviKybvBy5RZpmp+nIy2EFw4lr98pdfhHBlwJIh
         zKVFcUVHZvJMtr+rZeU/+1ypppo0nY+y4nHwdXncnjJFMIlPhWIw3q0Rl70LSm8CjRre
         9EIVuvSqKJOCgIltTVLbcqpHI2VNn3e/VxdGiUjKDhPzV51c4hW8m6AEkVIf8ddF8YNt
         2FADHDnIR8o+3QFE5ujGFB1EUuMkMrXYDUWmiUyWyxThQFvr46AlA7C0dLfuRdSM4Uhb
         rvYw==
X-Gm-Message-State: AOJu0YyOX15EZhT5t5rNwCyKItVTP6nhwOh69+TrGgqFYzo2oPMGWEYv
	fyDK3t8fkmW6VNaZFkHmAGfhZ/R/exyeenLFwfQfWfEc7T75SaSFg+ZGCv2oOOJBAmNz9jnEBAj
	Guhmt7meFr8+LGh/3h1Ebyg2DfTQZ1b1qu9Ov9MjoB6KrFUTPjej2H/B/qc5lS5JxU4CX
X-Gm-Gg: AeBDievptS7mhHJnMUJdiI29rhPEUzYD7UZILyzc4AmVPgT5lo9H/cfz4c3cY4F+ffD
	QwbtVnzOdnxPensdW1IEasvzPJxFTOu67Pgw1R2TIUWHpegSu0aR5GL1PwyER1ir8tMp9qgjjuo
	fMSv+LowH9rXtmwCFLJeMTtl+PU+vgHGAZu7H9K98Ijevc08j5vP483hPsAiGP3RoYVN0dRDOH3
	/8OEpnCxzgJPc8mKai9oTRmGEiiUMCiBeq1/ph1JuM9v7S3W1fZNkSopmgkqbgnf01ot2BET3QA
	h8JxK6qZGskSPs8lQLy6jZxiC+jqjPGqKAjuPy9R9MJMkSyn6+KZ1pPLgt/z9SayNlyfzGLpgGH
	3Hd0cXqiGwUQbq7PuDvAN/ohEW9pGUF+rY2lq8djeWusKCsiW3TzbJ+q3fmLdheuIjDkfMkRpA8
	xg/17aVXtu8SWwWQzwTkYLh1Ch1eqSaezPDsuyMQUzXeWmVZdoekIx2kTL
X-Received: by 2002:a17:902:da87:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2ba7a330deamr91688245ad.41.1778173734757;
        Thu, 07 May 2026 10:08:54 -0700 (PDT)
X-Received: by 2002:a17:902:da87:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2ba7a330deamr91687965ad.41.1778173734311;
        Thu, 07 May 2026 10:08:54 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae78751fesm2530455ad.73.2026.05.07.10.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:08:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:38:29 +0530
Subject: [PATCH v3 3/4] dt-bindings: qcom: add IPQ9650 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ipq9650_boot_to_shell-v3-3-62742b49c991@oss.qualcomm.com>
References: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
In-Reply-To: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778173710; l=894;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
 b=KAcigkWQwEraOb4AcDg4/E+LrPlXgvdx8UBcATtXbUbzA4vL/7pLonUoEXXSNCrkwheJELs0Q
 0SLs9vrgVF9AA7OcQZ8q7FQR5vArssQ5TJ2QWKZnAfH9ZgWWPalB4Ue
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fcc727 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=w0Gmm53Jqs2pEdcyGHcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: TOdvBFMWXKjr-Y9rdS0TTO8cVCYGGTim
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MiBTYWx0ZWRfX2S3z027BOtPq
 yOmlaueOe4bu6bVYZp2nvMkhdCMRsiBxpEmBR6DvwabzVaxlwYfVZ/ssdHPG2H6MVSheOQaoddR
 hnhK4+s3WE+X/wbICjN0To8p16C3cvhFEHt2cogh5ssJuuI8XmavndYqDiuDjRlVC1GCHpadDWR
 RK4JijrfGxhXZFoBBURaOt3AtmBbhl5YFgtwZodI4kRGOeeF0K15hlOfvJfbkRIVVcXZSdtvPkA
 fm/igY+0mIfC/HpeHdtv9Qs/7a4wdHva2huiF0R17/2t++TcCACmilbIotMVYaz4SQ4Jq+1V/Qw
 S/FE4cxKr6+naPAF5MUMmtW/Fb/GNeGYHwornsWm3Z6DChKxcZstwmfnWZt1GLOr4Almwb7kaSm
 lplGHt4w+rdtMSQ7XnIaEcGOV9Mt9YEHe+hvpxvp1xxy0U3k9HA6a9T4ujUEFmgOQvkbTVdtpA0
 OLp5p7iJDkVCfMPPFfg==
X-Proofpoint-GUID: TOdvBFMWXKjr-Y9rdS0TTO8cVCYGGTim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070172
X-Rspamd-Queue-Id: 8A5504ECB7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106493-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the new IPQ9650 SoC/board device tree bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..5d0855765fdb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -365,6 +365,11 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.34.1


