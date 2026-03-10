Return-Path: <linux-arm-msm+bounces-96544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ8FDErSr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:11:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C682470BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64E7E31A96D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AE93ED11A;
	Tue, 10 Mar 2026 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIremGOt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4nqABXP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935ED3ED118
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130043; cv=none; b=gJW3igSyhXIxMZyIysol43oIVTpcI4gIH689bGds7RT0AtdqL+7YorybOPz4cIHH/EEsNejmvk55Ry0fj6YyDi/Z1T/tkfT32s0jAVpV/xXgV8IkvrDLGQRQEi5h9ZyeaiTkh+ktp+T6BMIPylrHuIiAQUas2KuHktwSeAupkmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130043; c=relaxed/simple;
	bh=X+9qvaez/wKuQJXXpN5o7PpR/bLl9AJdUe0o1Nd3CW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWD9XnbT6d/fmeqjq9ZQYvFfj0znVqh+6LOFyz4uQ0qwSdGYEZBReH7mboZTJFUHPkRxzj4MrU0sJsS+J2XDT+VqFx07Q7O8rRhxF+BHm5WfxOUeFfUQUr2ZszlAk6b6oiYEf7YpX9XLJErO3eaBifuQHmGNe1RSsc9NWgk5VYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIremGOt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4nqABXP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EJux247053
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wy0NK7XwvpVIYG3doeXTDM2mVaJoSz3R0NLL5vkbXo=; b=YIremGOtkeXvixLu
	ObAPl5LCrsExRFkQBMGUF4jT4Ls7m9p7AY5leX67TZT8q2JKLmJav1YFMFeH9oQd
	NjoryobWuihM1IR1bHGH+DoW16OOSSJsq7LTwdw7OqTHiG3kV69iwBGvG9SZMpQD
	OFXn/CrOgjLBU7G6rrcjOwKELumDD6afDJeqnrLlr0tYetwRwKa36k1uLD47X2au
	zrLbaVlvqIs6LL6kqHRGpUnkVmWjhzDqNU/icaoOgtZ/lMkAWiiFGBMT4ta0odYf
	WfJZlHSDwYgD7MtaWI/l0XzZW2+H0qkLkI7G1Bj1NLHK9QA7hi8VZYifHukLjuuM
	b2lA+w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8801etg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7385e8fa73so3221427a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773130041; x=1773734841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wy0NK7XwvpVIYG3doeXTDM2mVaJoSz3R0NLL5vkbXo=;
        b=W4nqABXPVTm55+1ip8UDG0L3r8NeCLnJlnfPjs5wtkEAl257OjYHpOzcvLcXYokKkT
         6fKUnGwET98dvLUAcIbhaM+yrffGoDyFz3V3atyT538hh4VQtT9RwMy5DpbCIop6p7ep
         eBEPbGPX4ld2lYSiPv/kNsjl1jkb53ttPKYqPjkdTidEJ5K6+KGc6PQ4b7DsLB4raaZM
         WWq9z5NgOqld5/eBFbzwtY4nDrq0rYPLnPs1jIJ4Rtc1siwYpSKgk+E0KSdzied14yfv
         Z8Tm2F+2cJF2WbBBEEfRVeojH8XEv3azl9IHyiTDXAUiGvWTQzSXMiltXhXCtj4pI9iY
         qjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130041; x=1773734841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+wy0NK7XwvpVIYG3doeXTDM2mVaJoSz3R0NLL5vkbXo=;
        b=LeMOz2viFVS6bNm1FHf75ZbR08mUtmWh8c+YaRZik23UgHkXQINpfp5QBVQSM+4XNe
         X+N8HofFySfitWYVy74AoIpzf+bF81UdkVLXMWCnMKCT7C72PbVl1PQ+w2zo5ezYrMHa
         kkna5rmlY2CJiGmnBrX5UKQyalbljtOZH/08+SkI6wtn3emNg69x7/0BMPP3LoYKxwFV
         KBWb0BP8a3ZDy/hLgyH+Pb53dUM/kjjGhcHB2B7XorGwJkokz5MV+A/c9fhpIt+lCJ2E
         yWhlt3lkL188i3IoIyXJ70jkNr0LrNeTLvp3NeK/aYMHZz3n9XGbfhAYRPr4DYkBlA2J
         7Dwg==
