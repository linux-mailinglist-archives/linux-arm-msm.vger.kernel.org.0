Return-Path: <linux-arm-msm+bounces-106249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IScC/Uv/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:23:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B066B4E36E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50FE9302D966
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC4B339861;
	Thu,  7 May 2026 06:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlstpMot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlgH7U9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EF0331A53
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778134981; cv=none; b=cYQRgr0vmW8R73k/J9vbAMU+H1i/DxUVxd/dxx2r3kUtaHZvY57UoNbBXst4Dujuvkqw1UFCEd3K6lVkSIrtdenCckMBizK0z/wY0nek+OmRRmup2w1Fz5fY/fgffsUK2h5W8EIoH0aQhrx2QYf9jEBOlqoR9YLoXO6nz2lRA10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778134981; c=relaxed/simple;
	bh=trIdMNmVcLDiXsKxuYeCux37DP4Z1YDKXeML5xJdrmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kTgttkZkje54L0V19GByhw/XQ4mrOB7FUKme9/Pvecez1+lIlbE1zSF+jVXX/l4UVOudfAhtYrF/jIWK+Fyp5P7hKXoZlsTkcZVUT/7jj6jiEIw+hFEwV9gU1RqdTLLR4E+gSQR68Ds2GZGqRK0/7IcGxqplb5iyIVCcx4e92yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlstpMot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlgH7U9A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wWLG1926339
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fKKG+GaCcws
	0o/B+y8TpDjd62UuzsjpXKuwFWrqTOkw=; b=OlstpMotKKRmmTs2LftnJBMlcyz
	Lx63aETl05jFkKgWKv6Nj+NJMlWQC72VN9PoVYfsy/Xk51G+ywiW04n3/N5CrWh4
	bBlpDZcjZWTXLBm/T761+mZ5imxol6QpvT6hO2JMjLIB/eLXXfjPdAPV6IT7C5Cm
	Esk+ubuI6T5J8LTz0sAwZ4MSQa7+ItXh9BuPnAaOjLTb4ho/7bzgzUYnLa+3iz+c
	aH5NMUxIirZVU+j/0mm2Hut3mhvet58GI7GaaxiYZGQoT5rTGGDBdxA0xsibi1eO
	5rzoaHKl7O+co+KNlmut7z+JDuy7IWPkG4TUjV5SreHIuyQghvrCyJUbPzw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g82rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:22:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8397b14a689so345081b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778134978; x=1778739778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKKG+GaCcws0o/B+y8TpDjd62UuzsjpXKuwFWrqTOkw=;
        b=PlgH7U9ASVy+YlI68M9Q8xgylxuatlrGX6O2kCYseT8VtPWlcHG5pHdrVucqMYoVyi
         6TR5PxhAdZNNYRpvB7LT3FFqrpe1tV+mjx1hHH1oPhV3SSDwb9/DAM6buA92GyZ5obc6
         HAS8Dk5UhwCgxzHxcfPEe/hfa1R8StfosuGvaPqVoTquvUL21bOpuUTYpi6bsFEJyGOg
         OCaoV78hmmSgwsvFa15JAoWSWBH/ek/7jiL2JPEtleKfn3Age5MvUsRaxarsgb8RNbjn
         xb+jAK9PZBiHCpRfOdZDLCPo+VTFrATnyPIZ20Z4vxgd3jdFVF9MaOUhTLJQsGHMUG8s
         9Qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778134978; x=1778739778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fKKG+GaCcws0o/B+y8TpDjd62UuzsjpXKuwFWrqTOkw=;
        b=LdlE8zaSa2hd0F22xTMar9Zm5Dk29lxeM4j36O10+fiVxj65JlN/TSY4/fkt6TCi1L
         b4Nd/sWzXVK0a1zWe+CiV956tt8qlqMTsWoDLIW2zhKgDPrIHKrMfvvibuqkj4vLEW+G
         5rLGBHD+M8BK/VjwicvWzrtrCA1Sv0lzB+ayfQVLxJxXpJy2g9G3L0Y+lVfkdhC+3YN6
         OPqGU85cWVtuR+heR+4PBk47xRcJnaS1/ZpClaMJcgkKW2bbQKccItGg3/4OplEIQKGf
         j2+k2lzGcwVhIvos/ibMTisrgRrcdsmqG1MxmMboYiFUVsJsEYELbFDHvYKAbkaz+9KE
         LhXA==
X-Gm-Message-State: AOJu0Ywb17S2Tq6wOKRRR9H+v+hQrpJiVInYo/EhXFQm/Pw3HjdlpeIE
	3ugO8bkkIcnoz8jeE21nK8fenrV6IsWzS0iyLKJ1Lca0/fZB0uDoHzhDVxk8jA/ubSkKm4ifxCy
	qA2fFERklrDs2PHoVKRHgYRrq0SdlSigwZBit/d0ptMY612OPYdhor0iTHx6ODqVtbVOM
X-Gm-Gg: AeBDietCS6gHPEM77BWEj8O8ymvbF6COA0dfhYzyITBO2f23u1PHKLSlg4mFQz65AnC
	Dqxs+VwkaqoOCXKYGow31RIwnAIk6rViF8U4yN5twK2cWeW8gI2YSYUIMbYKxO93jDZEPwG/DU1
	W8Zj+HiwDC5QFBVpsTJc5lZR7xpK+901w/Bf16OuHoBFMN/MyxA1L2Kpbd3jdCmSrlykzI5ZskG
	lbNmUl2wceGlmeIpYXyJP+93fzNLmVP8ahtY6fyUtiHleno3qT5IFjV1E6S8/pdScTwWT1N4v+N
	de59OjE2uPkl5trfq2NfNr0GVdEsWd6nYDEGnSIkPLpInKkDxz3VxThTlpGAC8rpfXKy/NUOi3m
	VcpRiztCIeQ/5KyxB2ZsaXknHWOdq2ApR/J71g6X83hqW4Sd6D4XsMDLVP//AFWAJbvHGQ7jeyl
	QnYT8rKC8Qj7SAVcwrSsIilyUOzCulAOoOrQwPfU6n0u75leQ=
