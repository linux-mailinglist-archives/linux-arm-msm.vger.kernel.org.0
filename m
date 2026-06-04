Return-Path: <linux-arm-msm+bounces-111204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 445pHDJ1IWoSGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:53:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D16A664011E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:53:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QtjFN2z3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jyg+mDtg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111204-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111204-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80FE3306B765
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C089A47A0B2;
	Thu,  4 Jun 2026 12:48:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434DF46AF0E
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:48:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577323; cv=none; b=WYkXEXqzOz4B5bPAWwpS3+g4lY2T088hmoeZ+1hUR3slUVWl0/Nqy/7A1kfX4CeCClDG8nNOOBHcehSIyrKUCl9t8VIYKFKjIa0wLooT/o3es3mf6j+5Wi0rFCvGHJt9hPmP6q28bGUAda50AzOYhVHv93OMxOEqb7vwJcTx4oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577323; c=relaxed/simple;
	bh=vo6xveCTcHb9cNQ3BQYzxEVs0uKejx18eF6seucc+ZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FrlQPy9ToD5ULtYclR3rJ9tnr9V3sSpkhtSSmcgXY7h+z8VNRDMgOIFBVbHMeN9nxtWz8g7Jdt8j1XWMRjFUqkfzlNXW1mKWnrcbAHyVS2+ijhqjZD5H+BCvd6qaVEHgoWiDtvKGayFD4fNuWAg4slyAuP272msOgAHvvQfF29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtjFN2z3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jyg+mDtg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548KleI140445
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9
	jekdVq8k=; b=QtjFN2z3QBhXzX8H7V8vV4PDXPH5D4lgXMpEoJ8/t41vHmPcdYc
	0mkHVtFzSQxRPSx7Ipb2NVU88Y8HMLT7uMQlqMHW5dXDrplOgj/9fqXR1G5gJB9b
	6CHZoM4gS/s4dLvRAxmm24XDwDuRAan1vcEHx9uy8n/bhRogm2XbJB0nWEuqXbJO
	rnHb+yKcieohQ7lQPofZrh8zhEQAQPAPimekPQ0eKVl183sZ0qlUq6aK0gHifGwh
	6PzZwB+RA6sf10j5dOsQPWyBYSbYVjfkNDchsODEFkSl28iGCQmZBMhsgTqtsqn/
	Xb789wGFW5d6XjSLjKIcZB84O1plxmiJ6Jw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyenacwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:48:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c858e0cbca3so368348a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577320; x=1781182120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9jekdVq8k=;
        b=Jyg+mDtgSAOxphZTZvFU5afD5thhFT/HIBSVfIGMRAtSfu7xZMO10cPmxmqunhgw7R
         DGZpmVBB8Ow538bReb71P4KiM9vxp9bdwhH9UERDtAWhSR4jRq5rwKrMbRq+EjMe3tFE
         wI7xQCJ5VZr5gaxS0i4sMTw4NwZoLeLAqSOuqzRfETAZ3FGvF+DUed/5CLJkNXUArAZi
         P6vEEqyJNVwd65aNc9HO1cskvmqFuRRGWJ2wLRs167BIHz7/TDrL1EL8qlVTQkoVCR3Z
         YksC2IFAT3rG5TKAo02g6Mszn+btx23AiGUN7HvIb0KaGfUjndPqiF2o7sVA8WkQ7hot
         UdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577320; x=1781182120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9jekdVq8k=;
        b=sifSwfvCebVNUoFT9G3zO1eGFfsIvP5FDT81VB8p5gXhDpnxXVMDaJGArBbes1uI0f
         W/7IDlwgVFQLe5ziyYFYoLp3A7RS5ZfkrOkiArrEro6erZkIN/i7Zzy5U+Zx+BP0iPmU
         CHyYyP5r2hfc6/q0qo6o6ajwD5nYrQDWdZbi/VSvnMJCnErGP0aYKXOk+TL2ik0p82Rg
         Hx9ohy2A+oWD8NLpca9uQ7zZPC16Qf9FJbDz93MYLa1CKuLfeb42sXjRnVWxUGBe5uPn
         IUI1bNBYBuLKBEi6acK6A6R02n6R/rXfD2oHiRb4MlXc+mOAczqpTAAB+tTZjvZxIl0J
         7Krg==
