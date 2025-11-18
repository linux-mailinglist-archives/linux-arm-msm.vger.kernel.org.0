Return-Path: <linux-arm-msm+bounces-82250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EE7C68C18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 226BD4F044F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF2933CEA9;
	Tue, 18 Nov 2025 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjgurkKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JM35XhEN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A4F33C519
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460947; cv=none; b=rwkLgotbURtSZ60Nt8hda8jTBJfO8AbCakR/PAdBIRwYgJlEiRcJwh7H5Z/o0PqqZ0dMoaGmrVn1ETtIEt7YEsvl5IKOR3TtmdMAwe5rOI25qXhgvf2z7V1ZfNRhUp8WsPKorxnxsgbfQazCHsTy9DjZmgVYyjFF8gjzKtXwRWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460947; c=relaxed/simple;
	bh=c923FaPe8OSR9sNjvZZtRMePKz/r/WGb/uwdhb0aNn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=maWJnH6dHGs/nRabQfQDzFTImn9xzBIhf25mHWNSqlIz2l0Ymb5Z8qk6U68db4cbA/6fsMAepmbAs6RVLrqIyVg/VEYH0UAxYLtymwWwzYiKnGKa1eiAWPKZlblLgtX/LIi0a2W3Tl4///KMFHIWvGi15tk76XNoXw5Y83uBAHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjgurkKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JM35XhEN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8DwQB2194357
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xdt1fJlBHJiF6sNH22KsZAxFYSV7wS4ZjQvnqORWHpA=; b=UjgurkKY7OjlI1XZ
	JT2QbRrUtHlag4HYupzSDHT5HYNKmHnMBOlz7Fn6AMbNdUvK5o44gy0q1kCpOE1l
	K4xMaYJvhy/ItHv8j5joEjxuswOsSMpMEbG7b9KJBt03/9PbBBDQjI/dCF9ADAlg
	k7WgO6kWTW8/7OwAStX93bPwQMZ5H59tStlqvAVrvLSPFIcjvQyoVqSLroYsSQr/
	Iccca/zSI4jZCk961dX1LUHFZuN0u2IQFgme6A7/WfgNQY/RBfPhkC9LR6bulb28
	YIoFBzgdtEdxx5V36kiRsMSwsiT6MQUQORGChUceDKAXD5HAIC1XD5qLKlBOaKyq
	/pJ30g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y8cng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:15:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f8a2ba9eso142176955ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763460942; x=1764065742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xdt1fJlBHJiF6sNH22KsZAxFYSV7wS4ZjQvnqORWHpA=;
        b=JM35XhENh3ds2+l79NC94AmhOjI3aA6fKPLe834sHQEaRcVDrww8UNWF9cueKO3y+V
         0rsvNVD5Cr0/BXykv8k5L6+PL1+j/sdTaFMeLq3Davil6yAUydpwEFIW/bDqQgrBNslm
         UuNAH79vsXrWiiUKVIk74+foJ50afolaFI6/gneu8I9PJ1C50z5fsc0DmB8lEwWUSbwz
         j1rDUv+EzRHS8Wab5uMlAEqcdtHh8kPcZYKarJ9BT4zppkGRh8KYYOjnFYMFzsKId1ie
         joLZhvocbZMbTjUi0zpUXdHfDTGnldwAbRxHJga5NeE3oApQy5oCZu8hQn7NkV0ts4J2
         LRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460942; x=1764065742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xdt1fJlBHJiF6sNH22KsZAxFYSV7wS4ZjQvnqORWHpA=;
        b=Nq6ANMiPb5GT1FrHdm5teABDcz59+vZLCPdp7gEnsTE2Rs8O7BrURJp2U3UAnKpMD0
         WowWqu/b3gjW/afaA1+tTeGQQAyZ+RMGSqoiOd4b22kFgqAz9t8kGY6xdYxnAYSF7e/D
         lteiY1VVxfiDNLs3mvrxAfp/88TcEnsEanMPHO0YZTr7yvvwhigFeQUQTQ85/ozzuGFQ
         CKz/S891HR6SjAbbyunfrYMiUxtoZCNBhwuZujMkf74UJK+IGSTnhauzUHsi28YUdjeU
         iuSFuaaJs2EcJvOCLSH8mhkAyrvoW4oLHhlDdW77i/+MQyKz5MPoSCTKtDN/ZtMm+Fx/
         ckqg==
