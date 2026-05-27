Return-Path: <linux-arm-msm+bounces-109961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCgsL+e9FmqPqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:48:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 363735E2126
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E250530B4D23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8660A3EDE62;
	Wed, 27 May 2026 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVU6hOT4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPDb6wAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260713ECBE7
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875053; cv=none; b=MjZJko/k09IxW2lVpV/1TmVIPIRfBN9vq1LDkfK69g5eyP9V7VrWAm/QObRvg1FAxO599kQwYIHaZcsWmdNWwIt6LY6MbZ7qYlJZ9Up+7/vdZJRe14W9QvQ84qJ5MCuOqd4uBrdMdX0tpgFjkVCvGQ1c3eHMz9TNnhlHUGpHcwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875053; c=relaxed/simple;
	bh=kFCU7wZmYZ9Np8EmFIbv9QlGD0jyuZZ4tyZs0R4l6u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecI+AZCgP7QFfEOThnqhmzgtu6egd/J+YKeDiH6ssOjhg/B4m5BNcxCHrRo8W6ssp3iEwQVqeiyVM7S3C/X3/daqSKRmlq+w0FJ32eB54IybV0iT4Fm+YRqI9Zn7gHSapnHT3mwf91u3p8othA7w1ysIZMX2qqI4sW0lv4mIQbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVU6hOT4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPDb6wAC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mQ5x4108370
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Cm2chPtn0YZ
	UA3NYLBlCdKuo/PMsL7ChQI3cYNPp+S0=; b=NVU6hOT4/VbGvmLgb7F2damCXKs
	EdL1X7Ixb/YmBtDYtFnTgzYHCktUGHiyMFbwobJDPy5WmJAN9hq1hI4EsqkdUFIY
	Ng7gIe6hK9U+Q9OlC0t5kmUvP725zrmm0xe/MjaYhebSdZzZnLuxY0LY7YxEZRBq
	XL0dZiLYf4l6VOGnwMirC5mLAg2l8OiCq4a6svJtfsI56n+M7V2G9v98mQ+PNNl7
	/5qbNNogG38+XQJjF8aqji9oi/5APhci9A/7YWOuD6nOdo26Zet3ijYOcgmphemu
	pMDGXEDCUEb+mWtLwUXz+XGe6dT93l4weQYItc891CSiuu+jBD5Gjv9Kklg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefukk5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b99eb06178so20742565ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875051; x=1780479851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cm2chPtn0YZUA3NYLBlCdKuo/PMsL7ChQI3cYNPp+S0=;
        b=BPDb6wAChZwYWx9GFrO8yn1aKWNBtEHC4lCmprP/fVWEvUrgoMkRA12yaxJljf2m54
         HBCFwYR8EWhOgCXuvFzIGRnWfZrah9DgGlAitX25jjufPko5FbXDD3CPI1PuYM1BqvD/
         CEjsOn1nI9TNUXMksgmt4h5gSOcqDwxG9HnXnBOD9079GlDrSs40mNKRQeczsXEADwSX
         y+xvYM/PUD1Y2ab7dUQxTFnjbvO4fKhdhsZIdVT4ewg48cCoK/sZDm6zbBE5YGAYKkoD
         RO3B2UBWkl2b5CAUFzbjlqaBgU2M+on8QM8E42wqpIuij1GkEjkRDYsum4xt4qtCzolj
         j54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875051; x=1780479851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cm2chPtn0YZUA3NYLBlCdKuo/PMsL7ChQI3cYNPp+S0=;
        b=hIiVp2MRBTONZqvmCWLpO64lgxRLLLBN7tFNC11oJzSW6J/1kC36k2IdcN6RdVDn4S
         lbQ1SK9SGU0Unl4VYstp+RDGr3yY4nNf9e+pHMIexvw4xBW+2kFvJUbZ+A4639COdU8j
         h7G4OZBki0ZuicuvzUczmT1XyG2RVrclhfDr+Hs74MqARwvd0oYGhl6/9j5rMaveYmU7
         8AeGeOld6j2sjA/+lYm0VPaamKGIg3nwiaU5l2aCgczwzSUT3HHTt63UtabMJ4gyxpnm
         qvsk5yNazZwEIaLRpk+vDu20H/qcQXfrFmYUS5YNcSna9N93/cW9cLr50ubABOFrba+H
         2udQ==
