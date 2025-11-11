Return-Path: <linux-arm-msm+bounces-81238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30AAC4D9A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8A63A45F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EA2357739;
	Tue, 11 Nov 2025 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1GuLTc6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4M76r5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E09F3563FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762862909; cv=none; b=VDBptFdupIet1A4EDO3k3/81XfZxYIuA5kWi0cALGXqRzUiuO2BCuodAYQAQKar0FezKBiQjNKFccz4BC2VlnngZMeUiWMR3UOE7gB56JrUKpqrO8pkF7OHbsx6jF78r2zn182jhodF4VlOy6jt/bsz+0YSRsnVGx+amTGhwUKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762862909; c=relaxed/simple;
	bh=SvFR4SUGu4cW5ZbpMf/jcA/WbZaZCA9MAWJUXdtWZjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKoI6f7yAxXx6qbJcLunYj4uN66MPquZiMcJvBTcJ290asjr1taWMJf4oRIuXrfhdde9xsD9dXM1RJNmKEZl3QRxEpMK2PobWGpLNn+lhPROquHIpeVu+05C0/NuteBAECm8QGSb+G0Qe1y2VVkMEQKwNUIl7X8RzDeWchuvGHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1GuLTc6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4M76r5M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGFgl2425406
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T7CzdlMWQ+IeGEz4WMLKxRJB/ueCtsJyhlFl+aTvX9Y=; b=C1GuLTc6pr4lM+jT
	NuhkcMQhSoYZdqY63tuc3bJAZgWB0WUF9VimdBenA0I0rqkvfzx0yOzemKFEjKzK
	DM7r3LqHSxIBXRxaTmbhnJduZTbAMRgYZIxn6HJWb6nsv0HAXS1AB8TW8NMLvlR6
	i9A7LF5RKvM8VIPyIChM1Je0ZNj3H5Z/xTKZYTCMNNda5CXB536l0CHtTioGoB1+
	QtqfGgNWHIieJT7H/MgXFMV0ZTDPodqmxtwIsPNofxXlMWgaLMyuMGog9i23i4bl
	v+rmuZgntnLDraA5zWnq4jbgZ2bULWO/yeN7s7in5hwpn5BIyVyw/fQDae4qLb8g
	RWY7gQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac2350hau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:08:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7adf205afe5so1335265b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762862905; x=1763467705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T7CzdlMWQ+IeGEz4WMLKxRJB/ueCtsJyhlFl+aTvX9Y=;
        b=h4M76r5Mi12Y+bOHVZjHxHx+CGCCX/Xuy5iuxXG3+hIT87K5AihKs4gse1exhkQyJc
         2FOZeaZe8JvZ5pPiyV1XkRsjZ1Erd0fIuTEtyCx7I1Odqyjw493EUTpzt87aSzk3Fq6Y
         WnQNCfBRviEgOJyS3e7dCPK3A0VaSMdlUdTCtu/wqPM9FbKg9vw6UIbQfhbAjK38FMzP
         EQnje8s0x5p7CVnglcGQ3G3PKsW/WF6RLVITDMP7H2qIzy0NgK/RtWztXAyufNCKdjwk
         oflSIIuBydSOOEF8pf9he3tBoYxo9dSxk7987TEsQ/VMOQeG/6aTSzYLrPMRPaBOg1U5
         +tEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762862905; x=1763467705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7CzdlMWQ+IeGEz4WMLKxRJB/ueCtsJyhlFl+aTvX9Y=;
        b=NSUhB4bVU8P3U6xN1BdlWKLCKj0AGi6UfwjsGTwkL5lvhWXH2EstISeqprRnlN8KDF
         OaV2ZozOHU0hM5T66IHmYXEFMMNI+tKUVXdJ00zvPFkKYGK77dyi8xR8UY7eyuNPoA85
         UlwFUx5vi1N21fWpCCeO0hezAYULM4SDxceJzMyoY39+w79BSzRKvf1jqqJP5F2PW5j3
         81tZeYdVQNAgp3IhuhkHwpls0jaH02eym2xSfoXIA81t5PssiV7CdpGuwKd+ZDusfZ0Q
         Jbdvdt95HlwK0sbjC/SHb8e8RAJKfHW75HbcTl4rX7gsURowL1h1LACENRRccq9yb5rD
         1XNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYvEMop9aExNMq0KXrO7q9/Wp9qFj2cuFkMfhuS6tQpDw+xc+FgCHhdxLlW/BFkOZJ3oWfKRP8FG40lIWh@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgoHLXS7gaOL7nPx3GnOU6AIuhxL6OumULoaGLRDrdLm3zOFm
	O1dXYc+dhCljnyPJs1W/SdnQ8RJ98vTgmWzv1Is9ZoSF0sTdFB8BzsmWsx5aePXVitTPDYEktFv
	TaV1lDG/fqFfziDa9W34423vuTXO8f31JSqbQ/29hs3vj4+vREH5dfB5+QQ0jeMk6QVl/
