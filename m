Return-Path: <linux-arm-msm+bounces-75313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFBBBA3C05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94A83382D0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F1B2F5482;
	Fri, 26 Sep 2025 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGxYuAsu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148FA279907
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758891904; cv=none; b=QsO6ltx8GWRZ+qJea9Mjee2YVc5BQp101wXN/VouLf6qw3L7UYC6oc9aW9mdf+YoTTUuSvp9+Wz3HZ8zuyeQgPqHnML8Df+awlTli0iitK/J1TmfS7SCdU5niiG0Mhb5qMyZiSQRe3DAcvj2F3F93xATS3lVyJ4CmSIBB1ihbto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758891904; c=relaxed/simple;
	bh=VxHs8m4PREdPitoF17pWmYpBT9auMCjgZ8M+ihTHRgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z28AxljMWtVhidXI51Tr5i662YSGiGK1y4oX3v6yysUc6/0zP0phIDSRjG+Q6XqOzgHFH2TxJxcxGIMB5yShVT1PcveUv5IePCLP1k5YeIlsCPsGMdf/BXKLS5NKkPW5fqqW97fWoQBMU6eUyjyBrR0qdl/yis6CnFtM/dbO7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGxYuAsu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QBAjwj019593
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AznJVNy7DDz5C/A3q06szbLnoJ6bboXOtsVavRtwoBI=; b=GGxYuAsulqkY1+qH
	jbItnFLtNE8uYsIsVZgJZ199/MwtQZIgtJsI6muuLw2GGm+/O5LpK7ZrtZVKpdXw
	0yTwl/YPUVAE282trvG4yrESyGFLD9vopvbgXmMCtV4P8aH1au9PBR0W0U7lfiJ6
	2k7zcExyyb6BC351nZ3zaOhOa7PkgObmQrBj7IdTV4vTQKIU3rUWmAsBGeVqDfn3
	YVPdP5gDw9Cgm17vGiVizRjz9hPKCE4W7GDlhWRZ6gHh7QsHUewjBQeEu+AFaEC7
	6bOK0faWmrMfx2gYSQiWNIQhnTRnELSNYru0UDMqOoRK8Qr4GpFSvl+KUP/kQyfO
	fblRfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49dsqrg944-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:05:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8572f379832so67037085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758891901; x=1759496701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AznJVNy7DDz5C/A3q06szbLnoJ6bboXOtsVavRtwoBI=;
        b=FEjj12ZylQiUqJFYguIOF/rsBdsasbfDdINsa6NHME0Zut95jwAAGcQp0wFuIkerrg
         YE0KYhX4yCqPZ9fzzDl4X+sJXT4RwsWhNQpSDcCTlPClViLulcR4RBW3Ev/f4wtiYazJ
         HhMjry//ZuLf3P8KZET5zoXRpehuvAEDBInwvmyzdK9msj5uTFi5rqwaFQwob9a6y5OV
         StgNFjX5ltG4dd74xnoCUUf2K6GQQWIJL1NCXMmJu7wWYnaf5z9dEoAAbBXftyKOJR+M
         uUp4ZBiHjSAvaOZqGQp9S+FROkFk8CYrhFIDpCkfOYUtud6DB6e4tSI0UONpiWrCgMCg
         qT4g==
X-Forwarded-Encrypted: i=1; AJvYcCV3uoTjizM0Y9zinDzVMnqvcmRSGjKq4ulnpNeaOry/EAsd9qg8/psT+J58+2UG/dQ2eo6foqAkxriAv9cn@vger.kernel.org
X-Gm-Message-State: AOJu0YyU/S8WfnIO66zKEufKgX5QUxmDJApomYc/kCCnDaQtyuL/UEKM
	sqhrEA42gY6deTC/QTxrlWAschKV7DmbYBYouUGAi2eKHpEVZPHqoM0TlJtqYivz6ni8mQEFVk4
	m/1+ch8ALIxfZ03u+hqc0bFGr/zNt/HuzLwzNoDa9Zp12LzjXV/Nt4WpPDhPSn38LGhvD
X-Gm-Gg: ASbGncuF237CkuYRtKIXoRp/Mgu1E9TnLd+WT31PiLQaf/4izU9wk52j85eggZGG9xQ
	UQuE2f3sl5QFowDX/Loa5zm9KspG7757K/WILJpRfQmpQijtfkS7sBGRQ0O19QZmSYLV2lj3o23
	o5/C6IjfLjVGt8pjYNo8fTSjM2tsvleszFQwXE3CAc83wjHrQzEMa4g2OudWYyUVAMUnp703nlT
	cv9rNJsVYlzpF352fib2KPvHfDFET+IMm9NxxxIQxyVeldSgBoH+XDZBLNQfYHWU89Cgor5u9Hd
	uVxlzeFM1UHIACsOiLdXIBtBE89VVE3PH8NvyS3gzk3Q/3O7NP0FlQSmIJYrKWvICkwyEeerkET
	UcCEX7EJa4a7vJVXAJUZVew==
