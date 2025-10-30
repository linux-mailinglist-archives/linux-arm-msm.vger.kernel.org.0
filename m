Return-Path: <linux-arm-msm+bounces-79644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DF1C1F7E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 062B64E13D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D217934216D;
	Thu, 30 Oct 2025 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5RxKbtE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wy+VKuwd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A49C182D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761819673; cv=none; b=nQk7tdLQ1ogLVv2vlsiClzrmSdaN/FRgxHjAeotxRyEUnaeXexdWEsY/kGPitF37g7ECu/ZdXPMdom69IO9skTgYMQBVUJiyiwJVxhW2UwYlhgQO1SF6rqr/8+3Y+VnFiKrCDC8DDT68rPtBTvUFQdSziKejdcY2lRAMNfmOdbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761819673; c=relaxed/simple;
	bh=w+4FTReQ0hFrGAqHVv9q6s6dE8DzBAdMwd92ii9vHiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nez6Sgya1r3wDZEesiJoHsEviNgGJ4TLcckZUwgjNvVEUAhcwO+6CIQ7jye4fzH8/l/lbIkjOFZD1f5jzsxuctKrEEtp759yalK+gTSQ+Mx672FgBGCmh7lrhLLI9RIxJ87gEVfKi0JSz5bDsjDF7IzHllh2ToZOzbWR7JAzVWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5RxKbtE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wy+VKuwd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9PDBK3508813
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lp+NROiKp+LAvu4ICWXwWl+U0GpK5lxYJnqIx4V+lz8=; b=k5RxKbtEmbMPcfIN
	A1Pd7uUNddnAA9NRY/rOGasPvL7JROFWzkkBAeBkoi86ManSo552F3vEb3D6ugI/
	VAVgzMjGkqPvROzcVfa/4oJtDwTq8L3FfMZ9lsIvP+5WhASIrXsyAASGqVpiQz0r
	lzgA9EzVUmkcKHMaFBJotLDYtu9VBxYQccpznJjQ3mjFQ1mzi6dKEvcgfHhBwe9A
	0zw03i2/bvfR+hUbhRrAGRj4639FhbiAbR838IurJgFpbdegxekA6mkj8PmEqvKw
	M1wETnT8Yog48KshKYx/KBNaZwq85AlEWpzjHGBGlqYVwTPVmTbh2U+/QIIxdF7t
	Bl7Vhw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdg5q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:21:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87ff7511178so2654566d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761819670; x=1762424470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lp+NROiKp+LAvu4ICWXwWl+U0GpK5lxYJnqIx4V+lz8=;
        b=Wy+VKuwdFl+HcfHw9ykMMR3ojLAIKsxwyQCtK3iup9F8ykWJlAlG0aRE39zTIO3Q/1
         48MdjSznQLKcLaVrPW98Evy6sps/SvCdPv8/sreWDXJmsxIAzA7+lD/6Nvd70SukhpdK
         OQ3LmzY4f9b7+61ttckI/gca0D/CoA+D6fomD5vZUnpxxxc5P1tDl5XpMWVrBc+XRzdE
         FbhAt13aSZ36doDUpiAli1uaYB64nB4yfgcvYu2udpEyU2vrwNIVYusYrLCgkRlmWqEr
         y5RBSviVWVPudOWPIF3DxA4DFl/8etVjl0O2wOW5ode8dJLldh3IXecpdLZaOBRWPfvX
         6NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761819670; x=1762424470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp+NROiKp+LAvu4ICWXwWl+U0GpK5lxYJnqIx4V+lz8=;
        b=OT2zkzgK1yz0yqgk2117iyCOmjAQk0EuvzvOI4sG9zJCze6ibAoLGGZ/sSccPZ995o
         0VgvsW+cwUyH+d1AyzrW9qm1oHFyIJeyiLbkmn+A5RBX8JwRreY9cKcrKznJN+Tscuiw
         jZvVovQNAeY1mesgf40QN2b/EdY6+kKGjlTcVHQhp2gfQpznmppHRBxGncLd15N7sY/k
         wBTmN/SMNTrJGKLmUVa9+5XWpw8tAqpPHLjkxOXbHsbYKjNsiJkF8ngfZ99YR7zqDc2N
         Y3Kzuzpthx9D+Yo4ggFiZ/NVum1HG3irfmg3jB9cVw0+GiYLoSVdkfMp/a0pGQaHAVjR
         cWng==
X-Gm-Message-State: AOJu0YzSQiolKb/S1XcTJlFlTWISTL9zUUG21sFwj/lIgE+rQICxwh0a
	5cxgktyXhRN4cZ5rF8cQACnBuajeKw5g53UWGZiUfUCjoiXG4WxZuPbv6qU36joIAHGbmz5PYNR
	LlCkNcoX3jSRcRc98NOjJduoo1CVxvfAylWzVYyReUT3vPwA15O+27JYWy7G482ELiUlh
