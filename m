Return-Path: <linux-arm-msm+bounces-112169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UQD0MWYQKGp09QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:08:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E084660672
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:08:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="juR/rMp9";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YCUe2pPC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112169-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112169-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08E2F3029AC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5EE41B360;
	Tue,  9 Jun 2026 13:02:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30F381724
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:02:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010156; cv=none; b=Ka6N6q1zTMGPv4aC5/Un9nuIo0eZUZ4yKDcv7IkrY61e4DWxDuhYMZKaXiqKEjmYeA7Yh6jaDxl/T44SaQc3upZ6T5tkMK5geb6QICJIURx0f6Nbg0rQApbdNui3Fqos3wkoB4i9nibyyszv48tdTl9f6PxolPvBkf96i/UKvIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010156; c=relaxed/simple;
	bh=XN8hc40Aqohm1Oux1FTd9z3AKS0NcB448jgv5NkarhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHiR2VtlhR08kbst8Hf5lFfg3SgNxWzykhtnz+uQtpQbuOW6VDV504n2Tte8HD4Jb1w1J3D7OOhrcQQ9FBpluoHokrfnP3A/xzVP2Ag5wKHUQqgylt5qukwIZaOBOha2lwvR4EJ39gG7OAgR9QN9gOlQsjjHLUYyGzRD4S+i44Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juR/rMp9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCUe2pPC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClVLL2706172
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbHtB5FkcaadoqFbH3R3CLsT+3mMjSYwuCc/ZzU+pvY=; b=juR/rMp9c8O5SUDq
	lR2VC+Cf03ny9QkPsi1RhTiFv5TqEdSvTLNOanb5ziwG50E8axHc6ZOqw0seTMgq
	zMF45s5nLRpIet9gRi5rlUgnRWe/nUpP91hzOwevI4z8iNyNwN+fnkPEa+C5NpTA
	3uhgNOBNeCdYCDl/9DW38g55oG9Sb/5lXA2SgSDLCWmkp9dt/6BapdL+mIzU3t9v
	Dq/i1MrsoYLRBBTLnNw8LzxAJ3bbKP74hZjlMWoc7EUsavmRndvnRgK073aneVg8
	rLKKI3+Vmubmn59MUGN40EIApeXQ/m01rqSnVDwkEqCZrNsjx4m/+ju2e+CF10vy
	EJAMPw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt14hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:02:34 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59eb55f6c0eso326716e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781010154; x=1781614954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xbHtB5FkcaadoqFbH3R3CLsT+3mMjSYwuCc/ZzU+pvY=;
        b=YCUe2pPCcUpi5bNc3reBnnPLx6pHqDUHS7QSI28MKp+Ye/5QlzCi38jwq7Gw2rNu8s
         ZH8TXdTkoJFjA0I7NPY6ya+WwbIdptLc9VZSf1bSYymqIftFVFVSu0/G9tAuRbO0Crs7
         wFCaDt8wCUYw1I0rzclCzNbEbkz1OKCGWtMl+bPZ5QmKBmZZR3WQHRnozac4MQbuyTLQ
         4gkaX1/id8Xfw0vlKL1UNbYaC6GyThbg5ESvJb9ROo4RCYAul40GoHGHDVnvDa/vDGsl
         2GDezFul2On7b1xLcLLQn/4iyzfuh2iHo6ImkZBnQJULuPQIlBs5jyBckew+lyQSeDwF
         IyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010154; x=1781614954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbHtB5FkcaadoqFbH3R3CLsT+3mMjSYwuCc/ZzU+pvY=;
        b=Od8w+bzoDbmTwRMatADda4WBvZsUiZdlHLzqN7YlMB1IUOnil45auLYQh9LzjB7IER
         KV4gVygGezMAWmhWgbUDFD3mvlZp5V441BXs6LKznSqEEtZglaxcHYHbsGh2QjW5EPtY
         kVY6rrJsdEGhuYIYJRfaBK2kzJpjVsKJ18gn+xZnaorkHMQqAm/H4Q0Cw4PpEQERN53h
         7wHyoEHm0vdndCJvXhfdt8RL/5CPs/9+ZY6OGktBvLd3kXoYwHs6V/Y9r3oku/Gn0Oa7
         uluzvN9z3xUvrL2RqPPnuQomiOyczqbivvF4WcvQygll/yYT9CQa7UQKWCPN1PpWmblV
         IrBw==
