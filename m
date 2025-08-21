Return-Path: <linux-arm-msm+bounces-70221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62485B30280
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 20:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 030D85E661C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 18:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126763469E4;
	Thu, 21 Aug 2025 18:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTc9V3v/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC2A34DCF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 18:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755802607; cv=none; b=VQ2UolSm9lq3c+EDBoA7WsKKokej+aa8T52GoS9BazTNHROMnPq9htqtWLkhSPfSQJiA9nek3kLJMneY7qnVoV/WICnDkWPBekaDZ9u8/mP+03MZaqnV6znE03UOf+PzIl/ZvXoSLWS0gl0vwfG/xqm9lQ7dWNyFe6lN+DKOOsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755802607; c=relaxed/simple;
	bh=X5/b2wPl0B5JtiyqdyVNBvFH6QvvW/Oc2oH1DyatOms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Myj1lw7djbkaeLInDUJb0fCYrn3viTLWyYJB+ZPjerg8jwaC8PfsAQBT4QNPCkZuggwrMo8hRjyclKUTp16HbIC7S2lFgzPSuZNk8A2tgz1hesw7OBCGc19rAY6JGu4IRHSkLkRwHAFi9cDJgWVIwlrm2/AZHvEJnBc2gPNPiBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTc9V3v/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9JLO030122
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 18:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eyjmrtt67i/hSgA8ZAsqicrziXjRyLeDwvFEX9xKzs4=; b=XTc9V3v/xDZMNumq
	p5UbMbUr3Ey8ZhRVv5Z+a6mul442zRqvNs3CcT4ELBh5rmpl71dIRShNMtEKUgd+
	rYfJGQmuPqPFruhCYPTTmUZ5PrgNGFH0P4D+RjjeNpGPqjgc0M0cT383CVE4TSz/
	k6YoIcyM+Dm0/gtVSN9zBZQ8rRbkov/8z3qvM22WmkDL4SDaFTQI9oX7mA/keeez
	I294uWhwdq5dCiwcpUvzStDy+ndmwS0/oRxMd000GcbKra5PkWL+jIRLlpQbn+HF
	k2Uj70oTpsrks6m6qOlpgr+F1atUVMO1xs4E2Ak+QZxccrykdeMbuPnJHQ6mTz8g
	J8CXlQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a6mmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 18:56:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4765bf9ed2so1058498a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 11:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755802604; x=1756407404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eyjmrtt67i/hSgA8ZAsqicrziXjRyLeDwvFEX9xKzs4=;
        b=gfFIHZhk2qDyPH537HI4ZX/r32v+iEzVi0ml/dp1RyUO7wHaHEg4mbWjHkndCwUaMV
         +Grna50GuAG8q9PGl1ZXDW/abl92eb9JasiudyQPxrB0wQhqisrEqZa8hyivNk3BwWg+
         1L5SHkzK+SqMeByaj59+MYQk61L/ycm2/3uMH9O4qm2pbYLrnx2suf6LK7x0ewOPhVvL
         b7XNxlM0YOgEmvmE+Fs4sOtVX075uW8BBhntnry8AwQtDxR7YVpa5iKw2AphFpfjggGK
         FysaYmecgqN1lvpds15Awl4w8gPahi29rq72hLbe+0MnRyfFVkqSH7eGV3rkDANeiXx0
         9Q5w==
X-Forwarded-Encrypted: i=1; AJvYcCWJ2D2mSSikfPFutzo5CUakriv6nmMD0Z9BqxmpkuMvnz2tXo6hfoxZcDUJVTIUehQ7bwkPcmYn+0w8TYqX@vger.kernel.org
X-Gm-Message-State: AOJu0YwVIcPXDiACZ4wxzINDiDK1XsZIcZIbjpBQ7FNQnOdNqApGcLii
	EYtafCG3tauLaPJ1qgk8G0eXHz6DeDG6nnWOQC8HAt5HPJA+/vAXkXZt5q8g8jsAxGyIxbGDn21
	6GAeLz85Js05pvudn9bym058cMd75Z26fbks4j1iOyApQXqqReRu6cHF1d9k/wqkMPw1a
