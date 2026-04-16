Return-Path: <linux-arm-msm+bounces-103398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBWhKzvQ4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:04:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F83A40DCB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22D6C306ED7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCD23B6C02;
	Thu, 16 Apr 2026 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIGlN83U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCBO5LlC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7510834F48D
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340862; cv=none; b=L7plaKSyZsetpfTxmqhYxHeWGWcV+32iEps5GFRyhcK8kmusSqJfPR6r3rSh1M731Q62NRbAppenYiKa7XlxtFbvTOJt687dJSALyyQkGuBlrZsVsAxPG3tQVNQfV9Jgl2icbMFhCcjmFwvuATKEW7gnpBD1U+7eMr73Px0PNq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340862; c=relaxed/simple;
	bh=mFv/QysmUlFYxGHzNJM0PX9yoMSbOWdo3h4+nR7jJ3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rB+CUAxafxlSJm0I7dI7B99BZY5RKdeXQX4d100pvE1uAPEG2fc7MyIKtTG4DknQUMkIyrnt6hd+Z+fZ76YH+Xux82RQW8o/2HBQATMd7nfumi7LOqmXaiYmyp3PrQ7/gSzhox+5gOjB0KSlvSy1dCBFaju+33gS1vJsNrvWmSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIGlN83U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCBO5LlC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8QTTn862166
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85Cq5M1441DLnhTBkum4V1OGWT2xKQ9wJzNrmEMCJpk=; b=dIGlN83UuJm0iqoy
	0TaMlt8IYUmusOD87mQj5Qh5x272ngFR2IyP0C0fDgy9C1sWNRod8XUdOkVEV8H7
	30DG1AjQSemZmXeXxXi+A5L2gEbJY+mXAjAqDdWumI/Xh1hM0lGzhhe2OpiPhyOt
	NNGSBBbde+1ozWpMm5CNqBfoBrX/i2QEJWHWHDj3ZXAOZYVdKZtAhtQ2U2LInXf2
	cbLPasSEnUnGZ4+fRSQ7t6YrZpmvxKexj3ZnBjIKut+POumMQohsmsbldhOSLmgY
	NSSWSKRBWaSHjs24cKktNc/ehC9WWENFeJulws7psCfTFevISFkSL/X7hcXwhyHv
	a/CVvA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0ebrt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f5baa5418so566025b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340859; x=1776945659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85Cq5M1441DLnhTBkum4V1OGWT2xKQ9wJzNrmEMCJpk=;
        b=SCBO5LlCQe6zbl00HK7ZdKBf3666zNBkE0zrepx7+1IwJmL654ALP6mfD5qsaFqZaw
         XMY5It01rOI+ccYF0NehgH3BfB8gD+1aUmROI1M4uu90WsKGi5X10rOMx9/DzQAuJx43
         Txwhw34aK93GqC5T0FVeAT6zd9IBov8SeeEFqDkqA4lbqqYcRzblooCo0d5F+HznsKlU
         m6NjJqcfvSISopHUEg9vmIh96aYOxlkLf4QqXKVKrk1smnnOSVNeQiUM72H0J7muaElW
         53QQL3KnMYfjfNoepnqsphNYiFMIAJQAS1PJxB0vn4mqmP1e8adJhNjI4F9NmaltOd4Q
         AESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340859; x=1776945659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=85Cq5M1441DLnhTBkum4V1OGWT2xKQ9wJzNrmEMCJpk=;
        b=XYTUbk5Sgoys/SHUzP7oljMXZl22b+QKH6H2FQlpK+Fgjy86w4lRb1KjLMqhbFF/xz
         vuFg8FDfWx6WkRYWBVns2vLdsYSnI0fQMXkwuMb/k2REdD1zBYEo37qgWq95KFpg1gtq
         25EpIRLEy/o2NN9XijcKvQZZtbKkzJ/00rlvq01UE7OPahYvk2qvvcrZ9f0pnI0rzVu+
         2BzVOeDWvhHi+7C5GNE3M1wo5UrsB7g4uahFVfCDEkmTS47aZMA4WxKj6qaki6rs8uXW
         WdhWTQJt0YwwdUtCRHAdkY/8zwyblzA9iI6+MKxdPz6yJafVC6VdnaIqM4lEMKfLb9If
         n9bg==
