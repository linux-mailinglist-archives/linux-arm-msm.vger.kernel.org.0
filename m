Return-Path: <linux-arm-msm+bounces-66657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC460B119D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D315164FF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 08:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DC02BEC59;
	Fri, 25 Jul 2025 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N53jtd+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6335A2940D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753432412; cv=none; b=rn96Bo55ZZdaadA9NL8PoGL83O2Iv4tSUk27u/5mKmr7VTVMgJBhiy6oIfdQxT+7zLmogDUXB6Wmcb1lg56aq4hQJJDugaivnk/uEIdk+ublMPIwrHVsRGztuQinlNudvusXlo8ObJblXwaXM47Lf8dk6FIkAlBxoDaLcPR6A04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753432412; c=relaxed/simple;
	bh=iAj/HA7WjS9k1PkGV+APIrGnyZCllylzuaEm7LCr5JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFnNr/JmFIkt8Vys+JgrqpBHeAVrMCdlay84dYjz6d/yHpJ5f69Yt9jf0LKy+1WuS7PcQap6qhI0453ZQKfVfwfyCUvTJpu/ZS8DP/+vYMh+7tLY8Lkqz1oMl8KkCLTsACFdrDdYuRuHHHsfMFTpmLI/N861/0O/kODXnGPTbDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N53jtd+A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLrLhU015866
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ICDsXa1i4umW3fubthp861yBxgmGCWIxplYWJoaFxA=; b=N53jtd+AjsC96xmd
	idbHzzLPyFEZlXIl7CjAM3sZylXpbE7E3fU8GkbacRJiu/zkFTvQ2TEVDpII95Pf
	3Mb/hRPBuhsk89riNvZSXD99qpvvJlVDnnSOPV/HPmzS8Zt17wNModzMuhwr+KZK
	1D65IUzJu6OLjQcUAQp4pknEpQTny04Ca/JXOZgKUDWwaMtWyK87uRxgSVrApE1o
	f/lDrzLl1y7Pf/RwWAbjm78wCAO8yyuBx56bH7Txg92FAAcwdDEBAkwOj4Ncfvx2
	V6+z4YQF0eLTHb1AKM2CygG14Dc8/3MzzIaGtDudT7t0+qvRL0LBLh/7WBoxOu0X
	hlIb6Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w501cxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:33:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23dc7d3e708so14271735ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 01:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753432409; x=1754037209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ICDsXa1i4umW3fubthp861yBxgmGCWIxplYWJoaFxA=;
        b=iS9aAh38xiDm2/+DRDxJUPVNfNy2MYQJ4j1FKW1wKGJKnGEcyNGjhIhA44dY7yLmzI
         fTn0E4eS4lwEQE+bkBKPrDTeYn2oJQEVdxxo/NPIiiq1sBN/wcJ9tzCgah5TZEilaUMd
         M3a9t3/Mm2b1NIUQ08QfjuQ4mQ82sMaYLMoDN8/yBA2E5eH7exqaDyXMS8uP7RdtxrA0
         shNs2LWu1+Q6vceitrIuLTx1i+/nJ4rY0HVhQ2Pg7Z9/NY0IbdOrhPuByWksbZXeohUf
         lOL+1392PY3ESDQsRCvaWSBSjiqymA0dl8PaTNmGumPYmN7UTlxAIGKLjDgJgNaNbKcK
         cndw==
X-Forwarded-Encrypted: i=1; AJvYcCWyXI53iU3Z+4wqb40Ohh2BUaKhPTs6PFZ3SpEr87izc77jn5gbfioq0mTc9CvVxuVHJZVvi2dMqMS7pRJH@vger.kernel.org
X-Gm-Message-State: AOJu0YyeC8u63K+WFlccjCoCxCszHkb1PdXazFwWjUrtJdJgeRtKunMi
	TzVPKre+t708nxEqBJPGYjNP/H+9eDhN1tgJvZc9jZrsKCPJHxSHtghs06WS0LMhBtyjBzRtIsv
	0DqQ/Yjup/fb2TALxRtdn//aTGqYvCITaE5iCh03Z82E3O/WvfZdusEuZ8qsncAWDs35F
X-Gm-Gg: ASbGnctyG4fV85JqabbAuuPzMJtIPR1CpmrhiCKZtzAvCBBYMsOVuad0w9S5Wev2xfp
	5N4sY4D2NgsTqLF2IcnM7wPRvdNBs+/Gny1UMvol5b2zvEl/YoB122grsggNytYLc1XwO3PseGV
	eElbdLa1uLAhEBEYPPN/tCqktAW8D3Ntt+rQ3FKYPrCBKRqbgaMtbzDLxq1DdfEI1k8UOF9F6mO
	ysstYZ1dkR1DhoaOCOfWycDevkpSd5rMwTZG+Cadqn+qZ8yeYT+3L8qja/0wbDqdlW3wTrR1Bub
	S0QdpVj6slnDbAFYhxqfznTOQOYSzqkOVauZnko+pto9MhjSkKNTf58NbDhBV51MC6h/vrDsfAn
	u1Huuc3vm7nkzhQ7jg0d5Vyohb1s=
X-Received: by 2002:a17:903:1446:b0:234:d7b2:2ab9 with SMTP id d9443c01a7336-23fb306bcbfmr20011765ad.12.1753432408853;
        Fri, 25 Jul 2025 01:33:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6QKgVlPsDnhyH4/3bWd30JezGiz7hl/u2XgQDaPgHXQ2Rv+qt9nGM1FqaF52FEEqfpxQ3kA==
