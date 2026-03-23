Return-Path: <linux-arm-msm+bounces-99083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEgHO/iVwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:23:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEC32EB76A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5B62300A102
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3EE1FBEA8;
	Mon, 23 Mar 2026 01:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnF8kcDn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrWY1HUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778C51B424F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228865; cv=none; b=dJL2VxVIScxFg7QTIXEJjmcIPv5LTw/Q7V9SU6LK3mJWhxdfA+z439+9jWFdszaLb7vchHM1tjVh7TFUPXwj8iVaW42JWHoTlinwMWNiZjKfnrstT4tt5EUzokLzW2Fgc97w7irAlbpqu+O3Bsdy7DFWAOxz3fmYXtQXlxBhkx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228865; c=relaxed/simple;
	bh=lBHFahkGGxQBKE9ZvgOUhjnVhbRhjb+/haxJ+RQyX0M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uVBhEzcFZ8eYELSnYqWRpUsHi/+TPbF04ATFCKFqMUhVy0aTEjvkVeI8yk0eVxKVFiX15NeXAUNmuGqmxW+Jlyk1fpGnUVMhNfV2B4qnSghjokrMPiFRDe6R88IeTOz8m08bThvL58ktqsLPBbUmhR0VhbONtO0K+TQJ/o/zp5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HnF8kcDn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrWY1HUM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLFRGa472378
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eyR/E9xqAl0CxFR0yeSp2p
	uYF4fg/gZwCYdOR/3QrzA=; b=HnF8kcDnwrFp5L8l1UURDDWF7Bt1lFQc2F4MHJ
	NbNTgTAwpYQ113JsV+FuZCZulENYKL2wLMeEavPMw1E76OlSJ5V3c5ARjusHw59S
	vFzpr//xzdy4rWt8efvrrgGGbSqsNT/ZQCj50Yz/Mvb5u0gPlTYHcon7U/eFKZXj
	Tw9SqARNHRAUr2LSxiMrOSmE8ia/R0w6xhdPPIM2hC36/DCBKb03g1LhVNcffUoK
	7MHEgGX6c8nnDge8V1McJjELlud5UukfWhO8piXOxdx6zdNhIhip9ICBX7mwoikE
	Wm+IBPffqclyZ8XxExwYURclgnq6iHcnM4uS+KjU7KJmAZ0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvka7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090e08dcfcso339625151cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228863; x=1774833663; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eyR/E9xqAl0CxFR0yeSp2puYF4fg/gZwCYdOR/3QrzA=;
        b=OrWY1HUMey+w8hXP+7FMx/4HjnvvY4WMDHXDNM7euYmrywYIU95x5VXh8rkkGumuUM
         b4hErRHEZyLEoFJXaIJLTtky0938L3rYBlZkrhvlHz3ojRodebnyolSTSwXwZhgnxJAh
         VDngBh6XzmS50kG6uNc1EeNxx3JIsyO0zrl2YrI16/rC46NPa9iSfemECLAmIKtblNkX
         YBVSO26p6jE9zqjoC+s5k4tqBa+So3eEsXUXqFJgptqhPrjiCf2PQbSbYhPsVWOQ3x8F
         2FO7qYdVKAvxatsBy0KFPv3+06q8M/rjLWTSwQC9LM2IxyS5Ok7nQaWz6Zau3hUC17Sf
         DQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228863; x=1774833663;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyR/E9xqAl0CxFR0yeSp2puYF4fg/gZwCYdOR/3QrzA=;
        b=kuEZZyzYGUh3z9FTb3LnWPnaPDYHpUV9P5M6XhKH2eINo7R5B1RTYx5ywHM077wNQ1
         dp/wi1iJ59T7ranu73ZdLIZupIAAjRe4OnJfpe+2PHob8QqskTiUFtssIWbh/IVGt+wD
         jQTiclAD77pzHvZIsMrvVChjFQyq2HNkNM/NI3yPiR/Z+S7QyU9fO6zsF1rkJqh0Db8I
         dlZR+HdLCIcGVEm/ZKEvfdlru7MNrdUt3vsRcKcCwqzCS07VkRnu+GMVcyEVxKsTnpwb
         H5bQwAYruM85AaVEryBxg7mkCtfvRiQE6H5AZ+VEQ+yNdnWjaTbUJC3bUIM114276038
         Zcdw==
X-Gm-Message-State: AOJu0Yz/Y9rWBMvaCK9i3uUrePRU9652CgNbwXbFymbPTMmunO6pnNax
	+uDnfGtNPr4NeFODsmRZj3PsOZzNBQ7iy4cNhUq71KL/ZHiV90acCFO/kjpC1NqtypFLHIOaw0v
	ijmWHaOTzrVhW9R7vQBH8kLrattgNYGPxEvEMQOtCdMdgE5R+/C0HtBZaCXubbeDtpSKTZo335x
	bF
