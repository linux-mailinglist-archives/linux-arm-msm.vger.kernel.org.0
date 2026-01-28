Return-Path: <linux-arm-msm+bounces-90950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP4MGRjpeWkF1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:46:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6779FA65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13C8F300CFCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7639D33123D;
	Wed, 28 Jan 2026 10:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOF5g3BE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FF7Fy8MR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E09F285CAD
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769597204; cv=none; b=juaGo+YtW5iiZJdM/tG8R5pjXg+tqwtSG1pmMu4e4ymXfE8dyVzcfIhCt2W0d+rSVUZqQNlnbqgI0iQhmY4B2Btiu/X6rid1yEc2y4SjGCIkg5Uws0omhKfRcASIUWhZHj0AcvBK2g+mlOWUNmU0jHPu6UfrvV7t18g4u1utddM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769597204; c=relaxed/simple;
	bh=GJGh78OVgX0ts1MRlePfIfYN27JNf8/NUs11QvP8vmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aK4D0HI4EHadwDn582KxWtCY0ADdGClbUPVVo3CL34hp18KMyM4LY/AIiIjhA1NL4D8Cc4SdsPd+Y0lf3LNfhLKYE1hmTikTyzVIOl1douIfUBBq/0dbr+IcJN5/zaJLnl4M/vyffUuJroUQelJWDLRrNqjSQLRkKJNB3XQxVOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOF5g3BE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FF7Fy8MR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92ci2041996
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwa6MspgeDaMnEjEP07Ff+4UbcbAFRdcCQaVvZ4XcUE=; b=gOF5g3BEg5WCkXcu
	yLt1DdgWflsPzsG8EtgP8KVJsAmq1PpDdc8MM2affS5C2+HhhsiKuvo3SG5nDmfE
	yGjYipMwLOoc8TnISWYw+BC+HCxTltcbQlKZltRqaMqH6g1C4u8vLTjhyfQGE0UW
	HwxVgdzAlwPkUTf94vmVaLOj2jXhR3faVdSOLmOUFjTiWqIl0bmwoz8eAxKbEB6W
	Szp6WB5nclURYHco0p4eoYOLtOmjTYIpFO1ZwiGiA9Hj15t40vN+Ozb8Zfewhaz2
	BKgwFP8OTqjYPX7CNg96c2satfQIuh5+1LeYFOlvBVFDB3s+6KqPW98SHJTZbO5i
	uELdTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355tq1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:46:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6de73fab8so210910785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769597200; x=1770202000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwa6MspgeDaMnEjEP07Ff+4UbcbAFRdcCQaVvZ4XcUE=;
        b=FF7Fy8MRAQK06P5Two1UvhISCfdVz7wQANqB3w2EjBQ8/jsKRZJJRrsVfWEFiWotEW
         zbWRdxSMXYoIaoZtItRdzCck5KeSCTAzq2+9GP1sQBOtMQZ7UnRz5tCSPK7L8z4A/Lme
         ypx8CP0ffIZqSkJ4Snq14azDlskw2YpAXaLug+EwPynjwKtUOrynbtr2lF3CDJDdt4YI
         kTG13KpuIUmSG3H4C+VmxTOqprC5RKvtUB4nP0FeJvGre3oBbllZamaOGHBIa9LGGeyM
         1HD8muL6ll/Ym8mga5G/1wKuXhZQBGg4KVMl67x16YYGgMmcBvWl7VfCMkGFwLoUI8z8
         lQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769597200; x=1770202000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwa6MspgeDaMnEjEP07Ff+4UbcbAFRdcCQaVvZ4XcUE=;
        b=l/E8HodvJ3pfxsP4syrVxivYw3/n0TrMXZ1JOl0qqmM5tqjhOUIHDRJZ2XPJKZE+z+
         iMQQAuF6bpbPIwRYhfjjxS3VB8kIj/WJFLcFgiksLf6rVdXtgrX15sRa3We1YnNc8y+S
         TNODFgBwODdZyUvNkxHariADfzvxq9x6yCPF91bkdP3I9PkVAejMVgktZrhAd6S1qCzW
         VYeNK43000LdyS6Ez6ARoKPn8FWvM+t+IObV4wFY/SRQrQ6AIJoNv82ffD4QjGdtbe7f
         zAg36aIV61aKfbhoxbavy6MOFGchTfdE+xp3BzwaXMKdInOU4annKL5moeW62SptINQX
         U5HQ==
X-Gm-Message-State: AOJu0YxmsycsUmjpLYAc6atxt7lkaD7YZxOZEH1GkJWeCeAM3CGxs46k
	ygX6WbCwSIDHxp+VriUavLpCun4e4W1jc+agB2XjccUqOzOwFt0DzaxU7dys+v+4TRR0ugVXECm
	KwoQqwbLAFilF7qcvboD8Hkk6bOB76e4mugVajEUD7pkJ0vLB+zCnxpEVNC3X40Bjdjov
