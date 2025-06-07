Return-Path: <linux-arm-msm+bounces-60508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBFAD0C34
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 11:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BB54170148
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 09:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B67B184F;
	Sat,  7 Jun 2025 09:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvjGFQ8I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D9B2066F7
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288992; cv=none; b=tfw4trb9dQyH+DLAEVVQMsDLLGwojXEqRyblbF/i6jKrjje4K5VQYmhkOg2Yz9EDjtpAu2wi6FtaCxxoez6zq0My+AgrpQf4gTgilGg3R/g2uc1QfUTg0afcaT0DNatEllBaLvP6MWTqncCStW9QgOX+FXSztLZexBxUbulrkYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288992; c=relaxed/simple;
	bh=tIQYr/Ordh7OK5YzdnX/mG43lQYgIZRGZaOsLsEmcy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6d8OkXlJp69yNhb2k9gHkyYS+x2rSSHphtiDUkfxmXABggfP3RKjxVrwqxuDtcQtuuUU07hzA/ZbfT4hotH7pK15MKkNfGsa/MqCgJi+wtDoOnYdmPZ5b6vU0GCYLb8hq0A1jsJ9EgAQPHb4HbtDJlj2gBAMJU7DUMG5m6VMTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvjGFQ8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5579FclL018166
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 09:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuDm4+B4e3Dd8MAQolF7UDe8UurtkEq/T3uR5DRTEX4=; b=HvjGFQ8I98ZKsNV5
	W36QjSAKncaitr9eNDRj7mmTTplUaAr76BoYacACfs3jc0XqV69YXwTgj4QyVenr
	C+SvCGx0XyKMBaHnJEh9FZFvn4ngm+b6qEfFn0TqEU/8v+3bs3l+JSrZxpOBXrx4
	FYTzX5WDTkgKJ+c2IUPV5khZt5Lmsxi/7RcvZpL6O/uY8Dc740ziXlnBQjPM0FVp
	q/WXwU694M3+ufYsERl6PH5yESLDW1b5dRUYI9TU5cazihXgphRRmpAoQijQsR0M
	t2iy+DUDBZFUZUuM2lgsAzgCpdhgy3f3TSA1A70YcnP8/d811/rj/Gud7t5dDD/t
	KLZ7/A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474asrgka0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 09:36:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6facde431b2so5364726d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 02:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288983; x=1749893783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuDm4+B4e3Dd8MAQolF7UDe8UurtkEq/T3uR5DRTEX4=;
        b=r1OnnohGKI8uoKyD3lfW44oCQol14YVlcc1JnELzr60rVxWiMIGoAxYCsOMifCJQBC
         U25iR9bTR3hLuR4mBd9cuoBRRbJIElukIzInBTPYp4yOw43ea8m2rz07+26Wptd90HX4
         4pL4MkxU8z1Hii6hwIoWXcDwrbGpohxtYSxNvtBFGm5+m7GleyndgfRBxV1QzNx6iCip
         CasAKtqwK7uMv7VgV82NjiRwXJ8P9WtAI1iQa0h3X46R3CwUstf3lCUVQYd3REnAQkbV
         SBtIp6VNQsA7PY52YiauxkGhZ+BW1Z15AVaXBeH4IwxkFRKPNEGJv3MjJCWyo3fgwQh/
         XIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxkWql/FlTiZU/L6/NvGjwBY5Ita+DCx9MsRtY9XlhLDPK+5O3U0o0anRkefbsrUWAqaDSmozHvW06YXWW@vger.kernel.org
X-Gm-Message-State: AOJu0YzVa5LYBT5aKjNqmNHrmx6ZbFCxYLGRvMhVzydXRTM+sivnowJC
	2h0XQX+wvvxUWfSZctXT1vngGVJ1Mgs6loeeB6/3QEZYKZeZgO2/4BTOKHhDYa2coHoq1mtg/nr
	yJCTSvER776oEarDXcACV3IjhL6R6OW4QOw4aISoF1M20MyxJXT5gXH+qleh1z3DQ2M3r+zbjrU
	Uz
X-Gm-Gg: ASbGncsKRPvsFLldHr6w7CaOreHseEl5j0sviVVWVsbTVdGEOaXoW/BkC33Vp9czcqd
	JUQh5sxtgzN13HWibcym/RgBAnbrOI2iSWNBAu25RLyLjl0ush+5QT5a0sJDTI7t9Qebm9SKa3b
	wgrgRcCeJ+wYveUTRjrtgpA7uPLpxN/JWA5EaQYhSB/1zpfQv3TL/b7KGvBsZDZBiGDmq+F8VUg
	xQ35mn3KAVQQ8nnP/LcmBctNNprEfX8kYPy0gpsLSVFjN1j4gLy6mWaxA2tltLsCfMdf4p4Re0d
	QkjN5eM43xWWCV2vFkA/46LZYL0uRT+SS13yREEUCwsGfrZVRlxI42s1wZwaVUAu0A==