X-Gm-Message-State: AOJu0Ywp6kN7QtRGF9A6LbLE4RSojmzXwujN9rF8i7oE0l8PCI2yaQ8C
	IcJ19oZftCf4qgt1I2bUJh1idL83wWeQj1QxrO+28/4ecLcvhLskvZ1b0Y08ctzC1XjmldsCqPA
	4vuD6eSdFKYQgMU9CuC3wZHqldFsWfTi85H+d6YjVlkTVjGXVswn58I4Qo/5X/6U1T65G
X-Gm-Gg: ASbGnctVqXDHpp36tmAaGRkB7Pbt3KtELamMK9Fm/OsKqG7F5LpC/2sNsC+DSpT8Z6A
	R2m5X+NEvD6mpN/m78yOnyxWt1+iHdIcfqmyrtZB6thwG6iDvzzKDujIU+su7sZiJmBlbui/ny4
	2AJ8F+KZf1y0UurQDfOb0Fy4MUogCdjrOmxzGIU222bSu4W+uI1o4RohyxQQmTx3UAbwtaZhZfs
	y8l35Om2quKaY8oo9zG7mgvgmXj2pDFti12/qGBxTVQ/ljQoXrCTYFOvYAOqyB0WhqgAJAF977Z
	SG+LOSFxmG4BNHlSByVdF/5oyQ2MG9ZtY9GgaM+PDVS6XFax3wzf/3H14SViNf/UJtznKxSou18
	q207o+zuunds36SJsNrcOEDJzIQ==
X-Received: by 2002:a17:903:3503:b0:295:195:23b6 with SMTP id d9443c01a7336-2986a758e70mr174608615ad.55.1763460941907;
        Tue, 18 Nov 2025 02:15:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTfcp3k2UslNU1yGdZvu5PH3mN8YLFFD8nj0ilfWjunS5RIxeZb7YRknx/hk5woyr2UzNREg==
X-Received: by 2002:a17:903:3503:b0:295:195:23b6 with SMTP id d9443c01a7336-2986a758e70mr174608205ad.55.1763460941430;
        Tue, 18 Nov 2025 02:15:41 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b0384abfsm962647a91.4.2025.11.18.02.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:15:41 -0800 (PST)
Message-ID: <0090f38c-b2c5-4f8e-8382-ea6fae29757e@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:45:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-2-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-2-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MSBTYWx0ZWRfX/1UmeQf62URV
 3Hl0qmIRg5jAvfKfhkxsykMXpyOO52qnSCxpH8jMoBMIKoh7Z6AgrBSFvfghCjy+mpfU/mpiS1H
 VIeYNTO/6OhXHxX8XLt1Wa9N1PVmJjTYC8e4yyjnIdkmK3sfBataguyEc5dPdybVUW1P7/p0HLM
 o07xsdnxsLrrcaBmht6t62wW4AXoKFMcyI48OvmpaPXSPJC5zZwfVshDLqPwz3b+DGQIdh0XURR
 /DtSp0jLHupNrF1PpXkhTBJV8DR3liT20iv/omilyfo9lr0VjUROZAccBkQeipYqostH6bZaNrM
 gt6Vr/Ik7mJvU+H7Mf2tTbqFT7oG/QJ8KHnJ+dSQZECj+xNk2/5pM9qQGDAPcR7H87XKy95DW7e
 XAsyARZEix5W29bF9rgiJda7mgxg7w==
X-Proofpoint-GUID: YPS510cSut8MKQYpZ9A_qn0ugzQ-WEPs
X-Proofpoint-ORIG-GUID: YPS510cSut8MKQYpZ9A_qn0ugzQ-WEPs
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c474e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dIrJftJwEK3lONcwLLMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180081



On 11/18/2025 12:47 PM, Taniya Das wrote:
> The ECPRI clock controller’s mem_ops clocks used the mem_enable_ack_mask
> directly for both setting and polling.
> Add the newly introduced 'mem_enable_mask' to the memory control branch
> clocks of ECPRI clock controller to align to the new mem_ops handling.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/ecpricc-qdu1000.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

