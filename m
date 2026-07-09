Return-Path: <linux-arm-msm+bounces-118014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7/AxK/OlT2rElgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:45:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C484731B91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:45:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ESCveSmD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hIcmx78V;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118014-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118014-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0C79307A2EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0CD32C302;
	Thu,  9 Jul 2026 13:42:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E814230EF9B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:42:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604535; cv=none; b=TmuIE8f7lK299wSCqR4kzLSXQSxCgDP7ScYwnFLet1000r/kxjxfRjZbPdTm8/pYxMx0gwyech/fRgkP443nMmhfpaSKFFDRNyQd7+fuQlXaUlyKiAtBcWnKVw6iRitGx5HQL4VoDUa0SwJez4uEhRTYxKNAb473Z+xpkWIec0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604535; c=relaxed/simple;
	bh=SUPr9326R8/I85NqmtSxzGXasITRZ38mBZxBYOCk/p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aKEYModnaBOJyrmtv8VBJqdTuSMue//12fDi2h0z8kw/0a9GEBiS5TWYqEGRMkVfIbJPWAps3BtfU8UX0JjE1X0uJv9UT3roOQXKCsCIUIvmEDOIpxH4Xt4xLjsW7xP6xorAQfJGPscTErfElW1/7XXoKkeHsJ+4tewnoz/5mkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESCveSmD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIcmx78V; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNxmP1674264
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=; b=ESCveSmDD7kS6hwR
	I45kXnHodLGoxr+aTTQjbFv/xgGo0hrXEheMHq7d8Ugc3VrGjcsEL9YnI68khvQX
	HJrMB93i+Th3Opf8mZpORyJl83BSp8dsd8b1XAJIw+Mh9xnaYR8EzbPzzvWUZYIA
	Y9ug3CFnH3qKYtly4docwRLxH+QuqKamyRgyrGhtdMKqyNfQlRKwHj0prQjuxHjN
	gyI4Zggj2n+l/boSdbxwyRWUfJ1Zygyb9bbudEWZFa1bAovmtSFtYuXaXXxdev7j
	pL2Q6FE+w9ZSNaaTVWrLmtb9DE/yrdc3AwcYyNlSc05Ohd5U+p3svgyAY/8EO/GU
	CuI5Ww==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqschmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:42:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73850dfc198so223579137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604532; x=1784209332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=hIcmx78VfN4inSFJkFVE95b+0+lkIQZoeAud/Ay2k+moIgt0u+fBTRnxZeYGdit2fA
         6uNXThN2mVqN1j2k+HDe68BaJzad+nvStSs2lNh2Kbd673A4WBGed0RiQgP7Q5XTApZM
         xwdPEo9gbdyrEtlnfPXJGaTcVaiPLJ7OT4wz4l6SF2622q9qJvA4jRnVGADTcO3IDYQn
         sTsFQd+izTHC3aI+eSP26o61NnbpzHpv5HvQOh9dYNQW7f7Nn8N0ZiLdt5GssC/lTUJ9
         1vjHpe86f2HPujmuQJz9E9aGQAmWgA0FETfo9o/lsDVeIrab0AxvpgSVETRAedJ5KX8r
         WWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604532; x=1784209332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=LJuRCltlPM3NkX7Oi/7lCpr6sHD0K5GJXbnpSUOorFw8ti+6zasdp0VNEzyBzAC4YT
         AfMgCJP6OUDWhldSCX9gD08Lj79/oJFf53RCRO9yhNSBN4kFXFVZ8revl9Vq/GKAYucJ
         1rmdqDGW16TmW+p7u2x+PjOae1X4c4WLKQJ0sA+UuOKNQwRp7Wst2IS7NfAgOnz6hHem
         yWA2ol/9yLUydZjaRHCF4PY5j3LG3TS+OpFW0ik7yNNQTjxSEq0UMENjWt+e8/1Vnoe1
         Ilaaw2rJ+cL2Evz3Ixmg1CUOp91kjHXd3RcpjN1f/hV1g8Go9Hw0zSavgHIn1KgCn1Mp
         9pCg==
X-Forwarded-Encrypted: i=1; AHgh+RqT8Jlyl2U1ysUkkkv6eLiSIPHMDz8hFPs6FF389GgI3CZQ+EQWc0Nyd4s9F0ITkPgb9/wGj2UuRnJv0N9S@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9R8ZYPyrVFG9VAg1/fwA3a8UdLW1Qpx8hKqCoQZAfylJutNVq
	CDgWDWe5O92kpXcv5Eb0aABerDWG0RKdwTn+RHok9YdqJ17nwgWkJTH5NKcYTQgWJhnif0K3xmW
	H5OKx/doixxVpjqlJUAM4u2BwOr2ixnG7a17VZ/iUurnQEBNe9seJfiKyN1JpVvCn04to
