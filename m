Return-Path: <linux-arm-msm+bounces-97091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIjzN4/2sWkqHgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:11:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 146A726B38A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 395AF3013C85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC853630AB;
	Wed, 11 Mar 2026 23:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zfdx4vqb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFvBkwUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F363A1695
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270666; cv=none; b=JlbasznZ3rkMkRmhEKDVKoEadzDffhF6TvSyQ2mFUlCaXAsnf5mIetNYPx+e2AMtQL7pux1yfNNeTafk29Fw+kxVDJoZhVmqLCx/jfwIuztvzWZthd9eyHQeSqlAuhjOcygghapuwWqWv0o6qlqp2SVD8l1etxoW1cuHvywphEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270666; c=relaxed/simple;
	bh=SXa+mau3jfFMiD1Kcdi6AkdYoMxzyaecUcMaLamI3dU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8xvjTZd1IdcouIi97QBQaa7oj1BfyyrTZFK9Xmd1erZg4cAy1ZbESgPVIaUkQGs57qlAJnUyTjYw8EJ7rQuEtFTUF1jHJQ4M+RHMLLmkMSVBPXf30fMyILrKl5lR+VA0CiVALp8vWy9/2fVIEEYxTsU9MP1tv8gTujqsO8TeeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zfdx4vqb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFvBkwUv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMsYk1059203
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jKDL3cImGEqTtnfi4sYSODQFZNMuhNOHw9FFCw66hPg=; b=Zfdx4vqbYExZBvug
	EqGbwHHNQjoiRQ5eor9uc0BlPdTx4ZyaKwbd+pxO5MiVKQ+ueohgDFCUURryAuiH
	3byxH7w0BHER47HNwK1PoM1cG1CF8q8c0lEn+HiO9K8Ccf5mwJz3vgbJFRwm0O0C
	zr3A3tby0kACI1LnXU3iLGeX3FbFld3cxgv/Fg5YR1vfFHU2+TzlPTA7q+CTaNx5
	fHX98DRW8RrSQYe2PiidXAGDpZrzwTU/NaV2087MCfJAOlFz8IvLl9Y6wPqI48Gu
	QBGQKY/H5nhrJDycS5TR4z/R6yC5ClhxeDordY+/pgodBr342twCCEcxNSLf8myz
	AJPsFw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wg3pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:11:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7387c70046so176756a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 16:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773270664; x=1773875464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKDL3cImGEqTtnfi4sYSODQFZNMuhNOHw9FFCw66hPg=;
        b=SFvBkwUv6iD/CSSgoCgTCI0iW4w6n9dBI07yJmh5RbzdkSvDUo+U70v+fM6kwfoVnz
         4teF52nu7mfqIz6nwPxH8o7rfVlSg5himW9RPct/FUmny1MsVSQvu8Gj5aeMbK5waLWx
         Ew5lIqkhko3Mt+aL5GjR5DgnVayed0i/7hleEIUOK9BUNqy0fmG2u4i93iRjM1/8q1qI
         11fLf6hYvA2wiWoKojDzzVUa1Xip0QKM9W1+JnoYVgVOsAI0sS21cJ6Ut+aTjTH2WOm+
         J0TYd8fUO7Rift9PnC151tdLCQNPPMARdvM5c+k3DDdAsXc1iru/3i8tLEy/G6z7t2qL
         /How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773270664; x=1773875464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jKDL3cImGEqTtnfi4sYSODQFZNMuhNOHw9FFCw66hPg=;
        b=pz9vxNgKOYkACoWGMeRSD4ql78yogPLEOtgwU0ZSd4MMMaxGtcW3mBZp39BOUE15jq
         Sejn2OqaEzRbT7Scw640Szmimvz8OUnLYxRTLyerYaKE9Z7LzAc54uq6PnW9lup1mQTS
         6Ebc+1N+PQasZMA4cF8ck/PjLN9ON0UPNBD6Se1msdJ1StUWwKM6/Av38WfjfezzbD7F
         8IEvMaAmjw2D/uHCg5zqmTDHc+38clfOHxL+wsoTPdRaIPWNwJJWT68cm8ur6Alkc54Q
         tigocCZX9pZleafDQjlyi3HeQXZLUWV/lqOlGNcK9hN4hZYtaCFKIfGRUDjIRjtm3S58
         EYrg==
X-Forwarded-Encrypted: i=1; AJvYcCWpo/qKrX5fHMp7k/dAX30CeD8aL1OMD0u9nrJpGOovm/5SyRL8JN5o86OQ+fBqSkjRxpRDELOA2EXoYD3d@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/hpYXIQV7C0/hXdL64MiXDGdy+G0BhX7hN2QiKsy+i4j+kYjZ
	OZsIQFPe/fy6XAh6Sma9hPLxS3T5cJrXEJzuSxm6ru3/FG/S+DZsuJzgG53xY25jGYwHObC/gWq
	YYrVQbJQBhytnc9CWaOuVx5PNSmAmurCEC43tHc9Slq02gXdpz+Oqbf5sictVuW2yST2F