X-Gm-Gg: AZuq6aIUPrSzjN6nhHx8+iFuDNZ8olvV6GBlRy25QHyx+3AJ4T5N0tzg5slzNJcUfTB
	iJkywhyQonjVBn1XxY8NpiRvLFuwCm98JNKo6IHvkcoHhFQstR/Ksv6qfDxgbB3nOep79rzFuSw
	WWjwwdVX4SBEOf4V2WwFG0bmc2NUYnUWOZvWTzRXvW9I8yVf909KYpsPvKHaJruN8FxLO4K4Yg/
	GKMoTN9ec1VPpmc53t1rrTrW3QKVjpPDTT+qkyhj73qHoEmzq5qaGe7KrdPnnZKWqNTiuIIueyO
	OCR6VwLYpk74lCUvhENp1F5lXhAjN+ABqQ+SwoOdIs0QdBvoUwXeNmXbdVycUopOFKm/NJM0Zro
	4VRSuHt17hWvGdKMdG/Cua1ajd38xTQaJdKjQYckSl6JtZuVDZQO0+ufz2WomjzP37ZU=
X-Received: by 2002:a05:620a:191f:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c714b9360fmr114711585a.2.1769597199843;
        Wed, 28 Jan 2026 02:46:39 -0800 (PST)
X-Received: by 2002:a05:620a:191f:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c714b9360fmr114710285a.2.1769597199457;
        Wed, 28 Jan 2026 02:46:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef86df9sm114178366b.10.2026.01.28.02.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:46:38 -0800 (PST)
Message-ID: <366fe074-3355-4c9b-b60f-4f7de0ba6a0f@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:46:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8650: add CPU cache size
 properties
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260128-topic-sm8650-upstream-cpu-props-v1-0-9fbb5efe7f07@linaro.org>
 <20260128-topic-sm8650-upstream-cpu-props-v1-2-9fbb5efe7f07@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-topic-sm8650-upstream-cpu-props-v1-2-9fbb5efe7f07@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=6979e910 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=eHTvguOgXxrd6O_h2noA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YtAiZp36aqDr7Lths61kdBDZSxWq6J65
X-Proofpoint-GUID: YtAiZp36aqDr7Lths61kdBDZSxWq6J65
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NyBTYWx0ZWRfX6cXuZ0R4wdPK
 Zk8N2WY82NRJ55gAHNUs4I3tVyU5xirrPlaiWR8DMQtAi66zizk/Gx92LEtrkkpkf8mZVfMygE8
 ZfFuWgnE8HbWPwqcenx0zbSBSdKyZLRxvklepEJRMZGtKeGGoyfQfsOMEpnhLVfe1FIi8d6rgAi
 cOFrsUzgqJzfg3BiZLiVks1GjMNxcBGmPivkKC6imjGROQQ/fFBk56TiSmTICyVsqqOxd6cOj8y
 Oe1uIIMi1R7la8V0SUEeziytzzCeAsOYt6A/jREkt36M4vjl8kN+/i1fm3nb/QhXTg6POl/Hbgm
 ECSNQxJ0aQfzpEj4BlGndN6b9oEKTDl0DoTvDkUBnliOJl/DyjOjBTRiWWKwhcgR1gu8ZKDD61S
 BraVFFH0CnlZjyPWsKAmTWKbbANcxtafdAeQrq9ok8WKA7ngOv5CYp8StNm4lEEAlOHkgOOa2tf
 IXDQhquzAN8z6W1aDrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90950-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD6779FA65
X-Rspamd-Action: no action

On 1/28/26 11:33 AM, Neil Armstrong wrote:
> Add the L1 cache size and its line size (cache-size and
> cache-line-size) with the corresponding L1-I cache and L1-D cache.
> 
> L1 cache is unified, but clidr_el1 register (get_cache_type) tells that
> L1 cache is separated (CACHE_TYPE_SEPARATE), add i-cache-line-size and
> d-cache-line-size and cache-line-size of L3 cache is specified.
> 
> All cache line sizes were confirmed by checking ccsidr_el1.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 56 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 8671c25dd68f..f8563ec79dc6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -75,6 +75,11 @@ cpu0: cpu@0 {
>  			compatible = "arm,cortex-a520";
>  			reg = <0 0>;
>  
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +
>  			clocks = <&cpufreq_hw 0>;
>  
>  			power-domains = <&cpu_pd0>;
> @@ -103,11 +108,15 @@ l2_0: l2-cache {
>  				cache-level = <2>;
>  				cache-unified;
>  				next-level-cache = <&l3_0>;
> +				cache-size = <262144>;

This should be 512 kiB, shared for c0/1, according to a block
diagram

Everything else lgtm, although I can't find a source for the
cache*line* sizes

Konrad

