Return-Path: <linux-arm-msm+bounces-64073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5AEAFD150
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DACD64872DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CD32E5B10;
	Tue,  8 Jul 2025 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTmkHCVv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F322DCC02
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 16:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992368; cv=none; b=AynzFj04KbLLWIO+ZqfsH/jj74UPWriIzpgjjdSaQrdVErDdR9lBDPSkcUURWO568SJWI/mX4ceI6f4uKccihPZOGCvibPYsZTFXv8iigPgailCd7DGsk21pjcXThSe3oHFJAnkAv7a8YDAFX/sfUbU4tubYy+rajIM35BK5Shk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992368; c=relaxed/simple;
	bh=UArFT/K1nPlTDJiWQnFIAlmXUzoFAJFWuniA93+0gjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBUcNv2O+jTAE9VDJF5Z3MIoKLbmIZHBuU15FJLhtxcQ6MnlgyyAl3cerK3Vz9iiuKizJOSfiLrxvltYkVFfEWJe3+gA41/ly6mTcdjnIlj33w8ds/HbxyowAgiVLOvauMxPwdiUbrGaSbbS5QKeG5XU1TNV2puC4I8EDYTs/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTmkHCVv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAGVF008311
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 16:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TA2vLnQ8qEkrvWVMIaoxqMeWoxg9A2VtG7hX+L0UhSQ=; b=cTmkHCVvcKn7KmjP
	7aMsur5qvUNzNcXqRWKQ3FV1m5RYptT7LdRBfTtaj45/KLhRVEyYLEG0kLFrWAOh
	0Pn6paAxU214tf3LYovk2Jg2NB5vFwuMedDWPUNNryTAGfg5eSX4zQRG2IFwYSN7
	eDb1XKxVwXvIbttCAyop2q2fAMfRzC3CAR/wnG8JzyG6w1QbPdMlHBKkpJWxwFfY
	t6vpaIXXlcA/IkHTWLN1JB1SQFJrt+UkwOXtEZtcM0czUgzxUtZkeSwY+h2tSTHU
	ScHaXq0Id1RM5kRTq+I9hB7jVHKpiRvKJBqpYg9OYVdADtpLJ3zXjcM9ydDLFeDq
	Y+HtNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn04gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 16:32:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d41d65f21eso34937585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 09:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992364; x=1752597164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TA2vLnQ8qEkrvWVMIaoxqMeWoxg9A2VtG7hX+L0UhSQ=;
        b=Vc2nsLvq0ab/1Ewc+MVeB1eKn/dwZEVyhkI2NfYYEg/JQLOia7dq6QD9f9ZaFv4Och
         dGr8l/sG78mkb4qCrnt9GIfRLc0ycix603PdmO2rQadZp+C638Uejy1kTZlnylO0ypiu
         QHfXEACC8JaGw8CDWD1l2lrJgGVFDa1+mC3Z2EKb1LeWkUoUP6ldKAJ/9xxYc3JlW7XI
         a62nCwST+7O2u7gemKtdUzgXQYvG32KXHjeKkbWLzV0W5wmlBUOnxHlqFtzT3EvYLjgJ
         W+mGgzWhAcTT4JNlutKd/B7FiANTrMU7+qkQZlgVK3w5kGn/Pci8oKqzUC/BmBO/0i72
         gzMg==
X-Forwarded-Encrypted: i=1; AJvYcCVbv+5Hiw/0duHc9sHUlGajV/dzTdaP3Du6TY77UXvUZJ+ILTBD9tX1MHGLaU/H9hjtPkbNAo6Z+38YDEJP@vger.kernel.org
X-Gm-Message-State: AOJu0YzA2/diVIUm3PdZS4wAoaoK/Vs5i8DoWty/zogvj/7yv3fO+NuB
	l6mzyh4Armo+os438q2RsspRl87a0SPfT71GjGWw5lU6EwHWn/fuVkgSJdLVfypyxLntEVztlhY
	CXug2HsHgrLTFYfX9V+iLrea7RquA+r0G4pW+lJ0+zVB9VQAq0xsaSQieeTKT5b54Qa88
X-Gm-Gg: ASbGncs4dT6qkXbCABjb0SHAvHOnLiLm4DEBEYQRuhE1UF/gx9shCgJH40LiPgjlB17
	74c0mxm3hf12iKM4jSAwrtquyvT6lyRPpNu/coOxw+JEfurVnnod9TRcz4EcGyOMHJEo/Qf4fk0
	JRxDVcSrMsllD9eu5XbawyqvVJfg/R4Hgc6MdaZNJXjT4xQB1hXHtpJp4zCnrv+6bq11Uc/88Sm
	R9CFZtg6fSDHJW4rvrwpErP49lIcT3g3Yqsh0cbi1z3pWfm0Hx4kqtyPlH7CkI1SiG6++EQ4ipF
	eSihp6Bl7ql7pTo6izeT/BdZwspppWOkYjoNJNsXE9rTWZEgmfJuAbdNpHtEVEVAp3ye9dMtfpT
	WnH4=
X-Received: by 2002:a05:620a:4710:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7d5ddb31bdcmr940388585a.2.1751992364328;
        Tue, 08 Jul 2025 09:32:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsCFvoBAs8YJH6fp9eQtKsRuq1lo2bD+F8rQZPXJ7oJTlCEQ7nv7k9KIkw5nPgH4kxOBgd7A==
