Return-Path: <linux-arm-msm+bounces-107785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFdOFsj6Bmp4qQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:51:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABBB54DBDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 733D7319FB23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BE843C06C;
	Fri, 15 May 2026 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZJao5xn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzNX8VNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B41B3D3319
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840943; cv=none; b=sRPNVJAXhfRVA4MhfYpbRQz0j8tJsh2CFPW6LsuhUgvNrM9fAFmA9buOxNQ7lijW8k2uVghP+5OjSOFA4fQw35ETYx5nwh5qhTCB950yHLLkWq4LSEiZwPIxQHKvFgibG7ds2pSzhT7hIqzIa0dH8nqeArE+Wi/kbsyub7o2egY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840943; c=relaxed/simple;
	bh=LnYc4Uf6Zj7qgzTrWROWBK27v52kuP5FNB3OaImv/DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbffzB+1UpUulRCt5Ydl3Lgo6ISkRYDxr9imaTw40uyYJbVONKBn9Be9eoSAH8eVbb1iw0iQlL7iWRKj+h+nmqLCh9JTwL2RkJFNhF3vOOp4D9YwkXtvxjGB+gn4MM6RShNVSLnUjGbQd8AW3eAkgqRX4wI3EYdsSJ0bnIpZ6+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZJao5xn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzNX8VNS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4UYqM654911
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y1RiNDXIBfcOkBMrHcP7edqinXmBvxHiwFxSxjAQBr4=; b=SZJao5xnlh5A2eTc
	f336zPMF1Hz9W9q7q1LzHyRnxPPovWF9WNoWlvz66GoblgOjmCOQ7NH/purQKU0/
	4Tqy5bcIqo5BPu3hrRKSxFwKek1cxaUDGHCLi4Fdt7weX0lz0n5xb3mTCBu9+nh7
	W5uI5uebiD+h48fZ/W5pCrkMmHo+Ge/E7MVFU4jd2pXrfcVk+4Q62JDXEjeMWUyz
	x5UA3XzT1aV7kJwLS+RJjZW6XPux5+wVUr54NC44aQ7tI0SgflATpo1UkivAWAVA
	PXuNogpP0CCR+aVZIkOosnxXYCUqw2xKsMmkNfcnzaFtEzuDCKi7+NEOSbAgXHoW
	ScnGYA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ptw3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:29:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63142e319f7so506776137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840940; x=1779445740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y1RiNDXIBfcOkBMrHcP7edqinXmBvxHiwFxSxjAQBr4=;
        b=IzNX8VNS/G9kqYeg0ff1MOSJsfCdIYX2XsTDUGrYYwj8/by0P7Ld4cHOo1B89l4eZq
         35O/BcmX4NIiJIqDJdCZh/CBwFnQ9qMn5eEP/HZTPJZHZVv+awYI5Wp2K0FDNfkn/ki6
         u0ietD1wPFstCDX1c9O7/2TL+4nlvd/m0JVgbrow18XhDJBIui0oU4VacmUVFjYegpg9
         ldrUK8cTeE6y9mUeP+z2zwqBnqxnFEkfq/WKoB+x5BtHasSb/0NqZhvJ7gkBduAhLZGl
         vhNiKEGCsIPHvN2C2j+hrYs9rYZ2DEuhFxKvNcI1uPF2hJzXQrkZC0dgHMxrTODHYx3D
         UdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840940; x=1779445740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1RiNDXIBfcOkBMrHcP7edqinXmBvxHiwFxSxjAQBr4=;
        b=TFRcxCnmdWGG7fZ8F53aZ+QctgR5V24YbISaIK01a9BBctS/+8Vbl+3O/cBYof5hyz
         mGqLSHGA1OHyuHV2fQlZ/Q/FC1/zWnx1OZvNjaOspjd04uUJdHtwf5IVafoCYkw2iJ/7
         FBkESr9B4PYbG62XPulf1veF6GnRW8M+aYbtBV+422/zfj88n9jT7ZFb7Y8fc9xOb5hy
         4P4jARYJe1lwHO8VyuUFSlSWK7OM5haRjs6Zlbig0OAUCLO9NCncz0Zxzm0H6FzM9J6/
         gX2iR1rRCVG8oYM1uLy/WlyfLpuY8c1pYVWPEFYQVXA5kAQIEtCMSwYNJVhLMgVi3tqy
         xgwA==
