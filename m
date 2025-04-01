Return-Path: <linux-arm-msm+bounces-52966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D353A77BDB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 15:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3861C188B960
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 13:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851C64D8D1;
	Tue,  1 Apr 2025 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVFXMcvE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B673FBB3
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743513418; cv=none; b=VqUs0BDYb0oDZ6nTmzpzt8Sx0iBdqxcl7kDXXNFtN/AN/5dzdklqidh7BXOZNi97c3SYx0bcRlyd3UKPgzHOJHOtoUsl+EAL5SHUkeo4QI3f2uRDHnq5mqp8oykjVQpUwti0Va71cmb7Z6Ji0C+zgQ6hfUgqXdGe0epUgaslMUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743513418; c=relaxed/simple;
	bh=bR6eGSj48GGt691R3aW9/Bp/2vQMUzQVg58j3Up0k+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHcY7XHMA+s9sQ5sQ7xAR0UHrDPPainDDk4STg2jKot4wA1ptS1snd6mt0Di98IvMkkEZh4gjBuwieD/kIawRxjroMXIM/zz9GIhuftOkGryXcvn0VBI1Wu8OIAoYHzWaRHTnN+twLNgLfbORMH+ukfTah37IHsSmTzZ+c0eQDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVFXMcvE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5318MDBR019726
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 13:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fuzrmKqRaLkRRC/h1dpp5sXVSR1oAWYfmSNhpfK/XSU=; b=SVFXMcvEbMAYFAu2
	USAXHx9sVTLiVs7WUgGRgFkpQLTq/KLv7zOJGtdg/B5DzcYjSla76gRVIsazPFAS
	sxxM/my+Bhx36IPv3TdVrThiRaXwDnyDLXbBuvDuy5w1LTSE7VIm0ohr01XKLFj4
	ixsdKy0si34iW5Ni6vvEeYRJp32vvlAiumA+BSTbILeVKYY1StFKu2zqlXn2Bv0c
	S9Sc7MdLrmbO2tS2KAceWfbSUOD84ndry2gaimkne62OARUEGs4IFrES4dp4QPEZ
	/Bnd0Z4cb95HbiqtGzrf09lhVc3gITC+9yADE/0+nymgW+1X5gqhpT1+yMs0N2Tl
	wLbpdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1vnak43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 13:16:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54a6b0c70so517467585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 06:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743513409; x=1744118209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuzrmKqRaLkRRC/h1dpp5sXVSR1oAWYfmSNhpfK/XSU=;
        b=rsrJzFQTbmsYvoOV9LPGXa1sIjev7Hvi3tHAHOERWQKpReIgTNXttusyCYJB5Klt0L
         m9f6Q5byenb5MDzLGUHyWHXGYiqXIn6X3liOKGlRU4oMsLDDIar7v82R/lid041rqHmd
         xwdYNuyYBQ4B5zihd2dKBygLjBgtwNpISMn/5LbLb+TIohlp1QgMcz1nICwAn7jHQUXK
         ZsWmwiJvg5gBI2xDkZXL43BOyVuGIB0xLuMW0qVrMwwsxCqjUax9hMmym2DcCkUulpXO
         r3LMdpxFzUCSVboR4CbO//b4oIRHek/T6Q82YUCg7b+VnMCQCHUDgDXhX6Kb8NXnB+ov
         Ilqg==
X-Forwarded-Encrypted: i=1; AJvYcCXcSaoL/DP7bTSWhRgMkNpTYIyFMMypfbjdQOCPa25uWvYLawJj4LgNMc0qeEAR6Hy96JnWoFhRan+THBR9@vger.kernel.org
X-Gm-Message-State: AOJu0YzqTpYAt677PSBPb0zCvNHVZCEpSZj8EhR16WKN12bqocQvLQtH
	3mYRYEgZQpxDZk/w7C/soyuvcm8yymjnsGVa15vCyGg7KkBCjnQLQgJQC6jZGnZ/dLTc53V+r8A
	l0irjLjMCKG6rwYQq48AEjlqRc0dw1ZllAqQOkLcWU0eZhkfVi6AbAlynalW/52ld
