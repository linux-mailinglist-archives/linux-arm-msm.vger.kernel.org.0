Return-Path: <linux-arm-msm+bounces-90773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAYFEfS4eGlzsQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:09:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA394ACA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0EB73001F9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C80355025;
	Tue, 27 Jan 2026 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4OF6gzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JX0qkgnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D41934C9AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769519342; cv=none; b=ISrrv5eYGYQ4mITOQR2OiN5MM00fdVrd3BLY9XQK5rVfan3FKBCoElPm730oflvXd/ZtVvYjln/ZYspuDwAWjJcq0KhcdprEWEeMZURo0ph6XbFWVw8r8AfcPWyMQmLyfVUIAEStvMhoiGqQHO2ux/wenmVPAYs6HTioMt/Cbn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769519342; c=relaxed/simple;
	bh=KeoZK08wHG9nZHjMFX8xz2O7SQBptswqoTkNA5e6PfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j+nYaB6fmv1dA/T8E/2h19pin3Qp1dhrF0A9Q4afL+F0o0IXlhZKysXTl2koD15gy2ruJsx1rebXTB7rDrwQRO8st+8hHS7zy2v6CkOVUZB6ou10CW/rZAskFth7Z7mFxV+x0H93YTkoUBbi9tUW03l76DV2No6lCnp1mgBQ4sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4OF6gzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JX0qkgnU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAOJc13714671
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blhG5kN+w8fw3+doSwjHXi9gQvdJRFmf89fw9pjZiGs=; b=H4OF6gzXHj7acKhZ
	izQpQ0ZkkX3DDWWBTVY71g37A14H+R04CL7j2mR1xYRcTl2UuXZHpLLo6H3LpJ4K
	qDmFMRYd0UHSFb99SiPuEMSWBumZSPE4+dUgwB7Xf6n+2mIql8PskhHPq4y2EiF7
	MsKCC6Cgm6ZJdKBMe2v1el2chT9drKXHKu8Idvknv06nGODmdj7zbWzaZAZgc/w7
	Lto+/pvt+vB4wIBT/We8qV9nKAV7I9sxlBXhUb6aPfdHFAIq6GMdXVwiyKeLLYI8
	jSBA3tJTq8JwpjNfxo8IiPV6DvJdedemSCtAP2es0e4XTutfcYlCsAIj+CPGuBx7
	ZdiIvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0b2gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:09:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b48c08deso171756285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769519340; x=1770124140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=blhG5kN+w8fw3+doSwjHXi9gQvdJRFmf89fw9pjZiGs=;
        b=JX0qkgnUMM9J/V6sPncZDEuuFEvdKdccHlr+/5a31JD3Wpx2CcYm48fHPMt0gHrHe5
         4N63a6L9li1fAryjAtg78MXOQTKxcCAmejVz6Laf+5vVX8Ol6l3vND2W4djX39piGJzm
         YGpyUqFZlfRe7gNhP+823f75Ny5lih4peFTvIZG1M+kHP2JqweottA5xuOw/PX2rGrCB
         o21qEsds8/Ujuq2f+7V243alO0Hl6U5+u+9GdHHXUPV2nYX+2COMHmA0xUUfTWJVleUy
         D4LAQKBaVRZJc2dVyanNPFC+Atpcb1JlkfxsFca1EMOoTCItIx5+bk17WbVio/ABWQTo
         Mwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769519340; x=1770124140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blhG5kN+w8fw3+doSwjHXi9gQvdJRFmf89fw9pjZiGs=;
        b=Cd4+kmtGnZ0Qd2JRIix+lIyKNBPu1zEBlI0Az7tazT9pvr5qTRHZMzQi8lLgVjqeuu
         9tvUOiJTitBP/z0AT4rPxelFX7RZjAQZdShEEk6q0j8jn04blI5bJkZvkO7TI3ti/+d1
         SJNN3GQS2NGp8zg4ZFUm4qfRRgXjwiK/OTl65Oe99qKEIXsL1bsfZ72PHFPAwbRoI/fz
         UCea6BbzjT9Dpwy7FQgiOrcZItbDCdxRnpmOXw9Dz2Q6otZsq7lD9kBR3vgRJsfLND5p
         EzDX6Dj18LoYWxC2/h/267lKt0uHyeUNUcdlb7ZA6Ak2KDQjSFTkRAcjZ3fzV3w4ipin
         /I+w==
