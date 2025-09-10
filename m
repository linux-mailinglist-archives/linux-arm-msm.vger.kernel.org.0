Return-Path: <linux-arm-msm+bounces-72983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C6EB516D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 14:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A2CA442C5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 12:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D689331A072;
	Wed, 10 Sep 2025 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YGSMO8cs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2867C3191C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757507138; cv=none; b=cAYu9OMoIQXGmemjUs12YYRf2qTJNhrqa5QreHEgQbi5bucrfuIK5NWPti/f+y52ZZAky5q0RnfHEdT4BjFC+aSnNdAxYw52X7xENpqc/MF8eCzmKOQYXmAHTYlHptn4awo47YAmtxGgX8ODwSCf/0ovhr+ehesnrzbfe5TDjpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757507138; c=relaxed/simple;
	bh=I939lIKXR/P65iimR2JYCNDGh3a24yNGf+7dxgbMuWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRr/TfyxcYvavwOCSj1LMg1minAN/8rhrdHZeVDb4fhOXyeMXC5BEl5P0gjqS9bCpbEQDcLnW0IRsi4vDImaCEKavFsgwiDXO+mMY7/ODbdRuFHfgegKzwflwgQwd0nXyXJxDFBncoSn5Q8YVbAGwoyMuID2IfMexebxrenjlz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YGSMO8cs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAF6gq003531
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhCtGHB0DkBobVlK7MICfsktcm5yyzHhvJCYtnxxZbw=; b=YGSMO8cs/IX7VOGl
	qYARYWX5lqqlY6xLJWPFYVq6YnEyTXTsbJzzhU8t0lUDFh5WbZb09BEZzKi2NMvw
	pdw9VOhyBIYEZNu2ZuY5Cx2E+REObTSN3O6KUpW8qy/YeUk1LWX7dQhK6IJXuuoR
	N0HLJVkN9lNf5aI1SlZrhL/SPNu0OUeKDPfmEgYkhCarS2eD322RQdHD741xiRWJ
	4ci3fPWRl918MOQuDdI0rGpGUTf3ZWrEXgtTsawcA+gGbZXxrpQezzOLdsvywWDk
	DhFseYpyh9HUOYx2U+GdASX35h4aMfA7F6Wap4VNeS620R3+vh6X0vFO4/QRoIqZ
	JcdkCQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8kuax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:25:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-72d3778ba04so13306986d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 05:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757507135; x=1758111935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhCtGHB0DkBobVlK7MICfsktcm5yyzHhvJCYtnxxZbw=;
        b=p8ztrr/uphWXewpkE4v06gGbRYgiUnWvsC7PhvGYtU1qLBQUXynFau++iQb1ta2uK0
         Z1n1kEQygS+IKbzoeQwaveCKyILjs3Oz1NTlk3xMNBVRuykx0aJiNF7nzSWUurRqSYQb
         wJqHWKZg6EdgJK/dN7FwS0GL68UJ5IoEibfcoC8kLq+2A4q+DqKSWYVVpaS7TRZSt6lf
         Tl3qPp/e2COOdYXLQ/VhYhZMj/jgiTDGGlgqDcsEm1Wa80epJ1wxntCN21/0uUU5e224
         4kUDo0FAsHVOeCgfUNaB2kw2YKYIXPbIHNMwT2iWbFzV//k7DOXDoXY9oNuMb7GZozQc
         dRSg==
X-Forwarded-Encrypted: i=1; AJvYcCVVZ2OdkHLXWSfrLvjRCY/bhX7mtXjlXcTUNTb1elllLJmg4x3RhE9T7NwAYS39EITf1ovem5QpAN3TNfU8@vger.kernel.org
X-Gm-Message-State: AOJu0YwBT0GRrdpX5ctMS9pJCL/bCQQWRFIWwJUyGWUxDdznjswqJ9eO
	mxdPLfGFI05j9mG3Jrw3r96eGCiESTmcVXi/Uvb5QB//TwIoA85NzLoviN5LNNJ9S7I2QHmITh8
	tq3lw+CbMX3FYUoZq6K4JV2kOjqzxVN77G6AyIT8MtooR+OwHmF9AR4/2KmrVfEU8zkfk
