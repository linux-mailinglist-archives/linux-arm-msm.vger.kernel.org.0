Return-Path: <linux-arm-msm+bounces-103301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3OoIN+OT32leWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:34:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CE0404DCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 775E1302708C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608C63B8BC7;
	Wed, 15 Apr 2026 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3rfyK6S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUu0FoJC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0056A3AEF5F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260032; cv=none; b=uaeOSVRHM872sa9OAewBkHCYpuwjWihUwDRwSyPiDs2HzBmTIgQazTIjpegMdx5Y9MsVpSFpUctcVUU3+RzgGNSPE8QRhjTVpT43jMhdgnzJWk6xesXOch455NrM2ERHtSns5o1Klgw59LAjGiB7gDnoiJw54UsoRkBTL9BHuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260032; c=relaxed/simple;
	bh=jaWvwEt9ndPuG30CRSFYIxotCRFGMgAGMMUQpYK2etE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlRtImmGYCMeSe3oJrRdaME+F0TfsNa1qO3XREN0QzEhdDhrCs4kmjIo7vdOsE8ynMCOyqjDyYPTcxsE3ufuEdUT3/2Lcz2GAvpewGOe0KTEWpYYa11hYZcJI0IV36uQwn9AZATGuPk8tOMWxDbsMOgR6QZ2yJoSRwUVcKHIgN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3rfyK6S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUu0FoJC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9ghlO1778923
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWRX77Fpbh750tmNmoRIzfQyvGyeKlTdaGTrYvncf/M=; b=l3rfyK6S14CBobxt
	M2QRtuwAl6XsO/3/kNwNegw1fxr6E00a6dMX3iSrWzAPOe2rlj8iN8ULLpbBEpXr
	2V2uyhFYYkTlLHdOzbEWwTTRtMTf/rpP7fPPM7IZ2eGKb28EKCriKSAa1U7WnTBy
	ugUyLF0z2A1IFpZuFPr9Mw9wDoCRIsQqilfPRO6kZ4UmpvVQpivkq4N4sWtjBk+b
	pZ8xAeQhi5NzuLpMeE7SaC1bGa9kg00S2Z2FKRmo7VW0MaCvSlCgMZX6ogLKBLus
	sNZiUNQoV4Gd0FoFtcofzl7O3ZAmVuq+KR1yUe/5k/fjYWgaeI83fnTvDf+FXyN7
	0S8aig==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw03rak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f5baa5418so1169217b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776260030; x=1776864830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWRX77Fpbh750tmNmoRIzfQyvGyeKlTdaGTrYvncf/M=;
        b=jUu0FoJCIfbsMeH9SXW5pAJvYirhVPj9vIeNfQ7rZA45ZGxePVKxhaNhmVYdXgWR+i
         Mg138S6FZAU3nvA8dodimGejfjdPO5bDaCBWz/uILu2nbkTvd/dCpyZZX8EfxNjFr2oA
         h+nnlZsqB0f6v+u0fCUd/Unqw7foZySkUkHmWM2S+Q7k01ZPAS2rm0R/7EL04Wrpboq0
         vb2cfqby7yCcgS7kC/2UNz+6b/TPysDqwf3Nc2+1MADLQTJnQVVMPDveLVC7kX60hb0n
         RjC+i1Lx8FRSitfFmNLLZnl4y1Y9CuXJfqcGO5t+Al51wFv/EmVaHYK2nFJl9bplQkQZ
         yg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260030; x=1776864830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWRX77Fpbh750tmNmoRIzfQyvGyeKlTdaGTrYvncf/M=;
        b=nKmUrwcwVpTgX1y9g9f5Z5Ms6BU69eDbgdvT4VE37gcnws4qseVkLSWLDOSRPxkjuV
         1nejYUXvqmrjHNK9o0IXCp15q+7+BaIxHgOX9iOOAaFggRh+Js3FfFpOxC0K+/5G+QfJ
         TRTzvkUQl2H0DREnonEclfJxN7o2GpkWrWr5rg9BgnU1FSHaZO+vOrQEdvIT09uO+Ss+
         PXQFRHTXNbiXGWgMiSm2sELqC2PW/zusgpGUuBk5jlyR8u9sY9yohJXdTPfczxlWQ659
         CsWYXBo/uS3sivl39B233u/NjAs4a4cgmoWOHY7LFjYFafKRzkGmcrcoevgmnlijTkZC
         M6SQ==
X-Gm-Message-State: AOJu0YxCCQiwyYlyADt4eLbN6Pq4q2wMnfiJRnNQQUrpCH7qpqMUnFVy
	dbUyZb7uWED9MVbJcN6tCt9nBSjcSgXR/2RPdATPcznQ5vF8KPcGDPVAKMCtuqtCZv8/WTzq442
	VfVQHJdoXAoN85BN6foK6joFd9jGeRzeLsnufHLNN2wJ/FRVO2VycYtJNJxCGxebWBrD5
