Return-Path: <linux-arm-msm+bounces-98937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJxVLBNjvWlF9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:09:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B06902DC5A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F9063061B5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF4A3B9DB4;
	Fri, 20 Mar 2026 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRpS6UQo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sm/VP0HF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37FA3002DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018166; cv=none; b=Qu/t8px7uvadSyPq0S59tlS0fvawyjwEo99dW775BsFFYR48XzePSJJWTKApdzQDZNrYhvtwyHouuZUZ0fqpKiB9vSUXRJMGgHGpZRJDrBgc7ucGCMhS2qeStiHM7HuYeY3fV+1nA1fB0swYoZ3mklQHYorgsO3hDl7y6fWIUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018166; c=relaxed/simple;
	bh=hD6HF04sKDv4rIGJk+KlMR2cpwt0FoJl0X+vwiWSCKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=odn1ijXysJG2mUG6/wWUzJeVAcXblyyWEZhaTnDYGm11Gu/QjaCrKwjtIFWBmLZjic78vyDNN+0gVygwdMcMz6gC5bzzLuBeH9LeAUfR4EDzlWBCE1FwItoSTVQAdKAweqdd1LoRBH06FGwOKPd/rGb8G21s0NKGn+CT4QtHMTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRpS6UQo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sm/VP0HF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KBsgYr3876218
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UUv8/7JIXKeIKMMv8oS4PrGEsqkwCwvKXJs
	tPCJCiYQ=; b=pRpS6UQoKFwuFQGQnpSbtIvyijfLSkAJgVlnOEgtDVw1aIU/UvR
	RYEl7zs9nGFtZs9v0r/7RccaNgSXjM7/tCkbfM4FrLVrSlgDadxntEx+zSnU3PsF
	Jc2TWECkN4iBNZbP/YD9jNIr4sKHwboGSvK4Yl0uCoI2Duun1Xf5THaulU9iVqX+
	oFgA3TK+/XZ3KGL7chGQi0LgKbGeVuWBIi40UIDyE2LzNT3cqX/TRCyHcerBqIaB
	3CIrC/SYEhnlZP46Pk6ozV/wDhwJUI6rD5wjm87jfOh4PiGHnPG01R7C4SDxH8hI
	ZVeBU3CYGAmSJ2W+8HZST94dBoHnfd41F+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d15s08e3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50939597b85so73095261cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018163; x=1774622963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUv8/7JIXKeIKMMv8oS4PrGEsqkwCwvKXJstPCJCiYQ=;
        b=Sm/VP0HFL4Uv7lv85/gMCBsQ8TxVEq6dcpIfxKnaUZb8pZNQIGfbKwdhLo0YwrlkzJ
         nmGd4z71ifjxvCscpjVbPNOyQ6AcxUW8hpbXl2nBn+hiKAgnfK+10MKrM9StsZLQ8c+u
         MkKjYAzfTT2Z60aNiNCQvjnUCr6qpNwN8NSVBxoVep6+12yVUZG9Bzyik5NTz4DrQcuj
         y44hQu2yXZd6imF67QsW7rdHmbzQhm6gjnjE+sKcYa9CDGCq5dyky6CEyh6RwymvyShv
         yeEVWjP9Rx9F+7dyCcfnRiipUk/tSUN/rLPMZc3fA1FP263Mns1bRMknWMpXAzPHfdHc
         tlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018163; x=1774622963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUv8/7JIXKeIKMMv8oS4PrGEsqkwCwvKXJstPCJCiYQ=;
        b=nxYRrQAoR58pyFz/jt1kPXS1LX6wSM+aMnRnl7ZWZ5DISg/iCpeYao0giG8zWp16qh
         bzlbT9MSot2ZY0m5Dt/x0vvxePIViNy2/oYqtCuNJ0q9oMqCALBVzXF6uQ8Jvru8Poyx
         kARIPQ1aT+MVpy2Lkyp/7kzKKGX3b6WT/f2g7IQWQPhzOyLG1yQgS2V5pmgwrkz24KXN
         1UTxJBTwUhWuAWmrquW1Ai10Bbezbp9RxsFMBBv21kZxTV/YP2YvCw8r4q5mpN55eaPn
         Xdg2XyH+zvxf9E/xc0LFjhIMi4Z0u6DU3nmBmApAHXiQq/mLwJvm4Xfn1Q7OC7t54DNN
         0E/A==
