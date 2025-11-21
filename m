Return-Path: <linux-arm-msm+bounces-82793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDF4C78438
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id A28392CFF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D83034A3B0;
	Fri, 21 Nov 2025 09:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUZKAFJd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtAqXxAX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1688349AE6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763718872; cv=none; b=FuGA7Re8w1KHgGgTsfk2ODJn6/uAaSxUxmIOyNgqNnW+WkcQr55wHeEgXmU1VujtvpSSnjhiGck42e2JH/oHIwp3G2cnfAapWLj5a/UFwXhopcASXq/psjOspn8W8bPuw4P8D3Jj7OX4Dw7LyC8iEScesEorDCPbISmnc2oJpRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763718872; c=relaxed/simple;
	bh=lcIb10k63srOGjA52ST27WwTXABGn789XrBKsrY3Kqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0AGS/rlLlb5gYverJ+S8enG7ugL7HiRZ4xcQzq4TChB0+DpamWOw3/aWaDQPLS4+mKybvlrbl9yioF4qwDfxR0vei/xGlJIBNiflL+kK8QSjHE0ga9mbC2Yaoz1jNrQJ26gInRsvOaDTRPtMTjgVkiKIjLfZyVBmCccamy8q3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUZKAFJd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtAqXxAX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9SYl13541419
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Syg7yKpdvMcxAxhOLjJIJLzE5TOYLMuFON4SNxoMdU=; b=DUZKAFJdbhxRXjZf
	xopDlvQAk8kJQ6puvoc7vdY9f/fem7uUXISWXIs4+7u0SElgNJ5DNNfljd+pgndt
	A7j2EERKuvGDh/VQD3R2+qyTvdEjN13Q9ihud6zzfif4sG0ou1hQmhboRasd2Ndr
	CF4T9irpD82WoiQG2WQh56GMl42uBaa9rkGr8oDMl8TTN5yqAggoZ46hLTOcmrqW
	mIkXpdpgwfo3A7VniUtVMeVzLOzebZPK9IZtcg9ErQ7NXTwMVoszSqAnt1DPZMYL
	ZI6Y+uF3Ts4jhaaE1k9c8eYiB6DOwWowaKFf0XRmDTAAB++vLoGgvEN3qMhu3yvO
	2ww22w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajng003br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b969f3f5c13so1843694a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 01:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763718869; x=1764323669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Syg7yKpdvMcxAxhOLjJIJLzE5TOYLMuFON4SNxoMdU=;
        b=BtAqXxAXA8L9T1KoZKw5fR/2sBYjSGrQSydRAPv7x9CH0rEa5MlTGVxCURzYiocXR1
         PI7GMFnVIMb++yl2mfuQnMb0T9s17MBps3+AL3vD+as0KPkzImiFCMn7JQQZ7Mo0X61P
         gN9Xf3e6QDw7Q7JOZX31FK8tN50BF3eBbP2yf2OK/pMWuNkEaXGJxn/EQaf0VVFIUClH
         4/fpjEmvsV79H+oc74zUiBSdgKnia9vB2u4hpeoJzLsu4btt2XRl0iSmAu4CfM/xysdk
         kRMPR2VAcIAa/w0T9/cOBxdSvx5rgl2V31su2s1IEgCzsi9k8dk96hUuNUuFFVP+YgfQ
         iEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763718869; x=1764323669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Syg7yKpdvMcxAxhOLjJIJLzE5TOYLMuFON4SNxoMdU=;
        b=cax4LrM/V5A/N2OzBPAO+T3vQswj1adAK1tfoaB/JjJEuXIsJ3/80HyxiCZQi8Wm8h
         A5CTFziR7u2n1AU8gq4WiQ81j1tKv3FDTJIlmxkFOxni+TwMFR2u7VBqJjmbmTDaobES
         OqNIEx2YeJetb3NWeo4oy7iJEB6BB7tXOZzh4XK3ezeg6FuFjNV+ovfGUjyxf+PhGAOH
         /8aTgw63QCKrUXWwyBf2t/cu7QkWNWLj6Y/lurV/Zsik6nVMcrs+UYOIJmJ5LxkICzJ0
         hRgDkQrQ7N08RsZXgb+LZHZPWdq+nba5FijgMKPvWtuBurswgwmjnzq2a8pd3TZKzmZt
         CEfg==
X-Gm-Message-State: AOJu0YwxMehpqVFSnHdg9S/l5QQgCKCjcO7j5p4gPXyD6NBauV+2ue4f
	UnUK1j99fbo2ksmhFF8DdMmJodfbfF6+QW8mMjxsuWGh288kZbKmhebfqgKyJSl6VTXPtiJdCHg
	W2i085OcDznQImY5Gkvv9eRfhjIc4U8SF3UkPTGm1VM7z0Dy2q72nuIfehKvB/eZXjblo
