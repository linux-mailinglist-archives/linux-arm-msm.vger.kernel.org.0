Return-Path: <linux-arm-msm+bounces-107894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL6CDJgTB2ourgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:37:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9599854FB2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6C5731C85C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F5A47ECEC;
	Fri, 15 May 2026 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2p6nPE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irlh2MLJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA147DFA6
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847090; cv=none; b=FhtjiomDKZp3nYYPoUWIVb8SNArlkHoQ2IG70W2GIn1Ns7zrWF+QYh82Q5xBukDZQMzNgUiWAy8fov58OS4Uj+vddccPkdt2UY88vEm9HB97VSYi6MpkEtamrqSbR+n40RYQbd4sS9d2+YWmR7Dfo2dj3t2b8idlD/o2ylB7kpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847090; c=relaxed/simple;
	bh=QgA7hMYiL0NMPsaE7GnQwbdQ1ORYkk6fa/nxUYRNjRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k3iD5PwA7mcJCstrZTYVcDOHq/VNdBoQUA5vG76MfccmNM+FdeN/A6IOAodtiISQo7naxSCoO9pZhtqWP6lduVQBCEWj69tzXYWEGr266FR2I1hqFHcrpFk4fNByPlP+xJVGpzXLIXNtveGKEO17PtMFLJYqtPsFa+ENmMbpDak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2p6nPE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irlh2MLJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB0wMj4020900
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ke2yn2K1eROwjLrYWp2XmHA3NXmS/bE3CBs2p+d3EKk=; b=J2p6nPE0+nzklB5q
	NzVlRFJ6hfaO83Cj0KRDLwQQjWSPmqRB3g6312Pi4ESwJ05JM6gzuYsbRasQvp1L
	WnSUJT0zjGHPC3Ef5fb6QbE2TM2c3Kxd4g5VQkzWcuZ25kwC8NYs8PNV750eZdIn
	/F7WSDJ57BTnr3xSlY09Q+TWMBs38j/aD3e4ZgXITWcwxowCYvHf7WKCn2ow4M0y
	0VH54sYlFgRs3sZnznKRMDw5zx7Pj5cJxNnkx65MvmSAw9IxXzEnoiANJB7uPjol
	f1brdLNMwi9a2AV5/MqG6pwqDi9vIjDYaAkQvYw17vGt8aKI8QZVYJq6iNltjZCc
	m2a17Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru63f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:11:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6322654bb6eso8261778137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847087; x=1779451887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ke2yn2K1eROwjLrYWp2XmHA3NXmS/bE3CBs2p+d3EKk=;
        b=irlh2MLJ4eoAL37PlRwBUTttqvBLs0hbsP2fUvYy+eSw+AQCzy100iMYgMPjZi+KpN
         sx9s+nY4Qlhb6LEbqJ7wk3wgw5KjsVMRxg0wyA6wDy5HrfEuSyNN5ROkjysFqQuP8zY1
         dFBPHXdtZ4m0u6xxlQmymXwhX+Vcuo0e6jtRqBSaW4Df0eY/IstpU70JnrpBuNznr0d+
         MGeZgY4vEzPaepF5NORh1uJCuPGR7ST0FUgOD15u2VCqt6Td6zusvO/5rBR1R/QpKSLu
         Un5fvydx/270y9uPD5rHHoB4x3LsO7eAQeqnl9I9+VQlYVHY0S3hdpUi43lJRlNDbscS
         krTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847087; x=1779451887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ke2yn2K1eROwjLrYWp2XmHA3NXmS/bE3CBs2p+d3EKk=;
        b=L9qEqEtwMsbUpWFvQy/4YCLxTg1F8HSZfgKOCkdXHMB8eIX/IeHznfl3ZP1btU6fLM
         vaYDcj4Hha/k7P0p8IKVqf5Sz6ElpRD/C7frwbFeezj2mU7HiR7VJXxfEs1im9EpAk3Y
         CRwu2pGRM2VZFXHj57fe0t8cIqlvkuEoCGbTSQVy6WKIXIndc2hfpDqS/a+MOBnxzPxZ
         XIvyzzzgfoh1ItiutOIolCb+J204fCwLknYUYm4C9dakuSqBc/419NFtwJEeJASjnowR
         saOzDo7Psi1GwWOnLLLITy+frWebG22FkcNPgJ5ofbVKQ+EzYqDwdaA3t87q1tAhPwtB
         8b3w==
