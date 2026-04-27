Return-Path: <linux-arm-msm+bounces-104578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB7ZKfq37mmMxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:12:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 241FA46BD34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AB1430038E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D5F241695;
	Mon, 27 Apr 2026 01:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBMe+jj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXaVXUvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEFD22CBE6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252338; cv=none; b=o2jORh8qltLPBFxyjjKnlp+bs2R7+OLlQABtWiX6KFmdD8/RcJN7KtMGj2AqnVwFhNjK/WMYl5TmHofW6HFdWxrjYP6nFbOHVNftDklGWwVuAEtYc2sMEfYL2AiP06CC/uPWujIc6H0PydYEUDnjAVkYXlv+/xZEdoZE0rM3tE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252338; c=relaxed/simple;
	bh=nRTPo5/6/DWHCheyPlQyFlW4w/Ucl66Mx+6d8gX8VqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DemTmxUeY1IfK5LFQBiiDMbp4Ljay62W2p1tqvSi8rPmDMh+o60ls1e/bMrgo4FcUcuiZpn+mtIuwov9bsZwb83ewYGoNKSg6lx+1WAQHPKW5BIEfq8TEMT1mkuBr8TVRxwdTsJc1jJWnEjJw+3M1PlW3ZFHmf7xchRrMV8NBbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBMe+jj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXaVXUvm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKd9oq3557805
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DBI3O9Pvk034EE/Z5P/cp4iyvbQy/3iqo+c
	qSmkWFeo=; b=RBMe+jj6ytKsScusIh9s6T87dD6Ytw+i/qgCM7gLcqSb2+Rgrjz
	p3qhOXO1QHtZc5ME136zaJkuJO9ajA+mHW8H5xNZbe9eNKyCdBod+LpMakQFD4Aj
	4dKQea0For6K5ct063NbEwz4SYELliT6MyfqlMVpXSHDxEp17x8owehC72I+w+5B
	0ebzhnUG+WQ4nJyeb7ZNvIEjTXWFbldAk3BGp0AzT4Bk8oWYLT3cIQcu792wr/ru
	CSfQ1Si5nSJQ/MXZI83RPkfeEF2XJU0g+ATHhOSZXGwQfIiaxI97+IjpGpDSyJPU
	KOBEZ8JZiUSYWYyQ8mNNIJGj0yWSshAtU4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw3vsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:12:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so14991237eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252335; x=1777857135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DBI3O9Pvk034EE/Z5P/cp4iyvbQy/3iqo+cqSmkWFeo=;
        b=IXaVXUvmzAjtllPCaS9FpvULjcSC3jBK8Xg0YftZI8rdClyaqFke5NJp4i7sMrqVI6
         2sgwg6dJaYZsbjPaNCE6hxfZEs3ZRTnhuyX/OS3Xl1hHw9WUX9xvxzQRJnfVd+L9jlah
         iZuCtyKAULI5D92us4YXQ7nWfCEylEwZo5a3lyvHBHqlYFEvOa0JUYaczA5h3vIv8EO/
         YnY/ven7iod/hb0xBZMGaziv08tV03jbS96ynKgvF5LqGkqWWrqucOt7Otwne1FK2b3o
         C67ZGNb8CkiYRFEMzA1bCp51KQvLLoSpgCIdeK3o16Jm/w2z7UyQado0dfvax10vzrBW
         Ia2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252335; x=1777857135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBI3O9Pvk034EE/Z5P/cp4iyvbQy/3iqo+cqSmkWFeo=;
        b=Yejc6Sf+0eA/qbQq2rHH6Xd2P7VQu7TsKDqz/Z4b1kruj2hSxmr+cqDteYTS5DmGM2
         T+0vh65F4DvBn9EgULO3pHkjiX/Fy0zsXWoOLYZEC0s5uavvlRHrelfJD7XJ/n+XtdFK
         WVHzgAcnoGUFuRxL0sAS44zKS/GRTJyWMZY+H2/UdJH0UBa8/C3nkW83uP2dCW8btauF
         TeQ3t8zjkpbXIUoVPc2MufFVYJY+UsrspFw44Hd2WqbRXRzGPLbYx1WmIi1qtjQtVULu
         ZhRyd4LtQi9KblFP2n5424Cyf4lqPqS4dEQApbU1A7aC0MuKR4I4zlyn6Yg/58nzinF5
         Qysw==
