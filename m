Return-Path: <linux-arm-msm+bounces-109316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFyvHupXEGocWgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:19:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE465B5006
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75CEA3036E1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0BA395AE6;
	Fri, 22 May 2026 13:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnX3w96W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOUQTBgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD21396B9A
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455102; cv=none; b=OXdqRovr1Auz5s/mSNHyKTwk9SLEiz/ylIBY+dxD5uUjRjDZd5fN8jj+nd4NTSXMefsx9tm9YrOgEnB0YiStOmmsSnGOG95omvPvBIT/rjL/KzV/LPWMAmo8apjZzC5EwgC1JJ0tgptldggpUL17ZwPemLcXfvIic9p+1ay8xJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455102; c=relaxed/simple;
	bh=WO+NVaJ18uz3PmvgEahgw8uWHr29nAhUmZu/DB8hBXk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=r2CTAQIs7K6gRzicKq24Kxq4E2uqvElLxZyCEAt/rLW6SFUG1uni9rt2e2QBoWSLjQZn+VLV6WFgiAzvBRtRpRdIBp/DoDIPrE2AEHQKKOAj0AaHESznqn5Vs1h4xWJlrv8sOqrIgmU68RmHiM4uNsA3eoG378Iu1taIQBka/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnX3w96W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOUQTBgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBHKKD1298251
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fzhhXoNbvLrPQvIAEkuEUv
	lBgp4KgxOpzH4SvVu1Ek4=; b=MnX3w96W/rRNyfVyEFtO1L/KzPxXF8KeMXJdZw
	BRlLftUvJBB7hCGRMiZDf6HcoVbSzzFBk+NyiHQvMw5PO36QO7bSDyOq5XLZb4Dp
	z2ODbkTBIS54bUKYf8y/Ra+fiWxNfNhJcL0NgquowJRJ2luiR8/3SQ9ZOh4XVcYm
	XTbvbt5VKW8cLL09qrCJOu1qrpJV0nAcwGKwarXYpUEuF2i9GRhG/J6oZiHQ5u/E
	rO8FBJBBJjECWpkPN/RfVSkoQYemqae9Ij2xB9o2YFBqBYgsWS+QSxVEzmyllzpp
	UxWsVuSzlsQhMbusb2jfYkjoDl4Ia9dluonFEBkU8kTCansg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0b1cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36865d109dcso6801849a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779455099; x=1780059899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzhhXoNbvLrPQvIAEkuEUvlBgp4KgxOpzH4SvVu1Ek4=;
        b=fOUQTBgizqfHQ32JmgnYzaC1ppa3zBjSMVajZtK3tAKyH8TDgKu5pYSJPM3mPm9cjF
         BlpP06ozssR10lZsRztDjNTU/1+/iT4vGxOLKnbQUtudzCQ8TBctjSfrKgrnju9xev/R
         emw1ww5hZQHHWEncmKI/cX34U+7ox1WZhytu7P3CFI8s0JQjoaDAV71FkxXEgfVV6CBA
         F8Tzo/8dct1NjR2Qt7pLj3d20eb3SKnvmUDOK69lOLytKXgU544ngqgngav3Xm3yFb2n
         4RQ9483YyJNs4x65YSn4wiGEvOz1+VB6vQ3G2bGyLm+FmEU0c2PdfnCnEI2hG4xYxCXI
         CJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455099; x=1780059899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzhhXoNbvLrPQvIAEkuEUvlBgp4KgxOpzH4SvVu1Ek4=;
        b=BmsrnwVCpDAF2PO0nBHP3hYOcX8xWFUwWAjQTprRpT3CUvcRh9PhlLUOaw5N/aHL1W
         yHJN18OeHWcw4srltZM7YBT8ScKW+3tmX2zpVZ24PsHGPKU1Ej7ONzyHmN0O5SEFXcy9
         8pqjWoSnkdKWV+bIcsffI8exo1Gqdjj07Rsczcoqy/3jUbwV6Qe9wTGI9e7SOTh8vA89
         HY/smqlq+jBnU34r/YaO4uTKMAx9Yz6Yj5WR6qN1SY1nVaaUmWoaWnKHQJiILrco8Gr/
         fn/fhsxPzmJY7ObVwOEOHtGj2Np+rTuGFRtazkurZ2FUihB+UrHESvalsz6Xrpiu05l/
         IJVg==
X-Forwarded-Encrypted: i=1; AFNElJ91dWEZcNLCADOrw2ojddpL5C5u9E5gIRknd4l4YGrKwDusPQq4UXGvFhRcmPRBNxz3F5QF7f+sgLDcGoR2@vger.kernel.org
X-Gm-Message-State: AOJu0YwwhI2G80/vzWuVyCkZAlFw3QaUKkzTqUfmb28fCi39MKg5VOiM
	pQztZXCGAUIJxnhf7xSPJpOKAMYP7JgOUV0/iwJLFVw6F9Tyj44CKIsN4EGOIJuzhq9vi4a+ord
	jUR7rIkdEG6TH7X1IWDO6W1BdTIg8aEn+URfHLoQqeNc/wCNThygXmNt8WsHSxtu30ALB
