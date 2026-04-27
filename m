Return-Path: <linux-arm-msm+bounces-104570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA6OHWiz7mmVwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:52:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3C646BBF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22018300AB0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 00:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFDA212564;
	Mon, 27 Apr 2026 00:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhEhCdUR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJe3TmG2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61449188CC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251173; cv=none; b=l9Pjlxbud7gTYyauXMxSUW+9uKk8muAZ3+tXXDUuQ8fFVufWXQAzAPBTj2K5cRAyB6gS2A0uDmwDeGmpFHYMIaVWqq5EmwI6mLLa1cj2vqd+SiSTEMm3O0X2QIL4I1Qk7xPZW1ru6PhvUz+bIEdeVLkrdtKJb8I4lkIBSUBPBV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251173; c=relaxed/simple;
	bh=wj1pHs2vG2knCv0mWwX1EbrjlpIcdpPxsvpAYDssIio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m+i6RodRKhrXCa9Ntg3BAOW+EdrFUmMxkTc/AMMQUAeaX4nl4R9djQCDtigxv1CTyzRKEtAqqC52jSfgGNjHq3uS/W52DsSDhWdro6xQHtXYmpXIU+VJhjJklBPzokt9Ib9wQWp8ZfWQwYJnP2NQ0u24UkWKx0lyGxn9YmbgTvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhEhCdUR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJe3TmG2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QCDlCN2338955
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TMb9t78mOkcCQYjlcqWYfJT/X7SxaLWkUuY
	4033SWnU=; b=ZhEhCdURSMLQtTS/SesmKMn/ae529coTpmlsjQRZ8vqFDV3g0lR
	ou71gPzLakXFBzEWeVc2u/jG1cGWMcmvoNIWPS20vEF1L1O+gaxKFRCZmU/Y+j+c
	yU/eTlaTRsuZUdGHPCPRvDk0gYpMkl9ye5DVPMGQWSA+d7+vBRycWpqt6yWdYBPj
	u41j32GQVT2KUM5oc2UEmXOrnCO7rfPB4y/dZPu1lww6uTa05e0l86he2Ict5xtf
	LyXwKGGV6l0whY44ypjVdF8nwyUh6PRLFQzJJBSKZ/KkALRtldF5Xykvh8ZGkltl
	RKdlhUdDhlqkvG3tPr+6DAEhwvT51Xmu7OA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdktem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:52:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c8de02a4dso18669936c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 17:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251171; x=1777855971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMb9t78mOkcCQYjlcqWYfJT/X7SxaLWkUuY4033SWnU=;
        b=SJe3TmG2ikHEKMcJGywCUk9F24fIMWxmXLsFyLZy2K3eMPCvTq9xybFMVh+Xb37yHl
         GxTGIRY/6X60iEVFLY3AOqsyfdDnszPhr84krg4NFSbu1/qSM8IS1Jabrz3o/NG2r/RF
         aq4beDwi77gt3aFbIuK/NXxBHfBszKj5XYi+f6cI0kenslcfc9htabWcNo4ocw5VGtrK
         09b+pPAGZ03iUeJCcwSQYhevKNO2ncwo5RWiprqM1HFENi2q+GXpBtiLRQeyY/nrKFhl
         4YDdqJAQhD/9k9xWpGw7Jqeh9z6Ta0eWfIuA+42agUY6EN05o1uINAkgaL+22b761OSt
         jVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251171; x=1777855971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMb9t78mOkcCQYjlcqWYfJT/X7SxaLWkUuY4033SWnU=;
        b=WpeMxjc1o4YR2c809C7ZeRI5mpXrkM5Ww0gn67s90pVS3ZV6ByoHm5NwkQs9Wqggd7
         ahxFcMxJx/hDzHTIkXVstL1AqjpEuNfmTAf/TDznUhMcJj5WfeNdBwU1Y8z63+6QSEN6
         +zv1ku0j07o0UABSOgDNNpaTqQjo5ZQP5O92sxn8dmEFgqahEsgF/VTodL+0qBEMrXxi
         Jr4bHetT982UDuVn2eO155Kk6u6yEPmG7VlLiIoyjqrrEXIDcc2CaM2L6q5Lzo8kFdBR
         /lv9Idd1eO2UR43/yt26CuXpiE43cgpZS+LufShBtM7XUGQ79AglwEQCBZ6jONhAx+tL
         QQKw==
X-Forwarded-Encrypted: i=1; AFNElJ84HvkqdhzMcq5VM4M1gqJkU5Qpe7HPzAU7LLIgbkKDgM11P09uJU7TQmWjt7R/11oPH9hIeOZWdgbOiz48@vger.kernel.org
X-Gm-Message-State: AOJu0YxdUvclQ6JZ6JF3vBKGcWWIECnLKRqYiGhSQH6gd0b+QA1Fgiy7
	dpWfUVoDMLKz+mrQFKXBpWZ2ds8bHdYlqb3e0kuLCx3BF4rojdTDu6ltRqN6U40Qzp0vUO8U0xx
	NxzmeT3/m+td1jHdU7TgY1L8otHmI+9A95SNTjkjEWr8fzxiNS8Z+mg+eMUPOkxnuZTLf
