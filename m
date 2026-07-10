Return-Path: <linux-arm-msm+bounces-118166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eornDemTUGqT1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:40:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79198737C55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:40:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HAzGR4gH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZXUfXMrX;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118166-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118166-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB6FA302DA32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B394A3B27C4;
	Fri, 10 Jul 2026 06:39:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A663B2FED
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665591; cv=none; b=EDTiTPKGjZEzXHMRsOevUq80TGqjli3C4FBJ/mem2HeT8GgqGN9v83+HafdsIRh9OC1lraF/HDUkg5+ixvwpxMwOYZOLn9wZH1VvHC1V+FKVWsp2cSdb+gI8bQSPVH/HOOESAdQ5XyPq97sYFolLafqkOWdiFMllGrItDHzeBKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665591; c=relaxed/simple;
	bh=s597SoA0Es6E6Dx7MOn64cbXzPcD1O2u0RndGnPrgfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6hb0x20FzUnK15hfEnUQHKbCLDFmz33HBF147WsLXCq2WHoMM8ztDlzjZ0Djw9SGEAMlyRz4t3HdQ4npt5G+GvEf1D/soWA9QQnfUWODerpZvCSON48YA8A5C9aRO808R71zYTh9+oxO6RcnJKwNA3IV/iCyUJQLOzwwVbttkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAzGR4gH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXUfXMrX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3mstj3707443
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	musWKm/jLGKUne8nXQRelj3hjTR3ewQpv9iyDeGhvhU=; b=HAzGR4gHoQYB8czI
	wUVP2Lb6HHM1AGfqnQYE224dmkn5SZgdOAy43+wj/UAuq1tiK6Yprfi+98UuISC8
	fKtSqkMraPHzpoB94UAvl4QdmrxN8mo+oJ+302jNboQKBFmlLDuZd+BB2RJieiR4
	KcC+BV30sksCxSCm8bkii8M1KvYfa6cR1JTrYhSZxaoWt+1vdAyBc6Hg+LuviNPx
	5zjQjaaBKBOooYyYFMDhAavri+Lag99rwV/fjgjS366Ku/3wgOkNtKEpSW5j8nGv
	syhgm+euDqYQorndkuCcJSBuvCWJJm6R2zf+5xE+IO1L9af4sTaN8M0lGcDpVTce
	kHjrzQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg5k5n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:39:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so1004141a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665589; x=1784270389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=musWKm/jLGKUne8nXQRelj3hjTR3ewQpv9iyDeGhvhU=;
        b=ZXUfXMrXYxOU5mcOYXZmwbLPGCMVXSgBmM6zCwWMVBR0bK8pvFhnGsCK6m4xb0l7LM
         qSfnCT1m0WwDDX1Jt+25qcCTrbb0HGxdUMVLoxoC9d1+lpBGhzUTwb2yAYv8QKHCe4SZ
         055vBb6kT6W7W2imsKeWvuEgJfwUG3tJHJK3jYINP6AOqMcThckrsV97nNiuPuOjU3vW
         /ps180a5F7bLQAUQR5D71uH+rVVXMsXOao/0PQ6zxeL+cqn18quq9wu+i56cfimky96I
         i8FI8JgWJjhJ1/PvJfOti13pKXWkwMbAM8Q7wGfhoyCsMAs6hm4Mmd/f6M/XrITtNr+Y
         0uvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665589; x=1784270389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=musWKm/jLGKUne8nXQRelj3hjTR3ewQpv9iyDeGhvhU=;
        b=aRMPp76npFFYlLAO7jsYdNkTdU8i/+1fjkPsBBBrx/Nihg3oWiS5GjnV41OHLWE//5
         xgsqUtXzCqh4/NWDj52OQhoA+01B5/Gc7n9RMajTMFEZMkcgQoB8GTIRGduS7H7HFTDX
         xexkUJjJEDWNPPqtyPiW/sj1MLRr+qDoX2RH+XK3+tU/Xe3xI9yJFL24LObwyGXeoX+3
         F91c2Kfb4Ybsx4QSLYTLTZSrOmcm5DFr0mDmgLanDBvCul3o9IwZ3oeeHI2HhRAPGVFD
         +1NjJh4pNaC93IYHdF66kfqeu80bFni7JuppZV31+7SRkUXs6k+u/aQUbaMA+PoDWcKm
         AFQw==
X-Gm-Message-State: AOJu0YyAfHIE8HoqoIWtxsBaeFdfXS+Y+zJfdcHop0H7VRynyHHU/CaP
	3bofnt7Dl468m86zgHFQz4dWpZTuUhpha8Dzq5rypqg5owcgd7hvpgt5aLk2v+CJgqbZX6aofap
	L0HxA/7D6bayqVa7TebY15Edo+qten2UUFhKHljg5PUQds0EWeuaq9QjBkDuUgp9Fx2d0
