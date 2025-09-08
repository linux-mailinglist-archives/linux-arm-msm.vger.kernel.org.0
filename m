Return-Path: <linux-arm-msm+bounces-72653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 600A3B49A3F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48DF71BC3833
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16952D2489;
	Mon,  8 Sep 2025 19:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDEelVb5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2014B2D24B1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757360449; cv=none; b=Hg1rBWj9wKky1y/07QhAaxXbZAOD49W6kqMjpGQQNZrZfisNSGOpMd7UO9Ce72svknf8y9XQqmtqNBTj7HAcfwxoU81dHEBCY15uRxVUbvR8c07Mhixsy3RGlAKtpbGXUOu3maPS+jk/NJRs66Kh2HWdtbm8rsVEZdawV0wq4/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757360449; c=relaxed/simple;
	bh=9bfHDTw8kTerdOD9ddHzM0+SjSgjN/43Tp5eBUWS4yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svvxuhy+P2rjotuVmSCg3A2Iy/THufjrArtrR0tnSdvUeX9ao8LRiuHQVvHZbnrfEP+HYtXosYn/vBAJG1LaD+cT5eZQYTwLHSFgD1vOXK8LvvfD7AEBCFTc3VY7k+xh+QzJG9DTgiwaL3m9zn2K9z90bjS66VJ4kXwhewiz7/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDEelVb5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588B4e5F011910
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=; b=EDEelVb5QOzbOCtY
	x59I1bFXpz8wZOSNVjit2YR8zEXrOvhG4AP7cPiAqCWidY1AZX2gP62OOHA2Kjrt
	HENFFz5XBpfBDcJXPW64sFPgJR1Daiu4IA/0h6v2mFwViQ0jzpgdJS75krpFBQJd
	+IXRDRKK+6nr/W0JCZgE30ViUU6PApFyMsqLsAcG2ts8aoEsl9hD0bn7wRdL2adU
	7HIoq3msOSHaHq/VsEzTEwCivP/lbFR4yivjbZsAAuO1wPPl+HDVLuzJma9RZ/Vu
	ti4ID6BdzdvhKZ6UDlu+MZJ3fWnthZjrNPlhKe8X2TRRQswEvpwMv5lfvvn4BAF9
	IU0MwA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdtkrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 19:40:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24ce3e62946so68555315ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757360446; x=1757965246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=;
        b=roJun3WVBqU2e6idQdhc7zw/Jw/vOyEPS1QabsorfwqowmZYfotu3C/4iUBxQzK0FR
         6ukG9bdqfgE4r93LohejuDMwJ39/EOtCC0CERuFp5IN787JRo54kvUw9RruEWVlwGCDK
         ks16wiA2gq7L1GSftPiOvs3NibHtmgrFAPgsNojLAwHVCcq6El6NlL2pErpZZ9oHmkKD
         YobKvc0Dqg3mDNHViXYd/Ty74InFhBtJ5QW8tvjEUkK1h7K5FbILg0AJLMuzrnBM0sMI
         Pl86kjG3Zi2hVF3roO3O0CT06R3zuZ7ZUH9fWqs/aV6uVHQHQB5l9q0dORI9wG8fwG8W
         FwXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGnhjoGOE2uELLq0Qbw3Ppnr0TafG7AU+tztqlo4ja5nruJeEYjT5hr7gOdY9QqmfyKK37+sNZfAqeM1vr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5TyCNGojezbT7uGD2QE4vd/GhN4UohLoWSGGULrJPHJkhdh8V
	uHnzue6QIxl2lnKjERNPj55WhtYgBOF7mtXjuQFmvOhC+sHZbgHJbxfRk9R+LspHBi0QlyDq+0o
	BBsuu/pOM28A5GnA0w505yNXFdWcuahZea5owyq/WAVAL7IxhKwB3nvC7ZPYuQ2+zVvFC
X-Gm-Gg: ASbGncvsQVNZ/mjwbgVerGrNAc9mvDwi4KrhedEoBDBIfIlBORxbUsMuHgHvLdxnTiJ
	NI8MyXM7Ge7WnBsXG6ECTLH32tXMjjYqtjaJJTnovSjzz1z8/l9ConkwE1y6lPvLATNuYNXH4Hw
	6RE/h2bhs9y3Gikg/RlwF5SQtwmeVkz1DYjDPLVkowbJFyVSeXYKaFefE/lV/XTwOO/Z7XJQ3RQ
	sQKnj0romAt4CXoxYy/1oo+41Gpex0kMqEojLvrvQliyIDjvptS9Uz7tTrnGb/nhWyKjhcoz1ww
	E/y6AOkY8aJ2L+4DN9zn0ZVNtZQT2YrFPXNuMwg/usVfirexJtjtNCbei/JdjwcX
X-Received: by 2002:a17:902:ea0e:b0:24e:bdfa:112b with SMTP id d9443c01a7336-251761616c1mr100018255ad.61.1757360446344;
        Mon, 08 Sep 2025 12:40:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+9JOK8BMb3sXLnKBC+xc+bC3hh8II9OXtGKKTgCzvM+sstpMkCgxC9RzDwJ1IJu9Z0f7IRA==
X-Received: by 2002:a17:902:ea0e:b0:24e:bdfa:112b with SMTP id d9443c01a7336-251761616c1mr100017755ad.61.1757360445770;
        Mon, 08 Sep 2025 12:40:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:40:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:41 +0530
Subject: [PATCH v5 6/6] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-a663-gpu-support-v5-6-761fa0a876bf@oss.qualcomm.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=879;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9bfHDTw8kTerdOD9ddHzM0+SjSgjN/43Tp5eBUWS4yw=;
 b=ipTZYtF2nW644chXYPKQvMmaRxyK67TXes3EoDWwCmqC0y+G+acBzHYQk8Zq8DjgOEkmPZRFG
 YeSNaDji+duCoUv05rfDBL8ZXrVvNvt5yi8+ocBBT1XDvOeaIWoSyp+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: gx_ohVEq73LmY-efBminvoSNCJg21r25
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX7eytOMv6fVrC
 bP72nbA7mwZurJ4E2J9cv9w8Nqd/x+mui2bOtu/wwB8wj1Z4USySfyo/VwSKnz5ez+05+3yVtvl
 LVCyj3Nk7NZ3NyiYIt/vRxX6N7SaMQUdxhIHVLi1vYSfMBDZwjZTp+fHuxr94uyepu8twtxOTen
 1hkt94Kyir5Rn7/UGy+6NCiccl9b8uSMq/oivR/K6QwyLXwk/i2yDkezYuN5evfklGpRl+4h6Io
 GJrHRD7NOoL7fNeu4y5BurWaq53c3DqvlGPzk7FtPTtyCkiCSZW7ZxQ+w+LE38/0Zg1BAesYfGx
 PrGa+UpVV4lBU/57cuL+y/DjxuinyJkNhyZXpQVYfzfcwjgnn3Eohdfi3ZGyw0jWWERKAynMwgh
 s4tN3IGF
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bf313f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: gx_ohVEq73LmY-efBminvoSNCJg21r25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

Enable GPU on both qcs9100-ride platforms and provide the path
for zap shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 25e756c141606fbe0876ed48a54809b372650903..e9540cbff78ee44d6d92de10464c660a05a68db9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -436,6 +436,14 @@ vreg_l8e: ldo8 {
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
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.50.1


