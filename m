Return-Path: <linux-arm-msm+bounces-101545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJSAC6dazmmgnAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 14:01:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B9388B75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 14:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16782302E421
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B92D3CFF60;
	Thu,  2 Apr 2026 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5r57TnH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzvOrw0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B62370D66
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130893; cv=none; b=NiflYBjPeIUvcGAtLgj5Mq1GVg81aDV62z0Ct0qaLVO1gxGQxYk7on3cEkT+KtQQb63ZuHsY65m86YLO+p/4lFhJRICDg3uIRmPTFjXuJlXseBtAddfhUuwhanSqVedWicV9gq4J4Pz5QWGG4fdGZrwB6VTXWLxFDUz4QUqjRN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130893; c=relaxed/simple;
	bh=NEf+HxWDRsWfK9c9KQZCsERDb83KXrF9wLodgfVBeN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LY1XgvlnU2uXlrRv6TvKbz4Qx1MuFpp+vMwXGK7O7Qiyql0EU6Ds8qJQfOQWfnZsPUfSXsZCH+fLhb+/bzxFck5X4fTynBmmox3Rmsl2b2Cd26T2AKdRNeaotYlhEzefpVLbbcxAY3q/3gJQ3GAZFxJ2n1s3QiA4BTeh1CuHQQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5r57TnH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzvOrw0N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328d6CH1249320
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 11:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s5/sP5nLpSm
	lFWIWb0dtTmTRZPj9KiV8hkWLXy5fgck=; b=C5r57TnHlVM+6H8LoMR9CbM+65C
	AHhHZ/ssT5/0TnD0jjIwbv2Q/zDnBnZzp6BHTnY0cIrSXFSd+szUycDWqQhoS3cu
	mKfK8MvyDKLo8yymF0FvPYB19xVqOv12no21LU0XZgCvwMgDMYU4PEPYvH7/FHq+
	BQtnrUFC0xh165aLr/g9Z8YqmZTmmvQiKEjkBH4nAg9+FK3keUrmynKcvm3eB9qg
	368QmW/aMtARwqQiEnH5cgT/vXQSsAJhitCCOuE6j02MykkRykC1xpbNUmLZIlc3
	Lq7gkzzB6/C4llbtImatV338EStkTuAcUREGdNsG9VzNnSz1tchDNLCBK1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t0s5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 11:54:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4b81c632so21491691cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130882; x=1775735682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5/sP5nLpSmlFWIWb0dtTmTRZPj9KiV8hkWLXy5fgck=;
        b=XzvOrw0NY2Xqw3Vne3j5iYUEFt4nTeds7zsrxbYRmFSviEoBc9eNzXb3XCdFNr6L0p
         EIcDyGIZJE5DBoVXKmkho5BxIgFsanYzn+CENB2aTJWR7zUbis8lmCoYlZGbl5ss5zHr
         kDca+wjnLTk+GXuMRclnz2/q3CYrGIDlMPC4C12b3T0r8PZRg67wzwMAjnEpv99A7XYz
         uCCxLzQNFrQFtBJ5yZNbWF7lmB11eYeEsmNtaB4rRUsYwj7XgXrQ3sg4HjmRylzt1RPJ
         FHJbXA8c3/7z6H7QVJyLhWFrclbSrm8CtjdtZv4NGyuDZlyMWP3bjDGyksWD0RA6FSeY
         4qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130882; x=1775735682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5/sP5nLpSmlFWIWb0dtTmTRZPj9KiV8hkWLXy5fgck=;
        b=UccZO34ZvBL0rQ+inMgy9la6Tk/y9xNmb2Xu8AksUNTPerE/pTbD0eUKnyIe4LyBwQ
         H4wkv7wbnT0wteI/bhXu7DCo0Tbh/XyPgQ6XE6p9wkWdgSWviqcojXOwExibLSmv0xiT
         gdszOgf6LCn7g6azMwTz7yl9zKgKQRfEQBJb1gG1Oe+oJHB1Hvq4Y1VJVEr3TnxtINyw
         4QdQ7wAW8NNudUjm6MLTDgiAQwVWaydslrzSoWYlhtBqeAKN/OAAizzXwSm3Cvu3VFI5
         IZAdL686RitTfZTZTQdJLgguabbEgK8sJ62VkRgGd9n6qpGcOEFdx6d3akeIJ8UGTynG
         Ux5w==
