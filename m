Return-Path: <linux-arm-msm+bounces-89898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOYcF/EEcGmUUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:42:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C07744D265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2AC82B23C95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2929D3D7D92;
	Tue, 20 Jan 2026 22:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHfxDql2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBX+2QBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51333BC4F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946796; cv=none; b=R1nHJeACdX/el0bv6Z3bLqBmWQuunfq8UaUldlG4WzMtfhHVHr2c7JreijXG8+4v+J+gFh6YcW3j5/dJpON9uYGi1as2dWIYLjRT7yKD3F3EGZXMZCOvTuNDWIZHfGVlu1mjx0PFFKuxJGF8bG2HOwbwtOQODCp6UgbPenouw00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946796; c=relaxed/simple;
	bh=u+/+9rnpZvjSQNgRm3KxHlezZWLtIBmTe2/79jLArRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJiwcCzDcA95+7p4mNl001h24DDkpwSrvW5S9bodmJIJZA48XEuggSboxueVhtOkOr493za8hbU0ECZYvLAIB9c1kFZqpHi434hEJaPMPjN3hp573aubCf4XU4pTm1U/Zm/iJzQvOASoP89AnUWBHaJCw0vGlNm6k8hePaFRWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHfxDql2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBX+2QBK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KKnKuh801206
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/lhu1OktkMj/fzAYJtzU5CncNhyb4uT2JsMqcD6BKo=; b=WHfxDql27/yZhk0a
	fKDW8uJvn8sE0HE9kwHhHpFx10CrONNNIYFEK2LVjM4CWb54CRDtIroOC2382QKo
	NEgBBGETWN32/V/GgZaV9G6E0KvaBeF2+DPj8Y8u6AXv0vRQM7J3TTkK4mBy/+jc
	e3Pzz6w9q4ea4ETqyTCdmPHqpLoDytm1gF2PgyzUDS4iSg3+6GbtRxcn6qSshm6i
	W78dc0+VW9jBOwzfK/r2zlvE+jSOKzPkaibqm0aC342GAa3ReXXcZBvAoW8U2Drs
	WpxcujNRpGFK+sPalZ+h+n80fNzcH96XgSOAIIoCNkSV3ZBYPp1VLK8CLcxtcLsK
	6E2vPQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q1tbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c1290abb178so3603830a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768946788; x=1769551588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/lhu1OktkMj/fzAYJtzU5CncNhyb4uT2JsMqcD6BKo=;
        b=TBX+2QBKhAh/PK3tgMdCbTdeH6B4nIEKrJmYRU6ULcafZNdUXoBcflrGGweAosrMUi
         3aPhBuA2g5+sM4byvDssyuqvY92zHOj2l6ZT0t1ddTjxHVvJvDHJuTWJ31z93K9RgUBE
         Df47CMBPrAGd4JyiLtpXu8A9bgOuavSGAc/M7qsumv9xBr74XiAY/+AkHNh/movwALnm
         uGqlpIJne9W2xKwRU2MSCLU6NN/vk7DvB14ALjsz107OGRaX3RYmxLziHJF5dghEd1ls
         Y3COPQCPay46v/s3k2oWPz7rzvhtsCSWauLT6XmJaVMi1Z+79BM4n1fVYHNjYHQ2Ft0T
         8RmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946788; x=1769551588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O/lhu1OktkMj/fzAYJtzU5CncNhyb4uT2JsMqcD6BKo=;
        b=P2GkxLipk8bgyMGkBzikGJYxcAaaxyQs9irtDIl0JdIDusPgHzJ5cfazxXNj9Dc7c0
         X1Ui4Vdq/QzL+fcK66Z6GmIbAkeYDiO410ZHkxci/CQhdS5kLpltNWUDC3E3UM1v+lK+
         +OFvidzceqALunHGO+CMiMzQeni2NPR7kS+DfMVaG8WFWjAT1vFj8J5Rl8eJWA3Jr+8+
         ntzbwpJaEw1hoczeCpqTqmwNvsJhECqKkHvWDebCEP12c9rIu/78860YKcDMsWm1CsJF
         6iY8cxA7p0+6yaAOzE2YmdQ6xeYTpC6344PtAPWunenU49zaTx7XUW9d/xsHN84kXFkn
         vQ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqFBb1zo+AUcOlaQFTQ/VlvGE/xcvRzVMbhD+/mOZw02HsnXUV4YL9EciXBSBIYwgraFfTg+9i8fkFz7eC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1UADVbfd9bSRrXrPHeiF6KCMzhRA1moslpw2ki9ih7pKQwSAW
	j4BNhQAJ+0tL4/eUgEV5R9ldMdtkb3lrSxWDrj8SaKoIqa/Gz6P6IYTh80Ss9iMFMFpWsjoBRO3
	/oAGSugQBFiIEBsP73jYAt1unn6LwjwxyaTizpu3bQ0b2Q1znpMfLoll3/D7MNbH6QKS2
