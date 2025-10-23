Return-Path: <linux-arm-msm+bounces-78478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BBDBFFC9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B43D83A98AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F782EFD86;
	Thu, 23 Oct 2025 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/7J0hxv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD472EBDC8
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206856; cv=none; b=C0XuJK4zUnWdw2fqDdSHVyfA/riJHyJK3PTIBVDp5ahHzbYcJ4GA9lVrctCHk9enZDaH5A+m7axwHzRW4Yxnh9NNPjCTjqm/kY/hSpNYP4bfsyEGEK/5eRLjK3Cd/qiMIe8ZtW+sZP5GSaECf85sHOkKd+Q1tQ+xGN+v6CJuKGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206856; c=relaxed/simple;
	bh=eHLbQKgDHrUQtLmRDXaeVqDwzsiNpWPWS6Xcj0PiRi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cQi0usp6kDTxkUx+OaMMnOV0CtgbFEKLfQQMdiov6TB2jmaLEeFHYNq6QeYpAqZMep6cghtp0wL4Dw2hSkbUAEVJjHcIO9tdIhBet8na9qW9s/64T9NvJqfJNWSmCV2e7x93dMLgrTcchddZaxWcSnihg+4Z/xGy4xpf5WWcNWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/7J0hxv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6VHCK014616
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IJq8ZteHVi/
	66D7zq8C07f3aqefDhDiFLFZsOOUaCOY=; b=j/7J0hxvXy0/VoN9aC/DOk3S369
	9ZndMDD2pApkG+uNM3VXdqkTiTpPioK0WBbr0PoYFIkTGvlrC8DTL/0vsSzOIvcV
	Yn0w+laY3HUc75NRdRgNLP9gHrru6TAIBhGIsfx1XGjLnQeqE9mdTSDxuPdZxJMi
	KhhR3iYM75xQ5KnYgcWtCpENcIW1+RvpWQ0Q6R2Z7zt+/WrAHwoeDWSffzT+YTu4
	hUFoa0BIJLkbXu30MVVP63EjN8CAOMMrnGakJz6/qZCB7kvcWAHrkr6jxi5GXaJ1
	yV5iCVGpy3Vq46ytiQ8TrqEFLz1Sxcud1xm25flZyZr3UmWPgyFwxS8jFeg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0nf69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77e7808cf4bso470140b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206851; x=1761811651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJq8ZteHVi/66D7zq8C07f3aqefDhDiFLFZsOOUaCOY=;
        b=E1v4fz1JsuXwO9/vDchU1WHNBen6jf4lWiETZo2dGUgZpITdqBtNaMp56TgdCZiI1T
         MZloJhIZf+6HTEDmixRD4D2Opgz7X5GoBLrczs3OpyzzxCqAbGzXKLwyixpJYHog+BeM
         jpzDxEjvTCJ2ivQlFJwtLjraZFcLwCdBAISNuIjmvbt6CkkYTgHLhxBqLZDbqfCNm8Pq
         tFIvIuIuX1c5KJQZNVoS1F7PIdEfoK69VeWjNZOTxqcH9e3doOOMO9H6fZd6aqlb5WAl
         /HYV6I2wnLubkTu4Tg3n37b5SeIfuNCWtpcIuG8cS1DWGApjFgTSEcpWZm0sWEV79fSI
         xo1w==
X-Gm-Message-State: AOJu0YxCTmU8e97jpGKJPlFn3uWlEMICjTFzzmPTPhvJYzjSaEZoFpc1
	cWOcaALzCQk2tO5r7mn3Ae1lVSiHp5HVFJr6i76/eQzh2YkVDn1+0K6TYd0OkIDXvMoNjni9j6/
	mUZBSXpW4daTf+SQ++qlCCvnCGwDjl3Zm+pD0QwCHyxqEXL7nRvRBnjnqYn4rcd2/X0dD
X-Gm-Gg: ASbGncuujDszG2pFwQjln8LlSLrNnosFoulSqJFHFmF9P7rjjSheE9/szYfgmGUjCOC
	XrpiUpndi0BoSMMoLdcH6CKeMqnevwNhy2I+EX8s77HwxnGVO84c9RTiQe+zBd3nx4Rax9jQw99
	XkqJbhkDZpNs6dcTbLo33pXeR8odUNHhbtw8LdlLYt53JQWYSFDGOEjI4KsYZ4Vb3bRVR+VEhLV
	mNVnEL3lehd+E/G86RTq1R+SCr5gEBDeeUwMEGpVSNi+ZAeAaReeEf6QitIaOnuwdIEP9J3Np9i
	OJ1LfaVXwDyfc9Wlg8wJV8LM6P/yR7gUnHA6kK3+ymzIY/41uM38IpYPOeuZsWJv0jn1CHbl5wx
	RRBoRGncM0GIsCQdoVJ1OEdrjKluC4Ped2b7bEnNeaNFH6pHT6A==
X-Received: by 2002:a05:6a00:99a:b0:7a1:7f3d:45dd with SMTP id d2e1a72fcca58-7a220130bbamr28847440b3a.0.1761206850659;
        Thu, 23 Oct 2025 01:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyJ1rsxjg1qDnqSR6krY6mUI2Maa23+yEaD4eN6RpwTES5KZBi87GjaBN71trayEyatXK64w==
X-Received: by 2002:a05:6a00:99a:b0:7a1:7f3d:45dd with SMTP id d2e1a72fcca58-7a220130bbamr28847396b3a.0.1761206850204;
        Thu, 23 Oct 2025 01:07:30 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:07:29 -0700 (PDT)
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
Subject: [PATCH 09/12] dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
Date: Thu, 23 Oct 2025 16:06:06 +0800
Message-Id: <20251023080609.1212-4-yuanjie.yang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX6u+oWO7C6kyY
 +r7rQ9ccd2uIsN75CcmhpPIRDaNyVSaxADd/uLGN49RNH9wUbalnKYMXFYsRwNPCxS6kXVMso0Y
 dOr9YXQ0ONeAbhVw/3I8auXR7+6E6bG9SRT2WwP2KxOR9rBWCA5vcfjom6hwKq8JKoB28bYUrBa
 gVmkzzIOAA+VWWMK6ZpD/Hf1nAxjll+hQ2XRPg8X6BnVW5ntTKWOo4Q/j2mncC407PcPvMUVyT/
 DEyL+PvPc9mYkumLeQVBxa73xJDRNhWiLF1ASS5k68TVVn52ZyqOQu7l/9UlC8TLpI8FfrAhCCj
 MFzL/C7rDS9jW14huppecIuG2KucGP1A3K5EE0HENDVAiAmqhZs07mWWAt007NDEXZp/LDjFYKx
 KqucG0jLBctM5Ry8Zo7F6K0SYOBSvg==
X-Proofpoint-ORIG-GUID: dDBLyelA-ZdqO53EOqbeBbqGIgIIORaF
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f9e243 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=LEfPF28z9Y6gGZEU5FYA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: dDBLyelA-ZdqO53EOqbeBbqGIgIIORaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd868..424dbda3fd9d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-dpu
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,sm8750-dpu
-- 
2.34.1


