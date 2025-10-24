Return-Path: <linux-arm-msm+bounces-78698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 259FCC05095
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 116BA1885FE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 08:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F4A304989;
	Fri, 24 Oct 2025 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ihw2QGcN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FA72F25F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761294384; cv=none; b=ZIKolrTP9JQOYm5arr3olED7OSRZcg9hXOSJYmonDSVEcOQFb24QgAnepjUzq5JKDKtK7oaGYCr+7MemP2tmbrDQ3Qjg2sXOWuvr/AxUHcef1TnCO+wqbPEOUntfjeAPSSYlEikg8s7G9YGNEXKPZjpCF3TtHhrXrMvL1kI8Bjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761294384; c=relaxed/simple;
	bh=3wnHXXUbxvNC7AueLagvjDdvYpIN3luXco1Nv9HWe1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p1mMuIcVsfqHbFVUosSsBohyw5B6c7QT+UzRj/kmXyyV4IGMzUHmVID6ZzxzHUCpZOb0Y7LNwI4FyNIiRHMBevQ9O0on+FmckfyfkZbV1aTj7H9HbyPqM3w9NBrGqXFnSSFmn8EKb/xfdKAOqnbA/+qpQsq8Q7in7+hqxWiJKS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ihw2QGcN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FTtv003642
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	376XFuF7lnjqNU0g0kqMrsqRp3dXMifm6+om7j0VY3E=; b=Ihw2QGcNGcc69+eG
	Isj4MqXGrpud8K9PQ3Hs0n9nMPbXFjUX43m/dTOq2VvSvGA1unEfwd5MXOCqe8Ii
	7KBCcKF1TLXNIlh2egiGZrgSAcLicrz0i4//t4IZL7pa748VrWijUGe+695/9yPT
	Rn82t9JQBxEE81Idn0GG7xjYYIxhhdRm0TZwwOT5/vLsRHLVM04eKHOPmKnVhFCt
	V7tbTITyXp59YTV7WlZu7dtdvrDjRJfxEcxbqhaQQyRpUrTsxYr2b3MoDKiWPZlA
	t/8gD/mm2W267tc9KMkQ6FKC4RDBYY04zjATvCnB0o6QnC3SpvW38XT71GL1kl2A
	YU7lYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gebbhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:26:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88e965f2bbfso61564085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 01:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761294380; x=1761899180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=376XFuF7lnjqNU0g0kqMrsqRp3dXMifm6+om7j0VY3E=;
        b=a//Pv8v33XAch20iN667/po0UThp50DEeT2kop9aM+atnPwQyyXDY7rIx6JTCQABuH
         UjK0iFuntzCK7Bv0y6FDDFU4pHbTfATIt1+Z0TW6SFLeMM8vR02woawt05peNkUX5BC4
         LDLC2dsjjQC3/Qiz4jonPmAGbAvGQX0NIUS6UC4YegsWQr9T/kC8bUsNs/wbVsaZ4ceS
         xezlQKZOEKWqhrZXgpBeM9jm/LesxwHJwojbyDsSl41AqtD3a9+xM2iw/yInKWRBh81L
         x+eAS+atjSUNJHDNFm+KR5d95gO0E9NsyRIMfcNXA7OhodYqTtNW2rDWKEcVZyCAHZnW
         QUqQ==
X-Gm-Message-State: AOJu0YwCcoUXtfhFHJJJE4HJqeF7E900wNuvDcnX8suO6lIZ+qY/I9OH
	hw91Dsp5sLjYacpEr6mSfV3z1OlpUkaAL+m/e5yP2DqDEFaDbAVB+gosMB9bacThxYVIpBMvR1e
	r0V0dZ3rl/cABH7ySBoZxaeB8SW8Uxo5b5x8aZaHFp88/YMo8OYmUiMW/gjd9WJiirA3+
X-Gm-Gg: ASbGncuxcRer+ul5jhq/t1hGEwglnhELvT4NDkG+wRPXNMDt77QCDlQGRPJDMKlWA49
	UrSquykWhFLRqmJlGIMdNW9M0A1SR9o0sLzmCRSUUP7sG+UBl7KconVqs3Mn4WLoaa7iFbKM9Mq
	0BVzA2KIoTnuZXNKQC6hXynuYW7i1xdPoPsXtyGFH8Jdh6/ZAf4v9P+8bD+sHyANg56N+LR+ItG
	hiCCBl5+P0Zt8A1WGyr0YtX54dr3ZRl6qq+ITxRYBKE+8aYp47McnCYLpt52HgKaEj/50j090F8
	FLmAbMJgCZM6GmdiHfxtgqmcNI4YMN1RNJrLzSrnyyuqAZ2wfseXdqnOV6dOdnRnrgxGjhTU/Yp
	iSik0s7gh+Te59h+tPp3iUbmqhmKcX3x3VW2fXa5ztyJEOvamaTf1soXM
X-Received: by 2002:ac8:58d1:0:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4ea116a3a18mr118992451cf.3.1761294380479;
        Fri, 24 Oct 2025 01:26:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+kaZi0Hbg5k3D9owRXyS9MsGI1IZ5n8ScVBwkhSrJAmMxzXcl7R5offEga6X9VsoIJFEXhQ==
X-Received: by 2002:ac8:58d1:0:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4ea116a3a18mr118992281cf.3.1761294380006;
        Fri, 24 Oct 2025 01:26:20 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d7971c8b2sm16029266b.45.2025.10.24.01.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:26:19 -0700 (PDT)
Message-ID: <229c1807-e534-4f9c-b459-350be0a12888@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:26:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add FastRPC nodes to
 ADSP
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-3-895ffe50ab5f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-3-895ffe50ab5f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX9Z181WK344Qg
 /2CekrXhTZ9rWS1Qu/XzEQY7Hj3j0brjH9eMpCscOql5JQb/Gc1FrYuc0empps72yl/qwB9Li3d
 ksci2an/Mn4B5vQBln8PI1YTVkDIGEvUGHUYMko/BkFcmnXkOKpSU4q8D2pwahjXlvK+J1o4IIt
 PnlPz+SNVHscF86NE+/VGzYydXJg8w8l3gUsT1yCZC7NuaeO6WUHNKQhYuiLQl5AMWdWpeZEeNE
 n4q41iJoqBhU+pYe9PQl/FG+Xx7bOrgvA9HzO0rrUs1zqwDJ5czz9SeuHYT2ISEPSOCc9Z0e4e0
 illwgoJPvK6FX2xWgC5G+T4rqsBgxRji46k2XBbqXAy7k19/QZcuzJsxT4ieQMMH6yekg2/NtHO
 6NvMlY50ffmfRhp2DK6L2P4U9ctisA==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68fb382d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OuZLqq7tAAAA:8 a=2ipkEsje13vFSbuXtY0A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: y9ccADzG6eQiTk2Fn4z7ByPh89HO6VMW
X-Proofpoint-ORIG-GUID: y9ccADzG6eQiTk2Fn4z7ByPh89HO6VMW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On 10/23/25 9:52 PM, Nickolay Goppen wrote:
> Add FastRPC subnode with compute-cb subnodes to ADSP node.
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index f4906ee3f0c3..2764666714e6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2342,6 +2342,39 @@ q6routing: routing {
>  						};
>  					};
>  				};
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					qcom,non-secure-domain;

I'm not sure this property is valid

Konrad

