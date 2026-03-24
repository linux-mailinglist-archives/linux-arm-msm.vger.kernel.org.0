Return-Path: <linux-arm-msm+bounces-99681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMglLt+PwmkXfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:21:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B4309475
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8392630FFB53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE97F381AF6;
	Tue, 24 Mar 2026 13:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HR4b3+2P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RsaW0L21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148623F9F41
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358050; cv=none; b=TvkrfpNwMzwsWUsSdTsY2AX7gTcCprRjmanuDOCkiY9cW/Fq1SkmCTtmrIQEmEKzVtaOlnzo5GOARbJX7GNSNDtxLqPQAIlQHw/xZkqug1kRkGJ1vTgEsOVfFmQkUbAXhHTNvTyUwIsxREEpBjRkK/8ikoD37VwgUahLMEZQSkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358050; c=relaxed/simple;
	bh=A0IQkyvp9VZJjwmAmBglvF2YtSzqW/Om3BUQHbt+9PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dMlBOZ5jUh61V8wc/+QuqqiJpClvq7HIMffWsY7xP7MdJw+vF1w/bzZ7O4FxYvwENk40b4lZ2n3016VJoJ5Que4xJx2HVryk9X89K4gbQ/aywOYTYCyLJdlVgFahLqulAPa8FIrI0AqY8ODcHXX+rjFt04PyfnO2xR/sAcL6ERc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HR4b3+2P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RsaW0L21; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xpaj2323405
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p49DQ9JYh9TPZn7lluAR8uoK85UpgfGic+fiunj6Xfw=; b=HR4b3+2P4gKKefGr
	xyShQ1hJ/vEW7utNLGRNfCoocYVUmJDLJ6+g23HRO0T13hb3f28D9H+zp24iWTHk
	Tql5ZLWwbEy+2rMpxv4tIQx3xf0AOIFIp8/cs4A22XYBuePjYvPVXU1ULJnSpOZ7
	AgUnv9RnNcc0j0arpshTYwO63JSh5R8pTNNlE5aJL3VxlKbYed1jhAuiuVxW6IHT
	62UiKkrwTT8dNEj+D0kBEHLeMtLH5FsbGglYajc/IcsrMO+m6XMkhIgVAyn/73sp
	1IF6GxMXzWjtWEifHlStpLKgXJX1akLb8RvB6TX6JWvVxzFPcKWFyrxPs3tdYP0G
	OkqikA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkes0hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:14:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8299499d587so978838b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774358047; x=1774962847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p49DQ9JYh9TPZn7lluAR8uoK85UpgfGic+fiunj6Xfw=;
        b=RsaW0L219XzTUFKaRd/NP1q/12Va4A3uyi45VKX97fRUypVMLpmYsYs2u3ktuczBCU
         /StwyyCoojvXeSeeaOKLZEwnAvesmBz/fhpuf/YytJIEkQ3HUzkV66eUrcrBQK748nHP
         0Jj4JImjebbZ6mDE/llj2i8Z7MtDMaccvXDl0koXaT6D8fI4JiFErJTtY+DiETsPyuwX
         Wa8ym3NAWiMlMNGYFQ0qpQc2Rd0Y20B8spMD/kt5yRKp9FU3g2ZdN45WqkTElOMTe9BX
         ezVbwpRm8N7drgrlyTwMHQv9dkIzMppZtPHtApBqlzqN0n2Mi0tnhBVdyqtYeckLWZgc
         25Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358047; x=1774962847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p49DQ9JYh9TPZn7lluAR8uoK85UpgfGic+fiunj6Xfw=;
        b=swXJZ5I2zrnTVsfuEYhcUh4qToyB0aMDjbej2WQss1xQxQKF9epEv6D1nvu2z0NDZu
         Dn4Cpoyrrsj7Nb6dNyXQMnxNg2XRF3UY5cb1pnr+BxIaOA+mB6I0qJ+iKqfe4cLUKM1i
         Yu8gk4RlLtmOVYfzhgSasWLpTBqFiRVhZndPXbVld1aeawbAlRqhdlNb4cBKmVo+bb0M
         kgKg9JO6bKM1QAlMe75M3dlvzAyt+SdnSqq89YMLs2Av+zgmI+hjlpKRjEwyDZqJskgL
         dpx5bwvDrTzHVL1KXXTe9UpDO7z2UaoVgh6I5nh+WYDGrfn/3mvmZkHM3Htk5rrn6cDy
         0iwg==
