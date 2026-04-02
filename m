Return-Path: <linux-arm-msm+bounces-101463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJGfEP4kzmnElAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:12:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B47385AE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2254D301BA98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642D23A4527;
	Thu,  2 Apr 2026 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSEDwxzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFLLRCYh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5602E3A168F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117499; cv=none; b=m2TiICNHiL9HfrtsyRdGP2puC9srKDlMpWbXEjITBQD97brrG172/BQFGnnFK3SIFbna64CYoEHRdsH0WF+cjD/zmq7TA1OEyS21GJSXH/jP1/PL91k2zG1LKKLJS6lhnwLlKorPXLe+Ij4LfU1twNzxAsrypCFvWsTDBM/IKrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117499; c=relaxed/simple;
	bh=FbZUTwPZN/behyTIEI1t6C+aJdSSxAUvCVcJ47Xba5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N8bnBzZZd5CWeh1y8d/sTRPJNHqZysgswG29GzmvDh7Hp7NuVDCrXvxiRyzttkRbCmhYlnbgQJ6JIQyYR/58TYs+VqexBnfc4svErllgEsaXzB8VrG7HRsx9eW7WY0qM3kwCP2P4UESOj7Tfhrerp+jf10WzxqdL74cZIHPYBGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSEDwxzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFLLRCYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63271vl23745878
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5Nb993gNj9E9Ujy1Y1wxP1UEl3hgOY2Dbp5
	d+XWNVO4=; b=DSEDwxztf1a8fWc3URP3lu7Kqa10ly/M+LXVzUTL00JckPGF3Yw
	QraRYlZtUsf8ceEpZcRSlIuRDWiz0KGpzAYEajf5bGM1GgNtKnGkfTpt7yCYaZOJ
	QZFdhJbx2zHqRXMj5xVTWW+nrHllxS+Hu+wXodY0ys/nyljczMCQLn4OCpFUjhCa
	J0SOkcdT28PxHP6GRg7CxPa0pqdZZUorlxDjzHdElTXbrPdLcpIxrCIHo37VcDp0
	EN0xXt3xYDEtxn27JWiLpEePud64z0sfYIWH/Eyczq07wl0kZuMK2EE1JU0GeLla
	R0WKmUlYZMaMHqIFbyRQip73O/6vPsMYakA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324m7xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:11:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso2366171cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117488; x=1775722288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Nb993gNj9E9Ujy1Y1wxP1UEl3hgOY2Dbp5d+XWNVO4=;
        b=SFLLRCYhPD60u1+9c3+zQYh2ruI/vWXmDXB5xLu9ikXYbscsG0AYbSk2T6ntCboMv3
         cJsFaiNOKkKps7l1yZVkb80XEfcS+mNd8vyQrlPwOoLkzKzoJfrGUN5nqSWM6Cx91dRT
         v42Tua+hh91ZVMQXzbY2kyA7WMyc0xEQIzQoKKORMCXhdag0qvNNzLeqXjPmSNst48FB
         JNjxSulKOMQ8igBsQTCeKJ+rXqQWlUBjFFNJrJeSzReTAXg9F21OqBUu3swthNKHQgtP
         UUtsmqWyK/OBZFj7jNYLRyqHC94o5sBKTSzg0hosiV1t1M/Q6SA/zS7YX1GdGzTClGGm
         kbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117488; x=1775722288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Nb993gNj9E9Ujy1Y1wxP1UEl3hgOY2Dbp5d+XWNVO4=;
        b=ZIljIgBCaMpNGr3GRO9HL2y60bqHdpsa+16w/LlyMU56n5jWfDfWX/pjfu1+1zpOt/
         T/NWOi3HuB2AwzP586yaQsBTZGyiSUZ2q0oTCbHySvDaTdIHMxsZ34af6jwhnY5HkQ5M
         Hv912JDw/S6l6bCGkveBIe4hoeg2w5v7DPeIqhU7r7u91RZJ58KqeIqzvX0CszkGEhVI
         AyZ7Gnn0mPgGG0UogP4Ebk9L5VJBch2cl3isFLfOq775Gd+dnKmLmKh0KrGjISCBj2a8
         hvdY4v6s0NJj5qIOENZ2E9FjrHcsE3iuXtgSblcngoFkNRsilRQtHZ4/XP+9YpiVcEme
         iEPA==
