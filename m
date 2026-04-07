Return-Path: <linux-arm-msm+bounces-102144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELA/Cvbo1GmeygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:22:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C272B3ADA0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73E403009B35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E67E3AA4EE;
	Tue,  7 Apr 2026 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFTP6nhH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/miWQ+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C123563DD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560947; cv=none; b=tdxZ1juLH8eO67IKKH2Eif5Nic9sdYoyrTxwxsYwqzHVJI+Er6Jdx5FngSgkjF0e2eu8H1SG1d1wgaOoWGhexjOEVjFk98wekfO/Ug9w4mEFwastVpOZWSbNtzHx96ntQECrSw52AY+5+l8eAWdRsHPkCDXdwlmeenmbt6VpAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560947; c=relaxed/simple;
	bh=P3dqmbnqkrWDfCd9axlAHyWR+D1HwXn3BqOK4drEnMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+Kw23ZCmkR0G+d72C80tQccCg4txrQKVPlZLzNBb+Dk+1tSkB/WAPcIEVKsSqivR3W7VK2V9u/SJTzn3LLTpADqyObRokbNu4+BuJeBc8rVsmZ1PRq3ncP3OG6QnP95lnnCl1Zxhb2Ukp0yj0XsPhR+ZAw5nNKQz414Gy5Fgtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFTP6nhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/miWQ+z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376ZIaI1584837
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3hxDXVoRGIe6aQ56fewcQB5Hz56pBM+IXbsRG+Hw0M=; b=bFTP6nhHHRb6Cqam
	1zIzYd2HrVw4CYkqHpD0Wb5Gai1aOCWB5Eg6gggzVnr+uaTM5uVH6y2Kr8daYoJA
	YxU+niR/gMZkoGiy9L5jvjZwsIlyWGLWFafyRLjtvkFULhUzy6Y1agq9NBMYc8VG
	S8LVUfPld7/1VoyZNDVRvsw0TprSZaabsmCu7VHdsitLomWvoLFasQZA4vlXrZqR
	67wTQk+25OoviwVBPchBM3+SMIIrQfPuZrIvSDYfYH/YUy3PTbmaoxz79yxVm55W
	Fi8yEl09g+UNE8OKgpT6xvrLKBqDoCOO3gwj7H6cXTKjEEgabiDA7vfmnI3N7F55
	YLyZfg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9tfct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:22:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a016b99579so21835526d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775560944; x=1776165744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3hxDXVoRGIe6aQ56fewcQB5Hz56pBM+IXbsRG+Hw0M=;
        b=H/miWQ+zoriPrKK7/cJLq5A1YQngVETGEKWm9uOzbEh4ESn+iuFMxXo2y+ql9ZbUeG
         2yHPqQvjWG3B2wGmBsX5delt74jaO2qkra25F0ZORDhtQQKhwgBMoxUZ7OHuCiYj8n3/
         N72xAS1aWMjOgk8jtWiEAf3ggVAq361xndzJ2BridXDBJx1uEmT9ORSkIRd57nVaEBqo
         vqNC5ysGn99kzlwnkAF6aAeZNME8yYqsdy+N1nNJHtFuIl2l/NlzXgLhlIoShCQYs1Zp
         MkTPPl+kdrl7Wbrkrn7x8Ud2zcpxhrU2yGQJI1U+h7KSxizf8OMr+o+Ujw+vdFxP6Wa2
         XO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560944; x=1776165744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3hxDXVoRGIe6aQ56fewcQB5Hz56pBM+IXbsRG+Hw0M=;
        b=hF6ZwLml12PSjFyMreZOrz2OWka8zRT+brKswikGqa6TjPyNqxenQSh6EYiJMaUaTD
         O1dXWfVSd0MocLiUI1OsvULyyhisEozlOSrQYFoPOoUimvqAz9TaIjVO92+ecYttmCuv
         BkVrQ/qJ3x//N9TR6bH9s6EcHqHZQ0cpIv4YfPGQyEYdrRGiRJVu6HtwR4yDUyNDVDKC
         6tAfwIP5aGRAVGl7OI8Mz0T25T5Jq5hqs2eTXTaAAuLb/Om/8ILlfa0OZL2mSVtB3h70
         mHC2eUUiJos/dJT61NQYUHw0Cp5VKSQ11C3R9EnYJRNM3KnWoCDaiU8I2L8Kzw9WCfMO
         mSjA==
