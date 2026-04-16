Return-Path: <linux-arm-msm+bounces-103399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cYwjDCzR4GnAmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:08:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E240DDC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3FF65308922D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BC834E741;
	Thu, 16 Apr 2026 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WiREz2qc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxnTvvX8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3E52F5337
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340872; cv=none; b=MUfpWU9JWKef4o3GIeQnYF5RD0689qWpwXS78b+NNBJa0itmJojhAVzJRO/Ptyzy3+tTpDgedMPTBGVx3NTf1GsUKUswj9lScFwLatd6Ic/4HeS2ZH+d/NxJlrMqKTg462lhxMbI85jEbiRonxPJG0SjyIan3qHGshpqjMa4XNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340872; c=relaxed/simple;
	bh=z99JMkf1pnX2Nke7sOx3xwAS/Jwb310G7tQUUNdVAiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0epy4M7GEjU5kODHVyJIc3GcMGU+JKHMFAw04OXskLcKtB00aotlrV8Oh+nR9wNgm+pJDjc/5eOHxs6q091WpnuRbFvHFBhr1T7DX1Ie8COnRRWduqol9ESHPKPJGLwPCQH8CwSRSJ3rEgwOXWMH29RVRlrpdSqmR0MKnzdT10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WiREz2qc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxnTvvX8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8QTTo862166
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0vIm3ILY0qd7lApxZdqueJQwm3beMzxpl/RYFhS7+w=; b=WiREz2qcJmzdyVRR
	UfcgZ6fCamnFQYCPPCIBCq4rMTpT0Hg49vwj36xRJS4evRaXZwPeoinApoBkS0ab
	mimn5aqa4Z6UgIAer8i0aC6m+3cJEN96Y5O12U/Qi5CRy46WwobJQaDUo8OFQQyV
	LM90/qqv74yBaqwC6/PbWuulKEIvtq4SCXVG58f4f1cKQ3qwa3erLYCtFcg9jwBw
	FVBYdC0U/xIgqi0FwH0onf6du9Fc0tQawsjR09st9sSz22ukYr7ZeIUd9FWyTN+3
	vxGXvA3yHw0iWQiguGsnMA7rzNkQ4aMUXTRV+ZJmbNhzeuydPTarzwISF2yCYM2t
	cjLbyw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0ebrtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so5460095b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340869; x=1776945669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0vIm3ILY0qd7lApxZdqueJQwm3beMzxpl/RYFhS7+w=;
        b=NxnTvvX8D64Hcx6Y+We3BW33HV3rVJPU/XVH/wOvXNUm7s/guB7HtHW4dBG6xsXE/a
         Nd7sfLLh3CIT0ScjmRp4S4OQJwkybck5HEnH/8LZCd4Bs+Nz7l9nAQG4CRuWQWzCGOIY
         q+is43UCxAxAnITCvGJ8gBE8lNm6h31Y3TWQpE0GAe5tmvn8H93ckhqKZoFnbOmn0Ucn
         vzG10dlWkTHvyg2K86ZGb9QM002RZ4Eumr6nhbaz6F3xP4GpFF+KRPnE/bq2A5tu9gX5
         J2FsS+YC6tLRagHMTrO9lJUB/sL9/RaLmG1yp/EfA7QKylIqrjkQByILf5Xwab9sse+B
         GV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340869; x=1776945669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J0vIm3ILY0qd7lApxZdqueJQwm3beMzxpl/RYFhS7+w=;
        b=DdKyjPHcWMsU5Y4lVesO9jbyKZfIM541GQftNmjm+wG0W5LWrbBa1vTYTBjF1P9ks9
         KIQAp6k64qkTA8SUdlyLseQcp/Gb+XeaOAMFEONgtiR6DqO6lGj7E1rttYwdkmgSOTTb
         C5X3O3DMbELDZefBif4c2P9WNCcpRgpLXWahHVwSdHiKtp+gK6+XYudN/C5eHb9SurRY
         1K0KQc9sGEWQQnjiRn+IZkd0Yk1RKQTdgI2mLfQWdxy+ZDazuHjv1iFERVR38drjKBA1
         P1S8Dwxv1GvsTf1tXnEImS0v9tld1STuWXvQJjUTkWVrk+9Ghn78UZS8grcH4Wxm9oWV
         OvvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8V+HuBBz+6mtnoQ6fj/PIpBEjCZoadcRZ62HGJ41OhGKTg/WXbbnCDZyW3hcczanO3TlD6iBmj2JJaSi3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzGBbUyWO9+U0hvGfE+1QNnbuz2bz7Df+vDc0OkyFFRf50GcNya
	VLUC+gaozJaU+2WC+nnFM8fUW4dXWbJwc8VQDDsMjMkDWX8CsdzE5LWvqStL4aNOOOQMHoXNdCb
	G9oDAdb9dTw4Y3cWnHncRsv0yn8eUfaHuK9LfijC/f5XqUDKEbpLb7LGE0qdjZ+30Sh8c
