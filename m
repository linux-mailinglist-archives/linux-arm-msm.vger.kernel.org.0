Return-Path: <linux-arm-msm+bounces-67147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611BB160B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 982F53B62B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3742874F2;
	Wed, 30 Jul 2025 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNTxf3wt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F23275B1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880003; cv=none; b=UqL8xzMgq3ScOdi1NRW+faiMMpayBCUr6ZzKgamVx+DDtw5piFEEs2Idmuib6iFVNuXKu6ovLJUae/hz9R+ddbUWb5TBwYdnpsTvL6WyD0qjBTl9ZYIxAZfN++35AtZO7gdZPCnGJLctfXzN3WMJuAlS1zsYzPm8ByuiiI+KdLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880003; c=relaxed/simple;
	bh=O5waUtiS1DG/Eb2NKnNA82G9Q+t+ECoaVsfmcPLBT+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdaDhbptBE/MMD8/nIWQNdW94W4rSFWhluuJyCihhGuAT5YgyLb+BUtA6hIhqYIEtS6dCnJNJGxDXbGRNIxwXM7LZYom9pkOZetDIDcnkmHyszyrVryF2/iQdwSGc2VtaLPG+HIl+9qqpdQHijwCJCr8HQCNLYopM7I27q/Pvm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNTxf3wt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbB7S009760
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5gxQPztQMAsZx5roYM/mBxyPSLwU6l2b9jc3C98wtqY=; b=XNTxf3wtL29mzUGE
	PeoxNr8UjQenUIfYGYTVRe4xQhJ2sihoIQAjt7I3yeUhcpV7nPl5nfEAjOzcZMpN
	a6b79mwM6ejGAcsT49Knh3iMHQCDRssPZHfvpJCek3r6+eEYL/pNgAp6pCviVo2A
	0TEKTw/6OKFNAigzL9c+TLo+5L/27NIWLeq4iqCmn5EqC3JbO0s2YwvnqsuEHGtj
	eLsE9ozDlr+vWOWU5ALvnLsh/9GTBSm79C4BOnuGPR8hcihTWLqMpnLzyzn2DEBB
	spAdyrk2Wzjvkd1YANg4QQxpuOxK1HpZ0lPMwD2KOwgsnN9zqA6ybTM8leQXpQXs
	vAtmFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860ep1477-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:53:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab3f1d1571so7937451cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 05:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753879999; x=1754484799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5gxQPztQMAsZx5roYM/mBxyPSLwU6l2b9jc3C98wtqY=;
        b=NhrCcnNoM1OL8nXDEz/o9uc+VqqccYBO1p/ZCn+nNNp0lZ3Gme8l1/6IdeHuHKyqwe
         T+sPQHvR55pb6wmFxvBY93xuyjifo5lASWOl1YP7IwUFUSh/xw2XGNI1cpDcqYCoyyvX
         wAHWIkK0LVqHCH77hwgWSSVwCrkgyGSwPOII0KHAu4D82kmYH0RvwSLQZQHRaQpPaavR
         N8Byb0ezwObKH0mkQPKkhOv6133XrMtckvsC12lmzW2GVSTy1UF8oVYSmwK7G/BiV/co
         wVl1ZiLaDJrZfKu9yn2fa786zbILRw8w2AI3+eEhpTCxd72DJ0HoK0zA04SmiTngtj4H
         8mWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOIXohtqL7xYe9VpVVhCj3f57J5lCduwkc/qW8r5h4tohwiEPqFtJtWi1P+rsCiqD9olEfjjAeD2zgSw6T@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcgr4QBsUtTp9mYma79S7rnsAWQjF+VT1BK7g+rMXiRpckyfX6
	HdyAJ5QhBKUeY/wJfs96Mc/riEVzlzam4r6asipnz9qvY26k7Hsqw/UkgZX0049IxP8XjPVQMuZ
	xACl+H0GpelFRK1yml9W9AVcuYjaWa+85jAvDjawyBQ+3CIh0Caay77Q6dCio9Gjz5NSN
X-Gm-Gg: ASbGnctb8QyWNQ3waJFW/CXq0slIJ25+QdtiX/6XbaMkgYo9DMn+OaZTOyz7u7h6nUN
	wA9SLzENtPLaZcqnY093/XCvZrflxmLLToI2TuUbl+/JX9eGPPQHov+AOEL92KHvCXyqJZ9jpcC
	Jw7B7Q69MANZkB/Ccn77EK46UwFdh5H681qme/fsIZAIbOVKQqzjSL7/fDxvhZgoh221GFK4s9x
	DRTb6A0kHD1hM6uhFYaWZnThcpuF7SVaSEX5ZgIxQ+9zkIuoAb7i4rsgpgysdLT3zDhLQp51WXL
	ylascFlxLbaznn9fHdgMjk2Ik5W7hQsrOPDZv5GCZDeoEy+M6HKUeq+EjnkhkPVf+IlcPi97rsn
	quZqd0ZHt/B0N7fuDpQ==
X-Received: by 2002:a05:620a:1918:b0:7e3:3384:4aaa with SMTP id af79cd13be357-7e66f041721mr221481885a.9.1753879999530;
        Wed, 30 Jul 2025 05:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8edTo7a2GExz5C3MxUcRuEGGikKsdBITLyPojp4jXdFSx12vSqnRAFako0z2oJUstWUxrbg==
