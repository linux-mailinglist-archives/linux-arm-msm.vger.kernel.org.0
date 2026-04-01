Return-Path: <linux-arm-msm+bounces-101219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML2lIaSQzGnXTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:27:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 400013745CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA78A3078B8F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D16381AE9;
	Wed,  1 Apr 2026 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhTWvBho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ci0M0dbq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1131D37F8C7
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013776; cv=none; b=tjWD01mwf9Bz6tooSfMN5zkve2WflCE3YwuEPpMDfvK5Nl2m6Bbr0CHwioDoo/kwD+QHtUeE/ybWDejBW3mIVdBFLh+88JXubaCfPjlFLgRoQpDyUN1GiTnlzTAzOzthMGRt3LAseHuY/S/w6Idjn7nTkOeovtJmrx4m19bqy6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013776; c=relaxed/simple;
	bh=3orZ/lm59tquC+ygmtUkOAAIap6T40OPZUvH9QyqCTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDAfJrAoAUZRVPdKsBt9fV/u+auv0z/Bg1JfMncedkcK35/GSVtVZkwZf6Q9v0GT8F73aiimU58tkRmJgtxzPdEVcWO8Du8Viw2SxVaAO87ZzS2PJG6w1U8qdzjQzYzz70ZBgtBttcJUIWDylUBGqZlYMboLhGZtQ+XCdJ7wXwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhTWvBho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ci0M0dbq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312EevP3081373
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 03:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkCqUsFz1Dz2jHRMWPeXASCiKv0dntlxkvx4wplkgQ4=; b=HhTWvBhoCDLOguV7
	Je3OwjhxUGyPJVJ619D39NFHv4/r201OFZhIwDwO59gd9qO+UJMcweoTiMbd2w5L
	JOo4zmj1LxZsTp4FeMNLEsJrjEuYniuulIM9bzc3eJISKWgfFFn4ruTMsx3xDvNu
	i21JNRQtNWLo3rOkjc4PHDuZPo8YbMPTLUdMRruQAxMQnyA07QSHtXKfigtGh5Mw
	bnZV+V1+puXoMJGp72fc9RL6fJtY/s5Q5eqHWFlOlgD5XIxiUQNuzaDk1tW2y4Ma
	aPnDkGDXqTYNB5bPdlsYIJ8ThURGkovKElzx/nLYdryM1O/r3lWgP6hgIwrCeTeR
	/A6T8Q==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkswvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:22:53 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d7e610d5dfso27539647a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013772; x=1775618572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkCqUsFz1Dz2jHRMWPeXASCiKv0dntlxkvx4wplkgQ4=;
        b=ci0M0dbqsZLBD6Ocr0AWQXsE3wWx8N239CwLaGjuMKoHzrJ9NaMHv6YTUeVFbnO3qg
         /s/b6aOf4uEgTvVwG2FGniQoHSP0FjmMmqjMpCYXFXE3owU/vdL3pYTdyosaN2TkyMQv
         0cVJ5R1oWe0d4hJvQ2IHPcvdnKEB8L52czETGvXSt6u0989nRST+CZe8WEDmPhYbAllH
         vgcQZ3Vpb71SbT0jQwF5s94zQaeicyaYljwjlp+kGq623sJr/OjUBO5XoEkrJWnSILMY
         Dx1KKyVvPu7AmNOZ5th1h6xe9RsO6FLzjEVGDvUIDL3NBdTCqpqWvk5zrjjhiAGqWB3L
         x0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013772; x=1775618572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZkCqUsFz1Dz2jHRMWPeXASCiKv0dntlxkvx4wplkgQ4=;
        b=rbPVs+1joACij42ojGmQyz8puRNUTrIEX6wg4DFZgJnBHbWbTOX0e/iPU1oCqpclqX
         AoounqEUBBB6HP+xvQtAxDb/rAeNGuvXObsGcuRUshsAln5IOXki3sHOXvci4bDjnKlw
         l/A0ji2BjEizfC1Iz+OoewOzcoNp0Jrd2dugzTiOiNgqw9fuBu5/zW3I/DUd2eIhj54t
         kO2nPZgD9tcx2gHN7/VvcuCBWf49iJTqYfjlb51WQrA6wyZ71uDlzTXYWlJjHxze+VgM
         5tby/hueAqQOk7eW2AbIB/j0H+jV3l4Rey/p+gzvaf9r0Ficz5ePDkSblQguXGfcEfHI
         Vp/A==
X-Gm-Message-State: AOJu0YxhDzPn2yQsFObQ8fpSkuLtAeUPalgb120kSnHDRoWQTxN9YPLt
	pW/S1E5y+5FQgz2RgcihojagkIWGK0GSzlxaX0G+y5ZiO8hZ3j6Bgf0y886+5ZiPdz52xDeotrS
	LYNgSpweCXUh16nZMNet1qrHhhFDYU9lCTMj0vfgvnuVUqK2ecaLV1Gzm16hiafpnumaW
