Return-Path: <linux-arm-msm+bounces-98374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEYwGAN1ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:48:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F403C2B960E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDFBC30B3D43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF723B52E7;
	Wed, 18 Mar 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBXk/WqL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dx00fedR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461D3AEF3D
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827072; cv=none; b=CdHILDxU01fxkB5BwIpGnyAS7C20q/KVWcwaK5ceIizqwSkp7Ua/3gFyBYoTqLRnmnguCw6EKMnBGtZVSiglyJwRmCa61Ml6xgdC3VHcE0wTtIgpOc51Z/7xYk9zPl+yeoRb21bqo/U0hHX39rqCg9bO71qw4189AUUnrLHkZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827072; c=relaxed/simple;
	bh=CyknBeKqTlZejnF0RJD/chApW8SipJUFEYisqUHgDg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OxFNaFo4kklVIdSuU3c0rCDwBNtfd4NPZR57ReVncIJx98vniPFLkcF2niyXZkvv4M6ojcGrrYWn3BE5y5S8Le7o17qb1mOkzbZSD11F3gpcuOJF8vaefKmmbyHcUR+WbCcji+7eLwebPT21hA8leN2/ApbIg4XRxhRrrDD+kn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBXk/WqL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dx00fedR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6ZEVT2878100
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbVv45hd0DVIDJ3yn4OOBGlpupNQcPbuN1Rkfy5xXk0=; b=ZBXk/WqLt1W5mOdR
	kQxtKfosS5MtZsYHisf7tt2yxln/jJ99GTu0Ley3zRAn92JZcYmLTuR92xjBqriw
	yrT3pPYBDA9nBBBMuJKiMtIs2Z4U0R5GGS7if8mcWYjMnTh2P6IgB/bOxQlZkbhg
	np/bkznETNUASky+b7s0pJy5ZvJrx3kmFVYxu0ALHA6OukJGSK+RANLk8yK6+LFf
	fPFUyDwlq1HMFRCR/5zUWPUmQp2GIURJR7M/ckZDgWY+oVnqmtfNp35EktjeEhra
	wYS7uJS/PTIsWyUCZfhgYlS7JdN8C1XfB91CXdYmHanoHZGOpG7mYkc6lNDtdEG+
	hH2QRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr0vqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:44:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50918b9bcc5so42859801cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773827064; x=1774431864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kbVv45hd0DVIDJ3yn4OOBGlpupNQcPbuN1Rkfy5xXk0=;
        b=Dx00fedRCzvEUzcATTusKbVqTyaMPpZYkkkoLtnKEySlWcWZBnL6EC5rjpOCaBoqcq
         cd2LUnfDt8lJ/7cZuD8DgrcuW/gEq6qd/aJMAYs1Utj/VyCq02SG2ZfggH0qJmrXLiix
         bNnZ312fGSYgy/vDeZPizqLI3TcLyXurFlqR7FCxtCfI5ssOlU/kaOB915qq4Z4v16Sn
         Zjo911ssIjXoVVY2HkTL5mcvFOn9Ss4gRL/gyBmyuld2Ar4DtSvQ+7XPAu4FP6c2I1jS
         2m6A87FOp/F9VtzWAOgBwPcp88NfKfCMzLQLNMxMER+UJsGd13+z5g0SV+02LfqxK12t
         l42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827064; x=1774431864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbVv45hd0DVIDJ3yn4OOBGlpupNQcPbuN1Rkfy5xXk0=;
        b=FZnpZKUW+gaBNNA7rK8I9u1OTjEXJDW31FAgtBmzQBqRMJK3iVhEnbaVZNSI4J0spz
         pldGxOpFDmQ07ZYczw1HKlcYeEAFo5smlD0e7Jd6zJ0g7OKEsEnIpCmH8/WG281nRIDT
         XM3Zwnlqhe+l4ao1TOlfMU2aobMroZOMghrkwCz/wYU4KxRsVifSI9YtnCH0MU8d8elK
         roPpxkVC7ZGZgwHj5+056E5CXF5M6P9HHz9IGSLQ0yHl/hOpY/cv6zO7pkmggtyTC3vd
         96K7OG7wMVXPThKQ0ECo03v1J2ZKRqOsM2Fc9NZejFmAp1Hw+wmGXy2yXAWIQWXo7S6G
         cAbw==
X-Forwarded-Encrypted: i=1; AJvYcCXAqEWyVtBBuumpa5kqrATzB0RtqSjFzkAj2/p2X7sy2Mqv/+su4MYbtbU+CsSnvTDDr9UMiAhJ7SDzZC3l@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZJuv+DMP23C9cXNK9lnpFa7z39s6abtzKXEMVy0iJB1R5la/
	Mcg6vV1q3DDX7uxwKxxBSHZxoxhIWTqBKakhpJAcwxC6x8ia2SNMsqDR5fr90EgW9wjBTWGfn+C
	ye20lm8QI6098ynAT9QmN5aUOLF4DTNm4zS6FwTLCp0B9EPpuc8hRAcw9aMtDzpbRPUV8
