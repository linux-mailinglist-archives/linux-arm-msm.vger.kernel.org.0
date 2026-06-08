Return-Path: <linux-arm-msm+bounces-111635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iA0jCaApJmrGSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:32:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C0C6523F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:31:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UUiGFWLt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QgsPJZY0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111635-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111635-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 212EC3002A01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 02:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9013101A6;
	Mon,  8 Jun 2026 02:30:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ED31E1E04
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 02:30:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885835; cv=none; b=hqjgGvhIDH7V9J3ryN9wkbv19DTVujokMsbdjAEYm9j9LG7jj2yHpyOOD5s8F46CfyElcm1+AYzmt6Pnh979lQjDPp6q/lhklP+Uf3a6AZyA2vdtC7uBXn58XK+80T7IbT4yIsPs3jZVR/VLXSxMTcLhUZI4S88Ltq146zM8huY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885835; c=relaxed/simple;
	bh=as2K6Olkw9oeUKiAJkBfQ29l/hJM1plHj4oLgqB9CAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jLmF41nXpnIt4cPNqO1POCcZxxh15r8pRgaHc0bKARJL6rELC+iUFwAwoR4Ucg26ruDw6g6uYCa5pB4fPqoU7PECKZltaH8hV066RZlbIbLyVetFhijDJ0pysMsCDXi8qCzfJt+h0Rz/fABya98OA8Tr0t2t8mLjUA2ueEHgW90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUiGFWLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgsPJZY0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EgJL1572542
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 02:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GruohMJr1MJcHN3mBUM1hv
	z0MEHN2CgE7L3SL79Ae2g=; b=UUiGFWLt82y45uxMLhYUVEVLgXPbDOZGyB/Uab
	HJza44t76d/65fRfEiT1Xfb5nDtrbTjYaLkIrzsyfVt4zMyTiAWe6eFv6rfLNmVu
	tHAwU7dxQ7z5QH1ahqR82WDnj3606YZ0vZZoFU2hF/nNL+lDU+WugPr1S0kw+qis
	VZouZlc/KrQ4RL4XutaX2wuknIFLrGsHsgaL64NleNkWh2cA7UIvqCWNoP1Y0DY8
	bCPgeHxj5CJFmD+u/FnHGBaijP9MZDmOBDdVlPvrY79FmpviR5mTVJ2dc0uvUY7i
	vlGlM5i/cYbFiCVRgyTK/obYvzs6FOoZ7UruARfgGIm8innQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8w6kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:30:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso51594275ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 19:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780885833; x=1781490633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GruohMJr1MJcHN3mBUM1hvz0MEHN2CgE7L3SL79Ae2g=;
        b=QgsPJZY0dHu3Vf5kTWiJhrxIywseyoy413S53ERdwVKgZlAsXqmvFZMBPnnhzVnW1v
         OjAJnaNQj6YluHA4nsBaqMoHhAIC4R32UTr1zDX0AgweAP7L7vw5NGGNzOdvr0sY30T9
         eqBB4JCJa/U6yxy3BuuWBf0o3fI36Pjsr3ZDoNTfxdGW0KmNuHGER6uVCyJVlbf3OuT4
         uqznmCFULvbipjEKLxeGmfPwh+LaKP3HiZYFJuEz2KgbrRv9Is/z7ArBmUZBp+Y99n+n
         kwKpRrZSD7rIkrE1AlpuqlLZ16iMkiavAtFokPCSzEkaM/l1FSIhNhnmLXwCTPjW9bvg
         5OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885833; x=1781490633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GruohMJr1MJcHN3mBUM1hvz0MEHN2CgE7L3SL79Ae2g=;
        b=Ocj29ub6fD0Y+1D7pVauC/a9aOrGSEKFSWAg9UdAjp1U06agH+m3kWu3tbRsda2IHi
         YheSjJlt4AvVnHM3HQj4+3pEDF5ip+IiUeMwvgLiEz8xFn9sgJRXhkxqm7vCEPnoy19q
         XYZ7gmC/gNGFjG0OOaYY341bEaa6vwnWkjL3U3ynduEubLHum0+NAT4QEaNdqPuiAkuk
         0oQ3e90GiEwH3Ljc7arlFLh318ghzVlSbkZl6L7tsLkB9HT7xM45rzq6xkKFh3vy7lac
         0Nb8qCl0VW+UsRm1g0dwvvmqLE2WSbwakdVVnPCrQI9DoWfSDZ3RkJ0Bkq+TwKk69Xat
         /kPg==
