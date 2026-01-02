Return-Path: <linux-arm-msm+bounces-87257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A0CEEB51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 14:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD1AB300D492
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 13:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A72312819;
	Fri,  2 Jan 2026 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhpC6dug";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WlK1gP2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A840312803
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362285; cv=none; b=TFsZwWilVv2xtvob5iwBQSaanGixcEpyihlSPdJ2S7kvZ17IsJFJAcMZDJXizSCVY/gDgL5ZwixE67gG4JWdYm1WjgbeKyH5V2ri72N85noYRpZkKcyUaNoyhWTMus9ysSVKLTV9f9/ugsfXIIzwdLtZyAzMzIJ2KGfwavtSjQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362285; c=relaxed/simple;
	bh=1sV8MipC1LWZdrArTgWJG14vnKiaAJ4m/AHNLobfCKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkOfOtlSi0ZPCaPjsq4+S6PPwRrSqhlwmA66ZUX4zuoI3Ej+lGSZUg6uel6DoX/pN0pMH+j/7ODfXPPn5OMUWksBiRP68BkAuvjj5BhiGNFJiuQpMwdvnxNIYZGRbIJdBJhJ/RgubIQsCfD2rGffBf1Zi3dCmP9SHoa3W3WtnXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhpC6dug; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WlK1gP2w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WEC2207477
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 13:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXZonBfFrLlWUInQu9VdJssXOsC/CpSwdoDF+7WOCOo=; b=fhpC6dug0bQrpgy2
	8862cfilctnWJ2fwxDGm4JVnWUyVIDo1jBvIhZvwS9WbyjLRAjhl4l/NvRm5zjYs
	jnTl6ruMe7Fq0C9jiONvjwbun0MR5QWOa2VOitaQMoHx+I4SuBZ1WH8HitqmENuw
	g1QTgynYQrLTOx99YMtnBVh7ajuj+9S8fydjNxBDRAg12ziv7xdCYrq2QWEJkRJ7
	aYsYKbGU0G4PwjoCyxlnpuV/irz4m0BALm7Cb7/bviGVfAM508hDsKlmwHvSH+PV
	7iE1B0t2I0li5bOt/1OwX28iNwGebNWsZdEGaOZowYFvrk5wGX0y+tBk+siqhM7u
	W3mK/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74cm8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 13:58:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f34c24e2cbso41335991cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 05:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362282; x=1767967082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXZonBfFrLlWUInQu9VdJssXOsC/CpSwdoDF+7WOCOo=;
        b=WlK1gP2wXmrT/looXthQ+YhEfZKN6g1G0nZDi7NsDuyM+TpIKLL48aJS5hmrp0Kzcw
         r/YvHLSfhFS+KhUG95LPZcgonv5C2lweDbYrExWBImvNAfoY4WV4E5LYpx4z/lew22Oj
         +IM0HKjSANpnKxgP/otE5UDz/9JYdcJ84OW2faoQ7naqepXPRNbciamFUEIPU38kTjSG
         BSGCJzJfwQljVDILCXKzrJTdWmqIqKnzmi8SFXPLOeXU3UzUr59iSGCsa+ruV/Sa4Nd0
         XfGCZiZWuH5pLaLptHn1bIHkb67ywe2xkxtX7FhLSydljz8QRAmUNGxsgQdGUVisAbXb
         reKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362282; x=1767967082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXZonBfFrLlWUInQu9VdJssXOsC/CpSwdoDF+7WOCOo=;
        b=KRr0vHKvaML+EMYrLJoTKUkv2yv4dmCE6YNGs06g0LVEsxPQRftfpHW28JPJvLOUhy
         182jlEyEUzBy9UAobAXcI6OtLc316Ggq24ib9bcvir6p3Ix80C9B77bvJu8F3pPytoGg
         PLMElcsS7mvOZYUHUHndRsuhqROrAdGE8tgbx6PJcrMg7ZosUXaxGXu66WVEG15VU4BR
         1UBhXLh7m7QMORKxYvyXmgNkbx61jAJVp+nliNah9SRKX6xyFOxogLJZxE44Sd7Th7cC
         XxvJywO3PLJYEfawjG8ERlsbr9T9t0C+atdr27m6ukkhfwUgLmACvDEpaFJW65gxt7tB
         tkSQ==
X-Gm-Message-State: AOJu0Yy0mUGNA3xTiOtjDG58cA46pF+gYsoAJt1ra/SIuZ0JXwrDmpE2
	rhy49QbRgEGoiSLLsbgF1SRiBraHY44fB2gglB8gs3qa/QZ01Jdf1cHHYkHCMEeLlNN7G2H8oF4
	D9DrCJeOvlx4uIcW4lB5A9SAwQvKCY+9P9GIiYRAztTMYdfBOaIpFF7QrDlhvAQUho55E
