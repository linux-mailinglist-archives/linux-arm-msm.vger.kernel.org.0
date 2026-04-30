Return-Path: <linux-arm-msm+bounces-105274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM/hIs3K8mlpuQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:21:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A0C49CC2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AC5D300C265
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 03:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D60B24DCF9;
	Thu, 30 Apr 2026 03:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Re/sqlKv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgfHE7z4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB4E33A014
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 03:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519305; cv=none; b=m5F0WEDJpgwDAV8VnYEd7ffsp6FSHdAtWOMwq//eHKrSTvTZzv/Mmkp1r6cYf6qlUSM7PVKZuCnIhFo7GN0VFuhiHgEuNqLu4qiwZM9ntgSGOilqbyMwPlCwjzcwSlxtEV+j1bOHbIeGOlP7G8ZxaxMUdOrEoUKyyWxpHIFjUyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519305; c=relaxed/simple;
	bh=3RsQB9XniqidnNkSuioJpxgQw0jvK8RCoNbotV6wuSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aGyaYyX8Vv8eVTRX9ixKIyKsJnWe39/EimWrt0Nth7uODETf/POid2RhvgfioXR1wq4N/PjpdCR7i/qpkno3xTqyzGnKWcho8lK7JVG4ilLao3FqGXMjBY3wuiwfm0msKa0Waj/jLCBcetyIPZtw2E35jPPXj6eBKrP8gT4OBIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Re/sqlKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgfHE7z4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TMFBOR3885246
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 03:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OPnVzQxAZuWytMDrD5gTR/
	fXDYXZpYZFs/9EUtDuKbo=; b=Re/sqlKvxUFre49xIXxxRvWoTZflHw6bCFT4Bd
	SSvL2fMHAwDQeQ15vDqlUFSKneW0xRrejK2DwdPu6agh2X4hXBe4JPulVFxQZuE2
	eSmCZdYfd5G1TS1eNDic4jd5Fc1cMkxNUuFUfAkWPX6jYXu02KsQIKMfT5wgoGWG
	Cjhgt5eDSGtHatjt9YOdBOXp4oCdDP3CDt9VXk3xDKf0toJ0PKiovThx5Lv135qk
	cBQ2k3IfCjxYX5lSH2TTx3Lww5i7NgZbQjBG2bPKN2Mx3Qzoqrtt041JlF68Lm7M
	uwMwvriTcaDs2TK1QfYJd/rQTMACmUIR9R7glj+/EXOBBfSg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmagrxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 03:21:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c66fdd4aeso882027c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 20:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777519302; x=1778124102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OPnVzQxAZuWytMDrD5gTR/fXDYXZpYZFs/9EUtDuKbo=;
        b=IgfHE7z4uNrXQKyZNsaWs4uYzb5F36nbDHiRFmkoxk5FMf3SkdpIl+uESNdoDLWqrc
         D+3beEE2rd0Oon7WKpsm6WkRbCazXtuQOap9mh2k3eLLUgoIzqOV+3jrqmxMR8O5OdJ+
         oGTqTSuG4KFqhhK4rbfJStbWUK8uDXFWvEqTNNYNLMps8KiBDJAIOFuhht8yitVREphe
         qbIkSQm92Yl+K5EJKh2e7Wcv4NbDjUe8LAsRjObVfZIWbDA8fHXNPYIuJdKFDWQUQHbf
         KPqO+HLe+LPVW6bBabqgFVWVFuGeYfz/LNwOiCrg+jPm8E52KvYI6b+saq8kZUsfADs8
         6JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777519302; x=1778124102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPnVzQxAZuWytMDrD5gTR/fXDYXZpYZFs/9EUtDuKbo=;
        b=GkInR5zpWA+ommKoDkghv3z/nP2arhWSsg/H9O4S1vZpebMRaKCvKkHFz7xBoM0+24
         EJ9xiTtKJohXrGrOFscQQZO0crH3JrgQYV2+vbUrd1Zub99WU7h9YV9FwfwxqJtlejxZ
         wBnHtoy4tV6JxsGLeVC1R/HOGDRndDe5fmeixThkvXrXvftZNigHld80xBCBqoLYOJqs
         vmmi9G9H2p/x3GKGcxwpdTZu2joJfalLaJWT0pFeh9IStPSoeGszJHz3rTiDJbluBO1o
         rry+9AKnYks7L93on2yIg/H4P/9Uqso8mLIoMzyWAXzn24oFhFfTJz9Mj4cYYvinMlI7
         Z4Jw==
X-Gm-Message-State: AOJu0Yx6vYWOpnjks16fqFdsQaya0APOF3VlnM1JpD74OeNMuQ98yu1C
	cvHI3nJah0NpNwVunbCUKPHcQE2nz6dYavKzjZY9+ynosuSSgG2WxhmHcpHy5oeYs4/5MIrJlkt
	CNBnxEt8mWpnwjBm7hIY4Z8bnf+tlHDmn9lUW2xJqamNfzJd/TJbV+le8P11NtVXTRe6gutY1dK
	hQ
