Return-Path: <linux-arm-msm+bounces-101080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMoJNZ3iy2n0MAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:05:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A825736B596
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3CE1303602D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1948B3F6610;
	Tue, 31 Mar 2026 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTzWHCJA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TP76M/ic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F982395260
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969296; cv=none; b=pfmlYxRv/CTY87Di6TNzqXRTvslaait621Hs9l4fmOFVzWneE8IoK9MmpI484jBQV6kz4Fz9B0aet2RyWCEVd61TkdyKAmkWR/8w5ncIKIbD0K2Dzoxsd3yUjV5nnntpBjslGwu1z/hirTKyMco4Lp1XO5hX+48RkXd8kL35/tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969296; c=relaxed/simple;
	bh=PlaYA7y1JMu2F/o4KAogbQ82mxmDcO9REeDJEqBJ60o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bN1y6WdRcWKyPHU4tSbxLIok9vjL9B3FeH2Tli8kMNjCm2hXvBYfynjdixlqyu1n6t96mXzm3vHGFfOesbn/6uDrbgW7QKbnhXhI16pnvcfqd5DKobPNmTEq4GMfO7eoYS2M+MPkQciGD5l9XJFFXAMB3ExVjsmjXn2HGE/yaE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTzWHCJA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TP76M/ic; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBjqAZ2407882
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 15:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YaIebiXxL5AXXySdpawh0R
	o3xuctHFlJdv+NGpCFUpI=; b=YTzWHCJAfTNNaqEXqR7chz+A+GJtypT9WXG95z
	XvmS5jRCbHLgnNiG8kLTZKya3EUE+Fn2Hg8A3hqbteQQvy4TzDnEvDdPF7LrMLB7
	v/ZDS4rQca+PVCY1vQRe0fVeZQfLG9t4Hn8NSTMyKEHtXZp4rZpYHBtPL9u8mV9/
	mV0LoNZ6z33I8DX+Re+u32BqupaD5r1ZwMJPRXbzps2ZpzUn4moATxZ4A8AvUxtT
	RMLisNWyVNK6ndLbEPHZliFX7Smvl4oym1X2pIGgt4IjkbkZYDQJ3sMvCAXpGC7q
	m7CL6aBAcn53X/Nl8U45i66aTsvam+rZts7lPgKMFiXQKKLA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80heut2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 15:01:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c741f038f7cso3944358a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774969292; x=1775574092; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YaIebiXxL5AXXySdpawh0Ro3xuctHFlJdv+NGpCFUpI=;
        b=TP76M/ic0bsiG6j4+IcCODbWXlF8+HL49cIyDAi+znhpdA6UIkin6clTAgAvRA7gZf
         3n1xhYMkSQgzImBOTuNrhWQCDRnI5uw5LWCZUACVrdD/df8hqtAY8h4FX1JvTpphDbWd
         LwKu3t6Zb3dm+zkITTRUI2zpRbYimRNvjQfwkeCO8z2lL86SS6at/uaqFnUiDI7d/bun
         3E6hjo9FRc9u935q5J/5WQdHS5Eddc8RzAkmK1xvUbpS0PONcozaPWi9v4gIfucSINyW
         8rM+evTsd4n/m0gL9gBukMFBBOJgxNDv1Z0y0SmLlDVdMQDPDOwvhAO00TK3hu8pESx8
         J+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774969292; x=1775574092;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaIebiXxL5AXXySdpawh0Ro3xuctHFlJdv+NGpCFUpI=;
        b=ZPTwS4wpCpFRO25+BpfR4SJBZRxkWLrCH/xcXggXpv2KB0v3RG29gZqMp6qd1l0D4z
         q5DbFGRCQa/AChWmwYv9ZMT38aO4s0BCvf8k2XXLfbPNQTY1B4dXd4ae1Bbi4ZdyhIq1
         /KqcynUadzMrVCXyt18A6zfEue3ZS4Dq8xfDecjULNHjjpnYoM7IVhIXys1TnChHdTik
         1F1jN40o+fJrapKZDES/6mxm2Lm7xWMO1Q2QPC63Z5zibu25fb1MascYsN0515yO/nGF
         doejwujjLDZoh421KIVnEu3RFa/ewYwaMdE2mylX0uDabGkSfvSBesQvMsdINtspxi8r
         tatQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1lEeBHfe+p+HNGayOOlFRw3xmkTNkGuZqLyxdkMtLubUs7DH7aHTz6Nrl0QJGtU2f/oYioFzQ8TMyXSgx@vger.kernel.org
