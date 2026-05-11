Return-Path: <linux-arm-msm+bounces-107001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CIxDes3AmrmpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:11:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 912335158DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFABE3037417
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 20:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1624937F736;
	Mon, 11 May 2026 20:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFcllWUa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnAb2x05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C343F28A3F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530061; cv=none; b=nQVPNHbWU8rp0ssS5IJ0ZvpD/ndb1qWGo06vvjeqGguc9DtgNObfQUUf831PRqCJ/Wnz4mRPxHXZEyP1o3L7HsEczwe/7wgqDx3m9/JVermxsUTgCPPvPMkOcmR5CWUAfPgJdZsaLkvaQtuN3TTBWy5LWpa5aoV2u/xxdsHrvIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530061; c=relaxed/simple;
	bh=Mpr6Q33aJKvJH4hPu7N8/Msc5ivh6tKB28dTURNeqko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBUAZWm1wRk6cWaHWCxtYNsNCaxNnAmtBib2YQ/R1qbORXVJy69Io1k4a00mYKoaKd7vKFQcmUjgSY+3lFoikixCc+hwpeozV6/7wexudx5NwAPBtFnqsbV55/r+NNZZgKjBmv/S4j7kZe01O1vzj0wa/WpAzAzMn2ai0p9+HhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFcllWUa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnAb2x05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK70Sr2574392
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=; b=XFcllWUay+9RdocR
	s0FI4YFR3bEBB2hQrvG5Jqm6twOHRpyg4YmErW6GeLCDH1j0rJsDAMTQ3XBf/Lj8
	CYirf48uZ3If66DyeyHdxAFQZ+U1m98gGpZbbtRm4XCG/Z560bozfPOrV+TMC3mR
	BjNtDWyM8iMlWSpyAY7phB6n3yn+M9BJZlIe40inyUgphNdPVCmog0W/JH/wVFLE
	uih/7WmDa/ixUjc3bvxdiktN/oNYgLYRv3en6VTKJ0C15kHlzbEvbJjhBTyA2jcf
	ULzHtOtcBVliv1VzfzSHGjNRQ+r6pRUQenXuAyymzfmYtdUNwNzHmWIN5Plm1o3Y
	VJOw0g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv28047-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354bc535546so3545690a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778530058; x=1779134858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=;
        b=dnAb2x05jXkva9+H+u5XqyNSpPkfbasLcoyr9VxjHYZNZwypy8UPNzEJ5aaVUEPcpe
         WcXzyBsCM1m0ZHElO3ZU66/prEifCExSIEzVvwwdz6AmxePF4KPloOzBvzc1MSK5rbGF
         Q68LmQdjGj5KlpjN1iuiuSDADVQ2G6R5FzgVV1ANUH3YeQ+98GL8b34/rMtdD4Hj94fG
         96zd90lFvXqgP2NmnpZCHbWQV+XUuMuUOxV+GswtmgwCHK7MZb1cFWroH9M3hESjLFK/
         6b8484gMse/F0fOVWcvRlW3dJVbr8txGqCHWKy9qughlD9F3nXj4ZCA+S/LDvZ1uWYcM
         UN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530058; x=1779134858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=;
        b=HzpYvNNKsiosuVPCluQCzQTzg4QzCEzhmWiBlJxxzEjoFQquf8yz6gCllMGyJl9Ys/
         MLL7xrYRO38lRbiHLcnd9/rqSlcAV0SgUO/nFB+vxyRO6kTw5lWfooWrd9j83jnCad7s
         ow4f90VOR3FNq7AVnqC5PXjvgF9KldWwGahmB3M/QpotSvu/w/bUJimCORV7LuwnDV0G
         yAepEqLC9BWBjB8EUDv5uSRRf97EM2Swe6L+p3aR+rZWvvF2WBCV8keN/we+8jvagLOX
         p0zIPuYyf5IGAUpzTisa6nXs1x13O2NoBCVRguZQ6TvgJnwQqj8m/qCg3eXXS3XWdTBi
         RofQ==
X-Gm-Message-State: AOJu0YxwNo4ItRoyBhyfYkwepc7VLH89LWwshyMsPg6gsf5WeuYf1I+U
	cDHR/E8yL1FzgxiN6VmJfWVDpwWcemDOysa2i8wacYLkjVGXr0EkOLH1YI8SNWmR/u/a74UMh23
	MubFOPmIw20U96jiWVNNb3bGSNBtxiAdeQzwYbkVMiflTPW9AY9XYQHbTDtzwa7lLZgSN
