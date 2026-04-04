Return-Path: <linux-arm-msm+bounces-101803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMNVItd80WmHKQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:04:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E8039C7C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A55423011BF1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3393431E6;
	Sat,  4 Apr 2026 21:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbaJtrYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6Z4jNmS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594DC346FC8
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336637; cv=none; b=MQHjTTF787tWB6OcNZ0teg+c4rao6ZDMTVIGn6GHO2eBtcRNpQQS0/WG4cGYX4AG3XxwziBEDOJTI7RLkml6JFQe+wZ4+FHSKBK+j/t9fORDMT0BnmsmbNwQhLSK/DAHQR/LFd01pq9+M1j/bf94rhlVl/nSrhdtpQvNtAtA2Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336637; c=relaxed/simple;
	bh=0pQSsN6kLJu1c2xkW18nAfQbObgvnTex0L4qjOiJnLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5IQgKSDzIm0hk2NtVOwxaguNM93cw0me2T53KrwFJLPTg1FMuXQmvqRIjC0+eiA8RNkOmgMbnGOGciR15qJsBp0D2BOceT43J5yQri7o1pIVy8EVRfEesOJlPBYXzOnH16xb8otXDCtZX6TpRPeyhcOs13mWKUWAJKY8Y8STdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbaJtrYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6Z4jNmS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63428bt42408258
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZvknanM1whbSfSnmntGaD5fuOzBhb0C116UCQrdDbM=; b=GbaJtrYYT2VYoTPO
	xucIKCOw7N3I/frjr2jwpUzP23uYQDXP/hpHT7k/XAXmxe8d1Vqal1H6W/XSecJL
	EZ00fOZmx0AncMCJr+JN6fm6ZzZ1qEjYC/50RI1UoTO4k2iXJXEMUX0yEy0Q0rPd
	2ttDM8qgze8m3b4se8r3a3ZowknA1qiO/GtSRWZApBsXOVLS+UNG6AYWueAP8CgD
	WrMyHNtyCHb9rHkp5XPh2tL295Eju5OoC7jYSLc3anM8JoY0HzVr175EkxSqwG51
	WXnAz770zYVWHqtmzTzUQ6o0IRVb7YRM9piFAz9DE8jL7ZPfabQ0jvIh3duDKlTR
	ec6Nng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrhm32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:03:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c44bf176so3176687a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336631; x=1775941431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZvknanM1whbSfSnmntGaD5fuOzBhb0C116UCQrdDbM=;
        b=F6Z4jNmSqdPR78wOsrYIZvtISLHMthTmeiDSSXuDjGt0shdm9o41eJ2ryYlvEGAybc
         LvWemiMv7/99pgGJ9PWiThpoi3AnAxxP8rV4pjQ+AG3+P9uQm/TjFkBw/rPDunu9JDPb
         WTWG7ZGae9ueAyF7fSgTz6TXMFauZDtiQOcfrHItsR2DqLqwsv+pTUW13RAbfpDkT2XN
         jv2jW90PgU1Az0WEXmjHOaUYOIARh7XBA+EphogoCV9ua9tjDWAkD2RHw53VfP1p+svF
         wp48OQegmbJCBPUxrWutMcI8cgrK8HerBBPg/hz73webKnO6W/fJ87WIdk0pYgCodzVh
         0NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336631; x=1775941431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ZvknanM1whbSfSnmntGaD5fuOzBhb0C116UCQrdDbM=;
        b=EjlJOf++7nagLIdtEhgMqe4UdhO2nGryS+XyzKLgvYUSHFly98vewcfJ0zfj4a1ctc
         62JS43wwt100jy5sysuRKfhgVo2EDkhNeoorEVCviJ/U3krt66WX8KFfiW1VdIqdlpQg
         3CIvrBe+Llhi4Vi0PNlmhq8QS8QHA1K7JqFVLF+xI/wyL75q8CRbVn399OriWAem5EtD
         YWIXIGPu9jBE76s4JTKuIHw1XovOD0fK6K6nEfJDWpRxb1+KGqw3YJ1AeeWzIo/uBD/J
         lemWbZijDPL4NdalCqqSLI2ko+/mgoI2FkNVkBRNV+MZe+drxJr9lqZGef3MepsW3JmY
         Hbeg==
