Return-Path: <linux-arm-msm+bounces-44592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597FBA07873
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C57237A2AF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DB3216E39;
	Thu,  9 Jan 2025 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdUmjlZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D3E21884B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431344; cv=none; b=lfT5GkxX+ZF9+WXH7mzQqCdBYyiKZstVvi8xuee/bNqj4z+SsNbP/ZIpC2jdQlHh+IBN1zjCAwaMZkH3xHjEhWTGlWE1D8k5HQB3azN4/xhdnK5PpusRCM1ALf3QKYMQDyiK8rjBUHIfDDtrhvly44DWKa0Gug7J622F11LWhQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431344; c=relaxed/simple;
	bh=eAyJ5LDtoXr+1R+ZVuoLrayqlcUgbaIUJIcBcCwtzkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aiAUfP+V3qhdQ182lpREQX21EWfxl8SKofmnpMwsVYF/DZf1rBc2j+Zm7ByTuoxndH/CMKfx89DafaIJ5ISDSrI9pTeVMJPp85t9dRax485fZziadBwz/aLPZ6ozI/EzUWnO3rafCQjBmV+dufOpHUNA8aElClGu8Eczhht/fAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdUmjlZv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509Bcgs4000414
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 14:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eAyJ5LDtoXr+1R+ZVuoLrayqlcUgbaIUJIcBcCwtzkw=; b=FdUmjlZvggS7Oe2u
	eWeHYu9/JhXbWVdJrxFflobcKBIO3dcM0qWBLc8q+Vv+XLw1dwLf4hsA/XpkxOpb
	vzZOCYx6HqekF8re+AN/ZqLyzgHTWJastHp9eP1ot5W2jXDA4HgkpqNZOblNYava
	X2W7K7GVNsKvZkvmmwKA9S7NK6vlCDCkIqL39JAmR56WMxpPW2u+JJq6PfwTVxbf
	Ah7R1lJU/xAD1nWZWhkgR91SyQhVm7KEv8VhpthSK9I5ENfDnZReJW4gku6NMFgg
	4/jSRyHHToLYOadscWo6bG73Y92cqTcMsBvSFGL2e/gZkDLIDAA+gISTWTq8tke0
	nFkbJw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442drwraun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 14:02:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4678aa83043so2279101cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 06:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431341; x=1737036141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAyJ5LDtoXr+1R+ZVuoLrayqlcUgbaIUJIcBcCwtzkw=;
        b=mV17JOSh4ov48zbDy5RUYXk7psq8igCN2ymYzsLaVbof9SsD9a2Kk6mClqd060VeaS
         vTZm16+FMvV+X3425YSEaTErH+MIAuJRfSPU92gKQjhMc3j1w3ZsJt6P2UfnK1LpIK3j
         9eUFCxz/2O4uyunV61Fu6G70RFn6J0dmVOePtbrdWzdfubEwE+NbxWPwfawA6ChWAoZZ
         hicWauCsjLvNJmU6ITxkoYJjj1WJjEwxZxxlhAQ1nK5D7dcZZaXvP3HujxAV78AiMWel
         quCE+61Ig/DqpizpokRh8AFRI48+Ji8fIWMdXASbuIKePX6XD5bsqg5V8u5esXdVh9eT
         +Yvw==
X-Forwarded-Encrypted: i=1; AJvYcCUYrHPIXIpp7HCM2XWI6JWYlKkSbFipEreLf+K2+x0GPixXLQUJGl37NhTL+Hb/Wi3p1lF3cVr8hp6EWCwJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzzoSViabsuA57AIJZrZfo0Y150J4ll46zm/gSXX5qYvRMaA/cC
	Uyu+pQ/2Wbxwn4bgh4yE4yrydkpt2IYubnd5Ry9UqwYImenOz8PFEECXrlEmRG0+4WPKeHUHYhv
	+g0C3axdYhED93ohHTtObmXk/pToMVr8CjCfTO2q5w3tPahpJoxofJ2zjp2ooyEBi
