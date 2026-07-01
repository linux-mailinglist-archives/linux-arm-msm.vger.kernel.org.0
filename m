Return-Path: <linux-arm-msm+bounces-115562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yYovNUB0RGozvAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:58:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 321136E9255
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:58:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NOl5BNY2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TicPrjdT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115562-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115562-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08B0031193EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 01:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828C440D574;
	Wed,  1 Jul 2026 01:54:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACF8361DBF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 01:54:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782870890; cv=none; b=geI0dmKqJLLHEmr/6PLPNJysVcFa6miPw+jQg47cX/QgUn/e8/zBIL3TBzTmmMIWoV1dsv2MUi4eXk0SKJwzGWidVH9QnMMkVA7YA0/lPZ2kQA61cFqQDg0DExxqJPN/V/bDMphMvH0Hdk8lYTJ7kEwm5GXrhA+Idj12Chag0O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782870890; c=relaxed/simple;
	bh=OBSctkNoPUXkv4iIPY07zyqOMNxZfKUYjyMh/aKW2us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VlrX8xomwEFvT4elPc4KZbeUQ/F4h1EJR9XE7SAUGjLNU/IAQHmERYu9eRnFR8cNNIO7bed/ieDg4tjT/eoRdjCV24naiArsizRCiz1O0vcFsNxxb1E7/w/uO090FvJ0U97xHR1vRdD/Un+EgAx8EhBj3MMDnNDpp3ywGFy4mOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOl5BNY2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TicPrjdT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6610uUCT3682311
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 01:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YC26FmdTmn0Uux8AKzau08ESZRvbLNzgi/lvhbTZq30=; b=NOl5BNY2eMXlZxTz
	KmSPPi/syXcZzrooD+OjW4tOGXhJ8jAFFExHKGmd5CY1SveoQ91VlbCeJvd+FT1K
	pGXY0yMg/64K9o7u9WqBaddb9GvM2iFpeCGxhaZKWjywaRJSuTjeI5i8wC0QKNc0
	WP20RJc3bmqe14dfMy37L6W7sxhKu2knKGasyo1QPH7Dy7sP6+3tLAASYmcjhaDV
	P5uvF8OdCDxnru2MzFc/dML7/NUtZvNInWvSOMdKL2H6CdKwmvPVsiRqv396AM2a
	ph3l+qWOQItwpQ2vZTUqjYbiWldQk3zHZlIA+Iu0UUWIddiaTRW5fmkRo2bjoVz6
	ALpb/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy04qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:54:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c8e14ebb2aso4709465ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 18:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870887; x=1783475687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YC26FmdTmn0Uux8AKzau08ESZRvbLNzgi/lvhbTZq30=;
        b=TicPrjdTakCRyOJqqt6T0BwLuSZ5D+yjQQT3uXztzF4LwSDC5+hX9TYIobkAv5829s
         f/+u+TRobcjSYgprPpHuQk7n7KHXsn24kNv5bIu+QJcNxvx5pDdzEa6D7yPlFsww7HXC
         GrcZ5W1/St7pUpisg2Vyl9h7J+Vu1tmIaP+hu6uCOPdAygUamw2lf74fzBapmiSpAHeA
         jZQ8fB5qsjdDR/Y5c11SXFxpqFwKvjgUFIHPuHlrMr8apIU2+E9T+m3RknykdDJSoqCp
         jpuWgwgzDk6lUty5F8b6/D4pTH3bbZ3Vpk1n4ZClytubseB2DdVYWmcy2sgxPfYjR9fA
         vrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870887; x=1783475687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YC26FmdTmn0Uux8AKzau08ESZRvbLNzgi/lvhbTZq30=;
        b=FauNa/X3Xib/5hFOFcdIPMjL4SjG/frIx7CEiEKbd/hfe4bUUSgtJMRWTLzJg6ejJg
         XCc+eg2T1YnVfOqBz7zbCOnolsb59CH8TCZ/ApArmPrNXgZhF+mqjGGG7nsfag+uMX/U
         iJ4/MveuSfsXA54WV1SMPf5uRbRR5Ngebq9/A2BQrISc6XO4XacwTUQrGhZoJaXRVyWg
         MCEAW9LbDSqLUpAGWfuzsSxXMwtEVxUwORSRjefDnPqycCfZzKpBjQWk6p+p1HR+iEbQ
         qPMIijYV15dvJMdRMEoBdUA2eBNJmJJRctMeqgoiiOnK38rSMCvKNrWuwiQwsdxEpxcS
         sHVg==
X-Forwarded-Encrypted: i=1; AHgh+RpiPdcwCVsh+N4M8QGJWFigCZcYJhvmtIdp03uQv0j2UwhrJ7IoiqR4f5VBCMvNVg5LKyTr88AwxUHxrMig@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ooeBYRHWfNKEsBo6W5I3afaD2HvmyepXiuNhMMlQkWqNaVDw
	10/qWrPVGwOP4hbSkW17g1ur5YgepmDeiT4qZ1Hf7H3GwmHv23x42RMIW9184bE84G/OhXsWSiT
	e2iOIVoV+Yd/5CZ52sFhH1WEIkB7Xbz6rV1l1aG5Py/au/JM46fD6xD+kirGhOA4vS5oQ
