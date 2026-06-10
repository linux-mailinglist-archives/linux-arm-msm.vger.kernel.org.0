Return-Path: <linux-arm-msm+bounces-112364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eZrjCIcnKWqQRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:59:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B3913667887
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:59:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I5zLGlEh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E2l0fIqi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112364-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112364-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDE103078944
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C703DA5A5;
	Wed, 10 Jun 2026 08:53:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7546A3D9690
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:53:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081582; cv=none; b=bTYzXEH0kcQGf9AqCYGszqmIRv/le4s9Dc2juA1gn3snqz2emltyLV6houxnURFxiBPoQZdRusqicF+befFgCdKfLHHR589KAiRqJuFOjVVL2qfXCEHkBhF2AuTmEhsWex/OPkXXfj7GrGZuteakUGMHW0liHrgXZf7vy8ajreg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081582; c=relaxed/simple;
	bh=Er+6CpPP1ags03vijO+dnfrgarxZPqsc+RHLcBYp2zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpUVXLOWSR4PJhmmgE6MiWZHzsL+RPiB5qQvP9xF9oZcprsUe42LddPDOSLahBIALImOIuthaIytH5qRMlRntb9JfbgccYWXVXRBvfKLikYGtuwp1cAEd3h2f3YW6Hd1JzYq4drILfM1Wxu7iBNugW/GQYXy9BkjOYEvR+BUWz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I5zLGlEh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2l0fIqi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hnTS530332
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=; b=I5zLGlEhNhmMArLo
	xScB9BRdbFxzmPwZiu6nYT4n9EKy8qkBiIl7X2tqvmDQdasx1daFB1a2WsbqIBaz
	E9W6LoJgrWghQoN0uqjzfAKCqSMKGzsh96zMLtNOnOKrmBmjbVv6ry1KjpTVqb+7
	gN8PuVsmcKXrb8LuULVDj0+qB00zK/YJBQMgpmbAlTSytWkf4el4/K1bA2Fmo9Kk
	EXlgZry4ktwTcf4HGpVQcyjBVcG9y7XwO1+ziuYVxA8jen0TECqSjG6AWpM+40RJ
	1ZOZmLNLyHPUqgWQNM5xaMQ/mhRmWi/1F/biFcmJMsFDeNlmqwuWQMvqeSlCgRja
	4ExBbQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2hk3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf160f7191so38806795ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081579; x=1781686379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=;
        b=E2l0fIqiqrc6nW9VozZ8GI0mrMjjCmWv4CCCRUKvizFAoxxDz6niuk7dqhU5A3w/cZ
         XVs1cuVqcxPEgLT6pboeH/xCB9IZ19/k6BHKC238F3+JfQbuXW0krVeaxKdoLDjp+x6s
         meyFxSwIxp5wi4zdsbrsPthWQCTlYSB8FvFkeZa3mds7Shh3pwnjPxZ5K8q1ZwZcjUGC
         +zRTUY2/rzmvn1O0Rmrn8g7gAv2g2zHJt6ELQQ1UUzqDxogWz0+is8E25Dj/T8MadZhg
         qzC6oXFYTcozW1r01ZmJElr5IqB8LcnGhd0x7JQ+p3bBfgx6wCG5tfTnNvccgAlnGtAB
         5Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081579; x=1781686379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=;
        b=C+XjIkNKvwImX841XvUdJbuC5yMXFAqT8BRVqOJW65l3qR+n0t7FDWqIaDR7SY6B+k
         EElrtIJiYHWr1H+hww+DWE2EIv7hPYVZAtqUt7tq1C0Q9gcpRZSZkamgEg78buLLKxy9
         xBXlHq1PjDS78IrlZ6tHNQIosMf4GXkjB84Z9++fjILKlTtZVYbzPyE1B5pNnbuL7xZ/
         3Dj3OFeq+ALUXGsbTFR/EMbkBlIwC60f6p2mxsyBkAr1vdsty21Pjy9MvcCQMfSbMkdJ
         Ox66MpjrCOFoRzJoc05N1WoEL9USumraJZF8b4mKiAIs3Q1JSE93Z8hHE55gMHyrgmeF
         0jQw==
