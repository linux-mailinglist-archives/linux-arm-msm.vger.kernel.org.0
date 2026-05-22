Return-Path: <linux-arm-msm+bounces-109237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLwoBtQtEGrIUgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:20:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 723225B1EDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9B7830750BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200E43C7DF0;
	Fri, 22 May 2026 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaHp0and";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U59URYX+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A43D3C3BE6
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444770; cv=none; b=JVJM6EM+AQgae6P8ErdkIE39rxMG/MSkUINJTqRKnF+KLuKR6apC3/gNHEhy6U3S1bDe6H08oylQFuZGETxJutHFfT70fnd4u6kvt4JZqYBk8ZnCUhpbIO5HZRsR57V51fovfEMcH6p5tIU+Yg/5+HXJ7wG1nBVCy3bFnUwpTK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444770; c=relaxed/simple;
	bh=VXyPjRyCvwokK/qdzZThuxToG/yvYiuIOD5L6w36bck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gXYDK6MM2LdLpvxE34ZXvEFXG1IbrFHanmgJhlcNca0RRtA+GcE1EVNBDOTs2fh+0T8XDC/2jc7Spixhb5XfCdSBb0/cv3jrrqydfpzIoN1YJoy2UyrH0jas4cegcHpNje24MBRAE3paLs9zXZVXs3QWHU64Bn42S5gFb1g8awQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaHp0and; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U59URYX+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6Fisl776936
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cokVwtObejHhNsT8CGzVLLo/zm8OUnIjAi9EaYJJAFE=; b=BaHp0and/uMoE7DS
	h5Sz57ZRPv0MyxT1qtrLFJF2OQQtbuHLeiyLzQU3sA8IHq1UVGvc6rXcdreUU+UT
	PAvSZM4zm+jOFT4WRJHe+UP3IjkTMwSfyyLeGvZux4Nn890yHF3zuwfufuOc6CTm
	gzqsZTvd39NxbrZjHvBV0S9XtKJp4x5F7R5aXn8Cv8aaVgUyZQV/SJq2FFkQBjjC
	yOcWhr4IsiXpTLVoSPEchgFBsaXWBQetjs0QQF1p7AI3z3305IY0jkvWjHVtiBpj
	rYL2rmFU7bo4bOrvjA2pb/tX3ysXfjiqjiYlWnW/fkj7hKWIaRADjGG8peid1swE
	dEf4WA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h309s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:12:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so6684886a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444766; x=1780049566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cokVwtObejHhNsT8CGzVLLo/zm8OUnIjAi9EaYJJAFE=;
        b=U59URYX+J9Ue6OAu7p0lYwhI+6evzn7Dq89s95ePU38vIjz1d5EJCaB32HGrT6tK/N
         v3Pdm3/QemnHwId8UzAXLZbQQEfrlGcVy+j6vusp8aCIoQSoAJiMsQWcJUrzUfNHOWeD
         CyVOsEM80LydxlHJlnRkPFTZc2X+v0lcAn1MJcar169VunMvoY4Fc7XGDcYasNVGvfM9
         /mi5QCtvWqwtiVRtGkcsAaYwLC09bjBrHqhOQ8dXty2njlR3fnyJRPZn2DRGrJYLYxnP
         uURrEfr0JAiSQdFIluIMSnPu6PHB3LuqepxaS5E51o03+P7Z4vn/qK7lZbkB285vTr0G
         OnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444766; x=1780049566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cokVwtObejHhNsT8CGzVLLo/zm8OUnIjAi9EaYJJAFE=;
        b=s87KmhNvSxiswwUTrJx+GFM9/rT9ZMv4xYluTBhylyJlGQXEfomkQQiIYtHC6ADTBA
         C4MuiC9i60qdKMkZYITYsFjNSyHyF0tHI21yVONxMb7KL3rk75A5klBee9rY2vduhY0r
         vL3l8KCmdDzC9/DIzhtlUIOIM57UQLkoe/dOJKr3LUmzI4VK/Bqp6XOaOdapDVrkogX+
         KjoKYVOldfHdGBvETamk/+LjQxldyVQpZWYrl/bNxWQgjG4KbkFO/boXb3sCDGEW6rwA
         5SnN6/tb/tQYVJN/1eWXzhy1pkiktXfgQyANC6UO9ywNeDeQrgVfxv5uxO4XMF/MvL2E
         TC4Q==
