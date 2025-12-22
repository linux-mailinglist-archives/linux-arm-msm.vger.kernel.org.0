Return-Path: <linux-arm-msm+bounces-86204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8404CD599B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E31B3028DB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E05F330B09;
	Mon, 22 Dec 2025 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VA0o8Cvp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gL6u0voY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BB433067A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399068; cv=none; b=OPrt5FiLJ8wJFm53gfROLORLGy6uxB18HERbvmTlnXaEmp+GrHANeqkkmxDYFwl8Qy9cbSDm41RLyTSCq/KbComR8sTA79Gu7LQ+QRJtTeHzbDeRb8F/NqY2ilN4LgKm3HaVDPZE/4d/c/IIgooOq+G5zfCrbrxleIZNgIiS2/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399068; c=relaxed/simple;
	bh=lT56rcO/2wjclbI67SuJRUAAr4AVOFYX1OPiKxP0VqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hxzYrj2Q8mBFD/ilUNnzrI/PinZ/pd0cH6sGM8ELs74w7d1oqLRaHZJHwoAqHLyfpNvlxhfzwgNwK86Bs1Sijgz9jGcmOit6seJTMCtGF3B4ovtqGwJnA3ASAZuovaICJyCTpx/WxmC+cmk8VoGOW1sT2GbUH4VSQfiIBnLn6qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VA0o8Cvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gL6u0voY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8BkjP4041292
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
	iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=VA0o8CvpqBBiQvYYUPjvXzDQRAT
	Zf5hGMXfJIzFt7pgD59l9GVH7m65k7ba5Xomzkwx+hLTZ0w5EouGU3voEqn8IGkk
	MHlfXqOmrrVTTnrRXi6Sx3bLaMEKL8kAhlJVkWLi0j63WjVvTpDZiLfJDWzQJ00R
	HcnY/7Cn+XZHS8wbEaOWdnTOUIj7HFVmfGt27zf6iRq8YvRGd33ieNdePJ2Y99S8
	g6nVanlLNjkw7Esv9pY1JhLr9xftJUYHKeXq5HLk0eD5eRo54gDh+MNbWy5m7HhY
	q6RTflWF1CTYkf49f8Dog7nvIuVuqwuEy+k5j0G3FWtLxRRBnR/PzBQgu7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mracn6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a92bf359so79967741cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399065; x=1767003865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
        b=gL6u0voY98bzl3grUiX17qovAdea1o9u4q4DrezFNv3vwPRGaQGRcWMDgd617zcCqv
         JC8zyexFbGv56fdgQCuHI3GkQ9vin+3PHUXlanPUtXtgb2AHySQy23KPNNaJKR3aPaey
         U0S8e/pwWGB1eEmEyzT87VTkJ1cP70e/VerxhHMeg9oi7b2FjKXFK7A4U+mPcaegx38g
         rj/VKcyohazwrWCqVkpTvPWS0GloMNl0z/A5LivDgDUU/kKgHjxHpr7qEbKXkfTuVZNp
         eFfa7NmHE/SW+d4MyN60Btwge/6ZL2VxfrtxrvVvrSp2IBcefgCnzdB7it2TqYRbKg9j
         HRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399065; x=1767003865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
        b=SnA2qup/UkF8dptmbaqnSGWvt/Lh+fYH5pvc3nG+c4H72q72XxJtvIv+Ug0lnQ0wQw
         2PJrlVMrk1OLQHDwgjhOOxcibE+Ey2ldGBUXwbx/yS9T6A3wEkNSS4IMSZULMUkrCvcv
         8saxUtRMPKg8CpY31Xu/mjhJGM9mGDI7OnqPlL51kCCGdZBss7ieDJZJ4d4i17D+dN5Z
         /L6kkosSAJEVQGcRScHjXI/xFuU2TaO3Un/N96N/OZsSfG1DrC8zp2ik4qIIsiZpHkHg
         hZSYTBzq5hHxHz+7bggdbyGdufIW0vNnUy8hs0KTjPVqHDXEIWguU0JCDTAfxTHJDnh1
         /bNA==
