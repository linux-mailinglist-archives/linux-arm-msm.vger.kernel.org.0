Return-Path: <linux-arm-msm+bounces-97093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKdiGp72sWkqHgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:11:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB4426B3B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 715EA30217D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE43396B75;
	Wed, 11 Mar 2026 23:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAhNPS96";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3CRvmSb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A03A1689
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270683; cv=none; b=EN/dkTGXrvi5ZoEDrpz+VJI0vHg+Px5YU6cJQS0muR8IkCJNMb5PjWYikCXXcGaaVltx4Np4xlZtJJ1nIyu9B+WeLvDyhKhQ7WWaiqtSNVYhVw+ddhnsNe/fLIB/ckbzZ75YgQN701NYobrLwrlAbjgXR3swAi+H28REizPD8tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270683; c=relaxed/simple;
	bh=7SgfF+m4y4qkZZ4MM7brkOD95hQhDwXPzYdcwXQ6onc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtqsgVDPVX6vL3Q6BXw+a+pjDVtFdb1SQvrl8LDvbExCq6nHEax4C1tVhFn57Rf2TVbNZeKPY1wZOCStILpWMWHm7X62Ef7w1vleuijWr5ASumwbckUL3476gkBm+N7RsoPzTIutneZsx0US8b2wGiMGnl27LR0JLGfvcBl3aoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAhNPS96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3CRvmSb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMN2dp3137216
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PSMSewwFaNxOsZmFxKKK4CERKmfK0hRmla0SEnYKKA=; b=kAhNPS9674nNRA/K
	DaMngzaS8qLbW9RRg50Q0VXR9pztBmxWvndRP1EzwME3Zm1iSIpKTV2eP4WSHr0C
	e35/LydWMtEqnJ7w5S4PD4b1ITYnvOeFzv+F5iCbnm+WMJ4qbI8gclIosfbVmPf5
	wRzzNp2NKo4E3/tRn6MbCFlBvfs6bCJVC6Sa2yM2zb4LVco2ID4Dn5PrFXmPaPav
	a/MXuFL/RauS3nB200ujLt8vvbFO/9dmvjKq4G9Tv1C+ano6JBrNES0t4LoPXk6b
	W0YKiE3bNJ+4aJrFSBL3OSZRaietwP2rTtls+l/aKcVFy/Ao1abpVlPD5E9Aaung
	Bja0ag==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w83k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:11:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c737b6686ddso186249a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 16:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773270681; x=1773875481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PSMSewwFaNxOsZmFxKKK4CERKmfK0hRmla0SEnYKKA=;
        b=U3CRvmSb7GviwVeXrtBrB7WFj7GrTT0bgzTo3Vs6ufjFiabIpNmCN7bgt9XpF0RVgH
         ro/qWkdjRB9ph82ZRFa0r85Iy1B0yj77DMgSKbL4UtDannF/q1RMujqsuxl4XCiaWM28
         XwKxks/dVdm9qVMh3k9mpjXZ+JmLYhtCqx6y2E/bVrkHmJ+snuZZG+vqJePFFeDCh1fN
         QhlWsAhNpn4MjoMYqGHP/OKyMCgPrCpdrVwvIEG3uj06EeX2PvfkMBt7yYGUntbJKcmJ
         5NTAR08YLHWuBssu1Pt6DxpmduFOnhpfyVj50P95H25Dor7zFUfcLsDhK3mjldvVAxR9
         W9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773270681; x=1773875481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1PSMSewwFaNxOsZmFxKKK4CERKmfK0hRmla0SEnYKKA=;
        b=S6T6HtNI8G4e3VyZm+PRd4Ba5YG6eZ9siBVRlTqcLe4oV3UhgFW/QuENuFpf+6lcmY
         D9JtiA01YvSWcrNiF1cmnCXPID9aB6z2eYnb1iaR6fdK25OOEYnOMx3xd9NOr8QEdWDJ
         RGqWELVrXOG5JYYl75qMRBv5ANLsZDptRfdNJeMTvcVBI1gkuiSit8vkE9ux61ge2gSx
         xgjAXZecaZ2CAQEniQRFPJDDCO+p83Y4SjtadSYxl9EoRc3luqaYNI4JfU3KL8pHradh
         /pTbtRM6GfBZ8w4h/ltVQkggH4b22bPX0ywoXbYxXu2yRjmBMuV2pb5x9NMukoJb7qA4
         C/TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbfNDqZLR3JzQ27HMOarpU1OdKd3+cn/J4FDMKZaJK+hNQthdK819wE2cZlQhNuz4PlHJ2cpi8338a+z6u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2JwrjnPO+PAw746Y1SYvnmthLEKjRfjDwaryfHLvtrg+5diq2
	j+rTzeBXo96WDuNpYXEpEfOs+P/HA9p/4nxiHqdh33SeCs1pRQ0HsBlahkUB82U+mW4FS4QSuTP
	LJPKkt4lxCLEhDLfvbMgCSaWESX2lY2hJtinsGe8WdYvOMyn0F++ZUD0tcNXbkM7vvW5H
