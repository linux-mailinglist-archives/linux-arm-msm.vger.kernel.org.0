Return-Path: <linux-arm-msm+bounces-62083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D015EAE45F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2D03445888
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97FA2550C2;
	Mon, 23 Jun 2025 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DK7GbNpc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5E9254AE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687116; cv=none; b=KX41CFvgSWHqaoQ89GYuh+1GR0S9MJ+Z66/0zZZyVGF3jJxEYwVy3FGjIe5YxJreVfnDwokagX+yVBv12KE7FwABsImkG21FraqyzxRyvO9YjZ/MV1gwcqXnZRr7vvt2pqH97qzW51v07zTniEPdZXCgaFvYvgcn4ZrcAdR3TDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687116; c=relaxed/simple;
	bh=z7xRW/zHgqmPhcHqJRBygp5qO68gNdSDYBspX0f2XUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDdoK6SugyKJDO6QfkxbTXjc9jEFqyFCTf9LOzGKGOi/pM6KjLETdjqpH8m/+d6ww0a5bLKNL/y1gwR+SJstsVsgBvIvxU9p813RW9IC42xb3piaSUY4qoHZFAuP5relXyssmePoTca/mwPBOfCHIPeIMJabFbZoyplx9AG9vNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DK7GbNpc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9QG4o012695
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVPZjTtp1XI2FupP4oz954O3iw9aZ3hAniyWNapzx64=; b=DK7GbNpcZaFHiJ63
	1jj2VqudphMJnRJdIYUaxmX7dxhdHWTIY0OS2nDiN4a61RVr8cu89xcRyGdgmRTa
	GhLwq++sMu7DgR70uzwptTFprZjMz/Ah5WaMes+sDFnu9AYuO3BOB8lbeI5dP24I
	RX8mK20MwZDrbp6KsLUZXEiHnJE0PIWQWunUWX0z7klfvXVz7Llg8dnov2KLu//P
	AQA3TRgjUd7dn/XdqX+VurjV5xErBCBM0sCuSEgHXpYH9YVSqtqjcXSwVSgFf6FP
	PHUzxQ2ntcw78aS+p7BIhuDo91BrTmR/Y+yL0JOHZ8tNKYxDh+y8tIlTYIn7ILCu
	Aa6I/w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud0a1fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:58:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748cf01de06so6097061b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 06:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687114; x=1751291914;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVPZjTtp1XI2FupP4oz954O3iw9aZ3hAniyWNapzx64=;
        b=tDvZ+2XTW8RvoKtdeUIE2BEAnl5jwAk5bJpq4gVItClm0mRkZAUeVS7N1hDlU8F0Xl
         aJh0t6MaYrhcZ0Ply3pK3HFjRtyADJBeTcKHVtlnGn0+q7anDt7Gsbm9GDpMr5TxW5t8
         kZ9e+tAlbslcrhbwrs4yFULYQcGlkdT2lpUoBqe354O7onQk4ei8eGYRKTThi8zReOb5
         BWTUN+Ueq6rFnj17g70AT5nPJ9ir7faxxJRwgnkvahI/h23s4QQx2vvCV9oJ47oaq2S2
         vBUxjwCTQ1cDYNdpRRQ5C7+OIGLxOwkOQLKE4Lw7CqjBEEFglpVvPqQr8J3g57gtiL++
         0zYA==
X-Forwarded-Encrypted: i=1; AJvYcCUfzKrg4M+cS5tyEvHcixTDBEB+rN2LCOGOxNcITxw/wloSwa+123JMwXxGjHgTpS9jbxnYdQFp5bweX+GP@vger.kernel.org
X-Gm-Message-State: AOJu0YyMfH3PpZtWdBS9plL1JxWT70G5/kVSb8C3UFunAerYGXLVIyGP
	6/OBcjdf9y4wNwcdyET4PdOQhuOIMLpHulEUlWrj3GgrgCDosK/f3rL0wyDiqTH005chFbUNMMv
	5i5WbddwAYNtwXNDStpyVhfN+Nfac5UA1E6EknHeLU2sboXhFdL1WGX0Aq9mGwou7K9uZ
