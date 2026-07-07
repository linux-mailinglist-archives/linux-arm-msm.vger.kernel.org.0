Return-Path: <linux-arm-msm+bounces-117234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dZTdKV/LTGp5pwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:48:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FF3719F37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:48:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pGV5bNOS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QPBOKwEw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117234-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117234-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FC81301C894
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5873B5306;
	Tue,  7 Jul 2026 09:43:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123573C108E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:43:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417423; cv=none; b=DiJ8ezDFdjfvZMkSR1r1DgsouglMXSOiTJj5qwUf/vG3jm+CCUExBzbeDsQER/YAi1+WErmnyGu9GeKX3pDICaTCzSZVIMIl6D0RQReojn5E5KYwhcSoWWHtDTZ1n9xMTSlS7qBzlWJPdCB012gMZ9K+W0pJBSnJlmE1wEyaFSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417423; c=relaxed/simple;
	bh=4Fy3CSL54gYiCJmKa8oBEYbszLGnUYvil/68csoAwjM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ofgCrPzRFhaKupzcU6kYz3V90gSfYI4QaRrFlG4IPNWQKGZc75wm2JSrrgBhWLApsFhijhFu815TJE3kykFNAdPc5VYaRMOn77z7mjYSx1rqNvRwJKxpKJcsr3gkUcco8PKaaMvRYydlFBDFNYqbus7L9qXjH3AwJ1CTFJAIcVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGV5bNOS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPBOKwEw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E4793004568
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v3Od4HG/qLTjM/UZgFQkeX
	wBKwUP2ZxKlymNqAxPTAI=; b=pGV5bNOSYr0658vj0hejsZGYbFz3gTqotQ/+nu
	j+fd/p3w2Gz4tEqlpbVIMG7GSu3KCaJfeiqjAo1wqYf6ISbC1hIKiRQIC5btk7V0
	5hphU9w/yqhXWBAuLkzQk30Zv+f882BjHaolF9KGtNauocU9mpl1VQkYS5x0GKc9
	/mv8++RAXnOg6yL6238JvYnqndJa4PXtdoR3eCF90ChNJXgBg4OL/nNlGjCYAf8E
	C9uSmUCEVXQy93XOJ2WUrnxH6uPdBYtOnpN2aHx/C8kKTuFnViYdLed7069zlMyh
	ZBnfNoBjG3GYItuK4nenNv36Yva2EwTbvsaZnLO3y5jrQNPw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su719yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:43:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c354050c34so48249115ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783417419; x=1784022219; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v3Od4HG/qLTjM/UZgFQkeXwBKwUP2ZxKlymNqAxPTAI=;
        b=QPBOKwEwfyDZIJfDKFE3leppyiCX0hZiLucjskIl/sKLPwSVrLWFV5rRYaoytHR0/S
         7WIZBydUX85kiOHpk2jKr1esEu5JZb6c3Rw1rJsII5FhC1HCXbb006111SS18puKOwWg
         4YawERgp9EEdjyGT6ZpXnI4Dp46+jnlgqHrZdz0yLucMlVZ021j2RUU3vLTfaDXHinoe
         TmL7MUwLHfg6WtYbELirpXez6UUq+Q7qSzKKmTiaD1vZVYgjn5FOEHtiM6DLNeR/Pa0r
         Hl/zAJh0FuzlqBPHiqCazCgkpmyV0IXlOAtLAPg5FNRZKYLgc0Zb0qgeU0Djnc9cXBdv
         lfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783417419; x=1784022219;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3Od4HG/qLTjM/UZgFQkeXwBKwUP2ZxKlymNqAxPTAI=;
        b=caCZaN/PkhsC3AZxNHzlHDFegaRMC5njcnIb9F0UyGRUOizWdHFey1vk7QVEy9kVrj
         HDuldylB6F+yuyhkb7LCrpbX4+Q79JdJLwnK94EUn7gPQmsZ+EageuE8+e+tltacoAnR
         23jqfxpYJ/GcnMu10yQ1VJXK+H2pRB+xjyOStf4CsxaqaOVku0WFsXFPOzqhDJpAiwhl
         i3cCy9KlSczzAXveeQHH4SNKSRVDnRxeR8AvcJE4wsQehFboOmsX+B21sNN6uqdqqfGY
         IT1SN2xWI7apWLh0czYs66pMuHgkNqc61EkdwAm2DHzgV6QFTSiiJ9Q2EXEqAXA/W4zH
         EGkA==
X-Forwarded-Encrypted: i=1; AHgh+Rop9+/jpZVV5d0Hy5+0dkgI8P6yDL7h4ZFRnmsmK801lh7d0SWoJtPOgEFDPEDAyi5Hy1xG5WEbMr8XR6dE@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNy9MRHnr5/gjUxwPXzdUdbjlEheaMFcDe2Kjf/oBa0rcKGQI
	SCISix7dBlo3p+WZBaBqdgnh+t+gHJtPrPpiHJHPbocmumIRhH47cBNFLyI8AZi9dQX0You2nKT
	GY4PelDeifVCBd8TlLqlSzOAkljIS2wQMW7Gpi8pkJMCVhlb3VTWQrZWQ+N4IjbnoCXjxcGMEI2
	pH
