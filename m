Return-Path: <linux-arm-msm+bounces-82051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 97753C62AB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82DB34E8262
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D4A316909;
	Mon, 17 Nov 2025 07:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzeRygRQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fs++9oYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD38B2874E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763363321; cv=none; b=mKqhBhLdbyUkqzQ+5Cu3dmlCZlhMpCSTmhMVJzeiE2yYgDrTCwcL8btDM3xk7xbDW7oAGGSN0u1yZl8gzEYQO4H8qCw8Gxvi2LqoUqsJTDimu5eHw2vVAv1ghYgECrFUILDhS5HhmX2Ggz6PsRmefDQ3redu9+LnoWmyflQ9fnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763363321; c=relaxed/simple;
	bh=9yzhMsdmHNEAMLyl3o/8IoYKmWn48BasPEhuo1x0OFM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AN5dYdtBc+nyijrZ1sNTqzzZ/3gfRZ2V9tjNZWyDjJPE8OcDJdutCURa8I90xSpXXpokG+HtqoNGWfNYQk70fGxynu+aOdXcLyEMeteT7Me/dEEZ7nZfAFnEMYRY43MVyibWvoyRX/XB/MVjrPjYky1rQvx8zZgHy/DwLR6v8gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzeRygRQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fs++9oYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4oRcI3320375
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SNuyEg3IIjw
	rppjj/r6RPtC6vcdKvicgfJNLFT3K30o=; b=LzeRygRQjPUW8Z+gRr1ecIbVOXm
	BLi/6+WyhUEln24XKziS6xmtFls77hVOpo2YXvTV5U/gpG4iHPwyKDrt1MuuzvND
	D4cluocRoe34qn2hWYdtMgvBRYbkRCd5iy9sJwsDEPRWxpguAjOK07Q+DQeAbKZZ
	glRUM5gXTe4u7LReGv3RsRMvXaVrQECgb1NVVmNRkFD4L5uqRGqbC12jbN8E1PVR
	wGZWrWZH7I3OXpRT/HCx4vNGRVqgJM5Ao4CK4k+xg2NI8GFGKFy7FE9mg+NPWoHX
	tmlJu01v+vOIaZjSVAf9CFGoRyTqiTj6I25v0r77R07eEln4kQcxUWVmklA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5bptw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:08:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dfae179bso103610175ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 23:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763363317; x=1763968117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNuyEg3IIjwrppjj/r6RPtC6vcdKvicgfJNLFT3K30o=;
        b=Fs++9oYvr2jB6PvLx+kL82bdJYai5EPYtgKPa9OWbeB4Nj2tqMomlnwhXObJ3AnLM4
         uCamKmEVBq4odHv/55LF5hJkdLYUKghxfn7SNTq+kaAlLJgBksrLCM92PGwFI9UaDhTg
         +1TIDcG1OD6SJV6SxH4ildmbiGIcChOh2EmKHQqYrzqL3LBzE6pl0JapR6glmiqkQegC
         llosR7DTJ1AHMsLf3s2VBVgSpvmMTE7g2HANyHlz5aOT5zcUiObmFSWL8W2SrVmXZT0I
         r3DcN+mp1sfR+HPGnOzaFMofNdTJrs9vfhabVYYO+G+ylI4rDjQ5cGxPDGK8qXy3U6gD
         ufHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763363317; x=1763968117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SNuyEg3IIjwrppjj/r6RPtC6vcdKvicgfJNLFT3K30o=;
        b=JenuqrjpekxHqS2dCeaP+/UUGGK9Cfcoi548IArlq0D4veQCo0uUUFEss9ZjkU3IvU
         yKE29GP0Z2go8k0yjx2F6lnYASP+y8OJNePXDN1bLni91XsoMnaOexOPu61IeTJvPLNd
         H/JTHjEraIAmUTvpCryDJwAzhTp7FCjrWpwmk1j1jKblb44jVPzsvl8xBK87c4gmCX7P
         sultVRU4Yc4LsGQCc6rRfiqHWVEel3o8/IGiu02AJXzhvseKv07fJBAr4i2/G/qE4+Ki
         izMgtTQzzcF14oGk+AgxQGyCqjo7Q11G9EnBWIserKLOuqHFlq11UiY9bAOEinKeGrj6
         EwOA==
