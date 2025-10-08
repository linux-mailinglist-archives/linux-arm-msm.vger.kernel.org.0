Return-Path: <linux-arm-msm+bounces-76369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F786BC4711
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 12:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A1E734F29D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 10:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D502F6164;
	Wed,  8 Oct 2025 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3jdE+9W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8ED2EC54A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759920665; cv=none; b=BrBAz/59J5gXaR9poMjygBA+H77pxx4IYliN/HXj8TlUcnAViF9LnANwKthxymFRS1hNPVPXZvfrjY56NpOxGns5SurQ/zOK145nERHQ8L8sg5fIUf4URiy7SGFA6+IkphfU5Z0o+hTDlMf2070wfHz6PubznRnVQ+ksc8qxOaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759920665; c=relaxed/simple;
	bh=rCJS/DF0vAIK51Y7TrE45g6Mebgpbjw75rMElUhkPPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNlcIIFcfWN7dXrDB3PVXrB4k8a/sHjOiUVFaBVerlwzdollvm5MYoKGHK8ukRmOHnuOeVJiFm7YCbvLU5zRzR+sTf02YA/KZCSmBhFMaIj2wlKIf/YPzxbv26PfMlRLUKraI4D7fcPSGYH+tcmtl3l/pHdNUONX5Erf0v6Teuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3jdE+9W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890XLr029369
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 10:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfiMTH98PGOoSPZGb+t22lVD8sXYwM73ZIvPfeoWjUw=; b=V3jdE+9WAl1VHoRa
	nhSJBhLEArGwp7vQpNOl+Dkjj8LXh3GVFsL9yo7BZwHjnzG4xso7AJqVqVsfj3Pl
	liMT0HPFYuuK8qPQh2ZE6QteTEilUxczQOYPDqMSP4e6UqqJpKAs4oRhAHvIF3SO
	VyUl1Tl6fVbinboMlkZ7LD0eKwbJFLZxNX++XW9btnkQoFc+Vht8U2x2ExdkyVid
	81OaQXTX8YO5mNfCBkGGqg361xBLinONaRHYnK2hT7KY5gOhVVIcszxyABgSz7a4
	2n65Pf3XCfiWxdESWH1SK5SzMiClXislJiESx4lO5mwo6k6bdTbS5WZ1CWxE0N/6
	EMIG5w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e2akd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 10:51:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dc37a99897so18743431cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 03:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759920661; x=1760525461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfiMTH98PGOoSPZGb+t22lVD8sXYwM73ZIvPfeoWjUw=;
        b=Cxt4tGA/aBvgTtcd/l9zwWhis2ahT+naa+sf32tPCLrFC91LkJltgiv4pNscDN+E2i
         VCqFbKoBto9cKsBHB6jgcKqzxa3fStlIMs0cQwqGibD0D9sPaVzrGffvymtAVQtcdmgY
         BBhV8+XTHQ2LaJTFo80fO9HcikjpxixUx6vocWEB0/an3IJLfhRU7NOTNip6Ep3W4p0a
         5Gc8niJhJDT/A0IWKSBbAIQcnCkhCVi03efypzQXXBPH1v+V2nbYcD0Gt9Y8zJ/9WCvg
         8AU4BDrcYPBV6nAp56EFyuHDw37Hy9oc2F/7FUOEp3sxz8ngqydeU/8vU2Dnzvm8ab+C
         F1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWbHC8NnUjX7XGbKztg6uAvG/VxvttKahxmtH57b9FZaos7N82xlLf3rwl9YYUpf+vHa83vBLfRHFpAqoPK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywylr27gJPXUf8CPl1vsWYlHmotGBgy2xe6f+ycn+/skVBCuz72
	is3I1XE3RRo7SoNvwN1BnRHNlfBT/QVEKgEX+aDf9i9J/XMc3U4AWeosuCLu+cZwr/oS7INs8r/
	e9/H8OWAsMrJugi1iuQH78Y3T0mqBoynnHCayv3oIR3XXRYlCOCgOjAYSCVjn5AgLCBQGKBn4s9
	jd