X-Gm-Message-State: AOJu0YwbB0gHnVx08k7e89l5JX3UH0L7qZ0zL1swbUBYSqgC3P6n+yFR
	rlsV3W0kbBufPfjFoTw6yTEI3YdWkzVl0fvve0LzK0/5BmIqNAikqRzjYh5YsM33eUcjWB4j0Dr
	2uTE8ZM3GTWBXOfXqm/A/lIyb/CWIohKj/FjLoPjP61JGa92T36fMZI3vE7Ecw3Y3mVh7
X-Gm-Gg: ATEYQzygijESY1C2YmnqLf1V049FUM9dtOisoi3rBtvDYH1jnEuR55/FHKlLfvzxZ13
	F0c7ithOhK7Xg6ZYDkLfydUNETict0WTTetdNcUzNAMngg4Ox92/MNKd1clg6dPHfxVoSWZYWCN
	G9rMwPbe6HEAAw6y6a5d/FfDZ7gpKpexikvEPYIFVj5xqUpftAkiQdW+f/lItYS6YV9iju2QnTO
	/RJB4/r8t9B3MpT02vQ3tv54HbcKC8Gwl81ICPi5b2MCWP4p5PEtpzp4UxxRrD7r/tpDlcNO1BZ
	yUpOfA3+bb0ZiguhAfKJ3zbQZtrDaP9EoK/7PlPUuCms81N6Qm+bBh5PsZ2widIRFcMfjpqaP8u
	fRzdmit+oPR1QcffOZtd8G4DE6D0JioM5u5V/xq5E7WaJyD4X9ttCYIY00Q==
X-Received: by 2002:a05:6a00:3021:b0:827:32d7:6690 with SMTP id d2e1a72fcca58-82a8c247b32mr12915559b3a.13.1774358046955;
        Tue, 24 Mar 2026 06:14:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:3021:b0:827:32d7:6690 with SMTP id d2e1a72fcca58-82a8c247b32mr12915516b3a.13.1774358046441;
        Tue, 24 Mar 2026 06:14:06 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be3396sm13517528b3a.27.2026.03.24.06.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:14:05 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 18:43:22 +0530
Subject: [PATCH v1 5/6] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-spi-nor-v1-5-3efe59c1c119@oss.qualcomm.com>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
In-Reply-To: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774358020; l=1216;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=A0IQkyvp9VZJjwmAmBglvF2YtSzqW/Om3BUQHbt+9PA=;
 b=4XndccXI+zSN2z8Oy7LANASK9ox/cowRjbMa+de4SmBbO7qZSU/bgr3Pa93WWU73f2MQaIZO5
 hfD2tVEEqyqAtTeysI7pogjR5ugjlWMG29C5n89CvHGIpjmgMlSkO08
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: Bf8vCL848vSNAnymnCGxLtO65TMZK_7G
X-Proofpoint-ORIG-GUID: Bf8vCL848vSNAnymnCGxLtO65TMZK_7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX+cblD+rQNy3n
 fLJCX0zX8tjejg9dWNk0pd+Eonlz6N2lHIdD+jev4ykdix5Okpg88qrTsBlJh5iSthBnlVBJpdz
 UP0X3f3OZXRkyCLydosjlFYJ8wjPCEI5ESOyvalP75H7GiJPutBp3qiHZeJTMdp9IBgoGggkLc3
 wU/QPhjj0NI1385/L91X7gUNLS1ZUg0wV2gTItkgf6P1Fud7yRCaEtEIwUxg4N0Iu7dDo346xJX
 5DKD2bN6Td6s8EDVX6PQvynOAT/wUwwmn2gRlxiR0wdvKTQplc216B9DBF0AF8csZBJamMthwAk
 Q5RcYegjkUpXG1/eulvMaJp40CqIdvCLJGmYVLc3256Y9Sl54IaGoegeMxerqxdpybNFs4MUtEK
 T404Pf01BWQWElGEcyZhE+DreoX0B0SytyJxryq8SCuTzQAt9notr79Nt1zQtkJToDxI15zsLNY
 N7vgOGpJoEaMCDK3jRg==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c28e20 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=L5xbH5DL_T0GcX1SYtwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99681-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,88dc000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D0B4309475
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without it, the interconnect framework cannot vote for
the bandwidth required by QSPI DMA data transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..9a44bb3811a7 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4312,9 +4312,10 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&cnoc2 SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QSPI_0 0>,
+					<&aggre1_noc MASTER_QSPI_0 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7280_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1