X-Gm-Gg: AeBDiesIsjoVSQGfRnOhTHM/DQpgWV9Xxn8d7PV0jPEdM1Cp+N5FXqbOSHZvWkOt309
	ResDVF11Ywp21FDu80gR1zEQ1ZFeJpXB7SlJwyDpI+Xns3nTwe6UWQzYDLAQoM62kwHIX4F3rSb
	pro7JqK3a4bGz3RWj6pVAHQjW7zqyse6SaBC8A54szqiqA6L9WQ5R2JmdOPTi8o7Z9ECysIhOqJ
	kqXUvXp/s8lLOIQlrJFiANhWQxMZNiXckOLUJj4DXEqkWBGykdZcMODtfb/a42keZD79Y5xgI2u
	yYuQmIqfVrmgOgNcRHmP8y7ul1gS4KT6ZqIxVmpo4fT4VY9FcDWYPtXpK62PUm5gyTfuSWQ3Qas
	/Ku7rzUhyGkEL86MYEi6ePhJcttXHP1ZhABZsy4RNAvzXLNgaZgyXiYT72A==
X-Received: by 2002:a05:6a00:e13:b0:823:3079:7c7 with SMTP id d2e1a72fcca58-82f0c2f7a36mr27612293b3a.29.1776340868704;
        Thu, 16 Apr 2026 05:01:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:e13:b0:823:3079:7c7 with SMTP id d2e1a72fcca58-82f0c2f7a36mr27612162b3a.29.1776340867803;
        Thu, 16 Apr 2026 05:01:07 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:01:07 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:26 +0530
Subject: [PATCH v5 09/13] arm64: dts: qcom: sm8550: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-9-5ccf5d7e2846@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1513;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=z99JMkf1pnX2Nke7sOx3xwAS/Jwb310G7tQUUNdVAiU=;
 b=XnVWyzluOpdMBMeal8wz/S0LJ0FymNUpqE3V14EQVZk4ct28WkuNED24E+P+K1rdKIdlIIVhp
 zQcyr7IZU75A1E1MCF8BA1pYW0jhLqfuHpHAC4Gr0sUk1UijDXThHog
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: zEw-pini6jI-oEVSa6D52cnlwOrOIEAx
X-Proofpoint-ORIG-GUID: zEw-pini6jI-oEVSa6D52cnlwOrOIEAx
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e0cf86 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfX/A1ceZlYwtqi
 LW/VXsmQEXLt7LNOeNprcyImIVtm4Ry/cUn90aLR/C4MPtNa2vuJkmPuAwuKctg0Pv1oT1bvmGZ
 q8MyXSqOU+zSH6ZL+nDHEVqeWlZ2HZZA/MzF7dBYJTK7r1Cu7Uojs2OSA67zNLauKwyjocCz+4Q
 nQajHmvlnMltD0K+DgnSt+W3/0s9F5/yM8B0mN3Xkn3nSKnonLGvU71X4wYjvmhxGtl95qM3nlY
 Stm5yZqqLhvrt7+g/Rjf0voLDzSYIe222qsWwfuEyK72CGvG7XUB/fqUmiiyLndPTXSp/pDMZjt
 trVtU3D4nxj0yLdtSwjIo/q7yeFhOCZpNKeuPATPMhqcISoNrmWfo+sK8j+vzSti1BZ4i4xxwyU
 6ejcepISP2G4soAea0exjzsqBXEfuRCQhEvihFvK4tCmyDGzlD83wo7YbLi/o/ULN3OdJ6ii0r6
 l8FjwM6+LfSfZ9PDpLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103399-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,1d88000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1f40000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 174E240DDC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8550.

Fixes: b8630c48b43fc ("arm64: dts: qcom: sm8550: Add the Inline Crypto Engine node")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..fe46a5d41fe0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2465,7 +2465,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.34.1