X-Gm-Gg: ASbGncseDWeW0UXkCJ3aisOI3amZBbcda/TDYA5ssc7qbzBeovYywS7NTsJiikUJkJQ
	HPPDpwdNE5XCYVYH/xaY6c08aOdCI3jKvuV1pfFEMImjQ5mSBNTcv6Um1Sl7gAtRpcPfDMYfLNN
	z5AwghpiulktN98guqVQjGX0yXuntoXX/Z0muYxySF181k7NqSTDbys3Z2K8lpgpG/07HN8r2qt
	hs5b7ZHFuX/TI6HRcMuEPD8CujbXH561h9OqZOKzTtVoB3mmZnLzsWyBbe+1Cn+4LhmKfsn+oVq
	kZ0YAbJtOmzwRXQ0mEACx/JjpZ0AcaQNw5XKSkbmeT7ljeaRfJqRzFT4dE8f+zQolTqC
X-Received: by 2002:a05:620a:1a03:b0:7c5:4738:8a11 with SMTP id af79cd13be357-7c69072e5dbmr1611152885a.27.1743513409221;
        Tue, 01 Apr 2025 06:16:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfs84UuVjPU56+3GGH4wwuZJwdAARKybIpYQNrPciwdKqQV0psmYSnmSCQba15CwNLS9OaPw==
X-Received: by 2002:a05:620a:1a03:b0:7c5:4738:8a11 with SMTP id af79cd13be357-7c69072e5dbmr1611149185a.27.1743513408865;
        Tue, 01 Apr 2025 06:16:48 -0700 (PDT)
Received: from [10.116.217.42] (146-207-246-94.sta.estpak.ee. [94.246.207.146])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb344sm1364786e87.37.2025.04.01.06.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 06:16:47 -0700 (PDT)
Message-ID: <9efea174-80db-4e5c-b0a9-4c5fbc7e166a@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 16:16:36 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] dt-bindings: mailbox: Document qcom,ipq5424-tmel
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        manivannan.sadhasivam@linaro.org, dmitry.baryshkov@linaro.org
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-2-quic_srichara@quicinc.com>
 <ru37oebencfqbepop6ka5i2fc64ifk4nnwqmb4o52nwccpplkp@b7xxxpp5snip>
 <479b9613-8244-4a29-9735-cec47e473946@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <479b9613-8244-4a29-9735-cec47e473946@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UL3dHDfy c=1 sm=1 tr=0 ts=67ebe742 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=aVIEJrXLnI925Kw8RqJ2Kw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=0xp6LphHLZRkLrDefq0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cAfK8-zlu3HRlsXnVwjGh3fD0F59wfon
X-Proofpoint-GUID: cAfK8-zlu3HRlsXnVwjGh3fD0F59wfon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=790 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010082

On 01/04/2025 14:26, Sricharan Ramabadhran wrote:
> 
> [Resending, since my previous response had some wrapping issue]
> 
>>> TMEL(Trust Management Engine Lite) subsystem provides different kinds of
>>
>> Trust whatever SubSystem (TMEL SS) ...
>>
>> different to what?
> 
> 
> To the ARM TrustZone firmware(TZ). So these services (secureboot,
> authentication etc) were provided by the TZ in some SOCs. Here,
> TMEL provides those. Can add those details here.

Yes, please (and all other answers too).

> 
>>
>>> services like secureboot, remote image authentication, key management,
>>> crypto, OEM provisioning etc.
>>>
>>> The QMP mailbox is the primary means of communication between TMEL SS 
>>> and
>>
>> What is QMP?
> Qualcomm Messaging Protocol
> 
>>
>>> other subsystem on the SoC. A dedicated pair of inbound and outbound
>>> mailboxes is implemented for each subsystem/external execution 
>>> environment
>>
>> Is it implemented in the driver? Is it provided by the hardware? By the
>> firmware?
>>
> TMEL firmware provides and processes the inbound requests and responds
> back on the outbound channel. Can mention this explicitly in the above.
> 
> Regards,
>   Sricharan


-- 
With best wishes
Dmitry

