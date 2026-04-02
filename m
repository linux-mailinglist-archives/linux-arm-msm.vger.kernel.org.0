Return-Path: <linux-arm-msm+bounces-101540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I86BWBYzmnrmwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:52:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2ED38897C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E22EB308FE4D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BCB3B52EF;
	Thu,  2 Apr 2026 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEu6OxeI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IwxwwwHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C249A3DBD78
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130349; cv=none; b=Dsog+2WBVfvSVP7G3IlTBLSJP0g2RNgZpHtfbVn7ng6wkHT2ceUrgMEtlUDVd8CzfH//fscNZjiDG/PucwCtqMLxNHSztV5aD0uAJsmJQhZD5Tzhw5zRYt26JthidT8ei3dut/sNB6cWh8/G9EDexF+/8ubka+KhJMJACJ20x8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130349; c=relaxed/simple;
	bh=OSYiIDzE8fFUwsAtmPND8mFzvbYZFJ4yGb7DajeG4S8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WG3E89rU8zCuF0PtHwlIYWi8BAgZ6l439rbOfTUD3qPRpzB6Wr4QzwkEVgsS6BO+wTOt775j78OpS+zI4rUyOJCWHmPsYUNj5nQQusa20pOo2yuLmmOWIW8PWDXhzZouAMD07Ns57f1dNtmTb5EFORQsVdz+n5r31WTSFsyR3So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEu6OxeI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IwxwwwHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328RqqE351891
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 11:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjEXJr0F4HC6Q4F02RHzTk7Jk/5DjDFjwD5Czl3FSv0=; b=BEu6OxeIhV6UtOVn
	ybxuwhoOGQdPzGM9P5Qcn6Nje1/7rHah7r/F/2cqtLzqs6GpTZwTjWwb9KhykaPj
	mT7BUpON/qObRwsdekQIEqRfaAd4ucsLFz5VyAYt9cg/tbCohQ/+XHoSqzEblwcH
	L4cDVDtFBJ6y+ZWZZmwmMemuBugNS+Oi9ht/+XJLupgKRalhTvymHdffHSc5ql9q
	8t/zmsumqxxHrx3k/yiHFNnYl/Awb4IB7TKNO1Evu4ikkmBQ2snXYWUbb0xqWURA
	f226PzR1BdKFzS7Z/0bwlXZXkpxf4TV6PskXSITW+PtUzCl9eCfsW5iuNH9UWU+f
	rA3Stg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myh8s4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 11:45:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094ba09affso20658701cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130336; x=1775735136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjEXJr0F4HC6Q4F02RHzTk7Jk/5DjDFjwD5Czl3FSv0=;
        b=IwxwwwHE+l/90VMVrxRmeipZj9h98pRB8Pp9kXn1BAj2bdrkRdt8zWSx8gOp5E7BYu
         PsZUqsxM3LssFaU86sHjmgIw/TaFLa+0QIhOR8yMukSFEED9NaU6zHoDq1J801QtTrU5
         KjyU5rpOdDIR0q+43oqViBRv7m+TQORUIruXut2wtJFhieBix4s3xXNJT8zKMY5Qbcja
         4/NfZt34juZHu6UM5dUq/zwpGiySJVj6qBr5/6sfdf6mHKaQ0AYg79NT+yvaYwM59Kfx
         PKxjxNI6ePBNHGkFVjO4ee6XC1e88CEsZv56NXR7goYREsIDTy0q8PduIIYEcqT9yloV
         oQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130336; x=1775735136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fjEXJr0F4HC6Q4F02RHzTk7Jk/5DjDFjwD5Czl3FSv0=;
        b=XTf+IxGPs1DUecPmFLTGtVuNWMUSAgZTlttagqPJRbYEEwZ04TsJwPIgG8vS+3aBwY
         tO8xhKYjtssE9+xH2SfpvyvEamIgJ60rmPb4qneb7YRXMhHwlilk0bdR8Mg/mP9zE8j6
         PumHB/Y7lXKUxFJKCH54QWyzwd8Z+AxE0hzOiv7Hi1fgnRlxXGr44Y1ElaT4Gq7FVhDd
         rCJHh8DZjE0x4yIiNyPgumf3LO7iLZ9isCP2SPuCuTKiV7BCmb+y/HjexwLRlIVETVdM
         /d/8KBrV/v9/RI7MOFmK0tkc3ROLItWjJ/3XhyxGpIcrlRqJvSwpY4kGRVqxwGrcAgkl
         JSww==
X-Gm-Message-State: AOJu0YwwaW87UA11VV1JiXTIZzKwfB99RewqUCFoACfASggTXfXTTZb+
	+D7KTumYM0yAp7mQ/A5ydHyv5Zde6TX5lFUbT0vAfrAor9dPweXWGfFUalMrQidKSn2dn1NbaAC
	4a0NOTiHQ9efqakTTeTa+VdtbpwGpHdiiLCY1Mk8o+lRZ5hBWQeOQ/wpXE32m6SyQ8HRP
X-Gm-Gg: ATEYQzySaDfp6Xv4bvNcCSSopDW/AfXLUn/u/zwggLXf/1WPCW5u52MVQt7GSEmXzOy
	Sqd7YDIGSt7YU/1DaPkfGxjy8m4MB5YwvhCH/WcCLmGo7WfYdsXjAH5ct7mX59O7Lag8hub9YSE
	zxrfLbUws0DuaOAVO6UBM8VTTWaxNoC4qi96p4RnMFQgKBXU5Wva+g82fSnpKsbTrWmqsEAYplb
	ToAwCg6igm3vPJh1W4J0v/PPqPY2i7RbA0cXBKV8OdLGugxTdLVZNuJdX+TTrWVhPGtB6s/cASk
	h7Gqfodl0Ybz1+H1UKXXrGLNeUuqF3yrrwdiAPXCtBRGVgzGFqoV+BLBs157Wzz/ysfHlc1Mj5+
	aARAmzIHUaJmlnJsiQj5kaqwTXFqBKxWsRUVdpVyxke/F