X-Forwarded-Encrypted: i=1; AJvYcCWN+I9at3b+WxYNUfUvZ+g3OVnPnl/b5mvdW1XFkA+uFZISw1Kk0STyl9QaLafJS9IjFUJNdtEL+Gf17HRD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs6xbT2FlSEck08eBC2fvB2EU1zjDrXni/GErqh/LBPMu/qkFU
	nFNodZ/7p5BIX5gueDnfxdnIw0qMRNgFH1vVMxzx7+PJRR7yvQn6wMJC6P+p6mmAhXMbUGJ1TRr
	Y1uQWRcGXFm+VoTl8fyeVFON2eEIP2UKouDRk+37p8yEYCC5xQwtkutkUrZIjL0sgUOWE
X-Gm-Gg: ATEYQzyhhtJ7/dXshRuVGoAHMmr1DVph5MbJm062GoO+chhufRfNc2KqwyDh/0acjJt
	/SixGj3PVFm0OTXZo7POUtK/FF8d9tE1pH+OZV6fULq1eyEJUUAPMxACu/IwPrA3AQTBxV4mrCG
	Fz2u99GV3hAbzKZqfV7tQrodph93lfDYOaa4JZx1xZVrT4zWdKSTyhBhiAYSOLL2QD+5WGmkAQY
	6yypG2r9zP79V/YGICUJcsio8BtEcl+DsMxDspSecoQW8HTiXAxXpkfrSaaQX4pmr2Wlg3/VdV8
	VP4K2phDhiRqowZPWi8NGgklZOFjxJwXwVjDfUkCg4sfxXbdKPEsh/BimijLGed0TvfB8vNmiGh
	YfA9BxxEH1SLzI9xcfSIj5KuoxnrgX2se771+Wi1CiLVAPk4=
X-Received: by 2002:a05:6a21:35c9:b0:398:6461:6872 with SMTP id adf61e73a8af0-3986461cbbdmr10167478637.61.1773130039742;
        Tue, 10 Mar 2026 01:07:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:35c9:b0:398:6461:6872 with SMTP id adf61e73a8af0-3986461cbbdmr10167425637.61.1773130039270;
        Tue, 10 Mar 2026 01:07:19 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm11121969a12.31.2026.03.10.01.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:07:18 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:36:30 +0530
Subject: [PATCH v2 04/11] arm64: dts: qcom: monaco: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom_ice_power_and_clk_vote-v2-4-b9c2a5471d9e@oss.qualcomm.com>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
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
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773129997; l=1467;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=X+9qvaez/wKuQJXXpN5o7PpR/bLl9AJdUe0o1Nd3CW4=;
 b=3RZvw+FuTUzKWHTutZFpoLgdeE4niluTBpLlRRbKcE+KRA/LMtUu7QuT5YidI5nNS2nVfsl9p
 ZeQjwoTuBs7AwfO2R4RFaY8HaiBp7XwHQokDP/c3LeFH/rbjGv6L0Xk
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2OCBTYWx0ZWRfXz32S539PFQAl
 W6WodflKs3QSAM3ugFSnNLiBCl3xcRe37FR/mOkQRSY48E9lYk/aDou2KIepDvofbniLLgIFRAb
 PA8qY+n0eDl7kqC8i1GFSAupBaSAvUSk6xoNqghta0ZImB1fhJAN8MkULx5BeZR2fF+B1f7Yk1T
 iEau7w3WXQ9VSOiuLRgChPa+0x/10oIrqmUZ2Ob20ULZCtODf0tdA+uxNbAFPiquDTQkZW698vv
 FyR78f/4bRFAHiwW0yAkbgqZGj6i7Eh7iLgq9aG2LgPx+wzF5HPREMwfH2sslizsvNYWjejkc0v
 DVmpiGQdTJSEE2OK2Ym7o6Ai2QCJbhbXXnCb3mjRFMqXal/beSX6I/3JJs3ehwohdencbSKQeCy
 GgGrBzR5Ymg8SMDzGOGfdhb6tBBKwaBzziAJm4yr1S9bHP2y40vYfuR3XXrcgcT0Cj0U15lmqnE
 BQzQ+Q1X4QqL4Wtypzw==
X-Proofpoint-GUID: 6CI2E8C477yDE03oZXKHVps49actenHM
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afd139 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 6CI2E8C477yDE03oZXKHVps49actenHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100068
X-Rspamd-Queue-Id: 84C682470BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96544-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1dfa000:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
monaco.

Fixes: cc9d29aad876d ("arm64: dts: qcom: qcs8300: enable the inline crypto engine")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 83780cd3dc8a..b97a35ef7d6d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2725,7 +2725,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,qcs8300-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		crypto: crypto@1dfa000 {

-- 
2.34.1