X-Gm-Gg: ATEYQzw6i1cZut0TQenhYgkUHUnleSiFDj2H2SXmOsyKEgfGr45jyON1k7U94/lGOLj
	IzpLOH8Xn/bBdK7U91Uv9upEg8W1liWCKjWUQLQBtREuIs3HNEY09cj7/Gocd1QppdFr3CCggQ9
	FwowIaajd6nj51IPuyHraiQgXlO4+TtZaH8bVSF2DtQWqODAOvOFUxzrcCeYoC9hqe5QzHODKfL
	pakuliSORi05nSIZ2rVFXh8gZ27XiRRF7PANZ9DfumwmD05Sui/APRX56LPdfy/thKQ2+A1REJt
	U7HuWple2273SJspE5mAQTWPIChxGKCfNpOP2j3NPwVEffm7BB8bfvUysTkAvu++YUU2eZXpIFj
	60pyIEvn0ZbtfSXiFDqoEgG7aLTynoaFzTtZPrM6zgk0RAQ==
X-Received: by 2002:a05:6a00:1895:b0:827:3c74:e6a6 with SMTP id d2e1a72fcca58-829f70f12aamr3916395b3a.58.1773270681058;
        Wed, 11 Mar 2026 16:11:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:1895:b0:827:3c74:e6a6 with SMTP id d2e1a72fcca58-829f70f12aamr3916379b3a.58.1773270680598;
        Wed, 11 Mar 2026 16:11:20 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725facbsm774569b3a.20.2026.03.11.16.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:11:19 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 04:39:56 +0530
Subject: [PATCH v8 4/4] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-qcs615-spin-2-v8-4-fca38edcd6e6@oss.qualcomm.com>
References: <20260312-qcs615-spin-2-v8-0-fca38edcd6e6@oss.qualcomm.com>
In-Reply-To: <20260312-qcs615-spin-2-v8-0-fca38edcd6e6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773270637; l=885;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=S8ChkxoJiEfWRobXqSPIArBIIqpoLzaXwucidNtz5YU=;
 b=ASQVT4g+NGWx2VU/GbnjDyag+gLoYIqCbo+e9J80l9AlKn/0x54a7YwT5MfauSzpuc2EU3bh1
 ZxV9MLvZWOXARqBLfn54RHq1j97yTkxw/8AWWkAUcEYXgbJx+hAq0F+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: dDHpy2KeYbWSwb0ERoV6hUstNeNXvV0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE5NyBTYWx0ZWRfX3wsUEsQuUo86
 fu1Z7pCCisfOgYVLFbeQzDddubjv0wt94JymQMqH2e2s7GtII/5/K6e6IlPfrinAmfg9aR+RR+8
 Y422Adq5KQT6hG/7NAnBlI2ZV44VZyagAnIR8t0eZTeICXz78JdAL+hP3eT/YnSxBy8dw0T/XYS
 FDkrCgubUey9tatn6gGHtjMyX4PLY0u6KX92BG1x3xqraFaOYtAyBIODFzzcFzw9833lAkXq2F2
 Gya+K84offwtKduQ8B9bwcuPXupzwSO8nAIbm2slkjfyHtrJq17RoOgKg4edvRQBnmsU+CFd4XS
 +/xQebBagqMnlj8eP8aIOmoPbMgJ/FbWKd9mcdnx/NnNm1+nuE7J38dxIB6nIWBUeda8rwmJXZW
 OWEBpiafJ3Z9jjPR3o6UpO2uILWzYckXpkrqYUQ656ScUzy2u0s1jMdK3qinVU4Uhkj+AD7xNpC
 PN+3LSnM+tYy7aMbT3g==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b1f699 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=DDenb0FKNr3EH7qfFfMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dDHpy2KeYbWSwb0ERoV6hUstNeNXvV0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603110197
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97093-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 0BB4426B3B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 4f5dca49e15a..0bb1ee06127d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -372,6 +372,14 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.51.0