X-Gm-Message-State: AOJu0YxlSoDNPFJuk5Iix1pgT1uNoQ9Cxv6LGmvh+MiPvWGRDZ/dQYDk
	20eHwLPjtiWy0XEEDwq0btzrNI5APYMLMVy/YZ/SDr69Vt8EEJBt3loP+Zv8wxiH71aCeW2cJnl
	TOSQ61WYPLi6eHBwnHN4dNNhz1Ouon9ZqCSmdSarsTSYAUJrsHU9zi7UD/3TppLBxQ4AY
X-Gm-Gg: Acq92OEY6iTVuR5OQBnmtiBYmoQrvuMRwekkURJGDVxnJmHKLeaj+zusEeNxLB5MaEP
	wJ6dTUDk4nQMpp/Vgtnvv9Wlj3RiMKggi2lSvsIkgubObEwEr2dnsN7bp8PHRxmdhN8dwSvymzi
	AqT851IdFV4aJVPq5f0vEaZhuldXXyp/HO9T7u/q/Ux08jeEI1wPfMbNa+iw5nDHz70Zi4aWEwz
	UXHZpTRkoYhVHwizXuxJSl9/t0Y78ZIYAe5YUruzchSXuJ3Om/xTMPIu2de3dYTGziC+B9So7lI
	9fiijbFk6KMuLogGeR2C2bTjAlLfuu8gmBOUq9zCZWmwiahN3HvEgFJNr1vgb3J0jjCt0Y+L4UF
	qze0bGilZx5aFqVSQ29zlOYrCgmxWq+PvH7T/7Kguo3W1Cn8QPqixbVes
X-Received: by 2002:a05:6102:26d1:b0:631:3ccc:42df with SMTP id ada2fe7eead31-719255a6e8emr465877137.3.1781010153605;
        Tue, 09 Jun 2026 06:02:33 -0700 (PDT)
X-Received: by 2002:a05:6102:26d1:b0:631:3ccc:42df with SMTP id ada2fe7eead31-719255a6e8emr465752137.3.1781010152819;
        Tue, 09 Jun 2026 06:02:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be29fsm51941651fa.21.2026.06.09.06.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:02:31 -0700 (PDT)
Message-ID: <747f0319-68e1-4cd7-9dd1-4a675d882f99@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:02:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-3-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-3-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6nUAE5zVXeCGpQsCiVeroIM0lmQzE9lZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyMyBTYWx0ZWRfXwux7FeobfwD7
 WW3ZUJbQBUZlfylY0JdZb8dpYO13BEv20u459E1XqTykiITzcI9MjK0o2VBoqbANu4XR4HPWjvS
 dqZjJw1GMI0lDcc+nKKbVf0GX8vZBMMbIRK5IiYVVzhfmRJJpWLD7FDKt2ElNXheqTDaFzRH2T1
 uITEbV8GhNRDRwhAzTi7a30xeS8wMgEtDritdNwqzAWjLoULa2PefGMRNPX5JQ8R2tXPAa3XhEr
 ktDUAB+gzgBIU6Ecwbq0RxjvFbesi99HALbVVVt5LnI2MPpxgX4WQsJcYBMX2DtyoTWSOIlfLYN
 9zN8/ohuz5W0WVj/MtjUs6uLMsMoZgzVCW3gfLwPGq9Mst0zr4cjDjsYPrHVrgycJrhDnehYgzG
 9jomGNPpHwRWuMw7Ie+M0TIFWRtw87BVjA4zlBISry5FrY924vMrDSo647k6Qmjct67enWQhA34
 IXSSBYi8vqBG7ErbEHQ==
