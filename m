Return-Path: <linux-arm-msm+bounces-115148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fOv6BV+DQmqQ8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:38:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA56DC24F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:38:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I4V20ZYJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L+2h7g6H;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115148-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115148-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A90123081E93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7025E416CF2;
	Mon, 29 Jun 2026 14:16:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F09416CE9
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742612; cv=none; b=JY8j/jUhxk3AtqSEzfWF+aPq4aS43vPNUkPM6y4EWJ9+ZJlNdFZ/kXU+B9R3D/HEXVrTDllhZ6XrHJ018erwiGH5MNfDEM75afiyqAl7qNl7c+xrFULojIkYkocIYM864yFPG4Q9VGz8hCtUogidj6w9WrTGLGcxpBk/KaZUC3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742612; c=relaxed/simple;
	bh=ujKFGrBXfqzzTWYWiLZhzbg8yaOGSF7iUYvN9/dYiJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mLaY+mVaYVaR8XLeI5uSg4Mfj4Mt58jn7JQQKgrvdzgjfPG63iY2X21S3A7dQrfd5WwlPKz5JPu0H19/YLz4k0T4A4LbiATugD9gUvFBPvLzl8bwlL5cc/4mqlZRYz5mSF++Q2aWyDopOM77Oe3gmWz3lo7JiFYPJd6R+vwA0uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4V20ZYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+2h7g6H; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT6t12627926
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3BPlLjvuawkSXnix132EPJTzuTnANMmOQWr
	ZnYK/bR8=; b=I4V20ZYJlZ/zhQTKKzMSOaOyTstEz3yCPBg6wZ6zBt8aRQFHWUH
	lBTeXK3WiaqJD62QP901tGkPKZtv0Nq6IFrq5ufLqW97azJ9esbh4QjjQRnStlZc
	U2VmZb/3RIeHiooJGn6+wN00thfpi27kPive5H6n42G1yvXmJbK+enjYRja9D69V
	yW0ljbT84UNCTH+oCXBsZBIJQwCGROKdZBQyENcRs3gathxHMBE2NAnha/RXDdjX
	qFdzge/q3W5WpRhUs0ePGcj+OBwqFZyXDCGx5ZiPFcD8dIK+e0SRx7rdXEQ6NLqd
	wUUenp65p6ULMEkY8yQS1BelpZp9s6LODVw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgs938-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:50 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e60737a964so5443971a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742609; x=1783347409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BPlLjvuawkSXnix132EPJTzuTnANMmOQWrZnYK/bR8=;
        b=L+2h7g6HbgditjzHzvybO00yEw9leQSKFiQsj8NrRZu0/Bg5Tg/fg9bHgFHVZtILcG
         eTY0HFUr0rKUr+5hGq72R8R7Zbdh2TibSV1B5zNrgm8VSwzGfzGNWvn8+prmZ9UVofZW
         IFhjwmBYPnMHcxtO9Wew/3Swrf9Mc+/8RjGNrJn2FkJJ96ZmSVCQF8hF1XsQhqfVzdNT
         9kVzu4yc8df5mWHsn4yCJbvyt4krOOC0Ffn1dHsJ68Gm3xK4CcL8ZKiy39tNcuQBt3/U
         GsXLH1IjjVhSk2nIpmQFJG2RKFTpkkcH8x9WL9z33IdL744iTFlybS/9OVdKrhE+3pNE
         iWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742609; x=1783347409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BPlLjvuawkSXnix132EPJTzuTnANMmOQWrZnYK/bR8=;
        b=iTK3bPCdcRVQw8IBbTkgnE2MVGW0VcOfTp6mDGW3GUZC4OOr9ia9WPo/qGxiLwpef3
         qdWzg3+c1ErCcBrjmcjuruLCvyZga+a3ESO2JY6NbIdbCCzeK9iK77npnXcpJLdN0Z4R
         wJdbs09jhX6DQ/pet+35TcMj9CUsT5hUOuMrkxKulGn+XJs/6DV4XLAEVC43BgblttMl
         pWpzqEycotT92LXdUXWsJQfIdriqOfsr6uY8rC+OLvprPk6/hWE9S+uf1+Z3+d6wQc2h
         7peocOpNKTQwJZxW7noyg09tSER+GqsXzJRHenAr5A5kH3/e3S8+2lv6+SqYIrQruixB
         MMtA==
X-Forwarded-Encrypted: i=1; AFNElJ/DlakhjcTIKASkXY5fQICrqzLSvyFGv9uK3YBrKWFEoWsTRU7sOlkxwMi+Xxj3LBXPIh1qaZuwqMHJ6zp2@vger.kernel.org
X-Gm-Message-State: AOJu0YyALD9qoxT4Ux+LpUNkU8t13+jCkSP0f7TircRrPRM33jF/ZEQC
	fxsi1NiuDrk++49lFlO9pdf5i78OAlhhixPF0bdCq++7uuQ/HoFSPrY9u6B00rvrslJNoykqf09
	iugVysCCdjp+vsL3kcoqgqRb7aVSf3J7MoW6bI5zq+badquJydKLs4O1S5H9Zi8R1HxKD
