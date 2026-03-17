Return-Path: <linux-arm-msm+bounces-98121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGeULyYguWkrrwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:34:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47E2A6DFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61E1732564F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEC93932DE;
	Tue, 17 Mar 2026 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K69OfnBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhKYxgbX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D82E36C0DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739345; cv=none; b=RIlnn+plpKznqvKkaqwLpP+SPZ4e7E6epqn2aSyp14o7GZ5dwT9F+pudEQKPvKq/k5/siUpENesUntcvV5lMUO7U4zlyUDJuUHKi+f7PsYP+sbhEK1TLpxPs2+B4N8XhHtKclUm1l0svi9fmCacxOEyV7UnDC4FrVJcqhkEwJD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739345; c=relaxed/simple;
	bh=EyymIO+0SX1tNJOGZcOd6xpMbabopuFyvEaUeA6tyUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KllQjunV7kXOD+RjpLQcNauacXL0YEbQYpjwq0I/gmMPqwgWdx/EXhveIRzzU3k1SZEDklisEO/sQ1hB3lPBNaUx0b5taaORKzevUIK8e/CsdtK+MctH3ESBhMx4zlPmbXvVhu1WmMFR8zF7niHRs3U8jIiTXDoJznw7iwiDQwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K69OfnBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhKYxgbX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8Snmi1534048
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGgwjLrocEcbshjjlymfN5Fda9m7X1bHIMMmGcLOwZw=; b=K69OfnBa0rqrDogn
	Xt/v/gk/JV/+uYKbMBPRaOTGWKklIBn4hC5fK6GwBlS8AdSD89XtZ7pLZITy+kQn
	FRAUuHsFx5DvCkWO5eqXqevIwFnuOwwuj/JaVf2du0528d5OOdW1XUvTLrt2NiW8
	4caA7TGBSXDqyqwRA2ioK4m+emRmlcFufI1R9dKBU1NRIeY5KOkYUkxjIg2F0ENH
	wXVYh/pFJ3A6Lkcz/zT3ebCY7PXE6e8LZVjZaXlukSe0ECo4j7CmFB9i7LSWwMJF
	EpjPg59HhepEjRfQKkVNRRwIPk5lZw64iDM0JP35Fc8oAWPVcDNcP5lVraRWjy/u
	wJs4zQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k3cmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:22:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35ba237d2a1so563533a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739342; x=1774344142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGgwjLrocEcbshjjlymfN5Fda9m7X1bHIMMmGcLOwZw=;
        b=AhKYxgbXcXWGr7enEvX8VqfxqmZWycc4OLDn6FaQ/tWR27cPMwxD3XprcCcnYinbBF
         Plmcyntb6hbWMM1j592EpOF1mNWr1FX+24PNpDbtZvY/eEPOFt0VWLnOm1sLRejz2Tlc
         +Y3T/dRtjOSs2CJjWzYb3hGUXmqkiHawMCnApmfToek9uNkSkPaefaIokDKHIBafe5Cl
         v4RVTkw4gwtlsLwMh3Hr+5Kc1IOmWfq+BVmtZBOmJ4vVP4cTYJabtFm2G9d16FjHLulk
         kjN1hAW2zXKPlDb1HHUUYTE7DgOYhpQeAjiTJb+r3/InqIMcA5nSu6vcYIUmN35QjRhH
         mJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739342; x=1774344142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iGgwjLrocEcbshjjlymfN5Fda9m7X1bHIMMmGcLOwZw=;
        b=BmDzBGhhXzv/pxeP2+y/J8Nsxf0BmEIBbLu9k+0Qdqg8clpOiQUL4fsJ5iyvveamHm
         iHwu7lkrBFajCBhwP+Z9TJ8e2FMLFjBawjzHnQCm2pA3w4rEH5lsjq6IK+07EnDKgJyq
         OWgahVUaBTfXWlvXOY0cFRzXwJcVFOFr3dzdT8PbdwnMb5iUMt4uQ1rBcqYu0K5oZyxA
         3WjGWM0QdkXTaubC2KAjTfqDcQEDR3RpYoSHnJs2VIEfDo4zAZ26qQqBLU0PfwvNya6r
         S+3y1xuR+XYY578zjWRHdyLlZLm5NcDJXG0SqBx5U/ScmM8soEXPD8/K08LAKQfIYq6Q
         GMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnED3DEPLQxPuGb8QBsIdu1N+/8pJorPDFj5kmiGnkISc/xkH/cRQhhbS95dfW4h3a97EMA3B7wTauLd/z@vger.kernel.org
