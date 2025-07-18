Return-Path: <linux-arm-msm+bounces-65655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCD7B0A3D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 14:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B93F43ADC23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A20215F42;
	Fri, 18 Jul 2025 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdSzPevX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6DF2D948C
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752840359; cv=none; b=QuCPAZFDWYUNI6eCvJAFrEyVHt8p9E9L6Kk5QobMWdGoshucJevA5v7Gi3h7ig06yyCKD7FDPD639OuiJqwawf1bw2/kakpR3JUzH1LzYnDRoY1Fe8nmuhQJiJHd6j9/4Lvgub2k2aOdT15TOnvHjQPj11HuOKQLaH57r1ToeiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752840359; c=relaxed/simple;
	bh=7U4qOHFZvZLxWGVMYR7f8oDY3EFaK/os9tDzF6lr9FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhBLNCRHyyPF15YS4o3YEOb8VIUsnO4wT9Hhjga7LoEs9R9Mo9kXioSnyarorrnVUBY7nwub5A3xLMHXWNS4ZibGeAjMq6fmIFJrk430LknWCBTOm0/DQTw+jUw45rYAoy19EG8dWGgmHJD1k/V4yn2f8xOCg0aTOIK/QDcUF6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdSzPevX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7Zsvd015626
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UtRmvk1FOoWe2iPf/lIbg2tWc6zOKHKHM5RupZ8S24=; b=LdSzPevXM5JAsAu9
	vM34FB2+xLk17yZoA0lKX72401EL72yks9USgrWEBlt/LD0mH/XLGDU8hk0xPQjI
	XgiyPzGR/y0MWdDP9gqCUxYjggQLyaAyQOjPijvFMVG5t8VeO66PUylBgNtYgX+g
	VIuoFHzlpQd6V7HX5tJM2B23KAZHidkAJUGJc+wsVRdqma4+o7ZZWPFFslU6p3ry
	22bFHQA4RqApjI9IoG1LkI35YJyTE22HLMG6Al/4mvfFMwcPAZwPNzdOJun9zp06
	9r75YE2ue0Vc7H0g/bYXHvSdYzOwgiyYbZ5OWV9/YcC+3VWDPO6veWrc2Mt8Mzw4
	oLDMYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyxbq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:05:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab7406bfa1so4382761cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 05:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752840355; x=1753445155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8UtRmvk1FOoWe2iPf/lIbg2tWc6zOKHKHM5RupZ8S24=;
        b=w5X79f5lWgjyrwW7/PXPSq/5GEFqXB9LFpGtjXJ7OdRpAEhUcDoCvtY6aSAi7PyLU7
         TLCHdK0Z6ZlfyW2OtiXQwrsykNprCrmi/aeD14l+XRwxlrnEtAlkwAulSJ/2MRCtsILw
         8d5YbYhgXZsZELSJ8mCuG6MvQxK9xTmlpxFeqKQ0aY0yDHRsZLNCleQiD1mrIMe9hFk2
         viwhqDitLc5bpdMh6QaUkhvudW6kLNJVq8HU7qoTUKg1NTz+riSL1W1bC4ysmEQFJvnk
         0uUvr4S4CsVEm/HpkIexV7AyS8Sxpb8HWp1v+3Pm9VUXImWdyljg+f9To9hPPxCnoP/s
         P5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUV09mGqEXV2AcutGx/k7Fa9v1enDgM69JifvoQ+Abja9dflBFoGXmkbL3pMG0bHp3w1v46zpcnivENEMy+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4QsKzO+bn+APHEo17RbcNzJWntojcDc54AC6PKEp58gQRhUlQ
	HBrvXKNkHFJq/U2DDsjLdMdFd10dtHhOrUcquMbd9k0lHQMqapyEXDa+5qvQ52hx+1B1Yf5S5h8
	2mcF01XQDwIaLSZ+CEUPKUfzeenHmg44izE74CxN/Zj1FBxB0xaemt7RqxiDsARzZcrBn
X-Gm-Gg: ASbGncuUqN/f6aQNaPX1ZZJV6YrJJqdqi1GD/cov5BqR31cxkAX5As+vTob6HRKmtbG
	43LeyYzjAteczR2xQS5meARZTw8BqkokneAaKngOJZBko5oDm3m9UOcIfA2tICZ+Q8E43iZI1dz
	J6xRajtCYPtcehIdEYi+SxeV/Sz6Y5RHrHSIFsTF6O246FFZRPb+Uf1X3blf38w/fqjlpdFQiNM
	v17Mf9wv+B8AQPJU8vOQfu9uFBCIKJ42jx43yGhLZDdsC78tt8X8+50Pux8xPYnJzpQhgv/LEzX
	sUhx+mJq3cUhy7jLUmLspoOuwC3mB1nEWhC4MbkYXSGOETGSoOBIA5SP0tj3c0EidbozVBZQCo5
	11Q+EI+0Yyg9rvl/x+Dm7
