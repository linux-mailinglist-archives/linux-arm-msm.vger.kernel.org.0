Return-Path: <linux-arm-msm+bounces-79875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAD9C24D8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D83C24625E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDFA348455;
	Fri, 31 Oct 2025 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUo+zSp7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9pAhcod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE4C346E48
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911314; cv=none; b=gL9WZRhY1GJfUs9WlvGsJNMaKnD5aH0LbaDTwhefOJuQsBvK4ARqrN568YfGZIgTLu3omJKU7tm41nO8VQ3e2ljHyOInhilSiUk+YXocSmoKQRa1wRRs9HAVtqKV9NUa90qtYPKZWpAYTENDWbXaPvAx9k5NN6RGMCnX0rfMNIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911314; c=relaxed/simple;
	bh=1z/FSnj3ZUgyWqaLRX5fY7Les2o4JmWnSmIDwUcEQN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GcXN8dbG04m+YneVaHFN3+169pFtjmTUi/3gVVYelORy9ztjLUUdpkh3f148l9b7oCPdn5tAZLs57OXqFqo9xH7/EIeGwWjKTRgFC+D0uN5bT7I9KsU4OFzJ2ATjzyD0I2h0rae3qN2xo3oVYa2vzbLBqbsrISPZgIFjAQDsCwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUo+zSp7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9pAhcod; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V73Ul22058979
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pWjm3r9JBLg
	yWiY5RrLVYsR7m0kB0QZc1E+F4Ywtwhk=; b=LUo+zSp70Cu/KiSHtG2Den5fseV
	BlZWcKOR9SLf5tW/oardmbA+AgKX4QQAOhJwxG0GQZgrW3/mVJrV1T77OwFvnOx3
	65vQkb1pPs/1HnmTE/HpE96oo6LyQL2iq32/rS+cqZiwFxZRasCbriHy/9/lZyhh
	fbT9ZexMsJNYuR7RS4L2gwCuWCaDCIfmnzojoamhuJcsw45xOHvLxkgQW0R0+nSr
	4jhabXNP2RBaMvYQoDvbvk//t1qICpG5v4KiTPyYO7C7rsP+KWwQy2RcAlA33qJ8
	ouTBVOVysTLILhE1eQrBjPp34IVUqrsj11z5ReeYA9mm6dCbruSk2f9tc4Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4rcvgs11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed3f9732c8so33501cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761911311; x=1762516111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWjm3r9JBLgyWiY5RrLVYsR7m0kB0QZc1E+F4Ywtwhk=;
        b=N9pAhcodQDwmUFNNhEKcUkHmKbJ8tpuT1fCm8NT3bXBBw0T4tiWkXQpU1Lba9ItNOd
         IFGew+oa2TMIJKbyfIhX7wUG3mjdizpBN7jbhcUQMkk/oGAaqxvitiNCA9D/wmrSG/h9
         Eals3xKdj4C+axxJJoSt84s2KiHaJ2D8z4dM5DnFCKOxP3WkktLTsO83OrmwEQf7sbgM
         poFyen7ZEWmS6zorzgswGnPdPlraeC2ZcXYZN6GYGqaPgXeGorIz1Uw+L6bkk3Mz+FOU
         iJEeaxz8lQWQboStbZiWOLQuld2wQxFNz3z6LtbhvKXMsGlNnRtQKSkKz4OY/zGlifBc
         2yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911311; x=1762516111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWjm3r9JBLgyWiY5RrLVYsR7m0kB0QZc1E+F4Ywtwhk=;
        b=he2GvoCFhNif/LYVlW7Ug3gZKnAuL2tUjQsZKsXXHeJGw1oXsU4StHaiTBXIcbIBEu
         AaciTn4/CY72ljkNnA/dkOxwHE7bmOTzW/Gb2A7tVki/lidrvVg5ufWiX32S/eDsN+Qu
         0dPoQEnYiz5okcQh2oCf1vg4QV6F5o5kzwPR91bnAI3o1cX4ZInr2afNRmPl5lp1RUXg
         HyneDnrzp1HcEXMNAXWIfU6JY/0mlh3R2VUxhs8bsHQnddGpT3OS5Zity8eoGjRJxmJN
         NBOq+ptHgPZkTWx6ZJrrcPbaS6zLCsVfrzjmqwWP0uXiEMStpP7ZNpYtSPtAJ3NkoVYU
         KiBw==
