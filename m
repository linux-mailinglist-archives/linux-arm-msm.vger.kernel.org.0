Return-Path: <linux-arm-msm+bounces-115517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hr4QKnz2Q2rMmAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:01:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4381D6E6B5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:01:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kjCIgoiO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Hg2MuiO3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115517-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115517-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4550E3019463
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD393D88F6;
	Tue, 30 Jun 2026 16:57:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5B93D75C2
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:57:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838635; cv=none; b=qBPttuwlSRtYsyc1rqQywNMH7FQ5qLzrw4m0SQF+temK9y0RoKHYXab4J5+rFjtQDaTzd+Ztou2J630KRj+7bO58FdYHSDy0MdsrtbGacLlg/eYgVO1GSMnx2xMvkZdRygHIzzo2Mc4td/UCMyaJ2bLpesqcGGTTOUvUEDk7mMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838635; c=relaxed/simple;
	bh=6BttG+pYAFRWMP0PrYr5zLGMt3juyzzxnfIq0WOBgHk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ul3Iex8aJDq93P2AHZJceZUdUTuv2kYjkEwKrk0aoJzzM8qFAJ3LJs2T9cGTlT8S1JjO7Xzvw4hJC0XYzJAaWiuI0vVx3zh546keMyL/06rR0zsh4rIk6Xa+SXHdxuQFMa8HCLv6va8miwI3JQIly+CTLnZVMkWClU8RKAaN1L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjCIgoiO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hg2MuiO3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UG47jm2482291
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=021fetJp+lEcp5FtkRBTh8oWI63wPki+tS4
	subRFo7Y=; b=kjCIgoiOWu6WVKH//7HmzRxG1mihS93SES6s0aGP9NrPJuQS1Hy
	/lKI5pN30EOvAzQNGC0HiATy8PxyXYqoZdnSjnPRgcHF2j0ZNgvelHKF3s/Bqbo2
	hjNQH86eaC+Vetd/5oeHgYhw0w3Tnq8uQTbXrGQy0f0LEsOwr/z+Oa/uMN5eTp26
	piilkGHcwsCabEhsWuximaga2i1UYSWuhsaTL2rYAcUqqRvfdoSvr8MAYNoeC2cO
	SX3S58uvY44Ss34HTf+vRL+Cfd7OVCpntDxyGrWnlExqF3s0S3awCsiupYSdHIp9
	0bbRBq98Sm2NhYbq4Rau8RW3WMKtzPxJJng==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0ar8xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:57:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30b877ee493so1379095eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782838632; x=1783443432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=021fetJp+lEcp5FtkRBTh8oWI63wPki+tS4subRFo7Y=;
        b=Hg2MuiO3NcntObXfIlT+Iz6V9QFXMFT0k47I2R745VaQX+ml99NIdhfvbxAr798IJM
         yP7dMtu1L0T1h9c62MHKA7aaJiXiq3B1S1pLxD+520kgt6i+YpCGhqRydu/IAg8oqTtF
         N52rETrDaiJhsfGN9JJJEvlG8IKgOqbiqZgbXMBnsC4ila8PJoqXx0HIP4Vn5NnJC+uE
         T4HPJzexKKSsG4qYWA/7xOPZ0soS2YhNKMkM7857x6f6wuip4fM29elzHv0uMwVunkcU
         edVEA61F7X1PDt9OY13px71OJIL9rVnKXwOzbQZcw3/uMbFUsL/rpEtJc8BsoltpBKmW
         6DqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782838632; x=1783443432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=021fetJp+lEcp5FtkRBTh8oWI63wPki+tS4subRFo7Y=;
        b=qDoJJSMRV+zsMmcPq5Q+3LMDE2XMVUZ6oxp1nnyv8yHZ0SMUWU71thBs/fkOhsPr8l
         s6+tHD/fzdNWbMlNR0al2wh4u7b1pOMBgXrB28/GP0ytXM9Y1mi1ls96edHe6VgxoE7x
         lTdkZ8Xm0sPBRNMHx+SIhCF6dAmwPn0yiuaSaqsk3bOlgFvIPwP1uyu9SQ0gA5tZ8Ndo
         /2tqYqF7q8fZefC+IaI/EVRKZy4aO/WtYBsvNr2La2JxP+UUk7SjhHZYpvKcAHNy3qQo
         6QOQbBNz8snRrqxPELSmvwvlyitV8YrhhDF6jLKNkpSCmzMTJuGqIxTvw05cPmSXQZsC
         prtQ==
X-Gm-Message-State: AOJu0Yz1qgqiNXUWiCr+RlYl95eXzRzhbhG1S4u/NlZ1+3WPA29Nec6Y
	ivW8CAz1XgaoZ0O8M4cvJAKam+2Oy7q8690DvdqHp1IwdYyhS4Msa2IoBVPx126NYs9ZppoAwDV
	6utLZv1OnWddA01eglgeDhvs0Wuyai880R6VZcLH9hbFj57zpcWUWEt63mtLZ0eFjuwIi
