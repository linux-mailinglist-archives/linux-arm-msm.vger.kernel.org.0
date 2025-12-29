Return-Path: <linux-arm-msm+bounces-86766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC3BCE5AB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 02:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A5303002A58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 01:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F242721E082;
	Mon, 29 Dec 2025 01:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMOQhJpz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+/ZaMqa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6510917C21C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 01:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766971421; cv=none; b=CKoi5yOYt2pFTSv+wSJhoMxO996GVCVF4E/hnh1bLNVVrCwXIkeWKy2ck1w/89Oykq+j5+PSgyXV0893oI4wmYjezb50W+RDgl2Q6LrobgurMbuQdyihUDN43XX+DQcmpeMT5s0Gfv2J7kvR0wF3uVkEgo2im4KMAknMKLx0m3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766971421; c=relaxed/simple;
	bh=h3ByiyO+qZwWm45cDW+SKLguEkt9La230EHaIOqCRng=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YpnT33SgEcJMOLD1xEFLyRx87C5kVd3e2yEbsFT1Gkbub7J9MknVFV5jsK/BKDtYOPff1T6/hxiNROXJaJtf78IU2w+0BTHoOFd8K72H9Yn5kcuXlVVaZvyn95gYTrsbrcPTbYZso6Ia17BwHy1gf4K2UbkYYXG4C0D2Udkiwyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMOQhJpz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+/ZaMqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNv1Ih129763
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 01:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h3ByiyO+qZwWm45cDW+SKLguEkt9La230EHaIOqCRng=; b=XMOQhJpzFyWGn8Zl
	6ZKeAyYnBEmBlLMMNPBLu8kOlkrotSeyO/InKKLo2/3xqmUlurxXEhx/1hlhVJ7a
	LtHWh96D0h00U7bXYrGhzOxfAWdu5bRPiHAMTWIxeNNiLKu3UjSk8SyDh/6K0si+
	ki80pQBfJKuw/f4RwV11fPJ8SEoD8zqd4HGXEREmi2clzgjZa2JPpSaAoBhXMosm
	+eGWjQWT7GOh6YV8XPlyvQN3exrAk3E3xhAxIuwMPApjSBC+kGicvyi3yw1Fcfkb
	UtXUuRD3x+G5V0Kmej+SzVbq4WjBl9iWr4IDodHtwn4QxOz8n4Xdi08NTQ8IXtV0
	lUnqkw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5jy8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 01:23:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7c240728e2aso18922973b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766971418; x=1767576218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3ByiyO+qZwWm45cDW+SKLguEkt9La230EHaIOqCRng=;
        b=B+/ZaMqa5RyHt8Bkcx3XSgyDfFhWijrs/eYrZnQ0CCzXLy5TsNVHPA06I7NaAx/S9V
         IrqzjxYu6fxDlTx2BJWx6OXwzW1+OMEoCAiMIY1efTOb6esbkFs1Iv4qohUtoTB2+hi8
         aPCFMS2psq8B/E9xH4VB0sZtcQflAKrYzzK0xwSXRcbdTp9Dv94DlMXF7Nd4QgdYJ48h
         sCvSoqgGuHdlAzrhwK63IhhcHE1yOi2pL3jUUskr2v/5/ALcNXhvuvcDAxnYD4mMCs42
         eRLZ16XT9chNQaEy+pxCevnJQyGSQ9AoNx/b6ehp+UZ9RDmKMDqE2RAdbTUeHWSjvUGr
         drYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766971418; x=1767576218;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3ByiyO+qZwWm45cDW+SKLguEkt9La230EHaIOqCRng=;
        b=OAv56x8+/TuzVNBJR41/DuMZSvY6d+KzfXnOUUbT14zKdXM9BRinIJPC+9p9Yt6Osu
         N9iVgMjr+1lYI835cIGs8eEi4qxcVagDiwNSCE7j8Tiyl6ij3K24yxydVTYV3/sbmYYK
         7Ii+jJUaVQa61fpfTkkHGMr0Qr60ycAu46v/Gvk5PPTq1F5ibX93BujK7RhEqSuBSDB/
         tY/oPQ4+mhptgbbpmS5EeN9jJSHs1IaRkG7rax/eqZGSzHgef5uySmBdiuZmsGPRoweq
         hnsuZSSV8NhsmZ3xHZRs9Mc+SkMI9Vu+PNl8xDFeY80PLFmRWyDlRsoht3HB+J5PkJ+h
         XydQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqhojiCOHufpG0uuWU7+SGeENNbdOuqsO9qFenpeUfZMvFBYES1KNcOBOsdGENtgklhZ7SvOZlcWe4WRjC@vger.kernel.org
X-Gm-Message-State: AOJu0YwSL2CMP1IZGBnVyDdGUkECYEz72lKLm3K05N+gi96cPR6UhnN1
	kTcq4HYh/+RM+R/xYMp2HC/VwpsmYbGSnmMImtCKGJLhQzCQHGo7vcneHY6F+epX1UAHVnPZisQ
	eWQn2ClIQF3R9ipUrZwbE1ydyt5d0METBY5bYc6Axbezl6XPWr0/TNqwR52sKRwTiy75r
