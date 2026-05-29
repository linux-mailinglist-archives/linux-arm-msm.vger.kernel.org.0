Return-Path: <linux-arm-msm+bounces-110269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDCGKQiOGWpTxggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:00:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0553F602986
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9BB830CBC28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A432DA75A;
	Fri, 29 May 2026 12:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MyxzDCrL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKxomcpG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE342D97B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059362; cv=none; b=B8zm2rLiFdbJk7ogBKaIw4bC0C351LF72zeh2dnQ30+xsXLiLpm/Vk8ASv6O2jBGhlR0sk6f8wK6vTR3QNH1/LT8GuEmJcFiN5Eft6h5JXHXmY8CfmqR/sM45XANugUxUb29syLUvEM6Sga2d1715fByzcxZRdi/aHoIxWywPUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059362; c=relaxed/simple;
	bh=u2cMcr5HE8UwOxEyPSQkXlXuLEhA3Pue7ToinV9y2cc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WM4QhVOgbtMchpa+igUCc/I5Xzn6SIlR1gCFHsoqdbpaCBpkAZmNsFOZ2tMyU1LcUxklRyq8h9EKQoNQE+is3YvTeP1XdT1iVZnbnu5AvM9iFRYXROL7PCozBRC+B+bfZ/KYup1rgH/vHqxER8Njb3HVKRzaqH+I30Uq0dZGjz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MyxzDCrL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKxomcpG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TA65nv3678085
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ercPn/s2CwMvDRv6sn4QZS
	eYjGszx5dex52JjxqqwDA=; b=MyxzDCrLu645MFLK4X5fwZAJvvUNZreBjptlI3
	ERoNhegopQ70WZGDh94JKnDKL8FoqHmSSI3FodUFXrXjn69G+K8D2ilR3fa4pdcB
	yCByyW31N/PbSAGhR0TQ407cTyaAXYTX1yJDwTOlQkfJvNDE9vEVQPffM+l2tdCG
	UR9YJQDYL/0RNGpGD3jPQTvklSVevSBao1IGYYL6Ht8VDw1C4FRJx9kp1iF7LT6Z
	HosrQuzNXgVxKqtfGkeHRuXS4Vzha0HKa1xe8O7hH2N8aIjB3gGD46zUm1BhKxVw
	qmp/ioeVK8QHKUSw+OJAO1L9O67yI6dFJDZyQGGlbmQlEeiw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rcgkwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:56:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85759a8f33so446538a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 05:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780059360; x=1780664160; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ercPn/s2CwMvDRv6sn4QZSeYjGszx5dex52JjxqqwDA=;
        b=aKxomcpGLRA+u2+mdcO2NoVuEnnu6ISmRz+WWgnxOGHTvUTNOmkH6s6X2Lh+NLZnfc
         UDWTN+HirqCcS2FZhy38l8hUu+iHjXkYMIXZphWIu4gC5spz1/99RXFAYmxU9D/xQpkE
         R5O4a/CEiAdIeuF32nR0NGik5Rwe7zm1rX/38oFiojGRILV1/Uc9DrAdl/q/y7h2+iRq
         RC38e0CAPXCE24vWCPJUc1/S75ABlsphKr5KmVMHSZ57OlKcoX3AHWPq7gKNipbQnDX9
         /potnudhlwqBqGizaJP9CPYtoLVK60a/iJCMLDs2qKRwkiFRZCmhYYzyx7p+qN1Gn6a3
         r4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059360; x=1780664160;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ercPn/s2CwMvDRv6sn4QZSeYjGszx5dex52JjxqqwDA=;
        b=GJFblfyC2JyrcL9mMhWD92l4R6O8Wi4d32+5q984nLFuc5aG431/ixLqK0y2YCrCMS
         viER4ZAJYDyhuFoXkTZNiyfEwKzFabpCexCfYdSa7xpEkUWq0lIiI/tVgKKV0BrVW3co
         N6P9CQBWBD3QtUkxlYLAKICThmoPq077TNyEWSVmS9L3MbDYccpDY93NQEcBYyUp71R+
         dIBxvkhQjWHLrZYgDD7yWAIPf/MK1V4n0o0gMtEu9Z125GBnkrz57uPgdo0qMTVeul5A
         zCoggrrUhKx8RJMCUtCENlhF697ocXJhrP+kNOH+ceMHtvn1tvmqO3Syp3/oGa4UpEWy
         Gyrg==
X-Gm-Message-State: AOJu0YzxPUtyyLOYwXH8l73JuaK8G7OewGDVWxLLfgKYMf+JfY3hTyT8
	d4wL3Lq9+aH2QatchDWK3q+hSHNG+6T258FKsrvnQ/MIQ6ZoD/QCbaB2YgcIZY4+z3NY2At6hqJ
	+7nVf03kmaLU8VJI8nUcBb5CcRmQ1ZAU1o/j0Opq+VsX+HljJpo/ZPV6sooFD1Gy75J5/63EipU
	j+
