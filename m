Return-Path: <linux-arm-msm+bounces-75079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98280B9EFDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D5581BC61B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B122F83A0;
	Thu, 25 Sep 2025 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOIzC4YF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8CE1DC9B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758800946; cv=none; b=Pv60GlElMNMN7jQXP5eHkjoxknZ/uRKrkssClxW+VNgqwWElqRut/akwrGMVEo4PJZP3m+MPTAJb9Z5u5Qlmxaj3VKuHP5F8nLHpM5bLFrDx4VB+F/KG1ktSXMBIUS+3vkYkzMF4mBTcvtI1Q4BWz8DydiR7OrRSfkX18uq+lLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758800946; c=relaxed/simple;
	bh=toxgSbOuMYd0l1zBSSHDfmkI9Q5eCWB7QxXd6A9cDi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atI4gZFITAYVX1+F7L6wReFYu9xmTF22uiecgrhq/mKnAacPGTI2MaxeYuM/mR/jxiUMSP20zJ4VukaaLYyg526q73HPZKnv8Thqw6btFvH9k49Dzo0Af3RAVz3xlXrwr/UyUEp0WsgOv5vYfBWFJw/uVQ+uRuSoqJ1L5fZYrZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOIzC4YF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9UgTR025591
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nX/7+Es5CEXVgmPLU51KFWh1W5gFD+wvMunPIFeNs98=; b=mOIzC4YF+zV4gcYV
	DVX2M16FN1bj/oQfzLXzFrje37j2ogmMyB9d4Ols67RKZOTJ6WdzGxVyyTiHHL27
	N2TpLQWURenH+h1Q1Pv2+xoWYZ+VTZEBuUtRaMVmBmKsyqB+OHa96CXOt8w3MF9N
	aR9dpanx+JpxN5TzuMa5Cd//D7gHlYpS1kW7aQWEwsPX8N1coiG9yUEZpN7kpuvW
	WqGUM26PdwDavOH+FRNtewWGg67tWfNQPP3M0z/taVCJBf9V0gKgKE/L/LaK2UMn
	alZE+bwczoVPCgDZo1GLvGRz94vFOB4b2TdWiUFNsEXW3W7qgDOY9oBi/3zldFIj
	nKqAbw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyf099x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:49:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dc37a99897so409951cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758800943; x=1759405743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nX/7+Es5CEXVgmPLU51KFWh1W5gFD+wvMunPIFeNs98=;
        b=UouaGkqE2r6nRIFU0Al5XNqSgUdwSTzs9CcFvFkPiND+LSxHa5bE16w4lrVD4NAbHI
         4fK4s9TGYfuM6OYyklGS5gdU0W/6pQKlaPvZlSLg65Acn0+3J92Z1hL2FD17nNf7/RhA
         FkoZe9Vuxa6Q8UyUxIvIsw2inZXZFmaVJE+OdPo/EvnSFDWKI5gjiTJ7H8l4jvlJall3
         K0oAENuQ2GqgytSdcs5tIOqqFNbkXOzo39N9VisuHUxX5uTQxj08+9WmUNZ9L1vwX1hd
         RivoydqVe+CeCeN3nGXp65fKu6+OqWzE/kgvt8ZgLKHE2t6mlNeuG8XWHtanNBfUeyA5
         s/fg==
X-Gm-Message-State: AOJu0YzMlfA8z0ZEjvb7Fw3I9f0qUpTvG9flzAAhY2hw/ad4l4UsUt+2
	keSuvMNvwxL5Np/0pUfoJzBxbFqJLV3gzXNbnLeEeMG57VSPKC7LOHGW2yqrtlIS6O21yjB4YBs
	G5w2uHeH3kpF/zspTuGFOZnb7fNZn1ewi34BaSzXZFOnsUECe5laPauAxEj6MaROe6+JI
X-Gm-Gg: ASbGncsvaWPrFmhykHDPqN1nyfAoI8OJ2w8ThFOAjy5BjuDbV0P4Bqov32K9QSlTLa1
	jQj59rlkzKi0eTbZHn7UXXyGWn5O/ktGiIRQoUGDtAGZcq3lGX+CJR8Em5RhT7mRDMCBuYABHRk
	gbGrY51pU/8AnZgy3EDKjxFHylY7p+3YZaaeAGs90BzqxREm4fhiJH55r3PIh12QKiYwTY44y8T
	DbxaL5zstz0T1P8DK53zvQViWv7nYScF1EMpYhnyKcwR3RsWSA70TVyPmiuDPQAidpNAAfi21qI
	nklZureggGkd4+4UIz7kGw6sj6IA/dDlBKbt8IthUhDdU2Zam6tSPXSTQWICUB4MxlK2xf7GDcb
	Bw25I/VJH1y1yvqI+ei3nBQ==
X-Received: by 2002:a05:622a:1988:b0:4d9:7eeb:3f76 with SMTP id d75a77b69052e-4da4b42881bmr27497671cf.8.1758800943292;
        Thu, 25 Sep 2025 04:49:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVDTxNrr1MXCU1YXwmH3hI/4HBUQONc/+oEm+jljQypOdh5NlhLYUBxtFh9nstaa+aDjP86A==
X-Received: by 2002:a05:622a:1988:b0:4d9:7eeb:3f76 with SMTP id d75a77b69052e-4da4b42881bmr27497281cf.8.1758800942641;
        Thu, 25 Sep 2025 04:49:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d155asm159172266b.6.2025.09.25.04.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:49:02 -0700 (PDT)
Message-ID: <39f6f7af-4b0a-496f-9391-880932634551@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:48:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] crypto: qce: add support for QCE major version 6
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
References: <20250924-knp-crypto-v1-0-49af17a231b7@oss.qualcomm.com>
 <20250924-knp-crypto-v1-3-49af17a231b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-crypto-v1-3-49af17a231b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2NVSNQSlbdZ57hn7h2Pk_XAwbHLObAwl
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d52c30 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=um4aV7xw4E9mcPOvuVgA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXzNzSXGd8Z0gT
 WDfuH20bOu3n3yGTLahMEf+kZ0vbTO7PXb2j36EuPx6jkzi1IDI2eFb7+b2dvJ3a1a29t6MW5yU
 9GJxdRtntQs3bULP48qMGGoCLqlJcpeefsxVniqxCok0g4Bi8DblQ6q/J2lRkntcIFLk0kREAxb
 dwz4rFvnh6O39lZJvfNkJirjP1FuczcmY2JPKQYDWw6Cy8MX5GSpiTBVKCPh6SESr2380QkOd4X
 zDVzjUBSdM4cFQsJpycsahonoozpt1tC+9vwjzyhJ4NoTmjzUFuAHFQIQByXVKYebTshJfZ8ypG
 fBTRy05WjPu/shX2C1ficQKEx1eMOKZwM3fyp2DEpNn+BCoprOPlPZxlQGKjNekWt9BlJ80UjT8
 t0eSBp+y
X-Proofpoint-ORIG-GUID: 2NVSNQSlbdZ57hn7h2Pk_XAwbHLObAwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On 9/25/25 1:38 AM, Jingyi Wang wrote:
> From: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
> 
> The Qualcomm General Purpose Crypto Engine (GPCE) has
> upgraded to version 6 on newer socs, this makes the
> version check logic obsolete and needs to be updated
> to account for v6.0.
> 
> As part of this, unnecessary version macros has also
> been removed.
> 
> Signed-off-by: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

This commit message does not reflect what the code does (or at
least it does so very indirectly)

You can instead title the commit message "fix version check" and
mention in the commit text that this is necessary e.g. for v6

Konrad