X-Gm-Gg: ASbGnct5co/hanyu4dkCpEXEgJtBeD3BcIe7bWmldvhigciPg5Nl1xTri9BYeNdnmyG
	7IkpAcWFBusztM8zd80EbYek34VdRPPoWYZ4r69CX8qgFLyiSllFxPr9DqIp+ZoCLjmbaFChYPx
	U39ZxeshcgUMLI/yOZ0LyX8CR/XiePMGzU5PLjwl3RKuj4cjj2Kw+vu7ozNj1JAzTeZdc7c9zls
	5Jt2MT02Hi7y6PBSjeRDo18C9hyAQBPFY90tzWkc6huI0aDetn20fA8kKaecf4rAvRDAAPnped4
	l/PPVLwThbU+83hU2Gg4H3NxWbRt7Um8RO87L/SOrkZGH7d3gu1egzCf8i9vqZf7
X-Received: by 2002:a05:6a20:394a:b0:206:a9bd:a3a3 with SMTP id adf61e73a8af0-24340c3a714mr325129637.24.1755802603767;
        Thu, 21 Aug 2025 11:56:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLnv9zIkKigFMRZ5cTavEVxl0hH0Mk1mEGvhZ0Z3VQ/d704GnW1rvvfgCrrEv2z/W1xLZk2A==
X-Received: by 2002:a05:6a20:394a:b0:206:a9bd:a3a3 with SMTP id adf61e73a8af0-24340c3a714mr325089637.24.1755802603354;
        Thu, 21 Aug 2025 11:56:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:56:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:30 +0530
Subject: [PATCH v4 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-5-97d26bb2144e@oss.qualcomm.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=735;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=X5/b2wPl0B5JtiyqdyVNBvFH6QvvW/Oc2oH1DyatOms=;
 b=mTcyCQXosL3wdwNsliBAQNXiroFwDZJGSaZ/bRV17fNt6HD7Zn9Y93qTXO6bpukLNK3gl2S2/
 L5jxBVtbKV6DM+Sf2O9Nz/+8Zr39EA/mNiV4RlT0T38+vpD8UVxN4B5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a76bec cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jbU5qkt2-FsioPMlu34A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Nqi4r7QnJk9HjCDSGk12E9gkdEY-c9PX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9i7sJLRsLJbq
 g1SIt3Ugvw4jYCldxH73RJ/1Yovy9c7OB6gpI/0IfdRZNzulmvqzXskDfsxnPprYaYbyGun9khj
 KtZNyyLvzzD/baja2h6yc6CK9HLb7pRPnlvxUnb8nG8aPPQN81Xmw2EfevaYqGQLwH8lTCBj3S/
 qhtWnQOpeo1nhi22CuAPYZKP7hOHpSfbJSeyIF7UUrJWf47u9Y8Ge/6jeozdU9Po4JyJ7626LdH
 nn6HjxbLhuEs/RguVI7xr18mSdqXSZ1Crxz6cA62MDCCRAUsICd3+92Vo9XFF6uU4M1DnC0QrrU
 kfhD+ao7awoeJpH0XkjYq3PGr/3jSUhXeupBgjJbJfAxaXHul2wvugdq2wW0l0QaXM/BdYb7YPg
 G4tq/SZD0GkqnCj2hIH4uxJ+YS0Ctw==
X-Proofpoint-GUID: Nqi4r7QnJk9HjCDSGk12E9gkdEY-c9PX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Enable GPU for lemans-evk platform and provide path for zap
shader.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 669ac52f4cf6aece72141416068268531fd9f79a..876f43d761870b968e43ea1ecc360b4403f19fef 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -253,6 +253,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };

-- 
2.50.1


