Return-Path: <linux-arm-msm+bounces-91868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K/ZA3RahGl92gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:53:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B96F0133
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36587300DEDF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 08:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511D1366045;
	Thu,  5 Feb 2026 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ax1RN3nW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PG2GoCMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D68736215E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281577; cv=none; b=sx29LCUqiwCyd91o6Q3pgn4XigNa4UndNnKCFFiJRNbzgbPrpQO4sKqQj5NxpE2ph40wJ43sYycOV41rA2B7pB0p4Fl+FVgAc2hAL6pdlfBL2ARs+Lzz6KpoAFa1DLtOfi/4eXpWZUo3KZPJ99oepqgkb4xiNgQAtjgqShXNG0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281577; c=relaxed/simple;
	bh=c7P/WFmJMXx1C+hCrQWKse0iEF/ahb+JeTKbdbOQpVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFuFSpO8JiylpEmOCegIeOrUEdiwu8hm5kGmzjAsq2pHQ3AZb9QSJG+/fU8ccD9ddP8OjxJvyYJgpa/QTfjbGEPxZksPTal1GQ9bY54mdOGW+4xq4EIbqFatD+3zk5fr52D+Qdm6Zjg0DWSZs9iAQIIYrYxNJqrqls144TVtmvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ax1RN3nW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PG2GoCMG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dje72759471
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fLHXp5bEQ7zk8zpZ1GwqPshL2Vh1UcWfM8IcxAPvSA=; b=ax1RN3nWsVxUWS5S
	nUUtFlKaOouxSXgkTA7WVrpTH+nRYZMsqxHcJYeyU37TJBFm319dZyCKxdnQ2ZKN
	+agfRxVM8FxtdhKuqTGAsYZH/jKO2KIZ4bPSi7q09hltpRRyKr6W2zIVCCwXBCzj
	KMtNU1MCCe5rXBkG9+it/JCKEj+KqGx9CNIJcqalZnxSlAoj9Fh7DzilTpcF8AqE
	1xOYl58YbuM8MPrq5jKIdxoqqAFyOS1PHHD5Dft3LlObu2yt8a2gkbIs6O6I1F1T
	r73sqeliSwP+IDPK4RozGlmrX1GUz91YoY+MiddxuPL/6d7eNqYv4CLMMB6uKQJo
	U3sYqA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4jpd10rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:52:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-894a207e7cdso2797976d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770281575; x=1770886375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+fLHXp5bEQ7zk8zpZ1GwqPshL2Vh1UcWfM8IcxAPvSA=;
        b=PG2GoCMGezBMw+fm8sfY4EMhvMMQ82bhYsGX//WK0AvXLGyAjTwsIlfunAIPq52jPz
         y60r+HCZfmPJGBYalAH7WIaOLD4OlvyFVN8isgr+zs+s3hwtgyJA7TDwMmohwEHbUsGq
         vWhZcE9drhisCMn+MoXx9yQg+eqooh/TOjNcj1IGTDpz4HdxbAFDSu3gOgTu2i4DKDuG
         1Hhv3OX1OG/RpJTEpkB7393RrkpkIaBmNv8PojuOVCotoasKKxUmPv8SDz32DNtCFCH5
         h1gyP1eCAGwKNfl+5UuBp2UOuEKXrOhwu29NyGD6s726/JrTi2Edc4KSrhSaYPJQBLkA
         n08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281575; x=1770886375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fLHXp5bEQ7zk8zpZ1GwqPshL2Vh1UcWfM8IcxAPvSA=;
        b=nu32BHn36vUfBsZ0P7AdDhgRIHXNH/Q+Tk9SRF/d6GOpgB+r3WcueQcDKVrfMs8LvK
         pyzmLrJ3xXF0zBlgWD7n2f38xlJKi0sQqOIMbgGAZxwyBaUfkp/5lkVgAsxX60lqKmUs
         G31nTMISxg3FadiJBS5Nt0MYRXd42UV1mh5pna+7JgxbTnr1pSLJVtu4UsHmyuZybS7/
         4Fkp35R9/v0iHqN7E3w8upC/hURCUNhnVca9WmIz52IalDDmx23kDuKAgBSBQL7jgokA
         nTzwbWJfV84v6OiS2jrUfORTvz9QpXKu37a2ZzjKOp17W4fpB8abaIGdV2h5VAteu2rl
         O6jg==
