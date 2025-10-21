Return-Path: <linux-arm-msm+bounces-78119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A6BBF55F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 10:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5CAD18C3425
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 08:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F93C323401;
	Tue, 21 Oct 2025 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="el53CvSw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978323128D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761036973; cv=none; b=q+hhNZGD8WhRLTYXlcWzjgf6pBYQoboPsUD3/GN/ryLgUgY8+coNIhKM7plcrCp92Z6L4IjLBoQ8wT48mYStDfYfg0Q1+NLibYnleRwAi4W4QVzqfKstB58mx6nE3kvJarpWF7D4GyToCR6jqTkvYA2mlHHTuFzmldhEVMGsKpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761036973; c=relaxed/simple;
	bh=p1HMLQCAtIqg0gUPotjCohNGE4o5HyZj/UP6M6hYo+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gojjY8QgoWS2z7xEOVgAZYBY9Y1cHrR6gxSrxQm9ODNeq2aQqVO/r/lnXm3M6h/Vv1NXtjClN4cIZqTJiwQBA2XSFJjh++Yf0frnPTPAVP7H603ujdCsbMdCI/0Mu3jTRdkbNQTPYLH+Fbf34sdXbbqb4ukFVJC51flVMgNiAMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=el53CvSw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8JqNu031463
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 08:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPkYKty+NWUtDKsrjdBKt0tpiMSu2WxnR7dA7Llh8jc=; b=el53CvSw1pdSqS7z
	6YzG+RHH5ma05ImFxOFA1bfe+NPfH8OAQUR77mLGhAbqkg+X+22lB51L0EtmgTrA
	Q1kEzFMVsZd4ogv88YXlwCzRFZJSmR4wlVqFQJNL7/P4ck4UVMT2pnb+AaJUmQua
	5nC/0koNF3dqAjIPvryzkkGGkksiMRzBJzYD5jGUyp4v484WypVKweauPP1Z9E6N
	VN632yiSGRQ7wPh2mI0VKZfUjAS378Rs6SPE6hpDpTYtyUcNFjsYdB6b6W5w3c1Q
	IbC+yHEsgvdsCGGEoZSkxygzaT7YvWgZeQN6lexm3NsTzzMSm+HYNjwYpZ7C6szM
	BkZYuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k7ve7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 08:56:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-890921c382eso169482585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 01:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761036969; x=1761641769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPkYKty+NWUtDKsrjdBKt0tpiMSu2WxnR7dA7Llh8jc=;
        b=u2f/47Av9S0CIt2E+g9rRDiq3YNvTTrTWXfKlQQSnGD+bSTNnTZ94Bdn7tW8HQMhwr
         0eRLFLi3OcXJZmmEE3T8ngFsKAExgkqh2zOWLCPE9Z8B7jz3LumTPf25Ov1zzr8NSj5G
         Dcscj1g48DWH43U8kTfQjC0r1uIK/i8sG+CgAQ00QiWV4/CqTG4yMtUzJY2YokZDvj9W
         z/wgAVf9yCTOvY0oFH8bkasnlDET3bnGhI0EjVs11la6eMWmf5E2H9LFo77wC7H67NqP
         mmndYYz/BIsxUkAE16AyIsmAdnXOb/621D2RTNNLq6wofKw3BcCTpJ1kYBbuc9hVPPoR
         CvMA==
X-Gm-Message-State: AOJu0Yx/FCiYelPNodIDsGVBs+IIWDXwwTIXoH9ubuvLs+ZWBGBncf4F
	+4sjKAaG01MBOcNW2Utf+6c/pYmUq0e5YubXU7G36Q6vO6XqPQKDtxnVTJIEyawlS47j2+SkVRM
	+wwIHrxPnYhPnwWqBF7Gipi5bb6Qim5z9CIzXiHO2xb8wtRmN6SOTENNg7wTEByfWbByU
X-Gm-Gg: ASbGncuopihvOvq8v/wsSBNJjBWPAoazYwk/gMEGnTdGYF1hXrsyGbipJooiIOKbUN+
	yd6lTiELbLmQp9i4xQVz0fGOkpLtOHxv1XMf9FafKNbfYCtjYNa4m3MkBGGaB3uv6o7OFHlr4Za
	0QtyhGNmd/nIpmWk5yodLVvXv2+wqAjC89rF7C02upgBkOGfk4rur4RJM+j2qQ65WGFpANYTvaM
	dsTVHagIduFwrvo0bMAece7HPeaXTPZK7QYrEcKX4Awu5CM+dBB9fcYZduFWV6WTGIW+3xbOX3S
	wqWSGK1uqdhpb2lAyuIYh80g/hXGUYKS69LAthPWVvsGfY4GaE48muzcscO8ofPcCZuX/B/ce3v
	hXowhobpVM4XA6cRUizcWnqIIpBTAqYQBPZwD9/PpMzXJo6iqK41PvnN5
X-Received: by 2002:a05:622a:245:b0:4e8:97b1:2f00 with SMTP id d75a77b69052e-4e89d07b665mr125492361cf.0.1761036969230;
        Tue, 21 Oct 2025 01:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwBLXqTI6f+Bzi2R6wECJZwkz+yvm9ue+XiJIYIwB6PxHU0f52M5+P+xVtyMO9HaSWzM+hQA==
X-Received: by 2002:a05:622a:245:b0:4e8:97b1:2f00 with SMTP id d75a77b69052e-4e89d07b665mr125492291cf.0.1761036968808;
        Tue, 21 Oct 2025 01:56:08 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e89713ffsm1022412766b.36.2025.10.21.01.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 01:56:08 -0700 (PDT)
Message-ID: <f284c279-a283-4cae-b405-02d7a0c44348@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 10:56:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Define guard pages within the
 rmtfs region
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251020-sdm845-use-guard-pages-v1-1-64d714f8bd73@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251020-sdm845-use-guard-pages-v1-1-64d714f8bd73@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E-JYoFyUre0lICmV7TMjq73gdeqv7U0r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX4TcwVGkHTFRl
 n3pWJvuVPJwFxN9AkkEvEE++rCSc5uWab1rUibZ7kjF4YhO3qRJeOaN5dUo++P4kvcZ4TUuquQm
 tSPSRsT6jo9FxxkRv1YyKsBPhdjEATOSfmB01r6VKVnEIFfAfWZ5DMktWEeWUaACWkr5z77LO7Q
 QwGqkeBa16BQM5ny4vsG27YnDVBjUCPjqpmV/+/uuNuXabXKpdVaKfNJ2l0/N3U8KGWrZ9m99+w
 Km6HxKSWkfgfbXNoqIW1/suC+dUvTaxlgvXq+m9WOtLVidXLi0p2bSDqYwkxGe8eVBR3G3525Aj
 l6wj8VN0imPITV7BSMXAxHzxALCWBftp60kTIT+ZrOmoL5jF0dm4OETivkKLige9HxugS9Vz2Gd
 bvyE1O6Ws1i5j87sB2FHaFbWLj59+g==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f74aaa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WIiUZGVdasX2BrCbfdgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: E-JYoFyUre0lICmV7TMjq73gdeqv7U0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/20/25 11:12 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Use qcom,use-guard-pages property instead of polluting device-tree with
> lower and upper rmtfs guard nodes.
> 
> No functional change intended.
> 
> cosmetic: set name the node rmtfs-region.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

