Return-Path: <linux-arm-msm+bounces-99556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF1TLG0cwmlvZgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:09:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCB3302261
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FB4A31127A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 05:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910252853EE;
	Tue, 24 Mar 2026 05:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fruGyfzZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNFJBc9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDF912D1F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774328711; cv=none; b=Qdey411gDOCVg1QS4mXFUpENplcyLYP7IxlYy2eLkXFbr9KY2bUJOlTMKuhwnSRVANi7aH2qQ4Z4+kcgldhfxbxM/McVPrDinQx1dbtQa67BJpb2Mc9qhZbT782rXIyjxNODCo1DEWd63Uo6hTmoRMg08Th9q8MSQb3e8OiCIkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774328711; c=relaxed/simple;
	bh=zUwFFRo6geXN8Ov4xaFctP4dDiEmRc+oABVzzvyL9iM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5bQ13uHJDZ0aehd5PH8SD6SKJfMooaBLBS9yXNWONqcw5hWDC6WQ29bAQyNu23bPcAfErdCiqtXSy1k0c2tJHg3btAEi1xOSlAf6RtwVpitjqaqH8eCz1HlwLfr2P1hIqse8d0VQzx7naE8ag3LkN597Z/CcN98SoEy67QCz/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fruGyfzZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNFJBc9j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4JZEC943509
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTeMF/ACpsQkCMro0pibigi1s38+6dwcwFlwar3P+Es=; b=fruGyfzZf29dairQ
	2M0XVtjYu8JPt/kw/74vDB+PDI3MSQO4pouZgxlVf+Zqg9gAJfqtMAdDEELQeMh0
	hkaw08yiOPW+5y041u8dnBzaHdtjt7zkLom8hrFC4Y/6YJsfRVJPjahd2Mi/Mhen
	eYjfIvqgeIEtAtCNB+o8dhmzNOB3EVasOdZM9CaZf/wfCRJYFkIwdm39Smch3J0f
	7nWJI/IUeF5BYNV0m53SBmTX9FgqDcI6mJ4yJelWOqn3Y3j8yJ7qH2ehdj3AoUZw
	ORkPiDqbE9zLLolfwyDCK3KUBstQL3S0ixz9lL5Yp/7ucH4tdvrUK7H/tqNEYvHE
	brOemw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vku94b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:05:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c245a88a5so1364918b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774328707; x=1774933507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTeMF/ACpsQkCMro0pibigi1s38+6dwcwFlwar3P+Es=;
        b=HNFJBc9jZHxUHTkZhYruZJMe8uv7uG9FpkK7hN1I4KXVPrX5ZgnHdIl8+TuVtzdnej
         /DxEnnEEw4zNvarrI5Hdo0Abw8lw4vs9iuTI5/YPjD7jPnABQl1Vrr+0/e85k7zz74IG
         pHMQub3teOFeOmJkfaJ8iJN+/n2KYP77+u53Y5BP25Ytm3L/8CPTjI9xB+FXjDK7K1w2
         KEDDiH+vmgfeVc1jUyjx4/ugMvYst9gei351tEemWL465K9ebutCkCXbpEZsQ/RJ44T7
         rHQroqfS0xjejzcmujMhWlPxJ9QBQdGOTpPgcPF3/NL1WC2bB/vOrcoxC2os3qtun0pV
         3DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774328707; x=1774933507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTeMF/ACpsQkCMro0pibigi1s38+6dwcwFlwar3P+Es=;
        b=YOL2pImhIOtxv8ex9WRhFIZuQPt+/IvlaTxpb1lZiqThXZn5Pss/jJczN6nSlMeP0f
         qf+K6MsKlNMEhlaKm2OB58CPrimuVvBKH11sYSARvdE/qbn66dHrznZPcIWS96/e/B0O
         kjzMudzjltBFRBRFxTjCq/QeOPQnAR/FT+TK87LVLHi+ZJtk9tpyaahdBBpMIzdVf+LD
         Df7UfZC4bpHg8YYxVsg1ubONj79Q2d85diTNMQR55N9SaR/sGjGChFblmTfq4rWgry1i
         ip7rppZtVEMjP4ERUNBcbgImQ2y5wbpZEEDTEAM1edvj7UddmbmJIiQqGT67eAomUZ7N
         DkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGbQ/yY21cfnE7negnQLuxPccYoSybpYsYcsEsFXPcoxMaSfxg8jdtNLcT9zyL+k9psSU1NJQmh0IsOJ8g@vger.kernel.org