X-Received: by 2002:a05:622a:4cc9:b0:50b:34b7:fd62 with SMTP id d75a77b69052e-50d3bc9b7afmr99636441cf.25.1775130336224;
        Thu, 02 Apr 2026 04:45:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc9:b0:50b:34b7:fd62 with SMTP id d75a77b69052e-50d3bc9b7afmr99636061cf.25.1775130335826;
        Thu, 02 Apr 2026 04:45:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:16 +0200
Subject: [PATCH 5/7] arm64: dts: qcom: sm8650: Correct and complete DP
 address spaces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-5-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OSYiIDzE8fFUwsAtmPND8mFzvbYZFJ4yGb7DajeG4S8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbPCq4EdW4VK0PG9hS7Lfp8GCKRWpwjyGJkz
 DrL8xD1mwiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5WzwAKCRDBN2bmhouD
 10rsD/46sDP1SvW14VneXhdhFq2Yx9hTKb6M4RTb0WOKEfN50oAZXorC5sgx+igbQ9NOCmq29fO
 F651NLWxQs9zSMsuO3OTL1rRASw+cJEOb1ZrxczC73QSaXxUSP9IB6flZk6B27CEhu0IcKMzfGw
 1bacLSR/LttUbQTHTG0L8EA4wDzq+mQtkskyttQzIQACVs+GPZhTSPTJ5fwgmnuAAAvCclJU330
 EgsxS7gYH8qlmo0nBR6GtMoqhAKQIBWSGersgaKY/qLpXf9Rq3HkQyVBaA9RE6tvIVnX1tdvCKJ
 Z/j4qoKs2q1XkQUKH5LBPM0mEZcsi4W/Q1kEZTkJeN4bzei5A3P7dd5s5MCvmxbsBY2GD5cJKEX
 ZT6k2JB4N/DoPXYPZ1X1ta1yWMpnsJ2qcXNZ8xI1HMe3FiJ9LcDNQfjDqP7I772ZNEC2OaMUA0+
 NwssXDy/hXc+FQHe8/ycNtRcV3KSXdYWWB9KMNN9tQZCGCiIecZyJhe7kfvP40Jctm1dRsZnO4U
 FpddiagkIX7loOZwoBMjtlGP+UwbXtSsvjqSsfM7wiHCTLJP7uTCdbMLOOTPgtzKu+GkIsQNV/H
 T0UIwE5+klodEsW6oy59+CeSPidfDhOQLSgAcBsXo4yBn9bAewUk9LqyZRdkvyPJNKdoNqCguPp
 ompliKxtQ8A0htg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: hFP6gW5bEAD1Zj2xsscVW4WqkYEPqEEP
X-Proofpoint-ORIG-GUID: hFP6gW5bEAD1Zj2xsscVW4WqkYEPqEEP
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69ce56e1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RMXozov3DQQ1vOc4o_QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfXyEtnpnv/XyRo
 PrBinBU1J3SD0uaywRMbcMLagBnsImoXcLZuGbdkcpmouA1yRpL9i/BY1YYizCaqDEdDVNivaXO
 HG6y/foOSnACIR68M4K8CSkZE8UoasZAWmdRd0k2Y5AM8Bx+8i02WlDVSR2Gdr2Yxgi7EOEDEIL
 NMp9iK/LspSUmQDeTyr8mirjZdr9XjKcwfGSDm+rbF1JaUlHCnqA1Whg9RGVflLdQ/aa3i07x8D
 9osHfZyyP/0LCNF4zwVAovM+z+UdnPzaaKGb5Fhmnk+SghQD6twFp9Khd8x46nvvh3MXUAgRPK9
 l9ABWhMvvSJuoOQXSYgLxR/9c8l+Lc5/cXLBwilftsI1GRLzK5UOKXWEidax3f1Lll42+Lpr2JI
 yDuiR7AHvShA8mA3+7kVBehXNuTWHaJdQCkJvXdALHKoPAwK1kmSvLlT9NcKd9NASF7r9r76QoV
 aNq3J+VDpAXi7AIshaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101540-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,af54000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A2ED38897C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DisplayPort block on Qualcomm SM8650 has few too short address space
ranges and misses four more spaces.  Complete the hardware description,
which in the future might be important for full feature support.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

dtbs_check success depends on the binding change (first commit).
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..bc420a44f0b8 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5868,11 +5868,15 @@ mdss_dsi1_phy: phy@ae97000 {
 
 			mdss_dp0: displayport-controller@af54000 {
 				compatible = "qcom,sm8650-dp";
-				reg = <0 0xaf54000 0 0x104>,
-				      <0 0xaf54200 0 0xc0>,
-				      <0 0xaf55000 0 0x770>,
-				      <0 0xaf56000 0 0x9c>,
-				      <0 0xaf57000 0 0x9c>;
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>,
+				      <0x0 0x0af57000 0x0 0x400>,
+				      <0x0 0x0af58000 0x0 0x400>,
+				      <0x0 0x0af59000 0x0 0x400>,
+				      <0x0 0x0af5a000 0x0 0x600>,
+				      <0x0 0x0af5b000 0x0 0x600>;
 
 				interrupts-extended = <&mdss 12>;
 

-- 
2.51.0


