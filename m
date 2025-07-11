Return-Path: <linux-arm-msm+bounces-64562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1EB01BD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 711E21C26B00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E182192E3;
	Fri, 11 Jul 2025 12:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/6xW1ba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7346328BAB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236372; cv=none; b=GQNc7fN9CyQ+hwJDAQCVfsVXMZOgcowEKBZ/vDx0S6zurNYeitDclZ2JIo1GmVKtsnhCgBJ58AVyD/80QH00oDa5+SWDP3RDusBGEsMulhl1S/h/jDKph4E+eYpR33WDgGZELQyv7b/LyDJLCLd7t68bPDYzpB/9ipn8e3dNz9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236372; c=relaxed/simple;
	bh=LLrYXoDSk+Z1qUZOicihZi7zP80fK++DmxBSWtA8aw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcGs7jAXlEAfpbuPIaCZLO0ppCXJoRHl6caLMsiFf2/gH5TReN/W4QsyVwNusBehlkclWT6BrRdwKbWPnchmVXuWkwGMJb3pN3SaE1oja+3r+hvOEnOsyqFbpRJzg6iYlJtRergCPEslxDDzYKyK/TMt9ta2iMlfm/EIBaRi7DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/6xW1ba; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAv54X026192
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgRbANHn+bv7tnW2+OxW/Wh9yvUY2jb9oebM1Hb2GEc=; b=V/6xW1bar7YxpMdz
	jGzXZNSYsgNxdHU8lGqAXSpNawExd/RGkVrqkOD6mtiqWKNQpTilbpx0dNg7SO6l
	b9nQMyOYUC7gVGE0mLzat8eFRnjfLmtjeM+gtdMh394CzMC8P4d9qe0YTEcJ02B6
	v/uY1Vi6z8Qrt8M4SOwcX0n6pgsc4RJQpZmnJauGSFkhqknpoCnUnemdR9Yu5Lmb
	wL2F/UYVdNDaW1+F4MMpprOjkHCy8xxMNtrwPpEYmgT9NYv0drQ0ddQBQ+YzvaS8
	69imad4Z4wJ9MDC86nnIf3ghbFoHog7HnxWd4mZYdREUAvXClnF5q9q6oXEv7rkF
	oSWndg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1a2g6k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:19:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3ea727700so33057485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 05:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236369; x=1752841169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PgRbANHn+bv7tnW2+OxW/Wh9yvUY2jb9oebM1Hb2GEc=;
        b=J1ZjFPSSXrjoBd1l6aG4hHVdgsg1vBlr7N1NVQlbLdl1FFHTPKFVSr0kk/CXRXVk0Q
         Cme0X5Hmkbd1WcwnWS/o7f6vjU6ZvWZHeY/KsXtyf0Lq42nVFW8OLPVYisr2QbbSDie4
         Mtjgbub5dmXDCKDlt5PZi/lB3iuRk0HoRRAycnXiDgQ7XHdW5hfLJm9WsNvlXH57CO+G
         sz8WPMWq2Vw9VXNZEHdourBEK/sCB5CJiVpmYcqeI3uw8H3gJUpb8oq7sQYB8nyonv8Q
         CPryFvsJit6c1YLwWmtVCPsyM9kSKirLMr/8B7hqI4V9d1UyOSOIktUfmpjddTcNkZ9K
         apyg==
X-Forwarded-Encrypted: i=1; AJvYcCXvweytjUqGXPcFFoPXuatJbQwc8jO7Loh/YTk5yS4X7G588gmkqcCULCE0WostcBi+zpuAOxHCu2l9nX+C@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/R/ly8pJwZ3L0wf+Wmqz9tIN/JBzFMO9h5M+xoy5+5Cmq67Z0
	BH1kWvAIJag4b8V6mQjA66XclcF3f3lFKW8pAL18mjDA4oJx7Bxlj2scmCUwSv1rXsJtzr7rxMp
	dVFj82Q31EHYnVPTn4VG42Ql1kqG65BFxWqX83EhJ6bWNkbgAOdhtfEPIPoy0FLv8cGrQ