X-Received: by 2002:ac8:7a97:0:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4dccb4072b1mr27350651cf.13.1758891900412;
        Fri, 26 Sep 2025 06:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+TdQEyTb0vZ74pl5udy9ShS/6RYEvgsWyZHIj2DIx77Od7JJwYvFeJeEqxdLHSH3+1mLk9w==
X-Received: by 2002:ac8:7a97:0:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4dccb4072b1mr27350301cf.13.1758891899741;
        Fri, 26 Sep 2025 06:04:59 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a9c327sm358355066b.104.2025.09.26.06.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 06:04:59 -0700 (PDT)
Message-ID: <fb3720a1-f910-49db-b83b-b23e407b13a0@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:04:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Trilok Soni <trilok.soni@oss.qualcomm.com>,
        "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <53d63dd6-a022-4e80-a317-3218976a7474@oss.qualcomm.com>
 <cf043ce8-0e83-41cc-b294-93dc1c27fd91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cf043ce8-0e83-41cc-b294-93dc1c27fd91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Y-gXuyrsIDOgtpJeOd4X2goxDS9G6m7k
X-Authority-Analysis: v=2.4 cv=d8n4CBjE c=1 sm=1 tr=0 ts=68d68f7e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Q9aL7w64nW17sFkSeesA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Y-gXuyrsIDOgtpJeOd4X2goxDS9G6m7k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwMyBTYWx0ZWRfX4CnWWjdb9vjI
 MK6URJXoC3oFVpOt+fJ8vKWdvYrrDBv2Bg/tvtaPAPPSm1yUm/FOwKVwrk8dxKLqdOGbE5MYoZG
 MpXtCbU1YQRxlr62blCUoYl8lLcX4E+P4ipVxdmiS3yxcHDSokpwL4fOiJszcQk1FG0xwAMs5+J
 Q0FnjEn6OTM3M8AMl507RFo+UGKVoh3sz+b5S6PIqwFK1MbzkewYltvU0ax9oKtDPDLq0ge04FA
 zLxDoJQ/SCFBDZvpqF9eN+364syd1XCBX9pzG4P0zdTtI2CmhOYt6EfM7VB5/OCZODIH6ie2xlT
 6zQdbyZF8n8cmbeJfEsNndUS/t475QGiWOhJMyXk2f2QjvBgLf2JRpmyIAxGW9UMo+2dYwZVkJc
 SAFLkloquguAcAPtvgCds5JjIUKbgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509260103

On 9/25/25 8:26 PM, Trilok Soni wrote:
> On 9/25/2025 12:39 AM, Aiqun(Maria) Yu wrote:
>> On 9/25/2025 9:50 AM, Krzysztof Kozłowski wrote:
>>> On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>>
>>>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>>
>>>> Add the base USB devicetree definitions for Kaanapali platform. The overall
>>>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>>>> (rev. v8) and M31 eUSB2 PHY.
>>>>
>>>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
>>>>  1 file changed, 155 insertions(+)
>>>>
>>>
>>>
>>> Second try, without HTML:
>>>
>>> I really don't understand why you created such huge patchset. Year
>>> ago, two years ago, we were discussing it already and explained that's
>>> just inflating the patchset without reason.
>>>
>>> New Soc is one logical change. Maybe two. Not 18!
>>
>> It was previously squashed into the base soc dtsi patch and mark like:
>> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
>> (added USB), Manish Pandey(added SDHCI), Gaurav Kashyap(added crypto),
>> Manaf Meethalavalappu Pallikunhi(added tsens), Qiang Yu(added PCIE) and
>> Jinlong Mao(added coresight).
>>
>> While it is over 4000+ lines when we squash it together.
>> Also as offline reviewed with Bjorn, he suggested us to split out the
>> USB and other parts.
>>
>>>
>>> Not one patch per node or feature.
>>>
>>> This hides big picture, makes difficult to review everything,
>>> difficult to test. Your patch count for LWN stats doesn't matter to
>>> us.
> 
> Maria - the point here is to not design the series / code for stats, but
> per maintainer expectations. Though it is difficult to know one preferred guideline.

I believe Krzysztof's explicit mention of LWN might have misguided
Maria into saying getting good stats there is the goal which of course
wouldn't be a good thing for us to solely strive for..

To the best of my knowledge the actual secondary reason (beyond of course
trying to make the series more manageable which I think turned out mostly
successful and I largely agree with Bjorn's other response to this msg)
is to let authors of larger chunks be credited for their work individually
through commit authorship - which I don't think is "gaming" the stats if
the chunks are reasonably sized and the work is nontrivial (just like any
other post-introduction patches would be treated).

If I wrote let's say 35% of the DT and it would be squashed into a single
"add Kaanapali" patch under someone else's name, I would have had rather
mixed feelings as well..

Konrad

