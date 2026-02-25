Return-Path: <linux-arm-msm+bounces-94128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNwQLqoEn2mZYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:18:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D678519899D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C533B3006088
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E8A3B8BB0;
	Wed, 25 Feb 2026 14:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2tAGqs6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lw664IJY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16042DF132
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772029093; cv=none; b=j/47WH2Ryug2xXURhIPo28K3dFjsusWqUa4WgfJvxL3ioBDVAOBXMJS5vVN+3EQKh5/2vsFDJD42opF/4SCkNc7REupWyN1vloch93Mtfxpmz6O8Hu8krJI0Xxu2Yihcz4DZtkgTPBKQ+ZHPZlyAJyfrt1jmaDiY8LyqKBOsMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772029093; c=relaxed/simple;
	bh=0k5IbKPUvTucfoufMe3QMrikix4RZgOOY4zoAkCpiN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dY7WQ5j+RClksDhd9/izzOoOfXtFDPQpZw1fx8t2zOU3/pIXjIduSaZrfKIU75p0WOWj6ns/qi07AbwR+/9uCJYQmAwmhkm0HORaxwqDQGAJwKvtVqBbPUvV1uOK2C/rDDh8q8vpi5Xws9BLAqJcVs4e+NHf9cIe/lbrgHVlfKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2tAGqs6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lw664IJY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SjNh1088241
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COdIxRb6Ec4S2ChFH6Dz+WydQSha7qVD/tbciGUA8t4=; b=N2tAGqs6lA3iXS+/
	JVDm06h4R5gYjhKqnXoYr2xsCLs/0FpSSnJj6LpHyCoMF1gRwYFGL06Vdk5OBFKo
	OaX4l3bKckIC6UjdN/L4HxsDcvT5urDn/43kbBKBsvPXzyMf1tWx2VW/rMvlE6YI
	IE9OA+6JoUICZ2uBgY68zXtwc9MxqHdpdLfQXZ2L9APcBJ7WgiMpAlBgkjP5JVE/
	l/eBVJ12lQyvue9R5FT2SNPnm4YsAYMkucSAiWVnTDAzojChFsgIk0aHHdc3eDDG
	Q/9vCjmCEPYCCznSYViF4gNWfiSuGnzCcwbK5SP1bvCGl3R+Efb/kaD4CY3ETpp/
	9YcPxQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh473736-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:18:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899c35447f9so522486d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772029091; x=1772633891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=COdIxRb6Ec4S2ChFH6Dz+WydQSha7qVD/tbciGUA8t4=;
        b=Lw664IJYfDRJoZNGlzrfTEVlalbWWo+g+GQjNR+DgaIf0CRxwCQ1RDeicnb1G2V4HV
         MEr8bDBAafFiQAi+zoLaZa2qFBKujO+v15DbDYilPfCNLT/6/CN9offoxsLAwVrCXDiS
         C/g7vEHrEDqvqr7gsjKUV1boEiZ0L5i5/ENWDTx9qZjjylC4bnZ7rOcWNvXBHv4SLIug
         P5wiNtCH9mjI71VSj9pRyeOtjINoWcu6V3sQSQ9kjsblD2ts7rT6dOsN7AqCPbesb3Cv
         +OAES/vlAntO5/TvB/ymBL6evN6ELtQTZFMlGj18U/fAetD6PopCdQq7dBJ//fHSzGuw
         MnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772029091; x=1772633891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COdIxRb6Ec4S2ChFH6Dz+WydQSha7qVD/tbciGUA8t4=;
        b=pOCxfUG7HtxQiRRQFaV5W5F1WZ7Bq4WoaLp+DCVddUDzlZ9wccy+yRoKgclmwlG9dy
         THNKc4oKFY+mjxQKfHRjTePdUy75bqZAZXfieaZhwo4LEZguCSXO0Vv7lqasybhlQf/x
         GB+lxjK/U2SPhLgU04JWjf5zdnLFLAgFAs2/YpfkfL3/yEwHdhR5Z2JxsPXeJgmf4WmX
         h75vp8Qi/QdTPshToN9uj6tDc3vqfTnukhJGjmNEqMMufiBcDcYgzT2daqHFFU3Vb1WL
         03nHWHNwpPOOrDtbOmWsbsbiGLatB1nCevytTNy8thSCRcLHM9eW7NIlPJlI5HxMF8el
         nPJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyfZXiekbEWSTpj72Pye81d5eRRvIM78NXTNhZz98Nyo51Pr1lELOSNv2HPtaATpuF3VVjj7QWq8Dzjqk7@vger.kernel.org
