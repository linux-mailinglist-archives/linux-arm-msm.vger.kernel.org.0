Return-Path: <linux-arm-msm+bounces-103820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHYsM3Rj5mkKvwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:33:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 837954316EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E830A30120FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481223A3E68;
	Mon, 20 Apr 2026 17:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOQic2JO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUBTiXHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1AD3A3E71
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706108; cv=none; b=u5EUJ5qVkP5aUdyrzGDkCCtxPvQpEaQANg8F+pvRzqTvSJIYrdVw2BOzFVjK5VPIlXRp/HR2eJ4X6DNTyEWJDpX3P733KAbhApNgT/SqzOE9aPnRjpZgXea/WOpaIp85nH3tEXaQKP+g/eCEuGC3QTxy82zpoqVX1aUHoXX1Wc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706108; c=relaxed/simple;
	bh=UY552z3y8obE9CEbg4drEcr+gXd0WCTjZOc7FcG2UE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aYhTqSPOC0alvPHcRD7y2mQ0iW5ZaVmYVgtW6WbcRMFGHQt53kJv2oaabTc/0NyMOJnrcnq6J6KjlE7ytP9TSbWeYVModmJUppgWLTn30SJgbMFCeC5c7Zf7G8RpJ6FXCS9d+KlSK6DxjNEEW0zRrtLwwb4y0y43CpQckxJPrxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOQic2JO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUBTiXHb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFKJNq2755820
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JKDaKyK8qTv
	C9N3FxHWako1QPbw3kAUgAinToGZ5C/U=; b=OOQic2JOgoBb5LDyfFvwo2MOymO
	WxL1Fy3uZY3ebaj2dusAfo0LiWVTDISYzctQTyvCu0P5g/8bhEt6hD65PZihmZly
	4Sj0phoT/LBvRIMKlSRwq0edh4DQSV0wN/vqxFpxedsFvP4xSU/t4mhvEt22DLkc
	4VldjcOy8Fy6REKJkrlWzip/RsIylu8YTaGE6qmfSVsTjyKkd8/aVjTJ8jOLLJKM
	/LY5TCXqPd8Mo11N9s35O6+2cDdr4fBj1WSA/xzhdyO9rwG5UqT95Qdhc14WCHUh
	a4ueMwsZ1wPLVnuH+eDJ+8Bs/HyxNXkSkHfkBBJAZpLefS+S8pHlXQqHKEg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xhus9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:28:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so3572338a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776706105; x=1777310905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKDaKyK8qTvC9N3FxHWako1QPbw3kAUgAinToGZ5C/U=;
        b=OUBTiXHbM+Xj6wxO1b2c8WtoMOZT9Tu9dhtBO1I67+HnJ88Q7FHhX++srnkbfHg+oO
         Dsx1bbMIw/i0a+5u/AgkNTP8rHzGOVNnX5HYHzCp3fQf94TnZoTS3ofC5oYoNErKidOz
         Pf4hPw4e38bSSpqq4XLiVcHlfgrRjhapbLTZYkb496glUGybqQJATkEGXgN0a7j/oKrm
         fQ0XOXVXLYvl8Q7uw9REWn6bDRtFVdUvwD4JMrX/P7Ad/gIOXDa7taZ6WbwNArujDOXD
         BNEH22Jy/lBX/VkDjaho6zJBTB6lAyjWhSvYD7Uuv5YcyWD0X07THup3Yn1b32kifz46
         hG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706105; x=1777310905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JKDaKyK8qTvC9N3FxHWako1QPbw3kAUgAinToGZ5C/U=;
        b=CfQ7lufs8+lRW5VlCz/jUs1+x3pKtCG9VuDwPyRi1xyxzEsWUDVxiTyWQSIG3m1Gvq
         v1aoDY4wNeThTmAHXaUMX01gpoJd9G2NaLYLFODJR0agw3CkHDdw4UEy6G+z0c/BBZWs
         jRIJQF/3SLk7umj8fl1N8qm+yBmOqa6botIRau6lNLPhhd6tspdjvt0lVcJ0oUVEIZaN
         gv8omQd2voYWg1IhUFEK52h61cG7ElSXsR4NpdoX/pyTwIH18hyuJGrWThWFScT4lWGb
         TePBfAPxFgZjfTiVsNdXr7bpZl2npY2/7/9rC7ywF/ggI1y8BH3SXXB9lePzx0fy6uXO
         c+rQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cSuai3suxMHVg+pvJOSVEq4xVCXoKBiTMO0lTz1naa6TEJPVSJSeCi3WXPOGGL8JCbVFig6qe28OYDlPy@vger.kernel.org