X-Forwarded-Encrypted: i=1; AJvYcCUw/qjAOgwBj4jJqq+SYUu3XylcJ/2dB6GGBlQmks3G1Rnfr3TCLhm+7gDuSMjNlDBs598DAQTq8P+5/WCN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/oIujhfEG4j9tEiuKaBlYNwNgEb/mYQ5fMvL0Lnkefj+YDPs
	BmF6iTWqkmDodVdcsvl0tY7YdRMYIKdbjIQO4l42P11Bw51KFS6xeB8N6Jwy1rFJD5NR8lQ1Jsv
	9rqhWIc+VX5QDmewIINK/YW/GRITv4yWcqJmy6IESDCpjyHhea6+NAUxapPvk5QcorPvv
X-Gm-Gg: ASbGncvsyN3nykxmnzrUYeW3hKEK6BSt4rf/ciec9enH05lDuK5HYhVTi3v/M1hX9Jv
	GkqIcEtclqLmqnTq1zaQWRufoOXDbCVC+Ry0gqsQtk8pgLcb1dEej2vUSgKU+yzfrBf3YVPIggL
	mTuCI2xHBv8jJFFYr8DPm9bIPQ16Teyjv1sbGDpDDtwJSk5+MkmQdocnjpjdmkyaYYJnfp6r67w
	v90r9ccW+GCcNlY+Um3bB5UxlkYKDUA1no2w9myAibAndvOzGk5w3L8aSyoaQuBoD0v/L7hWiCc
	rbDh6UWtcM542/GQDbJi55c9psmLR57RT73lz52UQfwKkTqZp969ZrDZVlbdLrTZD1Kx78K3yfe
	Zfu22vV4DY2+baRU83hm0Af5xag5HgW2S5lNDxRPLkDUeqlS0XBynUXf5yLJl8E4w1YCXQh7p
X-Received: by 2002:a17:903:3503:b0:295:195:23b6 with SMTP id d9443c01a7336-2986a758e70mr122452195ad.55.1763363316769;
        Sun, 16 Nov 2025 23:08:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIF3al7RXgokWw4h5Rk21Vm9aJL+v2sRjbfgw3jS5PEJoOHR2Qn6r4waH0z5WYhbRd5mFqkA==
X-Received: by 2002:a17:903:3503:b0:295:195:23b6 with SMTP id d9443c01a7336-2986a758e70mr122451975ad.55.1763363316354;
        Sun, 16 Nov 2025 23:08:36 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346f3sm129027605ad.18.2025.11.16.23.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 23:08:36 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, ekansh.gupta@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: kodiak: Add memory region for audiopd
Date: Mon, 17 Nov 2025 15:08:19 +0800
Message-Id: <20251117070819.492-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114055639.1050-1-jianping.li@oss.qualcomm.com>
References: <20251114055639.1050-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OCBTYWx0ZWRfX3pDC46jDrfHm
 r1NrhFQAS72RlZDkALlfp7LXF7+HJ3U0hruea2vhu8raLMOwjPSEmbuuJ0JhRxk1vjVGsNiZbXU
 9DhZE+NaYukxGvJ7CyrfJ4UlceZCl2bRPiLpp492B7A/3ptB4usUgJtkTiCJ2Top5oHtoGpTYqY
 NXRnqLvdJ6Ef8gIMTH8KL7w2nmHo4RpJy2ltOUSZARPwyT3pEd8rjwG9hj3jfKSR4lYChgTzJAA
 dOLgXiUStKKYMwy6XLD77OM3acHVGLkzIRpFpbkCXoSGC10C19L2/dKZAdWoxN/PWb/dlKACsO2
 1fMZCzAQlGH3jn4qu3nA+7SuCSYvvyA54SspZsM2fhjUvG5fxKddCM6E1ZGMnrP4FKoATb7MHyK
 1sjFD2ky6+VWn0zlbSAQCIf7xCP7qw==
X-Proofpoint-GUID: wZDquS1CCyBzZ9jT6ZQwUeH1xurIW-lc
X-Proofpoint-ORIG-GUID: wZDquS1CCyBzZ9jT6ZQwUeH1xurIW-lc
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=691ac9f5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3y2iGwN1jkfzY8oq8JMA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170058

Add reserved memory region for audio PD dynamic loading and remote
heap requirement. Also add LPASS and ADSP_HEAP VMIDs.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
Patch v1: https://lore.kernel.org/all/20251114055639.1050-1-jianping.li@oss.qualcomm.com/
Changes in v2:
  - Fixed the alignment issue of the qcom,vmids properties, aligning
    the values in the second row with the first row.
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 3ef61af2ed8a..7957a9151055 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -190,6 +190,11 @@ rmtfs_mem: rmtfs@9c900000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
+			reg = <0x0 0x9cb80000 0x0 0x800000>;
+			no-map;
+		};
 	};
 
 	cpus {
@@ -4139,6 +4144,9 @@ fastrpc {
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
 					qcom,non-secure-domain;
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.43.0


