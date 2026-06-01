Return-Path: <linux-arm-msm+bounces-110675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMMvKRrTHWpMfAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:44:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC348624312
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B668B30E28F5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 18:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2E73F0A84;
	Mon,  1 Jun 2026 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVpih0gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YeP+XHoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A73ED5DE
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338188; cv=none; b=RaVRXEIB2LHcXLTMgmydxnhuuDMjIUjoaaLhplqPew/1o0ymruWtMHMN1+bljWmEE4SUlscucoOFlIMU6zxdGBb6kGxPE1aqS3pe2YcvTxSHwVYSH8zs7iK1isxLVfy3gEirKZ8oeraaCE5gmQ8s6rstGgxZBNmdoMGWfG7gLyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338188; c=relaxed/simple;
	bh=jFgECGOc2on3Y6/jQdflAVXWBUYw8TvKJBBoRvGtuV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mf27YrAYDx4Sh7Brh8ZwBOB0i+7DlxR8/852NlTO3qpKeqkEYPSqX9SYTvtaxK+j2IhujWi+I6Td/R1f7GAHN1254fkfanxrFSLpbV0eBO2VUAhSR97lrUTweBL6rFeBHIzVrCJ/un5S+mRvsnvQayskLTeOxaBXqNlTKWB6IyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVpih0gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YeP+XHoB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FKecl4110250
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 18:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1KLv90Wjpb0X0k9PHELOtYP3UsUCkMTevPPBD8PoQc=; b=KVpih0ghoQ4vEN1S
	QyKVXtlXAtFH5Jbq0ckBzHJnt1y5TAatz1TB57WUZtBt7srITbu9O3hLUBXsTD7w
	9V6xaq9FAPs2JrHfHy6QH9mba4/ohdN5nZULRWuiWW+1JjLqCCVvAOki2kjKmDh2
	SOxrJ3ZLaPHsC0mouKCA1NH8oHS2NnCzCEoj9j/gInKKVn7UPS3pdU/M6hvCWDCt
	48WP7L5DmLlcaCasLBydH596TbwRlx1XD8WgPxcQFsdSYFjgYnsZdwr6gxxBI05r
	N3+h5E2Gokts2HQp6d11b7DZb1tt9OywbbFGJHDlyhQIGLbeovhkcAREdKr13gEv
	odLoeg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3teg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 18:23:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1105583a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338185; x=1780942985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1KLv90Wjpb0X0k9PHELOtYP3UsUCkMTevPPBD8PoQc=;
        b=YeP+XHoBnev2j+b+1bu9eMNRNgppc8hgY3S8QyinfgVMgmS+GEhvro13yOjDgDzLa0
         NCRXzUWLGGrTE7Bi7rXrhsiA7dwdcqdNnuIn+32x8FLNFxe0ZZTZ5lqvxxQSlPy5yRZJ
         TxwGil09hpkqL/oq1coGkwieDow8VgGbmp2JfUZC7i17dekj2rkojkDDGAsI3KOeDdLr
         jZEOBrzCLyy0l6Ub/7MQiqG5Op9/X+NevVIYCmj2SaJdkyu4IXIL3LWmBhSl2Yun9JTF
         sofy0cO8Hchgec+Rrb4xKrPko7hTzdc4K/Hb6w+vcTJzDfH809EZKPWCE0YhJ+fl31nI
         HLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338185; x=1780942985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O1KLv90Wjpb0X0k9PHELOtYP3UsUCkMTevPPBD8PoQc=;
        b=hFXlEUT5qcw5NoNwGrkl1rIoJ50i0H2FIRrdvX0UXnhda1OuCmniSdDutNfGZhDfI/
         PznjWQLTizhNogc2KcvWeIGqR1agHhPOQMWgbGKlKfnYAZze9iNOP5UjwB56jOEZncIX
         tY+Oyll5Txse+rCWRGsi9iTP7LN7vi8tG7/gW1B9gebSwvC97rCFZx+I1jA6FdV8vioj
         Xj1x90RLYgRN3E8RdviZwdLouGn8gbbl9giFiDcI6w5xO5TVPF4z13G3BwGL7WtVaweP
         XHKVwBg8yrxJ37JEmfjYzENja6gt9Pf//DMY7w/L4xQs8+midb+qIXFRt+XeRxxAs116
         CbfA==
