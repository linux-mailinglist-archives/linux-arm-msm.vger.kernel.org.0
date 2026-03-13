Return-Path: <linux-arm-msm+bounces-97477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHMqBNkEtGnjfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:36:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A14492831D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1494930078BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C273B396B67;
	Fri, 13 Mar 2026 12:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjr/0Kon";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZ/av5Mn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E97039478D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405393; cv=none; b=LQg5ZhH87tmcQ4qpUr3YTDGcv5+OGhYKD/gdBvfZtBazskC7l/UbLYIeprYCxAirGH+TyNC0fnVCo6tDmx9gcrnJqFOOMy8NNLif/erxd2+r/gjCtSjnbazL95VxyfBsKi8mkyvE2bf3vTjBb2eBuzKG0qlg72DzIa9TmjCoKmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405393; c=relaxed/simple;
	bh=Uz8iVbvl0it6RR2xbtpvIT0/obkY67Dsb9uRtPbs0/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U4RHL6eWccE6Ud8tqx0SdCXR0T8BHGldlAGQ4yAEvptR3BJ//t2SLhu2ePgfsIrgjiZmCnBR32JvG2StMuyBkiqjoYOlqHpFt9BZ0ZRSCNryUZyu9drAjY8wrJu92/iUqIr3fRcSZZDtZxcYeBVAXaD2sLBW9NYTpvVYwPc0+ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjr/0Kon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZ/av5Mn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iVv52262758
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/3y0RmbxVtUwFPf7puCD9RfjHJ9oaX5euEbJAp5qxM=; b=bjr/0Konlb58+A66
	SY4w3g1X1s8ykFazJHiRf5Vce29A8UIdjXtef+thhGWmDg0OCjSoZvTxYAYHYj6Y
	kwcZOD4OleyFtxXGf7QNOimEEmcgjDamGUDAic43zN3CSPi/XChErZrv9cZn8LCo
	P4IPfWI3W5Ldg31FLqRvV9lANbXTqUeiH4Yb0NdJGyxxSXXZ9c2CudJMi3nFrRor
	5V+rvvILwT4yeZASzWr6AeDaPJkM9/s7XJdGasOdMEk265wAJJJv1BqcvOgiejDv
	4FC7Ru69rirPUwEs1u0TbyOjSSgZchZnKWrUvmMLK3HCJyvDplmITBjQbQ8TwMwT
	LWETSQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4ryy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:36:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954b9b5da7so15022756d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405387; x=1774010187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/3y0RmbxVtUwFPf7puCD9RfjHJ9oaX5euEbJAp5qxM=;
        b=dZ/av5Mnu54f2E3/dG4caJhMK42LsChcghyUFexT9hysabjy0YXnY+mQ7KLZwZ8drq
         a51Y36WOLr6K9s1Q4m/+XbufmLrKB6HpAm2qSe1PBV5vb0GIkXLkbECAwn8H/ThGkwiS
         pZ7lhvSreXp57NOq7we+5TBnlDPyRCshyL+FKCzaX4RnG4PJonLob2dgaYJ3LJp4M8I3
         lMj9JilS9onMWcQe0AXOWdW7ILe7muIIAiGwm7kQFJ4K8hKQ05RHtXdl8vHC+eW/gYdK
         LoIoqKFm8gS9i4l1+vCWX+t8E5D0RXYn3zUwLkc+8dwuTdZ2DrozZEYhum2omfATWYHI
         0B5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405387; x=1774010187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/3y0RmbxVtUwFPf7puCD9RfjHJ9oaX5euEbJAp5qxM=;
        b=p55/9M36ycGuuIdyb2wl3Nf2YMKFFmda7DQ7vRUC6UvAkakjusaPvzw8emzX6xVFmb
         8D73rHq14u9Ss8sdyhcULrYrPIcgW7yKcxkxUndVeKYn0cfKiRjfHj2JrLM1xYIN6Oye
         GRq8TJqm8uIHS5NtyFUd5eYVjRBjPmIBcvpHbteQAP6wuJPUFXN+0heeRL4j36tqol2z
         4nMHcB73ViF383/9Gi4cFLyX3ACbaRFhu5+T773byqoynEOHAubfML2sC8AwG9sVcTC4
         oGYiOutO1YgbnKixJEyopj4MOn+7UICxB/Uczfy2FeQ1Rw863UvumZOc82JrdySTeV97
         x81w==
