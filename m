Return-Path: <linux-arm-msm+bounces-67649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB196B19E1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 11:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17DAB17692C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 09:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962A3242D9E;
	Mon,  4 Aug 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ld5Z1aLI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E77239E7F
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298101; cv=none; b=q2BDcR6y8AJX8AGvVc/v4BhKbeQOqGyahUgRfPfTEpY3CQhwo6UN6BDQq+Fyxz3jvfT30nDsNYEljHPAvZPFlgnv5HLaPfHsJ+LYkkmrNlM6u3YsfdLKdws7tV+GJb4snMyZeS80KuML3SFWJs5nwc00/xNVUruN+tlLAHNeNDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298101; c=relaxed/simple;
	bh=8dT0hCsSa+pOFyIm2orcWN2fXAkvYbs0ddIV1PMTUy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHPu3Qvx/xOt9ogRGPCF6C6gBajqDguQOw9Zi8/lM/ywp807HqmucixzcZPFdZ705fiyD/B+z/TKevBPcPzSJnW6VZ0CMJ99uie46aj/ien2WUDAZtLm8yea8NLW1GC5ptC7JR6QgRg8uHMHJ+fZCZ7nZwwmTbJjpDQj4T+3eAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ld5Z1aLI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748de47029018
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 09:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSVwT60Y5j6SK3F/zYcMZ5PZCH+z92QqbFAGhTVhlu4=; b=ld5Z1aLIRZYNK8R7
	AkhNXfCzDQ4MLhIQFUZ5VRa+HNIveY4DVZavOyenNPwP+96h7bhgJ4r8RZ1yBrD6
	ORIOt7gGd0Crdve2Z83IlTbQhtt3eOgyt5B7pdi6q1MM5sW47PPwg+AfwAjIvrmA
	xfXJX4fBQ4Kj+HdXNf0GpHs/mbWeWZpCzaBZ5RX8ahHa/T58KhRr9XDZ7rogveux
	4eFaWEWR36qE0HevDHGvHocze+9f6O1bVDXWvaqMjESB4guNdyEStTtH8PJUxZiu
	KpEJTqNsJvoSfygcOyMG8iTowfVrYZVz5A7Q2GHashz/q7OzLyhRhcs9yn8P8C7y
	TEdJkA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek46ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 09:01:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so3273441a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 02:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298098; x=1754902898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSVwT60Y5j6SK3F/zYcMZ5PZCH+z92QqbFAGhTVhlu4=;
        b=wjRdJHhs2xRPe8A8MaE0NLfGIGco/jw2GJMTbhumu5XyzlROZzaosij9jCh7GXrAek
         0m23Tq/jUD9EkNOVf4r6o2ZK2Au+8Bt+uEZulaSUYL4+5NBJ3MoxN7Yp3VTT3OjLQ5XU
         BwZASmTI8k8ssasAmbN+lsr26VW2iYxsFvkaftQtOzdzH0sKPuDgNjAwMES2LWyHTjfD
         mFZv+JbaN3HEiZTyfyEFEGUwGhLXMVFZ/kNbgZN22QNqUUf4wqCFbtE15+ycS/eOE8eQ
         BOUIFD7QGJHZe6pYm4w6a8PwoOE8dyMhh0Z1G4GQrJmgX0l3aSLUIEcgyLh+SB9cEGfv
         MgxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoTJ6WMFo3TTuZM65mzuAy/rgvLYfVPw3JdDgl7gr6x3xcNr/S3nT8T6XeH6eski1F5PBsh+nOoD9SJXqu@vger.kernel.org
X-Gm-Message-State: AOJu0YzdUzfWyui/sUrXPXqCeHgmEhI2WzPsJGYVvp6Qu5O6PlxJMgai
	jXOnT1fvGQX46DVCM+86ubS/OxVKrIUURxcQPcO+tzkcfEwwaFGb7mZIQ5MmQUtmHqWc11oCA1j
	Cds6HPnOZXoUMtPngbK/3Ly6f+5YArs2HnVORUzilHnmNkEFNbQXEpFnlq92scwyUSj+lQHQqw3
	a7
