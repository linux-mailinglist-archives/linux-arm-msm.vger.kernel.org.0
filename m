Return-Path: <linux-arm-msm+bounces-77566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 962EDBE3179
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 13:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56D725879D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 11:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E890323403;
	Thu, 16 Oct 2025 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxQ/3mQo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8131A7E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760614261; cv=none; b=GnKldHEcguBtUeR7h9AdSWkv9eF8bjQbx0mYTwXT0Xm/sAHVLo7HFtiBb6JYspD0ed9bAQOHONYDIdcQ7t3qb4/F0H5TCARi7G1mFCF3AcCzEb71V2yDyMzOCpTOePrs+EgIrrmAZMgU/x5G50Gz4pZpjCEJtmEL54LaUpfVuF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760614261; c=relaxed/simple;
	bh=MQYL3NqvOxkDXPW1F/Y50YQmsakcGgmXXf7C3SN+7uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpmSdP02fcdTojO1WCs73JFJzIl3/kFxOyXvJJUXNDM4yJKWugcrGlK1wVNo+IohhpPcP0DbKA/bddWf+RCjwPVFKi81je8wvQ9+twxtHIL1Olc8GBthkB+5zNmmTTttci4BHRzOMybcfC+8Z6qQexzjCizOWWm90lWf9KZX95s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxQ/3mQo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G88184016142
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 11:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3r81d4YusFHYu/ym3wjxA+mceYkkZtl0xDn0GBFN3Ls=; b=JxQ/3mQoBcIzo8mK
	p6Ok8qLnoc1XZ9YE5BT4jmfoSVq6re4PEShhVnRr4Ju/s8wpf7EYtBhqKpIrOban
	AaM2xnO6OwV/mDdZ8/FdzQ5lwkYihps/Ojb3YO19LPWVTsaDokPgjr7+UB1JuXuB
	xMTWcaGeA5dOzfUsrk2qBw1oF74r4oCGF6gO+T4+HBUDrPLFdx5Hg5Es54q3eKky
	b46iRn4mVru0IOO3OLc6qvhFuu14Iyrj4Fb8VKkmYP2YW+GRVK5SynFHt3hD4Pfj
	av8+ZOC5qAPTzFCsr5Fx8wurffVysXWvlmHlFXvcYwmS13+BTi8rXSZ/1p2nmfES
	sIqBSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkg35x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 11:30:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-88e965f2bbfso28826685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 04:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760614258; x=1761219058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3r81d4YusFHYu/ym3wjxA+mceYkkZtl0xDn0GBFN3Ls=;
        b=Zr8VXRosUdXGhL/ylwmDab2TtNHssrqC3lVSohwwDPTqDD8sXmnKItDrz60s1/yl/r
         9m+rBGcrpK05W+c5uwdv/OezqiCt+aXeoVbFOk5ewN+jnKjKk1qcPUQtFAWSvnW/Q9rI
         mS82tZaa3a9gdgDfkOUUEA52a8gkShsdD0ByfrP1cloEJRiDSYJ9KWCza7hOfbjiSuL2
         3BFFoCDWHBx9QHK1loBYE0Ya2qqJbnJW+lxLyNnyLxT8tGif4YzT7dF4xt2m1GBPy4jT
         nPDMDpS9pT0Nfjq85oVrw4YQzaBTF9EGRgSJBiTk53Ry/nE5aM4mhCpDsLFp4XHtNRdr
         Yj8w==
X-Forwarded-Encrypted: i=1; AJvYcCUP4otZUxA5YkDAVyjisIobTr02IkfLLn13UPK6xHeXJtjlUZgSAKpfyMsIz5dfndESOsOSRJ9dnrFCNzwf@vger.kernel.org
X-Gm-Message-State: AOJu0YwSkZuVG6ys7AgRjUqFSYNNpcN0WLyCrkC3tx/8jRKih500iw1Z
	Kb7f3klH1pinhZ2/EkkkGA0C16UYCc0oUI9oQk+qsYPvsBLOdNWfYxOi6fQDYd32H2QXHOHEfXg
	6+ECfb0vxo0l2Lf9Ii9zjjx7lT30hlH4UmWG+t/CvqZbmGot791Ly+7gdCvJXpysS3rxg
