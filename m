Return-Path: <linux-arm-msm+bounces-115774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0QQ4Jl1gRWqE/AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 20:45:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BCA6F0AF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 20:45:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=egMDaHX1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PonbPZta;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115774-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115774-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 709523021E5C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 18:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45604386541;
	Wed,  1 Jul 2026 18:45:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAB6257824
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 18:45:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782931544; cv=none; b=Q5nKZQP5mS+iY3JXh2dRALhi4Ba870M2d2nET9zYfTzWa3/vVlXvsPb3/yBX0d3fjVmRar4wpgO120BtILYx1c+w7omqH9jKq40YeFZmXnoknYErL9KNADqRxCb882Pimcpc2kfBSL5mvQZiVp19tn7VOBvUlY5DwLjzeCasQ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782931544; c=relaxed/simple;
	bh=Wy3bGWEtEMsWIZDlPAvvQW/doKeTMQ33v50YEDsYwbg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TrndO/Fm02XrtVR5Bg5yfjQzjmp3y7as76jL/vtJaAcmGXemMe695i0JmbpH24WBbn71qgRU1HIwzSwxr95nY9T2M3qsnaQ1MAjpjFmneZ0FN9ula88oGBzQDz8tFljEtQ+D9E0J/jME/e1HyOfQclcVtIs3q6uePKH3Gv4b1IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egMDaHX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PonbPZta; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661HQ5oC1776935
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 18:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=diL7rhATDYnTzGQ/+UzJRf
	spvBHaQBuSaUwqFLsKjew=; b=egMDaHX1EGlV+J43M9yzs0AayDxMYAHuTUTwpd
	SVKW/taT2rFiCw7q01TeQ4MsyDbpqjxxLjXMEIjEgc4AQLtMaOwZ0rd/OslVAHKn
	TB2Eppl3JObT3zPbIb4+cqj3IuPEICZHQVQiVx/BmUMu12cKPES9UDI5LO5LGPCx
	SKKDjeII2dhj8S8T0LW3yCMz7NPAF4zGOhkKUcA1lbdEU35IGwleWE6yjpBkQNGc
	VyypP+jpBCKEE3Nyw9tV1Ez2zmBFNaGqjmM9pPcg2KRHr6sWTslj+1P1ZVz+3qbH
	Sg9VcrOrG7elafUL5RiioIXHV7AR5BHfi2tridd9DiqwN0Jg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rrb8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 18:45:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso857001a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782931540; x=1783536340; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=diL7rhATDYnTzGQ/+UzJRfspvBHaQBuSaUwqFLsKjew=;
        b=PonbPZtaWQ0EaZUOli50a2DXXDBCWWQR+YWf3GslIIQRmDubkrdTFORE6eVl1IrgyF
         nCIsZO4Z+d3jXmOAAdZYUiPh0XW/I8hGI4McPojKXINICDfYCAvCYR3z8exyGK61vhEj
         6LNa0970X0/w3NWaLGLcfw2qx4BxHRJ8QV22tYsuk4yzkPB+mQa4hbYEqp/vHJJqETNh
         8xJQLqA972p3jxq9EUeyd29VkWnhRLUPS7z3UQDcEdASrPrDXuGZOxIAs6XKFpV+OQ3Q
         YXaSy1QyuDSrD3/20NezeRNhDQc+MbnKtGJpBvBKWdNEKhIJcnBWUA4W2U/H2yuzReDW
         ngzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782931540; x=1783536340;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diL7rhATDYnTzGQ/+UzJRfspvBHaQBuSaUwqFLsKjew=;
        b=Jy0LBY1h6xGzbhY4Nt4EEkBqZ6bTW2hLNVsjNcgeV5y6ELp7PnA3TO18YRElz3LP1D
         vYSFpvkAUSXKFb3q8Ai4EmKIIgzABcZ7oxxpFgd2PRNn4mmV1cwDArgpvCXosthm7+/U
         fnFlqKfZsEy3uL2OCtXL3s3zy4ytmFghfMY8loSZuKhzSywwegs3czpS7KnPOAIsTG9X
         sYxSoKaJkhgAvcN7kSA3Q+KOYpE36RnwjedGnOTz0mSgWgXy9XvpscvaCLpnRZW5S0Qw
         v/3pvCMpX1eLv5Ye1IB+LZUs7XnS2Q4tDNRtPeMP9rdFlgoi0YxfM2LK5Dbu8iRrjuRF
         NQbg==
X-Forwarded-Encrypted: i=1; AHgh+Rol1rlv3fZ4cQfGz4iZWxTysJPHzg5/qnOIxewI+jG4kFt8hnl6oxReM8UJblXLZctkq8Na33Gyr/dp5YM+@vger.kernel.org
X-Gm-Message-State: AOJu0YzfRV5RkEc8XpmJBQ9GW2X+81ymBSLZmDI6MRiuqyVoliUsujGA
	XVr7TVmZnJU0Qe//JQvcOunn/K6DboA2VzgWiUNzJU3k3et5rVRp0uxnhJpYrXHdenSMtHC+R8B
	kPtzesA/Si9SOn+/lq0Z4OdOWHa44oqyuuG0NdfHVHvX+LX4IJr0bekkKwisViQS/kZa8