X-Gm-Message-State: AOJu0YxO1U3yfNudw8QpLtwlVva4h7QvyMKhaRh9I8yVLO1EFxFXoj6R
	75/EDGbyDR6v0pe2fU7zaJIOFn5cuCdd2JOJyPxe+BH/gnTCbLreEw35QvPU5rm4kNyHYgdn9IK
	I+P7QIy1Rxym8I5kJA+aX5p3RTg1ed3rSaWI6rhNIbCd0PSgOhrbP3GGOFZPj8OjZAtP2
X-Gm-Gg: ATEYQzw4pOeh7gO1xFxISVn6qJyjUeyr+5VOKdxaEnuTi5VwFP2t8iJOHlMRzhI7GaJ
	ZoNoopZpli+Rj8qsaQQTXkhRXF2yZFmho4n3y2/EOAu+rv3Rf9+qJ+IhOiU0x1POD/cqHwh5aus
	V0NZQFg28FDlp7Rh5NjiudfUnMfF6UTWk+hCZDdDG0l8jZeKupQdIdNIPxZ18l6dhuCHSW9bhmX
	pe8PVGhI15YK8EWr77r8KVLb2RtN4khOwm3SmkXx8eSXybk9MQcVdgq42D1a6Emr0s1IVp8IoyD
	unakN0Vus6N1jMEDrosSbq/nNlYXew7g2MxBJiXhkxJ5u6uRpKebL5nantG7OaPYk1bXelfHUPk
	f2ihZmlaxC0qERTELEbKlqX4P6nM5xSnVn8xyPXZtfW09g0Bc9Sf5
X-Received: by 2002:a05:6a00:94db:b0:81c:717b:9d31 with SMTP id d2e1a72fcca58-82c5bd50708mr1805179b3a.2.1774328706925;
        Mon, 23 Mar 2026 22:05:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:94db:b0:81c:717b:9d31 with SMTP id d2e1a72fcca58-82c5bd50708mr1805139b3a.2.1774328706372;
        Mon, 23 Mar 2026 22:05:06 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa9fc6sm11517543b3a.7.2026.03.23.22.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 22:05:05 -0700 (PDT)
Message-ID: <328e25c9-0bee-48c0-bfdd-3161ff9ecc4f@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:34:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] arm64: dts: qcom: kaanapali: Add power-domain
 and iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-3-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-3-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAzOSBTYWx0ZWRfXwLcN1dzVU2st
 +XXfr+p1JioS+9Oq6HIWUK5IT0uS/t+wr/jsoUMDxUObwkd6UIjRk59cWA3kETALJaKgcQx4EAB
 1NR21Pj8tSI+g6SSOkGWtA8qQYrKMTrgadWWiu7kj1LARq3ETeMf2AqJ8DRkUTTJHIf5fhWeZB5
 sqozPiF1nVUkMIoOZ+FenqVO+JXsZeV/evVPA5faQz86e/EHuTMJFVZE7KZ5WAqA39OSzNTdF2K
 okQkZhmNGgATQZt1QCFpf3KacNfrhki+eYtBaLAXtttBdS0aiXdb2vUXaptNunekbGFvwcFesWX
 2fB+MYPMxVNPnJg2DGEgD2Dxm68a4bMwUWRxq/BSpvGZ9tjpFQQuWS0IyX7fU4R4mRYbDwraO2D
 LQ1iDuyGimZfHo22zeFPf8JW0VzbKnuC7kJCQ2DDMA5fM3+2uqpXK+1SHsy4BFPhW8nlE3i0Nr4
 IOKeYYQjZ7J0ZvvJnPg==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c21b84 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WCIbC2r976qWEa8sWNEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: oKNNevPHfU7YT0WNsKIQUBfr4dWZAxEa
X-Proofpoint-ORIG-GUID: oKNNevPHfU7YT0WNsKIQUBfr4dWZAxEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240039
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99556-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1f40000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DCB3302261
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 2:47 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> kaanapali.
> 
> Fixes: 2eeb5767d53f4 ("arm64: dts: qcom: Introduce Kaanapali SoC")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 9ef57ad0ca71..52af56e09168 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -868,7 +868,11 @@ ice: crypto@1d88000 {
>  				     "qcom,inline-crypto-engine";
>  			reg = <0x0 0x01d88000 0x0 0x18000>;
>  
> -			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>;
> +			clock-names = "core",
> +				      "iface";
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>  		};
>  
>  		tcsr_mutex: hwlock@1f40000 {
> 

-- 
Regards
Kuldeep