X-Gm-Gg: ATEYQzysTcY75MCeLvFAZP/d4alY0Tj/MolaorKPjjTAgwY4nRsn4kNEM1j8bQjhpa5
	rZnkrFbEvVxjL+hcBjVmXD7NgWbb2LZE3HTU9RfFYkmVThPuhmEHJ7jcujugrL4V/wVyCEEBavy
	oGpAlf6lIpvoyI9Epx9d4ZKMMeaZ74XQjnhZ06syWh2wDeiESL9ZGcOAfmTqCvr5jBcYGQ16Qdb
	Lyrk+F6gIPc4RuEyY+fOQaR9QqisPoDp/4oN+k19HE/c/GFt0VTAipQ4up2Wo5TrX4U1HOuocTH
	iRmwIwAVQ/nvg/zZaxsJfQH+O1UYrP8wG5bJn5c8LNlShjt5FQKjXeKEJ1loTzMoB0da+1+CFvz
	Tp3zzHomfkGx7LtK73gSbdMeHYiXZ6pXqckoqM95T/Mc=
X-Received: by 2002:a05:6830:67f6:b0:7d7:fba1:c767 with SMTP id 46e09a7af769-7db9942cec5mr1568052a34.32.1775013772582;
        Tue, 31 Mar 2026 20:22:52 -0700 (PDT)
X-Received: by 2002:a05:6830:67f6:b0:7d7:fba1:c767 with SMTP id 46e09a7af769-7db9942cec5mr1568036a34.32.1775013772161;
        Tue, 31 Mar 2026 20:22:52 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336d73sm9589357a34.5.2026.03.31.20.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:22:51 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 22:22:46 -0500
Subject: [PATCH v2 4/7] slimbus: qcom-ngd-ctrl: Register callbacks after
 creating the ngd
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-slim-ngd-dev-v2-4-9441e9c8420e@oss.qualcomm.com>
References: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
In-Reply-To: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4485;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=3orZ/lm59tquC+ygmtUkOAAIap6T40OPZUvH9QyqCTQ=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzI+HmNUPOTo1sn40W7yxJTFOgbTsxGuXKHYLL
 HlPCOsGwwuJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacyPhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXQ0BAA37HQ/TFyVD3DFAFGSXaqTd6Qnyo6/U2CUPAW1in
 IaJ1EliXTGyscHOv9csdNj25IhVQXj+5WYdoSiODv/vGHolrhohhBRCAktrL+YbSRrcARYi23u0
 QA7pNWG+D8MbEsgr4S9Kur5rDBrRXvs2mR0sOlMDaJfJHJE1IAmPKIxUWDaeTPQlP9ZU+BOOgfw
 RzsEEmT5NN30Q6zjttYNcKTECXB4TGbPOmWWFH/QwemGq07XEsruqCVtgdWrUmTgXPJR3tBsiOM
 p401WjRSYrmoL1BAJqnkHJuXV2sf+nkSS4x5RMWLaVz4Rwyu7i9kmAG4CJiBKepiC51qXlpCwHF
 hbPZLDLdZsgwgGGhLQ+bV2Th80R9CMpAXwXVoHVZ8c3EIyDq2eMMLQli1evZ86M0jEZyF7qz9XM
 M/6ElRAvH5BLs+eSdvZWMcD6Om70+/duQdd4GiEMpqiHBraincptzab3SAsxM8frwWUgU6kP45+
 uG7ZHCVUvWkTH/DYRdkIAlWCipiIDVGgTFogbUcijlhnzxdpM/kHgVwW673DsSzL61h1KhAiZih
 gv8IvA7waVE/8V0fPiqacKD4J5B4quivq1F9NnUyG2pk1GcZIAuFIZAqjF3BnugCygb7Yd8ZVbe
 97GMa7ZvDY6Q/ELs72ZI56LnLXtdY9deN9Dfvs3gHBXs=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfXy5Sk9zDA+m1q
 SDJusi6DN+zRE7j49gw1oNbRCmUmB4j7T9zTqSVeOywUa5WDQszjxvHk7LxgHkHl3zj0ifHGzZ3
 y6ZdU2J6/N9EyZdnCPtTW71i03uwC09mZZrANEnvC4dA3ohTMS1MbZQg72h7nN764CMJ5ZPvfeF
 m2YDQb1+BCRpRwx4xQD/Ebcy99aSBET2fPMjJzvK6DMXsKN4pxwCxSIqGmE5X28kuvaDhqMfjQA
 Dp+j8q5gXQN1jgqblyXDQoabmazVlK5e2Nkuc5AI4NlK2GBeERj2P5SFhJ14XwRAxO3qcVVgWY6
 0IvQFa/S1s3rBzHH/6i71Vk5KZEGIJ7PWw32NjkvC+JHc7NdrBCc5IQTAmns7znnznbwF8ydxKJ
 n4eTVD2QkcFLXyV4sfTvGJ/OLeMGxrVGomtZnEWDGg6maLmv8ofj9nECzu6lnmJ5yxQJmN10x6o
 Fe1+Mb9+I4MZHNOn+wQ==
