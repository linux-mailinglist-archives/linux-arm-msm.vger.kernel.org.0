Return-Path: <linux-arm-msm+bounces-76081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD38BBE577
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 16:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F137E3BEBE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 14:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DC32D5925;
	Mon,  6 Oct 2025 14:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJ/49MC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53349283FE5
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759760946; cv=none; b=NZknA7lBEy2+anhg0uikY/QVgb3ZaSJ8tgz8GI9/6uRU6SgL1thVi4iYohYjBIUNjbKz+DJRYtm0/SOXK5l21sxVXDYBr7BxoqpxItUp9PK+drGZSsYuesv1xe01DydEh9elqfTyQQ/dXPKXNG+ztdQD1coWDlql1D2r2VQ888Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759760946; c=relaxed/simple;
	bh=ROnstel0j2Gkqs0U4k0SMhUJQdmyRLNPAywgaOS5mrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPuW9FIS5leebfpAB9942fXRGWK0Oq9yVHU8P+m1HB6F1Eo96/SM93LYFz0lho7NeFj2gyEmo4wqWDxAqKJ0cf5x6gXjZrsZ5bSPAyCwKfbyz89yczDQQ0Y5/p/lvax6vH1+NfJSKjsA+d0+6AJjkufj16BXmfrEvNVBtZR/XwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJ/49MC+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596E7VcB012993
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 14:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CS1OJiTNhhN7sRrdPpBTKnj05Le98GVQEYo1gD8lWtM=; b=KJ/49MC+bMmbaPFo
	D9tZjzpl84oU03YCg2tDyioTmpz4JGeq0UkJlLyns7k+sUVjn3xye4uE7waYdtpX
	3OQXqUukJqcm2UxLsPQYnyI2ggD077+F14RPyLffqZxXoK9dATsUs/NTc5nfjohm
	KgjO3vwNHmH6ozjeoz/LxL3cTqGqd9uLo0OFZ7QGhByNy+wJT2CcS4s3FY34q0+N
	MQVnK4II3VoEPkmBksPSDzDDQjOijSlmpLrSmDDpj//Wg5Xp4AyKv+GN3c4mKncn
	2AYeT+Bshsani1N1WKrcAbWwBOdaQw+SmVRTIss82JQn2qAovSdANgUAvk5P8ye+
	nWQYoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dva2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 14:29:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d8c35f814eso11844991cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 07:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759760943; x=1760365743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CS1OJiTNhhN7sRrdPpBTKnj05Le98GVQEYo1gD8lWtM=;
        b=n6RpA69X7A967K+FKF8+BcUpMTstY3j5S+rmoTDbOHj1bTmaWlhuPSB5l/yGCvRAq5
         YYHGHHiPQEiLOSKRPNOPg/N3vPFsnlPpaXnlNP3yUHvQXyoLZkFkBfDCMOnxhlhYXPke
         I4YwhyIHfo85qCyLO9YwDOoiI8cwMsynwrTKo0l8YeG8MdSMQIxyQVRA7c0cThSxikLY
         QrO1qh+JgcGQGjfXuXUy4m/YAIdtaksGMdzTvwupgd3f8OV25/AEcJfysGHLC6F0LL8l
         +YtuHAavYA/PXXb17wIjB/+FvYGSQ8qXSyRyZ/bqP5XIGAHaqQ6UI7UIdceYBL4RpVqs
         hTcw==
X-Forwarded-Encrypted: i=1; AJvYcCXVJWbFv30WKs5dBbV+H5Epr0OJPD7lIx4+RCRbviDydRrjJ9bnY+hCtxbtvGmbukWsHP0YHukD0nbS+Jyo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58JAbFg2xbT6l9JY4n3XrCN7jFKr+qI3VxP2o+6VFGDzVVWpu
	aY97UB8/a5FfPSXU+wjoCLbth5b5HEUV7mp1woR2gwBYwIL/A630vl0pF8wRoE7n70paPbfnVTo
	q4p1Durh8eTxdK36PY+fah01U/aC/dZlNoOPtALMJEkQuIX0SuToE1HaQGd64BBNuQU8q
