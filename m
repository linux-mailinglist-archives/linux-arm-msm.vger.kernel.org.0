Return-Path: <linux-arm-msm+bounces-75061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 852BCB9EC80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40C991BC83A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C592F3612;
	Thu, 25 Sep 2025 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBbXJq9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCCF2F6566
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796827; cv=none; b=GYWcdccCSZopXXZ5rMQ/0h+6pLTfPVOY0AZlk37JR00AZ05c8HozgBkly2axtxvCFNOJJTTTklTD8z3WkgK6GJYEO4JGv3rAoshmMTOsNA3XGoQArCEimTb/DvGaNhhPVSCjqL9xgtW4Y3JBt7vBU/M7OfRyj19+Pnungl6MXDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796827; c=relaxed/simple;
	bh=7K0kybRI4HZ4jK8C4ZbdHxQtenjrPucHPMRAKKj6/ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXaBbPcePeAAo/i/H/Gumtg17NVjW93iy89T0AzE5m4jVmAlwq0qMZ6Oih/sfqY9wUMgP89r73Kr6YDCU0e6+7lG13iSNzGz6j7NZYjdkjo5LHQBMHxH28rzptrBnQx8VfJLx3YHpNXfeCk0Hf/2h1CyKH4PdN76psWetp8U/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBbXJq9A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9oUqZ017453
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkrub1vjfp8/J5x0I8lwP41qVsopVVAqErZdeoHT7KY=; b=jBbXJq9A8X3vT/px
	p8Yol/YmZPOKUckMtoJP3NoRKnA0SzIlKkDdBGUkgXDwwvhNg5ZgkbFy+z9HL3ev
	vahRVXNh+BSY8B31EZcZE8062mRi1JFj+x/fqEG1ETpw/SXlIYGxq89XGnVEXley
	YeCKN3zQMl67ONHAjkXYHBeQgsmzPb3rwjTn4slMZ6nrwlpRJX5sN1dmx+vVl/T7
	/9KO/qy2sDJ3fN1NoPvIx5MsJ5OJhl5Ia1vAOGrBNy8fgPHhcX1yd9Hg9kbnjkQO
	j9yn5wEtN/Yi4SADHGVI6GEq17I6tcxuj0kXO774qQVt4goCQGZxQHs8b6hBCeQm
	YHx0Hw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk13sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:40:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ee157b9c9so833548a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758796825; x=1759401625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkrub1vjfp8/J5x0I8lwP41qVsopVVAqErZdeoHT7KY=;
        b=QdjlBzpeEeWnrVCR5HhxysA0mX3YC0CK/xW16xarZBL9BZpB2WZaBFvosv3iPi8jZL
         Fs1vPunE+TLp94Ov4ZgadtQ0EUCZHEWNa55fafQJ/aTR1G2UMaBpgf1PzSJKBRhWEqaM
         B0IY1HB0Od3HSoqZgPPG+W2n08qs3hN1osVJh7qUEW73JuLMXsz+zUrz6/fU65ospSpT
         IBTyu8+34q6mNh/sXFddbWxSLwCEX+JP6X/uaig4Q79OL5h1oUYd8O3yHzrT028Thgdx
         xVb0gApmbhkuqe3xb+wV9dw3Q0RZPBXzBXfJlp9bJ/Ae5Udmn5/M53MJqKnRiSDzzf5Q
         fsbQ==
X-Forwarded-Encrypted: i=1; AJvYcCURPh9BCoXvAGEOt06psffH2nWrWV/SI4ua/De1bZXYsugHGkbxvjH+KLF9shaOjcJ3HpuDLRxkgIjDSF7T@vger.kernel.org
X-Gm-Message-State: AOJu0YybZYKpt/+OytYyHcnfA5GN3pfJ8E5iVOunXGrDAN5Atm42VQ2d
	k6hgYz74UXBNpRohTBfjer7NAS5aMrwS8K4UotgzBZdxa35UtPwVz60yDsrZoj6j8Z5C/Je0c9q
	qVxC/sTnyDGNd0FeBldssR4/FH5WlxfM7LWWYswkwDJiVeVMvRR5tVokEHeAOiNuSNGOA
