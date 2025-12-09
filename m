Return-Path: <linux-arm-msm+bounces-84793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D69CB0F78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 20:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59FC230D6174
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 19:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043D1307AF8;
	Tue,  9 Dec 2025 19:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2as6eIj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VVaPBslz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B2E306D36
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765309948; cv=none; b=eKhiurCsC6DTfpqsxz39KJyPqgMp2x6aISlnhlfMh4jT6rC2Isc7+2YQ4LdDs3Bi19asXl5qqxtd1IGWLXb1ihZeb5dNVtnVTsN/RycWexIdFsMMsqwc30wSYFwr/LADrnmpvXpWKU4LFPDBvh0zrffsxCF6+E/g/yXjmo+g3Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765309948; c=relaxed/simple;
	bh=8gDtjH8CAXjFERT4oqE6LxOPprXGZHnDQXf80+5pkCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EA8cBki5/D7fr4fCCdjlHvh91OsLq9w2K2/uDKyGT4ZFe48IxCkueDr1uGPSRhcvD905HbA0JpVL+zB/DScb9JUMGWrCu2xi7ElVLnvVn4cSaG27SnqQ+IYtgJVACp2cUvk1WWoMSnDZYLQYU+1dEXpT87mWTeYwzb16Vmw5mqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2as6eIj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VVaPBslz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9HpGBW225463
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 19:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=am8yGl2Cdr3Q4f3mL2nUDyaP
	OEzmYIVC9+T1mbbHHcQ=; b=Z2as6eIjPNGMLYgDpx31RhvWf8lZ6y6oXbnQuvCi
	tbCLYLy7RGx1Row/C6Pf0Vr3z9wAfYwDDLz4u6wJ/SYlw0HcLxzvJzhnDBSn3V3K
	2ylSI4Zp3+LEpVU2awoyCYRqvOSGuoiqnPpghUyepJTwgQ+tpiKdYtSfvZwZazy+
	YTfsNU2Rjabl07NriR1KCuVzj5DhEW9m4UDxyVsaQfpu9EvogK8Ifyv5C8YlyQw2
	OJxhW8hYq8blYLU1PIafMGD2Cv1kz1LwB6apK0skBDSRaAruPNDRRgBQr/NdgBYU
	qPwsJ8bbOtMOBQ+DgDKNQ0v7kbC0XUpuTyMElZDi6vZOmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axrhm8bmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 19:52:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee3296e984so110598661cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 11:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765309944; x=1765914744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=am8yGl2Cdr3Q4f3mL2nUDyaPOEzmYIVC9+T1mbbHHcQ=;
        b=VVaPBslzRe6JVOC29Yfn4YWI+kM+SpxRLjWEwA4RG2sQpLI70FvhRSNiICCkafxdhG
         9iPe9bNolOQ7hmYpf+KcZfSgpI+eJGDs9Ab5+6iKioyvMPiOVu7Mu2p2jAKV71P7ScPF
         MINqJDwRsl5eqeYJMWajmS52MFrHrscfs6+shYfq3p2GWHvC99sgOIdL9JsY0OB6+xpX
         TYTuR5NLNr6k8Dsg0VypKLOFBCb2aGcq62o7qpt9FLqYpVapj6VMdB+QnsB3rcufNb/e
         Exz3zHmxmQqvPUoyyXMTuGAkzRrmW30o4dIPLuG4bT9nkYrhLKE/wafYxMlrvPwGPbUu
         +kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765309944; x=1765914744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=am8yGl2Cdr3Q4f3mL2nUDyaPOEzmYIVC9+T1mbbHHcQ=;
        b=D40yI0wfdysVm3DKFKWRerubNcCPWmgANDszmpEv9QvlYcRbkXx6E5W7JmQoAHeuRK
         LOD/oYiHHbZN8Jo/6qCVrxYj6UggWdK3ri4S2rAZKRYdaO4mOdc0cge0m0VcgVp2PwJ2
         bOK8H4Ev5KM8/zXtK0MISAB5OWQzKNewZrN+qPpkS8KT2rx51m6rNGJFUGUKnrsd7D6U
         J6WqC/deutB0DUE2RTd/Z0oYve7TxLdNoC0tOyPv85pBu/J7QZJrAyrwQeSaToMIQ4GP
         23c6Di7cLhBZsZUAHOriugHMGxt3uZ7uWVkO263cjClppDj0RXXOC9prjyv2rXjjMKTZ
         qc+w==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7VtnP/Lx3JquIPWAPeHgqywj+bMo+uzci0nzXmfUddgT4tUYhfDmRbt6IHL4lOrP/TIYGWzXas6Fv7/w@vger.kernel.org
X-Gm-Message-State: AOJu0YyNjO3OahNN6oMcEIw9T71kxZ31bWvwx7t8HemJ1EqLl/wR3DdL
	TVvzvStwmGucP2JKOsPh9j/LY6mIg4v9MPSiOlbYJ/sD/WCwuewadSCPgB1HKxIHBQVb3t2N+8H
	SMtDyxMiVA56UuyyPEevD/R6d3Ycw8up8W/lp2F057k63eid/dL02VxqCsoixqpBAmhTO