X-Gm-Message-State: AOJu0Yw/PFLmhgZELjPwUn7W1LN7QdI35d0XMXrRQK/v7qUD0sZlBujp
	eLi/tYZTmroUkQlT5cb2DZkdI12Gcz3azo8FD6p0V/hxaL6b23XFo2McYV0YFL/y8RHQEW9TpBx
	UQVOAupSXlzltEH4p2WmtYEDcMov0f+Ha2BmKVOPUGMn0hTgcqAjKiwBQTBbzBYvfRV94
X-Gm-Gg: AY/fxX45tzBoPa88oK008igwXCQoxrQkYDF0sy6n265l46XwtHlLAISK9YpdAaLYbNS
	SMd9OgjQASGUN+qnDEViq3HXMSqaRq17l6lJG5aH2AGO5Inc447lR1p7Gh+ZE1dS1hirQVjMbCn
	oNsiQgtNa0s1qpDAXru7WB4R920Q0eQZmCVBzZlKq33oDIHOejgUzBl+LgvTeaIjXXNd6EfkdIp
	sckMBCyNer0PO1444cKDFHQz+AAigCiLbuiShNUaUbw9bFxNtAJr3vxcANOjjg9ERA9QmzoWgY/
	xavo6hI/3/NrFG9X7tG4HOeSDRIIN5x13/boL/SNYIc9swpHS2pWRqNlfJXhP9l4Lnhq+9LUt3J
	VZB9Gud7snKQODP7PLLSNKeakQqBHhBglLRWSfRsqnCjsVnMCFrBa7fXqQ3cy2YZUapM=
X-Received: by 2002:ac8:5fcf:0:b0:4ee:1dd0:5a53 with SMTP id d75a77b69052e-4f4abde9f30mr150903801cf.78.1766399065035;
        Mon, 22 Dec 2025 02:24:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+T6m91+oGsjfriTmuX3mj6iu58uoeeqOFMGa6SnGVr/aTF4HD9oscEnMvSP7CWfajySBoLw==
X-Received: by 2002:ac8:5fcf:0:b0:4ee:1dd0:5a53 with SMTP id d75a77b69052e-4f4abde9f30mr150903641cf.78.1766399064651;
        Mon, 22 Dec 2025 02:24:24 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:24:24 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v4 01/11] dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
Date: Mon, 22 Dec 2025 18:23:50 +0800
Message-Id: <20251222102400.1109-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YlpPKhmuweXctUJupJlvnW-Iz6HdOx74
X-Proofpoint-GUID: YlpPKhmuweXctUJupJlvnW-Iz6HdOx74
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=69491c59 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX3PL21d0/2Rcm
 3WgTn4DPr5QMZAPoYnUcVqAfSnjLLTJmDAshyXoT78UL2lBGZxdGo5n2J8L7MXXOnxEQ+dOcK2E
 qNbag/lPicvIX58VQ1QVQQavBTeUdNLtfcrtgBGrODir2GhCqmp6a177tZBDfQT95jgVO5dq40h
 Ndo1E/LfjIIyiZuglHUm0byRHu1ABeVaqZwWU2xwgOgVQOTYtRkkaL0soZ8UwsZpw/jHy5Wl3tS
 XGJCwbPsHR/6COvMyxmEGNcK55/WsTg8aSl42QsdiESPi2kPQgoP/ulMd75v3RkIrADhRgmn8YX
 EOK6fZ8HYvl7b8m4MZqXcAPL8WtIDbW+PJ4NGDc/tTg/SYTbWai5ULCLCPJaXf2kAQdO8KTF/I+
 1w690RSEgLQx0JmiMzgt+cIc5O9FFifoQg4ZcJf7MlzP/EyYIGraXHMPyBPxDyC8TUGJHzI+rOM
 9qvziI9DH/0FvgVsk0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220094

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index fe296e3186d0..e29c4687c3a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dpu
+          - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu
-- 
2.34.1