X-Gm-Gg: ASbGncsk0AFKRWnLNEPvVDY7/h5+NcKMsItWUD6gL2+WseT2q3KSg/Htfgo9fwhmUrM
	4XtOh8NwNFkSrV3uvs/V6Am9wpcX9qBCuJmRTntsThYfMCUBVE55nriXSWc96xeTuDM0ur+HO4s
	DBnDrbjH6rrlgbz8Ssogg4/zbdaB8I4gAFOSs6RSBLtJLK1zW/XbUgJxGCeBvIv+Pg/itAjb3x6
	h3MEVpnpL4ZVuNo+JTGH2cJlMe+5013XZARw3JRrvazP/yQu15VynN7rbodpkmNHFjawdJiDoWn
	juFXPCO2fXBNTM2iutjxbsK8pr2Eit9kNJAbPZiNnkZzvE+RDB2innOsqwjcpVyI22yV7gSa1tx
	EZXeDJU243hWFe6AV6DfA7Bcu13U8Dee0YdmxhtttdWPF3DECmSE6xXuC
X-Received: by 2002:a05:6214:2423:b0:801:2595:d05d with SMTP id 6a1803df08f44-88009bcf401mr54099396d6.3.1761819670434;
        Thu, 30 Oct 2025 03:21:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBhQrT02nFMxk8WprMGgrJkRF51GRhYLDtdXSNrEcQnQ3+IQ2WzvDy91rwlXTW3OGm2upe8g==
X-Received: by 2002:a05:6214:2423:b0:801:2595:d05d with SMTP id 6a1803df08f44-88009bcf401mr54099216d6.3.1761819669892;
        Thu, 30 Oct 2025 03:21:09 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8541fc31sm1695026166b.60.2025.10.30.03.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:21:09 -0700 (PDT)
Message-ID: <75fd82c8-3e19-467f-bb8a-eed197b63068@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:21:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: ice: Add HWKM v1 support for wrapped keys
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251028175623.1054084-1-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028175623.1054084-1-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6KgzgxKQ6jlvMJJCS8hh72uP_9yYkImG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4NCBTYWx0ZWRfXzG3HcLNsqlb8
 X1UrZ1IWAJwsjQhet2def3zJcjgidF6nKX9/0M8pM/jXzgtYNyj+X+Ha5gHxlgIuGQteTYKwUHF
 WnFqSaxZa1BeRDAy/NimcYIw9Kj78PSn35d0OQJQtXV90crVKsmlw4aHto3RV/cMGJMTxEOxPP8
 +CTkknn41bfmWEb7JFR7inEuywbtln3z/EZMCsmNedcjiOcbZ+UwlRSQ1S+grafZLj3GuSP1Y3i
 sWptwVCYvbWJQeXcY3HOMTGzOZsUsakaRllCw6O5/gwQyYeVBq11ZNo4Eq6gbz/EULSUX6cuCnw
 LAv2MHIPvlh17c/X0vo+iWvNAOx0lyqhJCgbklyM06ArjUyPV9XButSRYWZJVyDqiV5rmVI0asN
 I/Qnwgum0S/Y49S5v3W5NucZM1Phtg==
X-Proofpoint-ORIG-GUID: 6KgzgxKQ6jlvMJJCS8hh72uP_9yYkImG
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=69033c17 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=D5PoHb-6lmFbxNsJ16QA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300084

On 10/28/25 6:56 PM, Neeraj Soni wrote:
> HWKM v1 and v2 differ slightly in wrapped key size and the bit fields for
> certain status registers and operating mode (legacy or standard).
> 
> Add support to select HWKM version based on the major and minor revisions.
> Use this HWKM version to select wrapped key size and to configure the bit
> fields in registers for operating modes and hardware status.
> 
> Support for SCM calls for wrapped keys is being added in the TrustZone for
> few SoCs with HWKM v1. Existing check of qcom_scm_has_wrapped_key_support()
> API ensures that HWKM is used only if these SCM calls are supported in
> TrustZone for that SoC.
> 
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> ---

[...]

> +	/* HWKM version v2 is present from ICE 3.2.1 onwards while version v1
> +	 * is present only in ICE 3.2.0. Earlier ICE version don't have HWKM.
> +	 */
> +	if (major > 3 ||
> +	   (major == 3 && (minor >= 3 || (minor == 2 && step >= 1))))
> +		ice->hwkm_version = QCOM_ICE_HWKM_V2;
> +	else if ((major == 3) && (minor == 2))
> +		ice->hwkm_version = QCOM_ICE_HWKM_V1;
> +	else
> +		ice->hwkm_version = 0;
> +
>  	dev_info(dev, "Found QC Inline Crypto Engine (ICE) v%d.%d.%d\n",
>  		 major, minor, step);
>  
> +	if (!ice->hwkm_version)
> +		dev_info(dev, "QC Hardware Key Manager (HWKM) not supported\n");

This isn't an error condition (ICE vers 3.0.0..<3.2.0 simply don't have it),
so I think it's fair not to print this possibly somewhat concerning message

[...]

>  static unsigned int translate_hwkm_slot(struct qcom_ice *ice, unsigned int slot)
>  {
> -	return slot * 2;
> +	/* The slot offset depends upon HWKM version */

This comment doesn't provide any additional context (e.g. what is the
underlying reason for V2 requiring a wider stride) - please provide
some or remove it, as otherwise it reiterates the single LoC below

Looks good otherwise

Konrad