X-Gm-Gg: ASbGnctIYZeQ3ZaDRIV1MKNuVP3kkOzbZLA7luW6rsWBeblhGVoDCtROC2/G1+BexjA
	VowUOLSZBgiMVi9vLRvFqV44IyeagLGEpAPH6w4aJMEvIirSA4zbriOfrBQhTm7jqKeM/v6DZTx
	XTz6IBSHIDh6k6vVEyQ/ifDVA8P+OREnH2mE3L/8AzFq8Tu24EvFxfJaEkN0CCFakdIHQXdORMP
	6QDNSgso4GPpaYcSXf+vigsd9VhKoIHDMCvv0piY1gS/J3O+6K5U0vIzIi/3XCJ3ZWr2ikfzVNu
	GqGF09X0svivs7hZmK/eK0jFXVLHN32LdRyKsct9Zz6y3mYfw7sKWcNnsumVMeSof4k=
X-Received: by 2002:a05:6a20:a10b:b0:240:116b:cc4e with SMTP id adf61e73a8af0-240116bdcfamr2552181637.5.1754298097832;
        Mon, 04 Aug 2025 02:01:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMWc3XRarjZz0UicInQJgk7t7SP2zauTJ6j3s03rAStb/JNHrgMbiOAy2gd9heuPOjjuKTWg==
X-Received: by 2002:a05:6a20:a10b:b0:240:116b:cc4e with SMTP id adf61e73a8af0-240116bdcfamr2552105637.5.1754298097274;
        Mon, 04 Aug 2025 02:01:37 -0700 (PDT)
Received: from [10.218.30.152] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da6141sm13929997a91.1.2025.08.04.02.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 02:01:36 -0700 (PDT)
Message-ID: <677e1143-e38a-4c73-a445-923c9df5fcce@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 14:31:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: qcom: Document the Glymur TCSR
 Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-2-227cfe5c8ef4@oss.qualcomm.com>
 <20250730-mottled-myrtle-bull-3ae03c@kuoka>
 <9cb06263-2a61-4acd-a9cc-157abb832d62@oss.qualcomm.com>
 <48610dd9-16c0-48ec-9997-2de9e0f7b3b6@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <48610dd9-16c0-48ec-9997-2de9e0f7b3b6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=689076f3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=3e4NYzSl0HTm_xoazEIA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA0OCBTYWx0ZWRfX8SJA0cnkk9o4
 tQ68l00Ctg6H4F3IPaBjyvIq9Rgq8GEZub/+vr1PZhFW/mOqw0TAprjvA/YeQT33aeMWx2BQRwZ
 kBUijIR40f0DFtkaS8eX6/JVqmtU+/e6G+WaDXYH/5ETwQvQwPVUiiqAoRnfeDFVm8GnHi2aYOW
 C0zyof2Sn7xgUqCbkQzkHpWU0JyNRJn1MmDhKpAEZWqbx3sXLzHhb/LJxqx+oBTT751IrZuIRss
 Hyoy1XhR3i/OWCzpn02Yg7eTac5ptalPGHguqtK6XsiKixMYrJpRFK4XO/vUTuoRvkbufTuLTcw
 NxQDhZY7hDK2OX4hbzFYDPm9HFUycm1hinFx+gN64rbhl4qjOBCBBKpOfqlu9wWKT2RC0q921jg
 21n8kfrU5T/mDaJZfXmm46nFkwEuff90B8zmSiawJjTJ1xemcYNRCQSIlioBrd/FEq90nTDN
X-Proofpoint-ORIG-GUID: SdC24BsNAUNvDw4QoPwzZ3JcqZ14hrlD
X-Proofpoint-GUID: SdC24BsNAUNvDw4QoPwzZ3JcqZ14hrlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040048



On 8/1/2025 2:40 PM, Krzysztof Kozlowski wrote:
> On 01/08/2025 06:14, Taniya Das wrote:
>>
>>
>> On 7/30/2025 12:47 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 29, 2025 at 11:12:36AM +0530, Taniya Das wrote:
>>>> Add bindings documentation for the Glymur TCSR Clock Controller.
>>>
>>> Same question as for v1, what is Glymur?
>>
>> Glymur is the Qualcomm's next gen compute SoC.
> 
> Explain it in at least one commit msg, not in reply to me.
> 

Yes, I will add it in the next patch set.

>>
>>>
>>> Where is any DTS using this (or explanation of lack of DTS)?
>>>
>>
>> Krzysztof, the DTS will be posted separately once the driver and
>> bindings are reviewed.
> 
> Hm? That's not what I was told thus I ask. I am sure that above is not
> true, but if you insist and put it that way it is incorrect. You cannot
> send DTS because you wait with drivers to be reviewed. We want to see
> entire picture.
> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das