X-Gm-Gg: AeBDieutNcU8i94PAeN/bPNwLnM8btCgeopSMEGAjDpvCgBWCgMTTXcbf6sDXD8Lygw
	h1WaKfPl9758bidNkhSDmTRbiKkiADxSkWRlaCGL7UHD0CkgzcZgESWj+CV2VqfMCDJnYlWDEwl
	b1lP6Il2F//pw0jBYDtT4C61RApAfHqvu7eYmBgpD/WnuSPqqXPeyS6kWv3htXPCP29URI81/Sa
	uAjNyIXooHC7tDkq2VrHaGHOlVrXz8kJH4ZISNeL5lcqCOnTt4XwrxB7epH499Vi/n4LeMz+XXd
	xnmKxQ4kFB2x7I2uI+OzMVpsb7CKGfpZZYzCBhWKUPm8tY7GE2Nthzth0afj3+2oy51Yya6L0S2
	YrW7wI7wUixj5coSpzsT3+RdavXwRKv/uDCOiRXjiEAtUXYJd1vjTE84S3xBqdFkMQ/L45YHYSX
	GfzyvFBqnoa6QHR+4h
X-Received: by 2002:a05:7022:30b:b0:12b:ed30:5b85 with SMTP id a92af1059eb24-12c73f67190mr21512037c88.2.1777251170946;
        Sun, 26 Apr 2026 17:52:50 -0700 (PDT)
X-Received: by 2002:a05:7022:30b:b0:12b:ed30:5b85 with SMTP id a92af1059eb24-12c73f67190mr21512027c88.2.1777251170394;
        Sun, 26 Apr 2026 17:52:50 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dca2c1c16sm11449051c88.5.2026.04.26.17.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:52:49 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add CPUCP mailbox support for Qualcomm Nord SoC
Date: Mon, 27 Apr 2026 08:52:34 +0800
Message-ID: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNiBTYWx0ZWRfX6oVXtFwUIzzG
 5nWNqMEXYRkjTc2NeCg8Su3CrlSjrxbQeubBktzUvdXEYcy5CoN9TWXEN/B2DrZ3GhnLQkeDdjc
 +Je2jIqGYxlsq/sPLFz8x0JNu12p78G07eYigutN7rme3Xac46Wawdi3I0zdwQZwK54wDk382fH
 BoDGLa1AhUsKlkCMPBOp6mMXhDepcP4GY4hEY8ZTKl933m/dEPaLGPQZJ6aDJOqmiFwqf1MTY0D
 ykWS8kNwwgAFIiZ5QEsV62TsMHsDMrLVb3TIqZc9iG2YnUJdSwSGF8AogmfvNz69rxSl9SaE47y
 MAF4D/myOCYLUjgmGUAk2w2zN0ylgTI2HeEYeGXOHCJ6vr13qfChkwczdpPCMfalabJ4ZIMp57e
 FhIQCy6JqXQxxWak+wlaahrQGK6kDFIRbo+1iRLDtsfnKtBmu0W9bR8Ae1jrIry5UPuVwVQlnve
 JbSlkxxqp6/roBRr75Q==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69eeb363 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wFnvaYuheMr2fJ8iLyYA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: HxxF6KgxH6V0c9V11R1VP-PzU8wLkb7E
X-Proofpoint-GUID: HxxF6KgxH6V0c9V11R1VP-PzU8wLkb7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270006
X-Rspamd-Queue-Id: CB3C646BBF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-104570-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds CPUCP mailbox controller support for Qualcomm Nord SoC.

The Nord CPUCP mailbox is functionally identical to the existing x1e80100
implementation, except it exposes 16 IPC channels instead of 3. Patch 1
adds the Nord compatible string to the DT binding. Patch 2 refactors
the channel count from a hardcoded compile-time constant into
a per-hardware configuration struct populated via the device tree
match data

Changes in v2:
 - List Nord CPUCP as compatible with X1E80100 CPUCP in binding
 - Drop the unnecessary change on @chans comment from the driver patch
 - Link to v1: https://lore.kernel.org/all/20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com/

Deepti Jaggi (2):
  dt-bindings: mailbox: qcom: Document Nord CPUCP mailbox controller
  mailbox: qcom-cpucp: Add support for Nord CPUCP mailbox controller

 .../bindings/mailbox/qcom,cpucp-mbox.yaml     |  1 +
 drivers/mailbox/qcom-cpucp-mbox.c             | 35 ++++++++++++++++---
 2 files changed, 31 insertions(+), 5 deletions(-)

-- 
2.43.0