X-Proofpoint-GUID: yy2g6_b9rVS2RsCZfU9kldb1TBuVZk6m
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cc8f8d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qvPh2VUuy8EyYpbUS7MA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: yy2g6_b9rVS2RsCZfU9kldb1TBuVZk6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010024
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101219-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 400013745CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the remoteproc starts in parallel with the NGD driver being probed,
or the remoteproc is already up when the PDR lookup is being registered,
or in the theoretical event that we get an interrupt from the hardware,
these callbacks will operate on uninitialized data. This result in
issues to boot the affected boards.

One such example can be seen in the following fault, where
qcom_slim_ngd_ssr_pdr_notify() schedules work on the NULL ngd_up_work.

[   21.858578] ------------[ cut here ]------------
[   21.858745] WARNING: kernel/workqueue.c:2338 at __queue_work+0x5e0/0x790, CPU#2: kworker/2:2/116
...
[   21.859251] Call trace:
[   21.859255]  __queue_work+0x5e0/0x790 (P)
[   21.859265]  queue_work_on+0x6c/0xf0
[   21.859273]  qcom_slim_ngd_ssr_pdr_notify+0x110/0x150 [slim_qcom_ngd_ctrl]
[   21.859304]  qcom_slim_ngd_ssr_notify+0x24/0x40 [slim_qcom_ngd_ctrl]
[   21.859318]  notifier_call_chain+0xa4/0x230
[   21.859329]  srcu_notifier_call_chain+0x64/0xb8
[   21.859338]  ssr_notify_start+0x40/0x78 [qcom_common]
[   21.859355]  rproc_start+0x130/0x230
[   21.859367]  rproc_boot+0x3d4/0x518
...

Move the enablement of interrupts, and the registration of SSR and PDR
until after the NGD device has been registered.

This could be further refined by moving initialization to the control
driver probe and by removing the platform driver model from the picture.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 45 ++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index fd533d5bceb6d7352e8ac6fdce321d3acc285f1e..814ecb01b575984f0951919bba0b8ef4fc64a6dd 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1609,6 +1609,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qcom_slim_ngd_ctrl *ctrl;
+	int irq;
 	int ret;
 	struct pdr_service *pds;
 
@@ -1622,20 +1623,16 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->base))
 		return PTR_ERR(ctrl->base);
 
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		return ret;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
-	ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
-			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
+	ret = devm_request_irq(dev, irq, qcom_slim_ngd_interrupt,
+			       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
+			       "slim-ngd", ctrl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
 
-	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
-	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
-	if (IS_ERR(ctrl->notifier))
-		return PTR_ERR(ctrl->notifier);
-
 	ctrl->dev = dev;
 	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
 	ctrl->framer.superfreq =
@@ -1657,24 +1654,34 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	init_completion(&ctrl->qmi_up);
 
 	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
-	if (IS_ERR(ctrl->pdr)) {
-		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr),
-				    "Failed to init PDR handle\n");
-		goto err_unregister_ssr;
-	}
+	if (IS_ERR(ctrl->pdr))
+		return dev_err_probe(dev, PTR_ERR(ctrl->pdr), "Failed to init PDR handle\n");
+
+	ret = of_qcom_slim_ngd_register(dev, ctrl);
+	if (ret)
+		goto err_pdr_release;
 
 	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
 	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
 		ret = dev_err_probe(dev, PTR_ERR(pds), "pdr add lookup failed\n");
-		goto err_pdr_release;
+		goto err_unregister_ngd;
+	}
+
+	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
+	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
+	if (IS_ERR(ctrl->notifier)) {
+		ret = PTR_ERR(ctrl->notifier);
+		goto err_unregister_ngd;
 	}
 
-	return of_qcom_slim_ngd_register(dev, ctrl);
+	enable_irq(irq);
 
+	return 0;
+
+err_unregister_ngd:
+	qcom_slim_ngd_unregister(ctrl);
 err_pdr_release:
 	pdr_handle_release(ctrl->pdr);
-err_unregister_ssr:
-	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 
 	return ret;
 }

-- 
2.51.0