X-Gm-Message-State: AOJu0YxSrbUf88qx4MNd8VEH4Hg9V5lAgl0ukcmRlJYYEYLf+xrxppE/
	NQM/s/v1xdN45tsagEIavSgih1dtShor64b4flvHSPMasCgIu4SaWFVUUa7eAZFnL7wSlptXfvk
	QhFrnK0nzW6QVlGOAa+IhVlMhEf4DDBbTjEqJ5v+nUui5z1ELcKeMH8ovRrxWPA7PCqCb
X-Gm-Gg: ATEYQzwFVoA90cxFsfVtFCT8F2e9EvLQ8R8ORKH7Xc5HmlyZTPu923TDCYHFmFPurUS
	jcQanFvA/kfeFJ1cJsDAhAPgc8ohQ2M09pngRc0bM5WdxlQKzkAjtkQxdTdpeqs61sIGbXIQnPc
	Ki1rEDGBzxMbI2CRDMWOMDt7ceLYn5tam2+c+BxeS/XOnead/3YnFqyOGnQIvfXZbKnotcZdn9l
	3cLdOWw8ql6oBjYX6hs5idyBI9jWHKRTBix8rnmfmPg0Ymxj2XbXjq/XtDhKzeEK1paDsMEU9zg
	A4TqQzC6TVAC2V1WlXlt+9q8+op2Sb2TwRR/y+SfwIh+jMU4rSmqMgb81bWCSHOmISN0idtb2Bd
	INZjuasLJ9zb/d/PfOcx+igttSaf72orn5gYYNBsnPF5aTSc=
X-Received: by 2002:a17:90b:2781:b0:35b:9ab6:1d59 with SMTP id 98e67ed59e1d1-35badb4ba88mr2157276a91.13.1773739342090;
        Tue, 17 Mar 2026 02:22:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2781:b0:35b:9ab6:1d59 with SMTP id 98e67ed59e1d1-35badb4ba88mr2157229a91.13.1773739341566;
        Tue, 17 Mar 2026 02:22:21 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:22:21 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:47 +0530
Subject: [PATCH v3 08/12] arm64: dts: qcom: sm8450: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-8-53371dbabd6a@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
In-Reply-To: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
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
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=1446;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=EyymIO+0SX1tNJOGZcOd6xpMbabopuFyvEaUeA6tyUA=;
 b=lQAGtlUNfquAf2gQkMUAACvFjA0vALVpEjVrGUGXWiO6Pisl+B1wLZtCpF4Zkqymj34vfw1+P
 xE/KWbwJfa3AzLJZpWI0aUb24irCQBa6lDVcRnR7OarF3i7alGJVEiM
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b91d4f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfXzkUOAkY4cH8o
 QYd35v4+evLJhPBn6PyiscqJgYlEJavtDeVM3Moyg72Qc82OOOjnzvqk7RVDfvbrOIuO1kloGNL
 FSu7HSnjsZd1/Iimj7y98E1aVDoHVCRK0PPrgzRPgdRfZdOXeuub2YDA4PcOx82mMr9eJ9Fb8EK
 9xvoI3djPFjxytkHF+QpJjlHWO94Xi3grxKPpOQTKXT2d/MVAdMCjTCCq+xEOrwFfm5AHCr7C2S
 anSBHm0XUcOMrdfgQ+fklEJjkevNjiuAK9iIsKBbx5WRV8sQDrdufw0+sUqTrCaqDzfhhClQ74j
 ykzgXXfQDmZSUP8UwuGBVslwehmu31jS2T++IptjdPq/0MnvReK0pgq4mc+pkERwndwdEmA2DVr
 AIsgiBK95n/JKF0cAtoPWaRunj+VdkIMlNn2qxc7ysT3keGdG7c4cMEVVCbD/9eEGs+o7scM+zp
 ycJLrlyt2reT3xb6oLg==
X-Proofpoint-GUID: psU6YDfQHbCoGiBnJENH2Wt71gr7-xU_
X-Proofpoint-ORIG-GUID: psU6YDfQHbCoGiBnJENH2Wt71gr7-xU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98121-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1dc4000:email,1d88000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
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
X-Rspamd-Queue-Id: 5F47E2A6DFA
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
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index fd2d5648b92a..0dba282d644d 100644
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