X-Gm-Gg: AfdE7ckEToRw0oK2Cf14J8YrcbUqMHm/fGCKyQ44fZuqZ0ULHhYGOir2wXhhTdT3kmC
	F5VA+gl0YIebsyll5VhkQyZsMoWB2KvHjyZRRxWoHj+3HFmwUCyV16ton/h220LvLjAaMiUCLzF
	rmWcVSqsYFLCOEAcQ8MaI9mcEdYx5sw4zY0BONFj3URZCIDf9xeqr2SuyfmjJqTDBlZfdMtGskW
	YUr0TooSS7FfeEMm3XemLa4OmEEdkWG/lcOC/l63l2GG8HoiFbSJ5PEagu32BOpV/4Mt0+WZ5e/
	n0of+hqt9+HuoFKct3+I3JzGzVEMZXK+fJFZo9DeldNxGhHUfxJWYpoewKg2+oZxJ27uJ3GLHTn
	LqWu9f84lSNpM8gbyV2GFL1SUhV7LEoTWV5EIyO0iEQcIBD4=
X-Received: by 2002:a05:6830:f83:b0:7e9:eaf2:edff with SMTP id 46e09a7af769-7e9eaf2f456mr125042a34.26.1782742609381;
        Mon, 29 Jun 2026 07:16:49 -0700 (PDT)
X-Received: by 2002:a05:6830:f83:b0:7e9:eaf2:edff with SMTP id 46e09a7af769-7e9eaf2f456mr125019a34.26.1782742608855;
        Mon, 29 Jun 2026 07:16:48 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5d3500sm8584812a34.8.2026.06.29.07.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:48 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] soundwire: qcom: Restore and fix set_channel_map support for SWR master
Date: Mon, 29 Jun 2026 19:46:31 +0530
Message-Id: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mEra4i18FsTkuDvbW0-gj6b1S6WMEBrw
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a427e52 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pegW1h1avVakzY11HMUA:9
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX7iZq7ZT38S6d
 N3fLRj1p3orzdrlK3IoHKdz5I1kfffrZ6c5RKXBGd4pV64qK64ICFP+AfvKLEN4oF+8nTDs/RDu
 EExmhyaq9Kyolcf/7Yrxi6gk5V7VL2M=
X-Proofpoint-GUID: mEra4i18FsTkuDvbW0-gj6b1S6WMEBrw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX6Y1hD1YWF/Pm
 ive831bO5hy7ipSXPMLT4VPldKXDjkBkLIIYBxwq8XVFgaznTr0kjrOP5ZJKW9oERpqgMM4ckkV
 Kx5Zk+1XfUDPd3kOGdRXkFW5ndhNuY45epY/2rML7k2dVI3ghiimnyxpGHZ1hNncfYkTEdOo7tX
 IxZTwhlHgEU1K4d9b7NfBEECCvA19B+XdVOHGqFrMUXGeKnk2IV1AKyieBEpFqpqUOatpSXYBjU
 8xWEiYsLsPJ7iEnGcqP7TrG5GdbcAUsq9osEgSvbrGcA2fx32928wB7XZsLrMhmND7ZixVitFrY
 g/kTsMqTr1TZtIi1WGZ0E3ADyoh8NK4bmSWBKL6/YdKll7Jh65ILJgJ2xgGAXq+OQAJ3W0uwzO0
 6CRY8oAcQ4gBNxjgCFE8hob4RwLL7we1EMaVCUC4JYHBw2VrTfJccsBm/Q24fT7+FAAAOngWn9X
 +BOpC2BpT+47wcfH64Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-115148-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:quic_mohs@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,suse.com,quicinc.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FFA56DC24F

The original support for set_channel_map in the Qualcomm SoundWire master
commit 7796c97df6b1 ("soundwire: qcom: Add set_channel_map api support")
was reverted due to multiple issues reported on sdm845 board, including
kernel crashes and data structure corruption. The root causes included
incorrect port indexing, array size mismatches, and improper handling
of TX/RX channel information. This series reintroduces set_channel_map
support with a corrected and safer implementation, and fixes the sdm845
machine driver to avoid misuse ofthe API.

Add a robust qcom_swrm_set_channel_map() implementation that stores
per-port TX/RX channel masks safely under controller lock. Ensure the
configuration is only applied to valid ports and does not corrupt memory
or overwrite unrelated data. Preserve existing behavior for ports that do
not use set_channel_map, by falling back to the default SoundWire stream
configuration. Fix the sdm845 machine driver to avoid applying SLIMbus
channel maps to SoundWire DAIs by skipping DAIs that own an SDW stream
(identified via .set_stream).

Mohammad Rafi Shaik (2):
  ASoC: qcom: sdm845: skip set_channel_map for SDW stream DAIs
  soundwire: qcom: Add set_channel_map support to SWR master DAI

 drivers/soundwire/qcom.c | 54 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/sdm845.c  | 27 ++++++++++++++------
 2 files changed, 74 insertions(+), 7 deletions(-)


base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
-- 
2.34.1