X-Gm-Gg: AfdE7cmGbh8YRO2LX49yiOZlDfm9RpavABCOeCG3IPwhsGSdDHezlwcEDRgoe5dbuOj
	wH74wWZcJFZ9syqqcM413A8XcLnWs7PhoI0HOxvSh3zWEgr32bQbOOk9yi7SSfusFQbUPZFUA5A
	y+m4fMleLYWMnld3E+wfji8wQ/VXFZj35pOnLVHXGnzj28F8HshPtRa3UEauq2ZobqtP8xIWoLX
	FEHsklwplQhXouulZMNWuD4kWbnVnvdsI7rBx4QWm3YRddu3kNNUuUPUgJgleRrKkWK9C5lgd5B
	0h3ZAhgQcocAEHfYYgM9rEVnxYkw7bfj/zXVoy2oOB+SG1r1PT22tFfW6G4WAyD1gakXzUIS2+K
	+sBirqNbapAAGtQd2Kl+8unPIvPOnQicsZrYm6psf63yd15jypfmSvbGkLXgjGEZNA5NRd2bC9D
	BjT++qbGy+iZWIRfik4DmwTV/V
X-Received: by 2002:a05:6102:5815:b0:737:9edc:36f8 with SMTP id ada2fe7eead31-744dfc5848fmr3686453137.1.1783604531921;
        Thu, 09 Jul 2026 06:42:11 -0700 (PDT)
X-Received: by 2002:a05:6102:5815:b0:737:9edc:36f8 with SMTP id ada2fe7eead31-744dfc5848fmr3686423137.1.1783604531438;
        Thu, 09 Jul 2026 06:42:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:56 +0300
Subject: [PATCH v7 05/18] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-5-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vk2n05YaqyNL1lA1l7CdzDHPMAEMMeRGvxRtE9L+Mhs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UksKFRgIX9Lp+8E0Hywq+my3Nx4lnQEZ72s
 drlAdiRqgaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1cMNB/9CYfpwvPpAQTZSLJYikhT5r9Xf2JcNfNqTPaoBCR4RYDhT5jdRW2YdM5QhLnGe5YLVTAL
 TuwcJSCZx6bcZX3Zjapk415QZfec3lG/VAyqjXry2uhWytNqCfOOzx4gd+i3P5EsPZBK802z8GE
 ADjnM8cVN4p2F93gNZRyWSPXYjDrBlc8lG+0MQYv48bFzYSC7p8jFjFld7hHA1fQWf4X48GPLGC
 FfDkSh9PJsgkX2XlRs2M7fTtVX6nzw7chpXDanr9Pc7JMqZDttGGzSNYtLWUogfecXLW2+F5vjQ
 bfayvt/OtjZMumNbLMpLKwE7TOsADbBMhG3ebhiWMURmNKes
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX3M4EaIaXMR1a
 P3xRwN3eiKSsHXDXGEBwYGjE1KoEdzo0S/Pwrz/eAYKU3kwdmgSQAMlPGerWxqYNSxMzJLShgRy
 DppeVYZmvG0ntYlr7WfZ24g+9xDsI0Q=
X-Proofpoint-GUID: vVljIxLarJmGoyJ-wfff_fjYs8b4y_Ij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX6S1QN5AcTQZQ
 Kihz7kJlQe0IwenRJiHMXhgFvx+ZvvWvSj4QifAPEzsOOZoUGm3zZ+fKTDQ/GRB6Rp92FRZJDRQ
 5aj9ymXRtyeZFtk1qEEBK56YBPQgnHkXW7wOERbTHMbvx+PiVWVx545mVw3ocaKTRolTyaYraca
 DvSl0GUS54K4fKDAkD0qqFDl3sLCvfDseCFQWoNnEhz5I17ScIqwLFQwavtk0AMSPLyWHUmjUjz
 3Y6nJ+kaS3qLVgThOO7NJdnyyq2dVyYRriGZy43/LriK8IcOYEj67qzQo8rM+uEa9Ms04zoZN1d
 4vfhLtHCJIZ5dYuMQ7hpK5bvxpRhoxoKI0REUKFIgO7Oeu7MDN/U/npGqRfl3lY/KE7BySNPiLu
 La6FjZcGl0IDAgcfinNSteb6X5lRUjGzWpqYA9j8ijGVhLQnrPy9EwvpgE1NmXWG7lmaRuVwICZ
 SXg02gnm6Wc3kDsXDxg==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4fa534 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: vVljIxLarJmGoyJ-wfff_fjYs8b4y_Ij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118014-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C484731B91

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index b8714dcbad10..2dc121a3f5e8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..a49113b0da23 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -483,7 +483,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


