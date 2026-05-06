Return-Path: <linux-arm-msm+bounces-106052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN53IjvL+mlTSwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:01:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2874D633C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3838E3011773
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 05:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4C02D8DDB;
	Wed,  6 May 2026 05:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUQ9+sn4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ymm/g+j2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A341E12B94
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 05:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043677; cv=none; b=cmo43pigX6s2XCh3vxk5cn58nOcdVf6QSEspntpCtOm3Y0ROZ8OydTXxYNb2IAyzsmIbSH+/DNzEHtZEWmMjnFLnCcmU9DK4OnuHUAQh6tC/LinLBmI7TSrR1XH3PANP223Py1MsSW8b/FyDcDcGyOdiDmyL9bTQERsZoCIcIjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043677; c=relaxed/simple;
	bh=D1JehVkbKCt+fypteMdLlpIR/7wzvP9JH5a/XtvFpKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hONz2CxgYyS1h4OTWV1kSs0owl9S+b1Lc4fHR2s8pqzZGM48UgPypXl7huSVC4+mRwpwVZhObJLBgxvDKZuhj9I8DxsMpj79lHqoJYyQboYciofxtJEaFt7d89gN0Zu3+1LN/wYVyYRH11RVqDyWMhSrDcm4ZDfNhgvX6Y5bzPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUQ9+sn4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ymm/g+j2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Liit13475626
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 05:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=njmoaHdJJvcotm/oMjdr7N
	BQSgdOZqg0OzeVlE5YQpE=; b=WUQ9+sn46hlMjm0YyPihbdavcZNmm33YvGfBgV
	4ORlmnKyipwtQuaL9F81Bc4ZpMF8WbwQxR2JL91v9Xl/mViAAXKvAQTpWLOfhS9Q
	OEUlPvPEBnOemdob3raFnlFCnj1ApyfP/mc4Tfi9JfIpcrICBF0VpSoTV0iTFSi7
	P43H6alxhFf26XUMMl15xV4BLoH0BwDrvESdoS52mP5MXjG7O4y/+2b5VOA232mJ
	mVhAaUdiJoCFNEbhUvSdjMDzkD8CWWIyfDfJ8Spr7RKqwdXIwCWXo5CDKlnvH7cW
	F8PBHG5g2unczrugOWhRPRica/KoWXb/xwktQN3grEKjjFUQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhsgu503-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 05:01:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8397b14a689so650694b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 22:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778043675; x=1778648475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=njmoaHdJJvcotm/oMjdr7NBQSgdOZqg0OzeVlE5YQpE=;
        b=Ymm/g+j2ktuNsIkAoMbmUIWDcuO5vSP6zWIk470GaeIbZDAF+RWncH05Q6y8Om4Cf5
         exHH7wOlJfmv9t4zMnLVusK0F/t4qWcdM/D0o8hzApQ1wiLafBq+SCO77bnSbGydZaOg
         QrpGZ4jzxlNfGvjmEooB3C8tG8v0Or7ya4ecPopKqHHa/UULaToB4ac9Fkpkuvn8QtMP
         qJhE76LFU7GygXJ6QCoDuSa2s9GH3Jp4ocX6eckMpWZ0PlXsegsBjDRvyhPToDbeZKMJ
         C9wFaXdc3oMj5hQy211AsJx0xbh+2XIKRVAAVutwdVeLZViE9mQYt7wqd58yrwojSCfc
         J27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778043675; x=1778648475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njmoaHdJJvcotm/oMjdr7NBQSgdOZqg0OzeVlE5YQpE=;
        b=sbgrRpErA1dvaV4sX5PL9sn5IkMlO7wYFaNKnXApAqJT6CKFsc4Jg543ssbPPR6HHk
         BEJqwh/szG37K/fiHpuF1yaTBU7qsQTx5NK/sMMR9Mu++plSm/Wlp1YOd9XzL3Qgxmq6
         7etR3ww9uLKiRkAiT2z3fbc5mN85DWKkcuYfumqcPRWaFkAGpntLl4rPLNHc7M52HC9t
         KjQKMMvqjkRckr49WyNpcJD9PcJpBcr8HUQY4sylxzPK46YdcmWzII6Vw3Qguq44Gbe1
         6jiHyZx98iGMhEg+Ut+xEGsR2obv22SuD18kNqAfVb37p0KFbvxGJwd33VHOTEZ9icxy
         ODoQ==
X-Forwarded-Encrypted: i=1; AFNElJ995A/4XxOviZErEz3Lfxaprsy3uAXUilAOfoFbf5i35i8ELeqnp4rNu+wcwdRAYEcgAgS/qM8yHhzFppgW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp6tuoGzNFm3JgUMDqRcQVX/ab7wKdKnCaVwet/SJsU4ojfMBa
	CO569sjx3PEZWRXyT67dg2FJ3irzoU5A0zuzcwzh5rx/+MOKeaOwheISSCHkJU5tiCXqhErT/xf
	Aq2KkXxFVTYKw/hGFd+xktwzvjNDitUIHSN2Gd6xo0OA+lJD0RqjzIwwc2QWTQ6rARySA
