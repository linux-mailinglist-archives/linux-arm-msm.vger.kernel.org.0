Return-Path: <linux-arm-msm+bounces-109527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN/FNNBXE2qA+wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:56:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 295525C400E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 633943051D42
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5CF31A56C;
	Sun, 24 May 2026 19:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rw7hzJkA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dcSPSDBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9363195FB
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652202; cv=none; b=uNS0eehRVNK7GBX/RBW1aIKkE2jSkbRBA+MYFPO5HjKsq807PWsZeA/eP9v/d3vGIKgklyApV2/wI3+gJrZk8tB1HT9biOWsxmrwp8ZiKoZyix0dtMgEktFUNp+bLy8KdRy7uxkx+/9JjLVD0+fpKYR+RHGmszioK47Jii3Ab7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652202; c=relaxed/simple;
	bh=b+23ZjD20/zfX0Wk+Yhgv7IVAfpuYgIBSYXxov+Xe7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUrDw+5x71uDOGpy7djfRE7Ne9FScKHTHHVuEDmUGSzijQQnAx1zQaOWjc/pbSzzQTVWrSr7hsKRePhcQ0v+TEMcuIlrKIlF/apLiz5vE75Mc3dYmv1RtAdc21Py3e7LEoKKrbQUUXAFQ9qqJ3seGwr1YXG/pTnQTDzu9Wm4NUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rw7hzJkA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcSPSDBT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OJ955o2580308
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RkUFsf2T+/cstUtuISGHLPa0b3uwoUOPZw+kpwQll2A=; b=Rw7hzJkAEPEUy1tG
	5GBH/nuXt5PRCUWKSkbGZwnj+UwCxiwjRkmdzMEQQNvKIELLpY2PG7vc6+CxLwyX
	Nt5TUD44KIxHjt6lnguoW7dhHFLUgGNUQzkj/Bl4cDYP9tQ0vJBpAMC2ChWmJMkO
	/+RlxFXp7iCuEqjACFgk2nB1vRLrn+dfpkxtvZBoVH/lb+dmqFaxC36/8sqsBKFK
	zwvcoTtHtRKAOjsB9jh++Uqwz+xwCYHE0aVXz1p/smo2xad5hOfi0iVWmDmrjIMg
	QAD7yh6aVIdBo0/GXLpaZ91UOLj2t8tqlHviPPd6lyaA2VtnSPToKyb25bjGRJtM
	aeq2UQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t41tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso9237533a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652200; x=1780257000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkUFsf2T+/cstUtuISGHLPa0b3uwoUOPZw+kpwQll2A=;
        b=dcSPSDBTdtmnFc06tsPwDBfzJS/gk4fK+l5ffY+3IxP9ZNyRfenHU4r6vNn9ZDlPT/
         5mmPtOuZAnu6R7aWgnHYbxO5jSjZvuak0eRhiicK0DdqAchosAODRthrRImz8l9F3EHz
         NeqmbL94yaap778pWPbeHuJb3XwbnDvRcXYJMEg0Za4pDNgz4KP11UfXLSp2Bp7MGVN+
         3kwWLyvHMCcoAQDDpLEuKccYycg07wWwFYsWj9QhdtiQ/JuabqKra0PF0BVSLPgbDTGt
         uhADoLlD4PXhP4OUzBkVvAOwwUoJW9ZHUKXqBIQ2Cagd6ok9MWPb90ngWPOiIYuk3Bzw
         XE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652200; x=1780257000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RkUFsf2T+/cstUtuISGHLPa0b3uwoUOPZw+kpwQll2A=;
        b=HNf+hBxDt23sc6j7/kNNtc37f4O8cyGXFdbVj4bIaKnhvNFhfh4T39EWtQYJWXPz07
         NSYUSEikMq+4OVFkQr9vRLPZ6fwV4mx7DWaLTwZVfVI8PvJngrPRc+vcuHBg2ZsBDpjP
         bySlzZA605pITIBLdyb0zqpPUYjjw7R5KHmppwZk6tiUxGBK7KAwfz1EpIWxwJB4JDzU
         G4bznDWEVcR4daM21yxdn/FFZ5pnTvlxaXeGha/WUk7P3iQwMW2YijxBLB9G2aBGi+bh
         X2zDxD9mfyWPWy3T0psmsh90DbTlqGk76lgBmCG/u5Auvm90K6yRmfUNLJOFhKxsfPlm
         g/oQ==