X-Forwarded-Encrypted: i=1; AJvYcCVaHnFCRqDUPG3Pf4bLXwLMS+q4cMFlCdDGSsctdYUcA03Ig3vifXftUv4+Mg5pxDYyLja8zcZffP2lQhY8@vger.kernel.org
X-Gm-Message-State: AOJu0YyIjx4unpHvBn6grxZ6C0h04AzBXMs6T/JVjRerfUVMeGj2GYce
	nyhyuc3DOGAcAyvllU9kDwp2vp4Ju2jhFjhR5lKEWFAUM+qzc43GPXNdGoZ2jibHsx5vogEkn81
	PNLvpz6FDlp26V6FAPZA15ErYDGXSiKEpfy+DgI8xL1Q5NO6tiUv/aSkpkBs7k+KpboX0
X-Gm-Gg: ASbGnctyIXUudSuG1fMI4+lz/k0A6tHqSXVkWunFLnrx5a7KrdMvsvCP/Ky2KnHaXmm
	xBUX4T04cwyYyW+oLiQyglPSz28iy2VL03wELqb1tXC3eVgRGQs1CDIO3FZgot4li1D9WEyRxJ8
	rtPFJyL07jt6hFxq+SEzxWo/R1FqDa+6BWqvcaBBT+yI0RpboTAu38bR8VkLuPsW0M0b63XLXVP
	WA7vUHNqfemLTkBVQRTvBm+1bYTT2eaSndIQAoFyFgPQmUzw+8H54n70HtqLLRjljxHNgwDYmi+
	Uq2M0o8Mny9VPB10cBNELtqI20r49ojxZC6ZcJSrJ8fvtp5KoPPH9356m8Tq1wqvpMZtsGo3SK+
	/YYlWVMVaW8I7
X-Received: by 2002:ac8:7f46:0:b0:4b3:4457:feca with SMTP id d75a77b69052e-4ed30d5c037mr32900311cf.6.1761911311229;
        Fri, 31 Oct 2025 04:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1PW4aUXjWsnBLAunnktPoZEmZj62hrfAxwz0VwIb8pmFGBAHF6H9IebLcOFRhJ9pXXvAaxA==
X-Received: by 2002:ac8:7f46:0:b0:4b3:4457:feca with SMTP id d75a77b69052e-4ed30d5c037mr32900011cf.6.1761911310708;
        Fri, 31 Oct 2025 04:48:30 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728aa915asm86831165e9.16.2025.10.31.04.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:48:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/6] ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
Date: Fri, 31 Oct 2025 11:47:50 +0000
Message-ID: <20251031114752.572270-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bJYb4f+Z c=1 sm=1 tr=0 ts=6904a210 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=q4DFcrmTo4ZQpOTRNT8A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwNiBTYWx0ZWRfX5+sXOHeoM6v/
 IJxo9qlo70nhRSs4w+yISTq4Kpdzb9TUz50emxI1LPIX/sJ1lPnF7s1bZHBygjXbt8kl3arKcFO
 0a37vUcQ6zq8c0cXYfJbWwj79Ut5uDNryfs1F4jolzwfAHRCsc4a6cxn28pnTKuGH8jSiZJhzzE
 8yrCo2sVO7Es/uEBfD5N6r2y8rWKnh+QZnkn3aQ7UNY2lnjzkjwjv2lhwjz1/s1Kx6zGB9NEIxF
 WOVIf9V14rnBBZDsKBm+lYVEAfB/hGhjBLVl8tfnpxs9FwebuBdgDqOUkgyVWDOD8DmSYwJoUG/
 AjAxJOXGn6tyQTMCB2q0zs05fiRm8e43NSVkV53UizZAp325RL80/wbzeIIKaTdAeNqHsjLjcNl
 qqT8I7yvav1r3fQpfJrhPsNX7OCqRA==
X-Proofpoint-ORIG-GUID: TkbQwzOZOiFlI8ljIC_tJLZTfrmCu8tV
X-Proofpoint-GUID: TkbQwzOZOiFlI8ljIC_tJLZTfrmCu8tV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310106

Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
VA macro codec. This SoC does not provide macro clock so reflect that in
the bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index d3851a67401e..5c42b2b323ee 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
@@ -99,6 +100,21 @@ allOf:
               - const: mclk
               - const: macro
               - const: dcodec
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm6115-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: dcodec
+            - const: npl
   - if:
       properties:
         compatible:
-- 
2.51.0


