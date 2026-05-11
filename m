Return-Path: <linux-arm-msm+bounces-107015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CXvAdRZAmosrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:36:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62280516FAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58DCE304C06E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF1A383321;
	Mon, 11 May 2026 22:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qp3AwBmV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HO0dnCbs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08FA38331A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538281; cv=none; b=ijqZCaMJtXmmy9G1lMDTcTGA0OfqZda+cuBLVbS9tP5g47xIAzrHWdAiI84nNLXUF1sQl/7BJ8G8uJFrsoswxFs6ItpnuVCRL3ntBBEQrB4D9xFwDr3SFU6HtP1j5IKvz07rgnIR21H5vv2YkwdN0fTtbaXsFo48w421w179LhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538281; c=relaxed/simple;
	bh=4TwFG6GQ2rWfxHvno6AGnLKMEMKg94Z6yrhbxek//KE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dupiqi/a8w3J7ib+q03J6ggabrbPv2DH1gSGCH/vZaXgPo04ArAx5xY39XC2MpgxBye+Ym9BeOQBZZ1J4wfSHOMyWaTMYQY7Cl7XfqnTez4EVmwO1GTPeh0iRSMFaX6mgkD7d2Ee/OOV4o1+pUEGKXGUqV1Gxca25DqXVCqsHZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qp3AwBmV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HO0dnCbs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6qo82519203
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VT84PwNDUBR/tJKsjUUmdrL7bPcbqpDnJjYc8wbzdjM=; b=Qp3AwBmVkx0EsjJ2
	vKcMSKGExBHgHr1iDbkp2A1IpUs6nUz3FfiGTOBgmHtNM1Tg1F8DP7XEM8p0a/gU
	YRhzibqnFtWGsjOJqAtnanVpzrnyxkGZvCmg8M1vkklyPRA9IQSEKD/MdzUxi9ml
	VWHRLWOaoWSn5wcNZ0ppHQKTBGxBsahdmIB86v/Da/wcCb/1KvaR5upWM7fdx0Pf
	ztgsWUm66qf/OhiCol8ldCwGILEHa5T4gMP9UsZc3j/KSb42PO5UU0GHTrA9IjTG
	7/wupGretjc/9D2mJbyzGEXn+ai/+nDFamh1+NXbt9CJZ4uc36XP7EPzQRiU388r
	Nq6cEA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1gfq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so5966569b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 15:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538279; x=1779143079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VT84PwNDUBR/tJKsjUUmdrL7bPcbqpDnJjYc8wbzdjM=;
        b=HO0dnCbstXUhownO1Okl1Bdy4YmZgpRP/MWj0hSyqcO+QSux+WLdDyLOba06VdDAek
         viBmHqPRTubesvWJ/bdR0kqb8uECCk/5tGZ1lQqQSHM8qd+lfEmnyOq/dQ7EXC/oCpjx
         gHafbfMXUr04aipulOE0ck5f1Gsbh3HNHM4NM16Z9DFKDDkRrpH8oYFnD8t1V2hGnLgI
         +xFx0oT5waD/sm5bdMnMFnMWNtr6f26d9NWWIXa2UnfXC87j9zUiP3b5USXHkXPL23Nq
         8BZxXndyTEBJx0cKgRvIGoH429GboxOc7I1IbUHJSjvHdW5SjQtcGT/8+HPG6bbXDprL
         1OCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538279; x=1779143079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VT84PwNDUBR/tJKsjUUmdrL7bPcbqpDnJjYc8wbzdjM=;
        b=iVZaoaCK9ZJcmrxe1FvpMenwd0QZ1BLTzvfG178JtLI9FK/4psnxBrSkqRrhv+u0Hk
         7xn/zBkWTcnjTr0UCLLZh4/ARh/xsvdTjIizHkJt0Oyq4zH8KllQUT/vyumGu2mntYdp
         gbRW3W1xm/zk0WVY9mCGsY8uq2JmkWGx5Kki3iLF+6iyvopgcIEKNxEajeRtURMSX9UN
         L+hWsM3QQWm9Lwp8/Gn6PyVwL1nYgQoiV5XWJAUZS13126TV1NRa28wXNTIuSOHFsjyj
         HFi+5szhG3rRAypugH4RQO5URbEAGfnUjbfbt+NLccxXqu+3yaZJ3j9rluE4rc3or93p
         1W/g==