X-Gm-Gg: ASbGnctV23bzbbG7vWyLsJCtgm40lpVXJqyk+OIPg3UXGeywoCCT9lajPH6efxm5yPs
	bIBg/C4oT7q2uWMkenETZXX52N2bHHqju6sWCoZvlQvcZGgtClZIUQmJtxcg53f1f3idL0iv7zJ
	rqefwuB/QhgcTOb7oEcQztCrj1r/nH/ebH7RViG4JbNeYDiK3A4yTLIo0CqVam4xI/huuBzvzA6
	KXPzOubFxictKfxpmtBmTYj+Vop1IPn/9RkJJswBZ+a+0XaVIOtJ2/KzcEN10XUhJXdkqvd6YqW
	7ndlf048CyevFrnrPJ5DMqIInxk51Fcr08id1UQa1WNQvB2fX0nymNXi0i5LJPUaSVp4ibRHWfM
	=
X-Received: by 2002:a17:90b:1d82:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-3342a2c66cemr3725552a91.33.1758796824600;
        Thu, 25 Sep 2025 03:40:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGA+HMhVlFvkRg4P3UZGYiYtHq2iFZKBbWgE6XeeuHnOxopWausReC6LBLc/123h2UNoU/UQ==
X-Received: by 2002:a17:90b:1d82:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-3342a2c66cemr3725523a91.33.1758796824131;
        Thu, 25 Sep 2025 03:40:24 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be2073dsm5353299a91.19.2025.09.25.03.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:40:23 -0700 (PDT)
Message-ID: <41adeb71-f68f-4f50-a85f-5c7dfb5d587a@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 16:10:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 0/2] i2c: i2c-qcom-geni: Add Block event
 interrupt support
To: Andi Shyti <andi.shyti@kernel.org>,
        Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
        Viken Dadhaniya
 <quic_vdadhani@quicinc.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
References: <20250923073752.1425802-1-quic_jseerapu@quicinc.com>
 <eobfxgtssuiom2cuc2zlsvc2hhyi2jk7qb7zydgo4k5wwvxjlz@nksb3x6p5ums>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <eobfxgtssuiom2cuc2zlsvc2hhyi2jk7qb7zydgo4k5wwvxjlz@nksb3x6p5ums>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: --6uEJEo7oqW4_0nSO0RtJFA316GghQr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXzLXoogHuO8hl
 EshNBlUM3ScGngHGnu50+XRFNuLbC8I3TCq2mXB2ji0S3sEhfycqIxDtUFy2DUXvy0B7SP3gM6y
 e93CtMbN+XLbsq/yhhxhZvyDdDvaBk0d8RaNbx5TD23yN4SXdtwjAqX2Ct7lSszGf3kdIkxYZUD
 0itAJRT9eCadFGlHg382uBHVf873qRMkhMJIl1izN1F+iRvEphOqX/YCod8PhPig88rjwxOYN5F
 SteKVYxqFL/+qC6d7SdPomN2lBukzHKbDzjTZ3ZBuucAGdP81/Ei+SSlgv3Lw9EaNG5N3F3JiIV
 GFUWHGCxKFsSNguJWTyBuV3yYnuM16pOV5Fd/KFmHlyToiomCDyS5zvC+tfU8aezE/iRwj2ZAkf
 FHOHpVN3
X-Proofpoint-GUID: --6uEJEo7oqW4_0nSO0RtJFA316GghQr
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d51c19 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=GtlKhm42p6TeGv8Q4b4A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011



On 9/25/2025 4:58 AM, Andi Shyti wrote:
> Hi Jyothi,
> 
> I'm sorry, but this is not a resend, but this is a v8. Other
> than:
> 
> 1. commit log in patch 1: removed duplicate sentence
> 2. use proper types when calling geni_i2c_gpi_unmap() inside
>     geni_i2c_gpi_multi_desc_unmap()
> 
> is there anything else?
> 
> Please, next increase the version even for tiny changes.
> 
>> Jyothi Kumar Seerapu (2):
>>    dmaengine: qcom: gpi: Add GPI Block event interrupt support
> 
> We still need Vinod's comments here...
> 
>>    i2c: i2c-qcom-geni: Add Block event interrupt support
> 
> ... and Mukesh and Viken's ack here.
> 

Sure, I shall Ack it once your comments are addressed.

> Thanks,
> Andi