X-Gm-Gg: AeBDievJkduZIqa68XfkUhl6nE7tgduPptExpirWnKNiH2mOiJa0Q3GO8CjrZqkrWRg
	nj+XHDJXQ43sp15bYH/twj+l+OERITEtR2OKAJ5MOSG6QfI2bTUfGjQ1btd6Mtb5GJ0KWaszufR
	5T881seQo1zcY+eUr69K5RuGtt6Ph64DSJ3pAMArEQigeUjb+4B3wU/bq0TAyoGuMsxiHKLRwUx
	Rqi+PgSTBQzWRsKcqgvQp9avyLn0/fex/v7zcHaVPLyjtGP/Yo1+ZzD+tgQfvk6enb41RIuXw2p
	yHEeI5lii4tsaCwWvb5VIYgRAbgynwKsgEo/49vmqHF2dqG0PNAX7zPtOHBZCaEhjooD2B8pUUW
	/3zMuNz0Q5i6qQoHL/NnVtW029Y/238B8VQsLpgl9jgVE7AHyXIr85HP26or6hVE744gYJzOfrp
	osiTx/KupEFJR5huA=
X-Received: by 2002:a05:7022:698d:b0:127:33e0:ea40 with SMTP id a92af1059eb24-12deac72eebmr551261c88.15.1777519301656;
        Wed, 29 Apr 2026 20:21:41 -0700 (PDT)
X-Received: by 2002:a05:7022:698d:b0:127:33e0:ea40 with SMTP id a92af1059eb24-12deac72eebmr551249c88.15.1777519301119;
        Wed, 29 Apr 2026 20:21:41 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de321df36sm7572644c88.7.2026.04.29.20.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 20:21:40 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, ebiggers@google.com
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        deepti.jaggi@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        quic_shazhuss@quicinc.com, trilok.soni@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v6 0/3] soc: qcom: ice: Enable firmware managed resource
Date: Wed, 29 Apr 2026 20:21:32 -0700
Message-Id: <20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tRdz8KKPREo5H1TK1AvhTpfS2YMNjdMr
X-Proofpoint-GUID: tRdz8KKPREo5H1TK1AvhTpfS2YMNjdMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDAzMCBTYWx0ZWRfXwVPgre0Q42Da
 KZFfqpxgMSz3mgzdfmdO489iccR2WIbssXzqN5iFvnqsRLVfXiNqgEnklcR5Q/88O+o4vArtbuM
 9KVpLap1rI091OG5G1kIDhR9+NIcr5f6c+vT58UkV/qJOvwh9peUA5jRUjhZ/f2NbEhuAx4TEgt
 g4GHSoTY0UmcphynyCJ4gQOlS4qMzUAKj4tWjkq8l93/3BbHdrtJdm57/XeqhFsBQa1v1ncGzUQ
 LEozF3Km5kAPvbvZyajFuN10Wr7UJXPfCpUcFdPx/CLfkTIPu2swxVw2u60J+kaAJT83gzeujTb
 6B53uY7HCf2WYF3cwAa6WUH1p4x8Vy2nHhiDp2lBzhRAIxOSbrIfdI81+qqGAxjBTh0Vm7ze7Gn
 osTe99sK9NqT5Yo7v1RSQVn8Vv6UJd67s9za5nfXXOxa9mv6AJOfRDNJNIf05khVgGRHjeFyElR
 cnkozl35WJvgOOJuWUA==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f2cac6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Jyhv0Gfyiw9a8mKZ3MwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=s5zKW874KtQA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300030
X-Rspamd-Queue-Id: 02A0C49CC2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,shc-kerarch-hyd:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105274-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM (GPIOs).
These resources are controlled by the driver via SCMI power and
performance protocols.

The SCMI power protocol is used to enable and disable platform
resources, including clocks, interconnect paths, and TLMM, by mapping
resource state transitions to the runtime PM framework’s
resume/suspend callbacks.

In this design, the ICE driver acts as an SCMI client, with clocks and
power domains abstracted and controlled by the SCMI server in firmware.
This implementation depends on pm_runtime_resume_and_get() and
pm_runtime_put_sync(), which are available in the OPP tree’s
linux-next branch.

v6:
- Protect calling clock API with fw_managed flag in ICE runtime OPS callbacks.
- Link to v5: http://shc-kerarch-hyd:8080/kernel_archive/20260324095703.1306437-1-linlin.zhang@oss.qualcomm.com/T/#t

v5:
- Align the continued argument line under the first argument after left parenthesis.
- Modify the return value in probe function.
- Link to v4: http://shc-kerarch-hyd:8080/kernel_archive/20260318170626.3654744-1-linlin.zhang@oss.qualcomm.com/T/

v4:
- Commit and signed-off by OSS mail id
- Enable runtime PM for ICE dirver
- Add driver data to diffrenciate the clock managed by the firmware or not
- Link to v3: http://shc-kerarch-hyd:8080/kernel_archive/20251107091315.476074-1-quic_linlzhan@quicinc.com/

v3:
- Update the subject of patch 2.
- Update returned type of remvoe function and firmware flag in ICE diver.
- Link to v2: http://shc-kerarch-hyd:8080/kernel_archive/20251104104935.2752144-1-quic_linlzhan@quicinc.com/T/#t

v2:
- Addresssed comments from Badgey
- Make Document binding of ice pass for binding checking.
- Link to v1: http://shc-kerarch-hyd:8080/kernel_archive/20251024050921.3573402-1-quic_linlzhan@quicinc.com/T/#t

Initial version:
- Add fw managed resource abstraction support in ICE driver.
- Add respective compatible and document it's bindings.

Linlin Zhang (3):
  dt-bindings: crypto: qcom,ice: Add sa8255p support
  soc: qcom: ice: Enable PM runtime for ICE driver
  soc: qcom: ice: Add SCMI support for sa8255p based targets

 .../crypto/qcom,inline-crypto-engine.yaml     |  27 ++++-
 drivers/soc/qcom/ice.c                        | 108 +++++++++++++++---
 2 files changed, 115 insertions(+), 20 deletions(-)

-- 
2.34.1


