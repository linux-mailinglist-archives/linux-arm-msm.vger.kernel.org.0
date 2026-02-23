Return-Path: <linux-arm-msm+bounces-93749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGRiJIqXnGluJgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:08:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB50217B413
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81849300FEC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E035233B945;
	Mon, 23 Feb 2026 18:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYr0DBz8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5Xf9XbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3BD33A9CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870079; cv=none; b=eXTUewfu6lUEj/SHJiNdmdkc6YUzRn/0ozBdlQjih8dm9ofpT7roRA4Z6jIPuyW5AlAcRpeaDNGdH+FngqMlCqKm6a+pf1gFSuqWl7VBrVdCQ+o8kGQzWxMoM0aBJaXcpnhmiNr2Jdy4w1NxZlLNvqSCz2z2iSmX4GJeZ/FA3w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870079; c=relaxed/simple;
	bh=5A0PZJ0tcK3fkLbl6nvYDc3AaJ58tBa21J94OKzY4+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cs/vi6ZqXGcBFQcrROYKLPteFPYN3L+bdcq9PDIWtpTc9tHeWfXPuDP6wZuHNQ/2vdkx7/p2noiiMs5TLfYfYlAGEUuUR+hjpaznslZC932tiM4DADeOes1yvyEuBVf5iaGfVDP/8OjIj33XS4efuNULNIVhrrDeeKrWicJRnyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYr0DBz8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5Xf9XbB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRba51641380
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=37mbn9sGZIUZw5Cf10iBTiX1YJvm5soAKR6
	78F1qQkw=; b=FYr0DBz8pwoQxydF9LLASATu1nmPKJcXUan2LZh1yqcmFyFr44o
	hT6Um2OxxvfpxlzYHEOlxD1WFeLTPlV8WgjQQEjV8UHGHek9Ywlb3ao7v+jPifF3
	iLRGcwmh6rOXKhIISElZjABvixWjdaMDQcReJr/e/Q8gSoV5AN5tcd+1YVLzlA6D
	DDgiRrPWu/a/5kLDiERL3UCB6ImcMa9mQFHm1q6IJtAZd3fDBJaEghVvVhZzMz28
	VZDTdWzrWWRiJvVzCQ9yo7DAOhCvTAKh7147WWOs0nxuhcKZe+LLGvsZCMLYtlzS
	Ox20F6WciG1NhxI6iM/P/5n2noNjL6c4f2g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8rb2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:07:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so5666391485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870076; x=1772474876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37mbn9sGZIUZw5Cf10iBTiX1YJvm5soAKR678F1qQkw=;
        b=K5Xf9XbBcu0RrdwNSxV+FbR60tq2d8TzAn1lMfj41Q2QDfRRY085o4ZoQ50cs4C0GD
         6tPoQSwmpW0JtLExqYoYMyV/uqEImA+FB4gGO0RqeFJ4qdwfq8YydfjesXQBDg2p6mVU
         3h3HpS6lvxX0hZP+D351fTLoiPWOWCiW2WuT5tmhSb6APo+WTbJ+/VPX4PWWWalzOKuI
         FXt/ZHRtF1n4l+E2KUq9PS5cuCEtxnDORIv4/HzfT0ZYa9HAiLXPNvejWhLIY1SG/BM4
         6yuyeUNv7eqeSUWYjbcTQe313G7XSQzTXydCOXLE1kvIXoiEbmj42vICd0Ffc4R+LohR
         gWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870076; x=1772474876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37mbn9sGZIUZw5Cf10iBTiX1YJvm5soAKR678F1qQkw=;
        b=evMBmD3ax1pt4lx2zPVwcv7TMKuP2BeKKLqcfbSJkeVexWYDvIO+6zDkbIZrcBblSt
         KQ1uuEpPBevhJwd/OaMHmCnyr8f510daPQOa88wraqayHxGP3VQUaZTEqU96tcrgEWX3
         JyuslFSWuCpr71AuFi+YpP/X6kXyp1gaq3kEbW3i3IWocD2bAppFAcBDYAYBw707OnjS
         zQcxvpX8M43ZWq//tXlcBzRyXL/7Afr3DT3BLapJLOmMvVBNA43VKe0Xx+pJ+G3w0FPc
         gUg+hP8EnZu9a5ecLts9fxuxDEIN4KzTNPwjBJyDsMHOEZTb4S045PYikX6ajSE47Wbp
         ZlIw==
X-Forwarded-Encrypted: i=1; AJvYcCWv6x8ran9Um5iZDLoTXHBsEWwNW+T9aabPI4B+XAs5J8vPxd9rhn6JI5T2VKQQJr8R2+MB5AkYFhkW1kkj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4yRw5RkvxQCqUufi5C/wyqQJtKkH1WMOMAczeqGQ5lPrGe/97
	bNa5mwAp1+55lftDJo+u+DjFCHS8Cq8TOqHzrte0aQaJit2qd4Ejfyhz3H9Jg1iKso5eQGIKaYp
	lyBVqlQIB/yQgfRGBrb9UiCv0JRZyTqKI+u66lTXKPI7cfGxjQyJdvuV66BagpkD2Zmll
