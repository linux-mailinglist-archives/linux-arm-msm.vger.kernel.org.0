Return-Path: <linux-arm-msm+bounces-98127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP0DAkMfuWmbrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:30:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA812A6C24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 066793052889
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE1835BDB4;
	Tue, 17 Mar 2026 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuOBz6uW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yeusu0S6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD3634FF48
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739647; cv=none; b=mbMADxbsJElWmUK1jY94pGVKoXDDgp8lspg+MRquR6CAS8eKdNj8zwqf+apbKBPdkS+p4SI5wG+Xp3mBh26v4fdWoBJNDIWby9/EKtZpb9+BMVlJachQKFcvQ2MSbfULvkIZ6fgd04D3elh2XoX++NIF+uZoMNK8twY+QDaQA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739647; c=relaxed/simple;
	bh=PqEXds4GrlgZ3n52VaQfUbW8LHZn+0T/t/toWPk5DGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jy8DrFfdGNdZxXx6WTHIsjnIfVoVHOlAfKfxHuSVJaECT7QXK+pAnlO7by74UcDtS2b9TrPPUobqIId2O4vRJmZDFtLjVXCjv+r5JJXPieJwW2+4ZlwPdfcaLQ424uWCoERPCXdnBAHz2ATjJByDZwMyx2LGvibM/QB5wb9kEwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuOBz6uW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yeusu0S6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7tB2H1533938
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsUDLAst7GCYzE791DlmXpqcmyhgQ6vfLLVyLS8iSTk=; b=AuOBz6uWd9ill70Q
	46wqbr2fS/zJP2yLzkN7fDs3xLKvHI6NXUfPqWkwFxlfz4Hm7QI1iY3cgwnGurV6
	+frQ5nwVv6zK8l2VLyH8fxGcIOUqwaIffATyxrFJ0FiZ2P02wYWQufHNIfSk7UKT
	aEVBRriPJ6DCqzR94AKX29Y+cQ4AOMKLm1FQiVEFV3Aq7147B/ysgayU1tB7GXLl
	N2EoBe554fTqYORXjtDcPZo5l91m6wW0ccqO1nWKJzPOeczJj5EexYfzg3fvS1No
	XyJZUelDKhY0ypCkXiFzKoSXiAvp75FrRF8oGO+DLZ8jUffOz/YKv0F9QvU+24aj
	p+lu1A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k3d55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:27:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad5fec175so271476565ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739644; x=1774344444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VsUDLAst7GCYzE791DlmXpqcmyhgQ6vfLLVyLS8iSTk=;
        b=Yeusu0S606MaraiVAAGPK3UxoNCpCGzfOB4gaogeVoJxkBVRhTJIxFS15sbcS8VH5C
         wPMzYnIWMdxWxCE/+cNljVooGs3bpHiLuPqhkLy2SeqQJjdMcqyeb3sCI7MOXd+6qTAo
         AUfGwZgpovUQPLCnaVzmgFeagLCiDkP15aacV34HMA5EQKVuNDZY78GQ8CaTN4vTUJv1
         DmuALXAfnb1/GlRKR8Hh1WTgV+hEF6D5BfZaVuXvSnfOJt0CXaSTVjFbrfmwFrinFf9N
         pNiBwxfKWHxKFz+8iJjBML0DcEp5yAgB0vIrNc6TQqQzFUfNUwfp3HLFBTMs8d78KSGa
         SOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739644; x=1774344444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsUDLAst7GCYzE791DlmXpqcmyhgQ6vfLLVyLS8iSTk=;
        b=FQYmSz1Lcz6YrtENsL92tDlvROZswjiCJCE/RKzHCG5L+k4ebTZZaO9IiiLntwkOAk
         xTVOJqb7daVQO7Sg/KToyF8zpJ9uwU4uarRW2CiEW544tpmjfD5eittutAzSWhYH+ozE
         UeED8FSVA8nvO+wBTUs5PjeTvCWq/QW2oOm7FJhS59nA0uRutTKiykd/SrG48AeO4AZ5
         40URqxpHFMGgkeGpopytaTj4bWP40l03CK03niiS1xals0L2BQ82MGIHjMwvR3xi8lT0
         b72M2OaZ5hPBVNBkTvr78b/DBGGBPHV4L6r8+GMO/UcE45KoHZ4CHDp3iT2nTgYgbJ3U
         8b7w==
X-Gm-Message-State: AOJu0YyAqWRh/kobYFFpRZn0Brik/7YLmWb8IQosmE3wXw4ljPBYbT48
	z+mONe6LKL1H9OvfK7R6QVyuJzBky9DjaYRmHvpXJuYemOXCmrsi70L/MwPnW1MxIgmHeQL7hFh
	f695FLtzrYeFOYFxPFYtLiei7i7D4rqseo4tVKjPIzHncl+0uOK7p1ksP/C7dumVnM54Y