X-Gm-Message-State: AOJu0YyySNMukXcCf9mG5IliLhJp+U/lkdZqMXpHGaAuUWpkNz2ZfXqq
	5A1fphoHZBlgBvRWanwL3rTc6i5eyYKrF6xEgBVrVqqnQbOruTaP3KAIumVM7P7ghogR21HxkHl
	DdwQgIp5jMcbQwbu/SdTN1cj6I+u2xETMbdGD7vhNsrbRPncbhybPkYmPUban5EYm6fTTKhwDXV
	OX
X-Gm-Gg: Acq92OE+FInWfOcPn391ctFcBvHUFiMkMW64R2LryQy9H3bs5F27JspeRo/yj2gCPPZ
	SqLk0SZunc3rHoM6HvU5p/uO78ECOgJyg/Hd7lsJiGdmHnBSUk37lFZPiFAFFBeKN46imdIJsZO
	r1anerV9FgckpaXDeblJv1d4BVmjRJ/IpvmPgigh3eUUsV6JxR5PvOB7ZcgTIS5Ea+Xrq9WmokP
	UPx2KokEGUlkvqM1szsDq8bijzsHrY/B12qPZOT7dtKWsNQ715pbFIOAJd8kGyAAwE9uEBN2ECL
	wNRGTqjY2oEedVxLUdGIvuOPSUwc7+N+KXUh81TBU9P8j4Dm06CVI9WyUDMzmERlnD0GZh2BNtI
	syWjoBRLq8KAr1Iso8le6NxWDcK9Xb4rkW3Qur1/PHmRY
X-Received: by 2002:a05:6102:5124:b0:632:78bc:2bdf with SMTP id ada2fe7eead31-63a402a06cfmr1906473137.31.1778847086572;
        Fri, 15 May 2026 05:11:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5124:b0:632:78bc:2bdf with SMTP id ada2fe7eead31-63a402a06cfmr1906399137.31.1778847086091;
        Fri, 15 May 2026 05:11:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm66855685e9.7.2026.05.15.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:11:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:11:07 +0200
Subject: [PATCH v2 2/3] interconnect: qcom: Restrict drivers per ARM/ARM64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-interconnect-qcom-clean-arm64-v2-2-adeebc73596d@oss.qualcomm.com>
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12464;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QgA7hMYiL0NMPsaE7GnQwbdQ1ORYkk6fa/nxUYRNjRo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqBw1npsbr8ZOHtPi/gl9depJd8N3KTPfiKErea
 cI0MKkkRcWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagcNZwAKCRDBN2bmhouD
 1/1pD/4tMP18moI/MbgsQCAhK8AlatLsWMctQGZ3EVzH06/2AZb+VOpNzeKE9SWpLpxY04eFZEn
 5d04C1VHJ6cD7CQU+joj/G3gYGSTtxEGRr54eInTb7rvyQ8cZWkMM177B1/zwwRO8GmMrCs9K+/
 eKAgUbJXNi+QJHEM3HaX+oAeqeHXlgIXi+pOBH0TE+UTZHb5uaAPQq6zrkq6QYrVz4wxy4gfge4
 q1Hu8G+MJaxUkNxQTG/4QKhIBXxZFJj87hYTcyp6U21sfn9KmnifF5kya/uOc8UT22zQ7FWKKtw
 s55Vt37PDjYX6TwlSNBbtNswCYDkV+hzQdRS4GTmv4DOmuhfVyI+dTC8sEkCBHthyybEPTmd4tQ
 S5Ftb/hofUKTOXi0U27c2xuSKGKTlUh24eYegCOruOlGIlS/yK/hWduZO9oJMOfgQ2Fp5jSxQUN
 dPzxNLGQIHkM7pZqI82kg5/0oenQUKHzL/22UylIGgU6LE+P5JvQa9Enh1tI7OwaSl0Xm2x2kn+
 zVlEb71HmxWKKS27vv890WoGIzS4o2y2mQnnHjisIYKsIhnXNasvr0VZXdVCVTJ2nVIeTKpDAB+
 cvsrXCACySQbIHnrI9qiPG5Kl/rwrKrCIJOb51gbyaJqUutO8zu5gCF1C5AVIkpiVku71icGD9j
 60SlthUuURF7wzA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: eI1XFeMRs2m3-sDp9zJYJHVTuFQlPDGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX7SQk2H1uMtXw
 e2lp/ISz6RZkSEaKUnB2kDH7YR/qSmjkDgpecCbdXPhh7hej6hlrobq/rMTnfRbRNLTNZgQsSuu
 oG3rgfCA/oB8xBwdOXLcv/iZgBWt+UaWXZOHm2AAYHhS9FRaWd570NY3odrM8/Nfu+udLA6rNf8
 6IUGtgIiI+1tEBiSn8YRsgJhTJJIFLTA4kSzlPXuQvv+9zmeHDAVvqizzhJnhGM4433g+IRUtDd
 C3ELyj/DEHB2qSpPhiAADlGZHKdZQ2T0ei1MQhT9zf09MABsrtWWidRG6ql+gmPdqc5Uh2rng2/
 FiBphGuR3T2UOzf8zdRSCK0bFrxgsrfqxlej3cVVxBIH9p4KOKyQeRbSItr/ieRj6lZEUhPX8rx
 EmKFKom8yACaqinGDzAkMuoKC86y8xAVvxnIUavlRwB5WKprcN+bZ9Kosh1COWBkOXXqWImegDS
 j2mNuFhVRN1As8Tv69Q==
