Return-Path: <linux-arm-msm+bounces-103870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH6DOvX25mnr2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:03:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC8436257
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A72F630067B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 04:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED8B1A6803;
	Tue, 21 Apr 2026 04:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Smlu2jZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3o8DvWz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD51419F11B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744177; cv=none; b=I8seN4fWJsXlngumLiGyYHe3MCL4sCgiuuCUjcPNhHd/K/Wel+swQttB9Wc6AtRGYpGgjqrtzC1Qe2EVSHnCpIEz2h1McNFAUdYRKngzq2sxp3xFikqIB4+/cE/uuJWni+f8nuYB3YyeFWAK/qgHQ/eMTNBZJ5Q5rHqlCE/vZ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744177; c=relaxed/simple;
	bh=ekwK6SWkg9RnsqKgPm0gyidXKkH8LAkRP8f3NpmOCKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q8tlTfiJ3EnumoEDSmPcxBDLdsA9YngdkEmgGqv/uL2CMi+mhAO6p4WK3/ReKiSadp5qAlbf55KgjOfgSWKVSqY+OZzqgJ4bjwTLMzELKtNf7qRuVeXdBhdDS4828d42br6SywFDukC8gL1lGhyf2BUxBQeomWl5/An/pDRKbsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Smlu2jZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3o8DvWz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KMgst01127100
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=szAfKyszr8YVgvZDPe9I0SQ55Pnh8+psxXQ
	HTTOOQ8o=; b=Smlu2jZRX8yBvkYH55s6F6QeGyP7XNqiBeTF2j0l9few+MsgLV+
	k7NmWNTeNw2lR7y0Hdws53OmCw3y+S0NQsjzPRdde3G2oB+s3P/hAYuCfRSuOR17
	ZzPqQQdVChdcNGAerVKiEfGz00desDuKwEydFpYE9hwJHuMRjizSyUA/TVHgB/KR
	REjNwWf4FdJ+cNH4KNmDveGKRcgcOE5maIpcncu2yBa0tlUc3exk2A9+tupf5b1T
	VWawsES7n7F6XDu/fu4DmNfi0J2MSlaFqu6I4Xx7wf2uYc4/15WT1W3PE4fIYojV
	oWoF1rVFg5MertnK78xObrHH5eHEyc7AORA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnw68rspn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:02:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2dd1c74508cso6610409eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 21:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776744174; x=1777348974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=szAfKyszr8YVgvZDPe9I0SQ55Pnh8+psxXQHTTOOQ8o=;
        b=M3o8DvWzocmUqfxtMoOY89LArDWcPxxmvBx65AyDxdH/T9P38DAeRCyKBnjwjR6vw6
         ANQctWK34iu2W+fhotx4giD7bwmAwkzTSb+XMFoM53PU8GOpwkuRIvTc87G22gNG8Qkv
         TL1iqtfRRn0eCoUe8qEusK5K+9EKL94ImuEpvq5kSnCgDSLqLHOJJuHP3Ivm9B7gtuxC
         MEiIXi4W8DA3zgDqsSQVKDdWY+cfbXPuLYRxB8r40QaDV4a4ZWODUQM00bXJH202jCvW
         RnY64J57YtQc2q6/sIKkLkODJ0uNdtrf/ojfK3Vq5LORx+/lnVnV4Wa0uBpkZowRfRRT
         OWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776744174; x=1777348974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szAfKyszr8YVgvZDPe9I0SQ55Pnh8+psxXQHTTOOQ8o=;
        b=TSfe0Pq6JT+6Nd6a9JL7yfT7iwvP01wOk/+472/ShRAwszjAfXdEdLtDHayCZ/T+TT
         qrOm4Q7QaO4UshgjCUVvqe+05ObkydYdsWb+fB9GQ/GaE9zz0RbDdDODQU/eddG33tS8
         2gUxayOp1fbHdeIKyuEy04t/p66ToMaU+3gn1D5dpf9VZzie7nQZ8q7ZyqyRA9sPcAgx
         4efROy6hVp83bFjTSFH7Uq2dHyG7U1gTWz4nsT6TmupL3tTw5ArZS3Fybbvco3lMaNlG
         +z9YJYtzU1VZp1wGg7y7OBGOLURm+iYzMjqwrcjjj91cn44TEdhGiAlxpTu1cMDnNCRu
         6rag==
