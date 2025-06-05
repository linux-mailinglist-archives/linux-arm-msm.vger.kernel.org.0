Return-Path: <linux-arm-msm+bounces-60354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF495ACF487
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CBD67A8AE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 16:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AB51DF246;
	Thu,  5 Jun 2025 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUB5G4tK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5489626AD0
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141661; cv=none; b=PilhHZGbPHRzMguiUA3TTinEPnJyeFtt7NM71kXni5UUFyMqapFphwudHpiqlLd9ihwfJtgE/bt2EOlWx8YIGpGsQb0VgIo9eaC6QWMHN7x1pETPhZnNyoTtufs0BLyKuNt5UCnnufhgPzOc9/0fbnnDW6TPDnbthCJqAJlrPSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141661; c=relaxed/simple;
	bh=U+1dO+TmDkrsbPY3184pD3AQDFkCQ4e7YtqnnBaM70I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=stLbCag0mII6YMrTwyGO+/BZqmtwe9Vmj3zclPD7k0Y2lZze1QI0nyQRC+W6ltgrL14LKd6pAKHh95Pwzfjc+7dxXrl570kaCga1IpAnrXaNOG5EwjU9D9R2k/08EPNfxHXL+csp4qVF7Ov8MCTmciFoftGsX72oJHHr1kV/rNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUB5G4tK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5558K54S005458
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 16:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7i0HN4nYaQ3I3pG/28oO1Ds2OecBTsNdW5PcXfaTMdM=; b=iUB5G4tKXLw+/hxB
	GvWo1i4blXRZUvN6kKRwXD0zAh2JN9GfylEkmpyXlPlvfkXotkMOvTPbCz9pJxkA
	orQaL5ucms3fOPc4cv2GKhEQpAxRMOVe/rylaAUgu4oEdqP/4Tej0+Ifw6Ddow5M
	m4yxtYoWT+D7hfvkHR58kAc6+teN/10S6zagQYojgW521fX05u1PLtC9Vgjs2DbO
	kSnaZuKHwCh+fGdrJRRVhQBdAmuMzYDEcCscAw/Ml7RJMzMIAFsOM1YmcLX8/hJ0
	8BPKgq4pRYLWiWpYaRvGoAMcgESfSTibg32k8SYCspM5BudUL6/hlmKpUjR2lZln
	aUlwbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4737me1d09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 16:40:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee988153so201050885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 09:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141658; x=1749746458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7i0HN4nYaQ3I3pG/28oO1Ds2OecBTsNdW5PcXfaTMdM=;
        b=oZ7uBMj2QyVXcU2zBlAyzb2H2IIjSWrc0l9+exIfVGUTO6sV73Ra3BbA3wofe2AL32
         1wpwKFAUwMPvTBFiCzWXv2IpHqCcNQP+V5MXYiUg2A0gxBGygYaLEHpU9s8gIAyIjeHN
         jY8klaqPJ6Db4rvFXadTbjPGnxgy0CPAP7MD/SbblqiV2QaKuEuck3rre4fSY+o2FuDS
         lNbMwNpEcSHVIFdHbFWsQsfwtNVm6tmeNfovjDWnbZAs4cbO3OWb6B444L1ULj6PfaSS
         r+6NKeSLj43hnvm194RH5YAs9yTPJREFzJkmeaIPXyuyKqtK+KAy3Xgxg1m5ssUcAloN
         7KlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQdT/f1JpHo4J+EPbnyYhat1ixxTHSiwPX4afhtdLHize9zaQcRrvaAUoB3ybWfx44xrL4pxw788hqg1ji@vger.kernel.org
X-Gm-Message-State: AOJu0YysptSQUJwf91gLYiQd5kI7bO8065YQ4L7TPGulJtlZWzU5iRbr
	uxJRRCPz4Z6ksYqtSGRgtL0MUWX+AsBDiZiiReE7gr/WKO1Nh4ubeojrCHnFii+kjbUN80h98VI
	xFR5POBIqy3v31x5M/k7tgAEDWRbFmv6MIZcF1sizAURedpijyDW1HVYVttEG61MzSsoY