X-Proofpoint-ORIG-GUID: eI1XFeMRs2m3-sDp9zJYJHVTuFQlPDGf
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a070d6f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2cCFUbKDXYVN_WJ3cWAA:9 a=dKjGhJZ7t35VoLMX:21
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123
X-Rspamd-Queue-Id: 9599854FB2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107894-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

There is no point to allow selecting core SoC drivers like interconnects
for Qualcomm ARMv7 SoCs when building ARM64 kernel, and vice versa.

This makes kernel configuration more difficult as many do not remember
the Qualcomm SoCs model names/numbers and their properties like
architecture.  No features should be lost because:
1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 871663bfd094..b2c4272ae48f 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -11,6 +11,7 @@ config INTERCONNECT_QCOM_BCM_VOTER
 config INTERCONNECT_QCOM_ELIZA
 	tristate "Qualcomm Eliza interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -20,6 +21,7 @@ config INTERCONNECT_QCOM_ELIZA
 config INTERCONNECT_QCOM_GLYMUR
 	tristate "Qualcomm Glymur interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -29,6 +31,7 @@ config INTERCONNECT_QCOM_GLYMUR
 config INTERCONNECT_QCOM_KAANAPALI
 	tristate "Qualcomm Kaanapali interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -39,6 +42,7 @@ config INTERCONNECT_QCOM_MSM8909
 	tristate "Qualcomm MSM8909 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8909-based
@@ -75,6 +79,7 @@ config INTERCONNECT_QCOM_MSM8953
 	tristate "Qualcomm MSM8953 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8953-based
@@ -84,6 +89,7 @@ config INTERCONNECT_QCOM_MSM8974
 	tristate "Qualcomm MSM8974 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	 This is a driver for the Qualcomm Network-on-Chip on msm8974-based
@@ -93,6 +99,7 @@ config INTERCONNECT_QCOM_MSM8976
 	tristate "Qualcomm MSM8976 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8976-based
@@ -102,6 +109,7 @@ config INTERCONNECT_QCOM_MSM8996
 	tristate "Qualcomm MSM8996 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8996-based
@@ -110,6 +118,7 @@ config INTERCONNECT_QCOM_MSM8996
 config INTERCONNECT_QCOM_OSM_L3
 	tristate "Qualcomm OSM L3 interconnect driver"
 	depends on INTERCONNECT_QCOM || COMPILE_TEST
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Say y here to support the Operating State Manager (OSM) interconnect
 	  driver which controls the scaling of L3 caches on Qualcomm SoCs.
@@ -118,6 +127,7 @@ config INTERCONNECT_QCOM_QCM2290
 	tristate "Qualcomm QCM2290 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcm2290-based
@@ -127,6 +137,7 @@ config INTERCONNECT_QCOM_QCS404
 	tristate "Qualcomm QCS404 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs404-based
