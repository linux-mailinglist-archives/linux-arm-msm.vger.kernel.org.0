Return-Path: <linux-arm-msm+bounces-103396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHquIvTQ4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:07:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E719E40DD9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C748B319443D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2960D3A6F18;
	Thu, 16 Apr 2026 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/BzPB16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LFFTgF4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD423A8724
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340844; cv=none; b=bXxt5Nfgkx7ORWy2TF+vu9RLiv45uUBizxgE6l2BZI/ScXv6sHGNAr5EaPvWcOfKfL45deTxfa1iTcMyauFcy/5PYN4qPfLP0Xf+7SjFpodd3HtSjSgvUihtYeUD2PKdAjeQDTRWH3Az+VeptjKrgRTAW6SsC7CYPM1EcWkf3og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340844; c=relaxed/simple;
	bh=LEbiblCKcyL2p/bVLgNgGMJciZnwnEoCuE0intdil4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gbvsVM2yFEzcgDm4QBmTFhJm6O1Hnv5zjcuLdWinwCljfigQS0HJmi7bnLBj/oDn/hldwpKCMXBUqP7rm9L8/68nHDZwgQF3MKx0sbjDNwCxvXTOH7oQ9aPYBqQwT9bAINLtjjLSxkGpaDIbwIDYP61jrC99RjgY95wbQo/Z8+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/BzPB16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LFFTgF4I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GAY4q01245288
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86A3Mpzo70ON5GHVzRh2OgwDHBFC164e1PdRbOxYstE=; b=i/BzPB167eoItYdU
	9OoC66BGxpkflwVC2uvnkrsOoVDRXiZdEytwbPwbRadYLEiWCoFmWjM0V695gknW
	XklNgvRRubAxzmP6p4nkhWH8nZyS75Nj5M6wfchtsI/d1eGxTezGSoXys/fpXHjl
	GKf78gravvqSzS+s2jDu4Sb3u3PNZWh9jIz+RoKjDEl09zXnZEqvFHWFr/DmsvQD
	Z9BLLhc/3z6RGXEwTBElkjS0w5RWijrB76E01lmctzbIEvyOb1jTU0rdud4ROfiG
	rh7tG0Fg5/w/+FhG9Vwx7pm7lYBMrPhO9IJMUIrBWxhxHiyRg4VODqHs3xHl6NtJ
	ytSyMw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djx4k87xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f220f1dabso3200579b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340841; x=1776945641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86A3Mpzo70ON5GHVzRh2OgwDHBFC164e1PdRbOxYstE=;
        b=LFFTgF4IIFR0IZjG/WWsfMy2cpfUqRpwLtmdoS1N/SBl2xtr5NirUBHthH9TVlCrMP
         7VNuK4dgJjcFYcMYlIzLHS8JbW/eJIJSaoXr159J8vfJ6Jnn7f3Ok6vjAdnFablP0Dhf
         lFIGWN6HxZFvvKnieh97nXxQRS/9C4gzmCCImgnhe69w/cQ5cwXe1rTQ3GjKB9ehAnZH
         Zptn0/vW/JSlJfMAVQbRI+QOB3v+MLDyReiChvpg573ZYtdWpkGaAa3IDxzmbavlalVq
         WpgWaiAvIzAB7EecsvmHiTygQ7B9v/GN5o+RpiPVgKrL2/nO0Y88Bx/qtqrd9/tY9vtn
         lXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340841; x=1776945641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86A3Mpzo70ON5GHVzRh2OgwDHBFC164e1PdRbOxYstE=;
        b=Odu35b1bLbFJ2AUNW7AInfFv2ZvyGrvO9rionlqCzg6RpbrucUJRegWMyP25Sxogd/
         WV63MLtVW0L9Wc07NS8JKsm5ALL51OOErJI4xtBzpR8haPvErvr8pLCxvp3GGJxNg3pw
         ddVFt2Ebhmw1S7F0OiM+JNOnYcyEjNfzCQmcB+ihpTT0NFt3wKryXnj+x+WI/xPGUPL+
         WP3IND5CRLj/cJ/OdBXkvBidqymU9DDL+ZxBx5kQCm7KyVKQSvjeIwnbDUzi3tlUTXCW
         qc44PAu0XNCA+QLXMpOoUxeksYjK+0QIvTIUEZb5BAE4TmQXbPd1N5EfvwoLTHuohpCm
         ZtjA==
