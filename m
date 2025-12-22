Return-Path: <linux-arm-msm+bounces-86119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 625D9CD4DDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C4503008E97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 07:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A24421ADA7;
	Mon, 22 Dec 2025 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggfQWPqA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctdUEu9R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54C91E885A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766388639; cv=none; b=HwibgbVbFwBi7A63/OjQ10E8Cy3Yy9cTf32y5idq9L/5kyXv8mfWsV2iH9YRNW6JKgrud/Jwi+AvZjsy6mI7k7cqKZwCM6H03fgEmj2qWl8Tgi0+18gxXZzxQZpdi1hieOwrbgNQglIfCb3xyMKLQzAo2PYNAsvBgy2MNXADIwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766388639; c=relaxed/simple;
	bh=qW1dCynVSQHJl3GfWl5279VWZIV36Iu0VGCn/rkz/PY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g8P6cHDuD7k49yahViCJiOV+aJ9I6YDW0MWJyrPNwzkywoMbKGXC/CX5osSkXINmufsxnqBBMWy190eNyFAAaz1vy+S7TYLoh7/2AeWUqGtTIjNLYMGbq13URFwUyqU244PU0H6qCTIR57byiPpJcGKXzkSpIjKuivoEDfQ6TXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggfQWPqA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctdUEu9R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLNujOW3503848
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 07:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pOw7S4DuLhrD4R0rtDZpc9
	Lki/mxYUK9+TJeC3HNIpI=; b=ggfQWPqAvYSVn3/W/zZXrc7YEX4p3jliDmzj5X
	5DziLF62dx3PSkspK85TcBF/SISGvoDcCwdB27JvrDtH1e7CWiow5DQkujORQBp6
	3IbU5ZQTNDLo587r/GS+EnyppG8QCS3aJAAVnCCPmHFgAF+XSmiHzT6hD/uUBhuy
	EoIYv8kSJpCCwP+S1Yv81Lp8DTB9Y5kb+uEsBAR8XCAFPyPrs4tVFxOQTnwX13g+
	2vshY65iDoy/JZcbl/pQzd6uVzzVabUzsnfq9zG3KEYCO150NI+QzUookii6EAru
	koo7tJpjhGewaJ4dv0B3fUgph/WuNj1seojXftZDFv+whlag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqm4pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 07:30:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1f69eec6so45839965ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 23:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766388636; x=1766993436; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pOw7S4DuLhrD4R0rtDZpc9Lki/mxYUK9+TJeC3HNIpI=;
        b=ctdUEu9Rn7sJ3Ptaio6helwgDPOF6hSK4WUCN1tzKndS0SW94ZqD5xCm+LEAr6oXa5
         FHwS09J970SW7xESaXb++025OeEnFH0hpjY/WPZlVUDauzyOCYfTvz5ZhNIpGD78vf09
         XqpQGMq8Q8ahSaDMmBk6r+2oEHofB+IVsNAOnx84q2q8EFvpJpyPwOZm+gA5RTgkHGdl
         kbdEm7+4a9BIRsmnauHNGujcj3P+OZSSsH1Ib7hoE98VuDZEz9Kko6SwVjiNY/7Wc4kW
         zMDwGldw+nraBUeHME5ZbXNwaOf4UdAF/JooULLinXM/qZzAOavBhuS2sI94qnt9nan1
         fnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766388636; x=1766993436;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOw7S4DuLhrD4R0rtDZpc9Lki/mxYUK9+TJeC3HNIpI=;
        b=YhjFlncymaWjna9Su+J+++DHE6ybcqpncP7/qRVWQFz9tgTn9D5nIZ3Ge8uSHNILRJ
         j+7oIhHS0PLR6KQ1k20H9QN7k7Vk36QGd33XkWzwJ2ZgIvkqYlat9cOXhrDiEFyBs/1L
         +rygl5FczcKKMAF1z3ro0YivMcF4lCFq6kQqZCynMlluc9p3Wk4uBGVNm4w1Guv/AMSa
         HZuKx1J3ghDLW7klO0wZGcKIX30nrUDm5/BprQGeFOnRUnfGPROks6PU8ycV2k1Mw4HS
         3Y9Rk9zpNR8aoWfru7WYau6o/y2Ag1fUQdhMhDG3XGmdhyEVjXam0iId2T9lHuAsv5kG
         edjA==
X-Gm-Message-State: AOJu0YznemA1ZcGDVb/CXZFdz+OmUfDA5L1iJOu8Oqcu8+YB5qKJxnm7
	0VygZXdPuavld0Z+Be8qexFLdC9DS3NpFKVZOxoedUO1+jxUocQajyV/1U3+pub9m7ectHQq3J0
	1xyGOeKALxhFB0KCCGN7ElFtVWLP+3n63ZQtuwTUKcJFkvIQUjIrZzd65Zp3gX0qkTfsO