X-Forwarded-Encrypted: i=1; AJvYcCXjVI4RdDoLnNCWaQSc9rfD5YqTsUC0IdjlR29EajMuCOaJMpiNqoe8TzIckpltWopUFst6BukMWv3+qpYY@vger.kernel.org
X-Gm-Message-State: AOJu0YxbqZiujMOhgAA6tWwBb640PVF4v+mPn57qQIlrXCIJL7lMIRHM
	JSW688KviNXAPOwqNnc6Wdexf2ExKmFHso6gLh6tYw1rpSBPqW6bCoy3QJz9bpjZxJfl8Xuwpky
	BsrlaM0W1NonaBwjF2sAz34yfX8FPP45HNWNtoZKflYpYdttlo9S3XvbnVUAF30wlOFhO
X-Gm-Gg: AZuq6aInTnFBuXfnvNH/FEBZ+TMFS9qgRhLugwHfZE2/XUG9qXqv2UQNPgX9Y1WqqGk
	JuK+eGF/l7wIVfHpMb91b1AOjeVH4A88LRz7euu0nO1aDSWNTpgUeEeFQeHVwp6e6oIJmi4d+wF
	XL8UR+uH2UlIO8PvftsKDtXVUavCmrM3tJ+HlQCH3wjHHcJgD5fnHKTPqkSTg7QMpdHFkNqqUHW
	Bh0UzWZPwwm0vxlMfChz1Ugsg7VfdYFrzfV2XIJgUlarYH3fs0zBJPeiIBn0sDyBVIgkAgda4Cz
	m43Cakttg8jnYV+UdNh0rAi3IN3vnIFqw0V7qiK9HTktmI5ceT1WOSCP9NsdzdgKYb6mPhqI7JA
	MEHLnepHnmEa2dC/FxAcCgPrHnHKueoNG7sbGrajjbDD5YhnxZBufcBa/qAS86M6P+jY=
X-Received: by 2002:a05:6214:4789:b0:894:7411:1331 with SMTP id 6a1803df08f44-89522235f56mr57263616d6.8.1770281575468;
        Thu, 05 Feb 2026 00:52:55 -0800 (PST)
X-Received: by 2002:a05:6214:4789:b0:894:7411:1331 with SMTP id 6a1803df08f44-89522235f56mr57263396d6.8.1770281574996;
        Thu, 05 Feb 2026 00:52:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6594a216abasm1828289a12.19.2026.02.05.00.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 00:52:54 -0800 (PST)
Message-ID: <e932e290-23e5-4d9e-bed7-034406b0156f@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 09:52:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco: add dt entry for lpass lpi
 pinctrl
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260204174237.2906-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260204174237.2906-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2MyBTYWx0ZWRfX2hUJu/zqQGhn
 Fa4UG2S45ZwTiUm9YURvg/wtrqzf3Ip2ZGK5wOregB23U0+qBueaEWQiG5gMTXtGAPRmJ6AT9u8
 lHyI+dF1syouRjoXvq71A4m1TwcWQtm0q7N3Vni8P7/9HcrlNtYAoZ+dZCcEWgL64OdcceJz/6I
 D3+5Q2KPNcprMcmfFgu8VNPxLg66TYQOVjv6+SU3vHA5bDgxH0G9md21/v2PahpUjZiYng02J3T
 LYQqvt26uRhbdyU0PbJmhDd7+sQsIAz703bkVkeHwzIsWMUS374Z2fGLnTexFjJSij4B1Tcvf7q
 CSYZuaQNpqI8km2s0rONxogNCFk1Z/F1akbKylN9crS/x+eSjcZ5Uul1LI2amXCFShougJAN+9U
 sinhUeai+CalWOnj1afVEzrDQ81h9/fnZlvkbQNDYyswoxmZ43E+/lh1G0rhWoIAx8iHtkWvZVl
 SgRlhcxTSyggElyRNmA==
X-Proofpoint-GUID: cZHu_Q4rVLKhUxk95LUcI1o5cn8rp-nR
X-Authority-Analysis: v=2.4 cv=d7j4CBjE c=1 sm=1 tr=0 ts=69845a68 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DKcUk80Vj4YOWVkkrRQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: cZHu_Q4rVLKhUxk95LUcI1o5cn8rp-nR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91868-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3B96F0133
X-Rspamd-Action: no action

On 2/4/26 6:42 PM, Srinivas Kandagatla wrote:
> Add LPASS LPI pinctrl node used for setting MI2S and soundwire pin
> configs.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 5d2df4305d1c..e1ea94d2f0f3 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -20,6 +20,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  / {
> @@ -2866,6 +2867,21 @@ q6prmcc: clock-controller {
>  			};
>  		};
>  
> +		lpass_tlmm: pinctrl@3440000 {
> +			compatible = "qcom,qcs8300-lpass-lpi-pinctrl",
> +					"qcom,sm8450-lpass-lpi-pinctrl";
> +			reg = <0x0 0x03440000 0x0 0x20000>,
> +			      <0x0 0x034D0000 0x0 0x10000>;

Please use lowercase hex

Konrad