X-Forwarded-Encrypted: i=1; AJvYcCVOO6ucegO8AR+ttISj5U+Ju26KYwPLhHpGtUk6Ad8azr/S8slYb0hwtZlnstlVFRDp6F1HE0pYryXriKC1@vger.kernel.org
X-Gm-Message-State: AOJu0YycHGY4AZnKtMVTK5rYa4shkdyoCO1q6rJPWnmW2dJ+Eq/DQ6y2
	tEyyQ5n5vPXToNUQdvq/soJItdbyohRy0hhN/zJsxZnZwxWBofh6Z07/jFlnht5Y5yU2OG2sBDG
	bYhJz3w0shA9l7ZsRFlPl4qVuFhhvlly66SJqp4ZA7sxthFgETq0+HbzUMIpV55FpR7MW
X-Gm-Gg: ATEYQzwa9maofZ8TAlRnRc2naQ/O8AcM4rHEKI9v/95gCWzJWnnU+p/SFJCeUtdRBO4
	4h7z4fnpwxKCLA87MPAj5QGjiU9OMsJLXWs7NDgQtOTbnNdHTEy+ZbgGzHwESm81J3XoAI0wruM
	u+XvQPm3ecZUxCWwW9s/k0ZYBtzSQCGgpFjgk+2MSx+2hs7PTuhHu+cr8vsPuBuDtBfQebSS57h
	Q/fjAc7j4U5UmZvu8EychHtAI4WSExXn+XAeaHjblmfir5zcumuUqaAPQlMidoj2A3G7SaePeAZ
	pszV/0JwzdZB//JQ1FnjCCcKQ0s/fidpgb8MbR20FL/+fI0ZwDOqn2PEzzOyzSerUo/BAaJw1vT
	nwSKoBLavxaCyFROuIj5WEF0Ip4aiEnIaAvH4n6nlL8U99u3EQoGjsAY=
X-Received: by 2002:a05:622a:ca:b0:509:f1e:41fb with SMTP id d75a77b69052e-50d4fa37517mr16175001cf.6.1775117488037;
        Thu, 02 Apr 2026 01:11:28 -0700 (PDT)
X-Received: by 2002:a05:622a:ca:b0:509:f1e:41fb with SMTP id d75a77b69052e-50d4fa37517mr16174631cf.6.1775117487541;
        Thu, 02 Apr 2026 01:11:27 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:26 -0700 (PDT)
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
Subject: [PATCH v9 00/13] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Thu,  2 Apr 2026 08:11:05 +0000
Message-ID: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uNiZ3mNHQitXTv6re7qPyfP-t2CxW8dI
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69ce24b1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=D3PLcYtS35CotE0LyjIA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX1JyYBNHyzDcR
 mvomWSJ6ezpVBWImp9STy+xcDmz5KOOLvHii1s2IsijH5RBMHpOxp9vkG/6NE1sYeYUsn4WM0Ji
 cpeDR+UEgdqWO0SMMbwA8TkLYXepTZQ8jRCXDpo8bgIGJjbMI6o/JpyAF/F2u87TzeMKdcKNbeS
 kCE33EXskwQPRTIuNKm9RhhCrH5nAfPKPGxFSWjTTWdNI2B620hhhKC0Oc3En/z122xMpUucqJI
 GDcgx/moLoi2klEy8NpgetH7lkGmkM5a9I6O9dsHFH6ELNHjaLTNxAQDYOcYGyvsqjsPRdX/Jv4
 YdpA5JjjyibS6S3CCOGRMr0e8AJi6tOdUOfLFDakuSNRS1Q+YjV7gijTiBUa4ZQPBQ41RMP8cpj
 8wZMRn0fqIJtecjsoUFAkQdiDJe9OMHa40ig5U5clBQ/qRAh9j+dik0U9x7tLXzxYi33HHscg1+
 IA+W0vgWn7KK2Hlp0hA==
X-Proofpoint-ORIG-GUID: uNiZ3mNHQitXTv6re7qPyfP-t2CxW8dI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101463-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2B47385AE8
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

Changes since v8:
	- move "ASoC: qcom: common: validate cpu dai id during parsing"
	  patch before using the max define.
Changes since v7:
	- improve error handling
	- remove unused variable.
	- add comments about bi-directional dais
	- in q6apm use of_platform_depopulate instead of devm variant to
	  make sure that devices are removed before component is
unregistered 

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
  ASoC: qcom: common: validate cpu dai id during parsing
  ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
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
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 113 +++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  48 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 182 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  20 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 ++++++++
 sound/soc/qcom/qdsp6/topology.c               |   8 +-
 16 files changed, 390 insertions(+), 168 deletions(-)

-- 
2.47.3


