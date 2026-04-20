Return-Path: <linux-arm-msm+bounces-103749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKdNKdUd5mkMsAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:36:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D56842AD00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4ACA93037658
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B74140E5F;
	Mon, 20 Apr 2026 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCLBUVTw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV2WGur2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1108C22301
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688241; cv=none; b=mfQFornqXZFqALYsKo16RCD63fx/6f+yxTRxyvR+fUsKetT4JS6Z+4E8m+tctQZiKlO5nITUj9QQ12aTD4YINPeOG99P7EHv426EljIDnrllWCFhQ+PJFQansDuLkPUYQWDxqxi+tk3MaGGSaGwHZxGiPOiiUXbsdi2Vle2UDDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688241; c=relaxed/simple;
	bh=Fy380mKYxzNVWyk7M4l3yNtkmqQTJcsOpH73C+EtIA0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BvUfRtxQ8A9vti2fHUIGnNSkK5f1CS06IydHzfe7L4j15Jg5bSeEQ8hXJj0IDs9iJWaNYZHgIXvHYqIuRDD9il64RCiZGznTjxwd+/ud8h7aJ/vq99t1HhfM9IhAjJ4s2kkUB63M0E4FACuDSdK6j+6Qqk3hnoeoGGjT5bhq+Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCLBUVTw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV2WGur2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvMuA3015175
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MtRfJbJ3ws5GO8kwn3pm6zcpXmCmpvkcqbG
	+nQI6Vcc=; b=XCLBUVTwn37ChUMdKEpEpHLBsAsN3KWSVWW9Wvni0b4tH3+bKTk
	pS2cSmPpnfbv8wlmJQGEm2QjXI2XN5YRntWm4ioOsS/ccn4wrmLtVdzr4Jd6tAtE
	fB4xFfxT4F2D0eT+DuCSvSZqYLMXbEe6l/ajkngF6HOxdCFfWLQctx2QEbEutGkt
	OC5qC3b3dSm6CGBR78FaBdwZF5LZlu8XTNcp4xQUzC2eh3DiyWDXXXqUHLu2tvdf
	56h3XLdTlWF4g4Wof9MCZp34KXpqmp+IV4JrpsXk+H5Unnm7Qf4SM81pRJPyBR85
	3EPuQT2IFxjQfxMf4y9J0Teovnb8IS8Gj0g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjukr90b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:38 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-790afc07667so60479827b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688238; x=1777293038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MtRfJbJ3ws5GO8kwn3pm6zcpXmCmpvkcqbG+nQI6Vcc=;
        b=GV2WGur2fxYJ4ZK3oq25SsBdqsiwXPCMi2ZE5e3cwQwcSp+ZQOHUGz09NsPpYRbO15
         RYGC1j7nRKOH4tPYdyK+oaMhYt/g2HfZJi4CiUTAuMzMu3dtEf9fVwREhxJYXexH7wfd
         bkxDCGmHZ49Obi/8kABn36L3kN0a0P4Rx3FA/Vq5TB2XRXKHSWZB+QAt8VHldHM+OIPv
         elGOLVZFKqUFDeb8KVXef3mi0TaBzFbkW3aO2OQWUOalOuKoLOhmK1D/PcyWgeM82w/j
         /2hNDY6ubkUrsPadSiaRB96vjBfiS/qvT2TkWTThMwDvCZtrI6yaLN9avVuU0Zt6PoUX
         Bc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688238; x=1777293038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtRfJbJ3ws5GO8kwn3pm6zcpXmCmpvkcqbG+nQI6Vcc=;
        b=pDq5OsV6fDWoCikYnfSdnSK8hLOt7zFXkv+ISutQlHHMxRtL6tkgkQrfbKTPQF7M65
         oMqmzac3UbgKiP4BO39mj+tSa3ncjPp5bjEIHskHPGPQSVKwxc45CEt8OK4kshoJfICo
         V4kEL4Ro09Ajd/8D3pWSEPaqome7siTc8UMsCd1Z5qbi9/9Gfu4nbn1Mkr4YrR7RROQe
         OJ2ylSOzNElyhVSD+mt2e8EqxYLXNzq3GZLj0zZDcGe4kN5FWfNHyETsMHMd9O3f4K3L
         NPtWcR7NgHMefWB8ZpJDdIY/LTWSC22h+pUy6/ZML0fq94BIF5M7Xaj4gdYLVs+rlNLd
         rs0g==