X-Gm-Message-State: AOJu0Ywi5Yv6IJZvtXOGMBRIIJPf8E8ifvYFMBadvxjY3aMuyIcyvLzn
	xAVuCDllzRl3kHvU0/ETfGT3/gP5RFPJwoe8YWWY+0bmPhWgLgfa7Winf44GKeYzz1vCJlqw5Gk
	bvttXeohNGbqQ+9KbZSZVL4p3iXKQ3cm7OA/cpeq9rccWfrfGCHOYpwHsgmQtztZi/kq1
X-Gm-Gg: Acq92OGeE0y8TIdWOdZ/90rUAI+pXRfg6E5g/pnI3qMpMclntyE26lSBqKcWc5X2kq1
	BMQcKVGmdeouOpu2Vh4GleUxSeGZxNePfl/5GpxHJyWzN4T2Tp+8ohSoretBb3nEEcFcA5QmVEA
	1btaL5utNx6O49FvI32hDAPnp3bikxNH/76unYIow2DrHFwrI8YTvrR/LBaBUYJGktBurSLUQco
	oP0DzP+R2isAgGRxH+Bbl298M3prl3ejiP/3M5kgpH6SYbM2kaGnb+MQ4OHZGeCCPPR1BWCrDJz
	Uid0DmOdaMYYmHuO84M0aznEgdGFU3tdWbnyvlaJGTqo8gOOHSHESo0ppxhaodmnIRwTQE4wSIL
	3BbgLI31IyLLCrAg6yADTpRFGkadR228TmCG06OMazKcd46p3EP0di9sLYaUGWsxlk5BYVW9KDW
	afRAo=
X-Received: by 2002:a05:6102:3f0e:b0:635:3f36:e1c5 with SMTP id ada2fe7eead31-63a403a486amr577747137.8.1778840940576;
        Fri, 15 May 2026 03:29:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0e:b0:635:3f36:e1c5 with SMTP id ada2fe7eead31-63a403a486amr577732137.8.1778840940077;
        Fri, 15 May 2026 03:29:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c29ea9sm204315766b.16.2026.05.15.03.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:28:59 -0700 (PDT)
Message-ID: <8dfa0670-7605-497b-9d53-db9b4a8a3d8d@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:28:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add qcrypto node support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260515-shikra_qcrypto-v1-3-80f07b345c29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_qcrypto-v1-3-80f07b345c29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rWeARJM3NNZInEyeUFMDtclJQxvNLEhr
X-Proofpoint-ORIG-GUID: rWeARJM3NNZInEyeUFMDtclJQxvNLEhr
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06f56d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Cp0X72Tp7Ho1uHa1MVsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNSBTYWx0ZWRfX+W8J3kJMblVI
 H2q1rWeiE1qJUp5FAwK96CSLGtNJQfpYnn4ZlbrNJau9jx/uhEGfiRm3dOzJOfnSfRtF4KTHWnd
 UwNbK8pStCXKuJ/NSpwtU60GCYQjkiIaGfaFS/Ovmn7zzT9kQSwD9Ioi0XLr3U2KdwajOe3C24l
 2NfQXvZhZDZlNcT5H6HHcu/hcbmvu7tqNpqLouzvEH3988tOrPmcO8nx8clQ1WtgXuWKHuG2k0i
 W87gJmt8lLtn594BL7p+FSRDkbgrTgCP+9wPP4Nrzoi6ye4If2Sz3dWcDBrJveTLfJB35jDIwJa
 5WGzD8f/ABgVfzrwZ8IuT5dgFdheFIpd6cB1fM+8i4chkRuNMhVtFuUxNd2RxyYNCBFm4RPfzjR
 U7uCoVTy2LWXSSlhpdRG/Qqv3LKDCzs6VXAkCl3ys+4maPEeFtuPOlbtCFMcADxxV/4gqLg9J8P
 bKIqBcyjxqXQFSnp5Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150105
X-Rspamd-Queue-Id: 4ABBB54DBDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107785-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 9:23 PM, Kuldeep Singh wrote:
> Add qcrypto and cryptobam support for shikra target.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 262c488add1e..dbac0e901d6e 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -541,6 +541,41 @@ config_noc: interconnect@1900000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		cryptobam: dma-controller@1b04000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01b04000 0x0 0x24000>;
> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			iommus = <&apps_smmu 0x84 0x0011>,
> +				 <&apps_smmu 0x86 0x0011>,
> +				 <&apps_smmu 0x92 0x0>,

> +				 <&apps_smmu 0x94 0x0011>,
> +				 <&apps_smmu 0x96 0x0011>,

These two entries are logically the same (SID & ~mask) as the first two,
does it still work if you remove them?


> +				 <&apps_smmu 0x98 0x0001>,
> +				 <&apps_smmu 0x9F 0x0>;

Let's keep lowercase hex

Konrad

