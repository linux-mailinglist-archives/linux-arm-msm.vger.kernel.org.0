Return-Path: <linux-arm-msm+bounces-55746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF4A9D220
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23E004E09DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C36D22068D;
	Fri, 25 Apr 2025 19:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PI/Y9YrB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB92A21FF28
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610377; cv=none; b=GRN2f4/rbIFsglYcF8zRCUCdODGYDANkEWZ9zVQ7anij5EdXdtvx6HpdZEh4PqkpM9QLyQRyHJ0VAXIl7WxNYd9M4L34rOK1WZA9Ue4HUYxgd8yiiuliRaFyT3UM+Tj7wbTvF0+sI//PeqJ5lz3DxZ2RD7DVLLvkTddgnT7Sf/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610377; c=relaxed/simple;
	bh=EYcZpPG7yUxj0IQg4aPHSivcB8VujVtyuNfcH0lfOmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ViIFgtM3VDCakRcuiyU2fhONBkwxJrcbqaNPvMTJ0x/YgSfCP8TD9IYEheKQOROH25gKRoVwGfZu7W5AE/gZ/3F6Kx9HD+W7Ae1u6mo7lgvhiKgiNd5eLsTkkZtout7LiN0u++6VifcBp66fbJulXrFurzNjF75RbHcibG0wBcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PI/Y9YrB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuQj024795
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txmHliBipjwwY9cKV5mXKNOg/d2+Wp0mSjYmxJVTnsM=; b=PI/Y9YrBc8rGKFbT
	t733tafROHEh/Y9AqmCOICnxHjlYji22H5+UEiBGeHwnJj8rX/kSl294VhxZPBvr
	mIg23ZHNpuze+yIIkPbe4WVodIqHwxp4BEbQm/igEohhHavOwE2PDHuQIjjUmfox
	waeio1RAKiocCkMR0ILCSRHcyAKAv7l2g03icBX4ikibmvqPseTkTEtRzf2wEthw
	QOk2h2zW3fZRy65qsG8jj4rqFisMzj6+BeR7INfPc83qYWRiHf0H9eiiZxFr/2Hg
	S+DdktGYEScPSATl8cMSAC5CTDqNg8GQFIYm2JQMyNDTuyGV8eGTIWQ/RD1NsmHl
	Ba16Jg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t0px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:46:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4792d998b21so4161591cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610374; x=1746215174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txmHliBipjwwY9cKV5mXKNOg/d2+Wp0mSjYmxJVTnsM=;
        b=KZ6HQwqLcDXpkuCQJ5Lpk4ZcusLSRzfXrwt3srpUjtXZdz1D2dWkeWmrv0vttC75B4
         mc9Rni1SbwU5WzcoGLfQhKQIWUKXPIGDI9lvGsv0eNSWBfCphxh6sCLyqDVJNMjGQXKf
         NwMZ1OFv4I87CELVZC4ZrpLs1s9tWRsBCFd2Kuyp+0vSu11QDJWG+jCQI36GiHilEbrd
         q9lPH7duenZ4n3l4GemqejWzsCIFXdhzBKhNoJOGH+ApS5Pub/0ZDnqzOTEbGBqwQw00
         sZs7I8WhCISfsqulYXOk3f8QHBc8gwp0ECmTRBDtD07dkJLrswSYpqw+S6kD/Zfs6dCh
         Lhig==
X-Forwarded-Encrypted: i=1; AJvYcCXBt048oNFNNpOY72AD8q7xmApqhGrUwHzX/usKQjO0zTiJLU4sSXvOHknvpv93xynxJAJBsBRTkLSERFjg@vger.kernel.org
X-Gm-Message-State: AOJu0YxxheshVc3MPnqu/kxSLO/cmgcUycgGmAGF6FERf4mcDOwgXXe/
	IUtMfWl3XLjhXvXXgAmUDZVIWNet0GN7Ica7+1bXeaZJXHHJ/dFiW2LmSIyD0insnCbnNai1a7a
	MaD9RQl+gbIumRkJyoYmB0wPej3gAFLCvTysLBJmQRNhtuI1Q4mzIMi0Ia8EEuJ3Q