X-Forwarded-Encrypted: i=1; AFNElJ91BU5rCkabu8WbmyCLoOZIkM4h1UQKJaRRKhBsLtgyzVlp2KuldMQ9DcOL0rXu8HEc0+1B53z4GhpOw10S@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Ws4UqJNU+rLycpGV2MmPK6qTfsOSiRQGudnO4knu6Ov8oA2t
	Qv8bybCwWrIeKzt+QSNhHVv35K/A8zWonhjh1fZbZk4KW5IadQqEKyL4m5ZkkbJfAacYl/EE2yo
	lMnZN1RR4TQQX0VVC0YeU3nmMkBJK+oAMnnnGh+1bvdaak61B97tq75cgWDoXQMPa8F/5
X-Gm-Gg: Acq92OEs2nRDIi+Yne9FRdmear19UuDD4igBjilBushP6CH/NRGz9xj3iP2qcggcNnk
	4Xk+iWglX4UOMKAj9Z8G+lThvt1FEp8xnJJ6KZ4JGlHYln5/eMkKi0XX1XJGgzYTOHAUZPpxuth
	Vb8nUNUdxls2Yh1A2cL9st3vtue1QCW82xoAyJG/fUhBa+V19gN3omDyQX82jPHlKM4zAXi/4FX
	kPeJyl/Sa47/N8DY78vsI+QaIsGYQOYPtvvlpaxoOS6IwjxFirwRTAF1MRVKZvdCth0FmMmxduH
	k1+RRmJ7Ac4ZMMatNibwOIiud3h4j4duPutJLT/PuN2WmQtwY7TfzyaeO3r1RDUBxkxItvW5hgD
	HU3uPgYcn5pEZhasqHCT8A8O6/mtgXrsA2Tcpz9NY336PrdO6FBVqfR2TLVipEFA=
X-Received: by 2002:a17:90b:590f:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-36c501ec093mr9724214a91.14.1780338184780;
        Mon, 01 Jun 2026 11:23:04 -0700 (PDT)
X-Received: by 2002:a17:90b:590f:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-36c501ec093mr9724178a91.14.1780338184303;
        Mon, 01 Jun 2026 11:23:04 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:23:03 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:34 +0530
Subject: [PATCH v3 12/12] arm64: dts: qcom: agatti: Add DSI1 PHY and sleep
 clocks to DISPCC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-12-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1dce09 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Gd0QNvzNEKi-DX6Kg7cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX0tC5eEjpH5YT
 USuVaWdBQMFh76XvjM7W8LjzYpp6rckSFBhSKLt+I70rNYHfIJcg33gpzPPtUfXVprfxYcM5yP8
 R4p2D79GpCOpSYwJe5FaZOql1xwj4JCU21juuqZqaKUBGF8ggUY6cGrrT0NzJ7dxACHhn2aqY0H
 fAeor1+tUwaUrFMPjkPXrN/1IKdbESyo/hKtYYWX9p3FqIcmUrHpNdd0CHo2wNQDSyRXC17W9cX
 PWVFkKSoUKq6c//m7hgK/SYPCcOyyWB1+zpu21pp6e1XHYXsE8OiqZFTFupNd0RF/K+kvTBaHsB
 vNrnKNKhP8kraHc/cqOfiEo1hlOJ3OUOZW0VclqE8VF3Nv67YhxAXJt8Z2CTT/TuHCExbq1P2lg
 OHQMLcd3BoMj1dLdxtBpdBHk2oCmOJiwkZs6KtYaAVkshCmDv5P4Rxg1eu8whiLSV8HH8xkC2lL
 OtjN89v0FvYkub/hqyw==
X-Proofpoint-GUID: CvW-glUUzGDYN7ShppIBMuD-ufDPg9DG
X-Proofpoint-ORIG-GUID: CvW-glUUzGDYN7ShppIBMuD-ufDPg9DG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110675-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[5f00000:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC348624312
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
bindings changes, which adds support for the DSI1 PHY and sleep clocks.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1ebe2c40d64ed670752a680085b871..d8b07db81ace41f6fe2c7139ef283bea0d0c3da9 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2137,13 +2137,19 @@ dispcc: clock-controller@5f00000 {
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
 				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
-				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <0>,
+				 <0>,
+				 <&sleep_clk>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "gcc_disp_gpll0_clk_src",
 				      "gcc_disp_gpll0_div_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
-				      "dsi0_phy_pll_out_dsiclk";
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "sleep_clk";
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1


