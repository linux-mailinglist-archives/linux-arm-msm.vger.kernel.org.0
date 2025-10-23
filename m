Return-Path: <linux-arm-msm+bounces-78480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F8EBFFCB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08F4F1A054F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291462F12DB;
	Thu, 23 Oct 2025 08:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkKKtOpI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5D2F0C78
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206870; cv=none; b=Z1MpKVSLBIckBQ9WnQ3A89JdORcJI0fIK105qDHfaD1Sqn/zEK8q9I7aRgahwRT0oNesV2C/CSLrlvZasBkRR75Wby3NANiDKofElwQ5HYI1aRyZpKe6jB0IZQkB/MHok0mrMMsjadREN+ikOkBizlC6zvROdIpb6EmFO2/80C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206870; c=relaxed/simple;
	bh=df1ZsrK8gVaOe7J2+CuDQdRh1tegzMfSLcKb1Y9LTME=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ASjrCvYCUjEU5EUUQCA983eNiUE0zxMWXbXQHDINhp5QeWncOpY75sm0vhOLYX51qeAuyuFsTD7f+JbxD5GbC7r11/cFI+9wztUUobXL60M/9RLxtK5bLBzEu2JxvIWE+L2jG8XOlmt62R2X/k4xTS1Si72j0Som2H9Pi4NDHOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkKKtOpI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7UBTb011813
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j1IIJSrPTfw
	ivQCAHihRszXwyf0kfSMjdUDkP6+21Yk=; b=PkKKtOpIyQLVTGsRai2jXSJzHkE
	8A0G2xLZ1PYKj4BRtH4q2geggWIOzrO0xWu2zGuWap83DvfuVBY5fZLedqNvlKUr
	RKHG5bvBTab2IwasBUJ+pt0ih5ovCCj2AP3uxEznB+rmzVZLSZl/NtrRIkr4AtPS
	x1sNWeVLLwGGshDDp+OP9WH6Nke+xFjS7AvrnqLACHbIpZXWp9Rkg/EhKRfe2s9X
	Evb5UbVFzxLsls84bApSHgfKtgX1V6AFRBbTTGMc8CV7v2i3AUG/mktp2jj92O2U
	rzmwR/gZU1fX6tGpRd06oe0s1e+6j2rmWvPFW9Tf7I7GBumY0avAC610HMw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5249r3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a153ba0009so1230630b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206866; x=1761811666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1IIJSrPTfwivQCAHihRszXwyf0kfSMjdUDkP6+21Yk=;
        b=MfWZx8MaRqTyFXRa10FZdB+5i4EWM0SXTfGexsb9tFX0VeMZTdROfnnc3587HCj/+B
         tv9cMvb3th+HQJgromrbIkbsxHkU1se3cOPWUV4kmMyISIfhfv2GY/WGd1FTMO0MExBr
         r+ukgZu+z/xb43fL8uWm8V6U8hFUpMhShUkufS6fonzx9mycVPFDySwzZpBOti5u4Avr
         nTLisMJXBBg4pGpXhlOwzpEeRVEqoiElcqX8gYXiU3JWEWjXF5ss+iVjlBl5FPUvV+UV
         r0r+XpV8lgnqk/X7WqihzxDmYRV36jMM2mDTUgOxii+lG2j0rhcrtyH0Iy1SzkNdyAbe
         KOqA==
X-Gm-Message-State: AOJu0YwcvUPj71bbCNh701fmU9VAQL43wIPmnTxyTMrAbkFspozF1oHv
	oBI5yzKmyPSf7R1n4hlIuN2hEwUrrH2m2n53WjqLZiMpQAUb1WnErMWd5O1nVAOt9zMaUMCClVC
	eaAv+Y0muIooylMSdLmQwCs3KUAYVNzEZXhRkm2Azcz9IbCEFvibWAI9gw+8lYGJ0IQSz
X-Gm-Gg: ASbGnctLSeL4YoXtS7Ks023pDu+l6M0R8lTLf7TcZxdymwmkWFgEk7pcHr3B+zQZC4f
	hvpmCEgSV8bo5WjsMe3zrcWs85C4OWldl2KwLlOydsgySBmqkH/23mJXA+xybRLL5gY+DMKImPk
	YyiTknhss8I+ZXgubcwCP2TyC93BqbsdJKNpzOlOj+/be+i5Y76eRiIuQnKK8AAwrY9xes9muUD
	f6Gpzp4RI1kEWapdcKEizoUytrjtaFVROKiZUnf7mSolqab4W0Sn2NFp/QdbRQkwReoHkKNTCU9
	DQk3Zy8hCzuslKb7M/KQXRDND+WYsL1igTWNo7L65/Bhs3LRYk7+1R+aOz+jFyc061DvrNiIANs
	HkTGFS/pRzZ+ig8rgttLCX/50YICpqkJrgzaJZnbjLcyYKNey5w==
X-Received: by 2002:a05:6a00:1707:b0:7a2:7792:a47e with SMTP id d2e1a72fcca58-7a27792cff9mr1270484b3a.8.1761206866519;
        Thu, 23 Oct 2025 01:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm29AEfViqZ/xwI8Z4NkviSg6rNCA4U/hY4ny+YB6ujwOOvByBjS3fyeNcsd8nDzK1JHj/mQ==
X-Received: by 2002:a05:6a00:1707:b0:7a2:7792:a47e with SMTP id d2e1a72fcca58-7a27792cff9mr1270451b3a.8.1761206866100;
        Thu, 23 Oct 2025 01:07:46 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:07:45 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 11/12] dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
Date: Thu, 23 Oct 2025 16:06:08 +0800
Message-Id: <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX/+rr1AhOmhrU
 pswKAjada7diGS7NnFCGGxL9UGsn0dbjLojocEwJTXskgKoAT3wDrwg2rPeYP6okMKdG3m0hAOL
 j2CbHRXXdnUWNhKgcprEeHDqJT6UE0paNueE0TY5zyQhHKB2Rkga89H9XfYNJSOF8l6NYtpYMyP
 y+LZz3d7aRgCPUN1YhLPuHjbzcIU7jawG2S2oZhk/ILYyk6vJu6GUxiKRDtwvtP9uD2eEbVT479
 mlK6ChRcyY8tVV2NUl3L3QIQTyuMiIyO7BOWL82UzNgLSIgqAT4BPtn0IT7up5/zvweqeB3PO27
 dIbxKbpAmXzkr/PeDW5EFbG+7OG+4w2bgJbNxwOklZYLUCzfaoSmtwbTteDxddLoqfPiqUm1Qak
 cYc8LzyvKObf2pxIA6g/V8INOMyqgg==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68f9e253 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=NRHHWUy0EX9jfUzwrTwA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 91KV712325nq4xiNwKVdyPODwrgAaMVb
X-Proofpoint-ORIG-GUID: 91KV712325nq4xiNwKVdyPODwrgAaMVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI Controller for Kaanapali.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..536ebf331828 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,kaanapali-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -369,6 +370,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1


