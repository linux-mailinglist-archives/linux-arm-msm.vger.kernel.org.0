Return-Path: <linux-arm-msm+bounces-115911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ib2UCdI8RmotMgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:26:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8686F5E16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:26:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BmdhPhnQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=he1YoIv7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115911-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115911-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B22AF302D5F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0134A2E34;
	Thu,  2 Jul 2026 09:51:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62949492188
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:51:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985873; cv=none; b=MqZfMvL6R/NeodsGWzACCQBVn+gddpKhqk6Dg8aa6T+4JqNumEEv2HulpA48l9InC/n7NPG8LgHpiwDjk4nRXe99TunEB/25N2Y1t3k8qX9Y7iWuP+iXT6OroncHkMJyrHhMJD+bAGS5nWTVHOH2LLM0q3pKpM3xxetTSn6ikio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985873; c=relaxed/simple;
	bh=MG3sAgTxM2yS2k98bs7iCxw+/UEc3/K3gbnTW3sIzdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6tx56R3MNXUtb5ZhLMs1rPOd0IHzBpG7t0OBd88lKIp2Ki31ldVsBeQOTvLaY6NJ8g36OuKEgShtppvGxE3SXqC0eSfKlL6FBmclD7N8s595SUHoRGhALIUUp796AbJ3WvHC+wqp3lfDpLvgNKnDBoNEhHledjrBL1bnnDKabM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmdhPhnQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=he1YoIv7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624iLZB3591734
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=; b=BmdhPhnQusx/1XjK
	I5UvSa4b1T87XegwtC468GWx2FpAHaxBfJqgmSLY6XJbcmHLUP4Cxqm0ybfpl6jH
	fS5wWwOdh/YYqmiAxvo9Haeigt0wTk+H8xYuoZUTzAdjcygMDrK2V3m+ftA5BLnJ
	vmXGgq2/l3khI7h2QHpsIP5F7bz6pL6RTaNOiWN9t0vCMZFM+WcshMrKRJ7DdzqJ
	vuNy8K7n9orBQ8b3/vFXGLVM3abRb7Tf+PeRBMvUmCSDcCIKUSDp5XcWe6/OVhth
	JSJT6WhBFNtJzH5NyBv8FdKUMGrxqIURRcGu+BBM1FBfMgVIve0MCjxENggLuLY7
	igtOdA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n94j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:51:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847b8d76e3dso2576076b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985871; x=1783590671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=he1YoIv7EHv528NdSkvaVMbj8LNhLhKWoklwWr170cIVu5hjBNujvnMmfzVy8pKzRu
         Cp/324lnuzrNQk4BDlUuK5EQ2/ScIHpJAzXQAQNG6ZCyPqP8Kcy++1pLj5J/YjYCPRj7
         a0had4rPo+GrQocidLYkGunKYhEtPZ8qtQeRDLFnSSOIWlvFdekExJDqlvmlTpHZIef8
         HXBI3ZWzQ48N1gynIP5SKh3cs9sKVGnYyQHYXrDL1OSUGHRvjPCBKQYU3s1N6wrdve7J
         rqwBVANaTbGU2Oo79sifWhGtGeswE6uMZPdA9M88gt0e3Ot/kh2JpqpGalkb5hwPSgvp
         xeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985871; x=1783590671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=c6XSDd3LX9P+Tdn5IA9KxI9oa0RQrbzDWc9yiP5UfN60LWXtIQeadLIX0KOIA9QONP
         76LfJ4nz5SanNiKJcyHnaSTfAB3QG5WdH3w1gBXkSBtVGl+1Sn0Nupx7dw88sqmA1Di/
         Fq8GQLKrUfmt2jLiDp2ooEqOnU8qp7fRR3v2GJwOmY85Xxv0yChIn4RooOBDFbUW4/ab
         DHPbs8m9FmSQr8fItyjwPEXaDmerapiv6TzFIWWMkwCSuxcXT7cUDz3oTtmoQ31TNV2F
         7wmcP8cvUGKFd2Z81GT4iVBI9RQegTIK9F/D2CyhTfTPubZo5IkGtAaRlmCMMBWNYlgb
         LlEA==
X-Gm-Message-State: AOJu0YywFch9U65AXwEnINhbOBaZS8wqo1avjPTalJh7p1onVnlBxlV/
	9PPSu75TaZBFq3i+lLzTLbeaqWHYalH4hRgXqdz6S57ul7p/pMJKOnJ7LMzUZLtgrqbV1CwOXY2
	3OIpf/bHj1b8FmrsE8nZOK9Y9JmQyNpNVRL18qeNGxyUZt+2T0Q6W73GtPMUOcbPdFBbO