X-Forwarded-Encrypted: i=1; AFNElJ/fnNi/Foe5auH90mzp3N4fdC5AJCe1c76/axQhhyfHWWr02sKMiNd4Y/iCS8St4rSSZ+pNuUM4GsLpytE5@vger.kernel.org
X-Gm-Message-State: AOJu0YydLD+5BFBRhjhvomvG5yJ2cWL8xF92v+lNx8MYcmbLwHWFZux0
	EmEoSqeaZgzLtZcO8uz9ZSFwCHz9XVM8+3b1G+AD2GT+wbtzruI+Z/B6xh6Q6PY43jkD0vLXlGp
	U1SevVWbQlw5QA0aK/KcgOCJvkdDr4UJC6DzwqgK2AD1pauF9MwSYRTXkqpWX9J68X1xv
X-Gm-Gg: AeBDieuqYOKZj0+lXsE9RbbxOp3AIBk6CLRFvV39SJIK7Y/Cy8H24J9/hz1TkFeNMt/
	zuG+Hm1KotvNib1iZvl6MkzmgGc3emutxfvGjUY3A6FaD7AMzDSrmE8aPEBxEHofIb9YYRraoFX
	6YFMbBm1XbymAFEMulpUTxKEEnxkffz6vfhk6KkcJ/u6WTXkDwmTJ0hxz0CSsrQ1tcG45QtD2SS
	w2A40ij9Doj9NcinNNsGh13N54+Kgy/RGUrKRc7TFO+3cXO/qJPV22t12G+oCBmS9R9Udj3qBtS
	k9YbMkz0LukksTZrbuS2jcauGaKjCiAY307IViJpnYQjXGYl3FUJcwUbBWxRKMUzNoTjyNdE7Z7
	n1m2V4vekmQrKLHagCIvBdspFLwk/4RkuO27K+cLEpZITI9KYOXj7ZURBug==
X-Received: by 2002:a05:6a00:2190:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-82f0c3256e2mr25219059b3a.44.1776340840942;
        Thu, 16 Apr 2026 05:00:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2190:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-82f0c3256e2mr25218961b3a.44.1776340840181;
        Thu, 16 Apr 2026 05:00:40 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:00:39 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:23 +0530
Subject: [PATCH v5 06/13] arm64: dts: qcom: sc7180: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-6-5ccf5d7e2846@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1533;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=LEbiblCKcyL2p/bVLgNgGMJciZnwnEoCuE0intdil4Y=;
 b=0l5AV8MgWXyQHRAPJBcMxCawIilnbY7Jw1JjX7zKCnHnHb9BcISfQr55Jx094Ha34FtuH7hbB
 gNsHb725uU5BQ1/rJke8nrt1o3JL8W8fkfqg+kx7UO6zQIGyANEnVvO
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: CiRSkPDJDDpElBhat2hqtwp4AKH_hcMR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfX1xsHOCVAONUk
 Ch+H0KEoN90vDieYSXgXD50USK1SISWQRns2NEUoP0iU5S1QJo9hKSKGm3+6RVBcPXWweRGNbSU
 3mnpWu0nBbR4sBYiYDUJ7GjYYztQMxox5DyNqtZMJ0Evn1LH4fjA14PNAqewVjOWROJaTEZhh5V
 apZGQ4NIwpnh7fdSnl4uiV7n0cLu9jEUkbUzid4jP7aB7un+tV0w0nOH1OLbBWA91yWn4zgOvX3
 fO0EsCikcYEdVrb6qp4T7Kk7o1o2VjAO0O+Yo1v2cXZKy0UR+wI9/bU6eqoDk1/bSl7WMExz2I8
 Kkjn7aVwbk5Od5MHJW0feMhR2ToEWhnecr6MnDkIiOYJ9xG7wt/O4cP+xWVd65Qh/zYTlRHBte/
 W/m7Eiqznll4evT/w70CY0CTJevwiI8cmlSczIIEz6TfYHl8MRaMLWa6Fya/9fnjWuB5wXKeqNE
 /8IpQgXBLHmVMqDNv8A==
X-Authority-Analysis: v=2.4 cv=H47rBeYi c=1 sm=1 tr=0 ts=69e0cf69 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: CiRSkPDJDDpElBhat2hqtwp4AKH_hcMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103396-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d90000:email,1e40000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: E719E40DD9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sc7180.

Fixes: 858536d9dc946 ("arm64: dts: qcom: sc7180: Add UFS nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index a4b17564469e..94a699cc2688 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1605,7 +1605,11 @@ ice: crypto@1d90000 {
 			compatible = "qcom,sc7180-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d90000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		ipa: ipa@1e40000 {

-- 
2.34.1


