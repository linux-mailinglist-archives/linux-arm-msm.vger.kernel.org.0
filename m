Return-Path: <linux-arm-msm+bounces-75171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D677BA1018
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 20:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7869D6272F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 18:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BCC0314B7A;
	Thu, 25 Sep 2025 18:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIZuhyS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6624C315D56
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 18:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758824821; cv=none; b=dE9DjPzaHfgSCutq42PY9R27bzd1Vx79MVVBaWr8Qih/+7sOShQg3+Gw6fTrv94ZqQPB4I+am7v1phg5igxE/peBjYdljLteK+2U4N1G7qUhihTRkQC0fcHQUuARMU7PCriBrihSFKBkRlewH8ghKdMoJNUP8g9yQ1JQUfoig28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758824821; c=relaxed/simple;
	bh=NMbylAYq7CYv0fkWtWUtjNn7VgoOmJ+cVhEKuBkCKu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noNmoX+TIHTautUx+C62j9owRdtGJGd2A3i/XM5IsUPkG884aTMhCqhd8l4/sv7aubST2r2Ahg6OkWQO/NauT5vDEZA/HksJuTQKTi1g01qdJfH7Q6ud6yFMqLhWIF2namg+JRgSqKb+bDr8+0bBosBgM8NeFijFTFktdYZGPbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIZuhyS1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQOu0008118
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 18:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqPeS5NEfA2UAdvDycz41izyD8C9Eo6POeSmVFtB8KQ=; b=ZIZuhyS15etcwleU
	PGcLB87EG1ZJydefJk/eNnc18pUtxkC3uGPQjqhQrrQfa0AH9aPC/yAkRp+1BNCS
	A+k6ueej0xFtzjOldX5E7KNwo5l+OhINoci5awS/iFm2BeMFz83m85PV2UQm5yXM
	KE2doRndk00DnfkJAe5GNWf904f56B10p8svxl8ZSpgNbe8I9m537bD5M6p04JoP
	q5KjvB/udC1fGqd/mK0uxbPHCm/592WK24GZiaGvMo8bugLgKX+VsMmzraD3gPwA
	lL3BNUY59qpi+yBBR1iB8KYTSxBuWNj8iVRynSM92fkI4qCSlvZUjHhVILqVuOe1
	QuxYsg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0vr02x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 18:26:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befc3aso1425728a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758824817; x=1759429617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqPeS5NEfA2UAdvDycz41izyD8C9Eo6POeSmVFtB8KQ=;
        b=DO5Sk0I8Uc3r2mMUFKp+0PO0YgbwQVueJ5i8i63HFAbP+iGFHd4GOAEWLkQ69hzAJC
         mWlGFQVPjAl9XaAqPaxvtV5MUB+NhZm5lytZMTmhmsRchbTe/rDtCn5kPqcfI6SR32b1
         UFG2VT2OCniM6asESiaYtL0B/jHwAcGHWUfh45/kqUfZcsc/Tmzqxd/K6CM8h8ZyokH4
         8wa5LBm0ZJoV0xDVc+EyTo77Pdlb1hfo7UG8hiy+Ef2gq3tAVijBuJbC4YRZX/c5x6CP
         ei+QxIRPOuD38TJEvxsiF/Y/cjmricntQ+PnHHYTCXriTsYWXnmYdg11TEq//a32UPXd
         C4GA==
X-Forwarded-Encrypted: i=1; AJvYcCXPVi/tbewlM87F0TE1oBRUmOOZcYkVYGk/Ksc7r2+mD36F/VZAyLQO1E9KP0XHp+pFrsWYG7HWt1vpAgbk@vger.kernel.org
X-Gm-Message-State: AOJu0YyZFulgD22Pr9Kul/IC6MkiP+PjsXCpDqhGasYGPmL7H+JvQ0Mv
	peX+ipZOJD7RBwRU552YTAy9YCAYGt+eZEQCCxE/8Cw/3CCvOzJUjjKff2yyQurk6L/a35n1dsZ
	yhdTJooAE0WjIm9YiSa99NwTbadAgfkbjGWWojYV7OdbdxZCdAg+91gEw83lKD/KaOrFm
X-Gm-Gg: ASbGncsOu6d15h7YZ48HRryovv9hbc0lqiKK+/pXxDz7aDLRKT9kmRhQwTKded58Yg6
	pDuDL7TBIee3JyrhEHiW05Z15YDcWrxGUgPXke8Pyok0NGsjkZdsUrWqHZ8DTBAGrQ/YukiAyhZ
	FBjE6Id1fAed+rAzoTSdkcstFUgqUrzvI9JH0XdyqeHPjYeeMyvpRuHcrn+kj3cdUjcQ5e9u/RD
	J5TjNepNIcfG0KobUqyOCqh9xIIIHi8Z5tNs86u6NX1Cp3b7nizLbMif7nPkDBlO8a0RFNRhjI7
	Akppm27Aka7iZ1EXscgkdW1mftQQ3gGEP79HVZUqWo5HVaZ6rCAYl0f6mhXX442Lu0TH011URNn
	nJcNA2bMEntAVsp8efSDIAwUps4+wIlQ=