X-Gm-Gg: ASbGncuVv+YYIyghLS9/akEoO4RRFf3qzsxM9Gx0byaho0t2u0huLZR7eQBQ+FqUlZt
	zXehxzOJMOIrVG7SM2TpwNHMd3KK4zcmu7KXIBCqzA0QK8R1jwatPt46GeMC0wpdFriGdURcqOm
	oCzaVhn09C8VhJpu895oE50BbnbOqT9Pnd6RA5uLC4ApYMdTkgVxvBCXH4L/BGDa9OOs2XdVZ79
	KlCGIEgjcxva4mMNpPogxt/6X6bhw9rB65nwULzuRCyojBUQZ/qUsB/qHfJI6EcSkxBxLAWskW7
	2231tKgKb977hIbiMO7vx1j3uw991GkphRLxJ6QpoKR8CcWoLWS2LXzBhcLQcKTr4YU2MpDkDKE
	dP/cwq+aLW6TaIESkvrQm/pdSzAuOnFYUz6J+AdZ8BZYY2n1F9Ce0YTvJhb4NQFW7n/Y0x6Nl5J
	Jz/KSdR4KTdCiqBG6A32qVqfg=
X-Received: by 2002:ac8:7f8f:0:b0:4ee:42e5:f5ae with SMTP id d75a77b69052e-4f03fdfe609mr177180161cf.25.1765309944291;
        Tue, 09 Dec 2025 11:52:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtLwoELzFNN5fXJFR4PgH324tdBP86AvmtFkrKxvIX9gnUYNAoeIhzFFU9OjFOmYDS8wOrTA==
X-Received: by 2002:ac8:7f8f:0:b0:4ee:42e5:f5ae with SMTP id d75a77b69052e-4f03fdfe609mr177179971cf.25.1765309943789;
        Tue, 09 Dec 2025 11:52:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b247f3sm5578951e87.39.2025.12.09.11.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 11:52:23 -0800 (PST)
Date: Tue, 9 Dec 2025 21:52:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/8] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <zjimpbzncmjfcaoiepbkwcg3v3soka3mhudee447h5hseuiyci@kfexqup2aly2>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
 <20251208-ipq5018-wifi-v6-1-d0ce2facaa5f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-ipq5018-wifi-v6-1-d0ce2facaa5f@outlook.com>
X-Authority-Analysis: v=2.4 cv=d7X4CBjE c=1 sm=1 tr=0 ts=69387df9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=M7v-gDGZAg3xi0XEQhcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE1MSBTYWx0ZWRfXwSzTmqYjNNvL
 /kzxcF36yapU6HHsVkEZXMbdVIR+leX8GVTBss1EywH+le5hqI0ACaO/cJ3kReN/8I/GxGYUxZF
 S5NopjBEEYyOfoG3GwFlqyeR2/DU7zQyCh6RHNyifZGLx9wQ7HENsZXVMKDL386Y5fpnQXngytB
 S4nG5FqkJyYlUoCJJqIJMcrv8KtV+RiuF6aiBOqrGS+WkhSppikeVK09Alcm1DmQIK5o8RM3AVI
 ujbxg+fiN7bT0STTCMWiHRucXOxaAebPpATRbqxjYqJ9wwD3ygvLPbB9jhWeLHNQma3XEAZ30oA
 Yz+jSnLZ+vNZDOMCTuCCnP34fKKsovZ7yFFdn6D3AXyLyt5/HbeC+LG7xgpbjQZfpAm9cOX8FVb
 3AFhZOCsX5JVd+0KIDFGa9CalRvxOg==
X-Proofpoint-GUID: Cik9Uqa3vEDHFsUwdKGvi0QsUhAsdr3J
X-Proofpoint-ORIG-GUID: Cik9Uqa3vEDHFsUwdKGvi0QsUhAsdr3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090151

On Mon, Dec 08, 2025 at 04:25:33PM +0400, George Moussalem via B4 Relay wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> IPQ5332 security software running under trustzone requires metadata size.
> With new command support added in TrustZone that includes a size parameter,
> pass metadata size as well.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
>  drivers/firmware/qcom/qcom_scm.h |  1 +
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 1a6f85e463e06a12814614cea20719c90a371b69..c970157f75b51027fb73664a58c38550344ab963 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -583,9 +583,6 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  	int ret;
>  	struct qcom_scm_desc desc = {
>  		.svc = QCOM_SCM_SVC_PIL,
> -		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> -		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> -		.args[0] = peripheral,
>  		.owner = ARM_SMCCC_OWNER_SIP,
>  	};
>  	struct qcom_scm_res res;
> @@ -617,7 +614,19 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  	if (ret)
>  		goto disable_clk;
>  
> -	desc.args[1] = mdata_phys;
> +	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
> +		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
> +		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
> +		desc.args[0] = peripheral;
> +		desc.args[1] = mdata_phys;
> +		desc.args[2] = size;
> +	} else {
> +		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE;
> +		desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
> +		desc.args[0] = peripheral;
> +		desc.args[1] = mdata_phys;
> +	}
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  	qcom_scm_bw_disable();
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index a56c8212cc0c41021e5a067d52b7d5dcc49107ea..b8e5b4f2498e75c9eca1a0c0032254b7126b9ed3 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -100,6 +100,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  
>  #define QCOM_SCM_SVC_PIL		0x02
>  #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
> +#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a

Please keep these defines sorted (QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 should
come after QCOM_SCM_PIL_PAS_MSS_RESET).

>  #define QCOM_SCM_PIL_PAS_MEM_SETUP	0x02
>  #define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x05
>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
> 
> -- 
> 2.52.0
> 
> 

-- 
With best wishes
Dmitry

