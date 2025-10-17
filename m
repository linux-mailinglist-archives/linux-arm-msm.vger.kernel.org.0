Return-Path: <linux-arm-msm+bounces-77709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED45BE7216
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C821935BE78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07E628688E;
	Fri, 17 Oct 2025 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7UqfOQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E275283FE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760689252; cv=none; b=cHgOhsWH/kvok1E5oRN0R4jk5GIVD3fRoVeHNbREBe48kiwJafWMqaX8DYG+FdfDxqNFErI6BQe2fet/cU9QP+w449l9f046uH3iRPgf+GUUnT3Er9E1midy/ds1/ZdrxJ6hEXgoud3Djflr6JFkmmLNBYHTOj7G6UdA125/6cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760689252; c=relaxed/simple;
	bh=W1ab4XP/vKfyLvPZCWVMMkItYSbT3sjdMDhJbsFCZE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyTQtK5hkuWx6Mbkb/3ary8H4WXtI3eUrsx1/ACvk7pPPzs65ZH2ndKs5G73IBqx+xCk5pjmucC1QklRwJvOV3uCYqNIp3ireI4s1HSkMOW8PbaZCE52lmFr0brA+8bfuQ0Nxf91OynGBrDYzBAQBFYuYz6VCVmdmFJbmR2lpfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7UqfOQs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLQdx001991
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1ab4XP/vKfyLvPZCWVMMkItYSbT3sjdMDhJbsFCZE0=; b=p7UqfOQs7akhcvBl
	LZjWMZG8me13GguhAmhrzowv7BTnRO7C4Mg38uUJES/mgcSG6rI+UFUbXG5h92RG
	3p4TDFgwhtxmgcRS56oiaZBx+cPzwhPmX7RGDZrHWrMHBlDysQRkt57t91QWRNK9
	gRC3j4mCRUaluffuYpZJJ3LmjK7O4FWnJyasz6SKtiEzmkG2CFH1nZnT/gwelEJq
	Roo/IOipfELf0LUnIcZNYXTVEY++z+ZQ8SGK1dADFTAgPJJCgBo9mKRZH+J9JwnR
	Ch9gLX53SropsZ9IS45NT4RGD4e2XElNfxSsm9CqaR/aZn+g1Cy4snJc4PHSX3ZQ
	1eMIGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8kfwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:20:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88f3a065311so51240285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760689249; x=1761294049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1ab4XP/vKfyLvPZCWVMMkItYSbT3sjdMDhJbsFCZE0=;
        b=NJWkqPW3Rs7Kl+fk2xDlCEehm2pEnKDrWqXyRT0X+GjGj///ucYP/z2ROmtThJ0IGa
         BoP6qPwhWV4KJeY7f/Q8goIR35hwIEu8FIKh3NMDL1kEmdpS5CXVO2BFiG1VRVgqEIHN
         sIgiw5rS+1dqYmrru3alOnDsPi3ZgKKd19OZqlNQPORMmdit5m1/IhAWhrZIr0pHQZU7
         peRyUk96Xr2+CVyLNBbxPdCBhX/W0Zh5+gBGLslBTgnbA3qBL1jI5KLOj7bHB+ybJDr7
         +ax6Vbl/TvVmqI6Fb0XtX5D0gH8MQfc+zBg57GOBgOTN+F2HDf+dsi6898ysmI2vuApj
         WKjA==
X-Forwarded-Encrypted: i=1; AJvYcCV8VIPDBi28qQragk5HGb6ujyCZtcHi9IXxjOJ8nzNSsH2DzKF8o0M1QTbl6FiedTm10GDufLTVwKVzlj8V@vger.kernel.org
X-Gm-Message-State: AOJu0YzXASO4clSWHYrXRQKsxyrXDrUSttvkyaQkUXfWOCnvhAmPVxWy
	sHR1re4Wt4bFbyY6b0TyNmkrqZsu58K4yXa6APtZyj3sVGPEQZo7dlvO5NvNE4dF9Xgauea9Gk/
	GAYuOvQCTCN07p9uG3l2j926aLF8ym2xCNDBx1UE4uIy6NEcBo7mlH9rdPOIKmz4wnbIQ
X-Gm-Gg: ASbGnctkE1t2z9JEm1vnuyX7OU/vz0I4JkE5CA748XdQ9cabLJsItNiTVA5lkB3eCd3
	RDd6Umu+aQwc4RZU8Y2o/wLap7UGdqnO3NIP9zZA6mBz0+9p6OqM4pOwj239UzRRsS2OunkXNXr
	LU92ITIdRvJu8pRcLUCTPwjwY1lwa9Ck9/SPQAhMDfKfPrTV+HQEnqOcpxPTkXhVVy1e0//cIkP
	eAWcdEQT1ShtjT7GQQQReq/p32a18KmJTsHcAGhnm1UDIOiiNrMeESSSqYjUmZD5MEIV3LIKxE4
	tAsgUMDupls5SxkMrMpMR+KkVv9dq7hkDJHUUk5ER9ppgjVToIgdPuJ2nOenkwq0Zc2DfHVEXvv
	iuY8X1UPLk0K/xwaQzuS5PJNMScsBSlBTg+Jfb+Z0V8/29cnxl8qqVLrU