X-Gm-Gg: ATEYQzzdttoWYiZe2QLpsLEtvFUp4jRKpL8Vu5jkqIOT/CFrH2KEeg0CtMmEYWbPaRr
	PI7HGvuzG5x714LIgde/BheOjEXzWAfcYflEZBNGmZZc/uTTmeYhni8ZCzDJjzt4FaW5oN7WeKd
	8a0Llz2jZvGvpXFxD/prlLZWSd5VPe/gaE4/FOKxQ+/v6okqA+PEiA/plO9bqwr+6pYZAaEnkEq
	TzWyQhbYoBUgqudRoM0YMEgvpc3YToiiLRumqLXR0ySR4K1vTv1AO2ecggJdG9Qc/d/RGxliTLx
	vbYgZcDB/yhTZX14LI6d+OOWupuKTma/oAMG1TFVS1dkaEE0VOrzt6sxYQlVHw9bqHaZIK5uqtm
	SHopjsyUqDIRW5m8UpunYtaZoeNGa46L+0S5XyaeQU8PLM8rYIr0=
X-Received: by 2002:a17:902:d505:b0:2ae:ced7:4650 with SMTP id d9443c01a7336-2aeced7510fmr163910315ad.24.1773739643813;
        Tue, 17 Mar 2026 02:27:23 -0700 (PDT)
X-Received: by 2002:a17:902:d505:b0:2ae:ced7:4650 with SMTP id d9443c01a7336-2aeced7510fmr163910045ad.24.1773739643365;
        Tue, 17 Mar 2026 02:27:23 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0659a90fesm19021845ad.45.2026.03.17.02.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:27:23 -0700 (PDT)
Message-ID: <f4358798-c40b-4425-9f7a-230cdc6398ce@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:57:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250: Add inline crypto engine
To: Alexander Koskovich <akoskovich@pm.me>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260309-sm8250-ice-v3-0-418bf5c5c042@pm.me>
 <20260309-sm8250-ice-v3-2-418bf5c5c042@pm.me>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260309-sm8250-ice-v3-2-418bf5c5c042@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b91e7c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LnETC1lSbQsXWPk8PCwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MyBTYWx0ZWRfXy1V1L/iQCRCD
 PqJ026oYyW9fL+CyehtMXBW3dD1NYDS8MLtu5r0iStJIdKWEO1VyccgAo4qxFhJJzN9mBc6VSKi
 EdIH5e1SQKTc3UBVDkUyn7Aejm/tqKA4i+iJCOV3zSz+4Ug/s4lnQpsEJWp7cAZ4TapYTVVSgzB
 76gEQBfY9K2JCuQboTzs5zNtL0pTi97u2Vq3j25XLwdZHww7I762ZMcLAFy60+yFf6dGr003aaQ
 sSBzHo5qQ6qHAfGB2ePbGkLhu4CGZn7vpcYZajBNOFqoAuLKarjNRIR42wUF6Cishn8IsGVRJW5
 DQa25fMPGpLr1zavtmKRQoeBqo4CK6idXvrrDmLDV1oHS6Bvfb6cdzbEVLTOZdul3duUOdEnwaS
 hstNai9QhQLpjDuWkKg9/1Hka9uk3nZqIYHcvQNOtwYFnZZ5zQr5sCRMzuzZ10NgqSpHs1IA5vr
 zMOc9TivnJm3ZnDURQQ==
X-Proofpoint-GUID: 671FylOGjd194kNRI2X9AjzIvwuLiM4_
X-Proofpoint-ORIG-GUID: 671FylOGjd194kNRI2X9AjzIvwuLiM4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98127-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d87000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,1d84000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d90000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7DA812A6C24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Alexander,

On 3/10/2026 8:42 AM, Alexander Koskovich wrote:
> Add the ICE found on sm8250 and link it to the UFS node.
> 
> qcom-ice 1d90000.crypto: Found QC Inline Crypto Engine (ICE) v3.1.81
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index c7dffa440074..b49007934278 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2513,6 +2513,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  
>  			power-domains = <&gcc UFS_PHY_GDSC>;
>  
> +			qcom,ice = <&ice>;
> +
>  			iommus = <&apps_smmu 0x0e0 0>, <&apps_smmu 0x4e0 0>;
>  
>  			clock-names =
> @@ -2592,6 +2594,17 @@ ufs_mem_phy: phy@1d87000 {
>  			status = "disabled";
>  		};
>  
> +		ice: crypto@1d90000 {
> +			compatible = "qcom,sm8250-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0 0x01d90000 0 0x8000>;
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>;
> +			clock-names = "ice_core_clk",
> +				      "iface_clk";

As per comments on v2 of this patch, the clock names have been updated to 'core' and 'iface'.
Please update the same here since your patch depends on this one:

https://lore.kernel.org/all/20260317-qcom_ice_power_and_clk_vote-v3-1-53371dbabd6a@oss.qualcomm.com/

Regards,
Harshal

> +			power-domains = <&gcc UFS_PHY_GDSC>;
> +		};
> +
>  		cryptobam: dma-controller@1dc4000 {
>  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>  			reg = <0 0x01dc4000 0 0x24000>;
> 