X-Received: by 2002:a05:620a:4710:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7d5ddb31bdcmr940385985a.2.1751992363651;
        Tue, 08 Jul 2025 09:32:43 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b0336asm923512366b.115.2025.07.08.09.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 09:32:43 -0700 (PDT)
Message-ID: <e99c8094-68d2-490d-8ffc-53b601449b08@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 18:32:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT 2/5] ufs: ufs-qcom: Remove inferred MCQ mappings
To: Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Bart Van Assche
 <bvanassche@acm.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Can Guo <quic_cang@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
 <20250704-topic-qcom_ufs_mcq_cleanup-v1-2-c70d01b3d334@oss.qualcomm.com>
 <7cdpetp3fuxpu2eeqctc5f7kytfpvoquopfsr7ea5non6bo74z@pu45jowjzwrt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7cdpetp3fuxpu2eeqctc5f7kytfpvoquopfsr7ea5non6bo74z@pu45jowjzwrt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686d482d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=keaFY8-lOGZKNXLQRCcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: cF6fR86yzC2gTVOgJmVBOGaq-XzwPhKv
X-Proofpoint-ORIG-GUID: cF6fR86yzC2gTVOgJmVBOGaq-XzwPhKv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE0MCBTYWx0ZWRfX+1SVw+EmTsk3
 5o5lN2lGCsNPyYJBdNvP9yqIy1elUfgwv2ql8DAuHGx1j5nzHnFigC4R3gSMRzkBctuIAK/NLbE
 2bYYYhxMxOZ1GC+aSMBNmfPLtX6RIAe+8Nc4YM8ejqS2iJjhrz8KvH3hI16MIO0DP81ULF0tb5T
 mpgqiwHiNG1pr6YsCBSv30xr4FA026pZqnq19rsIFj9huZREZHjDxJXJyiFn7UIKyiMjNNHZxr/
 XgBaH6ce+SVM0gC0L8x87i6fvUxy8+t9I2+Q16iLV6oL7uW+oA0us9Xr5J4/rgXMbiQh1fXZlLa
 rdKXDXcfL6z5ZtRHlA/YW+c68s1YvYBFpV2YgBLRS9b7VGUl4HkpCP8Sm3+4TUSNHMlxlY41NRr
 5Te13eiE6PfaTvMbRigRyXh9YMi5Lf0FnmVVlxZ5aPZ0Qw3im9JpGCov3fQ2vku5/3yt0KHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080140

On 7/8/25 1:13 PM, Manivannan Sadhasivam wrote:
> On Fri, Jul 04, 2025 at 07:36:10PM GMT, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Stop acquiring the base HCI memory region twice. Instead, because of
>> the need of getting the offset of MCQ regions from the controller base,
>> get the resource for the main region and store it separately.
>>
>> Demand all the regions are provided in DT and don't try to make
>> guesses, circumventing the memory map provided in FDT.
>>
> 
> IIRC, during the MCQ review, Can/Asutosh justified the manual resource parsing
> due to some platforms just having a flat 'MCQ' region. So they ended up manually
> allocating the rest of the regions based on hw capabilities.
> 
> So there is no such requirement to support those platforms now?

I read the spec pdf some more and I think that this series is wrong
(but the current state of the code needs improvements too)

The "problem" is that *all* platforms have a "flat MCQ region", because
the UFSHCI specification mandates that. We have a block of:

----------------
| SUBMISSION_Q |
----------------
| COMPLETION_Q |
----------------

register subregions, repeated 32 times, each block being 0x40-long in
total. They're at a fixed offset from the UFSHC base, specified in
MCQCAP.QCFGPTR inside UFSHC (i.e. ufshcd_mcq_queue_cfg_addr()).

then, we have an equal amount of

---------------------
| SUBMISSION_Q_DAO  |
---------------------
| SUBMISSION_Q_ISAO |
---------------------
| COMPLETION_Q_DAO  |
---------------------
| COMPLETION_Q_ISAO |
---------------------

blocks (although these are allowed to be placed anywhere). For
reference, the QC UFS block looks like:

--------------------
| UFS_PHY (QMP)    |      - 0x4000
--------------------
| UFSHCD           |      + 0x0
--------------------
| UFS_ICE          |      + 0x4000
------------------------ # "MCQ" start
| SUBMISSION_Q     | x |  + 0x20000
-                  - 3 |
| COMPLETION_Q     | 2 |
------------------------
| VENDOR_SPECIFIC  |      + 0x20000 + 0x4000
-------------------------
| SUBMISSION_Q_DAO  |   | + 0x20000 + 0x5000
| SUBMISSION_Q_ISAO | x |
-                   - 3 |
| COMPLETION_Q_DAO  | 2 |
| COMPLETION_Q_ISAO |   |
------------------------ # "MCQ" end

(at least on SM8650)

So we can't just map the whole ufs-adjacent region like (I would
assume) the spec designers had in mind, as the ICE is expressed
as a separate device and we don't want to overlap-map regions.

We could maybe map the MCQ region in its entirety though and rely
on fixed offsets within it, promised they won't change with the
next platforms.  I would hope that's the case (so we could simply
mimic what happens in e.g. ufs-mediatek), but I'll ask around to
make sure.

Konrad