X-Received: by 2002:a05:620a:480c:b0:85f:a278:78bf with SMTP id af79cd13be357-8906ea9b701mr288989585a.3.1760689249309;
        Fri, 17 Oct 2025 01:20:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG11LgstWaYNgZ1s68woOATZnZcT4+E5t9urVq0Efp1rsjpDe8qtt+X2vM/fWmWeJco3S37WQ==
X-Received: by 2002:a05:620a:480c:b0:85f:a278:78bf with SMTP id af79cd13be357-8906ea9b701mr288979585a.3.1760689245872;
        Fri, 17 Oct 2025 01:20:45 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb9f75f47sm754628366b.28.2025.10.17.01.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 01:20:45 -0700 (PDT)
Message-ID: <73d30994-3ec3-41bc-9b07-638d4173dfe6@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 10:20:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: r0q: add touchscreen support
To: Ghatto <ghatto404@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251014044135.177210-1-ghatto404@gmail.com>
 <20251014044135.177210-4-ghatto404@gmail.com>
 <e114504e-4bdd-46b9-b708-8eebc3075163@oss.qualcomm.com>
 <CAMQHOhfjsi1L+3j3TrcjEjPp3xkn94KOdsrVZvJCyUDFBBSeqg@mail.gmail.com>
 <d06a254f-bf54-4bdf-bd09-3ee5e5b31bad@oss.qualcomm.com>
 <CAMQHOhe=WYhtsjHMcRnJOi8UhnNNBfveTWRGSZ_bg24gFysAEw@mail.gmail.com>
 <8bd5486f-38a9-4104-8d09-234f642b45fe@oss.qualcomm.com>
 <CAMQHOheTkKC8NcRrPxKZdB_h0SJGNJVMd4NUD7TE4becPouWyQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMQHOheTkKC8NcRrPxKZdB_h0SJGNJVMd4NUD7TE4becPouWyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Pm0hyEWFjWCVTMbocd14osuFGTuWNh0R
X-Proofpoint-ORIG-GUID: Pm0hyEWFjWCVTMbocd14osuFGTuWNh0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX3PGeolJTBn9N
 0wD1fPl8SnKse1eyyiI0EEhF6XoW4PLY6YKLUdFq/YhBe2AndnRoTjnZatkghIkeWa/+jXaiLrw
 kya9XJW+Z/NBUObQuAwpIt4yrqTXXV0nnPc7Mmnr5cStIcgQDUqgqIBLWqoP/vWAqvkIjgEqJaW
 iTU1Ood2NU6p0X7Ay7Ir9l4uunWJSL4xh7oTK2tIrcqB0EdTFeEMSapp6FZ656KLzHmO07RVuXg
 HZTUhAQno4El2GrfQfYtgbiXVJRS7K2YVKHLvMcAPD28LpADYgPU8rivGP/5n/30IEkPQjLttE8
 BT0PPl49FMjwOLMpGgu8ygrb21ac6FtqMKXYhdhMDhjAqbaid6OUDk6fUdBSAFQOjXtKIKoN8ze
 DK6pDoxd+AaJXXy7Tpno1a5canfBsg==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f1fc62 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=fGO4tVQLAAAA:8 a=EUspDBNiAAAA:8 a=7GU4dPUIjq6KxtgWSIwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On 10/16/25 10:08 PM, Ghatto wrote:
> On Thu, Oct 16, 2025 at 6:06 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/14/25 9:04 PM, Ghatto wrote:
>>> On Tue, Oct 14, 2025 at 11:18 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 10/14/25 5:10 PM, Ghatto wrote:
>>>>> On Tue, Oct 14, 2025 at 7:01 AM Konrad Dybcio
>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> On 10/14/25 6:41 AM, Eric Gonçalves wrote:
>>>>>>> Enable the ST-Microelectronics FTS2BA61Y touchscreen. This patch
>>>>>>> depends on "Input: add support for the STM FTS2BA61Y touchscreen".
>>>>>>
>>>>>> The second sentence doesn't really make sense to be included in
>>>>>> the git log
>>>>> I'll keep it to the cover letter then
>>>>>>
>>>>>>> The device has an issue where SPI 8 (the bus which the touchscreen is
>>>>>>> connected to) is not working properly right now, so
>>>>>>> spi-gpio is used instead.
>>>>>>
>>>>>> Some Samsung devices used to use spi/i2c-gpio intentionally, also
>>>>>> on downstream. I'm assuming this isn't the case for r0q.
>>>>> It isn't, the device uses fts2ba61y on the spi8 bus - I hosted the
>>>>> DT at https://github.com/ghatt-o/ss_experiments/blob/main/r0q.dts if you
>>>>> want to take a look.
>>>>>>
>>>>>> Did you enable gpi_dma1, qupv3_id_1 before spi8, when testing
>>>>> The driver probes, but it fails to recognize the touchscreen device
>>>>
>>>> Could you post a complete dmesg and the precise DT diff you used?
>>> https://pastebin.com/QkYa8nMp (android dmesg) mainline dmesg doesn't have
>>
>> The link has expired 🙁
> https://pastebin.com/s4abJS9M shouldn't expire now!

And yet it did!

Feel free to just attach it to your message.. the list may bounce
it, but it will still reach the To/Cc recipients

Konrad

