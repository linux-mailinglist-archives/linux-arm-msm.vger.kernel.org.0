Return-Path: <linux-arm-msm+bounces-83410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A7C88ED7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B0C83B05CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3B331618E;
	Wed, 26 Nov 2025 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBXUk5qF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdEFaUFK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1DE2E11DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149181; cv=none; b=OtXFQoetyzPZO81qDl6pRVywrO+Po5V/EdraFCtiVQDcH8iUO71lUrUmgxkgyBNu/+1hcL2KEWOBB4LatTbvifROA6LzqSabhN5ApsF6YWvEwiEmtkJxb0i27dg1+ssxWnz0Z1b8nQG2hufZgfAQy4qkpzepnuU+O+ksKfwRs3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149181; c=relaxed/simple;
	bh=tPPBnOHtxc5hH27MNG+P8XI8vzRuVC8VCoiAo0tkfzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKPVDbrSQhiSLoxicmcDLbVxEy76afwhzDzWlVkix2zkgEefrSKTltdjs4En+7QzvKMlEv+c8Z/VfQtPtp3LanNz2CF6J6GoZsB9b+Zl3W7CD3m4ufkHVp29kXqdsYiTIPuWBpQXDltm8P2oyKM3GKPDvH2xwaX4HdcIQ33y97I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBXUk5qF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdEFaUFK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ5wfK23587283
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iOIKvIOcVxDrUGn/bUqrTJcQc33DTYzkdXT5RdWu/o=; b=CBXUk5qFFQ3ui2Ar
	1uDhwepgq8FRIxBRCOGCkusZiCtVCJngQzWZiBPdpzoe7zYMmHutCPdn2ssgk/cm
	en/aGJe3EcFkchHE5ztaf7kc/j9yKVEakzR7Q5hY04M6H3yEjA8dV3BkS4DA9I2u
	qCm7xmtwDs5UbdYzLu/zT59VniFw/rKGvBOXX3gmwVO2AOFO/lbFojSNcOE0hcgH
	uu0wysrYxcyKYJlO3t20XBKfJZGd1Cyz6ZPdAkUtm51iWkX+ksbdnP5Dy+5dQWx9
	mdKL9QCK9oFAuNhyaEUO/9Kw8ipDTaDHHgo1WM4c6ChsB9UP4s14gKAh3MiQHuwb
	NH9r+Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ang792cbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:26:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-295952a4dd6so8858605ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764149178; x=1764753978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9iOIKvIOcVxDrUGn/bUqrTJcQc33DTYzkdXT5RdWu/o=;
        b=fdEFaUFKkZqw188oluoT2JAQjawRPwpFGMoGuairHqNYaH1nUNrpgNBWSYklUMHY5X
         v4bnnW0JSh3jHOt0AxljNIEl/uS+38FC4QhB7n3n3GC9NcNr1CaAQ5ohpCTwPZn1G3S3
         1Hxf1K6lSnZAprl+Mexy3uegy350+o8h8LBNgPjLIC0D+rjFbL4jPNjs4hMSrMjaWsLJ
         p5j+DzbcjI/LuMjM6lVtNdMEcsagPkp8JHC1NHSBEcsL7hVh0VVgP0nBvH+m164P5diU
         ZKpQsXWBpIXvO0jXkvaRt/R7l6ggsT3uIkazLriunwINPPZD6LTFnUQRkTY0I5QfLm/S
         QD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764149178; x=1764753978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iOIKvIOcVxDrUGn/bUqrTJcQc33DTYzkdXT5RdWu/o=;
        b=einBZtKR14BrsB1L78hAfG9MzvBCjz6NUm3dukOy6rOxe1mb2t9oiicpjWx74WQPCg
         8fTh7N6AfESAP1MffcTHwe/qgtXq82nPpNKdKbOS74QUE/onw0zWIdSERwqd6DNj6x2c
         VZXcakUOosIAJhyuw667cdjh3ntl1bDQ9Rjlx9ocYTRqtdmLhRxVdT18oR0mn6Eeaee0
         N4bsU7S+fE8x+jqKLGtvpvoSNoF27UqgkdM0Z6CS/jHcvl6q58k5UHydN78M0OmYiYdd
         /oNKpXzdoIX7dD6hv5CTw0Du0ag/5wl3bYz7gUXguPzfPhZ1QRBS2w5ynRuIU+vUYo/q
         NpVw==