X-Gm-Gg: ATEYQzwsYWSR3RLFY8kTNd4hh2n0s5Wn3zUZndFlsgBXL92fgTKBC3euw7QDxMpr+Va
	8qNziLOB1zAP+/616zBBxIHFk2yN+f9zQZEJiD/Nn2QM3t0cWzViUpcM4syD9aHxKj/XgegsQsA
	8HO3wXdFLXbLbUF+bLk4ail4LrY/c2/osV7Gucm/5RnOGVx92YJIm6xYNjLlFZa+vmGX1BT+qUi
	jtbqTkGcsb7CC26mTb7vVMXn5sA8Tc2lU1TDnII7namPIRjnfWX9tLLc2duLCZduYjYX/J+TgiP
	/Y+N8EB6xiv/LmhtGCUEqT5Vk9J+2j2WtodgOWwJm1Ot17DY0LNbh6aaqW7u5e6eLuguep9lqxI
	Kz64RdQ8itCzKz5lwKq3T3KDCIlJJR22c05hWlvgw5a8a/w==
X-Received: by 2002:a05:6a00:3d54:b0:823:786:1990 with SMTP id d2e1a72fcca58-829f6ea729amr3871128b3a.21.1773270663964;
        Wed, 11 Mar 2026 16:11:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d54:b0:823:786:1990 with SMTP id d2e1a72fcca58-829f6ea729amr3871109b3a.21.1773270663478;
        Wed, 11 Mar 2026 16:11:03 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725facbsm774569b3a.20.2026.03.11.16.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:11:03 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 04:39:54 +0530
Subject: [PATCH v8 2/4] arm64: dts: qcom: talos: Add gpu and rgmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-qcs615-spin-2-v8-2-fca38edcd6e6@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773270637; l=3735;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ThNycDlDHq3nbEQXKh4EQ6jtaESo+ZYW37OSwdG7k4U=;
 b=g9EZkQTBBCqrtW4WyC+DqI0IQ9rqR/WvFul0l/CWgBEKPjE4HchA5IosgCf7n/98ZqCi8zRHk
 t+6ldc27MN4CcbpnviDtkk+cHiio/KxWdbj4dhFockAAvGdhwWjKKu3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: otFWww1liy6YjYY476AmaURjxH2sLlrG
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69b1f688 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: otFWww1liy6YjYY476AmaURjxH2sLlrG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE5NyBTYWx0ZWRfX7s59z4lzQ1nq
 N/COei//7SMvOhh6P/Ri4Z+d0aoS5E2v13QHSmJbcftbp9GH2ituWF0B7p8hg9X8YX5X8aUoW2+
 yQkUs6kGLk3+PwxHpERUH90Bw9I8Y/g0wEgDw9k8YoouwEL9bZ8Su5TaPn8bqxIcWqGYNHndPwY
 uk0RTRO0U8KzrSsIEQO8uVCB/dYTA2gIf55kG7w8TweGsKhmjvJKHJtiI2m7cfPjoaDVUW836Nc
 lO9v2JmW5ASjNkPitBFDk/8TbToKXcfZAW1Bc5xkx4M07XBHviQw4Fw1nj1e3kBUJZIJ2yHJ6lo
 Q+ICD09uvIm2szGJQYe6nDxC6w4Z7dHZe4pV+P1AeIhUJ6O+qFc8dsGbBPHUqLxe0+W/Pw8C8l3
 uzGv1umaUF9W+Nh9wYlKr4XGM/x66QJPtqKd0PoKljvSB26sqnnb1CZpkJelcd6Z6olWviQkGMr
 iG9aVmmq/SE/l7aVJXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603110197
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97091-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.76.75.64:email,5.211.3.56:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 146A726B38A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jie Zhang <quic_jiezh@quicinc.com>

Add gpu and rgmu nodes for Talos chipset.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 110 ++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index bad57592f63f..11689da96c96 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -651,6 +651,11 @@ rproc_adsp_mem: rproc-adsp@95900000 {
 			reg = <0x0 0x95900000 0x0 0x1e00000>;
 			no-map;
 		};
+
+		pil_gpu_mem: pil-gpu@97715000 {
+			reg = <0x0 0x97715000 0x0 0x2000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -1833,6 +1838,111 @@ data-pins {
 			};
 		};
 
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-612.0", "qcom,adreno";
+			reg = <0x0 0x05000000 0x0 0x40000>,
+			      <0x0 0x0509e000 0x0 0x1000>,
+			      <0x0 0x05061000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>;
+			clock-names = "core";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0x0 0x401>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			qcom,gmu = <&gmu>;
+
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&pil_gpu_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-845000000 {
+					opp-hz = /bits/ 64 <845000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+					opp-peak-kBps = <7050000>;
+				};
+
+				opp-745000000 {
+					opp-hz = /bits/ 64 <745000000>;
+					required-opps = <&rpmhpd_opp_nom_l1>;
+					opp-peak-kBps = <6075000>;
+				};
+
+				opp-650000000 {
+					opp-hz = /bits/ 64 <650000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5287500>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+					opp-peak-kBps = <3975000>;
+				};
+
+				opp-435000000 {
+					opp-hz = /bits/ 64 <435000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <3000000>;
+				};
+			};
+		};
+
+		gmu: gmu@506a000 {
+			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+			reg = <0x0 0x0506d000 0x0 0x2c000>;
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "smmu_vote";
+
+			power-domains = <&gpucc CX_GDSC>,
+					<&gpucc GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "oob",
+					  "gmu";
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@5090000 {
 			compatible = "qcom,qcs615-gpucc";
 			reg = <0 0x05090000 0 0x9000>;

-- 
2.51.0