X-Gm-Gg: AfdE7cnCQnECoA3F3cknw+xXwxlslKdMjsz272jPy810yab8waQRR+cFgjxq7YanRiV
	8G4j+vL50V3gXHdqAw3BL3+1HMjE1/L6VDZnOBLVasdaf4YJpeKwdtQc2IMZNcyUdxe5WXsl9N7
	qyJhcjZSrmO4qulxAeGTX5gktQ69RxoP7LZ1XfEJtIVmF4NBJ5Q+vXMLypj/GDfWDlOyQ1xrxvK
	E4iXu3I1ING7LnYHggtpxVRGsYVvPd7hPTIpTJcP988o8rHdIkcvolnfjnkyGsBYTBBaLVo0fmw
	CHnHCr0zH4GOloBNwsH6wRBuMm1xYeYOlEY4TNdUiVpO5HD8SffJYic0SKS8B+zd4rBIbiIxOcm
	Qd9yt9kUflP2cdCi0naxSvlqYHtp9OHZSQMgOwsoWJNezoZgGLA3X1GAyiDE9FwF3OALfb9wd4Q
	==
X-Received: by 2002:a17:902:ec8f:b0:2c9:ece2:822b with SMTP id d9443c01a7336-2ca44889405mr30905275ad.3.1782870886752;
        Tue, 30 Jun 2026 18:54:46 -0700 (PDT)
X-Received: by 2002:a17:902:ec8f:b0:2c9:ece2:822b with SMTP id d9443c01a7336-2ca44889405mr30904765ad.3.1782870886152;
        Tue, 30 Jun 2026 18:54:46 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:45 +0800
Subject: [PATCH v4 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-5-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870848; l=1699;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=OBSctkNoPUXkv4iIPY07zyqOMNxZfKUYjyMh/aKW2us=;
 b=DA3VNt61VJoRRUhPlCsksJ/tb1/he7RYq8J1STLfm51nmK39SVAnVB6X00n0cewpsdBoqJdpB
 JT1nt83u2tRC+Yf5yy+NIYonPjpxkwoJLPlmL7bGr+jjXvozH14h0gx
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: XL-Rfl_kHR25-Fyy1QrwAsusO0U-bfNC
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a447367 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zFLblpEf9OP3IKm3h4oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXwbmOJll6AgMS
 /QVebp1DdS8lDAIy+6KsOwDqdUpS/5B3sjdAjb4tV2r0GUz4JMX1ZMMeHMTnnrgJALg+geb33In
 gDRz0NQtZu7qDtLuEY05sd37aCDaUl5qPqJkUSTBnnZNYfg49E8L7LLzcmUDopQu07Zys/92Ten
 8QVpbi4AzQAgeunpVYMTeEP4CpS7U6WxAhCKrwTF/6yqwRdP0SxGQf17uSWXFZiGimPcOvRWIza
 HQqjRNrgMyVaRv1wY1FIBHiynBwzcZLqc6g1cE1oS69fIWuD3GZ8lNJAyvTyk1ySkGoF0h4KKM5
 W0fuQMCC2tHEK+/lGXElb1wpXSUSV/XR/6XD+HFXLklEqLWsrIzGLyqsIFHeK2nHgnnM+/pS2XU
 pxgAYHHlsdfiX4fbVN19skfSNpWrfi3Gzz36DDwiMfEYTzPuI4yMI1CaztE62p4NsxnzvbB2xnY
 ZkNQke+vrPersT1O7mQ==
X-Proofpoint-ORIG-GUID: XL-Rfl_kHR25-Fyy1QrwAsusO0U-bfNC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXwSDKlw4YW2QC
 qenYFylBx9ohvTUttgSfCIwXgAqCW8Gr60KWZUe5GrzwM6pEkSj/i/6WdxCkwhasdnxOfnM54Rr
 BA3YCOWG8j5JT6r4HcvaH9BcWYUHwdw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115562-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 321136E9255

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It is marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never
assigned an ATID. As a result the aggregator has no trace ID and cannot
tag the merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace
from the ATB sources within its subsystem (TPDMs and other ATB masters)
and forwards the combined stream to the system-level Aggregator TNOC. It
carries no ATID of its own, because the Aggregator TNOC downstream in the
path already owns the ATID.

Switch the node to "qcom,coresight-agtnoc" so it is described as the
Aggregator TNOC it is and is assigned a system trace ID. Rename the node
to "tn" and use the "apb_pclk" clock name as required by the Aggregator
TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..d612e8ed54c8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6038,12 +6038,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000  {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1