X-Gm-Gg: ASbGncvrxvm3ngHPAYGnVOm+0Dh2RLJvwhXhJVEISFR6rRK6McZTqsNqFGxyIM0pirh
	cs33olTXAreXocgiWkgNNUnvHYyACwJrpfonZsy39YRgBex+bmp64ATrFzGRE4QaO75WFevq/fW
	SbKzY5VIAoqcs43t32+DdODwuGfUtL/6riu/OQ3025/8vxyIeNgHP84RSK+pdCRWwkPkt30WLr7
	V+GwB92W+APxPVpW44mJ3LgracWQdtLIzf/8WDoiuHwRDRwauI7mYf1yd3t0QyoqXWynkbmgFY7
	hmtTq+ZB+iOjkPZDQxxxtXW8RfEjCQy34bWQAT9SasD1R8Xj64HtH0EsTADtmJNIwIYnFWGRrBz
	ne/dMR6qCCsfMVH5s7La3zR7xOkpzlY+JtoueyUT92RrZ8XjjLOBF3sIqnt5wiCDpwA==
X-Received: by 2002:a05:6a00:ac3:b0:7ad:386e:3b7d with SMTP id d2e1a72fcca58-7b61d28289fmr2184684b3a.3.1762862905314;
        Tue, 11 Nov 2025 04:08:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfLxpdZCrwEXh8MYxeokX8WrpMnxSbuXyqQunCLUDZW8namwwk6sJyWw1yxHcAu07O0ipKAw==
X-Received: by 2002:a05:6a00:ac3:b0:7ad:386e:3b7d with SMTP id d2e1a72fcca58-7b61d28289fmr2184643b3a.3.1762862904654;
        Tue, 11 Nov 2025 04:08:24 -0800 (PST)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0f9aabfc0sm14680451b3a.13.2025.11.11.04.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 04:08:24 -0800 (PST)
Message-ID: <e9f52ab2-747d-4893-849f-f9fbdc567f63@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 20:08:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
 <20251102-knp-soc-binding-v3-1-11255ec4a535@oss.qualcomm.com>
 <20251104-glaring-rebel-pillbug-a467ca@kuoka>
 <790ca394-cee2-412b-97d8-c6416b843010@oss.qualcomm.com>
 <b6717831-1840-4b9a-aade-ab2248e3f75d@kernel.org>
 <9ee07db9-508e-4c08-8f79-6ccfd9b646ab@oss.qualcomm.com>
 <6af33c1b-5b95-4efc-b429-5bfb9ee7caeb@kernel.org>
 <8cf870a8-706d-4514-a87a-a69b64521ab5@oss.qualcomm.com>
 <f539b21b-cfe8-4055-9620-4d5d8d108098@kernel.org>
 <9d80b581-5d3f-4b95-91e7-c73c113b0976@oss.qualcomm.com>
 <c2o4iouc6sm7frcq64jmvxopv3eqvrjxievwwhiwqw6ptwfok3@4qmpfy4yij4m>
 <5b1f8204-1f49-4061-aa4e-f6dfe5ae2a0a@oss.qualcomm.com>
Content-Language: en-US
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
In-Reply-To: <5b1f8204-1f49-4061-aa4e-f6dfe5ae2a0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5NiBTYWx0ZWRfX0tlVEiY2RqGv
 sLVDb6Lxs7DLl79P/RVu9iAXWS4nCYRoonR3/qWr6Kep6DwjmezQwfvNewQ+ij4i7OfRIdHVhKn
 /gdHWjm1rMGcp4ttXpWInBG1reJ6yzqVGJr6YtMQ4RIXDyCIWg/2ciEYeEnYuLlQ0nm2OWyVtZo
 B0m29cuTSGuZkeryskcFwBxIinlK3FHOR81Gxl2MsA9/ohEjQ/ZHgsfTxnNaQAXB+NjvkuuKRxb
 0TX6kL5lDTT78XfsfDntPq2840REPy3VNB42rRFVqt/l3eub/D5uu8Pmaic33QPiwXqRN+WOwbA
 P0XtlexPyyO8PsPoSO50QlD1EFsPMxXeTUVijgCMq+dHnH4qEH0MiHne3TFgtnU6muM/BIwepoy
 37+8EAkmaqm5nmvlcvd2SBB7nCYKpw==