X-Gm-Gg: ASbGnctuBuScjXUT7AEzQX3R1RUmp1xHYnFDOzjQrMjZHHeY3BONAkKjVzW9gouPT0j
	JCKfL3Ur4BOzPCsH5E/RnAbUlHCUInZyI66/FW6GnppANPWO/pTvJeXqB7dU9MqO56SDP4/nG2d
	j8A6zxM24hI+Fc+01Enpq9UwwLa2lrHZtrZm4bvxvyYfwOKCj+HSwcQX05AFhRwZgF+1F7qrAiF
	H/MRVkfA6gLA2jz5eKjKascmr45ax8e/esZHzLHrgAUGFNBS148kxlItJy+By02TPWHj0JaTWmh
	Wn6lO5h3BINxbKQ05TG6zq7Ck0HjCrg/ZwTaiCyR6YDiAWSWHaihXaVsoF3zxCElSvT0xUwqdc8
	UrksbC/FMd87vZ7WTYlgzNA==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id d75a77b69052e-4b5f8531717mr107906251cf.8.1757507134748;
        Wed, 10 Sep 2025 05:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE27NK31Io4E+jeD+4VIvXuMgeiu+Md8ls94UaGm36iHEowM6oGp7UQf+Mw0cZqlAH0Hlx3cQ==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id d75a77b69052e-4b5f8531717mr107905721cf.8.1757507134155;
        Wed, 10 Sep 2025 05:25:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334b0desm158265166b.66.2025.09.10.05.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:25:33 -0700 (PDT)
Message-ID: <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:25:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <20250910104915.1444669-1-quic_vikramsa@quicinc.com>
 <5a087d08-273e-4740-b47d-fc25be952ebd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a087d08-273e-4740-b47d-fc25be952ebd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXyNvbG70a2gNF
 l/1BY621NU/6Lx73mmPhHIfNM35AGMmrFNvQJhMSpAr6nol1P9sJAPBy7Y5Bkd7hsBENgpNhK0F
 Gwl4bASiTNP4H9LFr9VYwfEp2AQj1UqsAOuPPuJ9ciyzhyvlJrg2F5MyPJiczyIClRAR2GGRs1K
 QNPZ2sZ3DnN4olhd6zTi5EPcIhTDAF95F9ft07iOMjn2SN5VBS++4rhBBcJXh3/lBREt5IQiHGe
 x5yKtVv4SpcXiCz50+f/2igoFMpc5X0gt0JIpU6naQoM9wzyMAFHtxgfc7uhgFspVDLq+LiM4Zu
 rz3TGekH8HM4pnrEzQLMZ8AS+9xYSPr79dOcW4iItWI/RgZa4hl3EWhL/nXal+2GhSp3VUQWKLG
 8o7c9rQ3
X-Proofpoint-ORIG-GUID: w46qrnTkiHw09yFIlm_wjddTm4ra1_Us
X-Proofpoint-GUID: w46qrnTkiHw09yFIlm_wjddTm4ra1_Us
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c16e3f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8
 a=Ttb-WI7uj3phwydCKpUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On 9/10/25 1:38 PM, Krzysztof Kozlowski wrote:
> On 10/09/2025 12:49, Vikram Sharma wrote:
>> Add the compatible string "qcom,qcs8300-camss" to support the
>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>
>> The QCS8300 platform provides:
>> - 2 x VFE (version 690), each with 3 RDI
>> - 5 x VFE Lite (version 690), each with 6 RDI
>> - 2 x CSID (version 690)
>> - 5 x CSID Lite (version 690)
>> - 3 x CSIPHY (version 690)
>> - 3 x TPG
>>
>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
> 
> Please version your patches correctly, e.g. use b4 or git format-patch
> -vX, and add changelog in cover letter or under '---' of individual
> patches describing changes from previous version.
> 
> What is v3.1? How to compare it? Try yourself:

This is a weird invention that some media maintainers seem to promote..

As a b4 user, I would also like it to stop, as doing anything other than
v(integer) will open the door for unlimited craziness

Konrad

