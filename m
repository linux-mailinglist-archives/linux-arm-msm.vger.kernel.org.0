Return-Path: <linux-arm-msm+bounces-99416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKhXD3zBwWn0WAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:41:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D95472FE5BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CFBA305FFEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34867382F23;
	Mon, 23 Mar 2026 22:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDldZZ6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLSxm7VY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D1381AE9
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305539; cv=none; b=oBkyuIdEZWVvLP0Fns7q+LOj56oQfXzeECj0zgTbrS7tT81KMsKA/8thjSaenhGq6z7jzq6J6NdoTvAeNvhf+nqCky2onyn5iI+7icyKwjt1m0QxjAJv2pq81tiH3b3dRZFGd6BE7vonASa4sMlz0hkdvlE2u8IZdy401SQAptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305539; c=relaxed/simple;
	bh=0RYP5tGXmteGVu75C4xhg48k7O25iKbnsjP+1cbqIGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mrpDDdpArOgIsdGe0L3x+XQzh4YJUo6Kajf72oNIp3QZ0teRr2nZOKm4ybejR2VTard2eDyGPe+UeLdfLfDddE96PEmkXBlUXQ0CraN16/MgPKne5QkAQHotBkIxLtO19OgcrYMm3+fuhdgtjHLZ2SazzL44K+I7+0/Ynl90im4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDldZZ6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aLSxm7VY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqfeE943795
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LcFcJr+xRZrGG5By5yidwVkvdyuwtRgBg6F
	5dB8HRLU=; b=TDldZZ6yArWvr2mcVTrU8rKyk7vuBNvRG1txSVMTKQHQJXEmjNz
	xOX1wwx1qxLrRriCWQC0XkqCwGNsKHyg/+uD9fTbno3ksgoL3ArzmLOQea2s0Gci
	g6G1bLNeuX7HqQzyiHTFQDftNpVQtmir4ixbCdFlHpUHnujfbS9XcMOszFTW1/PL
	yg2HeBYyKJnVStyFpoMXhciuiPy6C/Psut0ekjva1Xyc+rHf4qTHKhKDbrevLIY6
	wk9ZPpjkKfSzTmsWzKFBznbwIv91eyyfRm0mYV6nlVbB4orwHeQ5apevPfrReW6W
	oW99j0VAQ9P9mpCC0M1Be+ddK/+O54Kk8gg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkt56v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:38:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so167930001cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305535; x=1774910335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcFcJr+xRZrGG5By5yidwVkvdyuwtRgBg6F5dB8HRLU=;
        b=aLSxm7VYG7cqU0fXJFdmVFyE14dUtmj1OloKtC7innIq4Ry9I+b9FL1CKZhH+mK0TK
         ENBuicBZYocY68as8Q1HjneOKDYXeE2I6/tzqXiXjZ8DCjGblJaJdVsRXxIyHlmmU0em
         6gP2sPT5F1aWJrxUxXLkXu8BB3L6KyO6MRwYJ7zpAT6Yb6mLMRI+xope07sHugdMng6r
         bvyU9M2014jL1EQiCBlLIO5G7ly+xTYdclCMsc4byeAW/Pcb8XIDR0GEkBZE8f3uFeZw
         UP0ggN68edK3IeLrvQ9u8OaJNKWTwFas4crUvMsDlojEVyNyUpV4qsqQpbUYObxYHinh
         ew2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305535; x=1774910335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcFcJr+xRZrGG5By5yidwVkvdyuwtRgBg6F5dB8HRLU=;
        b=geaB/8w7D0F3+aIbbJvuPmF+YIubs6KADqE9CSM6fv06ZyYLIJ0Cp4w9UvRdg9alVV
         ktWza8cMMiZjU4cLoXP/XOzlSOZ2zYl4dKCqrEwQBozk2VMH07ln6CjGe0MotmiTrKb7
         pDZPdvCkviLHb+y2yQ2oKoqdNoFXJrQtsXm0GpYkE89iNyjDRI4uponzndjkv3IE+uKB
         5TmsMxkNAG8q7DFdNeBgNEzPa0II2XGiOKfGCxKacvWq1JnU1I5tZxfNFaSeQNnaEpYX
         Rg34Z14y+BtyB0SwV6G3m0hrwtFbA74OoOjWNxTS1af8HnJ6xJLpPQu9dNkOAkKE3ex7
         e92w==