X-Gm-Gg: AfdE7cmkHP/WxN/HTQk3QbPNVOd31gKeVWP88Ti3t91A81zpdhDzD1Mr2UEfo1lrYrT
	VdM0Kk0t1WpAW0H/UBou7l6jEVDB0csWmfcHRauD+lXvaOJw1cVJV6d86tzZoCdsvlQL9eewEEd
	q1j574C8xu8T1/joW05zoI/nKozTrKr0gsjUiYsw3fsTlrtFkKDN0gp48u/Fu8IMyc1V6shQ7lJ
	K3J6B1hDx5ce9nt3AGNTC4aX11Rp4J2iiwkRHi5SNkiE/27J6tlGsXtAAtWz3rTXr1vam4foTbL
	tAaB+EwwJU/3JXp1R33eS4HR394rcVXmzsucxb6L0j43JNeNg48zC+EiPUXW5Ev/49bi7wrlMN4
	9nU92QSsnhsxofsGn7QTGcagqTA==
X-Received: by 2002:a05:6a00:6ca7:b0:845:e0ee:29ec with SMTP id d2e1a72fcca58-847c096d0d7mr5173788b3a.35.1782985871159;
        Thu, 02 Jul 2026 02:51:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:6ca7:b0:845:e0ee:29ec with SMTP id d2e1a72fcca58-847c096d0d7mr5173743b3a.35.1782985870246;
        Thu, 02 Jul 2026 02:51:10 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:09 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:45 +0530
Subject: [PATCH v5 03/11] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-3-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
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
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=1830;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FgXZj7vad2zgvA0RfnbjlrO8hgDk3pUjpoRSx0IOZh0=;
 b=t9FPDceZlfvNHbbzM0xKA4qbpZi1OETvyq/t2FF7ThWRzfT4PoB2mWMNrJFnS1zY6k5B14AHY
 AUua33tvB5sDpUPT/uzoDAfpTt1KKH9TkT8+23HepTkq37wyP5Cxw6s
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX+TSq8EX1kh7M
 tityUQQMkBwHqqDi1kGncaQzr1hQQuWiHnkmlttasCkgqNwXtCLUA2C34+cnYm4pKmusCJ6SU1N
 wMejzw2fUZyvPcnTjB3dRo1FSyydKzavlP84H7YrkSuk5HIH57e5LQzB6XIzGw/O4j3QfA6UBbH
 IOHtgdejiYbFkUMN8w4zv66gjEkfYRAETgdhSq6VScCCOu4bpOih/tRAY2ReduYstfKj3duE0y/
 iQT7D02ZSEQ84ky/AvRsbLBL3sGfG6NLgaBZqCGM1EHhq098XAGpcLB455XricdDtJbxWM1MSsp
 YI+wvxtBmkx3fSEtLQDWpd8/9i7RNX6uDL9pNdI0mpgRvUcvAxeyUjp+d4G7R6A8/HaSP8No6ZW
 anCy5I0G8PVQtuUuRRKDfx8FyciIYpvjz2R3NZqmAZYDGXhH8qzmjCDuMpQImfNOphQl1VqOtiO
 RwLGPJaUI359jKdvHJw==
X-Proofpoint-ORIG-GUID: wx78dacDGzSLXp07wtEmuYtb2iOHZdFb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX/qaifPfgwBUS
 iX21o+dL9YPs/BjdPiBZ8uhsFiksg1XNa3Qm8NQpnbqxxWiUgofSV4LXri6XD7dEeE92djFw9QK
 4yREtl6G9mzMViy8xJaZfNu88qblzqs=
X-Proofpoint-GUID: wx78dacDGzSLXp07wtEmuYtb2iOHZdFb
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46348f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115911-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:sayantan.chakraborty@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D8686F5E16

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
Shikra SoC. This is necessary to enable power management and optimize
system performance from the perspective of dynamically changing DDR
frequencies.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f0fb55b9deb9..d66b97dea319 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -661,6 +661,46 @@ rclk-pins {
 			};
 		};
 
+		pmu@c91000 {
+			compatible = "qcom,shikra-cpu-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x00c91000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <1200000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <3072000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <4068000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6220000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7216000>;
+				};
+			};
+		};
+
 		mem_noc: interconnect@d00000 {
 			compatible = "qcom,shikra-mem-noc-core";
 			reg = <0x0 0x00d00000 0x0 0x43080>;

-- 
2.34.1