X-Forwarded-Encrypted: i=1; AFNElJ9dwuwBj0lQxOpjVGWmkCj8pmPdN5zrnNw8KbuuCZ0qL6tw6GEIRj5Ikw1e3nUnFXhfgXtBDRiWJv+BKFzK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr3SPEVxyh41vkCtf3vqiQ8LbNC7K006u2A4LifbzIGJki8DU2
	4JLuZ8yOHspYsyb4JsMLx+KjJkBFKg0veQGcdn/XjmT3eceHIP2KzHycQFSHVI3LfRKI43syK16
	BLVrk9yTlWu7CXxkKkbbg4zrk/9QqJC3zrDwdCBYyt1l9RFcZc/k8YSlZ0+hoJ7GVnQ6m
X-Gm-Gg: Acq92OG3uDtsI8IFMSMbRWc3Ji6Av/Gw8y/RrOmICTZOe0cnW1ciPvPeh2LJHGX8Pn2
	I8DVjBCfuUb0JwAkGkWqb/gT5VuNkJXW44BIWfutK2b9QV8/clAa1sYzMZpDSRItVPm68q2neYH
	BRzuReWZbM9O/wgCfaAw6h7n0VETaO2UoCCwoyETVJk62cQ54lYPWBbIqLfPEUNb9sjeeEt2Gcz
	F5yDDhq9e2kDxu3PnF45bd6msWlWM4NrwZhLFjSYOIXBEsunhmL6GLS9hsa5qZW75eK9gT/tIfy
	of6OnaHO1g6ha8R02BpjlWF+UzBt+u8oD33uScwyglK73oQFt+B+TcLmRfSoAc6kbV+Hn0fq4s4
	M3uyxOzJAYTJFsqx/L4dl7oFRET5jnE6KdXT5wFs+qQ34LA==
X-Received: by 2002:a05:6a00:2c86:b0:83e:c8fb:54df with SMTP id d2e1a72fcca58-83eeba03dafmr336269b3a.2.1778538278578;
        Mon, 11 May 2026 15:24:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2c86:b0:83e:c8fb:54df with SMTP id d2e1a72fcca58-83eeba03dafmr336251b3a.2.1778538278121;
        Mon, 11 May 2026 15:24:38 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:22 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=723;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4TwFG6GQ2rWfxHvno6AGnLKMEMKg94Z6yrhbxek//KE=;
 b=waPfCkFYB6eDvZNGEFJsUZ4feqP4qBVshCQMu58SBRIUoShOVQKU1ivqUXVi57+d8FACeeVYb
 q0ZLr2DHU5jAOh82UtRnGExYjXfoo+hpAyQ8b0CbMm6Im6ysoGaandY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 7k5Rv_-ViT0UuHIIrctnw5rl_hBt_26T
X-Proofpoint-ORIG-GUID: 7k5Rv_-ViT0UuHIIrctnw5rl_hBt_26T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX59Uz86teBt6G
 Yff6I+EnGl28E5FvRBRat8bJykHoc2dcvdrbIvLQYN2aoICQeBGpuRc3z/ofdlmyvuaF/xvkJIn
 Wvkdaha3tT7iz34IqkobF/ZyStp6+8+qW+cPG+wwBRhO/b4p9XyKUCdDATxz1H9sI5VKve7IRxV
 VO0nEogKBY07v69Ok5EKnBPgwlm6rVtPZ24zeGbd4K/jsAky2RJJBH3V5gMSC2RjgavWHD3dB2r
 nHuCUChAOdXj10DJFr9w7d0aDt0LOLG+cM39yI7MwS2h54jHc28/bitF/SVrwdT227V4FwIrMfV
 NTr02UjNt6N5fQgTG7wrcZi/jr+L17leKkLflGExJji9g8R9gw0zKB79sgq1VsbJatr8TxHuKSj
 85UevNXVBaqK3rT969aosu+sVKMgZTiNOjiWXOCT49RMnLry0bYDHSoP8tyCl/6FfAwcRgvwqKF
 5HkuDIRmp0XU+N8d03A==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a025727 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tTGeZ2WnJxbZjfYJna4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110236
X-Rspamd-Queue-Id: 62280516FAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107015-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the secure firmware name property and enable GPU support on
Kaanapali QRD device.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..6bef8ec151f8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -693,6 +693,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &pmh0101_flash {
 	status = "okay";
 

-- 
2.51.0