X-Gm-Gg: ASbGnct8hOj730w4GLrICJam5vIskFefyuDM1/i8RaRnS5TGEVqmP1r0UCXRoPoZPr/
	LdMCXYPQ4TnkMVi9IzzomqHF3ci8fUy7ytUg5ikf+SuJDPgdqKPFundt8WS99bfeRWrpq5057jm
	5C7NLabHVrbwyVkFok8MjbhrTG8C+y5WPSr9bPC/ikBVpb7R0ChQ5qb5nwNbkbSGLX4oOkR+2kP
	gekrM08/L+SY2QARaHW2wxcrZKj3PzUc8+mD9+3VC4ORlPDyk+ZYb67IGHdOEDvukPj7teq521v
	bId5Y9d0jVhNMZDc3YrysnbGxJ0EwM5TCJ48EPfRF00hWly3EgRUTRKvX+4AvxvkN4w=
X-Received: by 2002:ac8:7fd3:0:b0:472:15be:54ad with SMTP id d75a77b69052e-4801e6f120bmr20112811cf.14.1745610373879;
        Fri, 25 Apr 2025 12:46:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOzMshPGNoqCx2ULNNdKD/xPe4MbaDbP1omZuzKgujBuWwyI50zrrqVnQ3wtP40FpGp1u29g==
X-Received: by 2002:ac8:7fd3:0:b0:472:15be:54ad with SMTP id d75a77b69052e-4801e6f120bmr20112651cf.14.1745610373572;
        Fri, 25 Apr 2025 12:46:13 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e578955sm183455366b.74.2025.04.25.12.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:46:13 -0700 (PDT)
Message-ID: <71190e3d-fa9b-4fdd-83ac-bf012031c836@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:46:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY
 v2.0.1 init sequence
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-3-loic.poulain@oss.qualcomm.com>
 <z5bemevabirdh5qhj6fajdihcucnoa5gxjkjv6s4aztruffn6u@w5rvy3sxeln3>
 <CAFEp6-3h19eJgJkXNR5sJisZbwHG=TmYhVEu10hTCnnBTqH+MQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3h19eJgJkXNR5sJisZbwHG=TmYhVEu10hTCnnBTqH+MQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MuZ5qZM2cyFSh3ksfCzYhIyYjdBwuw_y
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680be686 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=wkiucLSIQwEx8sfLkT8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: MuZ5qZM2cyFSh3ksfCzYhIyYjdBwuw_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX6esKzXiq9p0T v+xHcXi1M3g2Np2KlAZVWwAbrDKJc0zbSSh9UTFUxiDd1ZfJWcNsXgdd31gu7+Hh7MWpRllN/d3 b4ytsh3378GDrNZDsOQUL3qIuBAfkwPNsT2QlCHMBE3NOOZKZQFo0OrBOfL+ytaY0R8Se7xb+eR
 Y9dqcTQhXJBc7NzB1ZfgSa8zma+Alfl9JjNEnxbLCgr0jASsW204KP6r8ciEO+jlV4xcz0OMnv/ SKoY/zXVpbj5JTOAuYUDdgJsuhIYqec4V/7SZV3AGqZJVxLViBAwS8dGYZHi6Yifozo7RAlyxSV tWhi5DVsWwmNES5LYqd3eluUHrZ4q9SaA7fUAlatYVF5i7Jlm2PLs9Pmy+W+zup8BDqMotPUiAP
 61D3E3w4eAfHwIMVVmMccHXJATAOOUmEuefn+DzOkaarS0Mkcj8PvwrZRwMYRG6oEvJezL65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

On 4/17/25 10:26 AM, Loic Poulain wrote:
> Hi Dmitry,
> 
> On Thu, Apr 17, 2025 at 12:36 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Wed, Apr 16, 2025 at 02:09:05PM +0200, Loic Poulain wrote:
>>> This is the CSI PHY version found in QCS2290/QCM2290 SoCs.
>>> The table is extracted from downstream camera driver.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>>  .../qcom/camss/camss-csiphy-3ph-1-0.c         | 89 +++++++++++++++++++
>>>  drivers/media/platform/qcom/camss/camss.h     |  1 +
>>>  2 files changed, 90 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> index f732a76de93e..0e314ff9292f 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> @@ -319,6 +319,90 @@ csiphy_lane_regs lane_regs_sm8250[] = {
>>>       {0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>  };
>>>
>>> +/* GEN2 2.0.1 2PH DPHY mode */
>>> +static const struct
>>> +csiphy_lane_regs lane_regs_qcm2290[] = {
>>> +     {0x0030, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +     {0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>>
>> lowercase hex, please.
> 
> I don't mind, but all other phy tables use upper case hex.

Ugh, we've been trying to get some unity in place but that's an
eternal WIP

Konrad

