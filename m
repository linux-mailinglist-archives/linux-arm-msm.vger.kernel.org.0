Return-Path: <linux-arm-msm+bounces-69768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80FAB2C619
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 15:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEC8E582D32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5BD340D9B;
	Tue, 19 Aug 2025 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCJoZEPA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6782C3043D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611098; cv=none; b=WdQz2tZ0BHHxbEg8t72g26CgG85Bqs8q1CyBzWY4o0+8atfPFInB9sIfSX+VDQhhJMqesU9bol9WSw6AJP3aEMa6/YH4aPtZxbh27FltUQjcUOPhT5mrMWBmkZ8laFSTcsVKZXxk7Nq4MVnhARb1RM+YJGrgGr4KhkztDOE6fp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611098; c=relaxed/simple;
	bh=AYZbnwOPwzJWkM+k0OVBmKQh9N42C+v/pYFfjHMLRVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NG5KW9GDjY5fsEz17dLnHMmXw/Hogzz4ze1FUXEVDtfn5pKkc+W8eUGGrJVjsIumpu/9RppRCEeWygrgEx1vb3+05TB086QQsB3yoeuM+uCpyO/SmmLaVhOzwLgonBjs2tIbs7r+EfRYyVYsi8qkdUFZHMpGxc5oDMfGnTdToWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCJoZEPA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90aRd008336
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 13:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BKkqlT9s5AsaZO6RLR2Htiq0L1b+P8/Jn+4+PCx41u8=; b=LCJoZEPA0r4iImFr
	6lqcGcSyDRHxtSf5Wj7D7YzR89GkKGrwZ2Q9bteGEnCbOvrXHXxlrEX2LIJeVrB5
	qp7gvxNok511+XgHciddoxcrIQsxWxY2C1cV/TnY4l5ciDBCHLliBGPgalEOLxbC
	CWL0MNZQAkXO0h9w6p2INoEjj9/6XK/aYlkcXuB0k/JOUO5MBGvenyOMaylIp2yl
	gvGl8/oispfm7a6jCFR5aCUdkcAy5w3ArmvqfR/E9OUxAHQc0NIexQuDkXZeLv00
	FXZp0/dFep7lT+IiBT9H0OLYWM1h3o89InSqwZOZDqGgNjw6dSqwNQwAHgl4LNnO
	MuR+ew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99rmkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 13:44:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f5bb140so178732686d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755611087; x=1756215887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKkqlT9s5AsaZO6RLR2Htiq0L1b+P8/Jn+4+PCx41u8=;
        b=qXK1xyArtEx2WDBMfN3Gs34uE3YZRTsYmfPTCMQJKM61nWY4qumTkVRNfDkizRNpxc
         igM2vNn16dMyDi72NW4h6jOAahQgMU+A/zh5429NCYklrZZ4G5w9KHEIIq9p9WpNTT3S
         WnUJ5VHGJtd5JGnE1AYPUmgLZlM7cSNS7f9oenoirx/UTqrnZkI4S7O0B4rH4ThvBpJ+
         RF2pcOeayRWfrfCYvDNatYqhNliQlDCLuj8cZRd92U++eiuoitSzV3uHFOwvFK/GO/Ym
         4GquO7KUm50EmYCHXnTF5cBcpXg/fsIcXWHn5Bbxl/MHLG2hqOhTSc1xS15jCRAJ3ia9
         eIVg==
X-Forwarded-Encrypted: i=1; AJvYcCUrhbSI860vdUQRnHaWfk6dKduS1vJ1t4RPNyeWU3LKT6oQt7U6G/9r3h7jgIOk3gQ7cO6P3E6ygjSTxhun@vger.kernel.org
X-Gm-Message-State: AOJu0YxPJyvzm1RlAa4ULt1iuFZsIqs/UWR7ql5ZQd0rmR7O25UsfcNa
	RAFbxljSyzOciyabaF/x3M7bRst5IGRkaaAK5vast8wllAApl8d+hEbV8Y4Od9/gheDDJA4t7GI
	BhAv0s5BiB4GFmGer0KKQvTxnIIim0Iv6e3lkrVSyPucv/niArhOuffW785XhJKbx2U0N