X-Gm-Message-State: AOJu0YwS9ojybEeY17MgSf4wgCtcg+yFgP2ll91pAHgIzZBYGJnbwLoS
	U2YoMt2wVJhsRKvr8ocxq1r+YmuXocXXpwMfdF7vrfvVszN9Tfy53qtKSVjHyoomzcTr4NIhW+S
	D77cGxIDrFhbf1uRQ19dxSA7tHtTuD7UvGmHGo3E6Jg7Sk7/cUlScPm9pAE4EUcGa+LZU
X-Gm-Gg: Acq92OFFvWpyLvdTsLaklqdbfyAab9FJO1IrG0o2FdsX7DhLOZ3XIzvFJ0y9E4uG5kW
	CzYGUNIxpReMxeoriudorh5Omh413au/ouPqtb6i4FKXWoFjQ2FQy08ri1uf8j0QCtXA2zeEGiQ
	18H1daboJBNqY+Mn/hPx4gPSodctAlhHI+82B2NWEucJgOmuIZNK2K5Uoyp0m1MfVek2yFZbPbU
	ki5aeJtFyPanDwROqiDKfYg71MzCWtetdauvKlrOyKanohNvlFS3bqY4b6jxLVFunxD9rMIOX16
	oht4L2FIgRwSuEvx6Z++9xez3EemmTDLR5kflY5CnPli3n56Zl2kIO4OTNanEa149HYcgfQHedV
	wecuZY9I3yPlYmuHWt4U+aMtZskSzgCJrnw2q
X-Received: by 2002:a17:90b:2712:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-36a6c79dd38mr8744331a91.12.1779652200271;
        Sun, 24 May 2026 12:50:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2712:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-36a6c79dd38mr8744310a91.12.1779652199671;
        Sun, 24 May 2026 12:49:59 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:59 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:10 +0530
Subject: [PATCH 06/16] arm64: dts: qcom: shikra: Add EPSS L3 interconnect
 provider node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-6-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=1320;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=dEWvwbcLQmzuI3XkSrEr3+ecYdNDbFw8synh+n3gH5Q=;
 b=9PueDrgoyTVBdXUt5RaCvm7z8DQPhu0eSbiw0BzW9l3UlKlj1VJul4jhUyK7CXS70IZ/zq2m7
 +cjS+ypBh4dBbJdF/6n/SIgI6JQTHZi8atbMSrhPZwCf3aBYW6Oxneh
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: HTkNjPqh6RLiVjornHgdEWqJJ3tO7Mr6
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a135669 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=V_Xbm4hklSwhDaoQdiQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: HTkNjPqh6RLiVjornHgdEWqJJ3tO7Mr6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX85R3T97aHu43
 WnU4h66KeiBQ4B7h0cJmHOxj/NDhkaHxU/yA6yDNbdkK7e52dAdWyBFcqzT4Oa8zpnRXwi8qN9z
 91ek18rp2qriLoQM6xKzgdSYnQw+s/AS3IwVzWf6ZHv84Y3FKUzMYnCPGZTwOtXQnbKKIqSgeuo
 T8MVjKA2kx53svdRO3npL5enYYFaHDklpSKUWngPj7TvIjcZIP0eeuwATQqfmQ4P5MpzcIuP87t
 UgvSDNgONRqRJS98d64WpNv2SRI9ABrHieupM643VHh8HfJTZ1/mL+9Eeaay5Bu3nGvkzn4oLSA
 dpcgYajs0Vga3ieHgrVsm5pau3Ph8IA79BT7gtC3CMjhyZGvLXwM8SUSXmpkalJXzJUsdBpOf/w
 eB1LTniX7hhR2zHfNvtr7UVdY8stwWimB7voQuZvEhjQNi3uyyuApxfpaLXMLPwl7aIMUhXx3MN
 KE3ig628GQUExqX3K+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109527-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fd91000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,f42d000:email,qualcomm.com:email,qualcomm.com:dkim,fd90000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 295525C400E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>

Add Epoch Subsystem (EPSS) L3 interconnect provider node for Shikra SoC.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 238772f064ec..ebdb4bc15d76 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
@@ -1833,6 +1834,14 @@ frame@f42d000 {
 			};
 		};
 
+		epss_l3: interconnect@fd90000 {
+			compatible = "qcom,shikra-epss-l3";
+			reg = <0x0 0x0fd90000 0x0 0x1000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+			#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@fd91000 {
 			compatible = "qcom,shikra-epss";
 			reg = <0x0 0x0fd91000 0x0 0x1000>,

-- 
2.34.1


