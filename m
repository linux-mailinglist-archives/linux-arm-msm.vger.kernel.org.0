Return-Path: <linux-arm-msm+bounces-113760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X9VqAEzYM2qwHAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:36:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A95569FC8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:36:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UOKJSaMD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cY8tgqcK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113760-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113760-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7871C3065915
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CFB39A7E5;
	Thu, 18 Jun 2026 11:35:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFAC285CAD
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:35:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782537; cv=none; b=DB20JpTuAp4qRDMoMLvpArzaA7344xcClytcLXdUoKfC4ZNMIRrbRUZNwGdKw1jhBw0/ckqBIIDkgQlfTtSqQnpZBRvGcTGSNGxLc+iitWC0ZBClDSqeHvDOtjMknkf9x6f2BDgPVuDoDhs7v/OexhUouhsopJdTyeqL5YF3stQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782537; c=relaxed/simple;
	bh=mlb3na05TSFuumjcboA5bHq99pBRdGeM8PJe1BADJk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oh/iebaoyf340Fap7gFjtsiz5P8JqENDu2fw7KH1G/+sOW/ZMbG2tSAwpfmp2ZnHS0JbftErdpIG+MJHNA3UomPH6OzFh4fajRSGtL5QDdHTnRxyJRSzN88chtDSbjiLpgwJ/5jYyjdLk74TnEE6Jr9zN1+J520rgPh8mXTg4/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOKJSaMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cY8tgqcK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IBVtSm1685111
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c24HNE6lCA8
	fpSztzgUnXvl+DfaDo/AAtNxdyNGgpeo=; b=UOKJSaMDiviT73FR9EwfxjtxFdC
	5HyLYwsYDcz9gObNjlpHyqjeh+gHy1nQ7YuRldJBiMn7sZkTefLoLEEHTUBS5Lq8
	7hVgnr2zz0Q7Wkfn3SNV6FN0RxYfA1eGJDOJ+T5je88+NMROx74POdOSZjkKO5IQ
	+hNeUW8O5hejZzW+xjGn38nhU7iY8O7b/+d3FKkSYvanNUxBEE9xkR6j/MEi5fyb
	BRgURjDh6/X+89SUlahMbUcv3TlgRGClL5lrjz4XcZ+HPfml5E3wp+JEFNRKcS91
	AY/o46cCwk+9NnsF+ZVyHeDItEVSb1BZ4W6qY+J/5fqoTBH7hkaK6LPPufA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2jvamu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:35:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37c3620a6faso605583a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781782534; x=1782387334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c24HNE6lCA8fpSztzgUnXvl+DfaDo/AAtNxdyNGgpeo=;
        b=cY8tgqcKc7NdTzCJ+3OlJyUOZSJZsY4y0lyA4QA6qwtQk+YJL6MM5+h6Q9YqXcdA0d
         0LhIx0DBAkK/OXV4Gbvjji06+ujAKpKV5wwzg8DWvUf4pz5wG+sSJLQhnjJ8vOXgIGqJ
         clPEggVGgyq+2SmpKPGu5uzDCG8/GkEhjzAr9UYZAzShEbo4/dv3Vj0GbYbyz9AfwFu9
         4YlvYZm4rGtfAUR0ix0qmyKdZ+X7sZ4e0P7Y9kAJwztJtjcMI/ipD46zFwEzbYL8jhDh
         ByJzP39MgEYYIShKhXEgNj4bwkdWYcAGq4EaoDRoSH9Ud3z0938IFpHdDAcRCcptJpj9
         hJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782534; x=1782387334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c24HNE6lCA8fpSztzgUnXvl+DfaDo/AAtNxdyNGgpeo=;
        b=lj0iDzOeXhWpb8KaxeIz3Qc+FSHqdujXfBGIddwr6s4HZYKpmkFTIE0nzl8TJ6moXI
         P+/Hzpl66RX4OoNBXB34FCjTPL0BS6AffQDwoVHeZZIUIC3EfFk4sU6sTw8mh5Uh2eyW
         RFJkENKzpceCkCW3CF15u26rnMGRZcUD+hg+e3tPbxsK2DxnHG51uaYiIiKY8zFvsJTB
         V8MNTi7pLQsLVCEQi9mCrSDAtjldcOZm3aJiF4YisNykd7/W6tRytslYv9HQh2ksZ55v
         IWT8/CnMwn2cYQPLn0m+dQhXowSMuJtKGnTg4fvrDFLeIvNWlkDL5fQCePu8Ju1sdTFP
         nTOA==
X-Gm-Message-State: AOJu0YzoW0+qZPLM2qJaNVsdTXMYw0iVECa9+t7Z67wo82ORat5NqtAQ
	VN+O6xWy5qtzCTgXQwT3n+vEpa8U6qRWHd1VB77bm7w1KeYpEG1dIvcNNQS3sMTopiT9bmlPIpR
	yXAgJ+1xqhr0EVMJ4z5qKZtG/6vYEgT9U6qcOMAM1La5wTrb3EbwCvXhZq2yrrHcunTbx
