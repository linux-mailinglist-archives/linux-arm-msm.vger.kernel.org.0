Return-Path: <linux-arm-msm+bounces-60272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CAAACE9CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 08:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0EBB16F4C6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 06:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99CC1E521E;
	Thu,  5 Jun 2025 06:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdpBg1Eg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE861E8348
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 06:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749103728; cv=none; b=pAGIFiLZuf16NuZN4zUP6x67rs7Jhwe68q2N05GSeGXq040+A6R5LDbgJjTdmjonYKZRJBrrIwD6dWlKo5NA03bZD++2PYzqg7kzaSssIcF9vfjBp3++t1RrpjsdfzlXPpFdJdUdlIO93bYPhh6s5zaiNXk6q6KS+dxfagbvwGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749103728; c=relaxed/simple;
	bh=obxsLj+ybBp5DKxbHvEzq7j6OJDIdAWkKYrH0UW56Ek=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rVXv6y285cdWP6l22GpVOkEV4inEJEGBobdWtmamb3tp2APNpRGU8+751hAFEirfBPVZMQ29GJpu28jgyb+69q9YlMRnRHZ8GC0nZCftJdYwJzQFZaacPDUMGzP54cUHKHipe7EN/ThqSssu2ZzfSVAS7HGE7JoD3sUB35NYYvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdpBg1Eg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554HJJNO027554
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 06:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuUom1uLViLFA95wFkHWrXsNJPx+f0un14vZ3UUQFxc=; b=HdpBg1EgCCkGTopG
	1I6U3YnyLIXjqCHAHCBALdMKIhi8SopUDmIeIrQRUDIlNqP9gNDdxrqobDV/RjWW
	GXlFKNG5UzrcO53a99nd2WxgUG29iPXdcEyyvmSziUAWk5M4GEzWi9xR8GIvWNU7
	8t0I85Jp6GxzSkFaOFBV9kmZM7YMhNAVArJQceNfI1mwv65iqGNgWKaGkkKJJSx8
	9VbwXsa6txAajJXK5xxvdm7wZ1qckie+8Y8bNIEeMOpy936Aureydwovn0fA158j
	7syJ8SvibACynGseQowcg3acKMUPn2mIU7jTMIdcz1Gb8EUIjN3viw4J5ONyTSeB
	0uAFmA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t88j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 06:08:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742a969a4d0so650820b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 23:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749103715; x=1749708515;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuUom1uLViLFA95wFkHWrXsNJPx+f0un14vZ3UUQFxc=;
        b=KTiRuXWCZle7qUdX91OBXNSAWAJXEzHt8D3G2v/n5jvhSt0Yj7uwF6XpoFfo1M5nEV
         AX9kXpmRhC4rXuoHGamKhz/fRKLGI5wOGIEiuEZsAod9J0KIG9hFoYTtInI6QIAnnGJc
         /i7aheaSbDUm6NiosqAV8rPunLMHBTO61zPxVdphGi6/LulH6JTr+HM9KE4XaFeOo3tI
         VOx4W0xauqiRTdNOoRkKa+5JbmfnMfnvNP1QiLoJ39DjCDoEhaMOsItJH2VkmxB6Ozqm
         qIoRH47VGvT0fH1RfnaOQkES1wP6JBjFTdkBKIapg/sDFUJQDpxKLw+llf6C8AARmLcH
         D8xw==
X-Forwarded-Encrypted: i=1; AJvYcCVJiVnyeqY36q27DcbzKsLFSOO039uBCRjzMqr4qA8IjT37GFtnScyd70h9lAsvTpSIk8BwnRsnjxaB6PYd@vger.kernel.org
X-Gm-Message-State: AOJu0YzR1RQ/DwrtdBxdulwITKVkUKC2iJvJQjkcrAb2aXxlS0F0IBSX
	YGkaBv71Beuy0sHRH6qXoBw5jbCKxAFO30tEDfrggkVJqt4TVWEP2NxXPa/t2xm8fviITdHHpHa
	NLXvA2xcLl9bNAuqhiAb0VBd5RUXkI5HJP4r+zqYz0/imEepuC5j+eaRI+HlztuDwiOvR
X-Gm-Gg: ASbGncvSh+9KUpioHxAkY0dxkbWSX2SYoFzwcE1aeBnNcgG2i/kfBIVkkv+p/ZHuexL
	yyXzuzvLMlWPzOeThLQRe41Is6Q9+coZ8U9YHwx5+dSPaa5fSrYdC82Q6bXF369KPz8988ay7xJ
	rKzhz/vjcPzcogXOTaZQ/k7DvO8/mlDgrgonhJTe3prk6d2uxIuX9qJ9+DnQqmrvb0/aGEGl4a9
	BzmJKcPAbhhZf83pWElSucskL/9ljH1WBTIDoB/2j/+B41nNgrnwpZlAlqaSBC+mCpnp2yjg//o
	OrYhSwf3sVCWln5/krOnUNC3DECqC8yz6O/7jOsY9Vlud9dSDsNXcM7GnevW3EpF39n8SKr7Hfn
	Z
