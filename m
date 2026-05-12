Return-Path: <linux-arm-msm+bounces-107051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCqQABffAmoMyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:04:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A3551C5FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85E813004D21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7637F46AF0A;
	Tue, 12 May 2026 08:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmG5eYJL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnpkfqJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8FB368D72
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573072; cv=none; b=qraONlB+vO3OQPUCJgF96/PdXx85PRQbs+bEKlF4QejL5N2KdC8rTDgiMhtBaCxLjCa3FoCoHbwlS6sX4kict3hLDLxX79OBLrWATHlVb9HNA1E4QVE4Yai1yV4abjhHOp9lbGPkds4wUU1KIQf+5Jdh1Ha1nc8nUWqjChWPh1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573072; c=relaxed/simple;
	bh=3WGE47pfdoo4k/MjKdinj+dl7ukeJ81TgpzUVZwpxeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQn/DPlpirmMXEvBhw0CGLiyakQlhJswaFKqe/qMQlaNhUELuhqwdXpomrIMYuPA0CdCtPcb+wFxNjqz3dp8Ioy9vCkjv4BJFAYZctbhbf8NyZcZfhJgxokESOjAvFfaIzx3DZgAvpgaJB5fCH2I9DuEpBTZuG89KHNWrDoGF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmG5eYJL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnpkfqJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5BQ8N1184397
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1O1Bep8eC2VqYFRAY485Q++gy9Sfmn6rwYeFrN2t960=; b=MmG5eYJLTmexLQrc
	uEcWOt3CGOzCsW+asqWxA4YMLHSqebCBcXXzLFMYmQHDNu3LAunc31gEu2sC89Yc
	QiYxsNqRtYg6Xtx3ef5of+A67hUrFe3iihrXNLCt4Ub/EBL6br9N6XdwL1TyZN/v
	z84YWHV4ZGDXl7EULC4XT5voKsPtDzRQmHelg9l15AqHkg8bBTht/d+114+jZ+tv
	UIywnfj7mf6AqOOs62xSKq+/m1RjpOAS3E3J7p+DvNhwWfQN4PTmhD+CLvbkp1jy
	2pthqUpItJ7kAC/0m/8y9MMcl6RBTBNlJmBIRNpj6OkuRvfrpM9nNkh65t8Zo0pt
	ccTYig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuya53g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:04:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b461b36990so57039765ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778573069; x=1779177869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1O1Bep8eC2VqYFRAY485Q++gy9Sfmn6rwYeFrN2t960=;
        b=DnpkfqJTeu9RwUCij+/D4Wbsq2Ig4FlVb+r25KaHyyrqtjCjy7YxUf+oB1tPQl2ZC0
         7AWGIybvabMfKU2MFCTGjgayXJix+kpNvHf0c1GssCVIrP/t+UfQW3tcs+8OVyTzLAwp
         kF3CnCn13t1+Ghb0F7YPw/MCSU05gHkMWS0TaUTLPqJ75U66XvhDEvfonmh+QCDUxAbI
         qpJuhp5oU+ypEO1IIcSEwMMk90qxFVHdSdkJ/Xk0LE+vtLXRnACw4vx/GXpIROzSc6wX
         MFUMmhXmbAU9aUf40hHu4SUO6I7NCeyoRY0wWZYBefqeEuTTaqUBvZgmA6XmxUShApXC
         8qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778573069; x=1779177869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1O1Bep8eC2VqYFRAY485Q++gy9Sfmn6rwYeFrN2t960=;
        b=CUJ9/T/edx5WVqEXskaJWnyvQAxRswhR6vihef+TdrIxF/M/VGRaet6tsnSuJNYGTu
         9clkl/47k5A4zMsvx+IA+Y2Bg96B2uQl/yjh/P0xUVmCCpdQrcP+9XZ/C3XKiNnSQatN
         wvYWhJPdwBXooc0MhybZzBFrI8VzwCpA96U8G2enhaZgrHkuKV94gWBTxsJC0ZFK2pQ/
         yTxaqj2XszasMYXM5HCVmniMOpDh7vJqE1CG2yS7dBhk1QdN7FHXJkQ476ncaJA4aOM6
         McA1bF6qx6/Ixvrfgi4JXZwZCEmPLhgNSrXq0iJAfaVdituYp/Q1O6yJ1kUbj+Lozp9J
         q28Q==
X-Forwarded-Encrypted: i=1; AFNElJ94iFIU69P/D605WrsTDvMBrLZFAdtLsJk1SiGQiz/XKtj2ZguNgdZ0j48XoubAFCemuMSzxIlSOFRbSTe7@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbmwCOei2kln5UmbjT8NbDb4lRfwQYiBNGk6ph/CUOmOpG8gX
	7xl6b5FEw7FgDZNE54edIu/1voml+7Tsas7mQ9FpsTjdq1PsxmqxOiEmVSoMbzAa26vFPaJTn5C
	l5lOKaZvx4Cze/A/lr1KdQrqcsG4JXueXWELUKrKhr4JMVH44AS6W9tb3kVoDGVKY6DD4Aq+RMt
	n4