X-Gm-Gg: ASbGnctMU/50Xv4h/cpMJlH+XarHQN4m19InA97V+1+IsHJyP5r9NwB67VzZO8uSMqN
	46WNfMyDYJLEgUQ1cvr10a0xm8PC1e2tDmEz3OSaM8ouK+sqA3WvO/wVxS28coKGoI/epzVKCo8
	bOgL+I9uT2R6u4KRyvTZ/1E8pgAb8S9PGHVHLjJfpCn62lh2vNXLe9zoNahxuiYVBjH3NkGJimu
	RsWhAZskYoCZLAwuN8scIGCKxMnAaay6WLlmvce+X3P8MwLqRWUzDWjqzOKV//b6d3xCYNMufue
	UJHhExmw8yYmaX8xgt9erCkJ4138llN4F/rwhuNvDE3vDj6BmPX/4NVy0HJblIRARr45n4F254I
	0uPtmrE0ClrIFV1I7brBtNBcPaSc=
X-Received: by 2002:a05:622a:20c:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4e576a81e8emr108726021cf.6.1759760942903;
        Mon, 06 Oct 2025 07:29:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSKznZkC7MqIYL2Y3aS6tYYQs0BrzaPohLlUfJv0W+der5wzZ88gecyQbopr5mVqM+Gnlljg==
X-Received: by 2002:a05:622a:20c:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4e576a81e8emr108725741cf.6.1759760942317;
        Mon, 06 Oct 2025 07:29:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b57f0asm1152277766b.77.2025.10.06.07.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:29:01 -0700 (PDT)
Message-ID: <8f81289d-7672-42e6-b841-6514607cdb38@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 16:28:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] arm64: dts: qcom: glymur-crd: Avoid RTC probe
 failure
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-17-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPdi0+c_FqinVA0gzoyqG6FVFp0jq5WSLsWWKiT12VVs3Q@mail.gmail.com>
 <CADhhZXaB310hVo_w8_CoJLQ3j9dy1eeTwbmk0q=vUV2ga1PAYA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CADhhZXaB310hVo_w8_CoJLQ3j9dy1eeTwbmk0q=vUV2ga1PAYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e3d230 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=arJHdyfYHkrX3WdpB14A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xKLGfRqxCDpm3SAV7KoGhr-DkZGA-X59
X-Proofpoint-ORIG-GUID: xKLGfRqxCDpm3SAV7KoGhr-DkZGA-X59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfXwQTP4aRvi5Hh
 +i+h5oUsWS2i81P25QLbRxetT/gpRvZGufk790G3rwSf+XhirvCTzCgKPaZ0l8Kn9m0u+Z1DICU
 jr/fzXcE/yJxMXApRiMjWPqGV1PF6eMFbmp/Dzzt0mqUxpHFH0koBDPunAD6HYcoy3i6qbag8eN
 nd0dZo02lgblua7+O0JWnrmguf//l2fklqgFcPSvEx6G1/5ERUxVn08GHod75xkBqCDEY8Tzlke
 sXUrKQEd/xRZrlO0Tlcccq0xGLu4UHus0XImTQtIOiGFMdRXetguZP123CMd2uMmVlS6/7HzNrr
 J1PTG8lE2Doa1w5fBqTYQ8jmUtbN0+0BA2mp0DlE5INWR2y/mwRP45WIL9dKo4NCk+zAoVjmTPK
 VDLQeo7zHMt/GLpE558n9ltN6mJ14g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On 10/1/25 2:23 PM, Kamal Wadhwa wrote:
> Hi Krzysztof,
> 
> On Thu, Sep 25, 2025 at 1:41 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
>> <pankaj.patil@oss.qualcomm.com> wrote:
>>>
>>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>
>>> On Glymur boards, the RTC alarm interrupts are routed to SOCCP
>>> subsystems and are not available to APPS. This can cause the
>>> RTC probe failure as the RTC IRQ registration will fail in
>>> probe.
>>>
>>> Fix this issue by adding `no-alarm` property in the RTC DT
>>> node. This will skip the RTC alarm irq registration and
>>> the RTC probe will return success.
>>
>>
>> This is ridiculous. You just added glymur CRD and you claim now that
>> it's broken and you need to fix it. So just fix that commit!
> 
> I'm afraid, but this is an actual limitation we have for Glymur
> (compared to Kaanapali).
> The RTC is part of the pmk8850.dtsi that is common between Kaanapali and
> Glymur. On Glymur (unlike Kaanapali) the APPS processor does *not* have the RTC
> IRQ permission for the RTC peripheral.

This is interesting.. is that a physical limitation, or some sort of
a software security policy?

Konrad

