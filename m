Return-Path: <linux-arm-msm+bounces-83894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D98C94F52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 13:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8EC2E3447BC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 12:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D944E275AE3;
	Sun, 30 Nov 2025 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMw0BOPG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivlUVbcv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7BF21FF55
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764506180; cv=none; b=a1Cs3s5LGJjE1yBJkICwZDdAHlm0xZKyCTLPHvoYCWpmH/47fQY3woj/BIj7euUIi6eaIv/gL9CS732yXNiF8HGiHzTRT7Gs/xJfsnRk5Q+RxjD3E4qNOVXFwP4WpkKlgaXm2kZ2PjhyyqVAd6dkg1sZIWIzTXt24QNFcx8IQPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764506180; c=relaxed/simple;
	bh=O8qqd34rZzKAlT8emxlMGg0aXIBHepVV/wOrOHz5bV8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pyLOrW/Fu0LcZYjUxq/+WHmKCXYFIPoKFMQGKz3qnOE8Hhwq9s1pE8YKYizsjlEtzOP/Q2eURikZE/6afyA+FKHVa2HsSMfKQXQIcgfLnkkP4I7PcTW0j2zoLks94sBi/vkbZSJwvM/pZXWaAML4+vUMeALFn2zo0sg47kbJUYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMw0BOPG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivlUVbcv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU6saeO155953
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=khDYn2iDAtsrUOzEA+11Sj
	iFVdLA2q+h0420fjCDJjM=; b=RMw0BOPGhi5SF8Hgv5nYITpLNbk8W9uMtjCXhU
	eOaPuU7Uvp8FvkUrEDiAdVuD8KS/xh+XUMjJZ534i/4I/BTMoQD08QxmbDZn+6KH
	1hDdfm6vWMooTzha4Zn80izXs6+5+57I4WfLkHR5MgBqZu0CqihECgS4CX4bQ+Cw
	aa1IJXl8+H8h3TRtqycKTk14TG1ZRYiviYdyvlH+83ZwyVcAYh4hFNZhiQal+kpc
	hbOV+aKN5uCRnea7BZT3B5930I7gu8A04QyURPiqmrfnyVNZtqCILL+ivjgh1qlY
	IBzBWiS3a1p/f1lSUbQdGbYtF+OosVq4+hEZB0GP6n7TnISw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt0j22r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 12:36:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e235d4d2so61961085a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506177; x=1765110977; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khDYn2iDAtsrUOzEA+11SjiFVdLA2q+h0420fjCDJjM=;
        b=ivlUVbcv4P68C0OViBrV2wdLorsjzj+copjWRG+g55CZd8k5HMZMlSqoGORUlDy8aR
         JmYtfdkJASCyT9jBbD+h33Ikx5QwZBTMkzEACc/k+GdIPT53bpmrG7KV9WR3/VUTWNsa
         1PEgBFT/fMnzeDxLNPFT1UtbVRtxMbIIhhYXgr6yNZgFzqf8gp77vwh5CTDwg4nkQ87R
         o5w9BkDRo6MYW2SABc8Mtrtgc8QS3xQAC6gt8F88Zp2KhxwDwo0GquvOF7+1w+Lr+OwC
         NOuDUR2NfQfUPKEq5BX6YxybQ1foNiLr9nbi7+VyHyZhyZ6Fu4yQVqL8g6aBAL7x25ru
         yHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506177; x=1765110977;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khDYn2iDAtsrUOzEA+11SjiFVdLA2q+h0420fjCDJjM=;
        b=M+50vpFTx4AOIFeweaW9MqtDBn1I6s0xDxpp2JHBariOVxTprBzm8PXHIctB83EFA/
         jqlRXTynTH1qtEjyCqM4Hz9OHu1xWo+oq93NZBAq2UvCYeNPvlqvs7YtUdUBxdWFOmv2
         spiaYk56fY57FP6GryDb6KBACt0Hi/YDUtgyC64jI6irDHZAASWQEeD1KZbUaCvIfN44
         Q+qyZ+Ee/6DPzDDmCfYMzNvc5lsEUvoIZU2/FQyo9csFmY4GGzR/mWjypusSmIm/bz4y
         JdlTjU63epYfMtmXS8pTyXgh+TowK0SO2xNuOveJx+sICWQ+GzRMr2x2b+4iPfM9sBWj
         VDcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpH3KFaeELw4Bt/OeEysUBinli2E33OHPxSSXDSEQ5eyET0PiuGc2BCSpWtaE9TMnkJtIoQZaLik/C7LVU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpmlk3QzCBmBPEl3QRlKzP/0jQAONFz/uMYv1xLoPghd0znk3u
	UM0G/P4SMuV4+r+Oeqa8sXve4+60Rh0ihi/OaAVrPR25CKlAAB3OLBIptyjmNSEnjXvovJ1Yx50
	FdLi3K/nW1TRjBhbpmm3fhVAhlkEaoA5kVJ8nIO9LO7Tjt/kPjlrdJ/D/mA4hv/dlpwDm