X-Proofpoint-ORIG-GUID: 6uUXLDhUSakkSNEtdiSia5O_SfRZWRys
X-Proofpoint-GUID: 6uUXLDhUSakkSNEtdiSia5O_SfRZWRys
X-Authority-Analysis: v=2.4 cv=O8I0fR9W c=1 sm=1 tr=0 ts=6913273a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=eu2Mp1WK7IjEojur9rkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110096

On 11/11/2025 4:29 PM, Kathiravan Thirumoorthy wrote:
> 
> On 11/7/2025 1:54 AM, Bjorn Andersson wrote:
>> On Tue, Nov 04, 2025 at 03:58:27PM +0100, Konrad Dybcio wrote:
>>> On 11/4/25 3:52 PM, Krzysztof Kozlowski wrote:
>>>> On 04/11/2025 15:38, Konrad Dybcio wrote:
>>>>> On 11/4/25 3:37 PM, Krzysztof Kozlowski wrote:
>>>>>> On 04/11/2025 15:35, Konrad Dybcio wrote:
>>>>>>> On 11/4/25 3:26 PM, Krzysztof Kozlowski wrote:
>>>>>>>> This I got, but nothing here explains why you need generic
>>>>>>>> compatible.
>>>>>>>> To re-iterate: there was no generic compatible before, now there
>>>>>>>> is.
>>>>>>>> Writing bindings and numerous reviews from DT maintainers ask
>>>>>>>> not to use
>>>>>>>> generic compatibles.
>>>>>>> OK so let's not worry about a generic compatible. IMEM exists since
>>>>>>> MSM8974 and it only had major hw updates with SM8550. They don't
>>>>>>> impact the software interface though, so qcom,msm8974-imem is OK.
>>>>>>>
>>>>>>> There's a separate control/status register address space for each
>>>>>>> instance of this IP (usually far apart from the actual SRAM pool),
>>>>>>> which Linux doesn't have to care about.
>>>>>> Just use qcom,kaanapali-imem - that's the first device here
>>>>>> without syscons.
>>>>> So we don't want to move the existing ones over?
>>>> This was never discussed and this patch did not do it. You cannot move
>>>> them, that's ABI.
>>> I see, I implicitly assumed this would be a sweeping change.
>>>
>>> So should the Kaanapali submitters simply send a version of this
>>> patch with:
>>>
>>> - oneOf:
>>>    - const: qcom,kaanapali-imem
>>>    - items:
>>>      # existing big list
>>>
>>> ?
>> We have 33 cases of "this is just a generic Qualcomm IMEM block", could
>> we just make it "qcom,imem" until there's actually a sign that it's not
>> a platform-independent block?

If it’s not platform-specific, why not use a common compatible here? I
mean let's have a common "qcom,imem" start from kaanapali.

What benefits would a platform-specific approach bring in this case? For
newer platforms, we could simply adopt the common compatible and avoid
adding a dedicated platform compatible name.

Also, the old bootloader reboot-mode solution that uses the IMEM area as
a magic syscon is deprecated for newer targets.

> 
> 
> Any conclusion / further feedback on this would be helpful to move
> things forward. Thanks in advance.


Which platform are you waiting for as a reference? Or are you only
focused on the current Kaanapali?
By the way, great to see we share the same goal here.

> 
> 
>>
>> Regards,
>> Bjorn
>>
>>> I'm not a huge fan of using kaanapali as the fallback-going-forward
>>> since it's literally the newest platform on the shelves (or perhaps
>>> not even on the shelves yet..) so it's going to look funny when
>>> someone comes up with support for another 2013 soc.. but perhaps
>>> that's just how things are supposed to be
>>>
>>> Konrad


-- 
Thx and BRs,
Aiqun(Maria) Yu