X-Gm-Gg: Acq92OGzjxSXGUQnqyMvyqNH0J/eiSVbhY8proiDlMdARp/kRa3mwlM+3Ad/6nLhkDN
	0nvj05rEAqggrB6j7IWjl2d2INtM2IuSe3Znn8g0jk2IlEIAPxvu+1R4EyjqWYsLarO0q4mzt7i
	yhJg1KFK50QMv5LhQk0eKjHqNNVzUBn4ln0CTwXhHfPyI9MQKw4roNjRIn3Tfce2T7QrH78NaFp
	wGS8RJzmyHc+9xwWdUg20oNC2fAI36wH8BqVJbxXB7QI92HC2zb91CdYhXYVIFJtcWYkCaJO+fR
	dVzS/qK+5P882EcRuBG9rTl96xOFjesIXdAmZTZHmDuRtG6LdGBPzPipkqBsxrJmOcg9vZUriy+
	SIDFiqmwppDO2LZYW9j7H5N4WbND56QHkhXQRBoYnMawHv+Lzxndui94ww4DCMQ==
X-Received: by 2002:a05:6a20:7488:b0:3a8:800:bdf4 with SMTP id adf61e73a8af0-3b40fd7b546mr2896173637.33.1780059359858;
        Fri, 29 May 2026 05:55:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:3a8:800:bdf4 with SMTP id adf61e73a8af0-3b40fd7b546mr2896150637.33.1780059359358;
        Fri, 29 May 2026 05:55:59 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a7c24sm2119680a12.2.2026.05.29.05.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:55:58 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH 0/3] pinctrl: qcom: Correct MSM_PULL_MASK and fix resolving
 TLMM register address.
Date: Fri, 29 May 2026 18:25:43 +0530
Message-Id: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+MGWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNL3ZKc3Nz4ktTikniIfLGumYGZYZqlabK5QVKKElBfQVFqWmYF2Mz
 o2NpaAAy50KpjAAAA
X-Change-ID: 20260529-tlmm_test_changes-6061f95c70bd
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780059355; l=887;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=u2cMcr5HE8UwOxEyPSQkXlXuLEhA3Pue7ToinV9y2cc=;
 b=jlxMhG8HeVPUKFm7bFRvVvEbKCSbxAu4kMlJZBR2ecUmtSrdJWzR7hIWdDp37L+o7xk+AAEYK
 +dDKzsgFwdEADjE7XkY+eqGDVCFV3oxI2RW9MmQJAqPhkmyzAskPIxH
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: 7JX1fsyZD6Lyhdi-PEdqqR46lR7po7m4
X-Proofpoint-ORIG-GUID: 7JX1fsyZD6Lyhdi-PEdqqR46lR7po7m4
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a198ce0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nsOrj-K2rTX85Cj0LEgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyOCBTYWx0ZWRfXzl7eCiGK929l
 j4N6ayezSpi5jx23/vRtuuRe6bgDP9h3YUwSJOGwHnekicjJmMuFmqHKt5q7LkgkZf2fQOfyjJp
 h24LDcILO9Krp7Wff9G02U4k+e/1syE4yEP8U74rlK44LrLEJoJIqahI/I04BSgAM3WO9H0qZFl
 ZWLG47ttRT3W0rU8hHt/RquaspW9TUs042OJAKi2GIvXhwNmVUVEDhLcLr6MrdRtklLc7qFU8pE
 PmykYWZ4oPmoJerSVUp8C0zLLk/1EOvl4bPHm4PZ+tgB/F7Svd3o9Sqlpdw6tpRFIR+gtDNiLD4
 747ZpMSixOsARmaYDRsFM1GyDJQX1r5HFABO6KTZDjUkthvk9L2B+kWlA+XwB3CR9nG4v/PfayC
 TIuUvNFuhwOd4BHclzqytF1iRcRt/R19Neg6bfZ4DhN81IsMyvt/YnyMYsY4WWGdfiy+mrrhKyZ
 6p25MGs2ljFpBaktXKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110269-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0553F602986
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Modify MSM_PULL_MASK to accurately represent the hardware configuration.
Also fix the register address resolution when 'reg-names' property is
not present in device node.

Also avoid assigning thread_op_remain in unthreaded test since it is
only used by threaded IRQ handler.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Sneh Mankad (3):
      pinctrl: qcom: Modify MSM_PULL_MASK to accurately represent PULL bits
      pinctrl: qcom: Fix resolving register base address from device node
      pinctrl: qcom: Avoid assigning thread_op_remain in unthreaded test

 drivers/pinctrl/qcom/tlmm-test.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)
---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260529-tlmm_test_changes-6061f95c70bd

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