X-Gm-Gg: ASbGncumdVbTaKba+V7u1Ovl8dEqQVNES+Hp9D2FOwpwTowggt/jeoVWTcr64I5v25V
	qivSpwkM5iPS7gIzCeAI0fdt9b4C5gG506tQsq3XO7J3LUv/88j+5TsWUlvZ4A960+bpUyiEChC
	BUMKRSmwwh8ftuh60q7TQzRYZxaHf5CXvMFuL/2WZ1TwTIoPRdISDK6uXUgA43sTNO9z8Q8yAxT
	fzeiG9aQOPGdhknLQcTad+9Alh3VtE2GRuQIIuER8ZKKG+P9SnsnA6T3KOXNomTmmpgXVvvqgFF
	Xdbp7hKwhae05vQ8rEX5s8LGjaQ917Pu0OrTbiRtVoCTXH8PLyCQuOsdWW7BQOfHyRAp0RKNn4a
	rB5RRULz8OT42pqLBCv41xAyTvToro0pUYw==
X-Received: by 2002:a05:620a:4411:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8b33d4a74f3mr4231818585a.58.1764506176688;
        Sun, 30 Nov 2025 04:36:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeWK0WiHjAtwF/qYOyew/roqAG0tsI6NrdqTKzALGVqVXop4gZMar8qFcPH6xWCPkSaoNwMg==
X-Received: by 2002:a05:620a:4411:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8b33d4a74f3mr4231814785a.58.1764506176170;
        Sun, 30 Nov 2025 04:36:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC / rpmsg / remoteproc / soc: qcom: Constify buffer
 passed to send functions
Date: Sun, 30 Nov 2025 13:36:07 +0100
Message-Id: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADc6LGkC/x3MMQqAMAxA0atIZgNNRRGvIg7VpprBKo2IIL27x
 fEN/7+gnIQVhuqFxLeoHLGA6gqWzcWVUXwxWGNbosZgOnddUTl6XI6oFzq21DkKs+8DlOxMHOT
 5l+OU8wcxCDy5YgAAAA==
