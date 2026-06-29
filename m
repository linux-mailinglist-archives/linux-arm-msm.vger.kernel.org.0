Return-Path: <linux-arm-msm+bounces-114962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DGADL+5FQmrM3QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:16:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD926D8C66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:16:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Uai2HY+g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NVbq+bUk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114962-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114962-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E3043004CAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C222E3033CB;
	Mon, 29 Jun 2026 10:06:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EC335E1A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727569; cv=none; b=HVcwahvI94Ie06f2etUuDIDUE9PDMVOP4KMbN1bR7kec7HGwjRzkbuhSAvRZBmwdpLsiZaFUfpOZK4cQ+tONmqU8Y6/6LxG2FwDK5NKtijJU2EFsXmhUeo4AL+TVM6F9FLBAB/RUlwaaY088MZb61tMdsZXQeuF1YJO03R4S6jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727569; c=relaxed/simple;
	bh=P6eLxUIiE+lx2/w61gjg/sUcTAbBjxZX85JI2peNKhw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=akKirSyvGU/O16wLk6KSs3oHxjxmz6AvyjGL+KVz/vq++mMEWoGLDDfwuaZlVkxtEACyKj4NFcQWieQ8SsjHlthmgH2DR+BKC7UuHfNm1SjCwYclgnKw4gC28ftPDb3MwFNpIMi4ztYgG9lDZNmYo6YWVt9vCxhjW6TdMIPBsF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uai2HY+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVbq+bUk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aTCB2368206
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cw/7NSANGSyxIv9D7/Y6yn
	h/9DTnfWawXENIPhr8xwQ=; b=Uai2HY+gR0nZ2yxWtulsxOuBw0GoVeSUckYZta
	LNedO3gDxhMgpAlFrygY3PhdcD3mCfHzDmwa2LENWaDtrfOgJFmP07glgeN7D9u1
	MaQhIQ+sq+JhZYn2D4Q+EM7td9K+ktQ8PrDGW5XaOT/ctPd83n6X3VsF4TiF2JXD
	t8OuJ9JPTE5VNpBypYijvpINBENpWumvK54SsPU4+uquQySCOO+9QAAEeN7cVl6V
	J151+FlMBCSbkrkPelufByq8XgoyxCdeUlv9KqJUMdMGO74aOf2Qz9pCywcshqsZ
	9QLDmAhb43H9OSfwCguWU6Fr6mOVVk5B2Tg9MbmrK1Up8Y3g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgrc02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c987913b08so19324615ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727566; x=1783332366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cw/7NSANGSyxIv9D7/Y6ynh/9DTnfWawXENIPhr8xwQ=;
        b=NVbq+bUkrvthmu0BvdC6Q9Sypyt+iRF/lGn98SLLoS5cl3NHfoCV9pkk9cWlHmQ/QP
         1qIMXjImc9MkPSzf9iqS6+dswd3VC/qjR9EyNoUvEEG1M3fNaxrS7L98ay3KPxnJdPdu
         EzomHwlX7VaJiZPGtKbqbELIv2scK4KF4B5O8JQuOU95ONICwP+ZztuQQA8Ik/GL6P9t
         +ksbn5brae4hdL1xmtAvb/dVB4Wxry4OJWiYbq4nBY2hZ6o6o/T3f7dTrevT42SavccR
         oKmwSOKAjzn8JAbbYIsxDxexDkAmaiNeICuvGYKk8Ev2QjUnhWnPv+XK0JWnkBVy97cF
         Y6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727566; x=1783332366;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cw/7NSANGSyxIv9D7/Y6ynh/9DTnfWawXENIPhr8xwQ=;
        b=f+KNHsbb8COinlnvne+Lf0g7qy04QSKzyT0gpdH3/gcD/oG4wABvlDIiUlzML1CiPP
         +Apw/909OwdRomHRQWs/BL26O0mniUf+fkI+XckF8/Q6HWhlC855A0fbjUYLFPiTGETW
         iRsIBl18+0Sr1SIcW5R/6DgVU3tS5+59ijDsQlE9d8HSgoOv6rJ3CrlRrAoqUAPU2Cg9
         5z4HlbDdABz3/yQL4M+czoCgJS4eym/WcwOOUQKtfIfPaUI4BRNYz06zT8yWME3OuJrw
         OovzA/gltxQaVKickFZmY9SWEtRH2knjZ1BwJDp9M7sxR3CrJWjqNHfnc0MOqcMa3uOB
         GU7A==
X-Forwarded-Encrypted: i=1; AHgh+RoCJe1afP0D0gLGo7noWNDFby3tZ8iO47bKuJgQet/XDUwficNxkJUlwPQ+MU+pHQ/26trGtCan92Im69KZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxW4oKvpjQCUJHT9JWfkICHCgZw4GnZNywbQ9RjyxGeg1qclGSD
	rUbeLXaF+DTLjuL939sq6F9PTpodBoV4ss+BuZ9hlzIizN6ik9zisBzN9MDJ5mGFdHNMryfjBxm
	bmTMnEuoUaWKqbAWmdrKvwJrxWJZHEMP+yzeywyqLT9rm4UarEgamamK2VnMfGHy84xmG