X-Forwarded-Encrypted: i=1; AJvYcCUomETz69medU6nKAtiHnCHQhJfABBTyN2yYg6IWaGLY8MKUzWBcLCeC0OYxy4jrcJp8wMz4g4GIbcQEfW7@vger.kernel.org
X-Gm-Message-State: AOJu0YyE5wkcGRNdxR749tAtV7xdGrzkBwWi3dGdBTF1RJTVNqKaL8mi
	iyuzasVgDT1RPJYEbBVGi562lDjmccDNFtBOMjwoPoT5+Agc2OyhIyIZnAWR8l90y7/qvEuB+nN
	EEl/repOC7L6gOZcFB+710HdrEWuoxIKVojE00Q5iZ9BSpOv61Ha5jT7Da3yD5hGrAGWh
X-Gm-Gg: ATEYQzyaKY+9kbusZxKfnzBNKsUmbE3lQxJ6wC3TwL6pE9yJNC9Un9ePdQqq9x1rY+W
	8LDjP3kbWNRlQ9zrn9sSRy0DiNuSBS21vizYoQF/7k2XgZxXy0MoT4SZwPAIoB7qo9Bng2ZeDOM
	VMpFCo9pLWhWZA78+q9NtEv7zHS/qtV4Jm8+n0DynoCad7UB9aFAaOlM2T5av0K+wjazKNOyCyg
	ieA+BR3lpr5TvHwEqNCnk39Xh1cCtJNrJaz85MEETh3SwZJFnILq4yXO2EXoWsZswCAYx0nAxfc
	cmnHmyVoiY/47HPbWACFnh7V476Yu+cc3j68wYi/twcrapmxF2MAvaWoNzAQARTEFI69xmBTueU
	IBufZm2f+cgTGdiSv+lQ1oPQxlCdrI+Bdfl2PXybJQ25tUvw7t0tLEyc=
X-Received: by 2002:a05:622a:4f8e:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50b374c7df4mr35418831cf.45.1774018162917;
        Fri, 20 Mar 2026 07:49:22 -0700 (PDT)
X-Received: by 2002:a05:622a:4f8e:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50b374c7df4mr35418381cf.45.1774018162401;
        Fri, 20 Mar 2026 07:49:22 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:21 -0700 (PDT)
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
Subject: [PATCH v6 00/13] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Fri, 20 Mar 2026 14:49:05 +0000
Message-ID: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sTi3MTUB9LtLY45A-JUM3Xzr7dfonqfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfXyF9xhy3QehAV
 h+e2EzCyFKWMofR2fYOylcsbdHvaOxFV6vkPR19tEPyu84LlAxu/aUAJ69sA+Zr9byVSmCo3Vfs
 NATUG5KXDdp52ARYbVtkI5zjYuFntXaI+lwKZrkwvrM0xYvo8f6Vb8baNKX9d7XwNDNjW5TMMVA
 jguqlCyPt6T8Si3sMijrbHmjS+8P8R0CkiuKPrc6nbSrkXw5hGZlnBYJF5VsKexhSRA1ldzJTPD
 73YiDq5ytzgs9qbdtpsDDM4tTXjLy8lRNy9TwDQHq88UOxPbFZK81OMnQTEWKxfVVJA7xt8FKzd
 zaUubASCuvg1Bcx+E/9QG/fJdVBjewCSltLRxwrC9rNV2cZDuLkgGM8ZoujC9kVY7Td3yaD0GUT
 VeLb+iVSjgeQcNvNivxoDIZEKUAuhsJu0O2L4cnk6j5wiZ4zJDL5MhzO3a5V/izw1/Z67OVJlvS
 xsjdddIa5S/zfMmN5Dw==
X-Proofpoint-GUID: sTi3MTUB9LtLY45A-JUM3Xzr7dfonqfE
X-Authority-Analysis: v=2.4 cv=KORXzVFo c=1 sm=1 tr=0 ts=69bd5e73 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=x8kTagw7d3iPfLn8lj8A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98937-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.963];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B06902DC5A0
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
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 114 +++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  48 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 183 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  21 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 ++++++++
 sound/soc/qcom/qdsp6/topology.c               |   8 +-
 16 files changed, 399 insertions(+), 162 deletions(-)

-- 
2.47.3