X-Gm-Message-State: AOJu0YzTV3j2bDJ3XS42NEZLLsPNpbdt5E2+kg52SC/vJqDNAlVaPZAS
	Ic8E9Sz7mX8bZmBGdHtKn497kmBhyMEHIvpzO+cn+9txnnSIjOeeO9C6xxx6F5N7PlQfa1Y/5oO
	Zy6aZ4m6MCf3OSDMcFIuDK/0Vr7gwnRkOQqZdQAqWzN/nORVg8tU3mDy3QSYdbO73uJOO
X-Gm-Gg: ATEYQzzrk7jsMulqIWvO0GZsKQuDiog0LPvrRat9XNUP1wm4BcyvYjiAhXuvhnbto8P
	i78qq01u1d2BORh+emers02tKT+7bc370o47dI94KH8ySeZzDyc/5QwwaYkn8TGrIrZStwMCXRl
	z2ZjCfXV6oDY3h1N1AzZ2+51RFmjNVolsWq3N/TrmUZ38qn2DQqrL67tMEGFhjvWpMwMRkZtpYH
	2nMphOFFgHTzatJLOjmM7i6Q4jAh0TMnZB7N2lAym22OcVxsUUD1zW/fUtITUNZ4xTw6S+Xo66a
	8qFj1uwH1yKwRs86rURFh9g0x9OTpmoIdfe5+OglBQG5IDTh0Icx75fP7N7GZagwbPtkKWOJj83
	M27z5+Goz1nzIHwqN2oSxTWlBPdnK+2rZtIoECrhpx6EiXEPhQSG0W5M=
X-Received: by 2002:a05:6a00:1c84:b0:82c:e76b:c68c with SMTP id d2e1a72fcca58-82ce86e2e62mr19746b3a.0.1774969292362;
        Tue, 31 Mar 2026 08:01:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c84:b0:82c:e76b:c68c with SMTP id d2e1a72fcca58-82ce86e2e62mr19680b3a.0.1774969291605;
        Tue, 31 Mar 2026 08:01:31 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8465746sm11517231b3a.21.2026.03.31.08.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:01:31 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 20:31:24 +0530
Subject: [PATCH v5] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-update_fps_calculation-v5-1-af91b1a5fa58@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMThy2kC/43Qy2rDMBAF0F8xWldBj5HkZNX/KCXoMWoESexYt
 mkJ/vdOnU0WNe1m4A6aw0V3VnEoWNmhubMB51JLd6VgXhoWT/76gbwkykwJZYUWwKc++RGPua/
 H6M9xOvuRTvi+RXTZGeGCZHTcD5jL5wq/vT/ygLeJ/PGxZMFX5LG7XMp4aLIRBveuTdILAOVTC
 Amh9Zh0G0ULKaG3ySL7sU6ljt3wtXae5Yr9VW+WXHJA9FE77Y2A167W3W2iJ9RgR2OVZ/WsmU1
 NkYY6mBhjkArshqafNLWtadKCwmgNZIeQNjT4nwakSe0U/ZuwJudftGVZvgGGzDWD+QEAAA==
X-Change-ID: 20260304-update_fps_calculation-98ee7f7507b1
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774969288; l=5758;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=PlaYA7y1JMu2F/o4KAogbQ82mxmDcO9REeDJEqBJ60o=;
 b=NtV1uRi6hohbLxNtBSv0q0vZj4iz/hZmDOHHKFysNPMWXJf2xF8G/KwW/qk1Y51Dpg+RvjPvA
 dDoi+0DgfvXBL37BdpJ+TKbqpCFAgk/V7XXBNb5v4LDS+q7CNXV32v1
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cbe1cd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WnfXBAunr1jJH0gWUAIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: yVBPWHG4-TSgPlW5GhlSl-img8y9q9In
X-Proofpoint-ORIG-GUID: yVBPWHG4-TSgPlW5GhlSl-img8y9q9In
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0NiBTYWx0ZWRfX4TER7Bcu0W95
 jD70E9kmnzLR0HetwE1yXg0qtrCXB+pMjPFtt4CPZXQyOTmMrVDtx8DJBMbOy1BwtdltospHKmn
 qNnIbe90I+L+wmN9NJWolSqmhc+jI+iYGfcixxwOWMZVbwKnJMxmbhuoz85PeDcONfTzeyuNTVC
 RXvdp9xpM6PSOvvfSrBkF488WRQN9NohEkbus40zuARMvPad9ByjnOC05TVYlOh9fLfH4UbH+y8
 +zmNqzWJwuWtsVr4yngsdnYb+SxygTC1ERkkx2/yWx0p6HLvn0N17qO+TVPH++ltg8glNSr0iC6
 vPzlJMnFphpvaVljiOxoANX8OUuUuYKb4dmDcXibx3JmInFKypavupayc51FAXGp11aW46JVH4s
 chU6oA2rL1Xv2x9dEALvt4wgAlb/h/wMKLgjeCqFYFvy1yOX0vSK35iqX+mobD4KPrEWr8mWLSw
 Cxl+NX/VgDREE6uwvhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310146
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101080-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A825736B596
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver was using a fixed default FPS value when calculating the VPU
frequency. This caused wrong frequency requests for high‑frame‑rate
streams, for example 4K at 240 FPS. Because of this, the hardware was
running at a lower frequency than needed.