X-Gm-Gg: ASbGncuVDV7WJZzbcFtiWp+4d0fOG4p6nnjMKh/fG7dCiE+roGxxosqPSSrNsm1Nf0d
	qothz0Uy3hOOv026dZ+E350KQnHRZYa1BHKnu83TLzvl7sQtJXtCHJYOgjNJEY9wiwZzpneIPA6
	vmGbAVIZ2RUeGXVAsvzDqjPuFzjoMbkoqoxEyNckCgz6w/H9J0a2UpQ2wwI1AHRb9JaUdHZN/dB
	2oHJqodIFDfT3buptC1J5XjYTFulxsVcZ5jI11lI5ymOU22swYK2il2XH87uNEhDU+41QzWgM6r
	HeMpCqewvE5jlr2T1yT3wBSb/YA1AzcdpYs=
X-Received: by 2002:a05:622a:1a9a:b0:467:5fd2:9963 with SMTP id d75a77b69052e-46c71003a8bmr36747521cf.6.1736431340954;
        Thu, 09 Jan 2025 06:02:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfuF1eKAhLL/sLtGC/6H2TCc4VU3iM2KC7HOi1+w90X9G08zymapAYf8h3dlNECvaehc90FQ==
X-Received: by 2002:a05:622a:1a9a:b0:467:5fd2:9963 with SMTP id d75a77b69052e-46c71003a8bmr36747311cf.6.1736431340455;
        Thu, 09 Jan 2025 06:02:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dc0easm75037066b.74.2025.01.09.06.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:02:20 -0800 (PST)
Message-ID: <53b83a66-c0b3-4227-8dcd-022f70810ccf@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 15:02:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] bus: Extract simple-bus into self-contained
 driver
To: Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-2-swboyd@chromium.org>
 <CAL_JsqKMcHPhf8yzEZNC6280-k+aSmo3SQOBZLMjmfTR47BH=g@mail.gmail.com>
 <CAE-0n52k0Gg85Ry4KyjE7Ms_dJgj=aPA4aPB5gmC-VGWSNLZXA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAE-0n52k0Gg85Ry4KyjE7Ms_dJgj=aPA4aPB5gmC-VGWSNLZXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rvMgOgvySRsbvi1wlQQMH5UpNZPr8CeY
X-Proofpoint-GUID: rvMgOgvySRsbvi1wlQQMH5UpNZPr8CeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=808 spamscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090113

On 8.01.2025 11:44 PM, Stephen Boyd wrote:
> Quoting Rob Herring (2025-01-08 06:11:28)
>> On Tue, Jan 7, 2025 at 7:28 PM Stephen Boyd <swboyd@chromium.org> wrote:
>>>
>>> Extract the simple bus into a self contained driver so that devices are
>>> still populated when a node has two (or more) compatibles with the least
>>> specific one being the generic "simple-bus". Allow the driver to be a
>>> module so that in a fully modular build a driver module for the more
>>> specific compatible will be loaded first before trying to match this
>>> driver.
>>>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Saravana Kannan <saravanak@google.com>
>>> Cc: <devicetree@vger.kernel.org>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>>> Cc: <linux-arm-msm@vger.kernel.org>
>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>> ---

[...]

> Maybe the best approach is to simply avoid all of this and drop the
> "simple-bus" compatible from the soc node? It introduces an annoying
> hurdle where you have to enable the new driver that does exactly the
> same thing as "simple-bus" does so you continue to have a working
> system, but it avoids the headaches of trying to make the fallback to
> "simple-bus" work and it would match how new DTs would be written. We
> could make the driver 'default ARCH_<SOC_VENDOR>' so that it gets built
> for olddefconfig users too.

I think it even makes logical sense for the /soc node's compatible to
be.. you know.. the model of the SoC we're modeling

Konrad