X-Gm-Gg: Acq92OEaZJ3BCnWbWz+h79bqFYzF3iqTDyaNCDd4ewTSPGgi+lDGGQAlUrpSXe3mmxI
	BK+YUuOfTysBiOInsKk8MvkrATcUG8Rb+JU7ZSDESlVWZmLKzqAYvymqjISsCS+SI8lZOvrmUjL
	6hgpCmKrfVbkMDuBroqWfgSk34+BhkTUSQ0tjQqM67NWhOSqD6Z5LTDiKckURMk9eiUwNQIUeje
	EJhFdydjz2C/Kst2W2xY3CFARIkqH3SzXPeVsUemQsH7BolA4TH5TmzRands719Gwo86ffAOlwu
	NwejCsL94tSF6UQFDdGg0KnlXVeUVOfvxHOfGEfZ3ltYpKpNF4sfiLQiTlsoMRPmLuAWM67wSPJ
	ZVxY9/YP6Xt/YoKJto2YwdrvKtM1VKptQUs+JF/X9pQiOYdjxZ8syr01SvXe6gE1wCogwRPGJIL
	LgzseeDfA3fDTKYRe4
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr192525505ad.4.1778573069359;
        Tue, 12 May 2026 01:04:29 -0700 (PDT)
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr192525035ad.4.1778573068888;
        Tue, 12 May 2026 01:04:28 -0700 (PDT)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d271b7sm125431085ad.14.2026.05.12.01.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:04:28 -0700 (PDT)
Message-ID: <83c260b9-dd7f-4c28-ab83-91853afa08a0@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:04:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: Add crypto engine and
 BAM
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
 <20260505-glymur_crypto_enablement-v2-2-bf115aeb1459@oss.qualcomm.com>
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
In-Reply-To: <20260505-glymur_crypto_enablement-v2-2-bf115aeb1459@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t4lxUVnm8WHi9kx2jRJsziWnWEQzm-jl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA3OSBTYWx0ZWRfXwdP64f7DPc58
 Clk+sKGDTuo+dseKIlvNjapVevmGSFdou9WUq/eHCAIMt2YhMf3h9EHiQd6KxEBXYN6qIiucaxk
 4p/sI0Ud7GzgcY5/gRiyuvIrdu6sSst2lhjpd5e3FMwfGD63J3Fe0aBwXbWM5WZ4MsPfEC6dbJO
 cCofqfbwgfoVf6B3UjDcZ+VPQ/RuTZaFRZLTPkgYrigOdriFYc+D2hX5hZg02DatEdNwvxzw6K5
 6QhrJbjcdk5GGdSEUz/3oeasECESn5MMgTFuNjfgXusz0W1NIPrYuDblhCbA/jOm9T+JNu2iGbj
 Z3BjyfPTIlDF4oqbyCkeqYqqyiscb/hbVXCXCACUTDRq4jE5NUhMA/pbMyVafkQ5STThez52TKu
 2oXtXZU5SY7zgPTkPrFEgdbpTMhwSvdWptQNt+DO3xJioPNYZjrhW53DQYpDm97+TgqPdhoffy2
 qXeG7766UHYi8Sz97ng==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a02df0e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QMFbHPruP1MRKEW6HfkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: t4lxUVnm8WHi9kx2jRJsziWnWEQzm-jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120079
X-Rspamd-Queue-Id: F2A3551C5FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107051-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1f40000:email,f10000:email,qualcomm.com:email,qualcomm.com:dkim,qcom-armv8a:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1dfa000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenjia.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/5/2026 3:40 PM, Harshal Dev wrote:
> On almost all Qualcomm platforms, including Glymur, there is a Crypto
> engine IP block to which the CPU can off-load cryptographic computations
> for achieving acceleration.
> The engine is also DMA capable due to the presence of an associated Bus
> Access Manager (BAM) module.
>
> Describe the Crypto engine and its BAM.
>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..349da9966d52 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
>   			status = "disabled";
>   		};
>   
> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			iommus = <&apps_smmu 0x80 0x0>,
> +				 <&apps_smmu 0x81 0x0>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			num-channels = <20>;
> +			qcom,num-ees = <4>;
> +		};
> +
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,glymur-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx",
> +				    "tx";
> +			iommus = <&apps_smmu 0x80 0x0>,
> +				 <&apps_smmu 0x81 0x0>;
> +			interconnects = <&aggre1_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "memory";
> +		};
> +
>   		tcsr_mutex: hwlock@1f40000 {
>   			compatible = "qcom,tcsr-mutex";
>   			reg = <0x0 0x01f40000 0x0 0x20000>;

Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> # on Glymur-crd 
device

root@qcom-armv8a:~# bash /usr/libexec/libkcapi/kcapi-convenience.sh
[PASSED: 64-bit - 7.0.0-next-20260415-00003-g5de0c764975a-dirty] 
Convenience message digest operation
===================================================================
Number of failures: 0
root@qcom-armv8a:~#

Regards,

Wenjia