X-Gm-Message-State: AOJu0Yx5ITaXVg0Dj2QbuC9lds7f8VHz9f7WYYW3zPGOFUt47Pwa8t4F
	o26dpGXCl01hbVCqtKoqVqch6cMckX5OrZu20kyKCpFn8hlIZGwxHBUUYU5lQJFSmiVC0qF8Bm+
	7vOzmdjF0wcj2zEjmo6UU9BHaDqQm6704QHnv9GvHkKH3to7J3RAJFpQeF3lpkY3g53jL
X-Gm-Gg: Acq92OFO2RwjG70YEfrt7Wzgg7Rxcx0UjBwY4QH4OKfiJa7B2+a6FpOFvCwSvv6F7be
	yvI0SaMb/dUNEdrceg3tP66fHaEhZzc7IKM+BiDFLV6r9LJr9RDNyEPxgqC5Z2X1uZumhEDl+zw
	JeONTiFXmtFjPo1QC1yrGBx+amLPTI4GGBix/Elp1PB0kzNtrrGBzXX2G+IahCaIkw6wlSyl6IK
	nIhP4qXs7IgPk6C/JQV3CJAOF84UXxc5UVoMK9UpjVrXKLHYPumRlvNpbZKbghlCQ6gq3/cSUu6
	dug6PXFkLJ7FAVGl2ZZSxA5kzY00w22kao/BmP2iI2ObExEwCznPGo7ABTCziJa7SLxA6PCRCMH
	Tk/+uWfqgwovit4NfW0GO2vyWTdoU6bwN5XLjGSd34dvSSg==
X-Received: by 2002:a17:90b:23c5:b0:36a:7c8f:13c4 with SMTP id 98e67ed59e1d1-36a7c8f15c0mr757100a91.20.1779444766105;
        Fri, 22 May 2026 03:12:46 -0700 (PDT)
X-Received: by 2002:a17:90b:23c5:b0:36a:7c8f:13c4 with SMTP id 98e67ed59e1d1-36a7c8f15c0mr757065a91.20.1779444765611;
        Fri, 22 May 2026 03:12:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:12:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:41:58 +0530
Subject: [PATCH v5 2/5] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-2-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=1562;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=VXyPjRyCvwokK/qdzZThuxToG/yvYiuIOD5L6w36bck=;
 b=hHmHtgDv/8JAzGDQHpoxO18rVqZunMZq4oxl0d3cCR+bDPnORL1fE/cpw/Xw180Vyv/75m9Dn
 jdLWruQY/RFAIr2sYPUchNZDz0KAyA6VsVna6zODm5Hqhh57SNm7AZb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: PHQ1FObkbFVssOK-akseG3TGu1KNuqdW
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a102c1f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aapufVXKjK5bSyzaIfAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: PHQ1FObkbFVssOK-akseG3TGu1KNuqdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfX49+1a8AXRi52
 tCo8BuWL3cSv+TXxKq1WCe1tQaiTsAqxyX341T5hKb6H2u+pbvJc//DxG/8XKnVJ8hPQxEQUkQd
 i+2zTGH0bCG0l0+gWOSz41mvxvxbvuavDa8r8CL/FSxEp92Be4ho4C7fa6Bt1eRQ47s9ga7IRvo
 T1Z+IGvdO4G9TUyEj1sevOzd1PaqCkXztc18xWuh6uX5lShVj54RcB6wWbHVe+jysFd4CV7ebeO
 wfk9fOqxncGYx0sn2odqs8X05RXf9rmADlX0Hs8wbaCS74Hv5XFxMi4voB2/o57I0BMqxtkHIbN
 EgG3evCN8FH6KCe5fNIAzT6KVcBcgdN9hi+ealff69pgAmwU6b3//cFQWKyOpGgAsdsIE9lmjrl
 QCTh6UNkCI7whhqABiAEbjwgb8tVARtzxUfwWzLq3PezLF5H+2+b/ycp4bTS3P/CVKFJUmzYp0I
 MAB+A1jkPwViUWxEwUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109237-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 723225B1EDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
It features a new slice architecture with 4 slices, significantly higher
bandwidth throughput compared to mobile counterparts, raytracing support,
and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
other improvements. Update the dt bindings documentation to describe this
GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca..77caacd0fb3f 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -411,6 +411,21 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-44070001
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          minItems: 2
+          maxItems: 2
+
   - if:
       properties:
         compatible:
@@ -434,6 +449,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node
       properties:

-- 
2.51.0