X-Proofpoint-GUID: 6nUAE5zVXeCGpQsCiVeroIM0lmQzE9lZ
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a280eea cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hcCWvLewiaSd8YhtB04A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112169-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E084660672

On 5/28/26 4:29 AM, Qiang Yu wrote:
> Replace local clk_branch-based clkref definitions with descriptor-based
> registration via qcom_clk_ref_probe().
> 
> This keeps the glymur driver focused on clock metadata and reuses common
> runtime logic for regulator handling, enable/disable sequencing, and OF
> provider wiring.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

You can remove the of.h include. Apart from that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Also, attaching a diff to complete the regulator map. I'm fairly sure
these are correct, but it never hurts to triple-check.

You can add:

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

if you squash them together. FYI e.g. the tertiary USB QMPPHY would
only start every 20 boots or so without this, running on pure luck..

Konrad

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index e317003398d1..eb4ee8ec9ad7 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -21,6 +21,14 @@ static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
        "vdda-qreftx0-1p2",
 };
 
+static const char * const glymur_tcsr_tx1_rpt0_rx0_regulators[] = {
+       "vdda-refgen4-0p9",
+       "vdda-refgen4-1p2",
+       "vdda-qreftx1-0p9",
+       "vdda-qrefrpt0-0p9",
+       "vdda-qrefrx0-0p9",
+};
+
 static const char * const glymur_tcsr_tx1_rpt01_rx1_regulators[] = {
        "vdda-refgen4-0p9",
        "vdda-refgen4-1p2",
@@ -40,6 +48,15 @@ static const char * const glymur_tcsr_tx1_rpt012_rx2_regulators[] = {
        "vdda-qrefrx2-0p9",
 };
 
+static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
+       "vdda-refgen2-0p9",
+       "vdda-refgen2-1p2",
+       "vdda-qreftx1-0p9",
+       "vdda-qrefrpt3-0p9",
+       "vdda-qrefrpt4-0p9",
+       "vdda-qrefrx4-0p9",
+};
+
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
        .reg_bits = 32,
        .reg_stride = 4,
@@ -52,6 +69,8 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
        [TCSR_EDP_CLKREF_EN] = {
                .name = "tcsr_edp_clkref_en",
                .offset = 0x60,
+               .regulator_names = glymur_tcsr_tx1_rpt0_rx0_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt0_rx0_regulators),
        },
        [TCSR_PCIE_1_CLKREF_EN] = {
                .name = "tcsr_pcie_1_clkref_en",
@@ -80,34 +99,50 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
        [TCSR_USB2_1_CLKREF_EN] = {
                .name = "tcsr_usb2_1_clkref_en",
                .offset = 0x6c,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB2_2_CLKREF_EN] = {
                .name = "tcsr_usb2_2_clkref_en",
                .offset = 0x70,
+               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
        },
        [TCSR_USB2_3_CLKREF_EN] = {
                .name = "tcsr_usb2_3_clkref_en",
                .offset = 0x74,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB2_4_CLKREF_EN] = {
                .name = "tcsr_usb2_4_clkref_en",
                .offset = 0x88,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB3_0_CLKREF_EN] = {
                .name = "tcsr_usb3_0_clkref_en",
                .offset = 0x64,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB3_1_CLKREF_EN] = {
                .name = "tcsr_usb3_1_clkref_en",
                .offset = 0x68,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB4_1_CLKREF_EN] = {
                .name = "tcsr_usb4_1_clkref_en",
                .offset = 0x44,
+               .regulator_names = glymur_tcsr_tx0_rx5_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx0_rx5_regulators),
        },
        [TCSR_USB4_2_CLKREF_EN] = {
                .name = "tcsr_usb4_2_clkref_en",
                .offset = 0x5c,
+               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
        },
 };