X-Gm-Gg: ASbGncvYOIw9favffCh55Vgc+qc6bH974qjTQeG3Cet9PfWDFQD3TcP1gsgcvjC+tws
	Q3736zZWsdNtlTHInNgKhutGGhZNaeT03kigbIWd6O47RoLiSiwo9ArBnMvMOAPq5B2NQPQc2MT
	WiVf7TRgzH9Y/ue+hmpr7sRFRftSoOR1C5vkiUo/2SG0MOWCj6WQDSHpbmeZuRMMds2iOLLzqlD
	s+tsQ5xBJ3NnfYMAqF0mDaY6UJ3RDJz/ekq+nVt8bvqby6/WdLS3uCM8Ztc29JWlWMHzvO0QYbT
	/8F3lHQzsE9WK5jr31GBLDCwHktHYetcVeBYzvTKUdJNcTaQxrHQFcjISIPTJNLHGy8FjG327PK
	6viQScNsHKFpGrw4LWn9yMqNXGhM8HpLeCGph5qYVTRdllHsiIqGoHcNt
X-Received: by 2002:a05:622a:14ce:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4e6ead2c674mr300272791cf.9.1760614258042;
        Thu, 16 Oct 2025 04:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQWo8LtrsilfoDkj8zqUn2LLSGLFdpY5oWuNZtrX6Xq2eIwSXcZU7XpjJTwnWEYu+0reTT4g==
X-Received: by 2002:a05:622a:14ce:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4e6ead2c674mr300272231cf.9.1760614257381;
        Thu, 16 Oct 2025 04:30:57 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd39f1fbsm487237966b.70.2025.10.16.04.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 04:30:56 -0700 (PDT)
Message-ID: <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 13:30:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w9skeMX_YaYTn-6snL3jmwMJ1jL-0iA2
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f0d773 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_kPKrX3CkssKu2g54qAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: w9skeMX_YaYTn-6snL3jmwMJ1jL-0iA2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5K2y0Q04RDaM
 5rFF5vTyO8MStUd9WBfACsZUdZ05C3647L2kgAjc7x+w82T7B5H76kLz6B7GvHd/PIw4LJ705NC
 rqgtPm5Z6YWyJuqFLXdMW+7yiQXpIqd0WZjlSjmuyKG4Hp9pTa9VpnDash+ihx7k3YX3jSSvCqT
 3rTOJRRPc7NBKzPcitx8lBiIwaRKrygM4IxD+2AbQ1JGOJDpB11byJtejyQq/SDeoAwIaSeow+p
 lHcI1oCOWBVwBtwtXk8NRW/irl7SIZpLC25UsMpSo4qYL6zot1oaRZSD31+fv4V0IxTfo29muWI
 teQp3phC0P8VPACh5huMDSeww7fotykO2EoXsGH8fdYJFxRhKW1v80Yl0oTRmBvx4pRc6uciFsI
 3s8NnLbVBoGPpNpBjJx+ZKZ41yzEYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/16/25 7:54 AM, Krzysztof Kozlowski wrote:
> On 15/10/2025 04:43, Hangxiang Ma wrote:
>> On hardware architectures where a single CAMNOC module is split into
>> two, one for each of the real time (RT) and non real time (NRT) modules
>> within camera sub system, processing VFE output over the AXI bus
>> requires enabling and setting the appropriate clock rate for the RT
>> CAMNOC. This change lays the groundwork for supporting such
>> configurations.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>> This change lays the groundwork for supporting configurations for
>> hardware architectures that split a single CAMNOC module into real time
>> (RT) and non real time (NRT).
>> ---
>>  drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index ee08dbbddf88..09b29ba383f1 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
>>  	return (!strcmp(clock->name, vfe_name) ||
>>  		!strcmp(clock->name, vfe_lite_name) ||
>>  		!strcmp(clock->name, "vfe_lite") ||
>> -		!strcmp(clock->name, "camnoc_axi"));
>> +		!strcmp(clock->name, "camnoc_axi") ||
>> +		!strcmp(clock->name, "camnoc_rt_axi"));
> 
> Just use camnoc_axi for both. Look at your bindings - why do you keep
> different names for same signal?

I think the correct question to ask is:

Is camnoc_axi going to represent the other (NRT) clock in this
setting?

Konrad