X-Received: by 2002:a05:6a21:3282:b0:204:4573:d853 with SMTP id adf61e73a8af0-21d22bcbc4cmr7791387637.4.1749103714907;
        Wed, 04 Jun 2025 23:08:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu82MVDHVKpp8Ta6NIo45ITXBkJKjQdLSDIXVXjZuHMYFztmtVjRfZs6jpP6ebX+etviRsgA==
X-Received: by 2002:a05:6a21:3282:b0:204:4573:d853 with SMTP id adf61e73a8af0-21d22bcbc4cmr7791349637.4.1749103714526;
        Wed, 04 Jun 2025 23:08:34 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafa64sm12497732b3a.93.2025.06.04.23.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 23:08:33 -0700 (PDT)
Message-ID: <994cb636-50b3-40f8-baaf-0b1afa2e7f53@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 14:08:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/8] power: supply: core: Add state_of_health power
 supply property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-2-9e377193a656@oss.qualcomm.com>
 <6oixvnhihgjucqaovkayzm6cpi35jfmtwmm67wa6h4nlmhr6w5@ggb7auvjzos2>
 <cd2964b0-e28e-4ddb-b319-9b65fb78b73c@oss.qualcomm.com>
 <p5nxjuexggzxttislcaum7vomawnq5fncos7itfib6ysvy6a4k@d5ywmfpqyk3s>
Content-Language: en-US
In-Reply-To: <p5nxjuexggzxttislcaum7vomawnq5fncos7itfib6ysvy6a4k@d5ywmfpqyk3s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6841346e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=ocYFPldkPzyi_qN8VkkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: -GJYFjET2owtQSH5b-tBYXQk9eTznADJ
X-Proofpoint-GUID: -GJYFjET2owtQSH5b-tBYXQk9eTznADJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA1MyBTYWx0ZWRfX4TnpoXozB26l
 9tv3FbPNhyj02VczLM+R02rz0fp50wNGruOPuj1FsuAhlapVQiTlMRRnIQu8tECSHSqLWJOFpby
 NDzXyk4TzeW6XzuIrsNtlGgbNUqE8UjXMYYci+NoWfSW+CKTIljKvauEyV6mxhiqVsNox+oCVW3
 8nASvNQoytirq1nFUs5Ad77Sxo0+SZ7ebz6mJiTOG/SSQojkqXtwjWNzBRWgnQybrEJpm7RdlGQ
 ViY74lLB7millnkFG/BmJFP+Y7rIO95EKV/v9UujP1T1ELeSJK6jIXolP6lrdYoRtRvc1ERHDeV
 cw2s0wcGrf5u1vl71D5AoftCck0EW45sdNE6Ox6e6VW0xhyDEKBY0FQTUqRceY74FQQ1NYXEXpt
 TTizq/nGSs8gseLcKKEZnf3B1qhTVm+0p4qYy9Qp5DoTeKQ+Gv8EmEfx/usoCgoBg/aSVIJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050053


On 6/3/2025 6:35 PM, Dmitry Baryshkov wrote:
>>>> +What:		/sys/class/power_supply/<supply_name>/state_of_health
>>>> +Date:		May 2025
>>>> +Contact:	linux-arm-msm@vger.kernel.org
>>>> +Description:
>>>> +		Reports battery power supply state of health in percentage.
>>>> +
>>>> +		Access: Read
>>>> +
>>>> +		Valid values: 0 - 100 (percent)
>>> What does it mean that battery has 77% of health?
>> I will update this to explain it better:
>>
>> Reports battery power supply state of health in percentage, indicating that the maximum charge capacity has degraded to that percentage of its original designed capacity.
> Which basically means that we don't need it in the first place, as we
> can read capacity_full and capacity_full_design (or energy_full /
> energy_full_design) and divide one onto another.

Hmm, it is true in general to quantify how the battery performance has 
degraded over time. However, estimating and calculating for battery 
state of health is much more complicated I think. I am not an expert, 
but as far as I know, different battery management systems might have 
different algorithms to calculate the battery health and report it in as 
percentage. For example, in Qcom battery management firmware, a "soh" 
parameter is provided as the battery health percentage based on the 
real-time calculations from learning capacity, resistance estimation, etc.