X-Gm-Message-State: AOJu0YwSTNf6Nu1S0pBDvcCwr3S+4/HftpVqrfUJfGLzgP3a9wZpic5D
	SkwyRL6cfU/v9RUQcrqhcEMCG+NZOEhrcTfBqahfu3jbo1kpQ2FJE4hLouUJouT3RMtvJaYEqaW
	Z5Sy1wlq57V/y+FFYxK/cjeNWEwNJQMR+krvFEvIY1B7NtiFIuT4HSbb1qh8MveyieagJ
X-Gm-Gg: AeBDieuGnNYqaplL646wADSQvnCnxLCihEUb5WWFVURoirIxmzwpOv/BIUj22TBrbZy
	sg9boRQIssE028f1oEH6/DZbDH3iNYa//8uidyqoPKnnUAoLL1Olc5JT3LYpP9313BzSfSLWPFx
	u0R7aSnLHbBsL6xMZMAlmOM2kX9hzATukDQEOlB3tncr7ePm7lK6efiFZ9FJzFR8oSHb9vd0ZTP
	Q4mh43boNvVZoEW+EzLsgVPeEW9gkLMO04lsyhJhWANUAYCpxM0ukIiFn1stM4jHZ9KhWV1or9M
	B7Cah5eOtnEaoMaoWEuoXaXdpMG+3UMIbsmTEU24SsSgDvKnmUhOw+QkMEOFV1lidiP8anw+uod
	V8TYjxzII0x6cB9Lva6hnuU6w9YVdhWEQv0kjHg4WJx69f5qm0EYLKeirp8IZmjo=
X-Received: by 2002:a17:90b:2604:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36140226cfamr14800052a91.0.1776706105207;
        Mon, 20 Apr 2026 10:28:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2604:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36140226cfamr14799968a91.0.1776706104426;
        Mon, 20 Apr 2026 10:28:24 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa17632sm113132575ad.24.2026.04.20.10.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:28:24 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 12/13] arm64: dts: qcom: sm8750: Add disp_crmc node and CRM properties to dispcc
Date: Mon, 20 Apr 2026 22:58:02 +0530
Message-Id: <20260420172803.4124418-1-jagadeesh.kona@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE2OSBTYWx0ZWRfX5eLVYv5dsP9x
 DG6s3NRXD8upBxobadcINjtRQcv2HFGb4dI7QORTbEmGI/lMZRhVnKNBPNR4PBo7Xlc3G06pLkV
 HBClSK76Dz336uwLdueEm2z8Pb62+6uyZFzUCmlPUovUtWfTjrZREUEcqyAeB+MCJMMUVVCSvSb
 EPq+OM6y/pRynPhmtMGxUQ8tWUvPZKnumPS+4+ig9PdtyjzlUQYH7LFtDgZJEgMrBjQkdN9L5aw
 KCZXMtYdlNPekMif6k65pCFBXO66nqqZHO3Q4d7Xz3lP3goPRmoRSwFZBRRYwTpQj0bnf2GPEy1
 mjdoPREh666lDRsIn+osQAQ0gcvfxJJeskDSQHDmXFud/A3Yj8ZTaaSWNzbUvK4hbcxxcLNxczt
 2dJfS29frxxJNXWA4tEHll3nhdQh7THEYXsd/3uA+r3uEm1bD6F1dWaOIpaxbK2a+vRu8Y1Wz9D
 hdoxz/OjqSgor2WRd4Q==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e6623a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Ts-O78zUOEHCRh5K-HgA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 21U1imvQfs-a-lX0Lp32TUw6lBqRl2qI
X-Proofpoint-GUID: 21U1imvQfs-a-lX0Lp32TUw6lBqRl2qI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200169
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103820-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,b220000:email,qualcomm.com:dkim,qualcomm.com:email,af00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,af21000:email,af27800:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 837954316EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On SM8750, some display MDP clocks are controlled by display CESTA
hardware. Add the required CRM properties to the dispcc node so it can
communicate with CESTA through display CRM node and control these clocks
using CESTA.

Also add the display CRMC syscon node, which is used to read the clock
frequency lookup tables populated by CESTA for CRM-controlled clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 5d2c59f37015..0db586b02131 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3431,6 +3431,9 @@ dispcc: clock-controller@af00000 {
 			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 
+			qcom,crm = <&disp_crm>;
+			qcom,crmc-regmap = <&disp_crmc>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -3451,6 +3454,10 @@ disp_crm: crm@af21000 {
 			qcom,sw-drv-ids = <0 1 2 3 4 5>;
 		};
 
+		disp_crmc: syscon@af27800 {
+			compatible = "qcom,crmc-syscon", "syscon";
+			reg = <0x0 0x0af27800 0x0 0x2000>;
+		};
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
-- 
2.34.1


