Return-Path: <linux-arm-msm+bounces-107430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD3ABsfJBGp2OwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:58:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2BB5396DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 102263077614
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4183AE1A2;
	Wed, 13 May 2026 18:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePkpyPNp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcKoWITz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8763A6B9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697642; cv=none; b=Yxs/4KtsA8JwKrWCBq4xffFfmmcB5sry347nstVp79nv6BZkElA29u+vFrr7BOnZ3GoMXEPiC9crjyDRzFRpqNOp5VaZsxhhItNdZxWrX7AQDOAXfy7KMYNyGxhqSUPnIfcf6kITuYlL08E/9rK9gDc3diV01SxI6dHLlZFQPvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697642; c=relaxed/simple;
	bh=LTHMLdWF8HFpPeJgdf3vWYwEXH7E4tFvMQpFvdkayZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9bvKdsdv4voLdUmnMhVS9jYyeyCwzl4AzaIU9nCJXE4uN3ESINV0Aux41OoGiJoSdeC4xRy6sTGUnrJ4TCwCLjNO8SjeRdT30fWT+z8XVzOEUs+AxbAcnMnOZrUIvDWyXODBDRT/PnjpDvA7+utAco4wRC08l+ojzjOEhc889k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePkpyPNp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcKoWITz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBxUQc3324708
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=; b=ePkpyPNphE2SdN8m
	tbHhUAZXkYMKYyU0KXIZzBEOk8juKZmSGQUvKjhGR156q//SsxUI4lvNi/sEnS3h
	vmEOXKwuFgvmUakjXFc5AR5oqurwNkb8RtCNFY7CPlwsNGsxgKOg0/9LySX2jAkC
	Ftw2j8N3kFZbJQvYCee6ffzSB6/FYqhCJgfF0yTXst5oQwYdSABIjp8fzikjtQat
	aNzim+P8Tk9qtMKEEXYWHDJcrshUThahc+lB1i9HN90XVhFHPWWEsUpg+FOFK1ZX
	PBzvcR2Qkh6ZRei4DvqEUTtFXwrQPAmLK0DdgOEwTnV4VvNHVJ7DxUVhCxmeCkES
	ItLGdA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvdb0ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:40:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3662668b825so185837a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778697636; x=1779302436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=;
        b=NcKoWITz4AVWkTWm9K2iKoAl/QH+ODcle5SCCQwMZV5ztu52o7jfuKBfF5vXwc0LeG
         azK76xHD8KlHAJbwU4S/oEHss8ur7ZJXkWO7c2kag/sZrXXSXa9lbHPAjlYi0HYYxgoz
         cfzPGkZDPOBjxVA4HgcVwbz8T/YfXwu1N4dOMAHlALnWMSbOuDdXchallJYOAwK7QCGw
         afInQay9SJrab8rImf0qriM0wjr2E2qhh6PasoDSH7ni/uVOGD/i8/Hp6lC2Dbzei8pb
         CkZfk9GOq82GzewhFeik4LEv2RqghYgq+7CjpQOLWmxB9vXU6YhDlDrvR9DmhGrNRAjI
         4GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697636; x=1779302436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=;
        b=Eb3GefKF3K1xZjwEMkca2XCVY4C4RwCtXMEfm+LdRrVbm5sS8IoUE93q63TuPCKKfR
         jrbdKdnvtwWnHcrywOUEpO0kp/gkr5D4gvaK82K+99iToE77FefdErUKV8WeraMsw9dm
         ZZvdlSpmlntd6eKWG/gpdkAqPCBw9TJI93bkoKpm4WgvtkV8vwuyavJ1fjKt+sD31Rh2
         pmZ3zaQhezt6sg39lG7h31sjR9ui7xnZB5k0OnY2ccEFM6eWt9naofMHX9737rw6rfOP
         Ojx/Ay7HmfT2Ip0D8VR+dXyA6SsQoIxJ66DdU514yNLeFyXG5YK6cmqQ22SyTx/UrQjI
         UvZA==