X-Change-ID: 20251130-rpmsg-send-const-ae216a1fbd8f
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=O8qqd34rZzKAlT8emxlMGg0aXIBHepVV/wOrOHz5bV8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo6DD/JawmdtkgkOBaTkDXZexZA72yvwkmRX
 2xb902gWAqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6OgAKCRDBN2bmhouD
 16BfD/oDmj4P63MBv+3h6ohF7ryGULYXhCUqF9p+69+7wePAdkGFR0SJ+SLk6Vy15z2rlQeSYXS
 Fq0PWTPhtAA3F1Ltma1AbOQtUE9D9Ovkh1yhinbcXfEmEo5kRDloS0j9684M6ig49Sd8AcrU/8B
 082KRFV04slBSkbB0LADnS0NIVUtOTXI1enIqRB/fb1b/XClxr9xdMFY89a9vLJbp01nB9eZuaO
 eIRfeXxCK6HAHForIN0cpb8NvBA+D7ygWojSeB3S0I+FLMujOQ71pZjD9p9cIxZVsTBsGq4SB5o
 28sOHp4Z9VhM9ocdhOfEfje2u4h8Y3xRN7AQEBMTzdbXwCtthtVc0YE35DHNNPP1gWWl6Rkp8MJ
 8SlHUxvsxP5Img8IkUhJMbbkjtJye/7IHhPhsMRaZ5ANNJvp6jtcCelghY/Lyaip5VzXutDKsoD
 srWqfPLvBae3f1g0ArGiIsAx87MkgflTDPvSQ0HxR5Pt+HNtrV0dBpEX+5Yn/tafiqWMANaoeB0
 I5pPYvOdRsjAm/a0B2w0erknqUgmJHl6V3PETd8TiLyHb8LORu5YNLjcfF0q7cm1RcnzmOIVllq
 cEMypHzNVe5FEFQqxGUVv/RJ4FuNFpaYmBCwwH+1SehdWQZZwn4woBF+Yz7b2SjkCHpUmJ7BGaS
 pz9b+fLWw9Cti1Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: APa7pcZ0ZW8L3l8DF-Sq-KOHtLGS_90j
X-Authority-Analysis: v=2.4 cv=WpYm8Nfv c=1 sm=1 tr=0 ts=692c3a42 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=a5V6tGfecjnVh1JciPEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: APa7pcZ0ZW8L3l8DF-Sq-KOHtLGS_90j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfXzv7OXEwLzw/Q
 4F3FmEfV5YEH1lSlRswgECe/uKkp4de1c2IditXSjdEYq+GPeGOMzDx6hX81V+J48bJwdmGoD2p
 Ln9bmTbY3XRJasrWS9p+2eayEStSB+jDp6sPti2F+cfI3CK6skxADyIKFZorvy+4EOXKeWyExkS
 Xxk3uJwGMsTCM8SWsDuiZa6WHR/uQKEfwiD5rvgX54X+jAqysoyQvZixgXCrNl5ep1ax0dFWSdg
 EAnvO40gthRUgFL2uc/laGCL8j1phIZ2iYR9649v7/EZrOKNXJCHKFi+dQb0+K8EdAy2pbKua7h
 dNo8ySQELqRosd7A5CvsxQmTp6QlV+ZkVNy1Da5gesG8tIKPaQTfQnMKEVxrItGpzcSyOBWXb8s
 lpU0Od9f3wAOBt8dmYxtvD7vKDTPqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300108

Dependencies / merging
======================
Entire patchset is one logical chain, all further patches depend on
previous ones, thus everything should be taken via same tree or shared
between trees with tags.  Probably everything should go via ASoC with
necessary acks.

Also, first patch or two patches could be taken now for this merge
window...

Description
===========
The remoteproc and rpmsg send-like functions should not modify data
being sent, so buffer should be marked as pointer to const.  This is not
only self-documenting code but actually increases the actual safety and
clearly documents who is the owner of passed buffer.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom:: Constify GPR packet being send over GPR interface

 drivers/remoteproc/mtk_scp.c       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c  | 13 ++++++++-----
 drivers/rpmsg/qcom_smd.c           | 10 ++++++----
 drivers/rpmsg/rpmsg_core.c         |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c   | 24 +++++++++++++-----------
 drivers/soc/qcom/apr.c             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h |  2 +-
 include/linux/rpmsg.h              | 17 +++++++++--------
 include/linux/rpmsg/mtk_rpmsg.h    |  2 +-
 include/linux/soc/qcom/apr.h       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h       |  2 +-
 17 files changed, 64 insertions(+), 55 deletions(-)
---
base-commit: 7a9e871ce4c7c8a7d75eaef8407083a0525de2dd
change-id: 20251130-rpmsg-send-const-ae216a1fbd8f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