X-Forwarded-Encrypted: i=1; AFNElJ88iaLtjdBip9y7rUza8/5HjltVOOP7wVhyAeydF1r/oI5RDkcq3Dk/0OwQBNaA65Taz7yF1hHncCnGo/xV@vger.kernel.org
X-Gm-Message-State: AOJu0YzWljpI7O2onBIcQD1b0B8Zsi9MzDGQoccC288j+5yHXhugTHFp
	dYNvUo5e1WKoEagnr0opFi6tpBf2diWouw50I+aAO9KXcA3OEEi+R9sLbWAZyS0dqngCr4KXbAb
	V4SCOs3niNUIR9K25gbNlKHUxOZwGtGaR5qQnD2YqcEa5ZHw7zKkWdeGZ0pIOfl/YLfFZ
X-Gm-Gg: Acq92OE92jKNeDZMey/ynLkYH1Zd102OXWLXMNtUl2mbgB75u1jGrs9ta2N7rxgLwii
	Cv7SnPSR+kZTK3D+6OCl2k1G0fu2DdE9VgsWNYvg2HRy4kQ7AWfc7fzOGGA/ONLaL7PF/YZosUn
	qNR7Y9VVoXFK5MDXEbuvGywzm8SwhyZXbL236X3gSGZ/saeoT1WbdZo9DOCkC9DljK1BPhOQFys
	6FOIdoaoxy8Gjj2OB8wNuCtccWfcGMzMUSyBmccnGa0VaqdKSbT8keCM51wPvxaxdvcabEpLmfa
	Mcp64dVoMXGkrK3PZq9UMEb+51g74y5YNUFiO2wuepsDeGXAHJXSyfmAWZ6nJdR1hN+3FsXY9Q2
	8zNofRH8xHtacBFNQySM1YF7/s2YqW3x5viYzi4W0Sj9KR5s2OvPD1GfvKjZAt5Fgbc0kbXjsJO
	edTmv/Fsm+H4moQaXte0zhzrQXA+BO7xrbGTtvXvRx+qqZOIYlVLj6IKhGn7s=
X-Received: by 2002:a17:903:41d2:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c219825471mr224351675ad.21.1781081579144;
        Wed, 10 Jun 2026 01:52:59 -0700 (PDT)
X-Received: by 2002:a17:903:41d2:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c219825471mr224351445ad.21.1781081578690;
        Wed, 10 Jun 2026 01:52:58 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:58 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:36 +0530
Subject: [PATCH RFC v7 9/9] arm64: dts: qcom: hamoa: Enable
 LLCC/DDR/DDR_QOS DVFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-9-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=1003;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=pXpBJ2FMnY6lmbenFJPBDk6Hui+mpMlqsnwiYYUFJmo=;
 b=uT4AQ8s4GwpWbVI++rigQjrmSyRqAQMCzp8wBbLKhIUF3mfkUffjvFW1pE/JgbPI1qyccp7MQ
 4sSndpiP+qnBIfJzgN8ufxlztds4HuRMkws/Lip7QRcUDuuys14yYEs
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a2925eb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8E_iI_7X9U7aA52Mj5gA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX+qPn/EfiDrdX
 rkFks4U8K5yxGxr2xvz/tLdqK8b/+37fFsL+y+G8JVqccpq9plnWmTRive2pOD+4nm9i8vjYLIn
 xE8xLr+znEwdObYEEp2ykbGKfUR4BcFeVrcBV3TxQ9MRtaA7KtCNe5yEZebn1IVy2nQft3E9G6a
 A2N8CqcAQik9uzGbibmdmOvyHfuxhYFAnGMLQK6PhGN5zyCzkubfGpaZ0B+fUjAPQ8HmCcxeV2U
 Q4/V8On6pOEMD4YDCyh1UhiDbWrOUHLWxtJHAYjZhehU07HLE71Wj0f6+r5j8IfZEFOg9JKvJmm
 T0p58ofUoOI9JxscmxUqFVQUw24lK3fzxmzEJHFWIWUjbcV224aRg878MPq6et8e2NeIkreZho3
 qkm7XasNUkHj8t7A+nGww8+b2p/BC2Wwn3m0SBSDh0CbMYcEwdoo9dgAgxOuuI1YpGkJjr/Hazr
 umPikI7eEsMptr4xGbQ==
X-Proofpoint-ORIG-GUID: Q9-yiCvONj34lhKQw4V-k7e6qqYnSjSc
X-Proofpoint-GUID: Q9-yiCvONj34lhKQw4V-k7e6qqYnSjSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112364-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:pragnesh.papaniya@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3913667887

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP) and are exposed via the QCOM SCMI Generic Extension
protocol. Add the SCMI vendor protocol node required for the QCOM
SCMI Generic Extension protocol to probe get functional bus dvfs
on Hamoa/Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..abd3e4bb9372 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -338,6 +338,10 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
 		};
 	};
 

-- 
2.34.1