X-Forwarded-Encrypted: i=1; AFNElJ8og4nevftItb4gWp0VZvEBNTqgY4JGjFcNi5V1/jvXkj+c7AQAjiHZyrM51QlLRwOZDVPn5L3hqlyAxg15@vger.kernel.org
X-Gm-Message-State: AOJu0YxlPhBgao3b3eYPs8ScB2VnTZTCxqCRFGxLFzsWCVal7g53UbdX
	8GybrCOBz0YDvnmebeawyhAA8icmdtnTo67W7UwT6Rs/Jje1B3ShiWkDoer5zUkweWkdqyFVKMt
	I8KMjhwTyIRDZmPngtXvN2FtIne3FfuvpiVDBKTBK7BiGRlF8gE/MRza4Vrv/P7eWuEi4
X-Gm-Gg: Acq92OEBRjmxerctVaJdR2ZMfV2l1SIL+cnqTSoEgmD/GMSchXf//9Y9MFtVeTN1G+o
	ryPhhU/5F97JIfcIoeM4xHiUC8GKm0MVB1sXLkFkD9v9LiBDk1867vj7I7d14lpzClQGZhFK9vC
	BIMfEOeKfmbgoz2mdG/wLWtZTgin0nqVC3p0rGwRunAlAUMQUzL6H1upckcDFHI7jgJVUCiGBvK
	yEMuX8azAuRa/EkrN00iZIu9lifdXdjyn1emt0YxhgVy5TLiDz/umQhyaajICHlhiZpIfNpJRCe
	YS3RxdBzafdGXYGULuCsuqMKR/vpHqHYDKjwPy8aOMBJ2X9v5quc6Ug8tGvhvb+LkdFRmdRdlnN
	MYArmqTMercYmrlJRbbqnkkqjfUug2itXaPU9OcPEZVQoWGQZlEUCVGHF/5uiQ661og==
X-Received: by 2002:a17:90b:3f83:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-368f7993ccbmr4389630a91.14.1778697635693;
        Wed, 13 May 2026 11:40:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3f83:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-368f7993ccbmr4389607a91.14.1778697635238;
        Wed, 13 May 2026 11:40:35 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm15271009a12.24.2026.05.13.11.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:40:34 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:10:05 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali: Add qcrypto node support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-knp_qce-v1-3-0ebdac98e50c@oss.qualcomm.com>
References: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: CYsD6F06Z4pRZQ5ki8RZ9lEJ3Rwthq35
X-Proofpoint-ORIG-GUID: CYsD6F06Z4pRZQ5ki8RZ9lEJ3Rwthq35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NSBTYWx0ZWRfX8nbQ2IfcKLEz
 WH2L5idkSm5CmiL4yX21MslFKe8Tz3S7sDe2LY7yJOpf3oRuBojWZ0gkKfyrpjos1X9MxQkeEPn
 MYQSdP9KLG2ugjygmZC+OOmu4bnTWE3d/5SvSH2ncjJtXHxnGVv1JUuO/bvL1UQkbyMlf9tcN+y
 7GuO4EI9HNjCqmE7qagsY5H2TjyZR5Qw1SwcfcGKvuGe6o2JIEajdk2TB+AHkcmP4pdeiVPckKy
 dUcLR27sg58/nqZIEHgX+hFdgCtzjj0tH8mvRNISbS1p08K7iRpOFPLTKXhZdRJIHRolYueN9iR
 YCFp+lNkLLGucg5Ozrn+lRMBNOYSc8HE7rr+qCTp/xs91Z9hKv7lsszLYRF3UxV9n7GGAIxPHm4
 cACXqc2jAO6SG6lNQMd1KU/9TL2HvfmaOO9npPUz3uHsm2MuU8Z6pmlXc6qeOe1U4vJGkwUBYH5
 9hFPrtkXi42cLF4bAYg==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04c5a4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lX4hch5PzS7iFd4KNucA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130185
X-Rspamd-Queue-Id: 1B2BB5396DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107430-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d88000:email,1f40000:email,qualcomm.com:email,qualcomm.com:dkim,1dc4000:email,1dfa000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add qcrypto and cryptobam support for kaanapali target.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..941c9b131a4e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2541,6 +2541,31 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v2.0.0";
+			reg = <0x0 0x01dc4000 0x0 0x22000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0xc0 0x0>,
+				 <&apps_smmu 0xc1 0x0>;
+			qcom,ee = <0>;
+			qcom,num-ees = <4>;
+			num-channels = <20>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,kaanapali-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0xc0 0x0>,
+				 <&apps_smmu 0xc1 0x0>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1