X-Forwarded-Encrypted: i=1; AFNElJ9CspRtkMVyG1dGXBJPrtPRuvQlF5nqmn58k7qsIv1g5PNS10sV4NF9sTa+1LrIyKZOxHUmZPctO99GSGn1@vger.kernel.org
X-Gm-Message-State: AOJu0YzHLW+4XDKk72I1BaZlJ98jdQAhvkwK1JV9MGtYQpsDVp+EYNER
	IYFl5tLUJ37ct4KQPmfLwhOGm+CPLxLFmtjfGo9XBY9mGnI2lV1mItNfzQggI2GW2FVKPBgzh5x
	9+Agyb7VKvlInVFimAvuXNQ7xS23OFT7GohXD5pXFcww8+kWhRUVFWmxpiA7rAf6p15GS
X-Gm-Gg: Acq92OHr9/O7+YGRkpsQ7HSvuUHz2nxThp1EAKdweBZdtJ7bRAm58KE4Kz6bXQhPqE8
	q1C0qDCvumH0GzhnG+HQNEO4IwFi7FeZC1E/YgkCOL+nzKdi6oRAj1Lm0QI+tfHl1nyDgPiejhr
	R6TKacBmNdQgHq8O8iLkOnJFzX4ipJqk54an86NP0OELJ6VHfZso+K5pr0hTGIlE8fJi0CZd8z3
	db1hUISepsqpHhvx++Yd89fWVZ8b5JizSngAVCJMjgZfjkLbfC93W4B5r19AxVrTz9k+GrU9SRZ
	q41BetyFduXMDZVNkd2v5jHEI4H/3fR2lntIQpQGihNK6IitTOeQMImElklloxfq68styrVb2ne
	tPi5myS9cSf/3Hy6v/EPvmwaS5w1kj3cX7KL1JyKPDwJk0jI3La0AdrC0tUqGnebfo1t/
X-Received: by 2002:a17:903:4b30:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c1e80e43c8mr152399355ad.1.1780885833109;
        Sun, 07 Jun 2026 19:30:33 -0700 (PDT)
X-Received: by 2002:a17:903:4b30:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c1e80e43c8mr152398945ad.1.1780885832674;
        Sun, 07 Jun 2026 19:30:32 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm162343585ad.50.2026.06.07.19.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:30:32 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Mon,  8 Jun 2026 08:00:08 +0530
Message-Id: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6WTwxaOX8S2cUtuntgW7tQGbjxPvrMre
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a262949 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Wdb1h0LgAAAA:8 a=EUspDBNiAAAA:8 a=BifR_v5mCn8YSut0XsEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyMCBTYWx0ZWRfXzNXPtt0bVdFJ
 p2QH7PtSrC+zBUJMAe8777Ihq25jHFgKWIF5bBkoLxsxq5iu+lB3uqz/lQ7n6l2CWImiBDCWVrX
 9dcbcbJnhzdhjajpl47K26HPnZgUanOmVKiv+5dgi8EB33sdtIXLcZB209IwVhh7A2pRNyCFs/Y
 Ye+vzWlWLEUHEzytIg/9rMlrJsPlH0XoTv+lyHb0VEj0ne/tEy10wb0So0IZc1xbbC3kVIWq5N8
 1weM4DE8YCgVSa/Sa4sRuPRrHFCWNKv0AWhwqDN5DuBqmSJdRmhjxE7JLGyc9AOL3xLz3OsRAU3
 FM9LNh4UEBRlTrNdcJExfZluceigJpzZcM5hCzVmAGKb3tA+MtKY9iGGYQv1t8jMhZqzazMzpPo
 Pxm95QFx3I3ysdCItBMNmBna0hliDB7KtHo8CwxODMCg84JEJ2G8sQeRr6u+7jdNhFzAe94wnuY
 vIpJIt886u8lhZ2UsuQ==
X-Proofpoint-GUID: 6WTwxaOX8S2cUtuntgW7tQGbjxPvrMre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080020
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111635-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78C0C6523F5

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

On platforms such as Monaco and Lemans, third-party codecs are
hardware-wired to the SoC and do not always have an in-tree codec
driver to manage their clocks. For these designs, clock line
enablement must be driven from the platform side, and this
series provides the necessary support for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility
for voting I2S MCLK and bit-clock has moved from the DSP to the
kernel. This series introduces the required device tree binding
support to represent and vote for these clocks from the kernel.

Enhances the sc8280xp machine driver to set the boards spacific
configurations.

This series depends on:
- https://lore.kernel.org/all/20260607-rubikpi-next-20260605-v1-3-7f334e16fea6@thundersoft.com/

---
Changes in v3:
- Added a detailed commit description to clearly explain the need for this change.
- Improved the machine driver based on Neil’s feedback.
- Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for
    board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  57 +++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 137 ++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
 sound/soc/qcom/sc8280xp.c                     | 213 ++++++++++++++++--
 4 files changed, 391 insertions(+), 20 deletions(-)


base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043
-- 
2.34.1