X-Gm-Gg: AfdE7ck1j8JUVfSOMxdQv/OJ4oxcVRC8sfiH/oCGRhwl8ZMhD1st1BreNObaZ6tjhEq
	t1BHk1INQFFrZXtkAggvXOkl1fG7CRYBhueYd7J9/JK4AULjJWAcTM7rzUgF5VS9s60DyRyH53W
	yPGs6jR4rplGHQN3bhoXehhSdC509Cfy+AyEWtiUNaGHs4/tqCKB8ogUENFrZbzccM7ym2a3eGq
	zWaXP8smG5/NFEazCPvLmCaPC3fTmlMR8gZqfCCvHUkKxF6vweM9ZHA9l5STECDYDLj1u6Tct73
	dzPJATkIkrRyqoT+o1xVoMXkuj9cg6Ciz5dYpMj7AabmYo3ArCTZw5IfWg+a4vO7HArMykrUwvx
	aDEiZyOE4dIl+Upa3+4iZ5JZ+UuPXuZQizlTKfiBt1KKi9Q==
X-Received: by 2002:a05:7022:6ba5:b0:139:ed5d:1b53 with SMTP id a92af1059eb24-13b2e32c0a9mr1683455c88.20.1782838631991;
        Tue, 30 Jun 2026 09:57:11 -0700 (PDT)
X-Received: by 2002:a05:7022:6ba5:b0:139:ed5d:1b53 with SMTP id a92af1059eb24-13b2e32c0a9mr1683429c88.20.1782838631472;
        Tue, 30 Jun 2026 09:57:11 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2a9b425asm12690272c88.0.2026.06.30.09.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:57:10 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V2 0/2] arm64: dts: qcom: Shikra SD Card support
Date: Tue, 30 Jun 2026 22:26:58 +0530
Message-Id: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a43f569 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1w3StAHzAm3vCDDRDnYA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: lQaISaSLjCGw49-IGzmK_0frFJj3vAsV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE2MSBTYWx0ZWRfX0soMHlh9MBYT
 6oIU2GcDbEYBxJ4RYl9r98SrrMXcLG7uN2JfR4R82elQeOBNutkpCVQPeaCp2EbqaWQjGMFMU8x
 Xc7Z1MgQHgnGvpxscAwvNXMaUfO8W1M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE2MSBTYWx0ZWRfX7XUPfbHLHy9V
 XxQo3e1P8L0JgDG1JjpfQakD+xwgzdjxhsY7LL1LPfdYeYCEZjIlk4Txr37a47khlwz/sCf9bAp
 3GPN6XZJKHoIStwqr8DZbjXD5Dq7AomBIflZBopcdAPsGjtUG0YwZ9Z5Qq4DgYj4fvZET0xd90b
 LvYM6D1hBXeiCGH/SSXvM0l7/yXi5XUtCq1qoTHj8tXRLoytG6b+yUD85ymCNknn07gfDRaYCvx
 2pjkdwUK6V++dD+2etoDcxSwDligyuuhxR/yrhU4UexRrBN9Y4VvPAlYZ5qJhTTrekD99Ql8NxB
 amD+7FLUGJjoVMsqnQ9h0HZtlx7+oxhGLhss9Rl5ODWJDMCrt8hSIVH1UpDms2ISQKsG/hT3YkN
 sgptYXUbfsVrLA03vCgAknN+3laW8OzZuIChzrYZFyTxaQScwRZHE7gNb9NFS5vjTnV/Hg31Ho8
 v3npVEEFCxigFcgBfGw==
X-Proofpoint-GUID: lQaISaSLjCGw49-IGzmK_0frFJj3vAsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-115517-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4381D6E6B5E

This is v2 of the Shikra SD Card support series.

This series adds SD card support for the Shikra platform.

The first patch adds the SDHC2 controller node and the necessary pinctrl
configurations to the base Shikra SoC dtsi. The second patch enables 
this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
the regulator supplies and the card detection GPIO.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Changes in v2:
- Rectify the alignment for clocks and interconnect properties for SD
  card
- Link to v1: https://lore.kernel.org/all/20260604122045.494712-1-monish.chunara@oss.qualcomm.com

Testing:
- Validated on Shikra EVK variants.  

This series depends on:
- https://lore.kernel.org/all/20260612-shikra-dt-v6-2-6b6cb58db477@oss.qualcomm.com

Monish Chunara (2):
  arm64: dts: qcom: Add SD Card support for Shikra SoC
  arm64: dts: qcom: Enable SD card for Shikra EVK

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 97 +++++++++++++++++++++
 4 files changed, 151 insertions(+)

-- 
2.34.1


