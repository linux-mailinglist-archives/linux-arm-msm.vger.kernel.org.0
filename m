Return-Path: <linux-arm-msm+bounces-73843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD881B7C46B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 838CB321790
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 02:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE1F2F60A3;
	Wed, 17 Sep 2025 02:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gcO+71mJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFCD222575
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 02:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758076058; cv=none; b=pbryKrfpfwMnN3F8HTOd+dzWKk4g5pzJqM7QoHOvubCARey6/heVW1++BujGH/q5z6C5zFabrL3mXSXSOUCkTcv3fLQbwbeBO0evlzjkMhfh8rwaeCcXk7GHNOnJdQOXWyM8yCsk+F8gLLQPnzRu07+co8o05ca31qeL+iHR15Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758076058; c=relaxed/simple;
	bh=ZVOSah7WyUCxAwtViCyBrw8IIhcxsA5kP+tsBwbzwsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9O6n3ap5i7/XEyABT2phnzc3079YUnF88USBGTm8VUfE83hQXFyD85w0maVxdqerKJH8LLkdkB+52nQUYB3FU2ItPJ1M8VMsNBeloSXxFElhVV4TH2oPL+QeEPLiMKYg0S6AzR+TcAjatddBYGJXPc2/3VWcoH3fx0zEeeQLnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gcO+71mJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLaBU5020892
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 02:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VYlZBe92chnYNBC11wB4N82uu0aHrj9AIx2n54JzLec=; b=gcO+71mJL/8mZHVd
	KTpDaJ5GD9zE9ZDehnMwHk6rKIja2rQLRRZgWlKeONk75jtlavNcmw90j2HVhWO8
	8T+amM+VcWaGq8w9al1BypNRVR69vzy+Qn/xclMVMEvv9iXk2mscUkrrR/RLj66N
	ceztjk2EYqB0VrSlUOMiZ+lg17bsIFEIL1V3kJtgtA1kOut9FtPFqLbHwrO80YtF
	nzj8RUbROoDNrEPMJPV+Ct14KC9Gd5BzFw1jlJyptcEwmuPwCwgj1jVDSBoEjmqi
	uAOmauBBVSfhuvAJql51f6bLwfL37i5S7YkJZgv/THUzbOU8F5SQOy8xp4BOGXRD
	X84gvw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxygjsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 02:27:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7760b6b7235so4636636b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 19:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758076055; x=1758680855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYlZBe92chnYNBC11wB4N82uu0aHrj9AIx2n54JzLec=;
        b=dZb00guQUeTewvAYQ64+CxfxDvLR5b5IzbpUH9oOPvGrJkBT8UZmAvHEbh6FTmUWIi
         ToV4zuOneisCmwfBDYXgLLFq3DCeNPEPJFjN0oHnJJX5EsyKf4RGtJWPx0QyCqXUjuXx
         GFawIunXBdUwvoOdA4OPsKD5BGMJ8tCeRnuo9pS2GjzVj7ebtcvbmM/72C3n1bwovU5a
         QLEw8K7nvWc65b6Y6nEkkbQFvv0tbwWHthtYEf7R03nap17otO8YvJPvWdqK+zm0QkPq
         mva3DQ5WiKfe2dlzeHSwbe+tFXDTWTSRhYZusUWo3qq7RtRQovRZ3WJeHpCbT07Rm8U2
         TcSg==
X-Forwarded-Encrypted: i=1; AJvYcCUtrqnvPHso2HJ7a0nMtsaLfAxT5XzNdm4mA474UnRpggXjozpVzRo6ipkHgKNxhU7zNi927OKJ0CbkdDdr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb6cYgzf5uRtCq9Z46KucUakiyuN0eQP7D8cUHmm9dpQsqDxeN
	UZnlfG6kri5bjYCsjCCU2wMK8FL8cQFQ/3cQLGntQi8fSQWrsmTgT1T4tde99NmFb1Rg2eiAGkn
	Bg2u6/zGDqIov9Ymv5Jvm3X2R1FbUB8hBITYjRHYEMPL0QejQn5WjZU2r1BGKwciGQiKf
