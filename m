Return-Path: <linux-arm-msm+bounces-88760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E5D18498
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80289302FBC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223F22772D;
	Tue, 13 Jan 2026 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADVBcV1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJ7CIwTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77FC346E5A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301682; cv=none; b=MGP9KZDz0KLJLMnwb160UVfMNfGnGwlGtdDFYM/TZ8r8UCkSY9OzoM6ygZqClMyWKmU0+v/ZPRMBXuLXQ1tP0Cmaetk/SwQj3IF/COVnoTPnTI6DLYn2z76fLL2EJs/Kx3C4O92GRlzz7HgirwVlOFDNOELOqD0k48328AV7zqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301682; c=relaxed/simple;
	bh=geHrV8j325fjCXR/96bYWoEOz5SdRIeeeqgCGYspfyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huJ0ip00yrOCx4qse+MFv89ZyPlPeGRstU/dZ0oDaJjIgZN9nE3VwYSoGoUG8nINQsyeU/MoxxGfn/vvUwqnQhn42JgRzs3cQenff4vW3Ybwi5gxUL/1JKZESjV3ukBigDdLmEhoMo8h0zh0yDQDe8prphTlWQ5Kilw+QZDiqDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADVBcV1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJ7CIwTY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D76CCm175876
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxxFxFdOUorrSwubOUpoJfLcPzidJL2DPsjTQBjmS0A=; b=ADVBcV1JD+4tSwcK
	8mnFNtau84ItVxosTTzUVROqjAqO7WvLLf2TGI4j+1m4XteKrmA5ApRPS6UAYZgX
	KVjLRlcbfvJmi8E6Prum+dKAG8UJT7opF8yEjozDmSv4vnUmHSPWj8Z4LGVo3iS0
	YcfDYNDJh4bp4C9DirUKvdenbEjn6tgkL4rf/8VeWaQ8ZyCw+9hMLY/kgXMWM13L
	csxwg7I9Gq4MZUmP9ZPRP3sSkQnjMdBhDGrfo2hL5aX+07bFcewNAfjk2+XpYf7k
	8VJHi8NQvgb/ROLGZz1hZXlarxwOwtFcuOjrs4ptITtGu7eJNFOtT+CVhbzrpkLx
	L4h3Sw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f2x1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:54:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f3564e2321so14703551cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768301679; x=1768906479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NxxFxFdOUorrSwubOUpoJfLcPzidJL2DPsjTQBjmS0A=;
        b=ZJ7CIwTYQ+6k6DlrZf9+3LyFUW6BEac1q2hnIb5sVQYakYDXrIoy3xQ3dZ8GbEfvgl
         gu+znitsl4NGuoYDn+5nIAMORyGtGRETIBZtgS2R6CZr06W52H3CKF8J+cONROst9VxP
         ahhWDmaSjCGVSOzxILGhrpMx43N7VtP7eE5VfU7BM4N2rFsVtil+GLOKPHCh62Tsr5wu
         WpGNM0+aqKQaUYDSxiYYMeUefsozAckCyI+E8ThzgVE2OMem7sWG8cU1lbRTO1SZ/EbI
         K/Ttp6IWJ7MtnPons69k0sWd1yxA5k3u2w317oIe2WAqDMcTmO7dfvCeC4OcPV3VJeie
         p1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301679; x=1768906479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxxFxFdOUorrSwubOUpoJfLcPzidJL2DPsjTQBjmS0A=;
        b=oKBC0lPVG0LLAgOxMQnkDFv6uZBacWvqVEv9N4FbJSHF9SOZmRANCN27G+yAlEyllD
         IMmnTbR1qSKfGbhVyglBuIjdIuwjBCAjeuPSrSi+eX7QWzp0ewpl0HHNDPzDnC+hJrn0
         QlQlVmTk4NyD6ncoNHAYXUUgE3CjwkZHiIk7PSIGRyS0LFHlMpbgKvv95XTCxO0DSX8P
         N7JP8uyCWKsRlwwhrnYnCtM1zwgBbYnIYaOLdUEpKDy/i/4r49LAPSOIy69GH83bokrr
         DPl8EamWgThgpW7p5Oiuz/h+EYwGUb2+Pxk0uLVyJlP+2fK/KXs8vjDmNupCaqN4fc/O
         KtoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIr5FSfeAgV6SVcjwb0c0viIZj3d1/04K3YMOp/TuamdChDfNnYVWUTDS3PiQjX8gqf1Edjcz0LA0v9Ljw@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJSo3NRLg3AAcuzCyLnsU/5gCvo5wGDz+BNP8/PBRFyZl1qtk
	7u/nHswNJhonr621FeR75Sld34b+MekuOBvaInVwghacFZIhIlMltmK+s9ScOpugSxLmJhgWV6O
	Tdw1W2W/obcyoOOAyBFh3RC+T1N4HQype6uMZeAp3CBQYxTdxop42ZCSy8xsxsibXG9UG