X-Forwarded-Encrypted: i=1; AJvYcCWJqeePucy4yuO3RCXspRTPu5TKDIeTEUxOIkYBbDGvDw/TRwZljGnPHOmiRmbj2dCpEDKrDbS5v8To8HIM@vger.kernel.org
X-Gm-Message-State: AOJu0Yya932r5E34LiEnFs0eyvWwHo+QGL+1FL9yJguUDL20gV6Lvf+o
	IEdr/8acHQtxtOoU+fIOXNm7MHUmLTGQwhgRHfJfDumTuye1LPOvalpFLKehGp11uBHP8e8r/C8
	4BnPWDBS+Xps5zOfA9v2ZXRjuGqyGA9wZU6nIzZVGXsrODqym/rFZKEgEoWqoCArXG/HjwInpk1
	lK
X-Gm-Gg: ASbGncu9GJJtBqYUfhvbMhA+nGcS6nKMtEQalQgspK80Y2qo6/yZz9do7YgSkmOueDs
	yl0ECzUcE/noqnfzAb5ew3lGHZSXxuiSKO9w05wB4FY/gLbPN4Fl9LL3DTyoh79yDK34T3Ufw8S
	eRh1apUx5gRlsrvJAIulTtuXgxpzccSWYGqR6Qld7IcfRwCGBXq19IUPqXSW87tjM/jaG40+c9I
	0ex32px4Fc26dP7xuV222RAOIglFA4K91OIbwa+FxAjwe2es1V1FTUak7WEfgGg7FDhf3lD8cD2
	WAc9/S1p7TF1C03aZz2lpJ9X/lZzCWcbViCuAliW3xUgQZOJo96i8g03EGau8S27S2dHrtjy45p
	0KoY4CDNbsh/YK0XodYQve4v2JqP4GAHN2aH+Vw==
X-Received: by 2002:a17:903:2f0f:b0:283:f19a:bffe with SMTP id d9443c01a7336-29b6bf0db2amr206246615ad.7.1764149177642;
        Wed, 26 Nov 2025 01:26:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8qzFM7CQPeyPIyM1ZH9ZWnXozvAoz5/N5dhh4bCEle4vu+aJvbhCSV8a7pDtVd/H4ZuTBqA==
X-Received: by 2002:a17:903:2f0f:b0:283:f19a:bffe with SMTP id d9443c01a7336-29b6bf0db2amr206246225ad.7.1764149177092;
        Wed, 26 Nov 2025 01:26:17 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111650sm186724155ad.8.2025.11.26.01.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:26:16 -0800 (PST)
Message-ID: <9d3e0fc0-316d-4956-9e9b-3bdd3d08a8af@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:56:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: Add TCSR clock driver for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
 <e177d393-de17-4bdf-a0dc-002ae5b7f58e@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <e177d393-de17-4bdf-a0dc-002ae5b7f58e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9Q3RyAu c=1 sm=1 tr=0 ts=6926c7ba cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6MFxvG5Tti7RlCfQ63UA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: T8GryJYi8oMXUicrjiqGHxqXmDALOHvI
X-Proofpoint-ORIG-GUID: T8GryJYi8oMXUicrjiqGHxqXmDALOHvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3NiBTYWx0ZWRfXyChw2Bnt3o9u
 u8ZrmjU+kmXD0TG2bawk+ZyHfuorDqHU82IW7rPZVpmZQXejF3xRW6acf9fS/m8H3F4/OtJFE9i
 juOHEwBtYygovTjHOScXQTkrUUaHuO55LVcBeBiEo0AauuIVlFs6RY6Tm69Di4wmxayO3Ha89Ha
 6xPLO4i762WBSV+KSXsU8kaSmDD5dqeXVteAA1ASzWPsuk2QM3ihtP1tmsDvbmzHGrA2Y0gx5tW
 XfZ7ilUVBKsEpEPlL2LMinDDxXqmzNIGaPldOMclwG5Ka+d961MP+guRHxQZTGciohNBcxcWmZK
 RhIcoyOvYE2BJFH9YG5QlnvvkTp49yFCJ1kq07xqna1DVlEGqhYMmnkJcuMIg5Ce+KQduvlybgW
 x1qyCxMebyhleltIvosvenRfnlDbYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260076



On 11/22/2025 7:25 PM, Konrad Dybcio wrote:
> On 11/21/25 6:56 PM, Taniya Das wrote:
>> Add the TCSR clock controller that provides the refclks on Kaanapali
>> platform for PCIe, USB and UFS subsystems.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.max_register = 0x2f000,
> 
> 0x3d000
> 

Will be taken care in the next patch.


-- 
Thanks,
Taniya Das