X-Gm-Gg: AY/fxX7ihNZQGYbBW0cY55kDZ7t6D6ZCVTKFSEIhFnDJw/4iZ6lDNJc4egN/0S0JRWQ
	lrSd3w03v20QdnsOB4mMa45sUnhn3SQTtTfSBjLcVvsqIhPLBy1eGSvQdEh12JiKb79oBoAGXoS
	33BVuxj5qBSg2j7sZ+Duf1xQ34UxdbPQZRrtfVEIx7oVlRbqERVCxeMO6Hb0izlkdDO7XksCThc
	Butl64FyuLfH2bKSoTNTNmZcEVfwTyJxXZzyAVFMV/G68U+YdPB8Bwz2fICKHutRaqLs/YuNQ5q
	A+tOdPaI3RfTnEaaV6ZigFvWRF83cU2VohB4iKccXI9VuaMFuHiv++IhfKJLhFSZEZGHAhpBdh2
	OhrBNynHR2ezvq3NJLlRvkCSIUQzNJwmt5uwxJUYmJSakws/QyptdxYin2fR8EOntOg==
X-Received: by 2002:ac8:66c7:0:b0:4f4:b373:ebf with SMTP id d75a77b69052e-4f4b3730f72mr333863571cf.8.1767362282312;
        Fri, 02 Jan 2026 05:58:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Y/WQ8VpeHWMYOtwRnUu1StCNtd8fnIuIk1RT/81Hf/IE5HzOME5xziQdtKVDZLPfJJayvA==
X-Received: by 2002:ac8:66c7:0:b0:4f4:b373:ebf with SMTP id d75a77b69052e-4f4b3730f72mr333863211cf.8.1767362281838;
        Fri, 02 Jan 2026 05:58:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9ef904bcsm43228684a12.22.2026.01.02.05.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 05:58:01 -0800 (PST)
Message-ID: <e917e98a-4ff3-45b8-87a0-fe0d6823ac2e@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 14:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
 <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
 <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
 <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
 <4d61e8b3-0d40-4b78-9f40-a68b05284a3d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4d61e8b3-0d40-4b78-9f40-a68b05284a3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FKnWKXm-t0zwk-mIDbdlMlzKfweOfv-O
X-Proofpoint-GUID: FKnWKXm-t0zwk-mIDbdlMlzKfweOfv-O
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6957ceea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=LvUvCMLUZ1wwccowk60A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyMiBTYWx0ZWRfX4PjTIrpZRtmY
 Awf+aNreu5Kfqus5ef13T7Gfbt/Nd5YQvIpJEATdN5nA3wjdw4+oeNuvaebX1a+Xdwn3hi1qD1Z
 k6OiJRBMFt1FAah3nuZv8lT+/Qgg+9dDVHgRaSZ7GI3yFBBc6THQ/86Q62bDSIZLpJH9wVDtThz
 LEN4hRwnTt49uxClSOkNwid7MYvPT/mK6eGK9QH3tq3wTTzflNIOvpUQpaH6syVB7lxJjKfvvj/
 Jm4ivQ1xAlSm7QpLFmOM+yR5jdRJiNGBR5X4FlyH/l3o02XQInRY8P6LDfKfq8AVH265FgrpnYE
 1Yt4JqlBTkZWKZd5Yu68FB9+TWWrmYnI+BRnp68UOdz/3Q4E4oi+kTijuI68nO6dhzPNHhX+iuM
 S0To4F7S/prALH7/5AqswXl6glvKXfAZ8ZldymZGEq3bWwplwKHMyYn6Fvjx5BJVsXvC4hTMCDh
 JjHPZ1vOJAAy+bLzTLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020122

On 1/2/26 2:19 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 1/2/2026 5:09 PM, Konrad Dybcio wrote:
>> On 1/2/26 12:36 PM, Krishna Chaitanya Chundru wrote:
>>>
>>> On 1/2/2026 5:04 PM, Konrad Dybcio wrote:
>>>> On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
>>>>> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
>>>>> can happen during scenarios such as system suspend and breaks the resume
>>>>> of PCIe controllers from suspend.
>>>> Isn't turning the GDSCs off what we want though? At least during system
>>>> suspend?
>>> If we are keeping link in D3cold it makes sense, but currently we are not keeping in D3cold
>>> so we don't expect them to get off.
>> Since we seem to be tackling that in parallel, it seems to make sense
>> that adding a mechanism to let the PCIe driver select "on" vs "ret" vs
>> "off" could be useful for us
> At least I am not aware of such API where we can tell genpd not to turn off gdsc
> at runtime if we are keeping the device in D3cold state.
> But anyway the PCIe gdsc supports Retention, in that case adding this flag here makes
> more sense as it represents HW.
> sm8450,sm8650 also had similar problem which are fixed by mani[1].

Perhaps I should ask for a clarification - is retention superior to
powering the GDSC off? Does it have any power costs?

>> FWIW I recall I could turn off the GDSCs on at least makena with the old
>> suspend patches and the controllers would come back to life afterwards
> In the suspend patches, we are keeping link in D3cold, so turning off gdsc will not have any effect.

What do you mean by it won't have any effect?

> But if some reason we skipped D3cold like in S2idle case then gdsc should not be off, in that case
> in resume PCIe link will be broken.

Right, obviously

Konrad