X-Gm-Gg: AeBDiet2aHTy30uPH/Lxfz26m3nyNCTuHY0HDlVEITyJQi4MK3C4ls8Vx6cLMtXI2Uu
	Wc69zRAr2lYMZfezO7Vqdrub9gy0g5Vk5WBl9ByjFUcNIQzfz6G9UPmkEyd4oyypzu9C2hO0vGO
	6gDSs+u4snmUjZLziZHaskV189bsHNtr6gG+J8DbApu4kTRPwDq1oazpJOU2bKnnrBxkjTaJIh4
	o/2es69VtSNeSuPNKshX6EYlvR2Qbd89+UK4ucQaiY3nS5qPLvdYuCPAiqxpUMUdVlobWP61zjy
	4LPyucyLPjAbNrNwF7byT4NB/ZTOmdq1uF/Sc33KsTnXeoDTFQNNjTeUF6//LLFp+ez9m9kkNEj
	iwOqR7WaR42kuUiwfsBaVM1NuLgOLtCEOgXuFCBr02msTlQL22JiJ3pR25WM=
X-Received: by 2002:a05:6a00:288d:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-83a58736dacmr1762493b3a.0.1778043674895;
        Tue, 05 May 2026 22:01:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:288d:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-83a58736dacmr1762451b3a.0.1778043674201;
        Tue, 05 May 2026 22:01:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm4891620b3a.42.2026.05.05.22.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 22:01:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/5] Decouple resource table definitions from remoteproc
Date: Wed,  6 May 2026 10:31:02 +0530
Message-ID: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: w5Lgdjx_itoqzY1YKDxVwECHcQ0hDpgZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA0NiBTYWx0ZWRfX0wChLJnnubT7
 /vor/3tVMW090TVm1g8r8lqoa4yBV686kuhjdRgs8rM/Yj4FvAEsV8vt65sVv0IZaBVcKA1OZeT
 76xG4bEsjHW+9jpHJ5LCCUxscich4c51pWylf0IL514iTivG0FtMSIh1d3HN9T0wYIIIsg6PNsO
 CelA8NbjjDJLIPsQCFZ7gL/KDqVVEwnOR6J33M5404+euxaAd/kO9oh+frwdZoSPsnI8rEokvlW
 nt6Vyo6xfyyB6KUbpK5ZzSxJXu2Q4U9VuCmGPZz3pIVIBaYw6WriPkRBqDmtTLZUAR9brOqs/K0
 bvGWsd/owvviXFv6q+yITHlcf2qMqyKs0KlWIhNCfEgpbR4NfSvUBAvNTPjl+nY4Qz/peV54mcl
 xomngTPDe8onzPLQ16+p3ZrjvNhUz16iY2BlPTUV57UZ2dw/c7nhr7Z/4Y+7Cd4GOHKGijhMWXq
 VYhxjyXxbzJ2DmumqLg==
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=69facb1b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=NjB5iW5zeD82yTAlFDkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: w5Lgdjx_itoqzY1YKDxVwECHcQ0hDpgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060046
X-Rspamd-Queue-Id: DD2874D633C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106052-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The motivation for this series came from [1], which first introduced
support for Secure PAS with Linux running at EL2. That series covered
both remoteproc subsystems (ADSP/CDSP) and non-remoteproc subsystems
(VIDEO), but resource table parsing was duplicated from the remoteproc
code. The remoteproc driver support for Secure PAS at EL2 has since been
merged, and video enablement is being pursued with [2].

The resource table wire-format structs live in <linux/remoteproc.h>,
but non-remoteproc drivers (e.g. video, GPU) on EL2 SoCs also need
them to parse tables obtained via SCM calls. Move the definitions to
a standalone <linux/rsc_table.h>, add a generic rsc_table_for_each_entry()
iterator, and use it in the remoteproc core and a new Qualcomm MDT
loader API for IOMMU mapping of RSC_DEVMEM entries.

This series is build on top of series
https://lore.kernel.org/lkml/20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com/
not for technical dependency but for the file change in mdt_loader file.

[1]
https://lore.kernel.org/lkml/aKXqSU-487b6Je2B@linaro.org/

[2]
https://lore.kernel.org/lkml/20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com/

Mukesh Ojha (5):
  remoteproc: Move resource table data structure to its own header
  remoteproc: use rsc_table_for_each_entry() in rproc_handle_resources()
  soc: qcom: mdt_loader: add qcom_mdt_pas_map/unmap_devmem_rscs()
  firmware: qcom: scm: replace <linux/remoteproc.h> with
    <linux/rsc_table.h>
  MAINTAINERS: add rsc_table.h to remoteproc entry

 MAINTAINERS                          |   1 +
 drivers/firmware/qcom/qcom_scm.c     |   4 +-
 drivers/remoteproc/remoteproc_core.c |  81 +++---
 drivers/soc/qcom/mdt_loader.c        | 189 ++++++++++++++
 include/linux/remoteproc.h           | 269 +-------------------
 include/linux/rsc_table.h            | 359 +++++++++++++++++++++++++++
 include/linux/soc/qcom/mdt_loader.h  |  22 ++
 7 files changed, 612 insertions(+), 313 deletions(-)
 create mode 100644 include/linux/rsc_table.h

-- 
2.53.0


