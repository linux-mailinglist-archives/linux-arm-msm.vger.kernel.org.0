Return-Path: <linux-arm-msm+bounces-39901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D55749E0620
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BA242863C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7852204F70;
	Mon,  2 Dec 2024 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlhtDSNf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56944204093
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151683; cv=none; b=G5nN/gwB4xLJymm4dslVl3gAPTCXFOHMl2JSnhisHiks1E7rMQiculnvKgw4E3SIiVt0Unyq1x5LXZLU51JdywRkDWd2Slxn4Ce4FtfSADTHndvLnWjxzvhRrlYItmd+i9jyvC+oyK3JrRvfkVfWoqThct8tcRnBZY8TU072Afk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151683; c=relaxed/simple;
	bh=vQuIqt8TEHUMFSxiPHnp4Oo0DBwiR6TbqmJR/qf/4l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FahKg+BdI179NgCHriZH3I0oLrYjgYczY/dttbEeADlH2cWkw3lQ2gQ2jb57xrjOYlaVzxrZhPYHJ3QLqnojSRMnPw3Zm5hTsAvS7yFavjffSr5hqUCDl6IxvSlneFG6nbrf9q90EqUCeR4jVc3wHxTT9jNaVac5OIpx8mRdUq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlhtDSNf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28whWJ006382
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Dec 2024 15:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fefCsaUnxy0ymBjJ3NBjXbFXvOUCluTOiJLWLK25V1I=; b=NlhtDSNf7+of/1oV
	pcMhbzpjs+YmmHw9obqXJ4LbaQwCLl01JSe8TbNXn+vC+S4X6EgLl4y3XtR10PP9
	b+xzsekj2HWIu4pJ1Vt22/vOoDCe4aNHJywqQpsvUPTx+KzRECLYJFCDHu5IKVfR
	oTYk/mfA6f9NdVM0aAFjypp6SJBiDVqTMXN/zXzfjVe/rtHVQ/1MhNywLQlv3j67
	IOvyjmVzkPpcCcDsWJVl0SQBX8qCa11R8xwdQry6NO32ldYE2R7cx7Y1MW8cFzbT
	7Yy8vSmsBmv2ST4h6uHRVzCSOaCfueMU47RkxVoa8l3H5595jfj3mAkrZjADRBdZ
	8gLlqw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437u36d5m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 15:01:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46699075dd4so9669381cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 07:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151676; x=1733756476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fefCsaUnxy0ymBjJ3NBjXbFXvOUCluTOiJLWLK25V1I=;
        b=dy8tiA9q3GenEXC7zue1WzrJ9LQWsnbopRChBiJWBWwzuD9x5FvzOmxLITZlAYjEt4
         +I1yKbRwvyWhMt0rBaCbxzuw/iMpnDb83ONiF1LwPbvaD7E9nvqgmdwL3+/HBA8doYnm
         4F897bJsHbtSnTXe2Ye0ryQ61xJHmGw4bnkArH4hvJPLZR9FIjQdgONnaDxmtRh4Whro
         Rg0SQtex6XV54AMo5S0AR6JnINj9X0518+ZWZmk4CpesIxsmZb3/2/IRXRDrJCKz8fem
         w4OMCeUShDdmQwIthzRHgItFtc1dBPQ30+HAYMntrY4HlqVIYWrbQ14LCpYeiuglUYhq
         r5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCViP3pYSskO0Y4wWVm97ySV9Ha1tZi8yXulmuWitEsFnHi1WkAZUP/iSCRYxNe49PCS4MlKmkldWYt228mB@vger.kernel.org
X-Gm-Message-State: AOJu0YxBWrqAY97E2SkcYSvRjNYmWyiYYITOLtORvdU4Z3E5YTDF1UCU
	DUVarvjVL/7aB5KzaymZTYBAiEEjsCDI2D52PUEAni4hWPbG6NxVrDKt9rPBYtrnCaQ7D9Rhng4
	WWLVFNmSdrlfetluPWq/J2ejtiNfd1CuenLHy/r+C/p8wihY/MCvbKVgwQM8um6H3
X-Gm-Gg: ASbGncueNcifExdlXnngEAkRhk9UVK6SwEC49dUxl5UwNRr01qSzrlQ5bOj4mMETIJ0
	oM3+rEZJ5ao9nUvfoAo1P2X/NZDGud1hp/fUSX9VjbSpEiLj+wL4zTlJG4a1mq8LjWuuemEt/2Q
	rMMaU+kAs70yVrOyMkXEN3DhAQIOgKJz1fWxu4L2W8Rrvloix5vUxP8yWPzQpjQcIuDlRYE1pPO
	7nVjutu6m0osNja5NDf5Xi6C1vsg+6CJ6F+Jt9dh7xz9VND8uvA1FWtXz9B2MmG4drHgTd5yfBk
	5/ChHl9HSk7paUWwXEkFUamGteNivTw=
X-Received: by 2002:a05:622a:1ba5:b0:460:7929:3575 with SMTP id d75a77b69052e-466b36ca2c2mr135043031cf.16.1733151676593;
        Mon, 02 Dec 2024 07:01:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJK8BUUFOPA4LcqfRJVXEwYCc2L0I9YcWBq3YEu2cdmKP52/zZ6BQxKac7mnX+yv+unXkWag==
X-Received: by 2002:a05:622a:1ba5:b0:460:7929:3575 with SMTP id d75a77b69052e-466b36ca2c2mr135042641cf.16.1733151676029;
        Mon, 02 Dec 2024 07:01:16 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a4csm522862866b.106.2024.12.02.07.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 07:01:15 -0800 (PST)
Message-ID: <2a727ea8-1a8d-4eea-ac03-2d5434cbe5ff@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 16:01:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/12] arm64: dts: qcom: sdm845-starqltechn: add
 display PMIC
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-8-5445365d3052@gmail.com>
 <ee668cbf-54e0-4c0a-b690-8606cb3785b7@oss.qualcomm.com>
 <CABTCjFAUp9Oa_qRweO-EpLHDTi78=07i_St+L9EDSgYxHMrc4w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABTCjFAUp9Oa_qRweO-EpLHDTi78=07i_St+L9EDSgYxHMrc4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: g9lCf66V_ullq9qoysOHZ3jyvryPhrJb
X-Proofpoint-ORIG-GUID: g9lCf66V_ullq9qoysOHZ3jyvryPhrJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=919 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412020129

On 2.12.2024 2:18 PM, Dzmitry Sankouski wrote:
> пн, 4 нояб. 2024 г. в 17:15, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>>
>> On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
>>> Add support for s2dos05 display / touchscreen PMIC
>>>
>>> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
>>> ---
>>> Changes in v6:
>>> - refactor: s/starqltechn/sdm845-starqltechn in subject
>>> - refactor: 'i' < 'm', so put tlmm i2c node before motor*
>>
>> Now you have 'i'2c21 before 'g'pio-regulator :/
> 
> That refactor was about tlmm inner nodes. For soc nodes
> rule `nodes of the same type can be grouped together` should apply I guess.
> I think I should move it to regulators.
> 
>> [...]
>>
>>>
>>> +     i2c21 {
>>> +             compatible = "i2c-gpio";
>>
>> I'm not sure this has been asked before - is the GENI SE for I2C21
>> disabled? Or are there reasons to use i2c-gpio instead?
>>
> 
> I2c21 is wired on pins 127, 128, and those pins don't have a GENI SE function.

Right, I was able to confirm that's the case in general, not only
in the Linux pinctrl driver

Konrad