X-Gm-Gg: ASbGncsEy6CIVM70WMw+DOClDgG/eNINIM1DdWl4sNM5nChHpuroluz60cBbRDcEbqb
	zUlQd22CHKNIET0dy5CoHOUKf1T63L2qqm5tVKyzBPo7l9wNjWQVVSQ5lxtiB5YoNDPsCDS9dEt
	Nr5TzNCfw3KEsefLU6DbzWz71gkR7q+MEFUFDIvsUftzNY763bo4LIalmVm6BeTAqI9ilFj5hMp
	RaRYV35+v2NukAAb950PYYToEjDGBC/mTFyXEBov5M7WIcw9MY68hM9D6RDBn2SzD5vYQfiJZzf
	TyAZA9JK2NJBl96FYTRL+kFYZl4vOpwFdQ==
X-Received: by 2002:a05:620a:318a:b0:7ce:b7fc:6b6f with SMTP id af79cd13be357-7d2298ebd51mr30547985a.58.1749141657044;
        Thu, 05 Jun 2025 09:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlphq5hkywbvQviFl7ytOJ+kdQCQdXoWwJL5KNPil4LyJI7BQX8E8fziuHpoPmIVJagdJoCg==
X-Received: by 2002:a05:620a:318a:b0:7ce:b7fc:6b6f with SMTP id af79cd13be357-7d2298ebd51mr30515485a.58.1749141653618;
        Thu, 05 Jun 2025 09:40:53 -0700 (PDT)
Received: from [192.168.23.80] ([87.224.39.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb22a332sm24378335e9.35.2025.06.05.09.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:40:52 -0700 (PDT)
Message-ID: <5f912b5e-6368-4234-8a37-db72be222ee9@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 17:40:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
 <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
 <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
 <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
 <nr2je5ssn22npl2dqu5aj2xcwinnjmhvl3tvuz5smr4dd2rxaj@dfkk6aktkafy>
 <6b09348e-d920-4025-9932-6c861fd5f1e9@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <6b09348e-d920-4025-9932-6c861fd5f1e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uzHyon_vLmGvBGoOKHSZ3h1JhNtc7ql4
X-Authority-Analysis: v=2.4 cv=GPQIEvNK c=1 sm=1 tr=0 ts=6841c89b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=UMobGI8h2IAScYPZOeRE3Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Vu8oZAHUrI8RjOZTgO0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: uzHyon_vLmGvBGoOKHSZ3h1JhNtc7ql4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE0NiBTYWx0ZWRfX/9KE5Gi6mZjV
 71+5WNDnfifs5qgBIxyER6TTV8XBC0GxbbL5ZwR94lS0y5mvc2hoje6m6ROerzh+ah304IauRos
 htVXDOBMZ11HUfD3O+wqHLJv5hT7vPCeXJs/2KNuvAMlIRFZDnfIARO/Hku6fqj39nZJyAgQRb6
 ToIz9HeV1UfVMpHt6XgabV2t6KEb5yuf3evxrMfMP8RJ92SpxUc12xkds0WcW6F1RpyFvNZJVxT
 faMhi8oKoHcJ4yFsDTfF+qTx4k6Fu04dNxG9LARQlAoAPauwsprZNS99pMxgYhhRlHSmzNJSozK
 SLq09uVsqJEdZwrwwrEUDQ6WqHPngTT493pexB85HIWyxq8JLg9XJTV8taRiWdvoxptMdL6KJhT
 YdZESag/hO1oDrNfu3mn3bbTMLOWL3iI+Bz1n64FJJs1Tg8cU0Y+sdrZ+IMBx2ruG8j3eAe9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=680 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050146

On 05/06/2025 17:39, Bryan O'Donoghue wrote:
> On 05/06/2025 17:02, Dmitry Baryshkov wrote:
>> Please correct me if I'm wrong. Without driver changes from patch 1, the
>> driver will always use frequency table from the driver itself. In this
>> case it will be the frequency table (and corners) for SC7180, which
>> would make venus driver overclock the hardware on QCS615.
> 
> True.
> 
> Yes, let's apply 1/3 and then re-submit 2 and 3 once it hits -next.

Not enough. 1/3 should hit Bjorn's tree, see Arnd's rejection for 6.15 
patchset.

-- 
With best wishes
Dmitry