X-Received: by 2002:a17:903:1446:b0:234:d7b2:2ab9 with SMTP id d9443c01a7336-23fb306bcbfmr20011505ad.12.1753432408399;
        Fri, 25 Jul 2025 01:33:28 -0700 (PDT)
Received: from [10.133.33.78] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f35asm31914825ad.28.2025.07.25.01.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 01:33:28 -0700 (PDT)
Message-ID: <cd7930c3-4cba-4806-8653-8d7eecb278f5@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 16:33:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] power: supply: core: Add resistance power supply
 property
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-1-9e377193a656@oss.qualcomm.com>
 <b7m55sjc2rtvtelvez6sxnjvdostvxmfjhhsr4uxhyhh4bxrcd@xmioz2bsgis2>
 <e9160bb8-2b5c-4c30-b60f-520decde851e@oss.qualcomm.com>
 <fb3ielhucosims237ikv4jfp3oq6fu5ftgt2mvenj6pjmzrpqo@vip3r6qew32p>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <fb3ielhucosims237ikv4jfp3oq6fu5ftgt2mvenj6pjmzrpqo@vip3r6qew32p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SRdOJ3kQp5wHCkwwqukKEiw4D1eKFeGE
X-Proofpoint-ORIG-GUID: SRdOJ3kQp5wHCkwwqukKEiw4D1eKFeGE
X-Authority-Analysis: v=2.4 cv=bKAWIO+Z c=1 sm=1 tr=0 ts=6883415a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cfvObpv82JsDPSYmetEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3MSBTYWx0ZWRfX5t2JUW3fYvOZ
 n+SeCuQ44yHqUUnzKIh0xqyRv4Rc3NJjcqkApxE3wo/PKJNl5+NoP+kYet1XM2Ljdj0kGmR4SRE
 1i177fqsnF6IkRW4SM29Q7+hn0tWSTspSq0N30uha/D5GEdbXFLy+72uY/eG22sIyLeZt2zG8LN
 LUwxDJSlM/EgNIdKRR3/wF6AetEn4JNWiD9UBK4QPkDJzqUlWuJ3FpY+Qi7vMRBNTO4ek23/Urz
 ougznGsHOn6TJFaAQgV0sifRlyu1y2Wixr8sQ6aLCG9yDdhrs7m89Py92/4eBfRv4r3zqb63QXa
 qcFj/7S5j70oCjAu3XGQKDsxihKEO8+gqIESHQvbo5OVEOl7TjnYdiABa7ItWFehcdaMREquKiN
 DLyMqC09MrXu4WyDM1Du3uwnrDNiCYrWICyaAWu5zmcPTGK2wytyzTIVea9iWhHw4JG7U3Jt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250071


On 7/7/2025 8:15 AM, Sebastian Reichel wrote:
> Hi,
>
> On Mon, Jun 30, 2025 at 04:28:14PM +0800, Fenglin Wu wrote:
>> On 6/22/2025 9:26 AM, Sebastian Reichel wrote:
>>> On Fri, May 30, 2025 at 03:35:06PM +0800, Fenglin Wu via B4 Relay wrote:
>>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>>
>>>> Some battery drivers provide the ability to export resistance as a
>>>> parameter. Add resistance power supply property for that purpose.
>>> This is missing some information and the naming is bad.
>>>
>>> Which resistance (I suppose battery internal resistance)?
>>>
>>> That is heavily dependent on the battery temperature. So this needs
>>> to document if this is for the current temperature or for some
>>> specific one.
>>>
>>> -- Sebastian
>> This is battery internal resistance calculated by battery management system,
>> using the real-time temperature measured by the thermistor inside the
>> battery pack.
>>
>> I can update the name to something like "rt_internal_resistance" and update
>> the description accordingly.
> Your message is kind of mixed signal to me.
>
> If the BMS needs the thermistor to calculate the internal
> resistance, it means the data is either not real-time, but
> just adopting some fixed value to the current temperature,
> or the internal resistance is adopted from the current
> temperature to some fixed temperature.
>
> My expectation would be, that the BMS instead actually measures the
> internal resistance via ohm's and law and Kirchhoff's voltage law.
> So please make sure to understand what data is actually provided by
> the BMS for a proper ABI description.
>
> Depending on the description I think 'internal_resistance' is a good
> name.
>
> Greetings,
>
> -- Sebastian

Hi Sebastian,

Sorry for causing the confusion. I will try to clear it by explaining 
how the battery resistance is calculated in Qcom BMS.

In Qcom BMS, it uses the Equivalent Series Resistance (ESR) parameter to 
represent the battery’s real-time internal resistance. ESR changes 
dynamically depending on factors like the battery’s state of charge 
(SoC), temperature, charging or discharging status. To estimate ESR 
accurately under different conditions, the BMS uses data obtained from 
characterizing representative battery samples, mapping ESR values across 
various temperatures and SoC levels under charging or discharging 
status. The characterization process with those battery samples on test 
bench would use ohm's law to calculate the battery resistance I think. 
These data points serve as a reference for real-time resistance 
estimation. During operation, the BMS software refers to this data and 
adjusts ESR values according to real-time inputs, especially 
temperature, which is typically measured by a thermistor inside the 
battery pack.

I can use 'internal_resistance' if you think this is good to represent 
this ESR parameter.

Thanks

Fenglin