X-Gm-Gg: AfdE7cmhqAfDzQSqPNzhpiJGWE71cvlKUIkkwsIsBIqdvSt9nfflJ+mUY5Hx10hBAPC
	SJrQcBD/hvQ0BpCeTqEsWdDqwu/kvQEMoHXrht3MlHBTIkPS4xfm2RiIoL8ufnLD9QXGP/A2LCI
	7K0OZ2yMwznpfMKWkyyaNwPxqS6wf1T7LXaoMHOzf3F+dMBXRonBd0jfAAuK/h+acshaRD2ii4P
	q6eE1RMgJUvksX/ayCISPveFcPilFi5jG0GvxFY3jqR5GfskKtOcubKK3nGipoGff4MPi8f+66f
	c537pL4emszBxDcXPhlKlIzI9ivP3LYn6d2HCqe+UgWiPEnNHK6XSjtq+Uz0C4Iy7ja1sCDkiBP
	QrRBpBPSnM5npiEdfeiFLhOH7LGCtqz1zoJaZaR0=
X-Received: by 2002:a17:90b:4d84:b0:37f:9cdf:f039 with SMTP id 98e67ed59e1d1-380baaafc65mr1779074a91.28.1782931540130;
        Wed, 01 Jul 2026 11:45:40 -0700 (PDT)
X-Received: by 2002:a17:90b:4d84:b0:37f:9cdf:f039 with SMTP id 98e67ed59e1d1-380baaafc65mr1779042a91.28.1782931539549;
        Wed, 01 Jul 2026 11:45:39 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097dba406sm1023489a91.2.2026.07.01.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 11:45:38 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v8 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock
 framework
Date: Thu, 02 Jul 2026 00:14:56 +0530
Message-Id: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChgRWoC/22NQQ6CMBREr0K69hNsKwVX3sOwKO1HaoRqPxAM4
 e4WjDs3k7xk5s3CCINDYudkYQEnR873EYpDwkyr+xuCs5EZz3ie5VzA7IEsGG/RwKSgllCovLR
 aaHnUlsXdM2Dj5t15rb5MY31HM2yirdE6Gnx476eT2no/f/nHHzODphbKoDwpI/nFE6WvUT+M7
 7o0BqvWdf0AMzMqT8sAAAA=
X-Change-ID: 20260623-xo-sd-codec-v7-b4-8769da3a41ad
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfX2v/EXaf0etQF
 Fy/daL1dSCzjrEjTxk0DcQdy2s2AmhwUyO7g2329guWp6xS9iOjtseUu3gxfNBSIKMBHSVa4B03
 nF12ifBPIvhEm3iTUZiJpClRAoX2I5ewtsdCeFdjPzTAKCSEjAwXUK0ls9KB10qFqq3qRfASFuD
 2WXDG2yGxMmC0ZDxYyERUSYmQCbHFE05BB1fYAtuM4y8QxeSOi5Kc7KGkadx+j/7okXZCpIBhYB
 r5LoaiIZVPIAWF0HkDwJehLiJDur+OdoI1jOsGXuX06e48KoKeYH/HmcPyb7JWg7A6Zk2RrCkHT
 05abAEhRQ1mUf++5/S6RrkP9UHaSbpD7K6lEi8LfjrJQOuh/8iJb7pSDNltcYqd2KR5cTYMGRx7
 dBmrqa3puPjgfQwtui/aQlE22T3+7qm49CNbQyUep4Rd9p2vvR71h8gCTG4r7WzjbzKz3/K2SkR
 Dfncm+ai+oLRu+DNaVg==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a456055 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=RprURHu2vK4Ir6F4JdUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: uprxBHo9NkFJh1kVpAMj7ELcl5PE2dt_
X-Proofpoint-ORIG-GUID: uprxBHo9NkFJh1kVpAMj7ELcl5PE2dt_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfXzcKwmjlnwHht
 4G1xFNqcC84cVwZE0v1g/Q1xF5PM6rMzedxFKMfiGnYbVzj+PuxkfcHIlBYr6x+ruJ3bpwjfKoD
 OGz0Wv1qDgiM7KnIJR7HAN13KbgE/+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115774-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: E1BCA6F0AF2

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

Changes since v7:
  - Dropped va_macro_setup_pm_clocks() helper in the VA patch and inlined
    devm_pm_clk_create() + of_pm_clk_add_clks() directly in probe, matching
    the WSA pattern for consistency.

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
Changes in v8:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v7: https://patch.msgid.link/20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com

---
Ajay Kumar Nandam (3):
      ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output

 sound/soc/codecs/Kconfig           |   2 +
 sound/soc/codecs/lpass-va-macro.c  | 129 ++++++++++++++++++-----------------
 sound/soc/codecs/lpass-wsa-macro.c | 133 +++++++++++++++----------------------
 3 files changed, 122 insertions(+), 142 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260623-xo-sd-codec-v7-b4-8769da3a41ad

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>