X-Forwarded-Encrypted: i=1; AJvYcCVvjUIMkG5ZjvIw2y+r0DpUF2V+vt5/adbSgFk7+uZIPHVorRZULiJcgvN24ffHMytkgrG7Em2XYH8YAsas@vger.kernel.org
X-Gm-Message-State: AOJu0YwACW2d3ZYr+J14Ifed1iXgDxCucGE5tCOmd0nbfz8bdwZCxs7B
	OlZDKConlSxdLiOLqv7XF7RpftAN/LpO7kVbiwXkzkINAxt+UWRks4rXr4gzgZiOP1iZiF/PXS3
	1JDWe8s16Pnnmi/9CaVcTvvyWRjjTveb21hvx8eAO4Vr+2xNHTGsgjls4Dig92JDbAsml
X-Gm-Gg: ATEYQzxN6pDS4RrwtXjyilQMuIgNm35SOYzKfxy9f1eKDnh5nOQn3nnnRrCERMYLQc5
	+u4JtjH5F72OhwAyjcVv+mTMszuz2juFXuXDulE1xEgdIbiP9ajEpqsJQUjJKeSBdhhGTzOUH+X
	qaacL/crjBx9gaKb/KZuOzHMBrFQGBsb0DY/+ftpcDUPCQYktZkXb2urdRDyKLePXZGers9zwj/
	+IqgyZjhqmYG7WTh691HERpVtqxRFMwcIoYZvx6NUPaDzHzhjzgH3dzi0Ke3eS8V8/bGd9oK2xr
	pe/pUCHFI4/Gc/HMWZmDHgssQoZm55NXqa0qGJUahFaPoQHVpGQbyXlTlk0Y9eSgtEAyU2LSulu
	TSxSmejD3ECQM9mcnJQPZujVnCh4NOz88m+NE
X-Received: by 2002:a05:622a:1243:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50d3bcd3797mr93570581cf.43.1775130881960;
        Thu, 02 Apr 2026 04:54:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1243:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50d3bcd3797mr93570291cf.43.1775130881452;
        Thu, 02 Apr 2026 04:54:41 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8bc9dcsm111501545e9.6.2026.04.02.04.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:54:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 8/7] dt-bindings: display/msm: qcom,eliza-mdss: Correct DPU and DP ranges in example
Date: Thu,  2 Apr 2026 13:54:30 +0200
Message-ID: <20260402115429.100365-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NEf+HxWDRsWfK9c9KQZCsERDb83KXrF9wLodgfVBeN4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlj1/WZN9obM8xHyJscHB07EsJnP15xwOD5rG
 p3ZNsns+u6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5Y9QAKCRDBN2bmhouD
 1wqZD/0QEB7FL+7msgmMtu27RNQw9D6QuBXN9x+EJBNV03f7D5y1Z00sDOmh7kILklCpfIVrjfU
 yNiFSJc0ULwCFZuK/cKq3ob8ElN6/8nKKgQyT99wvE4fvrvwOrer8dYtV3MEHnMQuKbYUYLIQJo
 ragbbWnUV9tKf86DGBAmbWQZfMljbKQVihuZFSkVwNhlbizLWrYloBiX+hXUqY+ESTBR+qaSHpP
 zACGMaoXk0xngVpLMCclRZpVLMwVPSVGjol7PGrB+uJwIS/U2Q32n1f8W1le4nmYb/rkDfbQ7hu
 6R988SxfsMI3m2LdUvM+AF0jm0DAUJQ87F+AfIb3nWffTkdmlad7sVQG/incSvU+xyHug4m9ooR
 JVe16dspxQ7dkIWlFJ1szkXbfYBO4EF7UAkC4boCM/mhfYv70tEBPS8ySjTQtTCfl1z8Etdh3aN
 IbdfG1tTGEdbhy3pXAlw2S9PFMfoDd83kgKk41P4iojiDO5go/K/5l+pz64LwD+WamihC53ZwuN
 8FTVgYbIQEtvwEz04hL00mTaC3U84KpSPU43hCYkPNQJgJcUlw7nu8y9PtU3QE1RWe+/Z/WdeBo
 irl4Kr4nf1t/9/05RYfOHkJuv3rYKKsYO2HQB0wWQxrEDnlKzXx2Lh33A95iwifS3sWaDBi0zOB hM/rFqfnW9ogUWQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IxKn0PMINyMGF4V3AuOXFnYpzNPOW2uP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNiBTYWx0ZWRfX/o8VuQATx86T
 6NN3Hiae3fcICX5CK5iVh5QvJTE4hr/aSFizo7kI3PLtOcmGUNlntTZA+t7uqYv2vrrLhtZbGz6
 iIGf/D33SIk5QGOq+2q74aMGxVjZ5U9d8AUcrYGTMrZvgUZquNvKzFia20dGC78r2Obaotd/WS2
 H2qAGU7HmiogczgFG/3X/3p3RCVuCRHd/5F0LfT6RVdo5l3fxo4MFkxbMKqDQvMXAz/6dYVLrVG
 pjp1rl28Y7/xNJzDz78IGFYUBFgJSr9r5nVY/XuKr5hMOlqlPGFBWOaSQehVUAHbsvaladRJ/xf
 NcKSp7zL6yvQNb8rO/4lOD6CnQqGAUuEg7e/+C0Y/heruV/CqrCSceAxS3nViLkegMpq6hLJJEr
 BZUMvgGgPDS9RCLRjaVVovimZbSBJRM/frHPHwobwtlHIzh1UJlUKFG7Ox5xElH5Zao2eyGXFdn
 Bf4pVwoC0Cd/8BNHLZA==
