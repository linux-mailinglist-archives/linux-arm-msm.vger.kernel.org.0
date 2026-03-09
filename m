Return-Path: <linux-arm-msm+bounces-96119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK7AOgturmmaEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:51:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E2623467A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 978153014122
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94923624AB;
	Mon,  9 Mar 2026 06:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dO9R9LJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcRJ9fFQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C0836215C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039104; cv=none; b=oPYlHn1sNIvzjfu198jVA2DyCmIek9WK1KfyaKsv8PXB/FoCh5YJH10sUNYdH8OBWvo94OydSxBdG+la1S/EXfR58gmzUjz1t+BOmC1Bg0MZCxT4s7nUt7pahyk9MebviXlKrR3B3IxAjRR5pun3/zfAN1Zu8yER5UEfj0IoYjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039104; c=relaxed/simple;
	bh=z38MtegwG3pVORKxx8amT5B8fQ+hdfij8SiR5NsMFQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kcIZq4cw/L5D1z5ut/cQEaXfXFpatRjBJMidCS1RbPTQrp1zE4LoCzuLzESe331ZT1u2hyhsHPjs74fP+APnu6bDAvdQ7mTfbeOci5Sq9B1a6gWJzXcsgXj+bSM9zVPyQh1PTG/3hQS4kfnGR1L5BT8rh39Du/Kz7TFTMYP23GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dO9R9LJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcRJ9fFQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628N0S9s198538
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tZyvIVKQnXEaXVDCKwG2/zwsyEc+0sPRl6+
	vscMtVIw=; b=dO9R9LJXBKGAOjLuD+ry/oOSqahPm1J1f3q5srVGh+ShxN069jP
	JgZXToqn9AzeP/xr+zLxFph+aIUJY0E3ZjYUQQPSQ/fpYWBs1L+YlPyuM7xO6aTu
	z9QjlWBrOdgphdysqAW/n8LTP7HfH0UMICf13crs9iQdW/9bn4GbM8TgpQHOAHMX
	jDR65s43QPyR8EiX8eQvRaswB2Kl4fcNRyc/u8tgkG08HrWi7p0Sf2GxSnACCVCy
	ESsOAQGlHLGcH2gWWZ994AbIca91I6uI+QJPy8GXfvj8J5ZQdRSjndLMb/kd9lFg
	xJZUDz45dCx1spQmL0sAz+ex9qzB8xfr7QQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vc657-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:51:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50921f7da6dso92601cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039100; x=1773643900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tZyvIVKQnXEaXVDCKwG2/zwsyEc+0sPRl6+vscMtVIw=;
        b=ZcRJ9fFQ2h5wKI6ylpUpuM/L0Dks6trCsc1ne0XcwT2FYq92yMWxvUY2gNh+BJ8Gvn
         1p/+9BLeBHr/ecsl5qVaxVDYdZrRMH3ihtFk3OQ4W2fvkNfFip1ykWYQQ8bFYZaHw9Jj
         fWyAfunrNWXLxlphFUSJL1WKRFWmOMxEqqR7AcBGzQa4Y2tWMF4PAdfOnE1xGrGjyRYF
         fhKLwdN6tNK0of356TxZ/uImxOvZD1YVdjXMFNxP4Cf+sLHoao2MTzYhPcy5NtHQUzX+
         3FT/Dr0UhX3exDDj86KSQhtg6peGbxw4oW2c8OhT8YezSX6PfMLIozfHvGN3nLsOMOxM
         nF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039100; x=1773643900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZyvIVKQnXEaXVDCKwG2/zwsyEc+0sPRl6+vscMtVIw=;
        b=AINahwuP2OYOKODwTUjbeqqMQ9HdEGtdszQ7E+BvFlGPSvvcpmSMIiATEs8qD7QIbe
         +5usI8PIFfhvrR93WsniAmMY0RX0GffemU9K34vZ1HyYggQV6QcDgzQYlaukHKmdxMn1
         CrffJnqdKTjSn0sHxIE8hyVN+nsC8hqW/Vj7qYZuA06F+no3rG7f0qSklfewAg04qtZ6
         sJ1O685fe6QNLsJVYWb2b7mYZ50GqiZKoFYulLZGUY2lBYUl1j7P7mv+SIduF8PEjRhX
         Kf6U8TW3e9IXK8LE85wBrtgPN4BMDhUIZrWZhtkQmOJIV4mybTnFcOqPBHc2ZMMnZnM2
         cxDw==