X-Received: by 2002:a17:90b:3d4b:b0:32d:d4fa:4c3 with SMTP id 98e67ed59e1d1-3342a2ef04fmr3451096a91.31.1758824816742;
        Thu, 25 Sep 2025 11:26:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8VfXlVS+KwPpyYFd34T8pPu8mdtcmA2+TC/qpR/h7izvQa1fT2HATDC6sqAu3sewVGidgrA==
X-Received: by 2002:a17:90b:3d4b:b0:32d:d4fa:4c3 with SMTP id 98e67ed59e1d1-3342a2ef04fmr3451074a91.31.1758824816203;
        Thu, 25 Sep 2025 11:26:56 -0700 (PDT)
Received: from [192.168.86.246] (syn-076-176-048-107.res.spectrum.com. [76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a3cab8fsm1456102a91.1.2025.09.25.11.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 11:26:55 -0700 (PDT)
Message-ID: <cf043ce8-0e83-41cc-b294-93dc1c27fd91@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:26:42 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <53d63dd6-a022-4e80-a317-3218976a7474@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilok.soni@oss.qualcomm.com>
In-Reply-To: <53d63dd6-a022-4e80-a317-3218976a7474@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QnzoGZRtANnxJr5ZVlCJq6qk74DfgsrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX42Nn/Lk+61hV
 FLWXLqwYjedNNrmP+41KVojpOV9VK+5a6l3uxCgpX7SbC180A1vG6E6dLtn5GtwryB9C0pazFOE
 sdoIqHBLu4WLHzFltmSXfRKPGz5Ki8w/243I905R7pswTUu+eXP52275Y0nFX9Z4WoW8wfsT+wM
 pLXa+DHuuP7bNMMuX4c0WetSMd23ZL2BBmzgkUCSgd488IMETg/x35vUQri7EltIGYNClkJqUOx
 KQvxsdfGDlyHH+9LNiPFadclj6l2kiaWV0S5+zU5Rvr9iy6WmjRW1dIWdf3Nom6vsoOCjFoFrMY
 TLIo/MPWVZos3iwMJo18SijsHj/KVqmZX2UG4+IJ/zFvPzB31UCMXlOaKsFoPzqWkhiEy2NHzg1
 plCKszYHBsdFXFLYIbikkxqZTTd19A==
X-Authority-Analysis: v=2.4 cv=OstCCi/t c=1 sm=1 tr=0 ts=68d58972 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_4E2EnyzloM2vKAfYDwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: QnzoGZRtANnxJr5ZVlCJq6qk74DfgsrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509250171

On 9/25/2025 12:39 AM, Aiqun(Maria) Yu wrote:
> On 9/25/2025 9:50 AM, Krzysztof Kozłowski wrote:
>> On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>
>>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>
>>> Add the base USB devicetree definitions for Kaanapali platform. The overall
>>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>>> (rev. v8) and M31 eUSB2 PHY.
>>>
>>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
>>>  1 file changed, 155 insertions(+)
>>>
>>
>>
>> Second try, without HTML:
>>
>> I really don't understand why you created such huge patchset. Year
>> ago, two years ago, we were discussing it already and explained that's
>> just inflating the patchset without reason.
>>
>> New Soc is one logical change. Maybe two. Not 18!
> 
> It was previously squashed into the base soc dtsi patch and mark like:
> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
> (added USB), Manish Pandey(added SDHCI), Gaurav Kashyap(added crypto),
> Manaf Meethalavalappu Pallikunhi(added tsens), Qiang Yu(added PCIE) and
> Jinlong Mao(added coresight).
> 
> While it is over 4000+ lines when we squash it together.
> Also as offline reviewed with Bjorn, he suggested us to split out the
> USB and other parts.
> 
>>
>> Not one patch per node or feature.
>>
>> This hides big picture, makes difficult to review everything,
>> difficult to test. Your patch count for LWN stats doesn't matter to
>> us.

Maria - the point here is to not design the series / code for stats, but
per maintainer expectations. Though it is difficult to know one preferred guideline.

> 
> With the current splitting, the different author as each co-developer
> can get the meaningful LWN stats.>
>> NAK and I'm really disappointed I have to repeat the same review .
> Currently, there are 10 SoC DTSI patches sent, structured as follows:
> 
> SoC initial
> Base MTP board
> SoC PCIe0
> SoC SDC2
> SoC USB
> SoC remoteproc
> SoC SPMI bus, TSENS, RNG, QCrypto, and Coresight
> SoC additional features
> SoC audio
> SoC CAMSS
> SoC video
> 
> Which parts would you prefer to squash into pls?
> 