X-Gm-Gg: ASbGncu5gvFPe8ZndOX98TKwnF5Z6H0T2s8xw59kbrkCvtEApu+cFeyBcX+gBF17vSK
	CJ4kgTGtnRc2LeJQv/YWwq9WbFxY+cSqNGMx/OfqHBd2gsZjl1f3jpXq2zJA7+xMqRsQY2hKbt/
	hL92eHQEgelXM19vO7txL/Y7B4E5q4qP7kC711NukI05n38FpKxj9Qn2yw0RgFKwbSqcoHkJ6/a
	ApJzYhb5kl2qppiO0Fjt9yN1QD+zr7baRpCJc5BlyM1CuTSpghzlDgUfIhJ/wErtKhl5q9dyAIM
	YGpyo5/LgQZNhRUi/2j+I+sbVznWyRVKQH7DkSqpKC/KXmMip52zAk0NjwT1Ohi25Ukt/CAI9nG
	+KUto3pCHHQFzoWYJUQMYSFAzR1OsEipXKQ==
X-Received: by 2002:a05:6a00:228c:b0:771:e1bf:bddc with SMTP id d2e1a72fcca58-77bf75c1492mr538633b3a.13.1758076055099;
        Tue, 16 Sep 2025 19:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa3nKVRZ5lcOuXaoBxQLObp2Qb9gc/ezSveqX2YOxEc/wcuth8hVIukLM4KDYuJgtiHtLYwA==
X-Received: by 2002:a05:6a00:228c:b0:771:e1bf:bddc with SMTP id d2e1a72fcca58-77bf75c1492mr538603b3a.13.1758076054636;
        Tue, 16 Sep 2025 19:27:34 -0700 (PDT)
Received: from [10.133.33.240] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761853866bsm14036121b3a.95.2025.09.16.19.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 19:27:34 -0700 (PDT)
Message-ID: <a60a1d0e-0cdd-4e79-99cd-5dc543242a87@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 10:27:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] power: supply: qcom_battmgr: update compats for
 SM8550 and X1E80100
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>
 <f3s2srlmvuj7wmh4rndffmbfrzylbuq4rsu7pqqrnqa5fgsmch@t5f4dgmqtgys>
 <c5e3ac07-e91e-4c9f-9256-497991b75200@oss.qualcomm.com>
 <aiplezjbovtaghgblua5xj3rag5kjwzt6sjrnygzbez5dtaxm3@vn6kwmskc4e2>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <aiplezjbovtaghgblua5xj3rag5kjwzt6sjrnygzbez5dtaxm3@vn6kwmskc4e2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68ca1c98 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=lQXKqyNTGrdWrY9AsKwA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0pep6jt2NzDign6vwdJzv9eB0opiZdI9
X-Proofpoint-ORIG-GUID: 0pep6jt2NzDign6vwdJzv9eB0opiZdI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwPvVj6+LPR3P
 9pfYNGQ30iPY/faKyRwPQFUBKN+o2vI+WQhnV8CyOWLzJeUlNhDfZpYH1ogBr1Lq5Fe+t8NUyd6
 nlIDomc4xLI6uIIVnpZBfiSH4Cy0wzS03eBoH2pxhyXiD7SiyZANXK1x8bclot1Bef/+bgqLAUo
 ecOHOFfwp7ch9sMfeILwmWq/DJe9+V6Rkah8MMERTW94sk/6TOqJN6mBzSMG43L0yY3weg7fmnx
 NV2L9gnGkSyXt/Ds0BLZsMJGOTKRHO0E3dpR5LKCnonesooTDJ0RmpwvhRrtAtZuuyaiUViDgTu
 MOrdWzMCn5QcNQFi+3p6WSplxv10f0Sc+Pyp1k9aM9jyleeeuWQ/g9ujCcZcVHetoHonXORbMAt
 nxwZ27re
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202


On 9/16/2025 6:16 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 16, 2025 at 10:40:03AM +0800, Fenglin Wu wrote:
>> On 9/15/2025 6:19 PM, Dmitry Baryshkov wrote:
>>> On Mon, Sep 15, 2025 at 04:49:57PM +0800, Fenglin Wu via B4 Relay wrote:
>>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>>
>>>> Add variant definitions for SM8550 and X1E80100 platforms. Add a compat
>>>> for SM8550 and update match data for X1E80100 specifically so that they
>>>> could be handled differently in supporting charge control functionality.
>>> Why?
>> Is the question about why this was submitted as a separate patch, or about
>> the need for the change itself? The reason for the change is explained in
>> the commit text.
> It's not, and that was my question. Why do you need to handle them
> differently?
>
> Please always start your commit message with the description of the
> issue that you are facing.
>
The simple answer is, the charge control functionality is only supported 
in battery management firmware starting from SM8550 and X1E80100.

I will add this statement in the commit text.

>> As for submitting it separately, that was done to address
>> Bryan's comments to split out the compats changes. Anyway, I will address
>> the further comments from Stephen to make the change bisectable.
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
>>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>> ---
>>>>    drivers/power/supply/qcom_battmgr.c | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>