X-Forwarded-Encrypted: i=1; AJvYcCU2FQR005wn0YUjh1uObVL6PufG2TuAEMd42vbZZL/yqXrUED/JINBQlSWB9UkIIzgsIXhGqCtwu6Dfx4fD@vger.kernel.org
X-Gm-Message-State: AOJu0YxiSup8z6C3w/pPR8t5dbhjpTKqnvTrtpYeyEQFTyVQIU/Xetd+
	9J3+mNXmlYHXhqD1L2GvIVDUtxAj7xVYZUKAi3ej1Rl5ahuY2eguKm9vf75OWYbVDN52iEKY8oA
	yArLHc8QQWZfKPKUxXnt3dxXe9kYPYwhu9GTq2t+J6JmRorLPIXLwTwTF796f/0Jhc9N7
X-Gm-Gg: ATEYQzxMPQc9Fr/oXqn/NU+cxGptq4Ss0wDReKPAMZBc/RlHEKZLesZFC+MqtCjHxaY
	zTeI4QBc00CZPKHCLl5S+2nDPH53Baf118g/QfZhUvOJPTI5VS6tYpVtc730Zsk7G+bQcSBq94F
	96pDq0wFrHhW0Xt2NttbaZ+aqWGBxiRaiwLmk1tv8umbWoT+Cjhh6ySrybVWTuFVaCEgyD7+hz8
	tjRzqNGCIpsdA3Sg0sKTIn1hBx+7IaVsMAj5YBt0Bha8b32PPIgN+oKaRYcvX+B+xAGKaxz33T6
	zNkCs88Trn0FuBZ15HKJP7xUhtn+GGV5gI71cayAWgVHtId4Aw/2g0f8Z/cBeunyafeO3njEp0K
	07jjV5lIF7cNKh9o5UJgi7+sfHBbblEND9Ri2DNFqVdjkiwca4o8RgPI=
X-Received: by 2002:a05:622a:44c:b0:509:21ce:1a9 with SMTP id d75a77b69052e-50921ce043fmr767781cf.10.1773039100407;
        Sun, 08 Mar 2026 23:51:40 -0700 (PDT)
X-Received: by 2002:a05:622a:44c:b0:509:21ce:1a9 with SMTP id d75a77b69052e-50921ce043fmr767551cf.10.1773039099935;
        Sun, 08 Mar 2026 23:51:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 00/13] SoC: qcom: q6dsp: few fixes and enhancements
Date: Mon,  9 Mar 2026 06:51:24 +0000
Message-ID: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8jgHV58G2fqVxyHbDYNgIMX0loxK9zeB
X-Proofpoint-GUID: 8jgHV58G2fqVxyHbDYNgIMX0loxK9zeB
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae6dfd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=x8kTagw7d3iPfLn8lj8A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX5w7IUs0J150h
 D8bBbFjG67YW6Nul4oyBDLMwcif0aHBonidSK0XO/s16x7jDPNt4Z97z5cvHUvUaedpJr3jgrH3
 Z2/p1Sgu1HgpS89drgjIKAaryYWj7v/EMbu690WPh0mFWAMEwzdw1QuGC11abtZ0w92O/kK3cvW
 nr3NIs8NUg6CDzNRtWH2LfCzq6DKyWhXyJjKX8N9e76dxe5BwAVOb+aUef/wHDQYMfTdyymIdPj
 5YO3HOjrXEWfWJhBw407P8f7a3RIdHQisoIFtKsi//HlNQRVKiOQzXRo34WVvLiNx7sg3gon31O
 bU7PFaEMvSvqu73iHqum+o7rcTfF6+cEx84knTlZf6tc2lK8eOAiojrafIgGHlD/eiqXgkbAC18
 NHp1yDctLE1a+t95Ms56inzCABuYgRhf6CnpLJf17IHnhOjCzGzMssAMhxbS6ik6eBAuXg2tlQr
 c6pmhalU+LINZxlAhig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061
X-Rspamd-Queue-Id: 96E2623467A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96119-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
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