X-Gm-Gg: ATEYQzzYC30JZT8ffQfFaA7dxnMYujtHdgza7tRogwyDfz1sE1rZmoCjF+qRqdKAG4Y
	i8Avl9LgjSn20/VZf3Rmj4FfZrpgTDsK8MKG2TISfJS3r9LejlVLldR7ciTybnsY/IEtieqGp2o
	o3kWBqRocr8LQVcAbZFPkMZK0Zz/IFDyWmGc7io6HGSxEaL9gjIXrJcbndKe9U7dOzz9pDmG3kz
	wlUl0Lhcdh+kdv4Jm1bsxl5gfAHifMrosUPQxvZg2TaOonRcQs2ynYEWyAlxRvcHmPJaU2YtlND
	iqeZLK/1TJpR8T6a6whCxxHMF/mJ0ztu4T8sGdlZZsSg/7ctiKYdprRdPgsOjl/V2kTWs55lSWO
	geXQzI/yRf++moXTx8nm0HFWaDxlivYnpb4to5YaZ0TJ5tlqK/fib0WOWBYllVz2mh+xsEOgFIY
	3r79g=
X-Received: by 2002:ac8:5f4e:0:b0:501:4767:a6f with SMTP id d75a77b69052e-50b1478e819mr26240911cf.3.1773827063805;
        Wed, 18 Mar 2026 02:44:23 -0700 (PDT)
X-Received: by 2002:ac8:5f4e:0:b0:501:4767:a6f with SMTP id d75a77b69052e-50b1478e819mr26240751cf.3.1773827063330;
        Wed, 18 Mar 2026 02:44:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm1264923a12.19.2026.03.18.02.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:44:22 -0700 (PDT)
Message-ID: <c4376a88-a490-4b58-bff3-b0f4d2f731b7@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:44:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Enable TSENS and thermal
 zones
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aastha.pandey@oss.qualcomm.com, dipa.mantre@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
References: <20260313-sm8750_tsens-v1-0-250fcc3794a2@oss.qualcomm.com>
 <20260313-sm8750_tsens-v1-2-250fcc3794a2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-sm8750_tsens-v1-2-250fcc3794a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69ba73f8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7yBUspA8RIIxP2VSvn8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eJG13SlzVZd9U3CheF0Sy1QOgvWbc-GC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4MCBTYWx0ZWRfXxtl27Eat/T0c
 MKUR/t3VV+YJvdphMzhqygjM6T4Exo+giQ7mBrFJf6qzgyQyqbLxvn9cY62lpcBDoGsBLZ1n/ep
 Gs6x4dleFfVEoOPgIFtMhf4xLFKpEZ6G4sA7uKScHd50CDCrLCL+c6kPHvNxwzFTdPNxguqCisT
 oG6lj+yNgDBOAcS8+Ik4WYbma4n+axJ+733wK1KxjrEnc/ZxVOxJSkjtL0gvtTxUTVHvx9iBZbS
 aRA4CKqr533gOfh+bevAI6f3hfZ7oAyB9iKkkdQOJ1iiVxZFwcAnNj+j00yN4YZP3wUnkpdYcQk
 nP9bDPjycDyP8TPQkoWWDqDcBT9bWJBeouvMnMA0SHjDBqlvkoALs697GiQFRtuUVbBfJpyAbLx
 2ZB9rUFSORK0nAQ8D1CGZADodc06OY7cWbtvYEXimUPBZVsShrgIGFzp4/rp8IQf3nrOF7EAPiJ
 0VbB+yopnQz6VRuAhbA==
X-Proofpoint-GUID: eJG13SlzVZd9U3CheF0Sy1QOgvWbc-GC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98374-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F403C2B960E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 11:34 AM, Gaurav Kohli wrote:
> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> 
> The sm8750 includes four TSENS instances, with a total of 47 thermal
> sensors distributed across various locations on the SoC.
> 
> The TSENS max/reset threshold is configured to 130°C in the hardware.
> Enable all TSENS instances, and define the thermal zones with a hot trip
> at 120°C and critical trip at 125°C.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

[...]

> +		cpu-0-0-0-thermal {
> +			thermal-sensors = <&tsens0 1>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature = <120000>;
> +					hysteresis = <5000>;
> +					type = "hot";
> +				};

Are we going to use these trip points for the CPUs? If not, let's only
keep the critical ones (again, for CPUs specifically since they get
externally throttled)

Konrad

