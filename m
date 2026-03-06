Return-Path: <linux-arm-msm+bounces-95795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO/VOkHHqmnVWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:23:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 102EE22080E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75114302543F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 12:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8027D38F95E;
	Fri,  6 Mar 2026 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hksN59Kq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fsj4tvBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE851B4257
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799726; cv=none; b=IvtvKXOb6OgSALfamyx76H6u8ndqUgQEHUiZk4D6MBdCX9jn0hvj0buCWEk2quhqP944mOjl+19NsE0dlUwvJpt8vNNx9dxCBEjPHYxqrWb0sfE2RhbzhSz8PS3s+HsVngMvz3+R+juSnMLq7VK/oRMwguqnAngQZ/elmgtAYZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799726; c=relaxed/simple;
	bh=qxPf+3XjJNgYQuJxRytsLvp6bwbDQyQcuHZPjIAZXFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rKhBCZEtRqjcftZnqcAdcfBrYH8pR2aiE9zhZUOC/hLEeMlhoCqhUZuO7Axkg3cER8cfTQVKtTWbvV80KJrg99JYTdMNf7N5h+4RAjFS4ortBzw0Q+2gSTXT9LSNayS6B1EEOv/A/3e14S91eIZ9dlHnsIq8WgcN1NmfVowIzbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hksN59Kq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fsj4tvBO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bag3I4185912
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 12:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Dqf1okfGInzL2axMVnaWbPhLXJ9Hlnq9fbQ
	hY0yio+g=; b=hksN59KqqRkfn5UuI1FcNU104xy+pDSbU9YBz0wil0EkjZy2faz
	L5OJAx5tH05PTtsRh3Rk8uAfVKK29tD82pin09kVG3i4M6pp2k+2odQ9H3ViILXd
	Y7qfolS/JdcyQB6oHP2V3GwuwqVqK1uiQ2Vfx9cDKYrcVhA3ydnAWC0QnD29dVbA
	dSI615qG7HjK8KfpI1nEgcftG1OtQ8zpkEGNY/k7wfQX+14oa+WkBqTGrcdf/0VZ
	2JWdWl6QAQl7uJXzBDX8GATlAE/V2wfKH9FW2p0GPLOAAUjd9m15goR7VIe1pLJq
	+2S6x11ZWLyi/gd9MSZa5WP+Wx6o1XKv0Ow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruk9a83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 12:22:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so5785762185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 04:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799719; x=1773404519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dqf1okfGInzL2axMVnaWbPhLXJ9Hlnq9fbQhY0yio+g=;
        b=Fsj4tvBOlSfFBjK7uYNjlL15IcvmPFn/xxWcA+Ca1gcUSmBTAon/iACNVtRD9Hv9zQ
         x+9tW/8QwNSwy4QhiAqRWlpzJJ3BnuFILA2TymnUF/rD5QRqSQMI06wcel4lTPP8IbkG
         9/DxDIVrONNuLJlk1ImsoIEt2Xe7N+7Ed0Mhqi4zbpAj94VgbIKksGJhcDtU8a4yYcJQ
         g2dFG+yvjA/4EXvCH3OuuOrC5L7zD49rS1grRCEACt9NY4AfK7n3brceuWH/xgxjNwV1
         wykhogAWx7eCXhRJUOT9Z7lk7eWBz6q6W/bzvYKH5WzQp4YF1FerbqsabKH3CLVFSIoT
         Oprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799719; x=1773404519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dqf1okfGInzL2axMVnaWbPhLXJ9Hlnq9fbQhY0yio+g=;
        b=KjBVnNmsz7Hg/9mc+MpgvmT2Fki9NoLpFEVXmXoycb1V8qF24kv/IhbovH1WqFs7qG
         Yn20n06yt1WMF6wgFJPC0oYY5mE4Af5H/AtXumoCmXi+bc2pOAOcyiu+qSHGt0bCtC6i
         Q99uLxFkngG30QtbYPC7oMkRXoq70WOvDal674DHJwd5AUaEwQE5kg0HjtYwFyF4iqor
         4rg1YpIJy6SnDZbBj5EUmYLFKWGwVagMZhahzOh5TCNtfuvilqAn+PEw2XMLtl+w7VcS
         w3zPA+h1PESNvvfgdigdMP1OQV+EMbu7uaw8L2f1l1c7NLOrNoR4mGD8BMsvD9i7Muo5
         evEg==
X-Forwarded-Encrypted: i=1; AJvYcCU9gV2Mo7vNhxPAW3284KZTpoHXP5BdKMahQ5LdgnIXQgM7+P5f1XKJDB1XAn/U+XhuiHAtC5RhzF9Dj4IV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+UZYvUVpm5O/vflU2Ew2J2+VMpwkePoI29A6npHromIjVAQRB
	RahuD1zxigq72YG9R5Xn+jR4ePFRbaM3yM2sq+gNB71CnauZUuqD46HqVwjvf7MY52M15A7N66A
	DmahBclaR6QQtwfaqUDF2Ci4duLAwoMu6qZIP4rh2Q9YAo/NcmK4OSFANzCbrLAJ9kkyh