X-Forwarded-Encrypted: i=1; AFNElJ+WA6VjtX9jJymYupsxucJIMM3zpT+E/d3R0lixFfhy2r8NtB+BeuWpypFdo/ApuGCufaeMvvlMyeQZnQtI@vger.kernel.org
X-Gm-Message-State: AOJu0YzfGc7sjY50wNDnERe2O2Ie5Y9rpB7C9XTZPzLBdBZWzxhUgUvq
	DlE0lN4miY50afjwpY5wsS2dzSAdRtP5WZB37qpjFC5kMpWaZK1EDYHr9RdncAAGFYVh1obFUsc
	n3J7IVf7YTFBWNsZJK8AZY8c4OgKKw/eWP03OzAUPrpm4hJR131jUMyRNEKbVwwlRwEWQ
X-Gm-Gg: AeBDietTsYrquZbX6rfkXoVlA28xry1KYmsAHbySQx53oC0D2kQB54ZdnoB3YtW4mwY
	RhjXaltoOeB39Tg+pYqdOSREHCnZcbzs69ttwUJaEYLDbVX17uBCVy4/GWIcF+69JsYfnp9N/ar
	8Zuk21w0t4rbOe0LWR6Q1kPviJgPqunp6I/cK0r9DMyD01K8RQ4FDmmKGyeVeShTUy1R6dRVaR9
	d1HnOzyK5b2lRSyb5lc3Ewm9RqocHC7wuxc5/60aIKigPy1d3AjsBIhsEpjL7WbiCW+YJcGmNT8
	lkfjrAWx+XARLX7XngQXtcqyYUR6CHwR1VCmhk4DOmO4XjVcdaFK7RzT03nTDNjjJMsmAHy/VrO
	W+JEiMXt4nSlObqEn7APvpB5ilOYkWAoKp3ibxE+mvdxomANDTmUxg5S8/A==
X-Received: by 2002:a05:6a00:2d82:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-82f763f4d7emr3075770b3a.3.1776340859201;
        Thu, 16 Apr 2026 05:00:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d82:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-82f763f4d7emr3075724b3a.3.1776340858597;
        Thu, 16 Apr 2026 05:00:58 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:00:58 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:25 +0530
Subject: [PATCH v5 08/13] arm64: dts: qcom: sm8450: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-8-5ccf5d7e2846@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1568;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=mFv/QysmUlFYxGHzNJM0PX9yoMSbOWdo3h4+nR7jJ3I=;
 b=6rIUbOHa3Mobdn5ElNpC5oH5siqhNSrqb7TZ7HbHFAKFaavnA3CE8Sb2Uf+bWE8h4UnvT9sEN
 B5e2IrAXoFCD6SjGogwZ02WRbJobAmOpzTFQ2P4KUzKy4mchl2MV01A
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: CYdChGSn4eVCTs9iPLPtHC8QZTU-Wbnf
X-Proofpoint-ORIG-GUID: CYdChGSn4eVCTs9iPLPtHC8QZTU-Wbnf
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e0cf7c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfX9bDplxM+nhOe
 xd+8Qg7cSproC6gnpUwu3xaGCwg/RKAJtgsx//fq47lgiUblSalsDbZOKAepxRug41xx1MX6UwP
 u3qXDzBhXMb2+YxuOnEkVKU6hb8wpij91xgbM+tzCoMHqVEmbAoXjj4GxMctm1gsMJ4Ohmwze0H
 BAMjsOjNDLBoSc/PpXYd83IeaunqhfSdiVrrFz7r8eODAsBPe17qdE2zg0/UmfXgAHVtIimaIjT
 AX/f0Kr6Hv/k0XvWyMTaSSwV9ac/fj/xWRh+o9AGdE8G5jDljmFZEGUWCFX8Zo+IfFZwkyD+neC
 M6OFk/83kvyte7kvcupXgH+Dhs2ye2PQ75MuALkwDTdWMHSkTGyhvHS9BSMSoM9rY+ICZ8OP/rA
 YJSASqngrgAhv3+lMRRBFzk16TLNiAsEKch2A4Cb67jqqhabVGBKCEkt5ERQVfcDXKBQyXnA6yQ
 WCZvr6+g6UUuR4zcFeQ==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103398-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1dc4000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 2F83A40DCB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8450.

Fixes: 86b0aef435851 ("arm64: dts: qcom: sm8450: Use standalone ICE node for UFS")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 03bf30b53f28..9528baedf8ae 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5374,7 +5374,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sm8450-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