X-Forwarded-Encrypted: i=1; AFNElJ9pBhpSwzePWaTZ+YoKvoUEDJPgO3NiK83FWxSJFIL3IOU54SzRNxLyAjn6z9PyFkVd3uEZijQyJKyC40aX@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZI6Y1zJ/QtfqhqSklFQ3zxKTUDmcN3Azdk2+ZDcCNOU2F6WQ
	9oxXDOWZnwnfGw/xLzTsFjclUW8PU4lP2fja10mwuYYWRaNy4eyCG+qpk/lqWP8U8baVLcHtBeP
	Te+HIRZeE4lPjogcWKZaaS0WX/y46Fmhhqk+9UrA6sb8gGNSx7rINAO3gmhI9QfyBGRxe
X-Gm-Gg: AeBDiet3WHrgy14Mvz6/nKhEY8bRN4ATmxc+uvoqSeimy4WxDUmFtGW8RNao+Cprchh
	CNYuTOwSHkWj9d+yO66epLqahFMszV1YiI6M1LTsHeSFO9SgaifpFnkG7z0Rb5rbY8Jxnaq4HEj
	aGMMpv4tz5rx6Z1ysV4gsExJOGvACeKDwDHRU65tZJrVMRmdyvA5fLosldrLQeZTwXsmDE1UXbw
	dpq++yMCfool3Ktb9HiQ8w7kxK6DL9C9l8erSEZ+Ay10r8sWVE5ljupM8ijDBhSQhkiRJ1irATM
	ItvDNNWlHQEX7VBIrTYI0tDHFey//BjYCA/5MuZse/RjIp/zVh8HHORqRzCM3g/pEvNFbBU9/3Z
	aSYRysxoaxb8DUOX0x5WVWs4krPJj1uY1/nVrXI2vCh2qa8Udu+LMXdqQQ5iIzY5JJjRSux4t1j
	pAstLX7dx/d9m8ZZkc
X-Received: by 2002:a05:7300:fd09:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2e464dad10cmr7601565eec.11.1776744173656;
        Mon, 20 Apr 2026 21:02:53 -0700 (PDT)
X-Received: by 2002:a05:7300:fd09:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2e464dad10cmr7601545eec.11.1776744173100;
        Mon, 20 Apr 2026 21:02:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a7ff1sm17386359eec.9.2026.04.20.21.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 21:02:52 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] Add SoC ID for Nord SA8797P
Date: Tue, 21 Apr 2026 12:02:29 +0800
Message-ID: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tt5u2ZRadJG2eloOobbAtQuH7tabbQwO
X-Authority-Analysis: v=2.4 cv=apyCzyZV c=1 sm=1 tr=0 ts=69e6f6ee cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=lRKjNYthlYtEnXt_nToA:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAzNiBTYWx0ZWRfX94+9avnQi+hO
 spbPfuBL1mnmsbtFbN+s4vAOfBNkFn+xVhuYIj5SAKZR8ut2oKTVk8tD4UGsGYNW9cxvL9uHzD0
 J5bL0kIDfx2IPtasUq1amQqv/klyiLgJaeGUXH3eP7qmyEOQ1YFboL9fYW6Wt/qz7NK+k4lDAVk
 vxIBGuSKQp3fBe8wdvX3G1C3c6PLwrLdNkeP7Q5hW95KNpsKy53+ib5UIsRyRQbbzMpnRIaPOXB
 fzvrf2CAJJOxpkkAKgxT1jEZ0AVhs4o5EkJn+2TA23fx2edyZIH/ZCD7jNRt4mg+jLfTEs/U0Bg
 C+ZTmb1UtN0DUGVf+yUHMGw2RlEO65v2Rx9VMCCI0bBF6eeg4OHcy5+yS0nUNi3Lp89P+hfi4UG
 j9A5tKXAGsKv+2/K8tP1a7k6Xw39Fpom8gzHeiOAoF+D+9+Fh5XWaqkePakizyAUdAqN+ni4osa
 K3NgpOKqVoo43Kzgxjw==
X-Proofpoint-GUID: tt5u2ZRadJG2eloOobbAtQuH7tabbQwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210036
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
	TAGGED_FROM(0.00)[bounces-103870-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46FC8436257
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series.  SA8797P is the automotive variant of Nord, where the
platform resources such as clocks, regulators, interconnects, etc. are
managed by firmware through SCMI.

This series adds Nord SA8797P SoC ID to dt-bindngs header and socinfo
driver.

The SoC ID of Nord IoT variant will be added separately later.

Deepti Jaggi (2):
  dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
  soc: qcom: socinfo: Add SoC ID for Nord SA8797P

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0