X-Gm-Message-State: AOJu0YxNaaOq9wM9+Yx2/Uf6rG1Lb7C9RqTUa81WvI/E8Z42L1jJ0N5R
	GMgBcCTNTNML7N997Baz3CHVI7pcT1AJ9WA8C/8Ps6J68spSF125nnTxJS5p1vWk3it78KkLx1L
	8W2NAQZa7D7OJS3e/sq+xwQaBhK3XYO43jPKXoMbxrQkeYfJ7CbFAM9hCyqKqtBryX1yc
X-Gm-Gg: ATEYQzxZmpQjkmHGQAxW4omnZ7fg2Pqh66Hko4ZqPEWYs9DkmD54hzttZ+rYNVMkIUJ
	NVXJ4rJCfAZhnNr4AJLu3vKq2F2ky0HulYeaXKkPictspvgBWoJUwpThDvloESOLTAND9vBSml5
	ufTXTxGbTK3oSJ48emH1M9Imld+Laval8DkjaItUUiialAUdyuI3r0337YnMasWLADfQLh/ICe4
	UzrxZvV1bMibRmzQm6vGrelBPSCm1DK1fIR/bWojKNMY+J2HmeMC3XyK+kFoV8XWJSs0NOAsRQq
	o6+3z1a19DdXnz/wMegTQUp7cryo5Y9GvafF7kr87DtgeGi4EuFjPcSog/imUecFquu/AAwCMGL
	vrKxvDaHGgXefPDi+kz4mEuQg5qj/mBwtrnTU34jIrcqCwtyeMM6q267ID40d9cUOfZ8+V+a//M
	OBvCI=
X-Received: by 2002:a05:6214:3481:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89a82065cf6mr31259316d6.7.1773405386602;
        Fri, 13 Mar 2026 05:36:26 -0700 (PDT)
X-Received: by 2002:a05:6214:3481:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89a82065cf6mr31259086d6.7.1773405386181;
        Fri, 13 Mar 2026 05:36:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cefc590sm42822566b.48.2026.03.13.05.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:36:25 -0700 (PDT)
Message-ID: <10235bd5-5aff-4705-b00e-5197701e2a7e@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:36:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Introduce
 framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
 <20260311-beryllium-fb-v1-1-408a580d125e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-beryllium-fb-v1-1-408a580d125e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KBH_jch5SFhHZt1t15P_bxgj3KAi0TKO
X-Proofpoint-GUID: KBH_jch5SFhHZt1t15P_bxgj3KAi0TKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5OSBTYWx0ZWRfXw2O43eBArksK
 I59/27h54q00yj2/W9lTuBNiQfvT+9N2t4CygCdnfoFOJDhbV4hv35/TeTnZQBq+ya1JpsSpNWq
 KQZKFYvqOef88ytN6ZM/Ae+Uk1cdb/DsX1L7vyDclsdWh7UU8oTa8lEmMbvVoEx2Sm42oF8igCi
 XI3gqJZnwflEiQedDCvIymhYDchQkdmxJXjUwJFmyJPSSiq6i5TxgkUytFsLEeVnoYsasAzMVe2
 O/kxqAfzaQ0DbvfHY76560kE0sTib6xf04JBrTXqaMrmcXBzugwToaHisQq9PLtpTOYLXCZzXwE
 vH3muPe/MCGJ7mCufVDrtA8vSYz6/R2mCpFXQEvid+axSuZYIVd3bIrgVyfQDZ3lqZg5qlctkg9
 P1FfNUCZ9mPOncDYlEHlX4GXMNsb7735svbIXhK5920rLKbtnJWVGB6StfCxEq0+xWUD58Um66T
 q4Ika1h3y3oRb2Qi87Q==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b404cb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=sfOm8-O8AAAA:8 a=o8upt4Ul7olqoy0RcUgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-97477-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,protonmail.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A14492831D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 7:44 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 01b570d0880d6..bd6d7a3cfc0ac 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -39,6 +39,22 @@ aliases {
>  		serial1 = &uart6;
>  	};
>  
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer: framebuffer@9d400000 {

This node has no 'reg' property, so it shouldn't have a unit address
(after '@') either

Konrad

