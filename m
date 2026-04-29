Return-Path: <linux-arm-msm+bounces-105193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFqlB2Lx8WkOlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:54:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 990CD493C4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35D70302AE39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D398829BD95;
	Wed, 29 Apr 2026 11:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGnHaVTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8PrPvK1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92C3EDAB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463581; cv=none; b=Np/MUINB1RlZSx5e5w4tMF4Ra8B/HDu9HSGvgSorLugyC6uqQyt5ohWFy6cBg2P1aH9j4v3JnG1S8C5JbWERkP8Gmp3PHodH2AMm8+wDjfTCjACPPbrOhMnbPzktWeKkRn6kqNz6Ll+Y+aClVL87G3+rUxypXrXAt8gDhRjNrwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463581; c=relaxed/simple;
	bh=pjw+WqhUqJ8DiURAyQns+IqOvoF6Wbqm0jDvtGUwEyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tnFxJqG42TT3yFwHNrGvlPV9LkzVGa2fwNq92s1bc64z7gp29aQCk0PCehvwiLBLGqjQ52DqgEZkDYfrHgukqHAWU0FeibN2jRnz7yZhDS0m7kBaOMtrJscgqV3quGZ/pQy/VQf1aytcUx832BRYWqUq+qHFJI7mDRU0QlYFfCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGnHaVTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8PrPvK1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qc8x870170
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ts6I5LNqlUFtgiD6Z1oUNmnrJ3GiGFHVkxC
	y2olnrIs=; b=jGnHaVTz3uNjclKmkCj7M559cSJ9kPkvKDYpS9XhbsKzd89t56i
	WMjQ2AzkQcoiGSlZpR2La6jiVHT++7Jg8aPjKLsEcw9dN8zPLcfBex4oo58borUb
	fxnfYgVxMb4rbxhOtRCVVz5Mt40/g1sBWuLMuvnPKt016b+CVwLhaoW58KiAISds
	9DAhZONYgEEmuOYepqJ8fzAADuSmwK/CX/1SyABjhvhFFvUUNcNpsEPtnsx2IBXu
	3j2E+Cxc6wy7vJiqZunCjmzgz/0kzjSas17uxJ/iXADJpBkPCuenZHZ56xsxDYwr
	FAhK0rzUlfmE8t/wPz1Y1bHpOXmAy+Wd5uA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1urwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:52:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdd327d970so539837eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777463579; x=1778068379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts6I5LNqlUFtgiD6Z1oUNmnrJ3GiGFHVkxCy2olnrIs=;
        b=j8PrPvK1mLHvKds7uDOnAre7l51e333FDdJdvAhDUgckosgsJr/fgMpgRedH/v3pLG
         cEaxI3ZFAP9EHqafEt3FAWYGx334kyrLTGmhGRO7YqUJ0cBFe+VMDbRXF35Ei0h4j6kl
         Sbw3F4qv7yYL2yvgqnMaScsjepntjyLISytiE4fYa1ZxUSYmbJCPxb9yWusic8gsU7X8
         +yZevLvF099h+4xDq4iaNLnacPvS52bQV5y+pakwsY7s8EbVdpsMdEN2t9hg3aF0B9sr
         twc3G8GHrRJLiUXGHyJlNUty7+y725RvwflwlDK3vx+eleSGdZ+y/oQxgS4hjYC6MfQC
         nEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463579; x=1778068379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ts6I5LNqlUFtgiD6Z1oUNmnrJ3GiGFHVkxCy2olnrIs=;
        b=kXRbtbpGqMwg3YSXezGzb96+rMpdmrq51Nstqtv0FxT+qZGtZIuDHXvoneaDzvkWks
         6RzfG+hrUx5IkGqoF1r9UbxhA2y/Fa+Ynx27yyRC9bEka9ofMM2rD2k6ptKgOhmepfT8
         nmnFa4JCbsGVan8iiYGLKvfSlEmOMOpP1N/US/NtEl4Ri/t3wiZ0AuBMBcD8deJNDoqf
         RB8BFCtta+I4QoK9OEGxBl9CXX+yIb4fu3uye5u4fcB1AtJ1rZrOKz4eLwuQ2g5EWaSa
         8nfUvVgIBq6uiURCM4YVnEH2E05uNWyPJmgdDmnIfBZHmwGUSTTrh/eCZZNW4gcYLb7N
         xVOw==
