Return-Path: <linux-arm-msm+bounces-84666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2218CAD23E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3AD33007A98
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72FD2F659C;
	Mon,  8 Dec 2025 12:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcC3y8KM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNS5RRkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318FA2BEFFD
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765196987; cv=none; b=Rvsmimulfao2doTKI94uH1u5oHAQ4CtkUTQo2RsuJ+Vr7qFGwLD/PvrAGQt7jUg4ByHTQnu8CfFSLLOtDQygEu3Ilj5YkoaruLhRqke1pJC11tchPltYaMqEUjhrXYrpR98YxbOWJ7y8QGdcwZx+D2mqm2GQqQ0GfWmzemZXe68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765196987; c=relaxed/simple;
	bh=pxEA10mnZNr4IH0GxXO+Eunl4Mif1zjuJttCd54ZUXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DXX/VKI/G5eO/nNiThw7tx/6C5EK1xOTDilM1Yt+a5zsKVSFrSm3dZIei05tIoqVTK9cuMkz0Avoovoy1iqsC+8qYKL9jWZHPD5PG2Y2khiEL/Yx/ulwt+GeK7QklisRuptIpzA+FDogP736ytGeQsOaZNxYNNBCB+NpblPyTa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcC3y8KM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNS5RRkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8BQRdp826747
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 12:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9lR0850W7UysPWaf45A6GbffjDmgd+0fauEUYKXQwCU=; b=GcC3y8KMTxpF2PGS
	JiRXTMASi4mirQzZaBzn2JXbuGeVSBpixf9nBBgXyDntFJyal/GBS/gPpkYwCg42
	7GTyBO/a6X7rhw1icLRJvHlOPLMUCVZyIX5LUpZe/icntvZZ21tEq4GtwLV5HFTd
	Ni6nMY+I2Zlk9tqu7AwDcCFCWT6HRbsXpgbRWxqTSAxZTlKb91uIyPJPhHCANzAA
	InJ1NSCJZdmwCh/Ub1zbWagPAMjrx3/seqjRks8eXkKApLZJj9+R4vrO+LDNBYUb
	VC1slvAOnZkWZ+Qov7GuEjt5C2ULOBeQYxQ0QsIjtLODzQQUSKZYpWIOq9LpYx8L
	ny9dSg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwt885mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 12:29:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee409f1880so11073061cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 04:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765196984; x=1765801784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9lR0850W7UysPWaf45A6GbffjDmgd+0fauEUYKXQwCU=;
        b=WNS5RRkZB/E/hzpBLffxd5sBiEbotJzcNxV8d5CGVuXTNxbkNJvd1XwAQ5oE8LPzeW
         DjdTLXUCUascZ5Z2hncvOB13zYRRwEBdxeU14BWNJzvfXEELg+vHHAjlmXUrs5l08nis
         SzOnMZ+MVMbkRbeWbfkIV5WZqcSn6s7wnMrYTLdHee8WKYP+Qej5noHd6ENi+nyQow7M
         FW32w8EHHSdnK7d43WHD4/HfBrAa+8WKLcByyKRgCgKPlxq3r7wINNQ9TTtb17TcBhqu
         33gCfRPpF6rC3RC+LmBUeOJi9PGEdxKLU+6wip5g+ZwVR9vj7A2RnBZlYb7PJvZmnec6
         Gbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765196984; x=1765801784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lR0850W7UysPWaf45A6GbffjDmgd+0fauEUYKXQwCU=;
        b=SJY6a33IZfeurSM/fxd9wwPF1JeQ+XPkd6mWgf7CPmP6fvl4vujZFVB4zWoDWSgqe1
         lBDF7PKcykcFUWUz/LsxnMJOLYOUSCAF2BbKhNqV0PynWyZULEWu7kzPP/FHzOh4jJJd
         0mmslPBR4UYGpwMhLHUxW6ZC+0TPjuQWeab1D+fWK3gAi7H4AW7SAr3U7J+ZQGLoZ0M8
         gQ8eY+HpBg5tiA4kVk9mwxIQ1yBlD68ylEeOVZk9lvn+r1EFVq1Q8PopHZEo9bRaebnJ
         /SN1MpFV+der2WYUklhqqSxuev07p30BzW3rCepztikh1dYbilBb+TDQ4ntsJcCx8wPW
         f2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWWUv+CrRqqSAtIS6VJjvv06+V88gFLV0nASBOlSfy+8rsj/aVEGDaG3npdIxtboy0kr2R4/xaS+Q340uTp@vger.kernel.org
X-Gm-Message-State: AOJu0YwkWgHCIOd3kbkjw91bCPBP+6c4ZynKr4ffTsy1llsQrYQ3spcI
	PFrpt1i3r2jwk7ERohAoSlwKxEeHQcLzCX7uboO2uZ3fCt23lkkFYHxie5ungCV8LDuJbecc1IN
	//JnZXMR7CwrRbfKGB3EsZLuzts9dftv2U18LwPugWEjq8Gnm//y4+nEn1uh8BEDUYmUg
