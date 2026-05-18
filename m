Return-Path: <linux-arm-msm+bounces-108129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKvmEmnLCmqf8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:18:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA45688F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEE1B302926F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053A43E2AAA;
	Mon, 18 May 2026 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbKxZ5uz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WP7zo0bm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E068376BE0
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092277; cv=none; b=TMQrROimC1GLvMFwDQBJNseCcZoy//YMPlW+MnK6e2OYFzICVgOgP/VuhdPPKSNKj+P0viQ4qZaB1537Vo0ILf5eCLCnT1IwWGQh3RhLTfxrStEGrIZgqCG48Yn7lowv4qpLIB18IoPzdsiX0agJfIJUQIJMlleeCB13YQ5yIkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092277; c=relaxed/simple;
	bh=qjG2upfFGS/ng2q8HEpHdPRyycc6X48kD9ZdGIXpTQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=toV/PhYqRQfcxrI58csiwsxAsnONSVszuRu+A1hIKrYRkP2HHWLUw5a145PRi8yO6zK1ZkJkB47bXH5Jk1x0kbvcWokyfy8CzlLJLF4sX1iN87ok6ocVCfrT5XhFsnyfCjOEd7oBmPSd9GuzpvOTOZmx37Vs+WghxoWOZ+JWEgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbKxZ5uz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WP7zo0bm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I75xIY027804
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aqalHVRxucLdolvb70IzZuo3SUTvECOzyNX
	WBtPPupE=; b=kbKxZ5uztLWkW47f8W7Ar0g0q0xmxzIr8Ktlr696atBbuXk9SDI
	SGe1V5dLKE99uTAzvZQ0CCNaLxsYkpjTSnxva0qGAnH6jPqvqHAFZNSliNHZtIEP
	la+pIeI7HhmrJ9Yj/a3AQqTKXU5FN8kW29P2KGgHuBAhXtop3cYPFSMw9IOgtMfj
	KSM1MaSE4F4ZAgoo2pzD+GgYBiNDSgHAe+oxyXydBsKvq9TcQrys8DAp0RKqhVgn
	8VpZgbKSvhcgt0OBW3pX6x98ZPNvWndWVt1qqrgvVxcxP/12OCgZQ9TF8NKmc7b4
	UlgaSPU+6EaSwVNrIJmSKuQqaMnQ1oE2Q5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g5djt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:17:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba86e35aa1so37168325ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779092274; x=1779697074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aqalHVRxucLdolvb70IzZuo3SUTvECOzyNXWBtPPupE=;
        b=WP7zo0bmpjHfz0o/nbCPFnEhieBaeR9RrxqND06Zew/76cgId1C9zFtJVGaI1XHEdg
         IGrEwiBbD19eMfhsAxkOhAuuWoGOxmaEfoF7oaYZVDetk3cvGg16BI6K+pcgD1qUYswE
         LjMMPaX+2LqZ4RemZCHwObbHoCkuudMVAndVPU9RtU3eNETUOBMVjSDpkWVU7yY8YxqK
         +PYCi2OvzQPNFcREHP5xUMMtO8dlmc55yzCekSMyNzrDwwxQmQG0TMpuawSioQ3fR3qV
         NrQK2wU2Av6ujL1AsHcYPvpwSzYfRWiioocqvnNfcIH/8nDY624aYx5QrcDkXf8G9gsk
         pTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092274; x=1779697074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqalHVRxucLdolvb70IzZuo3SUTvECOzyNXWBtPPupE=;
        b=ol3VG0VXKKp/2Pl2AbHVhwwHO37rK5YovjBsSjkhC4ixsSFs7gALse9q2f0M5WiC5m
         LT2vchm0dMpIulVHUP2nMuaT61J+bgcqvmdzThCUl+NU63ocEtIcYqh0XSh6ZbVFbpFw
         iLZkftf0qR95LtJLLQOoTJXEwRXZo/ut++bzKIxO0eb/CTSN4BGgzR2NN9qN+4WJUvqX
         URv2j2P4IYpp250ThwljZ5vgBAou+pCoFO+UQd9BRudpeQVTvfYyzzBGiwAB5CYXLr1z
         x+fkg4C0QRO3/cL5BzNrA1RgkGG0ra0crdCFUjikbT5g0veF8RsF66ZmYgQrweZsJ2ar
         RXOg==