X-Gm-Gg: ASbGncv5x70YDK9tMh/57mLNikkDUPyPjC6QErz0EbsW+EnNpRNbIgyB5xFmkvslxBS
	RnzY/WM2zufljZ5JAz+w1Pn9M8cgArIN79xXR5EONs4jpQtgp0nzmKdkS8BrUHi074cIkfRmYOU
	tpPw5FKusKWYGUa0KYEjfsv9/RFKU79n3SPmZ6OYijvBzeEXzTMeYo6B1D7qRQGXmFL6r5JLtdv
	l1wJwLOBdSRtiL0hFsqvA+buWHg13J7xt4mVc1VW4jVo7I6ky1Ph81pdq6NlrPBa2g46SCiNFUx
	rTcTeNBvXqdUjwOC8t4KKgnFs4zdrsPA2zAUZWzXV47dGC7N4AQnYNs4UgLlJReTbDs=
X-Received: by 2002:a05:6214:5004:b0:707:5313:eb93 with SMTP id 6a1803df08f44-70c35b98573mr26058586d6.37.1755611087132;
        Tue, 19 Aug 2025 06:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKefw+kYHsABqfVxmU5o4qliGwOTNEXsA5EmB2zAtUTekLaQCS80bnjjzt29xlDNuC7G7m8g==
X-Received: by 2002:a05:6214:5004:b0:707:5313:eb93 with SMTP id 6a1803df08f44-70c35b98573mr26058196d6.37.1755611086524;
        Tue, 19 Aug 2025 06:44:46 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c07496f432sm3787926f8f.6.2025.08.19.06.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:44:46 -0700 (PDT)
Message-ID: <990cb5af-3846-44a3-b373-ded62d3309b9@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:44:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: Rob Herring <robh@kernel.org>, srinivas.kandagatla@oss.qualcomm.com
Cc: srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qLurUWEySCbg1v8YH2GQ1Yw9tWnRtg2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX+SyLHDuxjvcq
 PU6tuVATuzxjCxo4dk+vz4cm9Eq/xaEJZkYd+vetZCsMKqlTr5UoOQwF9Y40IOrlFXwegJOl/L/
 M707yKhqofjle0FIuqxd2qCSB5kvYCdaXIjFdEWYeNJldlrYoTDHbP3mqClYXyj11eqcIWW0NAL
 NKjUxcqifftUoHw1MexjfOERiBXrOvKtMScnoFGbAaz4d3t5F3xcepoKYr8+qYCc337g9xpbBfr
 lHzroMSxC1DEiurmk6tlDaAnizFEWW42rqapOceyglBcjiFKw0ybI5NMVCc5MnWIOElYkokb9xB
 nNMKlTr5OdaK2yVq6TfAoulbtpzWH4VCO2YmSRIDFkuXlUyQ4raiLrdu5cmJ3idqNYIqnc/TQbI
 wYpf7sUj
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a47fd0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lVDL77IP-BOR7NVgOTwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: qLurUWEySCbg1v8YH2GQ1Yw9tWnRtg2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

Thanks Rob for reporting this,

On 8/19/25 2:35 PM, Rob Herring wrote:
> On Thu, Jul 24, 2025 at 8:28 AM <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> Qcom Slimbus controller driver is totally unused and dead code, there is
>> no point in keeping this driver in the kernel without users.
>>
>> This patch removes the driver along with device tree bindings.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../bindings/slimbus/qcom,slim.yaml           |  86 --
>>  drivers/slimbus/Kconfig                       |   7 -
>>  drivers/slimbus/Makefile                      |   3 -
>>  drivers/slimbus/qcom-ctrl.c                   | 735 ------------------
>>  4 files changed, 831 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim.yaml
>>  delete mode 100644 drivers/slimbus/qcom-ctrl.c
> 
> This adds warnings to dt_binding_check:
> 
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> /example-0/soc/slim@28080000: failed to match any schema with
> compatible: ['qcom,apq8064-slim', 'qcom,slim']

Will replace this example with slim-ngd and fold it in the original patch.

--srini
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> /example-0/soc/slim@28080000: failed to match any schema with
> compatible: ['qcom,apq8064-slim', 'qcom,slim']