X-Gm-Gg: ASbGnctLapw+DZGq8q9ocMlZDv+fYhHU9HUCBoeCWuD6CALt99jaHe42YsPt3VbAJgm
	ARHBX1/fmMD/4kpypxhzJocm5yIgqYZfFSXiRlLGS2LXnwVQsveifPhyEPQKKIRoPJKwFaYOOEb
	JX63SM/MyPW+FtYCQepe2ac3LeQhFf2nVRr5XzTahPn+42c0KcmhB2nZNH5+arFdWHvvTohi5z7
	J1+8pBaynDNB+pqK4nVOlnbNbUNbqx46yhGsEwQ6l/OnHI9fbptyPkOi1PNhod0RllwQU+DifEn
	UgS39pB/nOiKUpF8n8PMr0XRgmeNQfBIYccBYIZLo5ejilk00LCiQt+/NXq/rkY2d+GuyS2SUSI
	QjpPlLOHzFqojLfNXnAlD0eJpB2+ursWTKbfQJlJSaxxqDbz9icf3REjtLIET56+bmA==
X-Received: by 2002:a05:622a:1ba1:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f03fd51956mr84112791cf.1.1765196984468;
        Mon, 08 Dec 2025 04:29:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDnzpoVGe8ZWok1RxP4/CgexsNuK0oyLMYeHLeXJ1LdyB4uCrH7u/D3ZOU3DnvsQ6GLE7FBw==
X-Received: by 2002:a05:622a:1ba1:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f03fd51956mr84112411cf.1.1765196983798;
        Mon, 08 Dec 2025 04:29:43 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4976c43sm1099099666b.42.2025.12.08.04.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 04:29:43 -0800 (PST)
Message-ID: <4d66229b-5d27-41bc-950f-534d489a8371@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 13:29:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Fix up WCN6855 RFA power supply name
To: Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
References: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
 <CAMRc=Mcx1E3w7roY55HhKZg6pqV+NRkp87KYa5=BUEVJHOXVLw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mcx1E3w7roY55HhKZg6pqV+NRkp87KYa5=BUEVJHOXVLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aKP9aL9m c=1 sm=1 tr=0 ts=6936c4b9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=H3i9fh9EHGKSR6tm9dIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: UhMgDvtSvl6R_AA2CgFo1YqJCeBZ-S4e
X-Proofpoint-GUID: UhMgDvtSvl6R_AA2CgFo1YqJCeBZ-S4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEwNSBTYWx0ZWRfX85WfePf3ILye
 X50L6DBLum0sS/j7ev7Igq5O4ZKdm8C6MmU+OvRztl/u9NfpdVfQ10CDGX1LGBUaJnhZkaBDk4R
 rouzuUkV+Fg1aji/d0NNuG66tyzcsAFEjDDfmiBcedEGu1evGHABBuYj4soSFSq8NGjv1kkxWMR
 HX6FnXcVdxh32GPRhJYv/XHd3AwzmXvxyyrSY4chFO8hfT1645kDby03OfXeIU0t7qmheKmGXTW
 etUZqJA6hMohY0yXbYlndT+st36CjyJCmtXvW8JugRpbOssnTib0kVRPN9wIt8FYUcFb/AlzPTr
 Aq7hJN7+0iBxLZpXpD8QvZEKRB0UONeTKzqg+XisicHXCNuv0TgeBLjyDnw3i/gz7rCvLCQDV6K
 DtDIXWflSNtCWidyqy8L1SGAiChF4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080105

On 12/6/25 11:36 AM, Bartosz Golaszewski wrote:
> On Fri, 5 Dec 2025 13:47:19 +0100, Konrad Dybcio <konradybcio@kernel.org> said:
>> Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
>> closer to reality for wcn6855") renamed the supply representing the
>> VDD17_PMU_RFA leg to mention "1p8" instead.
>>
>> While the supply's voltage is normally 1.8 V, the bindings should
>> reflect the actual naming of the pin. Moreover, almost all DTs define
>> the output as 1p7, so that ends up looking a little odd..
>>
>> Ultimately, this is a "fake" regulator that is consumed for the sake
>> of DT sanity and this series is meant to bring uniformity and squash
>> checker errors.
>>
>> The last patch fixes up a less-trivial warning.
>> sc8280xp-microsoft-arcata is left out because I don't know whether the
>> mounting of the chip is on-board or as an M.2-y card (although I would
>> guesstimate the prior).
>>
>> Depends on the long-ready-for-the-merge series by Krzysztof (per-chip
>> bindings split of qualcomm-bluetooth.yaml), mentioned below
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
> 
> I want to belive there was a reason for it but I no longer remember. :( Is it
> possible the schematics for the lenovo X13s laptop had it described as 1p7?

I think I checked the schematics of an add-in card used with Makena
and Lemans designs and the WCN6855 datasheet.

At the end of the day, one could argue for both levels but let's just
have one!

Thanks for the rb!

Konrad