X-Gm-Gg: AZuq6aJD/PynGAMamiGHUaDgdbCkKxP/8sAxlb7E/wtcYvL5Y89b1C1uLcyBwIioOk1
	5qQ4Z0UDA6Q5IqFD8KwuAcsfqWY4uY5CX6CzxoCATuL/ytF22X7ymeWQfB1TvDUkTubyOmUbMWD
	7e2+sASFnidCy2XRoiqPIlw/md8jO53dbGGcoYotbHbhYOS+ERqzkPqSUAbVcoKfz7dPggSLo/5
	ET2V1Lm95YdCaAf/tlvGl+evMa2Cijz/L2NJxaDSthpGac288CcszEFxWeS4ujylGf8boNFpaNb
	SvdNy9j7srt4/WxEUcnPU6Dcsamdc7eSLiT6EA2SEmuIMz1gvMoVvJHvNTrXU3nDMM9E3+vcA8H
	SNI/3Lh7EiyFBpfr08d//rjeRWVQH3NYz2w==
X-Received: by 2002:a05:6a21:7e09:b0:38e:5535:bb4a with SMTP id adf61e73a8af0-38e5535bca9mr117279637.11.1768946787860;
        Tue, 20 Jan 2026 14:06:27 -0800 (PST)
X-Received: by 2002:a05:6a21:7e09:b0:38e:5535:bb4a with SMTP id adf61e73a8af0-38e5535bca9mr117232637.11.1768946787337;
        Tue, 20 Jan 2026 14:06:27 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b30f0sm12867088b3a.61.2026.01.20.14.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:06:27 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 03:35:53 +0530
Subject: [PATCH v7 2/4] arm64: dts: qcom: talos: Add gpu and rgmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-qcs615-spin-2-v7-2-52419b263e92@oss.qualcomm.com>
References: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
In-Reply-To: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768946765; l=3791;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UiwkofKumZf9SEEVAH7lrQqFwDbHX3J4ezRdExFRo0k=;
 b=may0IiBG/mKqcHReuzu+7gkxMYaE9/ibYfx9MhlMl2kdaPISbiGxg0i3gplrX2vNXQBgHlXMk
 OVnOr9BSTnTAN7EPylm/2NoMQI7VWzOpNjHqOX1njQjJxrxI2XNcArO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=696ffc65 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfX9WAoAopxblRp
 AXaNCRId2VKdQ6Tob3QsykSwgAv8STZAbiL0TbCVCesHdbkh9OGeKY3bNmQlgpWIKZp3U821sXj
 z+QwboxzCSeC901tOlgfQoFny+4fJy+4jpAuVWgt7/RmIaRIigVHU0GyEbLVcFWqyCVPkJ1o2cE
 zMh5xUASeT10unF+sBFAs2To6JpIHvsMz/eClYc4WePBuveAVGJCbMkO2YqfaW6vZj1IDs+n7kI
 0QAO0my+RQ5Z4rH4Bf0MnIE7jbIU6qbw/cCnU5UNZvqNmsTYzaALwI+btlHdEijNhD3mTphr42w
 PdO45nJjgyZikO3oLBZnvwucrxCEmhGEi4JNdzbqnSEfrkH9JQIgIOP5BpRPXK8xd8a3lHU4/YE
 nQWSrRximX4yYKSnM1BZF3eaFG0sVXBX91iu0pYpraDBgHz6rHhZsSJ80CD7x3RG1tBXy1WfZe4
 y5+IBAToJQXC7e6QzCw==
X-Proofpoint-GUID: Ixu0BIkQnoqeqRIKNu9Yihf81xI1MHRJ
X-Proofpoint-ORIG-GUID: Ixu0BIkQnoqeqRIKNu9Yihf81xI1MHRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-89898-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C07744D265
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
index 9495514dda1a32e21f53f4afca677dc13fd9cd5e..b51a8f173e1c89e75be2f999ff96fb63247accfc 100644
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
@@ -1830,6 +1835,111 @@ data-pins {
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


