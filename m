Return-Path: <linux-arm-msm+bounces-92741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBtMKyC/jmmzEQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:05:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B1A133263
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E1A8303AE62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 06:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A030027702D;
	Fri, 13 Feb 2026 06:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hRjZwBug";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCqHyYUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA3E264638
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770962705; cv=none; b=Nyozta3ZU8/Qg9UaCrH9OuRXicZuNfRYN2BgMMHZkJ4MMxMZ+TQtX3+KE9wYZdat9fK7KWs2TjpfEfGmAkGP7tGXU2HDP8b+HY8LM6e7zJ+uWcYq/ELoG2QSh7ngb7DQJZ7NBP+YSGbrXVFL2HE3AsXO48wCk6hbnxUoaxO8HI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770962705; c=relaxed/simple;
	bh=/pPAVN19I+kSbAJQbNMJlUn1ZCjEj0PufiLWfMayerY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g4FGNNJB5I3y7F89VdSiG7Ech3FWhw2+sCrmLGtFES4l4C6QaY2bfEWS0kn9O+BYuySVVgmvnxTCM+wmgPrUjYaSU9mnL7YuZsghIVN1GbwohXNfw4sFksnprA2DACeNzOc0KEwAgNWg1VXPmtSxo/be3uDHMxoggusxfEnf54Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRjZwBug; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCqHyYUt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CKRCsj421513
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9TgdFreKgmH8AIWaUnTjY7kGZXik7SmdTvwCYOSWci8=; b=hRjZwBugzX1DG/sh
	g24O40THFNT9qG6fvZ0Rj5gx3YAY+q/ghTnM+oGsgH1Zujl6fhFz3XO6We7Nnmm7
	7abs29TIqop8VLnTlYISb/lyRZgyDDXJobIbPN+STjDsNYrksFYv86on+vUCjj5x
	SU65/2NCDgjuJaAUslW1Iexglx8Qr09HoaOQPAHUsqMT3iRgmK4VtEghqyKylv6R
	gQqqCHQfjz4SHj8/BTUh427k1/+C0OoNnkiz5cQPjBvqOvau8qe1OPZHh2S+GE4o
	XM+Iz3XC4dSzK4Lnad414HlPy9OJzXDPZXUEop+ETzQr0FtF8JcqG6VuRAp0jben
	xE/Z8A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9cy4bsxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:05:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6de06e6c08so415951a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 22:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770962701; x=1771567501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TgdFreKgmH8AIWaUnTjY7kGZXik7SmdTvwCYOSWci8=;
        b=ZCqHyYUtweo7j5aclSlNDCohcoEtbdsLc/iysQkJt2elaUCw9FkYndfGvDHVCF3hSt
         fzcn8lXhlI6ieuCE5TOL4s/lZWwOiSBozQEnn+Hhvl6nehIBGZsa5Ypz1vIfXTuaamcv
         24w3sjQnuujhxdhKhaPYTaCN5ypONRqkY1hk94iPbdmErDweAh+27cKv1OwFfAqNa1DD
         v3kG3q62mmpOWEdLRGwyE7APXi2ovonm/6A4j0jDZnbNQ+iJCU8QU8LVrOkG51um5xpB
         SyqepaTD31Qcb0yICcydpwmr1RS8bCIBBYZWnsP7Q0mv2MxyBydd5AAB5/dCYHhgO51W
         5MQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770962701; x=1771567501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9TgdFreKgmH8AIWaUnTjY7kGZXik7SmdTvwCYOSWci8=;
        b=OXpELqwuNSj+oTr0rvtw3es5fSI73NuBEds0Br0K2gRmTR6Dw+mbUuWL8GosaAsbWq
         03jLvTB0eBLWSXlQ45SLvmfjDjQjTt5uSpi+9mq1D7yzfpCRQx6qL85uK5K7FnQT1+eH
         oVpWERcwm8qfezc1XvdK5fT8eEuK2NlVe80HWiwwZRNOLPV6Z0fdRNNIlhBGxgAVgOWz
         p0Obn+saS8i3ynprC9ndVRZmqNs4Mie5+Q50Qu4jrATw2F8Ru92kk2GyxNG2rlNqG8RU
         MXLJ3iaQaMqy48BRs4GkJHX2FCeSC9tx6YkKeWqZ1zI3B6Z3+Sleq1OuAKqUdCs/BElN
         6q1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkESXA+jCqcqSCSIN+yJ8f6oExFdvMQlmYrhIgn1YnVnSJ4W2pS6Q7AVMjIqGhNeD2I49H2XixTGVLCWUu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Ufpx7tStyMtYp41mCmbhb25KPuLVUOz9FmbtXHUNHhHVJRtT
	7285RLMLkRVGvY6iDTGwoNuJ8NbtryRe9hOcso6Hb6CKjQQxXDNacRfUKLHSTe1NgNjKYUeA9bE
	5A7W2Hiumosn5ufV64tZLtEqHMzNu4lGn6OIMYYeWfF15kED9HRvCJZ7MfAFNGj12lW2d