X-Proofpoint-GUID: IxKn0PMINyMGF4V3AuOXFnYpzNPOW2uP
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce5902 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=2E8fMljBJZ0eQ63lGZAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020106
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RSPAMD_URIBL_FAIL(0.00)[ae01000:query timed out,ae97000:query timed out,ae95000:query timed out,af54000:query timed out,qualcomm.com:query timed out,oss.qualcomm.com:query timed out];
	TAGGED_FROM(0.00)[bounces-101545-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RSPAMD_EMAILBL_FAIL(0.00)[phy.ae97000:query timed out];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE1B9388B75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VBIF register range is 0x3000 long.  DisplayPort block has few too short
ranges and misses four more address spaces.  Similarly first part of DSI
space should be 0x300 long.

No practical impact, except when existing code is being re-used in new
contributions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

I forgot about this one, so patch numbering is a bit odd 8/7 :)

 .../bindings/display/msm/qcom,eliza-mdss.yaml | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
index 47938d13d1ca..bd4ba91a171f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
@@ -119,7 +119,7 @@ examples:
         mdss_mdp: display-controller@ae01000 {
             compatible = "qcom,eliza-dpu";
             reg = <0x0ae01000 0x93000>,
-                  <0x0aeb0000 0x2008>;
+                  <0x0aeb0000 0x3000>;
             reg-names = "mdp",
                         "vbif";
 
@@ -304,7 +304,7 @@ examples:
         mdss_dsi0_phy: phy@ae95000 {
             compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
             reg = <0x0ae95000 0x200>,
-                  <0x0ae95200 0x280>,
+                  <0x0ae95200 0x300>,
                   <0x0ae95500 0x400>;
             reg-names = "dsi_phy",
                         "dsi_phy_lane",
@@ -388,7 +388,7 @@ examples:
         mdss_dsi1_phy: phy@ae97000 {
             compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
             reg = <0x0ae97000 0x200>,
-                  <0x0ae97200 0x280>,
+                  <0x0ae97200 0x300>,
                   <0x0ae97500 0x400>;
             reg-names = "dsi_phy",
                         "dsi_phy_lane",
@@ -407,11 +407,15 @@ examples:
 
         displayport-controller@af54000 {
             compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
-            reg = <0xaf54000 0x104>,
-                  <0xaf54200 0xc0>,
-                  <0xaf55000 0x770>,
-                  <0xaf56000 0x9c>,
-                  <0xaf57000 0x9c>;
+            reg = <0x0af54000 0x200>,
+                  <0x0af54200 0x200>,
+                  <0x0af55000 0xc00>,
+                  <0x0af56000 0x400>,
+                  <0x0af57000 0x400>,
+                  <0x0af58000 0x400>,
+                  <0x0af59000 0x400>,
+                  <0x0af5a000 0x600>,
+                  <0x0af5b000 0x600>;
 
             interrupts-extended = <&mdss 12>;
 
-- 
2.51.0


