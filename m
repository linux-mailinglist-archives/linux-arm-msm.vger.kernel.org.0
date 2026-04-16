Return-Path: <linux-arm-msm+bounces-103401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKezIavQ4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:06:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F09F40DD3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62C9930A4144
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2173B6C1F;
	Thu, 16 Apr 2026 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoFrV2rX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXbIDR5/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DCC3B7B8E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340895; cv=none; b=gisfxvEFi41AmkP67wzxw11J8DNK59R0wcQ05km8JMozVKZxDgA67W01YkieOvzAYLCp8wuLGDnmzRFp2VI+pwz4+cS5QKKKGrjyM2opfij6K9E49/8xgwvGLHWEqmGjLd+5WeTo+xzJU/OkFY65Qb3A+gsSq9tu+aAqxBIYFf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340895; c=relaxed/simple;
	bh=vzBr5e4UGGfmcb+i1bWUkJnCUj4+LyIrDlmIKIXz/Gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=em26ScsJ5VbGqpT7W1PIrpZhxVGg3lngBoOQQ6Jfom8N7Fq6Kbquo0iKCtbDDir4HSYvUqVvCOLoStiMtHZur0f8mmlV5S/RUyr0bsq2WWylwJZgO4wEiQYfVA0dAb6nme6KijYyc50jVwXm2CoUhukpJ0YMdsGOyOd2frmJtM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoFrV2rX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXbIDR5/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8CQ8w2575931
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYKgeLzF+EIJvPu5vjBT9RCwcEcSg4BxDSJhcfSI+V8=; b=DoFrV2rX+Nw4sqI0
	ovBTJIEzyPGnlwljWSfSFgRWECqMJh8RdplLNQs/CtaHeiX7c46253Btojft8uiK
	ipi40wI0GmtK0fiDyD1gdOQU2Udz6L9MNeMcBT6WvAVBSAasKMhO51uwGgySJ8en
	tKuvc0ncenzwHQDsOoWbljnqeoap31BDwhvOxInh6ECcXGgAUb3KPM8QZaS/B5Rd
	0yn8MCbXqemMFwUDK8SEqppQVZvKxmzfHQ3FAytepSe87uUHx2S6eMZ98mwU67RA
	sjhCbouzfmm4UTtkkXzvwpmBuvLmIwNlnpBd082BCKuklmFVNb3MErX4bApULy88
	puatbg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djv27gub0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so1463981b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340892; x=1776945692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYKgeLzF+EIJvPu5vjBT9RCwcEcSg4BxDSJhcfSI+V8=;
        b=NXbIDR5/rspZ6BqfA2jo73A6I9ttJLkk9ZZt6NXS1+oABQpjlqlfE0rDeEn05+F6wd
         ytXryZHSQKoYp1Hpbo7p6SyA5Xb/rQuvBLj5hUhsovcqBK0xLIJkDufQ3hXtK/JKlG9H
         9MQn4QLCtycch150pNZcsTOlYgz9w8Z7O3Lf/T7VgMf1K4Pg8BATVlhsYWONX+0XGR8a
         ktqBGERBpBymk7wWGK1FLYLPj2S8pLdc1RIRx/N3fM3Ikxqgf4TVrDBO6zgU7eJuUhR5
         nh1n5cDRamesjQYR9etlD+lMe6sjNjdSyF0xQHBD4vaM4IMlhrFYfY2GPyYuAK84LEQZ
         Rv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340892; x=1776945692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bYKgeLzF+EIJvPu5vjBT9RCwcEcSg4BxDSJhcfSI+V8=;
        b=aQzQ76cy5mWRb4NTLxoGlpC/Xs+dtsEbB/cMNwFs9TA/Cved8ZYps5FX6ZW9+VhExL
         suBQJkG51vOfPghafx0Mp721YyxfOc1ABr4u/tp37fhDlQmj2fpV1y3eMNPE5uT/dfy6
         TdJnaz6x06Uxqz9RxueC1De6cnkvJDalceLMy7ZgsLuKfiXqVqXQyOSllPBEgd+5lKR4
         OcevgCXI4HX27d2GMpzAs83liwSZrgWLgJ6Stuth9wM8he1+EqbXLjgDd/hs9RjocgJa
         0K32qj8OD+pZte/gSpoFeU5xMbjoyC9ml4JqaoLY4jZWOo2xa4Ii2HEMrqamqhocxA0E
         6HTQ==