X-Forwarded-Encrypted: i=1; AFNElJ+uSBMSZ64ZmHgrNSo7ZMR8Sh7LLi39FalZR+fw49qdxCuO3+Gk4b8SRFBy0/YKTTrF+lSfVPN2UNjHZGCr@vger.kernel.org
X-Gm-Message-State: AOJu0YyDcCcmvpN10C0JGMrQTjBiLL0+Ju4U6a2XdGSmQsA0ygU8nNkZ
	aixivMcmeeORktlpKdTzc/V385uOrxGlNR3eG2lzFG9OGDRah9TQaemsIPot9JtMnqkmGUoFhro
	2jb7RYaaNJKheM96nBw8bPDYGg0oS6OqkAbf0p6HF0z8xND5t+lYVE7E6REgcX3Z/530I
X-Gm-Gg: Acq92OGnFnf2BU7EguxEXkYfqGGMZ4IX22T59Drqy5JktL172E3R8hXGLgsZTdE5LIu
	lHnvhsgpKYH/lbN2RI5U4A+5VDRsQwAnGYYL7H4V9tjpzZTkL48uzgNSf9PSfSyyzXvigF/ACaU
	xkwxzjgwPDvNGLSsGnkhmSCpfkOg5hA8BXI/VNsxV/pJGooEDnnh7YRLN9CqhW+F/HEvBt5zIUj
	gtEzpmpeEPidx60WwqR2BWS/rOidULbUJ8SwBlksA5efJyImEMAvVowfSIZ4VgzjMjr991EaYY3
	4kzO642QRxY8dkHK4pnrJsqGyXzqKawTq2kJRF8CMfVlJVBGvDVbsd+RUrkMSnUGO/8HgzAKcZh
	JjvxJw965aMTcdzp7tueFO5E06tiTztEdBhdwjFF2JRkN+j/aow==
X-Received: by 2002:a17:903:2ecf:b0:2ba:b643:1f81 with SMTP id d9443c01a7336-2bd7e84407dmr150423725ad.15.1779092274097;
        Mon, 18 May 2026 01:17:54 -0700 (PDT)
X-Received: by 2002:a17:903:2ecf:b0:2ba:b643:1f81 with SMTP id d9443c01a7336-2bd7e84407dmr150423355ad.15.1779092273547;
        Mon, 18 May 2026 01:17:53 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c2631basm136620755ad.34.2026.05.18.01.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:17:53 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Mon, 18 May 2026 13:47:35 +0530
Message-Id: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OSBTYWx0ZWRfX+8v8tBq+ZMOA
 Od4Gcr6CabM52pOs2ZU8DDQrt3udbJrrq8JDOmRtLphlcVY0k39FT9IUy8oWiEoyafw4hFl1uXT
 isqfaZuSUIWBMZh+GjLepOlQgXJx+bPmc8GhOVdyzTJ2p9My5THiw3oQleSNcSVZYbmHk8hW35J
 udebhFAa2qFppvZTt1j3qSfA35Alu2PIWyiSpIfSpm139qSrNohMgEIB55mz8sicUJgU4iulINm
 S5CDYX4g3QcK7KmXJXE6ekm6LMszEO9eU+Auy+F+OCKkjH6qZAi38W+3FJc5QiGEOzraEi9+SPN
 zj+O0jmDmveQN89PsOeheIRBeS9XIYep0xnxJNSrmrUNCfqm9oOS1JS8HDX+rMu1C28Ed6NPu7V
 JpdkQHUETLKGYarXcpJU5W29N5RGNLlIPjS22kFdoOc1Eo5CsznSIg3z/CZwgq9EfM0ilMCUzuB
 kUumYnEacIx1k7X5/ZA==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0acb32 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_6DtbLWMUc2xOIpCBHkA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: BTc3qReHP1psUK4l_RTq3aVrb_1bStUt
X-Proofpoint-ORIG-GUID: BTc3qReHP1psUK4l_RTq3aVrb_1bStUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180079
X-Rspamd-Queue-Id: A6EA45688F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108129-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series converts LPASS WSA and VA macro codec drivers to the PM
clock framework for runtime PM clock handling.

Clock enable/disable sequencing during runtime suspend/resume is moved
to pm_clk helpers, while regcache state handling remains in the driver
runtime PM callbacks. This aligns these codec drivers with common LPASS
runtime PM patterns and reduces idle clock voting.

Patch 3 switches WSA MCLK clock registration to devm-managed
clk_hw registration.

---
v3: https://lore.kernel.org/r/20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com

Changes since v3:
- Converted runtime-PM enablement to devm_pm_runtime_enable() in both
  PM-clock conversion patches and removed manual runtime-PM disable
  paths

Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/lpass-va-macro.c  | 128 +++++++++++++++--------------
 sound/soc/codecs/lpass-wsa-macro.c | 119 ++++++++++-----------------
 2 files changed, 110 insertions(+), 137 deletions(-)

-- 
2.34.1