X-Gm-Gg: ASbGncsEmRBJXDds79CpT3E49U17SrXCjWgaFjBovdbvtiykt2SpoNziS4uq7Iw80Ww
	FwDhEoMTxY11sGk/yobcgvwJ8SnPBgjJnRNBhBH6J23KZc5MBPDHR+V42dDinPaQXwryxJUmqef
	TfvH7ZHUOzloyViDPWH502Fs61yKAf9bE14bPsgc7JMSYUL/nF6+JXwQgFiPgGey0uf5AmPdQWM
	dPayY7hXmvaDIgYdzetQ9eEAayyZRhoa+KGI6ES9FJ1xdv45uWW/0+q4Lgp5JFZyXMlupgc/Lip
	+H70bETBtWDyTRSJkr3X/QMPcCqm1APaxU/ijOOfXrTeo3WjZoc46X8HZWbTlIKwN0Mrk3AxroW
	b0+dlRSJW5Bbm8Y3B2ePrzqje+1o=
X-Received: by 2002:a05:6214:4107:b0:774:48fb:f8f2 with SMTP id 6a1803df08f44-87b074d2d0bmr26033306d6.0.1759920661242;
        Wed, 08 Oct 2025 03:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL1rSY/nbB1/t5g5hSYIbRk3avvqzjdnWKUPvH18AQ/zbzsVlznDqAFRvxOxM/XUEnY7OASQ==
X-Received: by 2002:a05:6214:4107:b0:774:48fb:f8f2 with SMTP id 6a1803df08f44-87b074d2d0bmr26033166d6.0.1759920660706;
        Wed, 08 Oct 2025 03:51:00 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3b7225sm14212981a12.16.2025.10.08.03.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:51:00 -0700 (PDT)
Message-ID: <eb90f34c-4b63-4696-abf5-1d412d7bf263@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:50:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: tpg: Add TPG support for
 SA8775P and QCS8300
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com>
 <20250925-camss_tpg-v4-3-d2eb099902c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-camss_tpg-v4-3-d2eb099902c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e64216 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_8ZK2gaWRgDgu38a0eYA:9
 a=QEXdDO2ut3YA:10 a=VIpMrH0tWCsA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vE6ZRESkXTMHWVOH0J-P7xsNtecqLc6M
X-Proofpoint-ORIG-GUID: vE6ZRESkXTMHWVOH0J-P7xsNtecqLc6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX4IXZJuBllpQe
 y9lAgwi5B5ER4w5z+GQyN0uxwq3H8sFsTjtR3rmbe1pRGDSapmEhyGZMDkunv8YrPq4jb/elrPo
 MBQkL7NbCnsLhVjd1O8hB9KXWERIyx5auts4lPXULAGTTFFQqZn24rxUWo5wbiOn+H1vglCBAKK
 lQIY5wDEKhWyMhrdnnQoznJRXoHILCqOOo8/G1fv93HCih0Cf608bQ35wuB5N3H8rgyxkv6tsvs
 RUqpjQWo3OBoE+gD2jux8NjCnzV0LC2+K07zKmaCa1h/HL+P05XJBGBlGF6MTiJgBhvqxwZriKF
 L31wBW3a6QVYyoTdTxomEbjPKGnOn8mB2J9KdCtWuqhAVrAkXv2XAt3nKWFZ3LPK0BgD69Qf4zv
 axNfT2Pxjqu4GKPy4sBn1A97hCKcEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On 9/25/25 2:32 AM, Wenmeng Liu wrote:
> Add support for TPG found on SA8775P and QCS8300.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

[...]

> @@ -4350,6 +4413,7 @@ static const struct camss_resources msm8916_resources = {
>  	.ispif_res = &ispif_res_8x16,
>  	.vfe_res = vfe_res_8x16,
>  	.csiphy_num = ARRAY_SIZE(csiphy_res_8x16),
> +	.tpg_num = 0,

Uninitialized fields of partially-initialized structs default to zero,
i.e. drop all lines like this

Konrad

