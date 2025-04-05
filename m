Return-Path: <linux-arm-msm+bounces-53284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 819FEA7CAEE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 19:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93BD47A1807
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 17:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7821D176242;
	Sat,  5 Apr 2025 17:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1QBDPTC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8C422EE5
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Apr 2025 17:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743874074; cv=none; b=D3cdpb5fLyUquEZp8FNFkLXKqvie4nYvx2tP7sJYAjb02bTuWtQDLtCDSF29wAW2FIveiEaR57ZhgJDd/hBubuAr6JygofVQL6CtcGD10vowjWCFlnn245bmYIV4ynehPIg8BZmv9rDMVoIAYd+5FbAFsPOZAZWmA6/AolWigm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743874074; c=relaxed/simple;
	bh=WzPNIG8S7EkLyB4wTk65d9ihG81GOrOkBB58wKZnCyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxIE1KhV/FatSnxniTF3tIcUCChYNFcdOXunNH61GPB46lLJ3imwz2KsaEnBqUdjJEtRWjYF2w3kb+MBl1gtfE6kKkXtNOEz1tZEdmRv+VJao8smHr5lIqVzLBzlnnYUj5fIygX3e8KdIVuMEN8sQIG891E/z0hy0cbO37DnOgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1QBDPTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 535EHq2F010920
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Apr 2025 17:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5UrBqYYL10LEBTum6m4Xhl+Wzvt7NLtyyRegDCKdfw=; b=X1QBDPTCvrcB4Uzf
	nvoFTh9+7tiHbmPvw0HjUvUEMEljd+Oz/kM4lfoP2eJZe4IhLEBU872mub6V7AHK
	/Ewp64+Mx4MjcB1eUYnq4K3L9D/Aj+i6QKFek5jcTjmSns09bQ90uzE2Ue0Vy5f1
	I+JPnjomlG+V6ZdphbPjNnVPMegL+QFVMszxT64z+MsYMz3VE//rrfHM2hfguR9v
	WJjRwGkyBGi71VMTt2LwL3mEG11nSiMjjgCDZR3sbOhA+BZqx+kxXZSZfSaVXLVo
	CpeTojgQRMJWNpyuXMlUP7E4jyghOVen222GQrqXnaxBs24//c/I7HEQmqQilCYc
	8mrl/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbu8tcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Apr 2025 17:27:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ac559cbaso588661085a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Apr 2025 10:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743874070; x=1744478870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5UrBqYYL10LEBTum6m4Xhl+Wzvt7NLtyyRegDCKdfw=;
        b=JS6d8iCGigRvuSFRE5ouoriY9r2A1ODpLegUzrNBhT0uw2ubULDIYH/bfdLQvRDAv4
         0AMlLapVYzkC1uPW50e2kInEn5xoTKqwxNyl73yLyQRVQ2WEUdEGy1Gd5NpuXlLdvgzG
         MDZdHF2SFWBBHkqbyzpjG5B2hfXgvYG7oU4CBRnbhLiFDC4noIkUVVU0JLU2YeNpsR73
         cb+QR3ufb0dVk9BDkYVFmwDEhUp2jZ51U9c5+/ooudC2dWSeil2E+zXYoxnVicMWe5uu
         Ip8zwBtghmsNXz9ThKdM2QNvVxgu7ks4ST/q1r7318Rw7vLh6DN6VUvCh78Vn6IU6yeD
         rMFA==
X-Forwarded-Encrypted: i=1; AJvYcCUDUP4yrZmC3ZDjJoyynxrNCMqhYT97acYXfm0Z2OC04jTJxGdILJZtBK8TByIiXBkfbSgwirfA4R0R/e3i@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz8UDmDV1/sH7bpu2AjWiqh0YF/PdaFByZOTf5N15gfAlXhk9u
	+eZrwHOQk3699fH6ide0UvsXWOqmAFp4QaT8R2KjcOz6I5pyvztgVY0/xpMqTIgYKIjCnjJJghr
	ZBidufdZh94LeR21sJBxent3mK2Df1U4kYmlnTqerrU4vHJee1luCXbccpPLCJaVe