X-Gm-Gg: AZuq6aL3hDAxUb9qysUrRVcjHb22tYKOiRgy6trq4sGjT239Ng4Jhtj7CKyZjkIDvm9
	ePV13sOwDuM08U4ZJm5/+ccKsvTA/QV35WPyhfUtN1aW1RP8GUGipph9DJfJkumCJR7Ed7EsvQe
	gu9KCPIe7470bJehYVPjauzwkgAL++SCvETs0JcnNeQB9/+3Y7NOkq/UT9hlIamWH+Cxu6bkcSb
	pcOxas6VRnYselWL/kEgecPmNnM7ezyhG50+rx4dB6yYGVLlRKpQEX3Cj2h2/oheKdRlFmNHo16
	/blfBndW9nrlT5I3g9s9uZLqtg2/3jqrMcUzVJz6wJnSaf8PPIV5c6YPcT+j/KWbJ+OMIaYVy6F
	VJcxEsrciUW0VSJOvCXaUo3SZfA43oBvvpsVtpxam1yW9Sc5mRCWJ
X-Received: by 2002:a05:6a00:a218:b0:7b8:8bfa:5e1e with SMTP id d2e1a72fcca58-824c9444786mr1001688b3a.4.1770962700843;
        Thu, 12 Feb 2026 22:05:00 -0800 (PST)
X-Received: by 2002:a05:6a00:a218:b0:7b8:8bfa:5e1e with SMTP id d2e1a72fcca58-824c9444786mr1001656b3a.4.1770962700216;
        Thu, 12 Feb 2026 22:05:00 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2afeesm1342853b3a.2.2026.02.12.22.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 22:04:59 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:34:45 +0530
Subject: [PATCH 1/2] media: v4l2-ctrls: add encoder maximum bitrate control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-b4-add_sc7280_mbr-v1-1-e8d95b4e4809@oss.qualcomm.com>
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
In-Reply-To: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770962693; l=2523;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=/pPAVN19I+kSbAJQbNMJlUn1ZCjEj0PufiLWfMayerY=;
 b=SoS7x5pKokJvfRXHL7J1rfNHwizbox+Xg166iBb/mFKRbjyndi3nkl2WVb4zfkEGu8bpq48UO
 hQgZa5e7wfUA55xP2+Bbw0QUweJa7BkBZDH/THb9CMDuAlO6Z50Lo7/
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: faVnKjeyWajXD8XXzTv35a966UktJzdq
X-Proofpoint-GUID: faVnKjeyWajXD8XXzTv35a966UktJzdq
X-Authority-Analysis: v=2.4 cv=XvX3+FF9 c=1 sm=1 tr=0 ts=698ebf0e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=g104nGXWCiFktQmSU6cA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MyBTYWx0ZWRfX24j0P8a3dJOL
 RnoI25OvqIuWLXZ0x6Mr404YAFQUf3SqI8X/FyMVAhx5GMCdXRh0wopHoWZlBnNYvJ/Qz83SV6G
 kE/mQjdh2LyZQnrqYWBbh7bdon5RYgqt7PKN3B+Zkop9Jl65xp8XKgFQw8ocK6WhyGpidTul74A
 5jp0RZ7oGq79dBoh8Ml4PUNOWBEhH0Sj2JBKUB3EbFPkEDMAMjqXBDA5GjsMjxr43VS/xSRq8XQ
 afebT91E20ZQvthT9vLv4L0lS1rT7G/4bwU5H/B/BvavBGzLLxPR4/Z1ZDciibjUVWw8rRZez60
 fsIjsm59FyuVWRiH2Xpn+7hChQ7RUylcJPffkrk3cweRhIkS+7vRHvSX8unA/wDhY+TgygEKypj
 xaRGR2b08osBlfi/evg+no//zG3IRSIGNLpVgJaZFBgydwfVmto65LJ1etR5oDDHYjAUc1sxfna
 NeusTxLeQiubpoMPwhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92741-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75B1A133263
X-Rspamd-Action: no action

Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control for Encoder.
Encoder will choose appropriate quantization parameter and do the
smart bit allocation to set the frame maximum bitrate level as per
the Bitrate value configured.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 1 +
 include/uapi/linux/v4l2-controls.h                        | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index c8890cb5e00a..6b2dfabfc4fd 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -577,6 +577,13 @@ enum v4l2_mpeg_video_bitrate_mode -
       - Constant bitrate
     * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``
       - Constant quality
+    * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_MBR``
+      MBR Rate Control is a VBR Rate Control mode optimized for
+      surveillance video contents which has high temporal correlation
+      due to static camera positions. This Rate Control smartly identifies
+      key-frames in the scene, and allocates more bits to them to improve
+      the coding efficiency by taking advantage of high temporal
+      correlation in surveillance videos.
 
 
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 551426c4cd01..b336171539a7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -154,6 +154,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"Variable Bitrate",
 		"Constant Bitrate",
 		"Constant Quality",
+		"Maximum Bitrate",
 		NULL
 	};
 	static const char * const mpeg_stream_type[] = {
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 68dd0c4e47b2..614fc2c4c81d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -412,6 +412,7 @@ enum v4l2_mpeg_video_bitrate_mode {
 	V4L2_MPEG_VIDEO_BITRATE_MODE_VBR = 0,
 	V4L2_MPEG_VIDEO_BITRATE_MODE_CBR = 1,
 	V4L2_MPEG_VIDEO_BITRATE_MODE_CQ  = 2,
+	V4L2_MPEG_VIDEO_BITRATE_MODE_MBR = 3,
 };
 #define V4L2_CID_MPEG_VIDEO_BITRATE		(V4L2_CID_CODEC_BASE+207)
 #define V4L2_CID_MPEG_VIDEO_BITRATE_PEAK	(V4L2_CID_CODEC_BASE+208)

-- 
2.34.1


