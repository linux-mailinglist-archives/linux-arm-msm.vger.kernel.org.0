Return-Path: <linux-arm-msm+bounces-88082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0999D03046
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 14:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 042E931125F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 13:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5D447A0CB;
	Thu,  8 Jan 2026 12:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RyHyeQAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kf9YArCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76B0470F38
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 12:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876217; cv=none; b=VpvvTSnhnDPpfVr44P/Tqx6ybELoUicz+Zxbbpn5O4aS9YLhxEjXC3DSCQrx8Oi87V4+Rd0dHRSMm5clZTCP+83eBpYrTUAOsC39eKOlmDZU9LpyKZ9KBCyNcnTOVI+Ay8EKjqAwAOGkQmVAEGa5e1reMKM0KN4Kz68lWDIGxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876217; c=relaxed/simple;
	bh=OYfTyE+Smwwrvmj0fPhLrTVVFvufpfpQNZPG9JwoPF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKf0WXoySd9VV5uAjKAGAIth5Lx+QCcc5gJkgyofGb6fymYuEuiEpZCEZMwM3kEksjebz0H8K9/+9clcuInxgZfm7LLNLn13W0VBYYGHbyTrffZJBDuI4XBTxda+2g7+C8U2FT0/EXg4oWn62e3pb8rU18tA18wg2/ifk1vqiM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RyHyeQAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kf9YArCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088riKj4050027
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 12:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NNzfH6+c22c9ufgQvnvleCWCuCBPPhgb+gUxhkM23qw=; b=RyHyeQAG5xuc2ozm
	8Z24fmPNpcsqJK5Bu1jj7+5ujnlOAnN/nnNOy6W8oIpkbH6FW9g5qz9Ir6Ky2XAB
	hEKKzUnV3w30xQ2VsCrtAsMctrPt8YQy4xz0W2LBKxSp8e0+Cwo4atZ2qqLUzEnc
	7cQ7zWwwf2FoTMWPEEU1JYZ/7bwjz8xRegBh8cFwFSYdqyPbsUyWjd4jGsEjX7kV
	7ONEhG/2t8Oo0FQrYhWHmqEVoznx6VdjRjZMcF7dhwpxoCQ4Yn43iTOKF9MObCit
	asG8sOdusVS4rrUF37wgPwXuC0O4tIo0DiZ88qLWjYuW02j86p87HR1xKTiyMWcl
	yslfNA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8j0re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 12:43:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so7679331cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 04:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767876214; x=1768481014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NNzfH6+c22c9ufgQvnvleCWCuCBPPhgb+gUxhkM23qw=;
        b=Kf9YArCCmFMk11Hxbi4+nHK+3NjA+SWcEWGNHKjh/nbqnRWFzyw2nIRGRZqUk+7TCd
         ggfXDk1pCQPXDCFjm7m2tr1KCpfiJY6xFg0IQ8VdEtmFXAn8rwotLH4g84MfyYEOqZ08
         MvzJmpQHn4LXfo+uo/AX3ZrzNyt/tk2XUW0tzdQ6vSRPQY8D/uwERjUHIX2clRiIrsQV
         RRLUuUQPr3NCqedsBIiDd2BzrgmDeivsmH6Ycy35IcKu+TS1VNZqSqNbnuAymNLepg9r
         CX5F3Zzm9oaAIsWpKypOCQokFKRB5rzzRtHNrSl3NiHnDVTIUShQhOX9T1FrP1rtWS6k
         PQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767876214; x=1768481014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNzfH6+c22c9ufgQvnvleCWCuCBPPhgb+gUxhkM23qw=;
        b=YY9BZ9R26WV3KPs2cy3fdBnCZn/sIYbaWsITavHt3lZlcY5j/kkvBvcw845m4A6tKd
         h/jGnRNmquGJvxWf2MTLyRXme9MAsBbH2vH8EAonOt1hvmLyBVGw+J/MErgfxymFBWfo
         itEGCtsuIE3XC66bzI/XJyJWsO3VQQc37yuqKfF7p1V1wfAWAUzKt1i0flOmKQLRky9m
         7KOy1QDXsYEb7G7YfcW2tAjDgFu77aJ7C8sE9SwOJFecy+m5p8830Te3U9k7oROAC8Th
         TOf1JPb5XHBYZYlmXLkGNHsqbcEZAxKG7AYsqzV4ESxb0Uxq8tqwOH5iNH48ocKctA2N
         V5lA==
X-Forwarded-Encrypted: i=1; AJvYcCWG6/jlwcgd6BOzCBYLTLlBjcdiuZ2ZVdoP5FdEjclaLd14xup7o7Ud+EA+DpvlxC75yZbs/gbUY1gy+Z1s@vger.kernel.org
X-Gm-Message-State: AOJu0YwqqgPeqzWoEJ53wyutd4fZrTi3hVxFKqfq33m0dIktZQrgT+yy
	Ya9tYdp/q/Xh86KL3Ix44M9TmCLGE4BevoLH1a54KWZ93XdIwC1d1bK6kRr5H3u36zQOE8DQ7Qt
	04kw1baOxLLgD45RZq91kDLLCapltvu+VsTndeeWgbPOQ90SSo3dpnHeeZPYTkdoz6y0/