X-Forwarded-Encrypted: i=1; AFNElJ8DVLl7tV2mwrQ4m6WmNIQ9rYyxDkzPjB9EdCBL6+xU0HJ4+QK6f1M2RQKsE+oAmhz+FHZw+gVfDVYkCE7L@vger.kernel.org
X-Gm-Message-State: AOJu0YxQsQRsbRY3JGekXlCZSPmCFUuvNopsVxZ+6rjfuzZkR2L2CNHd
	jXAmFERPv8uMpvvtrUmMPC/9UG0IelnZBB3XVqqaMZWA6mn3CXWzTh/n9BBT+cDhIAe9KZn2L3f
	bTnUTIG5khdO505o7j6B1FiH0Kdp3945j3A65nkYG9/ekb6h2WYWD0Y20/TEJSPyR9pPC
X-Gm-Gg: AeBDiet25oORdNoj1WysaF7wIlWvMT8w1jib8R/shbb7FaiIxXRDPoj5i4KttHNzH6Y
	joVI4w9mb/k1WYjqSGt7GbKea8LSL9MbBlijH0EM+u1U2K0VyiD4TtLRDqsiYw3IQwvGymIl/s+
	hNVcDuNDcyzjkZ66G2NihzWuHsbwfh5zCCevPbjz0r1ggBaS4ilW0+qBK9jkXVoniGptKhr+wSc
	AmStl2THSFpQkUfCaKe8YZmEcCTJF0k7jndi3yX86sgUyTzZAtI5h2WniQ+/kVKPeV/c1KE+4vI
	90xzCP+tKu+3ygVSM73zpLm4A2GV0rNNKTkA8DmDAyDDaLLiswLTHvVSMQlbVhyEI+DfLmoRGaT
	dAXTkloR29JJraz6DDeq8kXXJBme4HIBBsRomcaMo5jjQ3/hLXb94IsIf5VJ99/lXOq5S+vRjyE
	fczJJO2BIgx3gohNVM
X-Received: by 2002:a05:7022:6728:b0:12a:72af:83d2 with SMTP id a92af1059eb24-12c73f7676fmr21766499c88.14.1777252334710;
        Sun, 26 Apr 2026 18:12:14 -0700 (PDT)
X-Received: by 2002:a05:7022:6728:b0:12a:72af:83d2 with SMTP id a92af1059eb24-12c73f7676fmr21766487c88.14.1777252334192;
        Sun, 26 Apr 2026 18:12:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm21720098c88.15.2026.04.26.18.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:12:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add PMAU0102 RPMH regulator support
Date: Mon, 27 Apr 2026 09:11:57 +0800
Message-ID: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMCBTYWx0ZWRfX5mCKsdJJWaUF
 +VSUpq6+bx2PrTUTtFlAba7Wpsd2enQt8nsE5zaZ2YOADy1V9lPi8cJij/Kkln3rww3kc1QHwlQ
 qUaummpjvApXEAx5dhnKkGxEKeJ+oVqubNTrtZLZRQrMj5gjRnm1FlC3tLoTqoo3qmTqTslBzJ/
 5RYk7jaIyARzubSTgF3Eh/I/GALzCTcEsdF+c6NFJgU5NXNyEmviUMP4UNWa+doGjlfpFl1ng7L
 xybHkrn+Wcfa4Q/hdaOvl270jqUTN+EbEm+tgU4LNOrMYqgd2Z12L0FbmAwmsYhL0vWTwVDzEVM
 K8s9ouybNNCvI/zn6UTDGbz4/vbuaOM5zPQVXT3ra26eg9Zax6I392q+p+artsVrcZZTS7sYXZL
 x4JXNlAxFyZfM823JTqDJY6LOd/pZKthrLg/WQbjiURgX5b6EdjnyFKEyihdjhUuqusBPbOT9LE
 HrwA6jEb1dWkGgePZLA==
X-Proofpoint-ORIG-GUID: E9aLT76ioDvNx-Op9zrmzFUP_CQYR-mt
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69eeb7ef cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rmhsGHOi_XyW5o5IWqkA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: E9aLT76ioDvNx-Op9zrmzFUP_CQYR-mt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270010
X-Rspamd-Queue-Id: 241FA46BD34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104578-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds RPMH regulator support for PMAU0102 PMIC found on
Qualcomm Nord SoC based devices.

Patch 1 adds the PMAU0102 compatible to the dt-bindings for
qcom,rpmh-regulator, documenting its 8 SMPSes and 3 LDOs.

Patch 2 adds the corresponding vreg data to the rpmh-regulator driver.

Changes in v2:
 - Add supply name for LDOs instead of using NULL (Thanks Konrad!)
 - Link to v1: https://lore.kernel.org/all/20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com/

Kamal Wadhwa (1):
  regulator: rpmh-regulator: Add RPMH regulator support for Nord

Shawn Guo (1):
  regulator: dt-bindings: qcom,rpmh: Add PMAU0102 support

 .../regulator/qcom,rpmh-regulator.yaml        |  3 +++
 drivers/regulator/qcom-rpmh-regulator.c       | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
2.43.0


