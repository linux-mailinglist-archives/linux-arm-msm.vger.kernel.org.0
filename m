Return-Path: <linux-arm-msm+bounces-96546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBmuJrHSr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:13:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CA3247166
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E991131B342B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C407E3DA7DA;
	Tue, 10 Mar 2026 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gt9FqRRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUCtLvHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847513D5259
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130059; cv=none; b=ulmk88DlC4ollJ347BGpyom06JwAxsBLQ8crH3Ktsi3zV06S3VTEIX/yb8bAvGVdzdn8zEcqi5mF+P+QTuA9gutoRPfsk6MYlMywAh6Ety32/xbKynlVSv9UP7SsVqDfV/e4LYeF5meQZ0ypD1x/khddqtNGjDwM+wo6LVnIQ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130059; c=relaxed/simple;
	bh=/WRo6DTYnhZj2QRCpHK+TJkXMcLRJ6f4fUiA76JshP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gg66L7t8jTkEkPzjl26sCIQGprswzhVWkA33R0X5Fy8OkIqhwNHAY9C+cKNgxkkQjhWPXxVfZmDnpQMNpcRXX17vUn8MNhR2Q2oY8HX3VhMkgt5zxNmGJuijC64xoQSgt1W5vyUfV3hQV16+ryyowT/XvnuNch/fO+np2a1LSj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gt9FqRRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUCtLvHW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EZam1900138
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEd+HHr4h6KqnF7zSg6nnkeThUZF8EBgI0BFcLMtQI8=; b=Gt9FqRRUUkcXWWGE
	hazFXpAC+p+clXZbRUQWjQumkcmEyyM+okrU81Xq8gpDNkwSO0tlnPjfE3Ws3HkS
	MCecCQAfuFzEdwc4AIH6Lf0RFxs8B1z0RUerHrrdrvQmD9N7VShXx3IEb3Xvtb85
	rs2y0h2qBKsLMT6Ccz7igaf89nOyEC2aVxzzHKZvkQ1mHFnv0ISaWkRRK/fqeb48
	WeyEJCMKWzmTm37VBbLMdFwrMGTb3IWtRwGu6MPCLQAYcGmdrjb7ZWctvaGs4w2H
	pdDn3WGbhSS7XHoDpyyfd6gw1BiWTvLdyBMlgM6O1rnwxMFtut/G2vgM2aEknfq1
	X1xbpw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsacapg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso7935207a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773130057; x=1773734857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEd+HHr4h6KqnF7zSg6nnkeThUZF8EBgI0BFcLMtQI8=;
        b=NUCtLvHWW5KLLA6Seik41fuDnr5y0ux+Ekp5ltQKr6mZ+ShlqwZogcAriIOltM4VCl
         TSGz8wkYBF+2XzYY7Z6l4nGlINkVf1igLeiHvHF5FVxs3mp05AMmxt6oI7qiJFSZIPC2
         INyC6qhtXjJs4PjVYZvUezIm7y4YGyzrE6tFQR+b6+O0+TQywIuEPVP9Jffv7fRHlWfQ
         3SJHmOW/WB0lxD2G/OhjdVqjLBbIgshUX7PxTb1Zhu+HIUapCg7F2vIkOwrWW+1f98QX
         Cwg3QVwiGFbNy3snpUkrB30ukHa9QQhCSElxxsR9WojpnJrz9nM/nDnJfNLnefA87TWG
         byBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130057; x=1773734857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SEd+HHr4h6KqnF7zSg6nnkeThUZF8EBgI0BFcLMtQI8=;
        b=Ej/+kAPv9PAECIEHd46Jb5b1jQ43cRbl/yZJ1kt9S0bxt7mVVJfXJKINqHxRUN5Hdj
         Lyjfyoam2vxd4c6SR4dQqJWP6kHE3rmKMbuKiqaWt5gV3qVI1DsCQBNSaqVmfwI1/GxP
         zdp1ww3lONfzJeqe2hvNSjd3FcnKYXCevCt31NODBzNadJ55JZfKSCOjCQviMPRw7Wb7
         rc1DG+8C0Q0akvSrDFT4JB5x1iXZ/4eeG9hNj/9ZHG5W8WMs2hZL26T9l79vP2MhcLkp
         KydDfk6/7m0EIws9gD0Q5V+Ydf3RSdNVb9w5ngob5VjDEdm95aic5yw/0MZ0CxKK0nAc
         3uAA==