X-Gm-Gg: Acq92OFWCg4ggjsO/Gck/ubDIB0gtvUmfN/jLMCm00S1MWQpi1nZKNhBfUebpl0038Z
	YqSFGvZJmMsyIv3Cg39IxqxkCShvLJ7hr3nc/ovgvMlOtE5rmYzSWRsouRjfkrAD+eAtytmsd6D
	uKVmd0G6E2oNs+bpF7jFLQz9tIAnGKLvPrZBXPjmYLxxtYaWW5YjqbvULXfIX8YapijTZ/9+z+M
	ta1hvpfHmCSDoHYYWIWntyxMnXhklTR1DPM2RVf15gQgQYMlPSRIVVR4sNzV+ZEpX94KPVaiOgz
	tVzuPHHTAf3qi4Y5mrGB3t7df3oBJvzWvP+lUsPoCe2KUxtgM1Q/MfPiT1Lo8VfDVsVCj+1xG5W
	lh4EuxEMY3qGdEZocU+1zErJTT8xtpNQKVSRghcgRk51qW59mJg==
X-Received: by 2002:a17:90b:50d0:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-36a674b6931mr3485433a91.0.1779455099312;
        Fri, 22 May 2026 06:04:59 -0700 (PDT)
X-Received: by 2002:a17:90b:50d0:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-36a674b6931mr3485362a91.0.1779455098673;
        Fri, 22 May 2026 06:04:58 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c98b95sm2069980a91.16.2026.05.22.06.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:04:58 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v5 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Fri, 22 May 2026 18:34:39 +0530
Message-Id: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMCBTYWx0ZWRfX1U/P7vugS4+S
 AnL3il2joe0oGrgs9DbeFxYp4XLFxy/Kg/cAPF+YzcS29EhkevF6u6UXM3S10dww22Tf8P18hxQ
 xRcck2Svv87eWu9r/736SYFkJXeOg/XPZMqfUFAf0KGeOlliJalbql3VhHalZxLiawI50XfE75v
 satHFGocWf6KOvJBAkjo+apjGuFFzduLuxNPaBSU1YiZJ91JqoHnBCRfOkcGaV9vMPaqZ+kdyFV
 j/y0nXZxXTa47TMhd07mxhlQx8m3pVHToz1SSjsf7wBhGnMdL/hIr8dhT4zLYxDpjkEP2QDgDiH
 1Cl2m0ZPq1ir8rwmh4klY2RcjbBVLznCQZV/NiYMXJQFiqsknWaEjnnwwGOT5StcjeiPlP5JcoR
 ie85nPf0JPPip58osge8P2EZgKOmqO9lFRy4A0mWf4NN90XDrNA907TyXwMmobaw0fkv68iT8xA
 14VqTTiMKoAf3VojOOA==
X-Proofpoint-GUID: Vn6WB2vsAniYj4UeyXw0VukkZb9VVvXG
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a10547c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=usA1xA7VnIIfQHlxnAQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Vn6WB2vsAniYj4UeyXw0VukkZb9VVvXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220130
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109316-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5AE465B5006
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
v4: https://lore.kernel.org/r/20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com
Link: https://lore.kernel.org/r/20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com

Changes since v4:
- Added `depends on PM` to `SND_SOC_LPASS_WSA_MACRO` and
  `SND_SOC_LPASS_VA_MACRO` so PM clock helpers are available when these
  drivers are built
- Moved `sret` declaration in WSA/VA runtime_resume() from nested
  error-path blocks to top-level `int ret, sret;` declarations for
  kernel coding style compliance (no functional change)
- In WSA/VA probe error-unwind (`err_rpm_put`), check
  `pm_runtime_put_sync_suspend()` return values and emit `dev_warn()`
  on failure so runtime-PM unwind failures are visible

v3: https://lore.kernel.org/r/20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com

Changes since v3:
- In WSA/VA runtime_resume() regcache_sync() failure unwind, capture
  pm_clk_suspend() failures and emit dev_err() to make clock/cache
  rollback failures observable

- In WSA/VA runtime_resume(), mark regcache dirty when pm_clk_resume()
  fails so a later resume attempt forces a full regcache_sync() even if
  no prior runtime_suspend() has run

- Added `depends on PM` to `SND_SOC_LPASS_WSA_MACRO` and
  `SND_SOC_LPASS_VA_MACRO` because these drivers now require PM clock
  helpers and must not build with `!PM_CLK` stubs

- Converted runtime-PM enablement to devm_pm_runtime_enable() in both
  PM-clock conversion patches; probe error unwind now uses
  pm_runtime_put_sync_suspend(), with runtime-PM disable handled by devm

- In WSA/VA runtime_suspend callbacks, moved regcache_mark_dirty() after
  successful pm_clk_suspend() and restored regcache_cache_only(false) on
  pm_clk_suspend() failures to avoid leaving dirty/cache-only state set
  when clocks are not suspended

- In va fsgen_gate_enable() error unwind, replaced
  pm_runtime_put_noidle() with pm_runtime_put_autosuspend() and added
  dev_warn() logging for put failures so failed-enable paths can
  autosuspend and drop PM-clock votes


Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/Kconfig           |   2 ++
 sound/soc/codecs/lpass-va-macro.c  | 133 +++++++++++++++++----------------
 sound/soc/codecs/lpass-wsa-macro.c | 121 +++++++++++-----------------
 3 files changed, 119 insertions(+), 137 deletions(-)

-- 
2.34.1

