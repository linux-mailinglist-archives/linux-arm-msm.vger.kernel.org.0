Return-Path: <linux-arm-msm+bounces-88875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0ABD1B378
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 21:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AAEA30245DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 20:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A96E2C21EF;
	Tue, 13 Jan 2026 20:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLcRz4u6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QdB+EIlL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAB2239567
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336420; cv=none; b=uwFd0pYmIiMHw5wijmeaFQfnvzDKHEpAidOqjdfPZJG8ZU1LVaoI7bNrdaeqgIL0iOXO1rpmft6fvxrXVeaZI8JawErhBB+jnL9e/xKI8VlBE2FNp3zmITZYP2pUtDZGzwaNjZ1K7pJmx7Sgdmgbugw/x//oTDqc0DTDHnaaS8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336420; c=relaxed/simple;
	bh=e9feMsTntwOvJE/f/yvVEy1Vi5yNGa1wmeIx2NZlt1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BNvk4wK+VaGaIJgxjV98O6cfMX9eA/s/51GUKVjXgOsBePbH3QBrYaDkpmGDDOity9UBS+FMegwZEoxGTFTib7eZ50McNbeJZitjDInQErcUm+IFws1fcAuQ8KgcAq/t8waUrLKSFUlDhvLPGn/XgYntXJC7Wu/ohei6v9reerg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLcRz4u6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QdB+EIlL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDsSL62071209
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ls1Z2pZAzMK6OUhcg0ArAW
	9Yy647Wsf6kqR9OhIXEvY=; b=pLcRz4u6HJXgYTLafnMb6DLXcWKkVJO+xVTixt
	6rivc3z+HY4AEouyh2iSIQecB6XG4hB3MhreX2Drd7EHq+Kwb34ylITmqzQuKdbs
	H6Y6BSysS+W8r9eNfjkx0zLSBnInZvcAOzW2B6jzrx50GITQ/cOaoPjvDEZrYyMh
	fBXc9J/nSZm4x+LCwIsuxPIJ8KoK+HGvQYFWKh4SIyWfGZx2NzTHzxLeGpmgk+Wm
	OucMz+LDezmJ1EP4C+J9wRnMYwKmmB5N4u+51oXPuZLWOL/gqip1a5SDf5XvQI1v
	Mq76knea63XJkncRYfceKzgFsjYZ1xwmwm9r2+tJvFSXMADg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm9cvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b1fb72541fso38332eec.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768336418; x=1768941218; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ls1Z2pZAzMK6OUhcg0ArAW9Yy647Wsf6kqR9OhIXEvY=;
        b=QdB+EIlLq3MMHYPc4KpykfI8z/aCq8n/Aly0KhH1qEeT9H0gkoyk0Zwc1l6RWpNRzp
         l4j4AeJm5MPF6KOq8jUhNusjXmwKm7m9SBjy8qcWNHp6rn4YpR86xkXYfxEKsXVIiTrm
         1zK4hazuawVWl2DhFAvyo0R+9I3LJL7L9kasJbJKENi2xOdDTIpnDtrlHxbudX2P65l4
         nY16lmrrWTQ9TWNxujxXFjdTpCOpzX2lGB40dR0vATAUyRQviDPXUUQMG5Xgkyo4NtnE
         iAV2J0weAVFgH96EF0mtXSunk2zSkXKFAiHgtZlGHMOoJSGLNQFKExs8zW9uSZXUpf5o
         z6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768336418; x=1768941218;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ls1Z2pZAzMK6OUhcg0ArAW9Yy647Wsf6kqR9OhIXEvY=;
        b=FnH1fjR3D1QTr3HJ2vpLszwd/imgulPx7aRFvN1khbV3+/zepCp0Kt2aLiO9HgtaLI
         bGb983TwOncW86LMrH6mygUFCTfQ3KC4Yb08emwbkJe0lisYpUtyi3RTsVUe8LPNCr0i
         fkCGDK3iswCNi8zUtuIm3o8POxkjpK/aonOCsRjurr1V1py3UCfLi+rlTSCXxasLewZR
         b2WsXA4wigBccVjNWuiyV0xC19BYcyX1tE0LEGEz+Hu90G5GfoIKifRkQa+3HmSPu/2r
         Qnxb3rY5OWPqI4jC0lx/qSQ6yZJgHMvn0m6poHuC9cbvjlc/KbTgVUcL933Zjp0iZEce
         N0HA==
X-Forwarded-Encrypted: i=1; AJvYcCVEk+tItPFJr/r6ibc0k2bn4KH1BoMpjsF+ragjBWTyMynVstDIXUujAtnIkfEhrG90zZXvA1LHeI6yIJkT@vger.kernel.org
X-Gm-Message-State: AOJu0YwdDeP+Qw71evkOtGrLHVa6wpL/gy3LDbg7Ju4qRXPSjV79jcS3
	2IraatQxKIaQsqvSpTvyOZky5gsKp99sBbucPUjIRUcOHkU4oUGQPDvEepPW2DuRtidnX0jsXMx
	SoRERuQ4WfStdCrw6DIAxoWnpYrLBnV3GwIlh0RLA7JnmoJs0SR6YnkjcGS8ia76sZZjDVA45yO
	Do