X-Gm-Gg: AY/fxX6rDXaHY3TsKl9ASJnXShQr0zck2kYO2tPDMBXddfC4HNd7KpBaouAHzJvJU5w
	T9x1MW880HRQQXLnQodHveYJUOM7A0fkdSkIGpXkTJP49RmB5penzRNyqTDTu6hGyYch9AvdYxY
	pHqzJ4JY/mlMrNNUjzFyrsBkLSbhnurfzQMHu5TL+J6hkJI+7kZgY7P8VVuOyOPXiD8MH+rzXX3
	e61NxKzag02a2wukMbiWnGZ+b+SsSyqB3nHGGYCPjmiI3BKouaM68FLFvfF9Kbj5BpsTXB0atpD
	rXeaDzDfjYWrnPDhxnVIqKoC1apew4VNR529suzgdysFEvKrawzMMaVhL/Jay6I4rlD2nM3sTT4
	cekcS9mesavZCmylDkyN8lcPFacLrtQKJoKmg7b1s61W7iEShrtO3EC5do3LKA9gXibE=
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr230844111cf.11.1768301679036;
        Tue, 13 Jan 2026 02:54:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQc0YXkBhVUzUnAsavtTTb1WiheZk2936oqIhZquyqc2Qmv8AcuJgaGJ36Y/j13vnLAjXrUA==
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr230843941cf.11.1768301678519;
        Tue, 13 Jan 2026 02:54:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8709d11b90sm741890766b.12.2026.01.13.02.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 02:54:38 -0800 (PST)
Message-ID: <cfc4914d-a8e7-49ba-a5d5-7ebfa62fd0a2@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 11:54:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: dt-platdev: Block the driver from probing on
 more QC platforms
To: Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260113-topic-cpufreq_block-v1-1-91f27df19028@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-topic-cpufreq_block-v1-1-91f27df19028@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5MiBTYWx0ZWRfXzgLdcalcK4hd
 DntURjD1uQVoQmFX6cC5FfS+F8gmal6haFpM9XPdNnGnqsQ4YdBIUwTg4+eCh5RkUfZqmDDjVPJ
 oZDFyAnw67uZycHtsuS3FcGINferxBv+g1Wg86rVwt5rolmU64wy6nw+fcxYqp60VDKrYTn8OVz
 dvvfNA1+I6sVm1KX8LHGHoIppliUVHzrMgL+Abf0YUP2Z14kYttmePzZv1KYkOJLbBsrYKTEJmP
 o1oD33/ZYwBs/Qu2yqaMV0wj5+7yd37YTL8DjlhQSfJ36kLLixZiK6WBxIgcE306hhHVt8SbPbx
 t9MIAG9GNKwj2hHUgz9CG4LtBnIDxGC22XtyTqmNzVXEXmw/pAE7xvXguwVBJUoP8us7PW6z4+b
 BKK4TErgY4L5k+byZQMHn4WmypkiVkjmxt29Vrz6EUPwelaOkOcDXCbUP8nJFVdguvDP+nZgN0r
 YJZs+Bnp6nAnKuoeSsg==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=69662470 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vMhQApj_rjIVdvPUXlcA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 0Q0AQNgE_xtvGSOwGlH2NXO7pAls7jgn
X-Proofpoint-ORIG-GUID: 0Q0AQNgE_xtvGSOwGlH2NXO7pAls7jgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130092

On 1/13/26 11:53 AM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a number of QC platforms to the blocklist, they all use either the
> qcom-cpufreq-hw or scmi-cpufreq drivers.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Note: the "qcom,glymur" compatible is not in -next, but is already
> approved by krzk and should be merged shortly

Scratch that, immediately after pressing enter I realized the ones
using cpufreq-scmi won't even have an OPP table attached to the CPUs

I'll send a v2..

Konrad