X-Gm-Gg: AfdE7cnAtV5H03RJo9/irLqPL3XsHJAMeRl+CUYWALd9/BfZ+UrXIoFb79imTOcISft
	BzRaZ3AUTwzzvkpuA1j7TVP02xfOOZwQ1MyqIT3AySatO1YWJ4ZA7fvv8fWAUSXIlxjHE77keLh
	wo2nJI79+NzKP1356anrOCJQrpUEVK42Z8GpTcefdeD1Ib5ADRnZTWpWABW73G2xl46oHQiovs1
	6+F5azlqwu4LdDM/kvgxT6vxKJw0F4mbIVb9g4s9TDqnHNd3VsxnOOr4YzHtFHUHw4Idv/CVmK7
	7MPtmwzj2vGllmpdxSk6wPCIIpZI/LlzgTcSlXhk+G9hBU9ifsnGQArwIov/E70h8eQVpzKtyU1
	YckeknYNmjs91s+8MD6Vz6gieJgTV2obDFKVe+dU=
X-Received: by 2002:a17:90b:1cd0:b0:36d:ee3b:fcae with SMTP id 98e67ed59e1d1-37ce4512df2mr3166719a91.6.1781782533978;
        Thu, 18 Jun 2026 04:35:33 -0700 (PDT)
X-Received: by 2002:a17:90b:1cd0:b0:36d:ee3b:fcae with SMTP id 98e67ed59e1d1-37ce4512df2mr3166671a91.6.1781782533508;
        Thu, 18 Jun 2026 04:35:33 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ca7a7sm9067856a91.7.2026.06.18.04.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:35:33 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Add MDSP carveout memory and update APM DAIs memory regions
Date: Thu, 18 Jun 2026 17:05:09 +0530
Message-Id: <20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfXyQYPt8pWheOC
 +S3utjQJNLLeECCarByZZsTVy5QNvs9IIexKO8gSmKTGVqngITaVDiXtHzlOfGnei/8P9027MGd
 f0zKYtwMSyLyDztsyT5JybE1K7bpowOVDpzmu1tKUGLK5i9n78MmPEX7n+3BsEkDTopFe+GgmEX
 2a1+yh5bnQNajjUKs/rtg3PLUCuxQjKFtMq/v4vr9jq+lLleaSZbQuUxyB9A/mfcC6l04U9LMMG
 3lEI0kttMe+h1uYb7njKHtjLtwbCeGyiorVOyNxgGsU0Fmdwxl6ubGTTr600NfTpKr3TAtScBA3
 GByiHzHW3d1gwsVmFSyv75oStTSrm9FZLMmYfXkZA1OMXvw0xSakRgshdlxvMt6XR1N8YW6XSW3
 ue3XTxXMykBJ/4hqlx7WG3/WUQ/ADEzvaziJ92AhEBlq+YZTzsnRwcdzQJcRMt8anETXXIsnU8e
 ESoH7cYqOqhhVEp7OJg==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a33d806 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=giDWo1LGG_5EQGLNojYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: qB5KUdjMS6BiSGqd7dXElNlOu-VMH0W8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX81IpYs+XhcOj
 M3KIUAMu2J1EfjaDikqapafjwlmO5FdfhLIt8g2vtLoWEBTusIxNoyv9+KgHcsPIkoNxKXDnQSh
 J5cr2BfHhERJU74/rXtqnUnuB/IXRyk=
X-Proofpoint-GUID: qB5KUdjMS6BiSGqd7dXElNlOu-VMH0W8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180107
X-Rspamd-Action: no action
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113760-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A95569FC8E

Add a dedicated MDSP carveout memory region for audio usecases on
Shikra and mark both existing audio heap and MDSP carveout regions
as shared DMA pools.

Update the Q6 APM DAI node to reference multiple memory regions,
where index 0 is used for control path buffers and index 1 is used
for MDSP data path buffers. This separation ensures proper memory
allocation and access for APM communication between APSS and MDSP.

Also add shared-dma-pool compatibility to the existing audio heap
region to align with upstream DMA pool usage.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 88954ee943ef..d744f7e38ca6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -365,7 +365,14 @@ smem_mem: smem@86000000 {
 		};
 
 		audio_heap_mem: audio-heap@86200000 {
-			reg = <0x0 0x86200000 0x0 0x100000>;
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86200000 0x0 0x40000>;
+			no-map;
+		};
+
+		audio_mdsp_carveout_mem: audio-mdsp-carveout@86240000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86240000 0x0 0x100000>;
 			no-map;
 		};
 
@@ -1935,7 +1942,10 @@ q6apmbedai: bedais {
 
 						q6apmdai: dais {
 							compatible = "qcom,q6apm-dais";
-							qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+							memory-region = <&audio_heap_mem
+									 &audio_mdsp_carveout_mem>;
+							qcom,vmid = <QCOM_SCM_VMID_LPASS
+								     QCOM_SCM_VMID_MSS_MSA>;
 						};
 					};
 
-- 
2.34.1