X-Gm-Gg: ASbGnctRPnWRArgKFuvfaBRo1ogEjt7CPrwoPK0guwPL6JjUJWQyaBBmJjJaAVEvh3L
	bKsasgjhI4uy4qZhZGNtaVJ1CnkOfa3YpyrO48fW6lCHB2rg0tPqh6fnfRg8lwPt84IIDhH2X6P
	xs1XDdzigovgv9l/pPtt2wbcifncC6mYCrhTehQcojGXiv1zdhANro1IRNudJIAJH0KU53a435A
	2UdKYltLQ77Nv88nG53diVctswFL4VDLyPQVloTAUq3L4z21Fa9FNKoor9xRu1nySMRe8X6Y6so
	Zmg/I7f3ghawBn78NnhLdgqPMQ80NyQuU5f0wSlFSQ==
X-Received: by 2002:a05:6a20:258a:b0:220:19b7:9d6b with SMTP id adf61e73a8af0-22026e3fc69mr18664053637.9.1750687113763;
        Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVl1R1DUJMadEXAlc5CPHNyyosQFNPkLwlX/IE9EL9s6zL6fnh2dV9q0vTc02V0SmdWqoDwg==
X-Received: by 2002:a05:6a20:258a:b0:220:19b7:9d6b with SMTP id adf61e73a8af0-22026e3fc69mr18664002637.9.1750687113387;
        Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
Received: from [10.204.101.81] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a66622asm8539213b3a.137.2025.06.23.06.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
Message-ID: <e8653c35-d6bf-4992-9edc-414309768bfe@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:28:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-2-56398c078c15@oss.qualcomm.com>
 <66094c33-07bd-4621-b49c-b29a0270e002@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <66094c33-07bd-4621-b49c-b29a0270e002@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fjADALIoeTbpqlPwngNFo8hEqAG3bqOW
X-Proofpoint-ORIG-GUID: fjADALIoeTbpqlPwngNFo8hEqAG3bqOW
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=68595d8a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=Od58GZWkWy8WqyN3Zg8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MyBTYWx0ZWRfX0Srl+ii/9X0K
 KwX/DMBpq8nTPNW7Lhfbp1gfQ/LMfWkvTWVqIx0VjC35nTJWElWz90tv4atdGBJ1H3lTxJoZYOO
 ZvFvpgI4p5Ub95rZGmKjGhIWQm5Yr93RtvqyTClh03XKYdpZPeGB0QZYjz2hSt72+B9j8dE4/yA
 olCGkXqbAm1Zs1u9sF4i0tRq/kYIsnMQi+QAmgniXvhaL5y1r0XbuWfnFctzos6jU12h5rEfMoR
 YU3C6JbxvS7GKjTsgFAeTXv9wnt0nm/lFoMX+NTnv2crQQZnwl+nXnYlZNqtTt/lqichUpwkmJm
 KSApqgkmEITIUWqAKv92IFcgwfjuXO4f2962wmsiD5YIlCPVV8zkK0f88AHcF51Uv1G3PvxIG+0
 nSj23y6Hg+OdCKSSyx/4N5FA/0cX1Wu0UpSuAn3sE8b2oMKsZnXzX8IOR4QqoZkyWj0c30Fw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=670
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230083

On 6/20/2025 12:39 PM, Krzysztof Kozlowski wrote:
> On 20/06/2025 08:54, Akhil P Oommen wrote:
>> In order to enable GPU support in X1P42100-CRD and other similar
>> laptops with Snapdragon X1P42100 SoC, enable X1P42100 GPUCC driver
>> as a module.
>>
>> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Defconfigs cannot be tested really...
> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 897fc686e6a91b79770639d3eb15beb3ee48ef77..ccd03ab5de495498281175a4550bc73d3e65f3f4 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1347,6 +1347,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
>>  CONFIG_CLK_X1E80100_DISPCC=m
>>  CONFIG_CLK_X1E80100_GCC=y
>>  CONFIG_CLK_X1E80100_GPUCC=m
>> +CONFIG_CLK_X1P42100_GPUCC=m
> 
> Not placed in proper spot. Don't add things in random order, but follow
> savedefconfig.

Ack. will reorder.

Btw, can this patch go via Rob Clark's (drm/msm) tree?

-Akhil.

> 
> Best regards,
> Krzysztof