X-Forwarded-Encrypted: i=1; AFNElJ9Mpwjvr/m96x2Ktgn5Ah+3pjNm7B55Zt6ZOd+Fg7nlOv0hP+7BhsxHwQKSCUCkd5030/jxIv4/OpFkIXDx@vger.kernel.org
X-Gm-Message-State: AOJu0YxL4zDbrMP++o5fQMr71Pu04Nv02QRchapp1CnaS5TluOfmimox
	7xOguHPWa3CXec7IUG5Z6967/5fICXgNWHoag2yrYKpvzBHNDdpNwP3dKT/juMyBCwIf6WExdH3
	D5QpyC6xWMlN87bw67IGbuuzE4GX/MD1SuNaIrOpdtYwOGkVmFvXTlyqiGEg7lL2srphi
X-Gm-Gg: AeBDievnwjDT7erRGMdlgxUgd7gT7kX0HLDVHTLtNI/ZI4e38mGIJ98DgS2KZi7VgV6
	1u4DxgjDietJT6no6oDiD5xSgDn6iYu9zOBQlQXHHSuV5M3pkNKwnofyXy2CLm7Y7EGgrJNzqOx
	+5NH9b7CcuBGxXY23evv2pr6xRTe8x01Y5bSF/Yz81Fnt3Z6vau61PWEQtnt8axtvtY/B5p/KlB
	waHmnjAdjqPQBJ9qv6LZc8X3COmsjwp6yRtctUeRrF22tY9vevjaWUXuOXLs3vZ767eUNdrSRqQ
	V3AOHBUTrr8fVnrWORfRypuPHpmNKvvGHbwc4V/SeTv+X0+9bdzIXwNWW5Nm1GRXgZ30hnjw8aP
	NJQEEh7bOUZgOeaLGCzNxGTMVVgUrzN5fcnTnkMjofZcoai1GJd5d+iNfJ4wR
X-Received: by 2002:a05:690c:c4e9:b0:7ba:f2f1:86b5 with SMTP id 00721157ae682-7baf2f18fb0mr26400907b3.14.1776688238572;
        Mon, 20 Apr 2026 05:30:38 -0700 (PDT)
X-Received: by 2002:a05:690c:c4e9:b0:7ba:f2f1:86b5 with SMTP id 00721157ae682-7baf2f18fb0mr26400457b3.14.1776688238070;
        Mon, 20 Apr 2026 05:30:38 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm42785177b3.6.2026.04.20.05.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:30:37 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Mon, 20 Apr 2026 17:58:40 +0530
Message-Id: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aRPhMUEAl44ZZMWfQ8HFKsOEcEiX53MV
X-Proofpoint-ORIG-GUID: aRPhMUEAl44ZZMWfQ8HFKsOEcEiX53MV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX2GgfKbPbWYVQ
 Nzn8E/+eIZwKHjTQqi4Bdj6GIl5ShaKZu137GugBb1z/mQFUc/rb4gz3rpC4FKxu9ptBZgIiIu6
 39z8Ns8suHlZWQOuwxDBoqyAXNvaPrT87Bv3v2xuaoT8bkof9rgBJN9oGKY7GgeYP/hxa5AZ+5P
 bhy8056CU82kLXLuaNLZ6+grRcDQpsIoQIbmTY7smuhvDPaGkvGf18+lqd5PDEJzr6LUeyY1jZg
 RLSdZBceMvD3fp9n2m1kRVRQtwXB4tSYaK+Gk43cPsuq6xaKJqga07mrR0SuD5Z5FTmzljuU4dg
 2idleVJVZIznWdfNux97LVPj9aBmI5L6JH6xdIxiM6K3snpCDObRYnbbJpmfvR+OUAyZREWrlw7
 +EMkR7uSbNldhSnmqQ9xhmvxvRzJ2+NBoMKOt7yZP0TTpDcUjUtlFaeLSeKZJWMW1LPjAakXfam
 EGla1ClXoqQj8Zp+nDA==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e61c6e cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gFaWXFso6UKOuMbSp88A:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103749-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1D56842AD00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series converts LPASS WSA and VA macro codec drivers to the PM
clock framework for runtime PM clock handling.

Clock enable/disable sequencing during runtime suspend/resume is moved
to pm_clk helpers, while regcache state handling remains in the driver
runtime PM callbacks. This aligns these codec drivers with common LPASS
runtime PM patterns and reduces idle clock voting.

Patch 3 switches WSA MCLK clock registration to devm-managed
clk_hw registration.

---
v1: lore.kernel.org/r/20260413121824.375473-1-ajay.nandam@oss.qualcomm.com

Changes since v1:
- Fixed runtime resume error handling in WSA/VA paths:
  - keep regcache cache-only on pm_clk_resume() failure
  - unwind clocks with pm_clk_suspend() if regcache_sync() fails
- Dropped the separate "Guard optional NPL clock rate programming"
  patch as discussed on list

Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/lpass-va-macro.c  | 123 ++++++++++++++---------------
 sound/soc/codecs/lpass-wsa-macro.c | 115 +++++++++------------------
 2 files changed, 97 insertions(+), 141 deletions(-)

-- 
2.34.1