X-Forwarded-Encrypted: i=1; AJvYcCXO+qL9OUJNWTBt9cYHuh0eGef9iqYb0a2PachJHiLRn7YNWSN6gQOgmNmB1cIC+e4MJDdugcwKDWLoBqiO@vger.kernel.org
X-Gm-Message-State: AOJu0YzkI7VWr+AuzFeImtl8z15jITTpj9BLmlJUPaNT46q6wmPqdflk
	B8XZVDN1ZNToTFV2ygsa9q76OhAfK4PMDi5wZSOaZhwWFgkP1uv4XExhoiMo6V/JVHTRSLbYoat
	B9m+C0yYE0z/SIGZH4mCe8GcBUqqnLlmEaWS4e1/yPLX9WN3sBGUSDyd8BIXV0/qC93IJ
X-Gm-Gg: AZuq6aLY1+LABzJO/Gpexdyzy+vH0siP4IPDVPv5FMyL1vCiTsiiDzrot4Ux5vWaefV
	4wNNxqWn0oPWEYjm4L8BN1kL1+nOYv+cPm2hvIj2wFSkIziMwX7crmJm/y7uKDbSJtoodaIM8WP
	CuL7Z1M1E1CZFjbs06qS2uRGCIQ3pkx+MfBUeLi6112128hY7d2C0Km6fx8/Nj0mSQzxyPkfEuJ
	rqJiaHOVJ+vpQIwhV4uScwoPrYznc6OVEzcGZgRAbG7AOle5JjqSbX2YUV370v/yzwnw8AdOrxf
	F6gJalV5c45K26H/7A7ual4Ww2AI+yw+QNjgzHVsnhmssj4w6glE3AfFDsziq/pNR6mH9eOgxJn
	IRNhBONwJ8vLZwWzzuBWCe/zvs5+B6dfKHOw6G7H1lnHmPy9F5ew25QA+f+1d8JNZKPI=
X-Received: by 2002:a05:620a:4694:b0:8c5:3699:97d9 with SMTP id af79cd13be357-8c70b8ebc55mr123920885a.7.1769519339681;
        Tue, 27 Jan 2026 05:08:59 -0800 (PST)
X-Received: by 2002:a05:620a:4694:b0:8c5:3699:97d9 with SMTP id af79cd13be357-8c70b8ebc55mr123917485a.7.1769519339165;
        Tue, 27 Jan 2026 05:08:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b411de7sm790211966b.19.2026.01.27.05.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:08:58 -0800 (PST)
Message-ID: <d33d426c-3208-4ddb-adea-8bd1274d6873@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:08:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: ipq9574: Add gpio details for
 eMMC
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260123120016.3671812-2-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260123120016.3671812-2-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LwHI17JeGU_gk6CTT66h8kpEgvVOxNxp
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6978b8ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MuMiuFh-OEQEkM8H1wUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LwHI17JeGU_gk6CTT66h8kpEgvVOxNxp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwOCBTYWx0ZWRfX0rCusrgPZi+d
 /UwO+D4ssWUL0IfEcpFm1vIQ4cJwDtNc36Et3astmhSgpD9+sCptHzP0fqo+70lz8HcVNQiY7mm
 h0OadIZZIRUWKJJ9e+NG/mx61QmZxn7r499uEHkfVoJJCk4X4eXQLT0OwAg3U6CN+JgyVdV+X7f
 Mh4wXI+tCVeTRf1zriMjQ/e+nE0oiSyks6i6Qa6Qv6nxsIehP8qHSwE5HPPa+CIyjzcGYH3cfpY
 yPn4Pbt3eTXrgv3ZTtT78AeI2GizPLXA/HfTRvAb4+8FX3a7Yqb27vJrNVfiGEfHZWmTtPuwGqQ
 oYcF22r5ffb0NvOtMS3zkljBMx/EKxiFJUQkl0llhb4qk9+H+VoKf9xDmyuPgC5OwJGSx3rlOp/
 a3V9R5Wb2yi2FmOhlYd/ujDWGmgkxWzY7LkHDQ1H2mgWUF/7giA1FdpPicUuRj6SsW4htsaqS+2
 fJWC1BxXR8RuiveIzhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90773-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90DA394ACA
X-Rspamd-Action: no action

On 1/23/26 1:00 PM, Varadarajan Narayanan wrote:
> The RDP433 has NAND and eMMC variants. Presently, only NAND variant is
> supported. To enable support for eMMC variant, add the relevant GPIO
> related information.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> index bdb396afb992..e4ae79b2fcd9 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -169,6 +169,38 @@ data-pins {
>  			bias-disable;
>  		};
>  	};
> +
> +	sdc_default_state: sdc-default-state {

This could live in the SoC DTSI, as it describes a generic configuration
referencing a SoC-defined pin function (which is also going to be
probably mimicked in reference-based (almost all) designs)

The config matches what I see in docs

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