X-Gm-Gg: AY/fxX6rNhl3W+LiMZZUmgHl9HS+SfRvMfuofudwoU4eZDJeJV7kwGfwaHmHMK355vb
	FOEvqV9g3Z45qzQwegjN+P3Up9wgurvX8hDx2m7fanYFTtiJ5rmGUi2sjVAb5su7c/XDua0Qjzs
	eT2ILOiNWs6UW/odRysVE7Zs9JBhCDBmSz1qBWmUEw+XGTtiZ7zgjnhaAwXCtptuTy9VaTtYq3Y
	xilj0PLWAby79MnQdVmjPZ/WEAB+c8ozGy4CKMXsOtpKlsyFYzzEzD4iGkYTsFHAL/Kut9Cmtex
	bvKCPdEy2b9ylnxv3Fqdfvy6BJBcmtzIDrGJD/M6az0EzJ2IgnI6EGbxqKCAclcia0JyYm3w9Cl
	/xfNg0A9ZeR3sDCAmIUzsIsgPIJYfBvF9z1L2hPw30FVLY81de0VNXR/N2EvRXc462GSjgA==
X-Received: by 2002:a05:693c:2c97:b0:2ae:5bd5:c241 with SMTP id 5a478bee46e88-2b48720cf56mr134642eec.7.1768336417705;
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
X-Received: by 2002:a05:693c:2c97:b0:2ae:5bd5:c241 with SMTP id 5a478bee46e88-2b48720cf56mr134606eec.7.1768336416760;
        Tue, 13 Jan 2026 12:33:36 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm19157897eec.5.2026.01.13.12.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:33:36 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [RFC PATCH 0/3] Implement Region of Interest(ROI) support.
Date: Tue, 13 Jan 2026 12:33:31 -0800
Message-Id: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABusZmkC/x3MQQqAIBBA0avErBNyyNCuEiFhY81GY4QIpLsnL
 d/i/wqFhKnA3FUQurlwTg267yCcWzpI8d4MOOA0aI2KhYunFLxkVtY6G92GozERWnIJRX7+3bK
 +7wdss9gIXgAAAA==
X-Change-ID: 20260112-iris_enc_roi-8898f9a2455f
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768336416; l=2042;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=e9feMsTntwOvJE/f/yvVEy1Vi5yNGa1wmeIx2NZlt1Y=;
 b=qZseyZv2DRWXygM4GU/AMh081btlPHh3Knb3IxDtxqgxmcmXAh2nHRwNSuO8wX8qhbZuAn8Rh
 dw7cx4cim7dC9pFtAEjzRANDTLH+cdBEA8dgza19lxYrb28jCqVHKnV
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: 8W25sjvFvRZk83lo180qM52s-8NC4emm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE2OCBTYWx0ZWRfX+YNAdboV5iyB
 pS/k2Pz5IRym0VvVjkVGBd4qRXTrbjt2jf/xZWtZ2e9dpiITFvW9ntDvpu8zWMMn86KVu1kVZuk
 ADaJfHvvwsot4bkwjf/k3G6yK9TRwv8HTzoRI+22cZHmcPt77CLPsa7ILoqeiGA5VlMmPNClSad
 4p4W9gWylARVLThMAljafWLmWMIK7FPKkSyqparHZTsoYLT8WNf6ErmD4rvxhVl8xbKoxC91Cwo
 Wi0ztTzeR0ujBfA3FrNp/tjX4vNcQBda0cOFPZwPR6pmuhmvl+ioIztJZzNeEv4sbCfHX2iBuud
 OPF2ccTbHT2tOV8BYR4/Trc2N0YaEiaiVNgteSMuw45VlmSbWd0pdcN395TxxoruXJkFofz7mjf
 4usobO7NXvK3IeaNXYZ7tzI9MYQWEhqoGVRo6BiimJI1/CEAKJTy34F3cwO/2S9Mz1KU+3xa9uj
 d2wAZoTM+++DLaTbXBg==
X-Proofpoint-ORIG-GUID: 8W25sjvFvRZk83lo180qM52s-8NC4emm
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=6966ac22 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pCB003YKW07DD_LcUbsA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130168

Hi all,

This patch set implements region of interest(ROI) support
for video encoder to be configured as a rectangular
region, and corresponding delta QP parameter. A new compound
control V4L2_CID_MPEG_VIDEO_ENC_ROI which maps to struct
v4l2_ctrl_enc_roi_params is implemented to achieve this.  

I'm sharing this series as an RFC because adding support
in the firmware and framework for testing, gstreamer testing
is still in progress. I would appreciate early feedback on
the design, implementation, and fixes before moving to a
formal submission.

v4l2-ctl -d /dev/video1 --list-ctrls
..
hevc_b_frame_maximum_qp_value 0x00990b8c (int): min=1 max=51 step=1
default=51 value=51 flags=has-min-max
video_encoder_roi_params 0x00990b92 (unknown): type=284
value=unsupported payload type flags=has-payload

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Deepa Guthyappa Madivalara (3):
      media: uapi: Introduce new control for video encoder ROI
      media: v4l2-core: Add support for video encoder ROI control
      media: iris: Add ROI support framework for video encoder

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  7 +++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 54 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  4 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  8 ++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c          | 14 +++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  5 ++
 include/media/v4l2-ctrls.h                         |  1 +
 include/uapi/linux/v4l2-controls.h                 |  1 +
 include/uapi/linux/videodev2.h                     | 17 +++++++
 10 files changed, 110 insertions(+), 2 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260112-iris_enc_roi-8898f9a2455f

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