Add the FPS measurement based on the decoder input buffer arrival rate.
The measured FPS is stored per instance and used in frequency calculation
instead of the fixed default FPS. The value is clamped so that it does
not exceed platform limits. Add a VPP firmware overhead when running in
STAGE_2.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v5:
- Added description for defined members in struct iris_inst (Bryan O'Donoghue)
- Link to v4: https://lore.kernel.org/r/20260325-update_fps_calculation-v4-1-13728c0065ff@oss.qualcomm.com

Changes in v4:
- Renamed the variable names (Vikash Garodia)
- Updated the fps calculation logic (Vikash Garodia)
- Link to v3: https://lore.kernel.org/r/20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com

Changes in v3:
- Updated the frame_count condition check (Vikash Garodia)
- Link to v2: https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com

Changes in v2:
- Replaced div_u64 with mult_frac (Konrad Dybcio)
- Link to v1: https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 20 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..63dd889c9992 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -67,6 +67,8 @@ struct iris_fmt {
  * @metadata_idx: index for metadata buffer
  * @codec: codec type
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
+ * @last_buf_ns: start time of received input buffer for current one second FPS window
+ * @frame_counter: input buffer counter for current one second FPS window
  * @frame_rate: frame rate of current instance
  * @operating_rate: operating rate of current instance
  * @hfi_rc_type: rate control type
@@ -109,6 +111,8 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	u64				last_buf_ns;
+	u32				frame_counter;
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..7fb45df37db6 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -54,6 +54,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+	inst->frame_rate = MAXIMUM_FPS;
 
 	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
 	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
@@ -369,6 +370,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->frame_counter = 0;
+
 	return iris_process_streamon_input(inst);
 }
 
@@ -411,6 +414,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 {
 	struct iris_buffer *buf = to_iris_buffer(vbuf);
 	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
+	u64 cur_buf_ns, delta_ns;
 	struct vb2_queue *q;
 	int ret;
 
@@ -427,6 +431,22 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 		return 0;
 	}
 
+	if (buf->type == BUF_INPUT) {
+		cur_buf_ns = ktime_get_ns();
+
+		if (!inst->frame_counter)
+			inst->last_buf_ns = cur_buf_ns;
+
+		inst->frame_counter++;
+		delta_ns = cur_buf_ns - inst->last_buf_ns;
+
+		if (delta_ns >= NSEC_PER_SEC) {
+			inst->frame_rate = clamp_t(u32, inst->frame_counter, DEFAULT_FPS,
+						   MAXIMUM_FPS);
+			inst->frame_counter = 0;
+		}
+	}
+
 	iris_scale_power(inst);
 
 	return iris_queue_buffer(inst, buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..d621ccffa868 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	u32 height, width, mbs_per_second, mbpf;
 	u64 fw_cycles, fw_vpp_cycles;
 	u64 vsp_cycles, vpp_cycles;
-	u32 fps = DEFAULT_FPS;
+	u32 fps = inst->frame_rate;
 
 	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
 	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
@@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	if (inst->fw_caps[PIPE].value > 1)
 		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
 
+	/* 1.05 is VPP FW overhead */
+	if (inst->fw_caps[STAGE].value == STAGE_2)
+		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
+
 	vsp_cycles = fps * data_size * 8;
 	vsp_cycles = div_u64(vsp_cycles, 2);
 	/* VSP FW overhead 1.05 */

---
base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
change-id: 20260304-update_fps_calculation-98ee7f7507b1

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