X-Received: by 2002:ac8:59cf:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a669071b67mr34528371cf.8.1749288982929;
        Sat, 07 Jun 2025 02:36:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYvbjyQGYgwZ56zsisRNOil/dKyTDCJmJe5RoUiP1hR4vrYDOMOtfIuvUy4SKey0WEsD0+kA==
X-Received: by 2002:ac8:59cf:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a669071b67mr34528211cf.8.1749288982538;
        Sat, 07 Jun 2025 02:36:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754235sm248538366b.5.2025.06.07.02.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 02:36:21 -0700 (PDT)
Message-ID: <c98ebb32-7207-40b4-90d1-8bac62d54c8f@oss.qualcomm.com>
Date: Sat, 7 Jun 2025 11:36:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Arnaud Vrac
 <rawoul@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Hans Verkuil
 <hverkuil@xs4all.nl>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
 <btmzhyullmggev43b3syp3anxlm6o5mpz2mthaskuyl7kfx5gw@w5gesyaaytkh>
 <CAN5H-g7WLsowjW6CMee5T=W4Lmia9mLWGgX17-mOMjtBo2SwvQ@mail.gmail.com>
 <b9b456bc-beb8-769d-5f9f-e13b8860e659@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b9b456bc-beb8-769d-5f9f-e13b8860e659@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BHC8r1TEQH-S3EcGslsQ8icJoGfUGiAz
X-Proofpoint-GUID: BHC8r1TEQH-S3EcGslsQ8icJoGfUGiAz
X-Authority-Analysis: v=2.4 cv=AMUSjw+a c=1 sm=1 tr=0 ts=68440817 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=7X0xE_O9oehTbdelYikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA2OCBTYWx0ZWRfX4wpl1jzOKeG/
 NEqRm4EoB8cfRSK9qxMHbwMyIYUfty0QMq0LlAieywL8n/p5y/82/LzCmBK4QpMH8MVuzOuNTQX
 fGwT1bnbSyVV/dL9IdFsSEzez5u+RgZyc1bSwo3G129KWBgMi9rghxLKOc9ZxAl0PWUl1ruNyQ+
 zQJwZlWtEC6Y9vGFJkzNNceNQ08amzBL1lfMCvEqpMjn0wpuAjEAjUEaGcCyUb2FMp6pBBcsjym
 plq2g2hFI8PKLbWU49AUCyMdv0NbARa6aB+1ap9nikE4rk7oHufDC0P0zKC/cd9QneHusOZ0vVv
 RCrFD4lKm5w2v6sQDDZAYIDheRet8SwBZm+gzfI2ZxPodC1XkA90zTSRHlD1EsQ0gnQ8ePCtWp6
 x8t2QPrUOHNEQTXpjj1R4aAeHaj8rrffR7a/heu+ODTJdmx+z/XJETeFJfxNN7ch4pnXtL9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070068

On 6/6/25 2:14 PM, Vikash Garodia wrote:
> Hi,
> 
> On 6/6/2025 5:29 PM, Arnaud Vrac wrote:
>> Le dim. 1 juin 2025 à 09:46, Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> a écrit :
>>>
>>> On Sat, May 31, 2025 at 02:22:00PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Fill in the correct data for the production SKU.
>>>>
>>>> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>
>>> Verified against msm-4.4
>>
>> Hello,
>>
>> The current values are based on
>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
>> which we've been using in production for many years.
> 
> I see -v2 updates these to 533/444/.. MHz [1]. If the value changes based on
> board variants, these need to be picked from board DT instead of driver then.

I believe they don't (although there exist some SoCs where fuses determine
maximum frequency for a given target). We really want to move off of in-driver
freq tables but that is still in progress.

> 
> [1]
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-v2.dtsi#L1140

Arnaud, as Vikash mentioned, dvfs tables and some other magic values may
get overriden in socname-v2/-v2.1/v3 etc. I'm not a fan that downstream
leaves irrelevant information for old revisions in place, instead of
simply replacing them, but what can I do..

Unless you somehow came into posession of v1 SoCs (which I believe were
totally internal), your hw has not been stretching its legs fully for
all this time.

Konrad