X-Forwarded-Encrypted: i=1; AFNElJ/4nTAUAsEHJpyqlRUyiN76y6C3huUMjQ2gP6/IP1PKboghnl3BqnRpSeKvmy+JE4wo/WsemQYhMo+5aq/f@vger.kernel.org
X-Gm-Message-State: AOJu0YzUeB57kK8tM8U2R1RWt10shnX17BVEqyF+9ENeQzGWiL7uO/LS
	knv9OIx4BT+ftC36raGZvC+dPyMKqi9RLtEHxAi3EnJ4FZ0/bwfV4OYmSSH0boK6rQVxYgYFOXU
	JOFlnKgZ74xaHZJiWJWq2iHQ5X6dK6A/pMQLkOZUJWSmpuPMw4LSnZBs2YHoV4bGa8/Bp
X-Gm-Gg: AeBDieuyRx9iX9S4Lgo295E72emZSxnjvCAO3aL8bE2Ls9HNpn+NguPe2P5Tc1a3Jvl
	lJ2LjIBk/xLP+lUCct6AW7KKn3K4rd62Ukah5HTRDd1xJ+FFdYn02kNLmEdTnzIrCBPMOjhHHxT
	EWEpIp0V3qm9qR1I/9BFmpiv+9ZE5lD2jd4tOb2FUkpsDUzROYF21vyh8M4wPIQZZcIIj3FSNoq
	yx+crG2kEV+YR7C6jzlOfA8x57dmxSXUSX+HWbAkX97W9Av6PEaTqg6Ogyrm6YcYtAVpIfZbTWM
	zYArIi6WWL3m8MOarcSCds0U/fBBLUsgEgKFFf/b7zX1J3ukhWY27xiHPOxuUOJ6B3/pFg19CR8
	Et/gKpgLun2jpUDtbsa+Jgt4AWps4V4zRfBctHO9ZGVslWino3QkK6fw7RhD5rD6iaYa+s2JQeH
	AiRC6gBMwumNg761E4
X-Received: by 2002:a05:7300:8608:b0:2ea:ed27:56c7 with SMTP id 5a478bee46e88-2ed1bb6f252mr1435873eec.20.1777463579162;
        Wed, 29 Apr 2026 04:52:59 -0700 (PDT)
X-Received: by 2002:a05:7300:8608:b0:2ea:ed27:56c7 with SMTP id 5a478bee46e88-2ed1bb6f252mr1435860eec.20.1777463578584;
        Wed, 29 Apr 2026 04:52:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c09b911sm2425932eec.23.2026.04.29.04.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 04:52:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix PAS context helper function name in kerneldoc
Date: Wed, 29 Apr 2026 19:52:06 +0800
Message-ID: <20260429115209.283331-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nIjPdxDJq66sKTAQtLI8YegDUpJrda5Z
X-Proofpoint-ORIG-GUID: nIjPdxDJq66sKTAQtLI8YegDUpJrda5Z
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1f11b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7Vq1XlTpaAPeLlMfcZAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEyMCBTYWx0ZWRfX8wx8RKf9AFVj
 WG4S2o6KsxcPgAxw3sl+WHdeY+mSVDSJp1cyM4Xvc2UoUANcg7XFn4reGdGbQbbEkITe8UkQmNi
 huD/Y2ne2Mnn8OJe/g70ijHvtPyUYTU7LLhKjwo+WtCvje239Va5nMz8VO5VEf1dZkx/N4Of9U2
 PEXh3vgg5HfLDFsw1kGBk0sbmdK0mF3fkCWzaw1ju2iz5kriTbCD5BTCLPxuwdr9mc6ODD82ZXe
 UwkYM3txG9fmYiVRMjf4FjZxBJ9NDJY+BUS9ZtnQbCYI01XpTBbrxUEVS8RtbrY8Mm+NvFCjQjg
 UyP4x4ktlWcvyHccCmPxIkDHV35vAmlOQBZKBV0c8+o9StwDyc2H+lRNV4RToIoMEpYVOHYpbZ5
 mZ6ylmo1w5DUPFp2wmYFw/ejykHDY2ZOvPWWtgNlK8/ryChXI6kHd4Q6z+T69ng4RLHg7d/31v1
 SdwMS7uZPLiKQSSZgug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290120
X-Rspamd-Queue-Id: 990CD493C4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-105193-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]

In early versions (prior to v6) of PIL series for supporting Linux at
EL2 [1], the PAS context helper was named qcom_scm_pas_context_init().
But it eventually landed as devm_qcom_scm_pas_context_alloc() with
commit ccb7bde5f7cc ("firmware: qcom_scm: Introduce PAS context allocator
helper function").

Update qcom_scm and mdt_loader driver kerneldoc to match the code.

[1] https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Shawn Guo (2):
  firmware: qcom_scm: Fix qcom_scm_pas_prepare_and_auth_reset()
    kerneldoc
  soc: qcom: mdt_loader: Fix qcom_mdt_pas_load() kerneldoc

 drivers/firmware/qcom/qcom_scm.c | 2 +-
 drivers/soc/qcom/mdt_loader.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