X-Received: by 2002:a05:620a:1918:b0:7e3:3384:4aaa with SMTP id af79cd13be357-7e66f041721mr221479485a.9.1753879999058;
        Wed, 30 Jul 2025 05:53:19 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aa7582sm739237966b.99.2025.07.30.05.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 05:53:18 -0700 (PDT)
Message-ID: <f2f0f25b-40b0-452c-ad9e-01b84b32e163@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 14:53:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for
 Ntmer TW220
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: aliceryhl@google.com, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, ebiggers@google.com,
        ilpo.jarvinen@linux.intel.com, joel.granados@kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org, len.brown@intel.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lossin@kernel.org, mingo@kernel.org, ojeda@kernel.org, robh@kernel.org,
        sfr@canb.auug.org.au, vanyang@smail.nju.edu.cn,
        viro@zeniv.linux.org.uk
References: <de111b27-9126-4c03-a7bb-8cce9ea2780e@oss.qualcomm.com>
 <20250706034303.5404-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250706034303.5404-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2dFCWJrnuZaq4xBPlwqMtOxmTM5of6HR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5MiBTYWx0ZWRfX37MqcCul+dP8
 mJcneGu6nB5mMoYu7XRQOfSHTK+JGYCuGEvIUWXRi4vuif1RgQJjZ1jxnhB8RgUtbPVNcwDlXaF
 8vNisAm8NxqDbU0OD3MjMIdCe79ZgJrICcqPBmhIXP+H9V4jj0jAExtoBWrsQEQDrRPEznSi+oB
 +UNWY/5K0f/R3fJw1WQJB37i6sAebBd2TSZzqT0fp0crXisavqC58G3HX1HMZno6XxCOezq9oLC
 baKq9+OLC06MtivNQ3wleWotTKEckjVAvxUVm0JXfiEbYE+rgXLSK0thvjuXP+l+Mg7Wmvmw26J
 EVxNt7TLfkqi/L2ZNqJAWfMLgFXNzAK8f8rBNiAtcv4uNl4dHzWgC3px8qlBBo/RhgSMPw1wrku
 zFQhYT7xXMS1wL/acZ807a1QkldYUD96Dii/F7hdfyQiFvKcIp2KhRPyO+/laaAUZwzj7QGb
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=688a15c1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=dEhO_gk0ZkCmvCEDGLUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 2dFCWJrnuZaq4xBPlwqMtOxmTM5of6HR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300092

On 7/6/25 5:43 AM, Pengyu Luo wrote:
> On Sat, Jun 28, 2025 at 3:48 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 6/17/25 11:29 AM, Pengyu Luo wrote:
>>> The Ntmer TW220 is a WOS tablet based on the Qualcomm SC8280XP platform,
>>> also known as the Robo&Kala 2-in-1 Laptop. Thanks to Hong for providing
>>> the unlocked device and early development work. This patch adds an
>>> initial device tree to enable basic functionality.
>>>
>>> Currently supported components include:
>>> - Bluetooth & Wi-Fi (board file regeneration required)
>>> - Battery charging (up to 15V/3A fixed PDO) and reporting via pmic-glink
>>> - Flash LEDs (front and rear)
>>> - Hall sensor (lid detection)
>>> - Keyboard (via Bluetooth or USB)
>>> - NVMe SSD
>>> - Power and volume keys
>>> - Simple-framebuffer
>>> - Sound (playback and capture; top-left DMIC only, top-right works only
>>>   on Windows)
>>> - Touchscreen and stylus (requires GPI DMA support [1] and stylus support [2])
>>> - USB Type-C ports
>>>
>>> The following components are currently non-functional:
>>> - Cameras (GalaxyCore GC5035; only sensor ID is detectable, no frames in libcamera;
>>>   partial driver can be found on LKML archives)
>>> - DSI display (blank screen with `dsi_err_worker: status=4`; primary DSI register
>>>   dump included below)
>>> - Stylus wireless charger (CPS4035)
>>> - UCSI over GLINK
>>>
>>> [1]: https://lore.kernel.org/linux-arm-msm/20250617090032.1487382-3-mitltlatltl@gmail.com
>>> [2]: https://lore.kernel.org/linux-input/20250605054855.403487-2-mitltlatltl@gmail.com
>>>
>>> Note: This series does **not** include any confidential material. Those
>>> who wish to run Linux on this device should contact Ntmer, as the
>>> bootloader is locked via secure boot.
>>>
>>> Co-developed-by: Hong Zhu <vanyang@smail.nju.edu.cn>
>>> Signed-off-by: Hong Zhu <vanyang@smail.nju.edu.cn>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>
>>> dsi_ctrl, reg = <0 0x0ae94000 0 0x400>;
>>> 0xae94000 20050001 000001f3 0000000b dddd1011
>>
>> This is not something we want in the commit log
>>
> 
> I will remove it. I need help, then I attached it, two of my sc8280xp
> devices require dsi to work. Reversing and guessing wasted a lot of
> time. I will appreciate it if qcom could support it.

There should be nothing interesting compared to what's on SM8350 when it
comes to DSI on 8280.

I would assume something's wrong with how your panel is being set up.

Konrad

