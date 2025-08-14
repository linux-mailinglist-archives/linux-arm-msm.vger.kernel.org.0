Return-Path: <linux-arm-msm+bounces-69178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B1DB260E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 663793BFD0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93B525DD0C;
	Thu, 14 Aug 2025 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wpo3dVKO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB2A2EB5AC
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163522; cv=none; b=DyIlHgibDSx5rY9CNR2MPMOgRNwPhzcTtLtWX/iLITx5ji7cSwQz4LPALb29rl/uTypZbHulp2q+7mZUGCReR0elf5f1k5XBVvsML0yxpglFS+TG/vvCCKpZxuUV8leMu+5QwHHNBOnVWA04UKiLv7seHK41bsQC+ipUuzi7yYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163522; c=relaxed/simple;
	bh=BUXFP0U+hivJPwg7gYygk77EM7S6MHzwvVEpmdMZtso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xa/uf7aJphF3VrEAqo3NkMxdbezkJrGRqRXYZQUmVYmrA2ZPN4PduUUIziZR2rrx3+bnlPnu7uYQGQJ30LoueqE0gcEVk7FOa4X4olNyKAj50CsFgneavIOy2P/HIqTC2NjnIo7RD2UYJAla2JVWJYLLlNsgDD67j6Zf5X/6eiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wpo3dVKO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNZY8b013023
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQEfbuaLjFND5gvC0GEYzyTZRnvvz4KEBmbZTTE8pJA=; b=Wpo3dVKO5hxQD3NH
	p5ohTSa2i0kyFkjcIaBWIMoeH+ONo4zWYBEUTQT9A/SUkw2SM0zTquwMnExCmCX8
	3m1KbKz3f6P6XVX/q2ffetM9WObeyXBaqezUx4VewqVB6IJ8SF2KDmnrtOrA7XoC
	7BN8adfbFFDpx7Q43hydk9ZHwaD+0sMMU7dFW7tIK4tYEolRZzyqnw68s04Rei2N
	vNvW5JLNu+pLRmQ34GsnWbI7+Xs4zfquZEcrr3c+p8UwtwbKJ5QHxN4xVWrh6ZVb
	Ex3pKKwMjM58ke5/JQv6aMT6pUM5D9qVgutqZM362o0itkZG3YsgWB7V2LNIbp15
	ch9z0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6u045-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:25:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e8707701f2so21339185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163519; x=1755768319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQEfbuaLjFND5gvC0GEYzyTZRnvvz4KEBmbZTTE8pJA=;
        b=mhiWkzrd7+AxMGVx5OrzbRjlqPY6X4OIYkjOJ2PbkyHLhSouGyKJFHKO8Zdqt8rIJp
         +Zdm/E12OgqPKIqU91xWjP7PDaH6RtoeyT9Y5YqfbysWDbm+F4wIqEPjSar2eU6XjpW4
         JDYEiuKeF6aBsVCHB2gnGzxqaYtIQX79ySVuqZMjVOFHL9Qwf2v9Z5znZt3MG4vYxRCU
         Oxjym/ODY90ylZQGHahnTRPoV8byilNmPdAH29Wne4Dyw9DzOty+JOLuN21MZMpV5wxa
         vBd/Z66ossMQYbE0JG7MtxfgY3j+CpmwUYs8aYHOVWc/rfTKxPOqdvnNFg/L8r/cGhh7
         lE6Q==
X-Gm-Message-State: AOJu0Yw8LPsWk7+7HZw5uHAGNAxo27waOaBhqPyPrJYqfTFGGhec4Bzw
	h5Nn9I4vlCt85gE6ldG0SCG7k0AzLcaQPNVSGJX9Vd/1MnP0kl2jGz23zYjWd4i6y0Gg1XUvMTs
	4/BjZiJFOhbkhoXPLpf0oSNnIj6Tvj8pakrxVjXhyhPMMIFBGQEnNGg8hbHTzfBWnP/Df
X-Gm-Gg: ASbGncvAbhBbajvxoqJzi0f2dCjgPkGDgDkEPjF+xLV7a04D81T8q6HSCEAK0fdCD0w
	F6beu2CrRP0DORZZ54Xo03FvN1hURODikBckPtwVYgdY4/0YwruO0ZoQhSaixh36yppfbQPbOXT
	odS8lMeSFlMcZqap96suOVZrhDbcJxSDnC+gU4smr/EvwN2ICSexaJ5BzhX7ZZyy0RNTXFlMlPu
	rupPbdqJmvm7kIRKPx8VtwXEeBvo90thi27yEAvuMerBIE/l/frGT0fhte9UPlPjTQVqFyamP4Y
	1ML+KngSuQFpw0Syp3YRds8Jj8HXhWbxB1Df/AW8Jz1h0x+PACdIQEViVFrAfHsszR9NMAfGzZE
	KKpHDlbWfYFHfTTcRjA==
X-Received: by 2002:a05:6214:e89:b0:709:f328:8f05 with SMTP id 6a1803df08f44-70ae6d09624mr15950266d6.2.1755163519247;
        Thu, 14 Aug 2025 02:25:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAQIFb6Sq3gKxyxH9UdwqYleE2mbGjbAt6Qiph21glIclnybKJm4av+T+Q9lLlN6r9HeDNIQ==
X-Received: by 2002:a05:6214:e89:b0:709:f328:8f05 with SMTP id 6a1803df08f44-70ae6d09624mr15950176d6.2.1755163518772;
        Thu, 14 Aug 2025 02:25:18 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8ffbdb4sm23309494a12.52.2025.08.14.02.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:25:18 -0700 (PDT)
Message-ID: <7813c237-241b-4f09-8948-283def984792@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 11:25:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] soc: qcom: use no-UBWC config for MSM8956/76
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
 <20250814-more-ubwc-v1-4-d520f298220d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-4-d520f298220d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfXwbqL0GkGFDKK
 UADnEHuYszru4TDg9+LXKaEqb8uTmVq8rnA0+S3ayfsxKTnJ4FfBN5VPNlp7IcJnVXZL6i7SO70
 QGXKVli4TgRu1eYFdkbgiL0qX9Rw33xtLDTIKB4C150c5yn0GjWCCrdBF7dW3o5wDT42qT5pNJv
 5lNJsjiSk2/6fWAmny0jpLUPQeB6VPRUtEDg24F6mvpuRY/N+wFBDxO+XaaQ21IchoMmghQBceW
 n5IiO6FIORt9YCeixmlprcVcDfSKj2mhcRiHElBH2AdhJfOyiLR1ePPEiq0CreMRfCJ/0xOw1ls
 HWjW5C0Y+BiMLHUGvSzcGNm22JdHao+cACADI55G6hvFE2b9UMhRws0BytQo5KNht452zCc3BD4
 +miKHICr
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689dab80 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6H9nUlg-slowg9_X3SkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uLTlWmiX3wtRlhGqAhw9kLz9qQ_POyuW
X-Proofpoint-ORIG-GUID: uLTlWmiX3wtRlhGqAhw9kLz9qQ_POyuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

On 8/14/25 9:22 AM, Dmitry Baryshkov wrote:
> Both MSM8956 and MSM8976 have MDSS 1.11 which doesn't support UBWC
> (although they also have Adreno 510, which might support UBWC). Disable
> UBWC support for those platforms.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