X-Gm-Gg: AY/fxX58vLRcu5iMPOCXr5QIyEmDuqU0r6K4Oq0Tv5ETY26sN6yXJrm52gkdOV6Q8RQ
	uTjl96icGTJy+AZXQnBmdH1zy7vA4S3OCcQuvblaqz2/x8SSF85ZBPxUS7OLm1xItI3ATh67x5f
	QzG0ejaEaGFXwj+NJ8swwaplVcgFNOx7W9XWmU2KIG/NGQrpSh7EdKA1Gvxrp62WcNu5HHPnhB2
	zqHwtLKGkmZNOLNJkUsFBKygw/64CG3i227wCYJ0wjbaHOiVCbd4bV6DwpHmuLU5LGzqR3jEyEp
	s81sY1eHC/VCENoSwoo0ht1D6F9LAjzU5x+Mhus0EV64i1zjOvTnd6zKZyFkxQlj9kJ0KKxmJdh
	pB9JgGZRZJ7duUTmd61C0kP718IqzbPsCJTDC1QaWt60EU/6IQZfpyIIQL0VFuUF049dK4A==
X-Received: by 2002:a05:6a00:1ca7:b0:7e8:4398:b36d with SMTP id d2e1a72fcca58-7ff66c6b029mr26705751b3a.64.1766971418226;
        Sun, 28 Dec 2025 17:23:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF57beAFXoLQfaN7nUzE3lasCyqk/WiGfw81D/UVS9sdMdYvKqvKNCuxa22U3+420FV/pHlzw==
X-Received: by 2002:a05:6a00:1ca7:b0:7e8:4398:b36d with SMTP id d2e1a72fcca58-7ff66c6b029mr26705731b3a.64.1766971417746;
        Sun, 28 Dec 2025 17:23:37 -0800 (PST)
Received: from [10.133.33.21] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm27696979b3a.33.2025.12.28.17.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 17:23:37 -0800 (PST)
Message-ID: <4f79d090-7d1c-4fb3-a835-a7e4ff96f79c@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 09:23:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
From: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
 <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
 <b8f0e8d9-449e-4f32-832e-f1d5597ff496@oss.qualcomm.com>
 <6421f044-2b07-4518-9edc-b9b2ef49f4fb@kernel.org>
 <8bcf058f-5bf9-46ce-a188-e94954101f2f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8bcf058f-5bf9-46ce-a188-e94954101f2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cXEFeRckf6PmLsdOQ7WWCCn9GICbLJhY
X-Proofpoint-ORIG-GUID: cXEFeRckf6PmLsdOQ7WWCCn9GICbLJhY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDAxMCBTYWx0ZWRfXx47Lg/owr4p/
 8Lr9QdNRzwaPamdHytwx62R+WHEruDW9VJsTkqGGurRTT7sqzxAePCBEtKdTQrI7TCrePw34gZb
 2dufT3gGHtEuQuLa7hXYBsfcSECa7DGMzwAWfUjtDl7CooH0NwgDEhsLOyIdpJJHqGPkPQkrRLv
 bkuvqSKzCJHBMSuqZfAVn2q75i1h3RoE8V/0oh5kTS7An+6cRzs4pObyfJeIWme2ofJSaeEF/fx
 X6T8qYfxH2k2Y2y26L2RjyQbGqk08O0w5uQ1KnYF7cumHXPZ+M1B0Wvtw2OHloCTB+5wg504b1Q
 1/qcQguDhP4SQR1f2ZgZcgMvjRo4ziaiFQZvteLDk8B744yWVF8bhJnP22brIjouzw4LXYPnqfE
 OvVr4jKiQg39nlBfjTmkBTv6DaVq7HSr9OSZ1kc1RvYzdsVDaYWLec8lZPjju5RmwfeXfiLfNiA
 qdaFYJARmcDylu+S09g==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=6951d81b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6y73sl-2QnXYpYKhnwwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_08,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290010



On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
>
> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
>> On 23/12/2025 04:38, Tingwei Zhang wrote:
>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>
>>>>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>>>>> the common components into separate files for better maintainability.
>>>> SoMs do not share actual hardware. DTSI does not represent what looks
>>>> similar to you, but actually common parts.
>>> Purwa SOM board and Hamoa SOM board share same design. They share same PCB.
>>> The difference is only on chip. Purwa SOM board has Purwa and Hamoa SOM board
>>> has Hamoa on it. 
>> I do not speak about boards. Read carefully feedback and respond to the
>> actual feedback, not some other arguments.
>>
>> NAK
> In this change, the SoM hardware except SoC is described by iq-x-iot-som.dtsi since it's common between Hamoa and Purwa. Hamoa and Purwa SoC hardware is described in hamoa.dtsi and purwa.dtsi. Hamoa-iot-som.dtsi includes iq-x-iot-som.dtsi and hamoa.dtsi. This change could reduce the duplicate code and review effort on a totally new purwa-iot-som.dtsi. If we found any bug, it can be fixed in one common file instead of two separate files. Same idea is used in x1-crd.dtsi. X1e80100-crd.dts include x1-crd.dtsi and hamoa.dtsi.
Krzysztof,
Please let me know your opinion on this. This could be a common case for
Hamoa/Purwa boards share same PCB. Share same dtsi file like x1-crd.dtsi
would reduce maintenance effort.
>> Best regards,
>> Krzysztof