X-Gm-Gg: ASbGncthIWj+UfLeQoQ4uqh87+stAjFDBNy78CHPv/QByCrL22IcqgkD2At169QnR9/
	yaqoFcEbTsCurwSA8w+lSQomJI8od/Uo5mmNFheDbQyKBSJPyWnTrhtbh5H38K/vzhkypomUZ46
	i5rcr6VdhShzq8dFXFHoph6vBbHanQ+t5xwsYnZcUIi/mdkCUZr8aoQuofB0btjGqLGLMDqyYir
	daDPUnifkkec8pUqwhN1Lu9GYfyeHLWGqORHwsY6PSd7AegmRy1jgirVOswinJtNk7Xn+YIigOo
	5GnNFAG9zAD8JNdaKsxQrI9ZumoDEEVG6SIrDO9skC15BABDdiRof6Py+HMEmTlxvjHX5AcN3tj
	4S5WIWC22snQ5qojaHwzgd9ueiWJCUtB8/HbaiXzz5vRDIZdn83sF5v4x9MYrmrOWW58of7ZNr/
	xvAMzrmYOhbW8HjhxTHJegbaiejUFKxg==
X-Received: by 2002:a17:903:1988:b0:298:34b:492c with SMTP id d9443c01a7336-29b6bf82d52mr26416965ad.54.1763718868795;
        Fri, 21 Nov 2025 01:54:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmKs6406g427RTpsoL9NdDoy90nYQGvu7q3MM6I+F14YFZ4EmPyNWA30GMQBW2gpI2/+PPAw==
X-Received: by 2002:a17:903:1988:b0:298:34b:492c with SMTP id d9443c01a7336-29b6bf82d52mr26416595ad.54.1763718868255;
        Fri, 21 Nov 2025 01:54:28 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e720sm50557985ad.42.2025.11.21.01.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 01:54:28 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:23:53 +0530
Subject: [PATCH 2/4] soc: qcom: llcc: Enable additional usecase id for
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-glymur_llcc_enablement-v1-2-336b851b8dcb@oss.qualcomm.com>
References: <20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com>
In-Reply-To: <20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763718858; l=922;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=lcIb10k63srOGjA52ST27WwTXABGn789XrBKsrY3Kqc=;
 b=gYJgvh9pvsAzXURX2PDWuMo71cqcHJm2hloHFRRX25KTnemIzSRQ3zjoz9KmKdwmOE4H4w1E2
 yhQGNG2LpbHCGvQVjM9WTmzLQvmSJsMTLY89LzgcyMqP9oaNHNiy0h1
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-ORIG-GUID: rbZxrdM1xw-EmuoqHzwrzYSa6QuB3dTx
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=692036d5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hEfLBhVOvc7m0yOUfkcA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: rbZxrdM1xw-EmuoqHzwrzYSa6QuB3dTx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA3NCBTYWx0ZWRfXxzyJNvrOOB7L
 41X/r1JqShb66MAOqn4ODeGA+Aw2uit00cYipAS5ZHhTKG2k6+sa8RN6aopHYA9rXTxz912/4sI
 o7iFSpIm4qLiDrLCPd++U1yRK8iriMuvKNhyxQTgo/iGopWk/wM6mi8cGnrOY/MoauVo6vnzNnl
 n597ijgzhedFabXHoarcdh/HMaUcq8f7XR/iRycdSdLlJ6ZtHz6mrpP0wJRQ+4pNlCMycp+Rjjn
 a0HC0tzorCi3aOZCnIK/ZBOyzF7YCxHSKT14FF/A33FFkS1liWJZ+ap/vnGc36mAQXnqQbITIyB
 Kt/F5x/cOF4uMCLA466112jIt5YB9rteCSDi18S98LyzLd6u5VuyD2laAiSCCKxhVv8Ga9bfVi6
 ymHbuE/wQduUBG5a7QIXtDNCdp/gHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210074

Update the list of usecase id's to enable additional clients
for Glymur SoC

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 include/linux/soc/qcom/llcc-qcom.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 0287f9182c4d..8243ab3a12a8 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -74,13 +74,17 @@
 #define LLCC_CAMSRTIP	 73
 #define LLCC_CAMRTRF	 74
 #define LLCC_CAMSRTRF	 75
+#define LLCC_OOBM_NS	 81
+#define LLCC_OOBM_S	 82
 #define LLCC_VIDEO_APV	 83
 #define LLCC_COMPUTE1	 87
 #define LLCC_CPUSS_OPP	 88
 #define LLCC_CPUSSMPAM	 89
+#define LLCC_VIDSC_VSP1	 91
 #define LLCC_CAM_IPE_STROV	 92
 #define LLCC_CAM_OFE_STROV	 93
 #define LLCC_CPUSS_HEU	 94
+#define LLCC_PCIE_TCU	 97
 #define LLCC_MDM_PNG_FIXED	 100
 
 /**

-- 
2.34.1