X-Gm-Gg: AfdE7cnzTbUw2Y615EORUKWgUkJ1hzRY2rcO8oaVqOXGdG6Hun2Fmt64gmwHXK+664l
	CvVVbW6G6WygQM7W57m3NY5YaIdsF6BtVxhMiqEtK2gYjx4mlHP81a5IKRH9E175PluscNbkt3N
	gulWWskpK3dEAoaSwQlYe6kcFfsCObyf/hxeUhq1M21m4WUQY6iSCP8Ae4PqexAhjAwvM8HWFf9
	H7WON9IiboCt/tpPBb4X1q8xWt49XwVE9sDims4Csn59RdehJWcv9mzWba1UABI9FPtgMmS5dh/
	MQmzbFODjSJfJeIU0T53R4XWMUjL/8c4Ph9K+gtPkUtAo8zGlwLRIqUIk1E8zdhKKhwrapeRRI3
	raeJaonIYdlFBVc6OUnuVAhDJvA5eXzgkWDnFRgo=
X-Received: by 2002:a17:902:c409:b0:2c7:ef3b:e17f with SMTP id d9443c01a7336-2ccbf04dbb3mr46390825ad.36.1783417418821;
        Tue, 07 Jul 2026 02:43:38 -0700 (PDT)
X-Received: by 2002:a17:902:c409:b0:2c7:ef3b:e17f with SMTP id d9443c01a7336-2ccbf04dbb3mr46390595ad.36.1783417418344;
        Tue, 07 Jul 2026 02:43:38 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm8422075ad.77.2026.07.07.02.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:43:38 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v2 0/3] ASoC: codecs: lpass-{tx,rx}-macro: switch to PM
 clock framework
Date: Tue, 07 Jul 2026 15:13:10 +0530
Message-Id: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAC7KTGoC/32Nyw6CMBREf4V07SWllYeu/A/Dot4WqRGqvYXUE
 P7dgns3k5xk5szCyHhriJ2zhXkzW7JuTCAOGcNejXcDVidmgouK11xCdEAa0GmDECL4CKdjKRs
 lsFJFw9Lu5U1n4+68tj+m6fYwGDbR1ugtBec/++lcbL1//rkADkpiVzWylFLXF0eUvyf1RDcMe
 QrWruv6BXfh0X7LAAAA
X-Change-ID: 20260703-xo-sd-codec-tx-rx-94538a2c6a18
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfXzZxSc1/82brM
 EeR92DHco+kPiyzJGVap4ifDDKAf0GmZAhc4YYiTD1YgVTF+uvLpViGaCR5/h09KxXiEO1UZj/D
 R7hj6HTKtTxaz4ZZqPTrR/usn7kOO7VgQSfImceMMbYzCCYvxftGxXqLzyrlM2nLkZKmU0VrmEA
 sj0m0Mou27r8R3WjmfDXEU7O+O60osujT+M5OlDMvJynk6ZWDWOPaL9XTahymI1Su/iXtjx875t
 WW2Pn+MpBgh9b+0bGUoGUyW0mYK1szzk7WtHXNqc8hi8QM1uXRb/O64ZDYkopaRWCgeeF0hvGZt
 yC3QnC2HgYn7cXFUYKpSTeITZF2lwbROBD2HIUF9bS1a9VWw6HaC7EFnYjvITnZ/A4Cj6aPXra3
 sx32xjV3eiFIIqz2p16PHVNcw68/SmT7pESc1Q6K+zSQMXQ9PCqideKmsXiDUr3YIpvl4v/w8wR
 pMugYEPASJ0JUXJoJqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfX4hIyikDt349x
 qbjFDmzInNpi4pVc2KAWFy5gV6O6I2S06TX9oUOyMvkRboFmufMyTky+LEWcavZeJBG+cfDwIDP
 Pak6RkQPZkwzLAjtCsFg5bdS3OapawI=
X-Proofpoint-GUID: 8zm4teTYWMy9BQYGy6IIukqGDtNONGny
X-Proofpoint-ORIG-GUID: 8zm4teTYWMy9BQYGy6IIukqGDtNONGny
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cca4b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QJ97XWDbBAP2W4fLZ08A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117234-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ravi.hothi@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0FF3719F37

Convert the LPASS TX and RX macro codec drivers to runtime PM clock
management using the PM clock framework, completing the LPASS macro PM
clock migration started with the WSA/VA macros [1].

The conversion follows the same pattern established in the WSA/VA series:
- PM clocks created and populated from DT via devm_pm_clk_create() +
  of_pm_clk_add_clks(), inlined in probe (no helper wrapper).
- Runtime PM enabled via devm_pm_runtime_enable() with 100 ms autosuspend.
- runtime_suspend: regcache_cache_only first, pm_clk_suspend, then
  regcache_mark_dirty only on success; rollback on failure.
- runtime_resume: pm_clk_resume with regcache unwind, regcache_sync with
  full unwind on failure.
- SWR clock gate prepare/unprepare routed through pm_runtime_resume_and_get
  / pm_runtime_put_autosuspend.
- Probe error paths tightened with dev_warn on PM put failures.
- Empty remove callbacks dropped (devm handles cleanup).
- PM_CLK Kconfig dependency added.

Patch 3 adds clk_set_rate() return value checking as suggested by Konrad.

Changes since v1:
- Dropped unnecessary NULL checks on npl before clk_set_rate() — clk APIs
  handle NULL pointers gracefully (Konrad).
- Added patch 3/3 to check clk_set_rate() return values (Konrad).

[1] https://lore.kernel.org/linux-arm-msm/20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com/

---
Ajay Kumar Nandam (3):
      ASoC: codecs: lpass-tx-macro: switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-rx-macro: switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-{tx,rx}-macro: check clk_set_rate() return value

 sound/soc/codecs/Kconfig          |   2 +
 sound/soc/codecs/lpass-rx-macro.c | 116 +++++++++++++++----------------------
 sound/soc/codecs/lpass-tx-macro.c | 117 +++++++++++++++++---------------------
 3 files changed, 98 insertions(+), 137 deletions(-)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260703-xo-sd-codec-tx-rx-94538a2c6a18

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>


