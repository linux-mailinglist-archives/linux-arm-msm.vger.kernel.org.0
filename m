Return-Path: <linux-arm-msm+bounces-100933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANSaGMVPy2khGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 06:38:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB01363E6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 06:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B3E0305872C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 04:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACE62D3EF2;
	Tue, 31 Mar 2026 04:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyQoajrt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXg1hAzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2862D7DEF
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774931862; cv=none; b=qUwh0PHpRy/mqtvRtwQM1hQXoSL3VzewZ67BU/2yHfcrpJvOL/6hcHgBQ0ISo9B55nxYv4QEAPMjQbFhXSMmVfx1KlwjE6uJtdJfoaylux/UEOEN1PY/8fFBIooxhOBttG7zws9yn3W6NXeK+VPsslIoXwJtEIo6exJIGVLiOAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774931862; c=relaxed/simple;
	bh=lHsAajHWGy3tWGHoN6vAQjgunSy5SfF3NnBT6/BLG/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJZDaOapo2Gq3+FO1yiyfz4+1xufP399v10Rar5pVgDHCsnZTqa21AKwA2E0vz14PqkCIARzeKP2QN708yl5n/XhY1Utkd0JyBLGyG+0+gmytTws1MUE1Hd8b1Vn/lQoOLWTgnsiGrj9M7GjIeiLh1FRx+7N+KldgAwjyULpaSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyQoajrt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXg1hAzG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V1FlF01402699
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5IvHPPf602zKXBjkColn2/3UZfK1nQghmZEKK4YBMkk=; b=ZyQoajrtYaL2Vdxz
	m20JYOTBsrPTKSaHVqA2RuzUN6WD8a+3hj6O3f6aofUX4BXGbks4TLFzuW4muXy4
	1fPNqWWuoRXxfk19xB68V3Gtf+zAB4BYI2slZEOcr+xpUGJA1cKmDq6jRjHf7avl
	e/lHP+FBWYv9IM/hs2idMK7IJ0ObHcjidVw0WD8YOGzPumhVM/90gkze0GN3mmAq
	5ZiJcsilwN4+LbPiDjAXxSZ44QYKlNbK1/2CcfQwEurKY49oVfe3WkWzDqhthf7a
	6ufo1nzswiaQGPzESy2OKlg0RjHNXmWgMvWn1ywjXha2pz0+UEnsquWhLgfgm1Hl
	aUvDrw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4hbm5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:37:39 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-127876be621so3248481c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 21:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774931858; x=1775536658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IvHPPf602zKXBjkColn2/3UZfK1nQghmZEKK4YBMkk=;
        b=BXg1hAzGUIoC0EaIPw09Ei1tainz+AqCuzc+ZBmTKecTMKOTU+igEVll1EQXZc1zN2
         vkWeC2qRMkWvkTX30r/xNSShsKkbNkR17Wd5Numwch/1hUSX3wGj7SOR+DHBPT1MKbSK
         uvrFQwkCuZUTLF5Yy4aoj1TPniZLN7WSpFlQrOUbkHqfLOJqxysnwg1uO/4zg012DgA5
         +WVBMLBwMDroC79pZkrRNMyT/AQ4kDgfVSeKkdANS9Zu6QbuvycyFPufPhk/J9201iIJ
         unan8XHj2rQ4GW7iu2oELIzoqJV+iBbj0AN8ppCsG1QAAyGJvgLe/ei5sldF9Epjp8W2
         SZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774931858; x=1775536658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5IvHPPf602zKXBjkColn2/3UZfK1nQghmZEKK4YBMkk=;
        b=QI1HORCLx1WDFkCIQopdvEWeDNMZvmSOME/ygFF/4vct5HgR6SHP6dcbGUwwMp4GEC
         qF0aCVYKVt4wQAtwEULLJKu9GqVH0i+JwdY1ylB4GQiiB7FOuUEDNCGH8Dcw52j0+MZZ
         UlbugbV2iDQyMZ7D8PrOleEftsSCbL/r5LuIIf2DjBVCc4K6DOhCe08kyqJdEn6mxV7D
         lR6eAmAGUQmleSPUfgg0fH9jRCR8tlG+BU547UuDIf7Ln2aMw64+MINF0jXYDXz/io7l
         YDsJ4aO3WO1ZrXNTf0hRQYJLgaIZBZ8adKV81V775cfKSUDv2k96ouHcVEP+3GfMyUpP
         UtUw==
X-Forwarded-Encrypted: i=1; AJvYcCVJmyXHzjbaYlZ50vtaVVc6siDvIcjkEjBPjPAZH/wQ8cS7/YslJCD5IlODKjHg0eN/qQ1fTk2vg8DC7xxO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxmdw3vrbt9zwV3tNzFKmYSqI+5u7iBhF/krqEjy2ArY77CG8f
	y6T3PT0OrFoX9SUu7xHhMCD38SrLOlttvTP/BADLvmf+d0iv0OJG8UGgqh1ZhCjZTTX2QlXgLkt
	gmQEwK0B9JhilelGqFcSkX7xInZRfQfTJyp58oeVZ+X2i8Qklg+KFo3nXIwcIZMI77COKgxcJi+
	W7NdQ=