X-Forwarded-Encrypted: i=1; AFNElJ979g2KrlZ9awN/op59Nq8LMS7ZUX0RCNrpM5CwMam89yM48nWciZwFhjxp75fr5lIgeMEriXDNoi9ldjKu@vger.kernel.org
X-Gm-Message-State: AOJu0YzAKSd2uQ5lqUcTvmwQNghuKws2NmatjTDE6I0z5/cRGC38vsSZ
	lvBAqGP5icv+IKLxcNO5JnXADy8Pih09bx769ouoc2n3d0Vgk1Zq8FL0w6Ed+JLbnTMKHDeeap9
	lHT2w7L4UVoPRWYIMQCA44EnuvURbqpaEUCUXnuHU6BBjqLH+/wf+yaGXlWRVKo2kwpnd
X-Gm-Gg: AeBDieu6khv6SJydVilRCNKpd4C1/mnKjpHbw92cqxHmx1AKWfIDSNHx/TprjwpNReG
	jUfzJbSdBl6ON3fhZe0iAFMR0n82rpEORrESb46IPUVvrs7jY0xqfiqY9PQEmu1LW7pb85Wlphj
	Bp54dPQigMi1YgQb3S73Fc09aJAdxQ/KQpBHKZVIIu7cpiqYvxSVlZLhwFrZd5REr0OWuKf2Wpd
	qUF0p11NKQ3oKwxrFmc5l0Re/CaXN3eRumOpHvOMuqh9AuWKsDSge7zfin51H+KWPYXcjBjnQ1Y
	DhZVJTYo6Cw7gCAHHhyFobMXtDGQZKVkMu4tECqtv4oiK/WwmjZw/jYdlParhzcBu0WBubmw6gK
	1j1irM7MPTFwJ1CV7kJjurf6PVgUmrSdQu5g9aVgOW3fFM9gZthSJhlTXtg==
X-Received: by 2002:a05:6a00:3397:b0:82f:4cc9:1854 with SMTP id d2e1a72fcca58-82f4cc93627mr12796759b3a.49.1776340891863;
        Thu, 16 Apr 2026 05:01:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3397:b0:82f:4cc9:1854 with SMTP id d2e1a72fcca58-82f4cc93627mr12796207b3a.49.1776340886803;
        Thu, 16 Apr 2026 05:01:26 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:01:25 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:28 +0530
Subject: [PATCH v5 11/13] arm64: dts: qcom: sm8750: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-11-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1517;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=vzBr5e4UGGfmcb+i1bWUkJnCUj4+LyIrDlmIKIXz/Gw=;
 b=x2zFbTpFFbANsslFGvo667vqOM05Wn0sS8CY97j06xPIrAhgsEr39phqEmwXqQ+zOvfQl+YqK
 0Lq6nKu/BjiAKj3pRJ3SATMtC+HJJPOOJXZE5im/ykLa+PDowCcXX6/
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=PJQ/P/qC c=1 sm=1 tr=0 ts=69e0cf9d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: YkhDhF2whbheYAjplUZ6WdABGcCVhbkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfXzYX2Ga8dxisa
 B7j/wOJw5k3K6VPKtoNVubXVM0BLNj+ec6Bw7Qo+kf/C0ZaRufEk5glvapBuRbJCACrnC+irqu2
 ZdjYWmvssBIf8MejjFLc0SCl3Q94pQMq4GjUgFJjysTdw8B22HtXreg2gNgxFKUwB14CZU04Ckb
 yQ5wkoyk6IPtvvOP/x1MgUvjseXFgNXZxqIUTj6UTowGk6O1gelGDbZqC3UWCVXQuz0xxW4y0wE
 So7SaPhCxLM+1AUp6uWm3IJ+GWem7AD60fHVyAlZ26x7VtGq5EHMW7TGoOj4RKM4GHfb12bVbDc
 BeFkrpqevgjdelpNjG6Tn3vb+SYs2JMcS0z1jdCa7yL9ZeyN8ZlSOTLBP0eB6SYEnaJ6CLMgavn
 3VpqqXoJ2gMh5YdcvMo/peL1gPbJk9yvh29VuXC9z5XZ6Y97/5vsSlt1y/7gYaCaIWXfIaSk8N8
 k7acVybIIBy5tWIR4Ag==
X-Proofpoint-ORIG-GUID: YkhDhF2whbheYAjplUZ6WdABGcCVhbkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103401-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email,1dc4000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F09F40DD3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
sm8750.

Fixes: b1dac789c650a ("arm64: dts: qcom: sm8750: Add ICE nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..099d7fb82ae6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2086,7 +2086,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


