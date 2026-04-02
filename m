Return-Path: <linux-arm-msm+bounces-101541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBrKF6BZzml2nAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:57:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE6B388AC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3DD530E2BFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227E73E1CE0;
	Thu,  2 Apr 2026 11:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8zS5SRZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBG08kPt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6003DEAF3
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130353; cv=none; b=tqYcOMOgaA0zU+YH/jT53GBwReymHxqWzVNsL8QDR9ZQPTaqUAu0hB3YvofeJ3CaP2Q7oYPwzWZ6c4TaDibjPQrqF10+vlLOa/yfsmHrOWNFhDoXVY6HEEW94fV8rLF+Rk4kcwEnU+rSC+aplvxQIuB8H6yTLUimfHIU5CP/pNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130353; c=relaxed/simple;
	bh=cikxYZCMBRNg0V1GMjULfidchhUEEc6a9UCGqPBYh+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/Cqqa1kNvyDfc3UZFtfBjVXYbWNSuI5wWLihhJrSXwY4u4tJ0qYTppkwzQcpcqlG6XEHQ/1hgjA5xgMEgTb7CRFB39zDXYfXzS9Db7GNuGEvQsO0wdprRuegSRHIYOKnbNyfaRnzpD1D49jQVjgGQdOO0RsyMKoeUICsbesrik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8zS5SRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBG08kPt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326lu8H4009498
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 11:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u69S/TJ5H48qNg5eh+ouhg7rNEWoiU7d61/6yt/Y27M=; b=G8zS5SRZ9Tvx0G1L
	WH8hnKh7uRioSSaNknIfw3WLRme4CcDCbK2vr3v+dMnq5lhT42AfgjBeGqDdVHlM
	WrJUpn3C4NJecWOqBt3HCfLmgqDbUUUKzicg6tYymyMbK3BEiZmPieKWqtsOiuOA
	0BovxY7q4gp/gIzaYq1KfIYJItmr8bLhOyH1Kxov13XWX6RaL1lYY74oqkSRC9BS
	hiWRd8z99mH3lr/Q/c4LOioD3XLaxmDqRHnQ3VzGLYa9TqCWvdQUPhr5mZ7s0F2Y
	3WBjRWzjkQxUgA8feDPW+JE1Ozdf7wgGPwaCo0V+7lRygJ0SkIJAR+Ql2c28jC9o
	2QVTBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e03u35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 11:45:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094ba09affso20659571cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130339; x=1775735139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u69S/TJ5H48qNg5eh+ouhg7rNEWoiU7d61/6yt/Y27M=;
        b=aBG08kPtYoPKk8e97sdZEFSkCmzuAHBSXUFVmAd8yD/3sdkZ45LAXGZ4U96BT1OI/X
         Itsi9SUE/fmCbi7oSqEDjFvJKUNSbkren5j+S3T77J3G5v1IMFvEVjlB+YUuafuo5sA1
         S9UU7PAXWEgLNwXkNDj59PfUfMPehq9S4mquc4ppZP2HhTihepdtgjzHHLoZSguKUJoE
         C7xxm0eN7++g6XEcNJdf94ez8l84kNoAwDrUFBD0Kt2S0y1ZDbSkEg71bHZl3J7t/uUx
         qfSXAjqcqjt4cDhAfVZE14ZXu2uet/O5YFM6wQP9QDz2bi1pOi4hmz5F+9PJY0/dyMAG
         amEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130339; x=1775735139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u69S/TJ5H48qNg5eh+ouhg7rNEWoiU7d61/6yt/Y27M=;
        b=o/1ki9oTeXpneHrnPZpj3SmBWR7Cq4w8UyUIlKVFVbI0I5inJkjj43LjXMe70GQ7vT
         EVmHtEPurmk5bwDVO/pbKVOWM4bBkpk24VcbrbKHAk23awl2pTGBy7OrzuDLCTDU7bGW
         wACuOPd3ucR/+TuM3vGFdIm11frfYody8pb4c7UAJj9moLKFfezvpRLMn9lo9o336qwZ
         Dr/gSeOlTNBhPU4ZkW+U4TyVIiN5QtVhBMktL/jp3y1p3EfZtLk4qjFl5jFTH2dNicFy
         gnwZlKb3JduXIq7fSWLlhcU1rXsJMs7ekmRSsHhPt70MOu/N2PN7WBkSrYnGbgH4Kr5i
         mB+Q==
X-Gm-Message-State: AOJu0YyhiUG+08iomavfijdWBdPW1YAxC2o+HQ7NO75mDQuFDFgiGpO3
	573fdUjThwWitD0oKgxIS0iRLYllCOTfebRBkkYcpohyk8H+fVvkydbcw2Ho3z3hu9wMi2o5Nie
	ObxR3DysbGearZSSswuKGrAEpnGnexDwIFTJKrbnULWA1H86IYKSxxkzKJiTu/vgg4P1p
X-Gm-Gg: ATEYQzxHhqTPZq/ult43PWcGP2MP5beqbPqWV/x7hwhWsG5OAOh/0kFoPudwIsNUiUX
	xkFD74N7LQe5Y+jNBB5r3kv9G20DjZtbLHPi+stlot4QyCSMnPO05N6ZFRUAoED1TuR42rBmCjL
	1qJ7Y8oMnHyhe4C6nUQm1Cf3OEH5bmltsJOBVlMv4QsmUJDgRCnYYYiV4RrHyo4FL5waLpScsqe
	3dGdluo29hdIEsXprIuiQ8SAS0Su2eSE+mC1wsdoPos8tEaO5iQerfmW+9h0SGE8i74z+O359YM
	ccFOSeRlF6jpWFdQb3cT962Czn+5w6u93+420oXdR8VTrJg2K88UlSr0izOb4LP3D77cTMQQrFs
	0lFK+cWSpMK41+ejp1mXD6/b6N4X3rDGbsBWqB0oQKpD4