X-Gm-Message-State: AOJu0YyAPfJU+SrWR9Lhpc5yS8SzqBsW97wSTjnJfJ8+lAmPkOqNfVvi
	+Zsj5exq14E4E7UGfxAVFeEox2Rh57J0zXFR+LWJhFPvfd+ZgJ6DcXOUv92jZHStYuf/RADY2wq
	MW5kjnq77QG7YE83QD3X7bh/6zY1V1woGLbl7etEIsKC9jGDqo/hckxIhSylik+bw8P6Z
X-Gm-Gg: ATEYQzwMgwc1cxifiW2cR2/1SV81mSLwc8sKHb6KuXAB7hhtFRXrAeTmu6UiK57Lheq
	snN5qG+C2buJuuPOn9Vt8S/d4OmcOD/bvijxaYNFdgk4AcvG5+jPyXb5o3OFmFlFnvEydSI37Ou
	f4Bcs18tCz6bNGOl2lwN8eZtvf1/yK8wfrmftfYsL2RiqpV7rDzAodhCe8Kclt7V86Dq5JevK4y
	osMQt7OLs9NXXa099GXjUs8FxMDGloM6P7E37Jz8lNqrUSkvNuOKh2owDg6Cb2+Q2r9rbXMkb1S
	iGQoUcdtKDriju3E36vAbL7ixBICkrq7iLseBeXjeo2Un+/j7dLYyTSiN0sFllWdX64+fowwiax
	P6DK3uR14zfib46dgPan/KzluWe2zzd/ceo+5mUSnKQQHQxzqBZAm3kEvxYXsZKEzKK9fduabdh
	2Z5to=
X-Received: by 2002:a05:620a:1904:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb8c94d98cmr1538132385a.0.1772029090901;
        Wed, 25 Feb 2026 06:18:10 -0800 (PST)
X-Received: by 2002:a05:620a:1904:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb8c94d98cmr1538127885a.0.1772029090415;
        Wed, 25 Feb 2026 06:18:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e4bf43sm528962766b.42.2026.02.25.06.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:18:09 -0800 (PST)
Message-ID: <d2e292e3-de8a-414a-9f37-036b65862154@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 15:18:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8750: Add camera clock controller
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260225-sm8750_camcc_dt-v3-1-a19d3173a160@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-sm8750_camcc_dt-v3-1-a19d3173a160@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qcCPfIIQ8XRfLpekp82s2LtMx3mIueqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNiBTYWx0ZWRfX0ma1nZ1u2cBP
 kfJW51x7IYOF0E8UfmfxYPFV+4pCmI0ZYgMXv/JAq1meEdex2S+QyLVeNg1E0ux+8F0vsjO2EAA
 mt3Agjn79tx9+bBxL4CqfSyaNqPKC8n4JbOFAydf0SFwexI/Ii+umJJ6Qs5EOFv0mKNP6W3fapQ
 IAAymjHn1HqPpDvmhT01QuCqoEV/WUOHJxEDqx/YUQ8TfpwbPIrkaEvvEhneglFOFqvQexEaFs0
 sV75C+iKoN5E4apvtwWajarWipXky33OP93B75DinIwtY11K+Esui60D1CHJAIwP2U1KLDGDbyB
 dGhPdCvHUogsXVrxSgC/hPWmIIcJQbXppR8OjQTw4cN5P956mCFha18wDlrHeAR1CYCF4Tnu1ap
 /bljt4U7Uj/6mgcMg+5VGodVtY+XYdecWOMK7hKGYX7xJil10E5lZDo9sJr/MEOG800JVKD45qn
 jpsGH/CCfhyj8aPgZwg==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699f04a3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZF7kzkCWYRGncH6IDUMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: qcCPfIIQ8XRfLpekp82s2LtMx3mIueqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94128-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.26.219.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D678519899D
X-Rspamd-Action: no action

On 2/25/26 11:12 AM, Taniya Das wrote:
> The camera clock controller is split into cambistmclk and camcc. The
> cambist clock controller handles the mclks and the rest of the clocks of
> camera are part of the camcc clock controller.
> Add the camcc clock controller device node for SM8750 SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +		cambistmclkcc: clock-controller@1760000 {
> +		       compatible = "qcom,sm8750-cambistmclkcc";
> +		       reg = <0x0 0x1760000 0x0 0x6000>;
> +		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK> ,

Stray space before the comma

> +				<&bi_tcxo_div2>,
> +				<&bi_tcxo_ao_div2>,
> +				<&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,

I find it difficult to believe, but the computer tells me CAM_BIST_MCLK_CC
is powered from *CX*, notably *not MMCX*, could you please double-check that
as well?

FWIW, the other (MXA) rail seems to be OK

Konrad

