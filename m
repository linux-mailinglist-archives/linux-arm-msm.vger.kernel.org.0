Return-Path: <linux-arm-msm+bounces-103650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL1hFfSi5WncmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 05:52:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E85994269CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 05:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9A953017C31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 03:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C578F3803D3;
	Mon, 20 Apr 2026 03:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h22wBTbF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvpZhheu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605B237FF75
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657131; cv=none; b=Qxv3cIs4SGRepi2RzGi4QBUMc+DzRoLI+d6Zd56iV4dpPskmi3eSA8dAsqCHd8mbuyGC4LLiORcLW8YP9mwZKtRLLq1G6v6l83LHikZ0FQDtebGE5VTb/BzQcFH+JAgUOAnq0mSJN79EEsHoFnLACtI7uE2DHFBmSjkLayWWmwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657131; c=relaxed/simple;
	bh=LjHpXILgSSxYdRyxuGdqsJT7SAwCxmBr+4K4Jx8gHpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sbsKRekokRZH/H8C0ZR6d+XT3DclRhrZvjHMpF8bKgEGHOhS/kP+cUbdaPH508bO9beVOEhvWVAb3rQyExycpgYCv8D+vD7YtxWXp+0gKsBppVOHDiAoxNt8dpL9lRteSP4XaWZpzBDkT8TIy2K14EuV3xdiNkTSN98V1fQrgSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h22wBTbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvpZhheu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JJqeIA4054361
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eJRwZhCKQ5LNn9M5NSckJ+yOwtzDE3hUcfB
	QCJ38fc0=; b=h22wBTbFMh0+QE+o2TkcwKm535QdGYBqOm0QK1H/MknkzLVG4Dl
	YLW0gfL1jePiCSQWWYKeYNDbdc5nw34nRL9nlfJplZdPMOE6aBUENvrxKim3Ti/6
	7SV1wZhpiIs8r35SS164s6c535OCBzQJm6ZyufWiwrxghsEm3+GbAU8Gd1L4szRJ
	mMB0V4gyxnxMdUiaja4EZWyfC+SIQhm8JPBaR6GbP74SoqAsIIU04mbvP0UdM2B0
	/7ofygKLe92g2tXw+5hg5AYlZtg7p3tbGMYXq4rR4qkA913Vn1MSmXzSoYMFJBRc
	f6yIIgoE+sh5UtCjZtZlNwoDmGzHb05on8w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkyanm55n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:52:09 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1273dfdaf5dso2101105c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 20:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776657128; x=1777261928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJRwZhCKQ5LNn9M5NSckJ+yOwtzDE3hUcfBQCJ38fc0=;
        b=fvpZhheuvw1b3IGMU2TQ0p7CxGO/UzkHIERgq/p/ojRuK433zJmLn6tG/NbhDBPkwJ
         /uQFrk+KCriRDjFehOlb/pjZGUDuFpz/hVhf3LVX7NfJCcDKo8daRNiN9M45kvWUOlLN
         /vW8XWy/tet6qd0mMLOCv2breC8xSOMJrWIQWv/svjdM//MoGrzD2KrbJx6p4AP4/dzV
         OVY3o67QOk8pbK9Tl62qRO7D/R0Foiw/jVRKmEkb8Al7YEC3ZoyWzvB8fEGzSHbXX1YX
         f5/K+JiLDlpp7kG9jahLuoaVnLACY3BiIlinQN0OSX8AYR+gn1WZyPmK0h1KcNEjAsQ8
         RazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776657128; x=1777261928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJRwZhCKQ5LNn9M5NSckJ+yOwtzDE3hUcfBQCJ38fc0=;
        b=pM8ITa4ZILbd960Bj4t0RjTlQVqlwWgqQYewE/2wTshStGRXswkoF23pGzz5tbEbSY
         iecCGvOH6Y+PE5oAG6/hg2NA2v2KhRiwilRxVcIcH3dTdhhSP/P2RCAChxGs2duQooZo
         Mg0X2crtRq8aomd/zDLhakFT0lrcOALLsovlx9eXMLcl2DAr1d5UV3wvKaCrnKHiuizN
         qG+Yb8+O4lqdfpfmOCk0lTUkwcgeLyhpCQ22GWbe8e8qSZsfzYzlK006K5BmfRAvKFdU
         XgjhKoD4nlykrVhYGGSMy+gyLlhSlc/sGJlJyUXTtU2V3IlAekYaJXM1nJViKcauNQ8t
         lohQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qBGlbfvQ8gncxIwfhsvQJMgUfmPyPkP8mS+nKO9OdtQS3iIkBoa/znLBINVZEI3GhXdpAeHlgWcUtN78P@vger.kernel.org