X-Gm-Gg: ATEYQzxJ9Q/mO87tH97NZwZvz86IZZOrpu5cPtTO8nhakPlrLnlk37ezaaTepcr5sL6
	+c0Ldx09arQ4wLJg8Bv4phYPqdIJvwRn1q94CsB5WImU2RMCxNb1nHHc66aavWiuhaoai0TifC/
	lgH92bng9lLH7Z+JdANryOyfcpuhkcrCJyMTwawg5qPvSD7Rgjc1A/OVADEF9S0GCXZ5OjYN3qr
	eFXggd9qWjEyx2Ta8VzN5KmKPQhVHDbmtFwrYs3ZmT++3AOgef1BLjqy48+/5jC35xy/t5w+1dZ
	+76GkfropWT4F/KOHm9nWUK22lDqU57c3DAysn8z70hnRIJpK1t+oicMJ1GE1MZofJi895ifgon
	03ktXB71OquDvpII6t1V5wDC0nvQ29mH8DIYbmv08Pk99whE2amaeu2wG52aw3xCENJwGtukE31
	eyCLx/WP1li+8lV5VEf/SWvBC7NNWdzOSVyWE=
X-Received: by 2002:a05:622a:1a91:b0:50b:551d:ca7a with SMTP id d75a77b69052e-50b551def56mr55755451cf.52.1774228862772;
        Sun, 22 Mar 2026 18:21:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1a91:b0:50b:551d:ca7a with SMTP id d75a77b69052e-50b551def56mr55755101cf.52.1774228862350;
        Sun, 22 Mar 2026 18:21:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cf9esm2108092e87.82.2026.03.22.18.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:21:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] soc: qcom: ocmem: let the driver work again
Date: Mon, 23 Mar 2026 03:20:56 +0200
Message-Id: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHiVwGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNj3fzk3NRc3ZS0VKMUIwPzFINUSyWg2oKi1LTMCrA50bG1tQA/9vX
 MVwAAAA==
X-Change-ID: 20260323-ocmem-dfe2d207d0e9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lBHFahkGGxQBKE9ZvgOUhjnVhbRhjb+/haxJ+RQyX0M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJV5wq/X1frbToSyOVFK2fHgGtztybJk9hJnf
 7MpopOHiROJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCVeQAKCRCLPIo+Aiko
 1YRsB/4xsRpxwKp68qxHmGh4GkqiLbpOCZg8idr9PKDGVXJ7G4ZRKpL7nY6lpbn7hbQrLMj/nNz
 etbYHv4XwvnlRNbwhKjNXsVNFgeTnn07cCmf9oSe+lV2RnKyP5XKcIoGbHJSpLz3TFqIhwVH1kC
 Ei8gV49IL0xa9+4mcpslwCk70Zz0WfpJkpzCioGRPA7LCqfTBA8lj/HEzvrF+h7Z8ULNZ+Lmx87
 Js0NvYh8RRkX/f5vrhNrnfTAUSON+SQ8pOsgogiv5pzBGUNVh/RqghfWrKNPng7pkg/N02VPtrg
 j+BHp0zOukkL1KBGqWY0Uz3XKmdPwkCKejpS4rLnzFE6u1XZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfX9a8ZHEw33exg
 S4YFPYWEt1YmAW7u21uNGdysE8hd8CC9ngvK1KmTg1F5nG9Y2F1vba++lVR1C9z0Eeo5wn2e1rr
 fuN8XXGsTUp/1Klp9Fxzr4HNEH3UMDIrTJPagopuwgeXiZyevkOIIrpOe4IEMfVP8LPKqk6qPWu
 jyCtiw9ialWubfL/yu7BU1GgqJdB1qq6O54tEaXa3k47CiCcQWz1u+ig5JS5BDer9z1tkJN4v4G
 pQPtruAZXXbaCpAqotVNXQ+ZDFoC1QKtWqXB6XfHBPwZJGMDNA5SgGyy77U2zp3iZfIdlILVxaB
 whx9orSDCWyfFaayuBN3IP18WWBq/Qje1I9gDx5xtNtqNfITG2gosPFC3bqYYdVDAz3qkkiJtes
 eyuyfAnnnDsHWObZTk7urNtkeUbgCdzWVbWuPhUpszWf/QeNoc2fMvS2GwyThYA/wyW/EXUb6vM
 jVLxADtp+m9AyHxYBwA==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c0957f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=6solvbRz58PIRhX1EqUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 7JWzvMtsVTS8JUUoDP1bOosblwRBvmDx
X-Proofpoint-GUID: 7JWzvMtsVTS8JUUoDP1bOosblwRBvmDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230008
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99083-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4FEC32EB76A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus
clocks") moved control over several RPM resources from the clk-smd-rpm
driver to the icc-rpm.c interconnect helpers. However it was unnoticed
that the OCMEM device also uses that clock. The clock is not required as
all OCMEM users (currently only the GPU) will vote on the OCMEM NOC,
bringing up the clock. Make it optional (and also apply several other
small fixes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      soc: qcom: ocmem: make the core clock optional
      soc: qcom: ocmem: register reasons for probe deferrals
      soc: qcom: ocmem: return -EPROBE_DEFER is ocmem is not available

 drivers/soc/qcom/ocmem.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260323-ocmem-dfe2d207d0e9

Best regards,
-- 
With best wishes
Dmitry