X-Forwarded-Encrypted: i=1; AFNElJ92CLnQvdFD1E5qDaAVozG+Qp5mtKnm7BF8xS/VFkzJs5f0oGw8n5GZVNOdGv7Hxv9qI4dZlR/DuVwifuhG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2WANrYeYb5scx54rNDAmH3lxpud1A2ih1wj1bbJyLNZTQrYQj
	9wXlfceDnmKwEFiKMHM1LsVYw0x/anvnsLezrsmBaYyCpmQ++RpKLyXlSLeFwvtbR7Jxa0THVjN
	ilOUPvAPY+42U3OHSSNNvlnPvu+7+GmrKgRNIH26ZkO09uLfdOmuYmf/elap8G7AYlJBh
X-Gm-Gg: Acq92OG9oEWnlJ/xXGfPPgD2Bc5KqlZQj/AGakjPHA1yMyearCgBn9Tb4SOcVucOy7r
	6y7IyDOZuUkHFDatQigVGOqBtvXc4zw3w+ZykUXAZp/hBtskauagObaY30EL8xwt3QjbYbXBqhl
	dubs15rHZ4he48jDwxA8KzGI8oEABCX4g1ty2sUhWN+lQJ96MbC7GCjFOMA6YlwmjnnW3vbKPBT
	daTXe3G2nzjZsSAR3W2mBym/xiI2q92hySMsI8PVRQUhtEPGiHKphFSUsuXlnDsBY+YzVuMBu4k
	EQdK1LNcZw7PsF3dSHH76KvmzlY8cfszR5iTVTLwulPUv00jKWsj5Qbrxtr7m/7+079X6By6U6d
	/vCoGvAv9Nn5LZdzAQdkkyy1mMRWSVv+vJrLOvlFkSg0+0Ydp4Of8/D1+kYc=
X-Received: by 2002:a17:902:d4c3:b0:2bd:646b:2ddc with SMTP id d9443c01a7336-2beb0375f34mr247630455ad.12.1779875050542;
        Wed, 27 May 2026 02:44:10 -0700 (PDT)
X-Received: by 2002:a17:902:d4c3:b0:2bd:646b:2ddc with SMTP id d9443c01a7336-2beb0375f34mr247630145ad.12.1779875049984;
        Wed, 27 May 2026 02:44:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 07/24] arm64: dts: qcom: sm8150: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:12 +0530
Message-ID: <20260527094333.2311731-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX9tFHf1snsEQI
 bvGVf70izEUs4tG0gsC50Fr+64USVoGCp8nPo4Spqojt300jUPEtATPXwwsjGhBPUr4L3tDNlc/
 vG0UlHjFWdxzsZnIFsao9vY9ed+Z4/R4oBPr/mxvtfMtca+FOdGwpTvvp/9KYJdZdRGfqF7rIxY
 4T1xIWlsuXXOLIjjdroO/WlkkqpDLCPszlNtTd9u7iP7P4UPKAg/NM1qz18rjQl2sbug7yj+3oY
 Zy6WgBbbgKh2EE8hCrVHH6QzrI2zk0yrjj8Mh4VjFPSU17Ne7wv1X82s9ok5rX7Z9LVmMqlVon0
 tV1Cvcpbtb4g0NPpJyrglPWbwubY8/L9dUL3XXOWKQOKChWbbZXBWs+noFrVPMXXSWfF+ofADam
 DMGhj+S3zDCaVOJ1PrgwcXf6+2nAQdHVZoUPoB5L0Es5pfvouXf5uGe66AhpVlR8pp3V9/DcnUo
 L/EbeFDIDHQG2zrpUVQ==
X-Proofpoint-GUID: M--2BP2Pzh5PptUDAdvHgMfKTkdhUzfX
X-Proofpoint-ORIG-GUID: M--2BP2Pzh5PptUDAdvHgMfKTkdhUzfX
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a16bceb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8Zx1J0xfV8yXs1-eAZIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109961-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,af00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,b220000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 363735E2126
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sm8150 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 0e101096209a..661848ef5eee 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4174,7 +4174,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8150-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0