X-Gm-Gg: AY/fxX7rmTwRy8UVrzApl64LYYZRj/iBJ+P2xw0uWuHDgOjoWWzj6tvN/YSpbNo4UkC
	xkXeH/zjC4E0QvcVxyldrszCYGSRTC/ZqrHcMByV4g+IU+yjPzWOtV1poKIhGb1+KB8taie9B/z
	o7uE17CAe+LjTyEimiU+gQW2BTNS4li/vZmNsMZptKDp4bSmPRNOp5OgpsfFa7juE/mxN0ivKH/
	tP9buKpcpUwSxITPP55d+V+rdNmCKppGkcc4ERcoyNijlPZVba+3FHHStsnupPX8qU4nSvAnRuj
	/MU7MbSG8gLWVqkjtQFGwviV0K/7dA2JO06XIiRJG77qy3BoUa4lVUWu5QURZt93TxgbzDq72vF
	PmylyWN34vazn1j7iBlbSHHZoVHoYm4SLbcAAH1laVlSosVo=
X-Received: by 2002:a17:902:d488:b0:2a0:9b4f:5ebd with SMTP id d9443c01a7336-2a2f2229d26mr90282675ad.15.1766388635674;
        Sun, 21 Dec 2025 23:30:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyG7vVnroKfDbK+1jLSNTAu8S2yVfhu3vCAJeQSMcNFKnEvbSuRLlnUpWEfy50d5f4FVP4OQ==
X-Received: by 2002:a17:902:d488:b0:2a0:9b4f:5ebd with SMTP id d9443c01a7336-2a2f2229d26mr90282335ad.15.1766388635179;
        Sun, 21 Dec 2025 23:30:35 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82a9asm89052925ad.30.2025.12.21.23.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 23:30:34 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 13:00:19 +0530
Subject: [PATCH] arm64: dts: qcom: monaco: add QCrypto node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-enable-qualcomm-crypto-engine-for-monaco-v1-1-06741d6ea66a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIrzSGkC/x2NQQrCQAwAv1JyNuAGdKlfEQ/bbVoD3aRmVZTSv
 7t4nDnMbFDZhStcug2c31LFtEE4dJDvSWdGGRsDHekUiAhZ07AwPl5pyVYKZv+uT2t6FmWczLG
 YpmwY83noQ6AY+xFabnWe5PNfXW/7/gOcjSa8egAAAA==
X-Change-ID: 20251222-enable-qualcomm-crypto-engine-for-monaco-7c6b9112779d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: SqXUlk5bXhKw116psP-a84XBLmqsSY3W
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=6948f39c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cVBMcqNyiYGVgfMZcJoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: SqXUlk5bXhKw116psP-a84XBLmqsSY3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA2NiBTYWx0ZWRfX+FWW+Rq5IsG4
 B0Ahlf7NDkh1d8osKeknSBMxIwt1tzmGRHNG62YrHUYl87yMyy+5MhbF7KHTZ12KkX00yIfVkDA
 c0R09wAHTZAk2bBKgZvJLzbwG7XuyTLc4YVbh1d/t9LOPZoxNYOc4jm8u7FXGPXJIbNMKuAjUmr
 fIano6uHC6/WPsKt6c2v9Pgj8QP4k324THgQh4fgrS83tpRIROR1QJ7o/KSQafJGro5aB+ckN5y
 lp+9DKXrT5JablJzWsdheiEU8H7i0wwJxNKcf8ehrt4UPoOOGMl9ZN84HkCumVGHYbedbv+9eb9
 HQBYubKgXjj8RUDL/vC7tolQdo025u0hy/ONzp934zuTcy3OeHxbN2DiU5OjmrHbfLKPeegjqS4
 pxdh11TVXoI8ckIL8SKCczLns08zouyE+SQ7mI+/uBRDC1ualSWS8W8eoynXxWOaj2S+8qrF+kh
 4WECn7VnFvjp8mvUYMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220066

Add Qualcomm Crypto Engine device node for Monaco platform.
Bindings and Crypto DMA nodes for the same platform is already
present in the tree.

QCE and Crypto DMA nodes patch was applied as part of the
commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
however was reverted due to compatible string being miss-matched
against schema.

Resubmitting the enablement of QCE device node for monaco platform
with compatible-string being aligned with qcom-qce schema.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a663b8ad176f93d2f18284a08c3d1..dd0b9ea27fe1cdfbf6aba07e98183871be7ee889 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2350,6 +2350,18 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,qcs8300-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x480 0x00>,
+				 <&apps_smmu 0x481 0x00>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-enable-qualcomm-crypto-engine-for-monaco-7c6b9112779d

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>