@@ -135,6 +146,7 @@ config INTERCONNECT_QCOM_QCS404
 config INTERCONNECT_QCOM_QCS615
 	tristate "Qualcomm QCS615 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -144,6 +156,7 @@ config INTERCONNECT_QCOM_QCS615
 config INTERCONNECT_QCOM_QCS8300
 	tristate "Qualcomm QCS8300 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -155,6 +168,7 @@ config INTERCONNECT_QCOM_QCS8300
 config INTERCONNECT_QCOM_QDU1000
 	tristate "Qualcomm QDU1000/QRU1000 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -178,6 +192,7 @@ config INTERCONNECT_QCOM_RPMH
 config INTERCONNECT_QCOM_SA8775P
 	tristate "Qualcomm SA8775P interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -187,6 +202,7 @@ config INTERCONNECT_QCOM_SA8775P
 config INTERCONNECT_QCOM_SAR2130P
 	tristate "Qualcomm SAR2130P interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -196,6 +212,7 @@ config INTERCONNECT_QCOM_SAR2130P
 config INTERCONNECT_QCOM_SC7180
 	tristate "Qualcomm SC7180 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -205,6 +222,7 @@ config INTERCONNECT_QCOM_SC7180
 config INTERCONNECT_QCOM_SC7280
 	tristate "Qualcomm SC7280 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -214,6 +232,7 @@ config INTERCONNECT_QCOM_SC7280
 config INTERCONNECT_QCOM_SC8180X
 	tristate "Qualcomm SC8180X interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -223,6 +242,7 @@ config INTERCONNECT_QCOM_SC8180X
 config INTERCONNECT_QCOM_SC8280XP
 	tristate "Qualcomm SC8280XP interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -232,6 +252,7 @@ config INTERCONNECT_QCOM_SC8280XP
 config INTERCONNECT_QCOM_SDM660
 	tristate "Qualcomm SDM660 interconnect driver"
 	depends on INTERCONNECT_QCOM
+	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
@@ -241,6 +262,7 @@ config INTERCONNECT_QCOM_SDM660
 config INTERCONNECT_QCOM_SDM670
 	tristate "Qualcomm SDM670 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -250,6 +272,7 @@ config INTERCONNECT_QCOM_SDM670
 config INTERCONNECT_QCOM_SDM845
 	tristate "Qualcomm SDM845 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -259,6 +282,7 @@ config INTERCONNECT_QCOM_SDM845
 config INTERCONNECT_QCOM_SDX55
 	tristate "Qualcomm SDX55 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -268,6 +292,7 @@ config INTERCONNECT_QCOM_SDX55
 config INTERCONNECT_QCOM_SDX65
 	tristate "Qualcomm SDX65 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -277,6 +302,7 @@ config INTERCONNECT_QCOM_SDX65
 config INTERCONNECT_QCOM_SDX75
 	tristate "Qualcomm SDX75 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -287,6 +313,7 @@ config INTERCONNECT_QCOM_SM6115
 	tristate "Qualcomm SM6115 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6115-based
@@ -295,6 +322,7 @@ config INTERCONNECT_QCOM_SM6115
 config INTERCONNECT_QCOM_SM6350
 	tristate "Qualcomm SM6350 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -304,6 +332,7 @@ config INTERCONNECT_QCOM_SM6350
 config INTERCONNECT_QCOM_SM7150
 	tristate "Qualcomm SM7150 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -313,6 +342,7 @@ config INTERCONNECT_QCOM_SM7150
 config INTERCONNECT_QCOM_MILOS
 	tristate "Qualcomm Milos interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -322,6 +352,7 @@ config INTERCONNECT_QCOM_MILOS
 config INTERCONNECT_QCOM_SM8150
 	tristate "Qualcomm SM8150 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -331,6 +362,7 @@ config INTERCONNECT_QCOM_SM8150
 config INTERCONNECT_QCOM_SM8250
 	tristate "Qualcomm SM8250 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -340,6 +372,7 @@ config INTERCONNECT_QCOM_SM8250
 config INTERCONNECT_QCOM_SM8350
 	tristate "Qualcomm SM8350 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -349,6 +382,7 @@ config INTERCONNECT_QCOM_SM8350
 config INTERCONNECT_QCOM_SM8450
 	tristate "Qualcomm SM8450 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -358,6 +392,7 @@ config INTERCONNECT_QCOM_SM8450
 config INTERCONNECT_QCOM_SM8550
 	tristate "Qualcomm SM8550 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -367,6 +402,7 @@ config INTERCONNECT_QCOM_SM8550
 config INTERCONNECT_QCOM_SM8650
 	tristate "Qualcomm SM8650 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -376,6 +412,7 @@ config INTERCONNECT_QCOM_SM8650
 config INTERCONNECT_QCOM_SM8750
 	tristate "Qualcomm SM8750 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -385,6 +422,7 @@ config INTERCONNECT_QCOM_SM8750
 config INTERCONNECT_QCOM_X1E80100
 	tristate "Qualcomm X1E80100 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help

-- 
2.51.0