X-Gm-Message-State: AOJu0YxLzlnKFekvLAniF+pBq3H6dCkXvyuqmgYVkZ6wEcZ8/Cze8JMb
	Cr/fpy/qt0+oYjFoReyWoQxLNAcEHxYFEnS/0jh1HTBu4Kuu2YQZzfc88u1DPOc5vVZzsusxfnx
	qjMeVBqyAChLlNClPq4cXO8pf1maKxH+zS0IxuySzKu8OzXTVN91ZrqRC8M+8jsPs6fFJ
X-Gm-Gg: AeBDievO/w+IBgtmwj79lcuazeXvRAtuMYyxgELnej7k3AgUpxaqec8nU7ju2zgQ2+G
	7ZjXgr2vdbhsjN9Ow7uKo3q9WTJTWaLqGk/4hv8Sn/lyF6AXPvNzLcK3i12s9fDVeDW7xDDk6n7
	8v0iV1PBgrUn+5Zo75sgpw+0GybzNXBJ2C6q2d/P3EndcU0rvY9ewNKZPyMn/Vxulqg3pEingT2
	LLgz3MI5OwijRs4S8uzvUOCi+Jy9YqDKENXea9MDcWclqOQTnw3AE/7SdGGJj1DcQs1soB0NNAh
	zH24SnWhKGAV5MjOwW471NX5G65bvhu4mRdboCzD24TBgBfglPin9wYy6nu1XLYuGSMApkvh3px
	p0nasQhMNMiUSzXdO6OrP0MPzrnZyAxFY8dRdqp8Xe/uhCOVqC9FlSoAjhfW1cAZ4Dsf5SXetYC
	/hWCwXP7uxlBky+916
X-Received: by 2002:a05:7022:688b:b0:12c:81b:c74b with SMTP id a92af1059eb24-12c73ae93c1mr4664740c88.1.1776657128233;
        Sun, 19 Apr 2026 20:52:08 -0700 (PDT)
X-Received: by 2002:a05:7022:688b:b0:12c:81b:c74b with SMTP id a92af1059eb24-12c73ae93c1mr4664724c88.1.1776657127664;
        Sun, 19 Apr 2026 20:52:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20c55sm13056111c88.13.2026.04.19.20.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 20:52:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CPUCP mailbox support for Qualcomm Nord SoC
Date: Mon, 20 Apr 2026 11:49:30 +0800
Message-ID: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yatAt_eTYB8GBWSIlSXq5G36_e_fVqeP
X-Proofpoint-ORIG-GUID: yatAt_eTYB8GBWSIlSXq5G36_e_fVqeP
X-Authority-Analysis: v=2.4 cv=SNFykuvH c=1 sm=1 tr=0 ts=69e5a2e9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=rxKuTeQDrr0-oB1YhZwA:9
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzMyBTYWx0ZWRfX+TB9g3ig1SF6
 8zpibolRr/GgLQ1w7rqpB/UJwlvmkMQ3Sn3U7cGvsQr9qSoZCHclATlV+lsUJXdXuzD+wjZs/4v
 NjZ8NElS3oAnyzPuNJyCHYspZX32W+QhkG5tAleLrV1PvIHGXMIfeGdo72eIQeJlVOqY9Bracz8
 u39RBsfacCrVT8z09YABfgIOq9QG6a9Fn8Kk3z2/dcXxNMYamKRTDaQWQx0d36+LNTbycLn1BHh
 im97B21akxn6YfZDMP1R+sZ1wN1qEU/l75s1vHSLV8h36NESqgFeGAz+VGK8xc1q/zROHG+YDok
 JypNO8pKQSou01MkhMXK/TJEfm3FDKa62z6mOt4LUeRZndr3zH0jpMv97/9tzla5QWz/ZqJsM+a
 wJ61unr/5HWimfnSOroRof6SVyTcG52e5pglPpwOil6epsX2MqtxlqPmtRC37DwrIC9xs3dRuAl
 W/W3aPd27qm4Ck6I0Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200033
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103650-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E85994269CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds CPUCP mailbox controller support for Qualcomm Nord SoC.

The Nord CPUCP mailbox is functionally identical to the existing x1e80100
implementation, except it exposes 16 IPC channels instead of 3.  Patch 1
adds the Nord compatible string to the DT binding.  Patch 2 refactors
the channel count from a hardcoded compile-time constant into
a per-hardware configuration struct populated via the device tree
match data.

Deepti Jaggi (2):
  dt-bindings: mailbox: qcom: Document Nord CPUCP mailbox controller
  mailbox: qcom-cpucp: Add support for Nord CPUCP mailbox controller

 .../bindings/mailbox/qcom,cpucp-mbox.yaml     |  1 +
 drivers/mailbox/qcom-cpucp-mbox.c             | 37 ++++++++++++++++---
 2 files changed, 32 insertions(+), 6 deletions(-)

-- 
2.43.0