X-Received: by 2002:a05:622a:302:b0:4ab:6499:785d with SMTP id d75a77b69052e-4ab90729467mr67177951cf.0.1752840355308;
        Fri, 18 Jul 2025 05:05:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEul6bHo97RUTHI+UU0ltJXObJlfOp/FKdGwuUle+uoI3cN3nXxhZnpbltIlsaOTmG/aibb8w==
X-Received: by 2002:a05:622a:302:b0:4ab:6499:785d with SMTP id d75a77b69052e-4ab90729467mr67177501cf.0.1752840354617;
        Fri, 18 Jul 2025 05:05:54 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7ea53sm109360366b.133.2025.07.18.05.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 05:05:53 -0700 (PDT)
Message-ID: <a569a2c3-2fb2-4a40-8d54-898e7c36f4b3@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 14:05:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@quicinc.com,
        Neeraj Soni <quic_neersoni@quicinc.com>,
        Ram Prakash Gupta <quic_rampraka@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Sachin Gupta <quic_sachgupt@quicinc.com>,
        Bhaskar Valaboju <quic_bhaskarv@quicinc.com>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>
References: <20250718110217.1929526-1-quic_dmukhopa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250718110217.1929526-1-quic_dmukhopa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cPfkr5PA4_Z9Q3O60UYMFXtNf6u_Bwup
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a38a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=K0aOVt1QNMoejPNc-jgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA5NCBTYWx0ZWRfX5v+ED/X3QS4I
 d5274kXY/Z1zF8NiZtkdCDpU4tHkqf4/0pfL0YrAwn3GuU6Zathr8hxSV/Eeth9QewQYu4Hj8NF
 tp8b43UJ72lPIEa+Ws6tt54HAhCINZuZOvB3bMU9sTHifoqwosxWwDpBQ5QGimmP/w/SuiNIgI/
 KKYTeuLTEH/V5+2UHufxY+fHnqCkHkotAIL3skp+TDyCqfVAjSfplIcGJPloLlRJ+U57oQYwJP7
 6gvJj0+ZJSvDo5ELbW7htlkF019WifjInbv7O7kk4/aAoGAjEdL8E/Rji5XAIBLNWu/2yh1/jFn
 MniwRsiZo/9Dr5zNm+Mi6JFAfJmNMV4E6LtKsHalpuh+3b2nh7TdfUoQxAkr/uQyA3Mv0T3AYBe
 gSlRl9MmnPij0K2dBjMb0G55SkQJt83rFyL4QE/v/PayZCytHWB05HH3vDRVq//dB4zxHsn/
X-Proofpoint-GUID: cPfkr5PA4_Z9Q3O60UYMFXtNf6u_Bwup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180094

On 7/18/25 1:02 PM, Debraj Mukhopadhyay wrote:
> Crypto reprogram all keys is called for each MMC runtime
> suspend/resume in current upstream design. If this is implemented
> as a non-interruptible call to TEE for security, the cpu core is
> blocked for execution while this call executes although the crypto
> engine already has the keys. For example, glitches in audio/video
> streaming applications have been observed due to this. Add the flag
> MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
> keys to crypto engine for socs which dont require this feature.
> 
> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
> 
> ---

Let's take a step back - do we need to ever program this more than
once on QC? What about other devices (e.g. the generic cqhci-crypto)?
Do they also lose the crypto context over a runtime pm cycle?

If our hardware is fine with set-it-and-forget-it approach, maybe
we could limit this to a small if-condition sdhci-msm.c

[...]

> @@ -459,6 +459,11 @@ struct mmc_host {
>  #define MMC_CAP2_CRYPTO		0
>  #endif
>  #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
> +#ifdef CONFIG_MMC_CRYPTO
> +#define MMC_CAP2_CRYPTO_NO_REPROG	(1 << 29)	/* Host handles inline crypto key reprogramming */
> +#else
> +#define MMC_CAP2_CRYPTO_NO_REPROG	0
> +#endif
This (and the crypto ifdef for MMC_CAP2_CRYPTO) looks like unnecessary
churn - crypto functions should never be called if the config is disabled
in the first place

Konrad