X-Gm-Gg: AfdE7cnHwSgYdqyBkjcJqFsqtcE77IaEtyqr3njRXGWi7sR3r7zEmTGs5/eVNq5fv1r
	Z9a19jgV1WLJ5BzEf726JOAkTCGqX8v/NkukfmBQRro67/x/xtR7eWEXsqC6kQgUtErg3CyEr64
	g5586oWlfbNy69RnSpCy0yIarlYRDlgO854WyaTss7I4Y1XwNAfg9Qegl9/ETES4ef+b9ZPBh3q
	Fr7INvKc3DXgx5gzJ6W8Y8MKhY04nGKiY3f8K67SEae7ea+zdQh/RsmGrhTXZy4QIwAdxAuM9Re
	oqMDW3XZW7D8LC6Ozq/VgABhTJQ74GHXLuvR56KpaDdilJ06jJcJjCT3V64sTN28a7aPAEVP8Al
	E4Qt3u0P9b6K4iLF+e22r3exle4fJoKpFCap460bKMd/setFzXMmjYBrg84T3
X-Received: by 2002:a17:90b:2e06:b0:387:e0db:3d8b with SMTP id 98e67ed59e1d1-3894395305fmr12686111a91.38.1783665588858;
        Thu, 09 Jul 2026 23:39:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2e06:b0:387:e0db:3d8b with SMTP id 98e67ed59e1d1-3894395305fmr12686082a91.38.1783665588339;
        Thu, 09 Jul 2026 23:39:48 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm3578090eec.16.2026.07.09.23.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:39:47 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 23:39:42 -0700
Subject: [PATCH v6 1/4] dt-bindings: remoteproc: qcom: move glymur SoCCP
 pas to standalone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-glymur-soccp-v6-1-16f70227547d@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783665586; l=1457;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=s597SoA0Es6E6Dx7MOn64cbXzPcD1O2u0RndGnPrgfY=;
 b=tFYMU9w+6SAHzMNvdkV/x86adSmCMhi5D38fX0RisQ7ooF67HiMiP3yqdCT5fpqcDwYxbvANh
 dzHXBHZigy6C9Xth/trE+j6PynegPoF2Z1EX1XQ1x/oVKDo/h3nKYku
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Authority-Analysis: v=2.4 cv=FN8rAeos c=1 sm=1 tr=0 ts=6a5093b5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-Y8H4alDMU1xk5usMAgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfXySytOTuDJTS4
 g/tIThxqNggmirb2sHv616bAmJysVi0IZUHOkzxFaBjJjfzTssJ3ieJS3V4U1NvZQnAXZ/6stP0
 MiCehyxjC8es+71JEV8Mwo/AEk5aEqE=
X-Proofpoint-ORIG-GUID: eKXbv1sKkQj1_CpOO8o9Zf_w-KBAIT-g
X-Proofpoint-GUID: eKXbv1sKkQj1_CpOO8o9Zf_w-KBAIT-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX0NAtomY7CdmS
 O6XmR0wxgToPZveWXROmgse363dCTRlveZeL0JfXoLCWp6e3Ok0kwzJ6tOc8H/DVNDb2n1MrD54
 Ek1tKbAngN6RLGYbXUCfIt1RSN2ZaG7DA4SxH9TOgugIsSGmpmACZygg5fo0l1wDR0WgNzln8UA
 c/aKK9TkWpPYnPPHHkGiYobRYf1HIuKaN2erxiQK3iLASmHwA3/U1kWLB80uqrEHMF38JWSsoPA
 JS+IOx0aI2v8DhuSzbFK7SrdhwPo88kspm0FETMBBaGvq7IxpwGY1pv5Cr3gWreGCeekZpFBkhR
 UXJsY8lAV9We7m5DJIloO/q2dRUFMHkXhMX+V1cKsFZ1/P0y0nLBkBHAFxXr5aDkiOVC1a3O7hH
 3P/aZvk5B4yHsJjt8+lLDmr0f7uSu/1MY+/GzHJVAPCrNdAcllYd++wtXi9tytuiwKb12/mBchR
 Zn8VjtefZS9QcaGsOrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118166-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:jingyi.wang@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:abelvesa@kernel.org,m:qiang.yu@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79198737C55

SHM bridge creation is required to enable memory protection for both
remoteproc metadata and its memory region on Qualcomm SoCs like Glymur
running non-Gunyah based Hypervisors, unlike Kaanapali.

Having Glymur fall back to the Kaanapali binding is therefore incorrect
and breaks subsystem restart on Glymur.

Fix this by decoupling Glymur SoCCP PAS from Kaanapali and registering
it as its own binding.

Fixes: 8b54bacadc0c ("dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glymur platforms")
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index 8fd6913e414d..e6c78d621d17 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -20,11 +20,11 @@ properties:
     oneOf:
       - items:
           - enum:
-              - qcom,glymur-soccp-pas
               - qcom,hawi-soccp-pas
               - qcom,maili-soccp-pas
           - const: qcom,kaanapali-soccp-pas
       - enum:
+          - qcom,glymur-soccp-pas
           - qcom,kaanapali-soccp-pas
 
   reg:

-- 
2.43.0