X-Gm-Gg: ASbGnct5Rl6F129lAB06Oe9AYxFqheuVgA6fhUn/ugZtwJeuyPMHa4/jge2uiRM/Swt
	OJheMjXDF5XRecS3dBvSOdCLx6/tRcFSTrWYYbZ0rqTe0Ck/OGkQ21L3wlIRV0vZVDdvkFsBfoG
	nY/fp0iyjEAu/+/Lc5803VqI1cX4BeH7gafEkixOmLZQUOFZ1/TLE0WVHDDV9VD6xQAaorQ2crA
	7kWNDBGR9T0mljn49yS/m9mKLRTtPxVhgVkY23CB1jzYCBxz1/HbMyY7CopN8GTCBSK5lYJaGQe
	QDpCdsj2k0dvEJrOpSpTDF6A2YSovHaQM84e0cI+LW8mQnbXuzzagu9Ekz9LsB/n8vh/8iPdpbL
	lReZjWhR7hR8yi94XqfjJ
X-Received: by 2002:a05:620a:261e:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7dde704afd4mr193293485a.0.1752236369426;
        Fri, 11 Jul 2025 05:19:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWdOt+nw01pFgLOuyNAAOJCd4H7cvcLSPFzBJPJCQX8U74WAVdoJLitJFP6NOrfYfrnxfZkw==
X-Received: by 2002:a05:620a:261e:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7dde704afd4mr193291385a.0.1752236368710;
        Fri, 11 Jul 2025 05:19:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e910e8sm292167866b.36.2025.07.11.05.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:19:28 -0700 (PDT)
Message-ID: <b9f6f827-78bf-4fee-8be2-74a9c94d9722@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:19:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
 <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
 <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MKJgmNZl c=1 sm=1 tr=0 ts=68710152 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=RgMTYWP1_r0sjz9xMRoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NyBTYWx0ZWRfX4KsPxe5AWV6c
 lTCE+3gYh//tcmTAJ81APe5zmZ8fza+JNUdCyqWOQISS81ldNOCLeaAfuFzmXzYECk4oVgj8iVR
 blIx47eSsrdHC4Rgbh3ggANWdzKFnVLqp2aMij5IJi750ImGwnz100MR0BaGl5yl2yK3qgzHv/P
 GvUeUid5+wDQ6JZz/9QBu2jbxZXOIRu0S9h9DybaXKiCROq2Ly8hmIfCDFVuRloqtAYgoRe6kjp
 qFwTmypg9OLizr5Q+fW2amyIOURhW2E7jx/9ckq30L9kmuMSaVg5Pmhc/wnobzEVY+1VfA00U3Q
 6ZP+D7rWs8RRaymgx8mXQf9/QWJSHaoayXBCLYjmd3BPZMFkSXUYx6wjjYhAF8i/W8fsTQX1M0F
 iU9vQpwYAhqaUMTkfEdr+e4fwIW2p3Gjum7hXWX4k57gyJ/pn7l+7cuj0qhhg8DbEfEpNjig
X-Proofpoint-ORIG-GUID: PDOloTywI8fbsa3zVwBigvDsF0_nUOpU
X-Proofpoint-GUID: PDOloTywI8fbsa3zVwBigvDsF0_nUOpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=884
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110087

On 7/10/25 3:38 PM, Bartosz Golaszewski wrote:
> On Thu, Jul 10, 2025 at 2:25 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Use the existing infrastructure for storing and looking up pin functions
>>> in pinctrl core. Remove hand-crafted callbacks.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>
>> [...]
>>
>>>  int msm_pinctrl_probe(struct platform_device *pdev,
>>>                     const struct msm_pinctrl_soc_data *soc_data)
>>>  {
>>> +     const struct pinfunction *func;
>>>       struct msm_pinctrl *pctrl;
>>>       struct resource *res;
>>>       int ret;
>>> @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>>>               return PTR_ERR(pctrl->pctrl);
>>>       }
>>>
>>> +     for (i = 0; i < soc_data->nfunctions; i++) {
>>> +             func = &soc_data->functions[i];
>>> +
>>> +             ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
>>> +             if (ret < 0)
>>> +                     return ret;
>>> +     }
>>
>> It's good in principle, but we're now going to house two copies of
>> the function data in memory... Can we trust __initconst nowadays?
>>
> 
> Well, if I annotate the functions struct with __initconst, then it
> does indeed end up in the .init.rodata section if that's your
> question. Then the kernel seems to be freeing this in
> ./kernel/module/main.c so I sure hope we can trust it.
> 
> Do I understand correctly that you're implicitly asking to also
> annotate all affected _functions structures across all tlmm drivers?
> 
> Alternatively: we can provide another interface:
> pinmux_generic_add_const_pinfunction() which - instead of a deep-copy
> - would simply store addresses of existing pinfunction structures in
> the underlying radix tree.

This option seems like less of a churn

Konrad