X-Forwarded-Encrypted: i=1; AFNElJ/x5AVRmIBI79HwDllqjz3ZU10bc2CrwCHIAWjkzbK9Zih43sHjiweuhqpljeM2Cpusq6zHFtKVp6ZPOd8I@vger.kernel.org
X-Gm-Message-State: AOJu0YwCbg4HTD6d0WJQ+bFn5dnY5fqr/WvehXz9iyFpWrVF7FU4T+/8
	zvfjSs/0bLz9Fv9vj6ORNu9EaM5KzSisu7NVaJ7s4NZd2tLW8E03oYfRwr1EE/qxFX7qJnjA4g2
	PkirI/mufF97OMhL5rKheu6liMhqS+8ManIe7VWM+0GjA2zStFe8996RevAFqM9Jm9EOi
X-Gm-Gg: Acq92OE3Re6/KbUmoDji2H07DoC+W4KEjLsLbwYwCPhZ5jxGlyqQMELLC+2Kp0Vvx+r
	uJByvh5nsTtSAxGpF1svqLQuQ/7Rnbc01cWGFHN6scmQt2qsCz8dTMlA3ROFKjKwRYBAqyZBbJW
	rlnfE6twJ7sHkuSbqPklK0IpwyxBVj2dPAyY4bD7hTGhtorSSfAmn6cBJXZQ5iju1ZSqwCNWRE6
	NFVlXOdPT2WZb5My5y88/3J5tD3uGOR3p9k2SR133EKZ9MOUhfRsDdLguMvpU32Ufj/9DdsC4Gu
	MXQeeN5RtqKFJdZuAXRGA09isStgJM0B6DN9Ncy+RSJhvTpH7H7AlZkC6AjG4OnwQDq/+3b+//k
	mS6TeoSpDaAQO7+cAfwe7u/1F+Yc1GICgpWmZNQLjpxAFFLYLTzEpIY8r5LTl
X-Received: by 2002:a05:6a21:600e:b0:3b4:7163:a7e8 with SMTP id adf61e73a8af0-3b49732f26dmr8783432637.10.1780577320226;
        Thu, 04 Jun 2026 05:48:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:600e:b0:3b4:7163:a7e8 with SMTP id adf61e73a8af0-3b49732f26dmr8783405637.10.1780577319761;
        Thu, 04 Jun 2026 05:48:39 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm4911811a12.9.2026.06.04.05.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:48:39 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v6 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Thu,  4 Jun 2026 18:18:20 +0530
Message-Id: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a217429 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=JpAD5C703kRQSb3sVZkA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: _RLdXdKS7L3wjVqIiNRWnQl2E-ITXe6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX7ohDKXFW6Vuk
 23VNa7VjCOtRVgbxivWIy0NhDPns3p1UXgS1U35ZyYy1XL7yhhPJBcdp/Znt7Qv84yQ387OL/5/
 iJlYSe8oekuGNIU4+wRaegqjx7gMcklyclXHrLEye8RVkt0CZmlQo1UfrwwKFy12/2EskefcDha
 cy+usOXfPx3sZbO3Exu8F3kx2xxU3PM1u4u1/3Eg+q3Q1j/mJ+lRuYbV8auzM4XHrdqhbLy737f
 X19YzfDbaMpLisPzvgfU9vPTaWS2R7C21DLbzIpLMl+2scLq/YJI4cn0BmHRsJYSAUvR5AcDw7N
 gb1Ui4AgGMXHr82CK18/s/hWOAdSJfbUBqXqnl5EeLJlKZry5ZbJGDbulpIZfecqI8lpCyyFW6+
 UhHKphZhnV2gr3Ip0C6YNGutHekOLt9jYSP6a8/K68vgw/NYqYoU/0+U5p6peJ7jbojc/Sczf41
 W+4fTqk5WJjGOh8iz8Q==
X-Proofpoint-GUID: _RLdXdKS7L3wjVqIiNRWnQl2E-ITXe6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040124
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-111204-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D16A664011E

Hi,

This series converts LPASS WSA and VA macro codec drivers to the PM clock
framework for runtime PM clock handling, and keeps WSA MCLK-output clock
registration resource-managed.

Changes since v5:
- Rebased to current linux-next/master and regenerated as a standalone
  series that applies cleanly.
- Added `depends on PM_CLK` for `SND_SOC_LPASS_WSA_MACRO` and
  `SND_SOC_LPASS_VA_MACRO` since PM clock APIs are used.
- Improved runtime-PM probe/resume unwind handling in WSA/VA error paths.
- Kept runtime autosuspend delay at 100 ms in both PM-clock conversion
  patches.

Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/Kconfig           |   2 +
 sound/soc/codecs/lpass-va-macro.c  | 142 ++++++++++++++++-------------
 sound/soc/codecs/lpass-wsa-macro.c | 128 +++++++++++---------------
 3 files changed, 134 insertions(+), 138 deletions(-)

-- 
2.34.1