X-Forwarded-Encrypted: i=1; AJvYcCV2jGDdrM7Xaz0YMsQK4/ERSKj5Y78tFEhpjtnLmToqt3WnIuSv7Y+G9jO6FhP98PMRIsI8RGMtwLAP479+@vger.kernel.org
X-Gm-Message-State: AOJu0YytgItuOowxIm8tJe37f4f0SGKaW6UZN2v+xLhXOjfUiOaL4ByD
	CMP7NcazLLaAhstH/tMwr2Z6bKRpFaV2nSkDAJV6i73n69G+Y7c2WtkgZBZ4FxovqhYlN3McA7I
	1t2BSF6CO5U4QHJ3MT4a+8F0aIkCY5w3aa8hEeyBh4yOclCAOHYjRolxWPT0xZqTMW/36
X-Gm-Gg: ATEYQzx8jkGPr0oABzocu9O/uBSRWrYZ59d760lwbXjZr1HNUhJdfumj7Y0wvjXRYrh
	95RQlaFFhOLBPlw+NQTBl+8rtQjQ7wgh/m8u8TIvOXbZ1zFNZd8fQOzVZqKO0Y+mAbaV1pmOrM1
	kga6co87JQjfw/kYii5ksAMbKaYmFT07CNUCd1iwvFbL/cIBEDeN+FYhrmEOH+h/CXPabLOT9Hh
	H/XJpmYboQoCWu14boAZUgKuvHTaDeX0JZQVXxRhAMWz5WQ08jCQpvD5j5K2uaax6MWLTWAfD8w
	IYMMD2zlSkNEGhxQ0WUxmmW/pgn7AmNx+00jKa0gl5M6PWDcIc7e1NYnPJaN88UzTzP7KC7e3pM
	A/WBe1G9+7QYKy7sVGYo7ncN8IY9lKyHYUl+VLoLyfoEHnehhDAXZZJ4=
X-Received: by 2002:a05:622a:424b:b0:4f1:ab79:fb18 with SMTP id d75a77b69052e-50b374653afmr196623471cf.25.1774305534869;
        Mon, 23 Mar 2026 15:38:54 -0700 (PDT)
X-Received: by 2002:a05:622a:424b:b0:4f1:ab79:fb18 with SMTP id d75a77b69052e-50b374653afmr196623121cf.25.1774305534413;
        Mon, 23 Mar 2026 15:38:54 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:38:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 00/13] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Mon, 23 Mar 2026 22:38:32 +0000
Message-ID: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX4s5EtCueSGO9
 zatzqs1eYYgVekF2VrZaDL4yVfnKbbJxV7p0uLU8Su/F9qNirbt/gJT07tQUj1D9srCoeG8mCz0
 JK3cyfoDW5d8WglDXkx2i99WAkChX0sQeEVyUEXH2NEA7ienGDeYseGTYeVdElemZajta0kAIOa
 YBBEgraiFAywjUxV/B0YRGoT9R09zoDqFmWbc1Yb6DUHFAwuNkD63YC7170NLA66pxWBHxWGJjc
 OCSRps/S3zzleCEEh99o+hVv7WWZ6dmzTJXYPS8uw6vujVgQThCFaVu/za3W+nbhPSJQMAmXcdj
 N32oK2XVVyO54xIEbDhM00WQ6BQovVtM7hXJT7EZ/JLU76D5FvQwSLUqNlU7dJFNZmpRjkjUnkB
 TxhNefb35MpfII/W17Haj96PYRS7JwP6Ka+I5KdBSpmjbowgq1kTJLkuN2rz+mYJAty6WgkRX4S
 Xz5JbtAQ6g5xxpZDKbA==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c1c0ff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=x8kTagw7d3iPfLn8lj8A:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: j1wSUEqaSc9ErNay_oCy4qcBoAL68NzZ
X-Proofpoint-ORIG-GUID: j1wSUEqaSc9ErNay_oCy4qcBoAL68NzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99416-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D95472FE5BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Tested this on top of linux-next on VENTUNO-Q platform.

Thanks,
Srini

Changes since v6:
	- improve error handing and add a missing assignment.

Changes since v5:
	- moved to using pcm_new/_free as rebased with linux-next
	- fixed typo in q6apm_dai_pcm_free
	- added changes from Val to q6afe_port_get_from_id
Changes since v4:
	- sob order changed for co-dev patch.
	- update range check in common.c

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
 sound/soc/qcom/qdsp6/q6afe.c                  |   8 +
 sound/soc/qcom/qdsp6/q6afe.h                  |   3 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 116 +++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  48 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 184 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  20 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 ++++++++
 sound/soc/qcom/qdsp6/topology.c               |   8 +-
 16 files changed, 395 insertions(+), 168 deletions(-)

-- 
2.47.3