X-Gm-Message-State: AOJu0YyG5i9F49sIYl7OydEX55AULBrUb8JoTdGEuLQh7Yh5Qlvxvn4O
	lXK60YylOPfhb2G5d1zlT8nUOjiLafNCx+YJI6hIDLhb7bXQ669hD0QOfQtFJ3HjdTCnp9p+NGg
	0H8p7yv03iqOK0jnQ4NZxaRVlS9P6R8urp3kBVcf7I9KQOjfBBst2I+IEpN/pF9imI7SW
X-Gm-Gg: AeBDietqafAdTVR5msqE4yVss98Y74I0j98wBnYOemDTC7lD/fRzpOvv+PPqBiGb/ag
	9dS5GOUBhjkVarLrkHvXXZ8YoXnxQ/wH8ryLKEXvUkt/XqOXGrOspkWA5CU4GLHwr2q/Rv30qkl
	1dncWBKQhxLJRg0Ydrz2aX6rS/A88qWZc0SuhADSPlZ5OE1g1woWqDghTGuhklhUWVo8D1QNqIO
	K44+5VzPj8OMffyyQecxn2IN/LyaK91dtbMnp30h6sIDwoXobw8+dU3jpzcluJ1ilq5vO8Pjk8G
	fdSHbLGMZLnoSjLB7SQvkpzjpkHEHMtyfi/dKD0suvWnRae3XaE2eFtgd3GpQcSZ7NvPuAg9e/+
	N0VhAozTOOmMH20ZmXy/XYF0RKM5UozEv6VOaFEfmFstChUO4HHTu5twgMm5PQrDK7PdLKZ94PA
	JesD4=
X-Received: by 2002:a05:6214:2a8c:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8a7058792f9mr200455026d6.8.1775560944408;
        Tue, 07 Apr 2026 04:22:24 -0700 (PDT)
X-Received: by 2002:a05:6214:2a8c:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8a7058792f9mr200454766d6.8.1775560943968;
        Tue, 07 Apr 2026 04:22:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm544544166b.25.2026.04.07.04.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:22:23 -0700 (PDT)
Message-ID: <66e25445-e7f8-405e-b208-e69b6b401f90@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:22:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403120753.105869-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403120753.105869-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4e8f1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=xlpq1E5UL7j_U2TQMoEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNiBTYWx0ZWRfX6D5VwdxQzmEp
 E2Hr2+ugIp756O3vXTALG1+nDC/038myg+qfnhjZTj+u7YeNv5l7xt+FRvsbX4oR5Ju/lLrjHZK
 WoZVZQqaCKqQ2cae9yhlChVIWBnMXHDsNhGdFPOAHVMy4tC5iqeWR2IFwJTyHoy97YgNbKlp+J6
 fhRWk68Hlgvvs8XyUXDZeXZByubGPnfN9kPh7ARZ6xTZBPShfcVVLrOljFhHRK0q6+BKEKs5OfB
 6uYip3CYrqFu7CaDzb9E8rwGIo7xC4GUFE2VUQzJEdnS7UZBJbOy0uwz2hKUc4v3z+Kzppdlk+Y
 gqFyDuX8+FVwJqk54JM0WnxvrwB6n0F3djqQUxN0sfFXsFf0nWc6NJwQY1iVFHSglJXIHmbzHYh
 quKj2nQIQW5RE9M7wxAup7pbBySqujFJttEtfEBERVZxLpH2Dl4V9K17cER21Db9h6JJuVdnwII
 POdJEVJMC/S9Exif1/Q==
X-Proofpoint-GUID: dnFFN_KFix1KKbRlN2VGrH56_QlbGIPT
X-Proofpoint-ORIG-GUID: dnFFN_KFix1KKbRlN2VGrH56_QlbGIPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102144-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.3:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C272B3ADA0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 2:07 PM, Pengyu Luo wrote:
> Add the FastRPC node to enable offloading compute tasks to the ADSP
> via the FastRPC framework.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 761f229e8f47..ee02acd18856 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -2966,6 +2966,33 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  				label = "lpass";
>  				qcom,remote-pid = <2>;
>  
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					qcom,non-secure-domain;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x0c03 0x0>;

These are SIDs destined for the CDSP.. (how) have you tested this
patch?

+Srini, Ekansh I can't quite decode which SIDs are "allowed" for FastRPC
on Hamoa's ADSP.. could you please help here?

Konrad