X-Gm-Gg: Acq92OGg34ro4bxvDCj4rinfS47BFNsXZ4Oq3oHPGmtBm3Ea5H/m3H2uc4gLXm+Nuhk
	4MNZVGTZtYCQ8uSH8pFb//4Lr7l02UzhH9b3tBsD/vgr+11rV9DQvme8Sh7XLz2xfJyWuGKqv5d
	PYBNDX6FkMpp/V1sI8p7/JBO7tOoj7hP++m+MHxVepaAMS4lefh7cR5McFtaJOue48AZU76wG30
	wvyFZOtTHr+Y8oqLBDxjxvWpqN/A2UYPjY/2/DHlSjESikepljFyvpLtYAJ70KfTRPNsFq/irs+
	0Q6IIt1c1UiB4HmmLYhLLNoUjT0O9GEjV1xrKHFvYcDpB94foXSm7d0iWotx8dZ0ntIsWjk6JHp
	udLu3FqgmVHliaGe2QFHkZd0NLbw7uKb16Nt97E5y8Otbpg==
X-Received: by 2002:a17:90b:4c89:b0:366:159a:c1c6 with SMTP id 98e67ed59e1d1-368b22ac929mr135523a91.2.1778530058236;
        Mon, 11 May 2026 13:07:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4c89:b0:366:159a:c1c6 with SMTP id 98e67ed59e1d1-368b22ac929mr135487a91.2.1778530057776;
        Mon, 11 May 2026 13:07:37 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b01ef884sm64911a91.5.2026.05.11.13.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:07:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 01:37:00 +0530
Subject: [PATCH v3 2/5] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-glymur-gpu-dt-v3-2-84232dc21c03@oss.qualcomm.com>
References: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
In-Reply-To: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778530037; l=1607;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Mpr6Q33aJKvJH4hPu7N8/Msc5ivh6tKB28dTURNeqko=;
 b=ekTosnc5DQLaWUndNzB/IGlZkotn0XZ9ww9uCjL0bIlNAzL1p1kuTxGJDPkkZ05OtUKen42Yk
 kcGU2RyLwPPCOPKLZaEjrhtLZVKoRDA3OX3zfVRJl2MP8AQe2ZkATu8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a02370b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aapufVXKjK5bSyzaIfAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Y2Yi8Jlsz15V5Jwyx5ZjzmsSGUWYyVHt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIxMyBTYWx0ZWRfX6mVcHS4rZMFq
 BzQGYK1yN64dWVAMZcBtTjSFkl63sIjROfWX2dJqPsPpH9nUJbxDiVFEAek/uNhe9xTOpZjefTD
 0ESkEHbtfiZtBRn+6OvwJBLAm8M68EFKlVuaBr7UL7uSPS75lH3nYTxSL+BRwtOs1W5fRk6QZt4
 o72a7/iUfFFU7L1t2FaZsosB2mUeAZIbPo9601kK+EHK0iqy8isouO50F8K8VuFk2YCEyzcgmNj
 w+ed0Ven5nJ7A4cP0irRgwivbpGwh/9yM5OFjooii5dfbSljHMDdVvi1xn2rPPS+EG01r7JcVCs
 NPZw7w1zeGa6KoM0cIRVv1Fu3GNKzj2QFo+1GQ1ucYl+Q1qtHzew/mT66cimXlar+8q41KVwwwo
 8Wh7B6n+kjBksyI33kqM5PNBW30H6s2P4NcVg/FJhzTlHm7xcG5eM8Xgudr5D8yWAitNC9idIVE
 YkeLaho8aq9CjuLh/nw==
X-Proofpoint-ORIG-GUID: Y2Yi8Jlsz15V5Jwyx5ZjzmsSGUWYyVHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110213
X-Rspamd-Queue-Id: 912335158DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107001-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
It features a new slice architecture with 4 slices, significantly higher
bandwidth throughput compared to mobile counterparts, raytracing support,
and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
other improvements. Update the dt bindings documentation to describe this
GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca..e67cd708dda2 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -411,6 +411,22 @@ allOf:
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
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+
   - if:
       properties:
         compatible:
@@ -434,6 +450,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node
       properties:

-- 
2.51.0