X-Forwarded-Encrypted: i=1; AJvYcCV5wxMfCWPxXEa9DOqUKLpxMFMRnygPzeMssMU+8em9OTQT/91Xy+nbW8+z4y4hmqGWkI4ElS4tRBELjIgm@vger.kernel.org
X-Gm-Message-State: AOJu0YwYBzgfn61rrCmIX++cVult8m8fPDCo0op9AGSaT5KIrd4DSntd
	GXzpdez+R5o/kLAzFJ5SpMZhK0a/Zwz+VYvD51cGPcLLhitY0mPbkplFO9bRbH0jayJJY3KA5zz
	qYg2Tv2Q1+vBNbDDpAVBXFMsgFHxZqxh0wuJHuaNzCJnQDI32mFX5t4Q+84Zpy5h/8ti6
X-Gm-Gg: ATEYQzzVtzEcId7Y0e1KsO1esOZHTB2xluMTdnoHfgReMoSlMswNEKQ7eW/lP+sMZjK
	a2/k35lhBxoybrORWXmo6eLPaBeY4yNdp1DJrP7JwQBM83yekEecGSuYQHQHxRaNHjsbiOg3lPO
	THPS+V9ohLpWojLhntEzxeo6f46Nx2MYgkiIteMPw9Kmg2GHY/JD8BvGU64HMdP13UiE9Beiaf9
	9CrbCzDacjRsOBg3eoZnHRD+5lLofNPuKknHRSqUcKevnNHsz3ZJiAKR1HOtMhQbqFD4V+3stK+
	zaEBYaDYuMuOsJwAvswyu08l89mwTJT6SmFkbm7wbqFjfCeIoxcf6IsBAZ6yFoLmnpg6AvVpjwi
	8/ciD2b8cebDiPcnMN5bO6xzU6DdU0JS9FY67Ktyw7vT/gCc=
X-Received: by 2002:a17:90b:4c50:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-359be3b9d00mr12413568a91.34.1773130056503;
        Tue, 10 Mar 2026 01:07:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4c50:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-359be3b9d00mr12413522a91.34.1773130055963;
        Tue, 10 Mar 2026 01:07:35 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm11121969a12.31.2026.03.10.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:07:35 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:36:32 +0530
Subject: [PATCH v2 06/11] arm64: dts: qcom: kodiak: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom_ice_power_and_clk_vote-v2-6-b9c2a5471d9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773129997; l=1464;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=/WRo6DTYnhZj2QRCpHK+TJkXMcLRJ6f4fUiA76JshP4=;
 b=e8NOCiLqM8hZd0MIqtImw+zFS7P9C96NDIDVyGZ3C/Z9SIlAr+GERZwd6+IkySZen3sV0sAM3
 V922DYl4WEfDjia3c9tP4bNbhIlfHUi/zOmOkMD11BD0GGtDhsnk2Jg
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: 9SXErVFsyrrWNga75JptsZ5MnFIrq5t4
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69afd149 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2OCBTYWx0ZWRfX53+02coq6uuB
 chpM2hKkFNjqFFgbkJ8xoJfhkDwdvHb0Ky0nMVwYs0zeLY0nzT9mdoraX+EjBxKo+ysPygkeCtV
 Wv7nWR2qEv6Wah5FKo0exSuhy8pKBGaxlp7N9NYOT7RmDzp57epW5rM3XQsjPMtKNHJ+jK5fkI1
 bM5lHEFWJcU8hRaergvKfAKXUK+T2q0G/f0MdVeRcA9z/pheE7lfJAktSD42oBVps7laWUG4exa
 DBAr5cYNsS6+fe3tHjCRXHKRfi+wl8ZjUA3CamiVbTKp80/xzzV7kkM8zD6/JdEr2cxqgWOq2cM
 oTVE71oLAmwWsc1SU12FcGi6sIcm7jes2r4dlBtmfSXvNSLkYzrtXAJHCY7xOFacviVOEFDjQTJ
 UTWHzmtMQMsYh1BcXmQUMBwgNt8ekmZ7Wo2u5DzH5Ng+YcxD1/2sugmFAJkdv1QZt3AUPrLvkd5
 dm1874MhdBn7hImLY4g==
X-Proofpoint-ORIG-GUID: 9SXErVFsyrrWNga75JptsZ5MnFIrq5t4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100068
X-Rspamd-Queue-Id: F0CA3247166
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
	TAGGED_FROM(0.00)[bounces-96546-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email,1dc4000:email];
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
kodiak.

Fixes: dfd5ee7b34bb7 ("arm64: dts: qcom: sc7280: Add inline crypto engine")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f478c5e1d2d5..8f2bda7af74c 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2574,7 +2574,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sc7280-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