X-Gm-Gg: AY/fxX7CL3dOx91+G6ai1r7kHnPSjIWEbiuHIwfGouWtfNNUv5ZmJ246WIqLCO5BVj5
	/wv4CzU9GSU1T5SRJW56tnB4tBVKWVb4GTQ/0aOAPA/f7jioUrwIHdJoc9/lM058Wmyr87JI92X
	IkNMzTZ/ZK7fqSVIflDWg5Dvt57QDn1kacY/uFBKZRRO7wCR/TxZdk0o/eXMiWK3pTK6ICe1jvB
	inUUY033ZcDEAtxtVXPgIhhCkLAWIEatA7P/pZjVH5pBQbayMvTANhjHih10fI8TmxdzVtgq1b7
	fG06AjSlwKqOboiRLaZ1M7AQe/pGIQ5OzbPWHIGHHQpKbLfDH+YEZYyl0cQkZocA4IhjW66rOyK
	+vWnNiAfFJLXNRvoJ6wK6B0qRECamRdE6AwZ7fJAxcU61IvpW8h2cxFh4mpFZk+TNq1Q=
X-Received: by 2002:a05:622a:2cb:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4ffb48d3b42mr64410301cf.3.1767876214108;
        Thu, 08 Jan 2026 04:43:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3bP3jkzHKz3spcjo1FNDFbjTpMwdJwshY99+/AELG9VJvKEBUlECjvmhfGb1PCNgx47kPPA==
X-Received: by 2002:a05:622a:2cb:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4ffb48d3b42mr64409991cf.3.1767876213589;
        Thu, 08 Jan 2026 04:43:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d51basm7484207a12.12.2026.01.08.04.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 04:43:33 -0800 (PST)
Message-ID: <ba3f479d-1233-4e6a-8593-5c7fe5e79762@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 13:43:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: agatti: Address Gunyah memory
 alignment needs
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <20251229071258.456254-2-sumit.garg@kernel.org>
 <ahbbg3pffedrjzvksgz2jv7lwajwlcxc6nsmmtunwc4346eawa@xayff4ozvdbn>
 <aVtQHftDmENIAxrb@sumit-xelite>
 <73bcf4c8-3d49-4b55-a771-0c5c1ef54380@oss.qualcomm.com>
 <aV-L81f5NQg4leu8@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aV-L81f5NQg4leu8@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695fa677 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8cjB7eQHtUe5wF3l764A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: I2tAnAHehQkkxh16Vbi0cjLiHOY_lrqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA4OSBTYWx0ZWRfX9nvUWb4ZRWqa
 gg0JSzHNsfOalXhwrZLCvYCOWUA1HG4Sp2aiX664RiJhGNuiCcFuBVjXoxikBHjkPlD73YT+yw2
 cYoT3qsBzDjKdyelBwLLm3mJxqIL6aVr9vZWGHYb4E4upBhgMFpSHKzaIMeNC2P3NHzB3VrlwCp
 82uZM85RU4VYVngNOblpuiQEIcgHeg1/hwK7y+gVI6HbApgrvf0nyz9TpeFEtbQNG1uuSLLkbIc
 dZMbDAeBiCZ8wxkCtxK7cjgP+pFBOYrrgJgC8SdwlyfpLxhWWXasOuk9a9NFgdhxQ2gfubOKl2r
 EV5ikQ3kv+gEfdOCn62639g2ExrYdtbxrPP09AkWKM4u527kcEfYpS5OqjsESyzZuVRDZxeVzx2
 VT712vwJrfl/Uzq2ODJDBOtBOXT3IigNUFZ1fy6xuxW2y7Kg+TMGeGV5zPVsCG9QL4hgAn1SLsi
 8R1no9HRyYNqmoi+ZlQ==
X-Proofpoint-GUID: I2tAnAHehQkkxh16Vbi0cjLiHOY_lrqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080089

On 1/8/26 11:50 AM, Sumit Garg wrote:
> On Wed, Jan 07, 2026 at 12:29:02PM +0100, Konrad Dybcio wrote:
>> On 1/5/26 6:46 AM, Sumit Garg wrote:
>>> On Sat, Jan 03, 2026 at 09:49:04AM -0600, Bjorn Andersson wrote:
>>>> On Mon, Dec 29, 2025 at 12:42:58PM +0530, Sumit Garg wrote:
>>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>>>
>>>>> Gunyah hypervisor requires it's memory start address to be 2MB aligned.
>>>>> So the address map for Agatti is updated to incorporate that requirement.
>>>>> This should be a backwards compatible DT change which should work with
>>>>> legacy QHEE based firmware stack too.
>>>>>
>>>>
>>>> How come this isn't conveyed to the operating system using the UEFI
>>>> memory map?
>>>>
>>>
>>> I agree that with EFI boot, the information is getting conveyed via EFI
>>> memory map. But there will be non-EFI boot scenarios as well in case of
>>> U-Boot. And moreover I suppose we need to keep the reserved memory
>>> ranges in DT updated to reflect the actual memory map.
>>
>> Can U-Boot not do the same by altering /reserved-memory or /memory/reg?
> 
> I suppose you are referring to DT fixups here, we generally try to keep
> them to a minimum required in U-Boot.
> 
> BTW, don't we want to keep reserved memory ranges updated in DT? Or we plan
> to drop them altogether?

Generally I believe they're only a necessary evil..

Since Gunyah-on-Agatti doesn't seem to have been released yet, it would
seem like a sane idea to fix the issue in the firmware. If it was, well..

On UEFI-enabled targets, we can largely rely on the reservations coming
from there, only adding some carveouts for e.g. PIL regions and SMEM (not
because they're not resereved, but because we need a pointer to them)

Konrad