X-Gm-Gg: ASbGncu3QJrGEuCqxp8h2Z+CtQaxInOhFYsYOTwBcLEGX56+b/9N8uGOUvL49JjJ0AJ
	z6jPeJZ4m0gvfjUb8/6z08VilVxWwl1LhlydYuD5aH20itbWJqIqWfo1HN6Y1cfuFiMi0n9v/+D
	yDXVEQ3aIC0xkKkUflkAO/oMNeiZabEXLwrFtPkKcpfqayDJjTao0aRvkXDLO3mxTfFnxLY7730
	N2G1xPQgYxyWXkB35OtCzDMVrwmU+Lshl0CL8Oyy1+uMAmari0Tsye/d1ubNLnA0y1Assj9D2l7
	P0nJyCgujmsPmAUJzavUn42Uo8QuU/JNZkDOhF14h6MMjN1fj9V55gOC8oEL758HuiFQ
X-Received: by 2002:a05:620a:440f:b0:7c5:4711:dc56 with SMTP id af79cd13be357-7c77de01d44mr567518785a.48.1743874070506;
        Sat, 05 Apr 2025 10:27:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHafMbZ8BW3LW+4OJQutAKH0ZMvi8+bi8/F+SD5nICOagJ0fwxXZbQOXQE2zRrHoVp4J93XJA==
X-Received: by 2002:a05:620a:440f:b0:7c5:4711:dc56 with SMTP id af79cd13be357-7c77de01d44mr567515885a.48.1743874070163;
        Sat, 05 Apr 2025 10:27:50 -0700 (PDT)
Received: from [10.160.109.143] (87-95-81-170.bb.dnainternet.fi. [87.95.81.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0313f2desm9387941fa.28.2025.04.05.10.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 10:27:49 -0700 (PDT)
Message-ID: <6e135e55-b5e4-4ead-85ba-29c2cd6aa7a2@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 20:27:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Johan Hovold <johan@kernel.org>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
        Christopher Obbard <christopher.obbard@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-6-srinivas.kandagatla@linaro.org>
 <Z-z_ZAyVBK5ui50k@hovoldconsulting.com>
 <8613cf45-d202-4577-868c-8caf771c7bc4@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8613cf45-d202-4577-868c-8caf771c7bc4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wsd-zTRDcJfNKV0RVmklfDYWZ2mL7kM7
X-Proofpoint-ORIG-GUID: wsd-zTRDcJfNKV0RVmklfDYWZ2mL7kM7
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f16817 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=YfwyiRVFF7VR29Me/gQaHA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=D19gQVrFAAAA:8 a=gjPlNVnwJrpBRyZBAVEA:9 a=lqcHg5cX4UMA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=z2U-W3hJrleVIN9YIjzO:22 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-05_07,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=916 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504050113

On 03/04/2025 15:19, Srinivas Kandagatla wrote:
> 
> 
> On 02/04/2025 10:12, Johan Hovold wrote:
>> On Thu, Mar 27, 2025 at 10:06:32AM +0000, Srinivas Kandagatla wrote:
>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>
>>> On some platforms to minimise pop and click during switching between
>>> CTIA and OMTP headset an additional HiFi mux is used. Most common
>>> case is that this switch is switched on by default, but on some
>>> platforms this needs a regulator enable.
>>>
>>> move to using mux control to enable both regulator and handle gpios,
>>> deprecate the usage of gpio.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
>>
>>> @@ -3261,11 +3276,26 @@ static int wcd938x_populate_dt_data(struct 
>>> wcd938x_priv *wcd938x, struct device
>>>           return dev_err_probe(dev, wcd938x->reset_gpio,
>>>                        "Failed to get reset gpio\n");
>>> -    wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
>>> -                        GPIOD_OUT_LOW);
>>> -    if (IS_ERR(wcd938x->us_euro_gpio))
>>> -        return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
>>> -                     "us-euro swap Control GPIO not found\n");
>>> +    wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
>>
> Thanks Johan,
>> Running with this patch on the CRD I noticed that this now prints an
>> error as there is no optional mux (or gpio) defined:
>>
>>     wcd938x_codec audio-codec: /audio-codec: failed to get mux-control 
>> (0)
> 
> This is not from codec driver, mux control is throwing up this.
> 
>>
>> You need to suppress that error in mux_get() to allow for optional muxes
>> to be looked up like this.
> I have a plan for this,
> 
> I proposed some changes to mux api for exclusive apis at https:// 
> lkml.org/lkml/2025/3/26/955
> 
> This should also allow us to easily add an optional api, which I plan to 
> do once i get some feedback on this patch.

I'd rather suggest an API to switch the state without deselecting the 
the mux.

> 
> --srini
> 
>>

-- 
With best wishes
Dmitry