X-Received: by 2002:a05:622a:207:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50d3bc92420mr102554311cf.19.1775130338645;
        Thu, 02 Apr 2026 04:45:38 -0700 (PDT)
X-Received: by 2002:a05:622a:207:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50d3bc92420mr102553691cf.19.1775130338208;
        Thu, 02 Apr 2026 04:45:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:17 +0200
Subject: [PATCH 6/7] arm64: dts: qcom: sm8750: Correct and complete DP
 address spaces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-6-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cikxYZCMBRNg0V1GMjULfidchhUEEc6a9UCGqPBYh+s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbQYRDq4k5OCWp8S+4aGjhOn4G3hqwTIPvQt
 D9loWcksCaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5W0AAKCRDBN2bmhouD
 1z2kD/9wXv1XidF60fqEM+OmuRpOggS9P8g1IoM7kFAaJFLNYZdowO7Zd70Bj2Cxhk1YxkCSyuF
 GrooOVgHKJTeUnTLFO5lRZvHfD5ozA+/jp+BWgGY3xPbnezWVsuwWT/XaeHZmBfUAnG/v314o4d
 uQkmqrgSuP+ISa1T7Ba3La694uiC5S6eI75Z/5pK5LVGrw+CiWfoJuOqtxNV22h9L1+6TFRseV8
 47nKDieXEmkXAjrSJbu7U7aXnFRHw+tJAaSPXZisp119M0a7WZiDr7y6ED0MN9C+Asg/A2niQvn
 Cdq5HR3PVxB2NrAF1I1bhYC8HObMM48ePpdN175LlHzNdihyYQ9l76y28dGuPX/nfH8m85F5S0z
 ttQrvMu6Wu0ytgJogsIA7CRpmDDiz8nEDX2E9sacd/FMgw/T/kpZd812RzwQ9umbBjb7vbqacuE
 iKlmPXrusfNjWfVmF9IHjCPtzl10JMXWuDhso8pIT9Sk8nQC1oCIDJS4GT/2JQP24nc1spt2n+L
 Xvk+8FFzEQWYa8CtWBFYwENzKTz3nbz84XiCH+8WhgtdSM6LYiNvoGbTM+JKApdn98QJgmNgR/s
 DI55y6bid3qdrFA9ziIObUwKA1VFpf3NsNd/F9RXuvEAHnxjwUBeAKFJYF42M9yKW2YXtxTSiXI
 rqUfb1eszYZwmNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce56e3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RMXozov3DQQ1vOc4o_QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: zB4BktmJ7uzgdIX_e6q_TP28ZcuLlKHd
X-Proofpoint-GUID: zB4BktmJ7uzgdIX_e6q_TP28ZcuLlKHd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfX9U1hFNWR66E0
 MjcJiC0pH6m7G4re2/v9wu+Xx6+IXGxQgEWH+h8MhTsx0LRhZVRM4ezU2+xIyjYiINGHiXznpo9
 e9BrHZI/pu/JCrQKCfmIYjV2Zzzl5yDDq3631Ijb82hyLDyRREFQeqWWq0TnDedtOd6oZQh1+Fn
 XvB2b1MyX4k/yT8mbP+b3Sl+kvbkcuEc8eSIAOWpp6axjLvElPfm5mm4GAxuSZm/k+JaXoyL678
 c6xXaEEkkSDy5d1otZXLNEjGnf2fd38BV9Rf6ggOEVg4Go49SEMQOrLCKBRYo6tkBhiPlXiQznF
 7n1YOoF4ci1CVLqLnae6R0FPVXKVpshGkwVqh+Vu6jd8EJXVqZ2EnQticg50K7hNKZfS1oPCbmM
 nV9FTEHs0B653VNt/nj8f70x6ogjZEAGGcuvxI5etMp8Ltizwrz4I7NN22Q5CULAacEd3prRBY+
 av1P+8iJBqJwYlq7z7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101541-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,af54000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CAE6B388AC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DisplayPort block on Qualcomm SM8750 has few too short address space
ranges and misses four more spaces.  Complete the hardware description,
which in the future might be important for full feature support.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

dtbs_check success depends on the binding change (first commit).
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..aefe517e0669 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3325,11 +3325,15 @@ mdss_dsi1_phy: phy@ae97000 {
 
 			mdss_dp0: displayport-controller@af54000 {
 				compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
-				reg = <0x0 0xaf54000 0x0 0x104>,
-				      <0x0 0xaf54200 0x0 0xc0>,
-				      <0x0 0xaf55000 0x0 0x770>,
-				      <0x0 0xaf56000 0x0 0x9c>,
-				      <0x0 0xaf57000 0x0 0x9c>;
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>,
+				      <0x0 0x0af57000 0x0 0x400>,
+				      <0x0 0x0af58000 0x0 0x400>,
+				      <0x0 0x0af59000 0x0 0x400>,
+				      <0x0 0x0af5a000 0x0 0x600>,
+				      <0x0 0x0af5b000 0x0 0x600>;
 
 				interrupts-extended = <&mdss 12>;
 

-- 
2.51.0