X-Gm-Gg: AeBDiesPiqbizrHKClr+bp2UvpbrkYBjSQJ+v81OQtYZs33k1cZjPqGRu38oWGOKXpV
	550wHT27p7R0ciKV04jM1uvBMivqXE8b6I50eXf9Md8uKeYjq9i/P9B0d3B696L6ZLHs8Ir1fUZ
	PFqj4Crc5X2XuhB15a/Wu/lAPItG8mSeOwKDRpeYAVgl3klPG2oxA226C2MoKJalsTGJjjJxjka
	52f+gJH1u44C3wn4yWSVZQCcwhurhYJGr7wiIii1K7ZzHN39l+wa4D+QvNLiE2VoStAyIYPvP/8
	q4EgcSBhwSePsC1VKMiLQQPZuXhGGuPyboYFCA3U1M7OZASTePpdlsY9+bUblS60O1atP/sX2dN
	fv9k3s0s/3SCvWSWfcc753TTHPzSWQyF6kVnTIefWaP7jl/dimnwFaJCKkncOzckm5n364gKpN5
	5dXAFetl1Ql4bYCd8SeQ6yppF53bCnpma0Qi5t6lS5s5oj8wW8jiSShVnC
X-Received: by 2002:a05:6a00:2a06:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82f0d3530d0mr19462545b3a.22.1776260029730;
        Wed, 15 Apr 2026 06:33:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a06:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82f0d3530d0mr19462516b3a.22.1776260029246;
        Wed, 15 Apr 2026 06:33:49 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6b95f222sm1602774b3a.29.2026.04.15.06.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:33:48 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 19:03:20 +0530
Subject: [PATCH 5/5] arm64: defconfig: enable IPQ9650 RDP488 base configs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_boot_to_shell-v1-5-b37eb4c3a1d1@oss.qualcomm.com>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776260000; l=936;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=jaWvwEt9ndPuG30CRSFYIxotCRFGMgAGMMUQpYK2etE=;
 b=zjkiZk2sTrb/9BHcsPSY3WLlAPWnBr3E3SX6hwzQfhTJJEYfrStQUUiR/9unnwH7KZ0kQECvw
 nrBaNGo7KNlC+aj9RDJvv3a2wfq1yN7YRLSkBrsNSQKCUUESSGF9yXw
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: Y3KsBr4VPNbcbnbBsCEXxipWa1YVCEBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfX0SDCRG7sGraK
 viOBZ/FwnwkQvs4+N1QOpAzPkt9k0v+fV8isFiUstUoXuH7FGu2gX7ZogRZGQfPsbiRA4Mzwnp4
 OfzZokNsLncYhIKYLhkV22r0PkyAWEUa1TpM6f+vVt2FmekGwBgZz58eJjkQUjOaeNe8x4KwknR
 4r8tdn8cIQ+JevIz1HoHky4G+mnHx4s+hTfJR+cFYacltm1S2lOL0pUv8/oOTxsXvmhdHknfJzf
 R8BIQjMktaZsOv6PKrvLpt5xZ7mnqwK45YQUnKt901eAg9GG2antGY5Xcm3vO1F2uar+hGqGrsa
 q4MoeZHMI0JUHxiqI8KfD7nNbJENln3hSfWY3L8/P21B5bVnA2+dgrI/3D31sGZTnGhurv19X/y
 vGsmJgX7jrpjb7ws391FdtEFcCy7R+2FUM79OFSiUjhg16ekBhBHLiASeVuInqsSgpfByuLMin6
 wtQwr0OqPUgxc5mdBaA==
X-Proofpoint-ORIG-GUID: Y3KsBr4VPNbcbnbBsCEXxipWa1YVCEBA
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df93be cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103301-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78CE0404DCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable GCC, Pinctrl for Qualcomm's IPQ9650 SoC which is required to boot
ipq9650-rdp488 board to a console shell.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..442aee9d197c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -662,6 +662,7 @@ CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
 CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_IPQ9574=y
+CONFIG_PINCTRL_IPQ9650=y
 CONFIG_PINCTRL_KAANAPALI=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_MSM8953=y
@@ -1509,6 +1510,7 @@ CONFIG_IPQ_GCC_5424=y
 CONFIG_IPQ_GCC_6018=y
 CONFIG_IPQ_GCC_8074=y
 CONFIG_IPQ_GCC_9574=y
+CONFIG_IPQ_GCC_9650=y
 CONFIG_IPQ_NSSCC_5424=m
 CONFIG_IPQ_NSSCC_9574=m
 CONFIG_MSM_GCC_8916=y

-- 
2.34.1