X-Gm-Gg: AZuq6aIMn44Ky5IDLnDWVSL+RXmr+U9sFde5tfW7TU/pBScIlphmAs3uVCMlq6gGOql
	ih6BwMuoGZA8SduCkgA3nXIpbmgM4b+FR92GcEUqLdmPaVL/3K1qPibHM4ADzze06af2nyT3IiF
	RDAr4g1DQJLbOoCr1ba55TxJlAnVp913PXnNiLua3tht97ZI6dkYGtjSKcA1p9Jf/fKsg9ojxC3
	L6EuvwEXd9bnUsWVUHF0zGaRGNN4h7Qi66ZwDPlgQ+H7TJicFD4qzbV7EBEE95WHnRXkqOJFRkh
	46GYRtrtd9b5PBNg9jROI244K3DOM5e4B1KQT//QpJQeclWT7OyUepjBpQ4wl4ZytV6T9SenOF+
	qa//CPsuRuorrWRNqMH0hAgPRoRuiWDFeMxlnrvhpZiqfF1Ym8JGaqp0=
X-Received: by 2002:a05:620a:4090:b0:8c6:a103:496b with SMTP id af79cd13be357-8cb7bfc8d5cmr1983721785a.25.1771870076120;
        Mon, 23 Feb 2026 10:07:56 -0800 (PST)
X-Received: by 2002:a05:620a:4090:b0:8c6:a103:496b with SMTP id af79cd13be357-8cb7bfc8d5cmr1983715185a.25.1771870075545;
        Mon, 23 Feb 2026 10:07:55 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:07:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 00/14] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Mon, 23 Feb 2026 18:07:26 +0000
Message-ID: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4ZcxMD4uanhweKJ3pmk1xT8kqgI9wFkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX6ErMrGJvdHpw
 Gg3GjEG8LY9tPTHajRCPIBN+osxLVKaZNrzhX4ZicM1hnH/VNeyCSqS7na8hLymMTmLV39xsXDd
 YdWsg+uXeVVoPOUDuyWIRFG61fawBJvLg58ap3dtxp60Ij0dWxGvWMoYJKj3AaMVLBd4+3cNsT8
 ozBNCIJk0RVIqR8g+s3oIKntq81bKC5QS2Tie/Vqn3qfsh3eslBuoG3WW5apPGlmfEkvmFFKxmH
 BqSoJ20DWAouXo87NtBd0HzXD5E5htYYUm8//mQS8snFFjagkfSMy3c4l8AZpRY5+HW2d8aJt6X
 xGkx5exmuFb9FeADif1DYd4+pj9kPMRCcCL6yo2fltB05qh068bEsBG/9ZgiCL9jTVZtAxGY25g
 xuKjAo70dy6kvVTP55kC2cQn2a0tH2UhAezLlnoT5FX8JaGIQLBQpH5ebwSJkGZjPk2e1aWyiXf
 6bIs8D/V4Gnxc1TavKw==
X-Proofpoint-GUID: 4ZcxMD4uanhweKJ3pmk1xT8kqgI9wFkM
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699c977c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=CdGEBIRw-R72dx1e2_YA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93749-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB50217B413
X-Rspamd-Action: no action

This patchset contains few fixes for the bugs hit during testing with
Monza EVK platform
- around array out of bounds access on dai ids which keep extending but
  the drivers seems to have hardcoded some numbers, fix this and clean
the mess up
- fix few issues discovered while trying to shut down dsp.
- flooding rpmsg with write requests due to not resetting queue pointer,
  fix this resetting the pointer in trigger stop.
- possible multiple graph opens which can result in open failures.

Apart from this few new enhancements to the dsp side
- add new LPI MI2S and senary dai entires
- handle pipewire and Displayport issues by moving graph start to
  trigger level, which should fix outstanding pipewire and DP issues on
Qualcomm SoCs.
- remove some unnessary loops in hot path
- support early memory map on DSP.


Thanks,
Srini

Changes since v1:
	- removed LPASS MAX PORT define from bindings
	- added few fixes found while testing dsp shutdown usecase on
	  Monaco.
	- replaced tab with space
	- added port range check in place at runtime to catch array out
	  of bounds in future.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add Senary MI2S port
  ASoC: qcom: q6dsp: Add Senary MI2S audio interface support

Srinivas Kandagatla (12):
  ASoC: qcom: q6apm: move component registration to unmanaged version
  ASoC: qcom: q6apm: remove child devices when apm is removed
  ASoC: qcom: qdsp6: topology: check widget type before accessing data
  ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
  ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
  ASoC: qcom: common: validate cpu dai id during parsing
  ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
  ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
  ASoC: qcom: qdapm-lpass-dai: correct the error message
  ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
  ASoC: qcom: qdsp6: remove search for module iid in hot path
  ASoC: qcom: q6apm: Add support for early buffer mapping on DSP

 .../sound/qcom,q6dsp-lpass-ports.h            |  12 ++
 sound/soc/qcom/common.c                       |   6 +
 sound/soc/qcom/common.h                       |   3 +
 sound/soc/qcom/lpass.h                        |   3 +-
 sound/soc/qcom/qdsp6/audioreach.c             |  60 ------
 sound/soc/qcom/qdsp6/audioreach.h             |   5 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |   6 +
 sound/soc/qcom/qdsp6/q6afe.c                  |   6 +
 sound/soc/qcom/qdsp6/q6afe.h                  |   3 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 105 ++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  47 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 187 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  21 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 +++++++
 sound/soc/qcom/qdsp6/topology.c               |   8 +-
 15 files changed, 387 insertions(+), 161 deletions(-)

-- 
2.47.3