X-Gm-Message-State: AOJu0YxB8tmVXzgFqhZWXsLKuZVPVTonEMVur+8kXYfxDYoJk9yWjlFX
	4QQZE3jJzNLLpcCL3jePswn6A00mtYHLJlK1KS6nNKwR5OxuN7fzFeMTyg+wpvXrsLS5w9ittFV
	t5vkMaEZaSEefexKa1iMjx9ksXPA41p5w+Q6eEU+uTibiSEvS6b30kKKfSXCpsD75MEC2+A5siT
	QW
X-Gm-Gg: AeBDieuQvvDK/EsSQOBosuZSgpNzGaaRaxIPsqAwKZ+8caHN3Mi3j2xbKeD9Kx6DtS6
	GFlKNsiouYIrkF/QbzsYZ3q/WP6UF52nZDV+wmBNOrNHpqz2tFHhPsUL2cN+D88vRNEVD0U6YPy
	G7+nOK42vW6+JaXumXE3oiiYuilHLP3h7a+j0nPs5Gvt7TRUQbox2Wy2/0da43e9p/sy/PwNHRC
	81QMGICKo5e54U2TpXjfgcfSFdQko5iXCXJvGJU9WHO7t9PFnQ9Ihx80tw89bDpsMvioVX4jCN9
	7zeExtKc0hwbWxvfzN8iajBZh+NJ5EuuyxzJ0qae5JeCmfdpI9sZe1IFESKKyncHslYRrkX0EEB
	JMOsWDpEoSp7pCmcxVIS9bP7ZzosuSzWlzttM4YoDGwrbrA==
X-Received: by 2002:a17:90b:5348:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-35de69d2217mr6357524a91.25.1775336631556;
        Sat, 04 Apr 2026 14:03:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5348:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-35de69d2217mr6357507a91.25.1775336631067;
        Sat, 04 Apr 2026 14:03:51 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de677e2dbsm2675545a91.4.2026.04.04.14.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:03:50 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 02:33:14 +0530
Subject: [PATCH RFC 1/4] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-glymur-gpu-dt-v1-1-2135eb11c562@oss.qualcomm.com>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775336617; l=1131;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0pQSsN6kLJu1c2xkW18nAfQbObgvnTex0L4qjOiJnLo=;
 b=dJ/h64bEjXn8ZnjZvjsw4sHJmN2WtDg+m6rdoAEo4S5G0u10X+zOL2wkA+YLSFvUAsGfiy2ey
 ucRKe6Jog0bBSHgPCySYtwm2uQ2uaTtcB/DSPhOzoW72YZ1wpc8YH5t
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d17cb8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aapufVXKjK5bSyzaIfAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: TgeQTeNA1flnmoUOxMdQlmU3vpIVEQJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX4lZF7qnb3MUb
 hf3yjKx7C9UNxD1R3T174hgA75AFmB7s3spQXn+kF5OKgp37pbLgOvMuHBD5ldsaNbU4X8Xo85L
 0rau5GDPIUEvCYtjxpfbhhVY+eozT0CUz7h4Viw6NNqfH2ECTAxlvz1It0RX+aqO+H/TvH5VgjJ
 fbL1g3eSzPFsitD/zz8i96KIsqJ8cM+dKcGXiFSRwK8AQUm7L42ERm+BaWws2fIjLRxvY5r1s87
 ORRftUoqGjIrfDzb1hmYqEg9xwMv1fjvUSJAYzQ16+vmknRZaLsy5CMK75enzCJUOHNUmkwQPNT
 tZDbH/WY0u8E01OLhHH4alfK0XMC9J4WKiVrUd3qESO9kDL4V3UA97P6cryRqC3Z94OJn7yc/Z8
 AKxxSPkJeVpk9pmTqlZwA37PueCyTrvZkQ/lVdBqlQMfixDU0kS5W1W51YpdstvNaU6CklPhJDj
 U8NrXOiANL6ZHubmgxw==
X-Proofpoint-GUID: TgeQTeNA1flnmoUOxMdQlmU3vpIVEQJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101803-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
X-Rspamd-Queue-Id: E2E8039C7C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
It features a new slice architecture with 4 slices, significantly higher
bandwidth throughput compared to mobile counterparts, raytracing support,
and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
other improvements. Update the dt bindings documentation to describe this
GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca..bdc8e6fa5359 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -434,6 +434,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node
       properties:

-- 
2.51.0