X-Gm-Gg: ATEYQzy8CHsJNWXR13HA+W+TCY/0dpIsV/03JtheuF/CyghMQAjv2+MkwVA3qLjqox/
	NY6oqnLTyc3QT/YCeXu6HC6LQzeNgjC2iZvLrHq+3KXh0T7AjSqAM/t2sBojl6oaAJeCVozJIOr
	zHJ+7Yx1R4+x5ze1S3kp3kiZKGfDa9eVo8oX/he96+Su/CaeyzRk4waM4dyvO6MtL0iqVqEiK9t
	bBC65QPfK3wUNZEewIaysG0ELNMVZ5UUrQLVHrdn1xHlVZXR4Q6qiEEC3p96XxvG37GC4X/SH+n
	KSoAF5dN+DpFNdnH70F/MU7rwGTLWQC14gUCpuP5R9eTblp0m/h3r1caKAwcRXvjtf56OHPBurj
	Vsi+AMf29QPpn2x/XWf8iy1sj1v2WBV1dForwEvlID6jq9PhPdQb/Gv8=
X-Received: by 2002:a05:620a:3f85:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8cd6d3d915fmr218385185a.2.1772799719505;
        Fri, 06 Mar 2026 04:21:59 -0800 (PST)
X-Received: by 2002:a05:620a:3f85:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8cd6d3d915fmr218380885a.2.1772799719040;
        Fri, 06 Mar 2026 04:21:59 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:21:58 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 00/13] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Fri,  6 Mar 2026 12:21:02 +0000
Message-ID: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX5SlvGBQfzjg9
 6iEE5ofuI/EkdWfI6YM3HwtMnJgyEF1v0iTHFOs6BcsfwXdSQ3v/WN3Y9rsd9m7P9MbiN+OCSgv
 KBtQ4j/upyszV1hM/OW5J6NxWOoH+4q3QupBE5+E82tGdXzvFP40E8LASkVpxGZV3nwRcix+MPf
 zLrPordzCMXCkt2ZrZ91gZwyK0WTlrjmjf56X+KySnK8UEaf7DI2ReGGc2RpZSzoS0FKu5PpnsM
 +sPKssE/2Q0JWFZgYtpgCLFnaVFHMy/BGQWZynjS/SCyt2OdfMV2lyRSMW00jOfU6qRNAg7A6Pe
 zGBOG9hayvJT0e3oUIwl1maMUP2O7v3WNuqG+asfT6UOU0vcsltxWLSmiSH7I6QE3pRdyRHg4gn
 XeQD3y8hI4KcIZnRIiXWTHKrZ5fxiGIdPMTgr0+xLJARPLAqeDnvOUSEdqETBzuPs3iv32HH/Av
 fgschvwUeBAhLyJaaww==
X-Proofpoint-ORIG-GUID: WtlnbJidr_W_8ZKCzStU9Dccutzzp70G
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aac6e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=x8kTagw7d3iPfLn8lj8A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: WtlnbJidr_W_8ZKCzStU9Dccutzzp70G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117
X-Rspamd-Queue-Id: 102EE22080E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95795-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
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
- add new LPI MI2S and senary dai entries
- handle pipewire and Displayport issues by moving graph start to
  trigger level, which should fix outstanding pipewire and DP issues on
Qualcomm SoCs.
- remove some unnessary loops in hot path
- support early memory map on DSP.


Thanks,
Srini

Changes since v3:
	- squashed 2 dt-bindings patches as suggested at review
	- updated yaml to reflect the new port supported

Changes since v2:
	- removed non-dt header update in bindings patch.
	- removed some leftover debug statements
	- updated function to void where it did not make sense to
	  return anything.

Changes since v1:
	- removed LPASS MAX PORT define from bindings
	- added few fixes found while testing dsp shutdown usecase on
	  Monaco.
	- replaced tab with space
	- added port range check in place at runtime to catch array out
	  of bounds in future.


Mohammad Rafi Shaik (1):
  ASoC: qcom: q6dsp: Add Senary MI2S audio interface support

Srinivas Kandagatla (12):
  ASoC: qcom: q6apm: move component registration to unmanaged version
  ASoC: qcom: q6apm: remove child devices when apm is removed
  ASoC: qcom: qdsp6: topology: check widget type before accessing data
  ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
  ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
  ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
  ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
  ASoC: qcom: common: validate cpu dai id during parsing
  ASoC: qcom: qdapm-lpass-dai: correct the error message
  ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
  ASoC: qcom: qdsp6: remove search for module iid in hot path
  ASoC: qcom: q6apm: Add support for early buffer mapping on DSP

 .../sound/qcom,q6dsp-lpass-ports.yaml         |   5 +-
 .../sound/qcom,q6dsp-lpass-ports.h            |  12 ++
 sound/soc/qcom/common.c                       |   6 +
 sound/soc/qcom/common.h                       |   3 +
 sound/soc/qcom/lpass.h                        |   3 +-
 sound/soc/qcom/qdsp6/audioreach.c             |  60 ------
 sound/soc/qcom/qdsp6/audioreach.h             |   5 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |   6 +
 sound/soc/qcom/qdsp6/q6afe.c                  |   6 +
 sound/soc/qcom/qdsp6/q6afe.h                  |   3 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 101 ++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  48 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 183 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  21 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 ++++++++
 sound/soc/qcom/qdsp6/topology.c               |   8 +-
 16 files changed, 384 insertions(+), 162 deletions(-)

-- 
2.47.3