X-Gm-Gg: ATEYQzyHL3qZRd6QAK4Agj+KZQRcNIvkqzmd8Cg02a4ci4kvfDoriGgRyfCJ0Cm5sT/
	R7eoMRFlSdB7MwjrEjenM0vOGRAkd5bEG1/IZyNcxIwKz+a4NZnAoppeytlaaaJ55w+FuR5KnC2
	l/e8JxHSckg7rXx10j2KthpnilJ65yN7XywqpQxWjVN6N1dE5DdVT6T8u5EAOJPGPjAMKefPUMt
	xRaCgH7tduvCnHG3Tym5HWpDgc8oQ44Zm9BtzlHZ8oV3uJiwVXzEr3xxgUeqCtJ4O+Q1v/Rfc8u
	6VVVfXkBc5ipANKTiP+N/IYAG/7olqyMjVHypM/59qPRuOCk0HkH12DG1dNWZyH3DKv/BkHnCSM
	8Eoz6KhfAUkGkj4BJ0aQTY1E6g2e6suG+XwVchzedCG8ggoR6/vMV
X-Received: by 2002:a05:7022:b88:b0:119:e569:f84d with SMTP id a92af1059eb24-12bdde10b78mr968112c88.4.1774931858241;
        Mon, 30 Mar 2026 21:37:38 -0700 (PDT)
X-Received: by 2002:a05:7022:b88:b0:119:e569:f84d with SMTP id a92af1059eb24-12bdde10b78mr968097c88.4.1774931857671;
        Mon, 30 Mar 2026 21:37:37 -0700 (PDT)
Received: from hu-renjiang-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bd9894sm9252248eec.4.2026.03.30.21.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 21:37:37 -0700 (PDT)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:07:07 +0530
Subject: [PATCH 1/3] media: qcom: venus: drop extra padding in NV12 raw
 size calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-fix_venus_bug_issue-v1-1-e4ae7a1d8db2@oss.qualcomm.com>
References: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
In-Reply-To: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774931842; l=1317;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=lHsAajHWGy3tWGHoN6vAQjgunSy5SfF3NnBT6/BLG/Q=;
 b=azqXUL4aRJZkX4uAFDRh+L30ALcVQ1Isg/BM6IAkCzgJDsM2Gyn9EZL2AH/QLvXw6bV8+6x16
 0cOpXMkjtOKCT0pHY88/o/KujqPaWAMPTKIGWQ5C3tFAS94+P8IWUeC
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0MSBTYWx0ZWRfX6E/DFpkhSd3N
 D1nMCAubJNr9tnKhYsBazKtxIBQUm6aPtd5buwrDZX47tlzNvCvhrPtqtB4D0/dUrwHIWrxs/xB
 F4jG5FMavpJ8B/8DF90YuLpFR/dhg1azI6Q5S8HS9kCezaS+rwYgY6LdjYDW0j+ONuOhD01e4eb
 nQbv/T6eiiD24soMAduQ8nI1ecPdoBscNXr1EoRMR01o+rPpo9g+e3y5Hpxpbp2L5kX1DRi4/34
 0Jk3WWk6cnZ5IVClqCdU/7nNukOZn6y6nCRZCvhNFibzK4zEmpYf8WNPN2nulINdGnyWGO5HcJI
 I5EhH8i2jzOowJdUrUS3eW9sfGzO33o+cFVd+jhHpgGO/rKvXLTFCKJMw/TogrypWNG9HeEmAIJ
 ElPjK9elRytc+yf1JsG8c6dfeCDE9A91cyD+17X5bEIpaVBjgidn95YD4JQtka+pGkEpNEpNg9x
 rnqL3lZSIG/p4UHi1xg==
X-Proofpoint-ORIG-GUID: BoLSA1KrTRi__vn9Z2lqjT7ui896HRTx
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69cb4f93 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xhpDEqFydVGyg2exUb0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: BoLSA1KrTRi__vn9Z2lqjT7ui896HRTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310041
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100933-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[renjiang.han@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,samsung,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0EB01363E6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

get_framesize_raw_nv12() currently adds SZ_4K to the UV plane size and an
additional SZ_8K to the total buffer size. This inflates the calculated
sizeimage and leads userspace to over-allocate buffers without a clear
requirement.

Remove the extra SZ_4K/SZ_8K padding and compute the NV12 size as the sum
of Y and UV planes, keeping the final ALIGN(size, SZ_4K) intact.

Fixes: e1cb72de702ad ("media: venus: helpers: move frame size calculations on common place")
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 747c388fe25fa30770ac2e81d42f4daf83d74ddf..59eee3dd9e06c27165f29fc034d151eb13cd2349 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -954,8 +954,8 @@ static u32 get_framesize_raw_nv12(u32 width, u32 height)
 	uv_sclines = ALIGN(((height + 1) >> 1), 16);
 
 	y_plane = y_stride * y_sclines;
-	uv_plane = uv_stride * uv_sclines + SZ_4K;
-	size = y_plane + uv_plane + SZ_8K;
+	uv_plane = uv_stride * uv_sclines;
+	size = y_plane + uv_plane;
 
 	return ALIGN(size, SZ_4K);
 }

-- 
2.34.1