X-Gm-Gg: AfdE7ckuldQIk+xlGuLEGjVrT7jZuo4PrPgCTjiwLm1A+2NUM/xwH2L1feO8cBqmXy0
	c8KoNXCQ7Ry65VKmENjVwL/fRvQJJXMOfozGKdt1kKh+fj59YxYxfzmDj444WATua5WiSWZNRpM
	a5PR29X2Oei0H08yuzY11c+wYiuZTBlosBSAGA0/3WvnfJYQQ1nBsDll2DJtNHzgVda7ilgYYjd
	4P2P2CqRlUd1JtyjQ8q/nxB3jtYpKXtz64pGO9JweW2gnwNM8Z8W6D8Pm/oElZInAhFBz1nCOPO
	hsK9UkaSQAF1kwI2HNR2PSSOZR9UXwu5KqEo+u8WE2c6n3vJRV2gwgZE5MWfdxt/UfK9ge6sUt+
	ITiDviQKs2C8+H73mAMf1ERd8HaYSfx1jRkMRPCc=
X-Received: by 2002:a17:903:2f0c:b0:2c9:97a7:b1f0 with SMTP id d9443c01a7336-2c997a7b396mr82682355ad.47.1782727565881;
        Mon, 29 Jun 2026 03:06:05 -0700 (PDT)
X-Received: by 2002:a17:903:2f0c:b0:2c9:97a7:b1f0 with SMTP id d9443c01a7336-2c997a7b396mr82682245ad.47.1782727565368;
        Mon, 29 Jun 2026 03:06:05 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63cfe81sm88924305ad.55.2026.06.29.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:06:05 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v7 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock
 framework
Date: Mon, 29 Jun 2026 15:35:37 +0530
Message-Id: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFDQmoC/yXMMQ6DMAxA0asgz1iiASWlV0EMIXZbM5AqBoSEu
 DspjG/4fwflJKzwKnZIvIpKnDJcWUD4+unDKJQNpjK2sqbGLaIShkgccHU4NPh0tiVf++bhCXL
 3S/yW7Xp2/W1dhpHD/B/BcZy2DlJjdQAAAA==
X-Change-ID: 20260623-xo-sd-codec-v7-b4-8769da3a41ad
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: xIIUA3a05ZLDMGJU_3L4mN06oREBuVsn
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a42438e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RprURHu2vK4Ir6F4JdUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfXzQ0bg7iwfLQH
 wwqOMdpZkueZoWmrJSLyz7pC9ymL1AMu5DIUZtM4Vb32dsq6ALyOh/xb26CEDg7yUZByeIDoH87
 5J3RHxYX31gzGuN6cdBC/48GtQ3ECx8=
X-Proofpoint-GUID: xIIUA3a05ZLDMGJU_3L4mN06oREBuVsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX3XedpyulA3Uq
 5uzuBTDI4vrK/6u+VynlVmvfXWygJNs/HYSJWaGyZEWu+lRYrXLi5RaJC8yEgq4rcil25cQaJZU
 ZUfCOF71cD7aKU+O0+aA4iKwqBw6bV2uax65Zd5wSAcEjAbZCnaFtMkLJC8EPxEoYlc5WMoU5g6
 mOh6WEagdnrZyAKET6ZBKgqj9qpT+fC6pInAP13d382AIOA1ZxNjUynEdDtorkv7KBlCCiM51ca
 UEwHvatpqf5tdWmHp9MBPUNHh3UwsCpEGo90XA6u0sOS41OqrtAHtmqNrVvcQyZOMr3nuRa6eID
 XmbFzlgSH8fAYqppbVoKW5EzndZ/hXfTtK6JbM/KLzTD+JP88bPQ9vcgf6gNK85GbmLD7YK6bid
 CeVv8de+1S2Kpv7GrdP4HexVXkSIMfNXLmrFQf1rswUMJPK5QKhdxzHOqv4SH23b1b0cV/+IHOq
 jpDcmyzi2t6dL6QZLYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114962-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBD926D8C66

Hi,

This series converts the LPASS WSA and VA macro codec drivers to the
PM clock framework for runtime PM clock handling.

The runtime clock enable/disable sequencing is moved to PM clock helpers
for clocks described in device tree, while regcache state handling remains
in the codec runtime PM callbacks. This keeps register cache synchronization
explicit in the driver and lets runtime PM drop codec clock votes when the
macros are idle.

The series also keeps WSA MCLK-output clock registration resource-managed
by switching it to devm_clk_hw_register(), which allows the empty WSA remove
callback to be dropped.

Changes since v6:
- Dropped the now-empty WSA macro remove callback.
- Sorted the VA macro pm_clock.h include.
- Re-sent as v7 with proper cover-letter threading after the broken v6
  resend was accidentally sent as separate threads.

Changes since v5:
- Rebased to current linux-next/master and regenerated as a standalone
  series that applies cleanly.
- Added depends on PM_CLK for SND_SOC_LPASS_WSA_MACRO and
  SND_SOC_LPASS_VA_MACRO since PM clock APIs are used.
- Improved runtime-PM probe/resume unwind handling in WSA/VA error paths.
- Kept runtime autosuspend delay at 100 ms in both PM-clock conversion
  patches.

Link: https://lore.kernel.org/r/20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com
Link: https://lore.kernel.org/r/20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Ajay Kumar Nandam (3):
      ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output

 sound/soc/codecs/Kconfig           |   2 +
 sound/soc/codecs/lpass-va-macro.c  | 142 +++++++++++++++++++++----------------
 sound/soc/codecs/lpass-wsa-macro.c | 133 ++++++++++++++--------------------
 3 files changed, 134 insertions(+), 143 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260623-xo-sd-codec-v7-b4-8769da3a41ad

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>