X-Received: by 2002:a05:6a00:1411:b0:838:c01a:7a50 with SMTP id d2e1a72fcca58-83a5d68134fmr6288269b3a.30.1778134977954;
        Wed, 06 May 2026 23:22:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:1411:b0:838:c01a:7a50 with SMTP id d2e1a72fcca58-83a5d68134fmr6288208b3a.30.1778134977319;
        Wed, 06 May 2026 23:22:57 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:22:56 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: [RFC V6 1/8] firmware: arm_scmi: Add QCOM Generic Vendor Protocol documentation
Date: Thu,  7 May 2026 11:52:30 +0530
Message-Id: <20260507062237.78051-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc2fc2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=fRH0SyXitDLK6ufOgm8A:9 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kyMxWZhaUO-qB7gPi7dTcSS_qzIz00be
X-Proofpoint-GUID: kyMxWZhaUO-qB7gPi7dTcSS_qzIz00be
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfXyyrOoXeu0i+l
 9zo6ZPd+mbq9Ve4cXh9tz0oJNlzXbXaKdfFest+jn9hryoXkvLue0oRefQo8dSoqtwLEYQQ/4o1
 CxyA035DqEPizSZw+oru9XBhx6R2plepOAcPqCMdrcwri3ESMZ/kwcRlX/5EEj4//7grGklHCK1
 D+PhD1mlb9XqP3LCR/rlVX0KHJJYHHttfQ8kRcOR+nQ0QuZJas6PB2+O1DUQm18YG3nav5pfkzH
 8s1QDSzJXLiOPR+UHHWdd3IT5oIVc4hzUgcAZspLRt7Q3vundTCXMiKLZtvzybWAUKexdBU2Ut7
 qZOZ7HwYeWq5n7wlopHjAlOMxhnpzjGf+wdcv2WhUldNOncCSeoD9VtGpi1PkBwZY5G11eFajtD
 5R79lOvZd1UrDbAkxVOrmb3lDexdKu8PZmrsWyOWGeqfvkNxOB8Wn5yfL3azk9Vx7J/A+hrcwAq
 eeKGQfNDiywfJGKUHBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070060
X-Rspamd-Queue-Id: B066B4E36E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,nvidia.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106249-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add QCOM System Control Management Interface (SCMI) Generic Vendor
Extensions Protocol documentation.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

@Sudeep/@Christian, Just moving the series back in RFC mode to get feedback
on the devfreq part of the series. Will add a lot more documentation in the
next re-spin, so definitely not ignoring your earlier comments :).

 .../arm_scmi/vendors/qcom/qcom_generic.rst    | 211 ++++++++++++++++++
 1 file changed, 211 insertions(+)
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst

diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
new file mode 100644
index 000000000000..141bc932e30f
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
@@ -0,0 +1,211 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+===============================================================================
+QCOM System Control and Management Interface(SCMI) Vendor Protocols Extension
+===============================================================================
+
+:Copyright: |copy| 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+
+:Author: Sibi Sankar <quic_sibis@quicinc.com>
+
+SCMI_GENERIC: System Control and Management Interface QCOM Generic Vendor Protocol
+==================================================================================
+
+This protocol is intended as a generic way of exposing a number of Qualcomm
+SoC specific features through a mixture of pre-determined algorithm string and
+param_id pairs hosted on the SCMI controller. It implements an interface compliant
+with the Arm SCMI Specification with additional vendor specific commands as
+detailed below.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x80
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   |See ARM SCMI Specification for status code definitions.       |
++---------------+--------------------------------------------------------------+
+|uint32 version |For this revision of the specification, this value must be    |
+|               |0x10000.                                                      |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x80
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |See ARM SCMI Specification for status code definitions.    |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Bits[31:16] Reserved, must be to 0.                        |
+|                  |Bits[15:8] Number of agents in the system                  |
+|                  |Bits[7:0] Number of vendor protocols in the system         |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x80
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |See ARM SCMI Specification for status code definitions.    |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |For all message id's the parameter has a value of 0.       |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_SET_PARAM
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is used to set various parameters supported by it.     |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair.                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
+|                  |by the chosen algorithm string.                            |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
+|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
+|                  |is rejected by the algorithm string.                       |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_GET_PARAM
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x11
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string.   |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload and store of value for the specified |
+|                  |param_id and algorithm string pair.                        |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
+|                  |by the chosen algorithm string and the result is copied    |
+|                  |into buf[].                                                |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
+|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
+|                  |is rejected by the algorithm string.                       |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_START_ACTIVITY
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x12
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is generally used to start the activity performed by   |
+|                  |the algorithm string.                                      |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair.                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the activity performed by the algorithm string |
+|                  |starts successfully.                                       |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any.  |
+|                  |matches or if the activity is already running.             |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_STOP_ACTIVITY
+~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x13
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is generally used to stop the activity performed by    |
+|                  |the algorithm string.                                      |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair.                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the activity performed by the algorithm string |
+|                  |stops successfully.                                        |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches or if the activity isn't running.                  |
++------------------+-----------------------------------------------------------+
-- 
2.34.1


