Return-Path: <linux-arm-msm+bounces-73086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16925B52D3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A08A1C84F42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B8D2EA171;
	Thu, 11 Sep 2025 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bv+w+ab8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14602264C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582915; cv=none; b=NijKxBjDRLvMwbVuvwh4bl8B+Wjj3zTSLYGlTnC5cWW78+RGtp6B9CAwADu+LaABC9fTzAoFm3hWIWmvy3pAJurwNjZyvEd8wE2Roin45SRVufG3AWKzrfPMZ8rzU94NS7VOIC42H8EnIwvF6+nBJ9vxtWdNypdJ+YXWBEJJdVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582915; c=relaxed/simple;
	bh=poOizEiKiZyCIx3xZEYaychJQx2tdEeFeMoFXxpR8Wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGgzgmuKYzJMjSqPysFahgEQwIxXVKEHItbZkXO6mp+Gv93pOcTkuN9AjPF75TKDgnNoc06O+ekLB7+TLV4UumMOOjCC5YAYeGJ+nMzqvJA1dBWABQTm5G0Ti5BusW/5O+x6w/kwuhO3Km1H28HHSrTTA+5Hx3oMkM+H99hdt0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bv+w+ab8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B4kldn021313
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Cc6P34NtiRIuR3gg4cKYNTNOU7BO3/Vq9deYYEQduk=; b=bv+w+ab8ro36x5jz
	ElabyS1TMteBhmJox8FMlpHptAWELxu6oRKNUPk4SomY+hd4ZJ/hMIzaXPxYpe7d
	3O87q+hEDEaUWhxl49ThnpRs2HzQ+iwj0WbBDmiZBg2aQXo/FaMnZlNrSVyPSz5c
	IV7i+YQxPqCv24Qu8lbJtA7Vi3EpNB52bHpf9x+to9M4iqVfXWLHFORWvJs7BvGS
	f9Pu9VYPATRUPwhtzjSX2XZAk1E7wr/BzVq2HubhibBgtky4lVMDrNZjtHGXNnGS
	bQVXZui3M6cPWmr6fM/XS7AD1dIpL5bScJXySLdWW8qKZtFxDDbJcujTdWvLW4XM
	69Lz2w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphrtec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:28:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b604c02383so2650681cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582912; x=1758187712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Cc6P34NtiRIuR3gg4cKYNTNOU7BO3/Vq9deYYEQduk=;
        b=fySQkYzRLW1rZkst7ml73BMaEIEBcFNsvEOZb4KtCwx4P+SKc1HPJw6HzKgf7C+evs
         b+gAp9iZYctc2gy7gsUd/YucKSfWNOr1pvs3cRuung2sjKC+BFzyI4gkTZJnb0vcpCR6
         uedCA0i0KyD0yRg6wupGC6GQq5ZRxVVWuNtFZeO0kfMa72BkrRDcIX7Y/Q3YgTrGYNOQ
         v0YzM+MB9RFhz8vwxuDyRgAYpUl8JqAwTD45K8OcUiasrMO8H5YtUf1Q3bxzHfTosTqd
         GvCNqWNAw+8mT8h319ftJZDcC7f+2vGnaQ1ImkNIO/f1OBrUDM3sdfPzQuO04MzYC/6R
         Irsw==
X-Forwarded-Encrypted: i=1; AJvYcCVKgw71W00a983koIR7XPoDrYwxLRPd+mR+9QF73ai7m8CT6G+/KjuPcGwkOl6s9v/ApbRbKRRLz9Ez11HG@vger.kernel.org
X-Gm-Message-State: AOJu0YyW25uv9MX5k+0/ivOfEeZTo9a4Vb+fRk5EldqU0MsPJbMux9Y0
	FmsFFjBFiyityUK0NysEZCHy03IZtRRsQuzzWX4xyafEFijKtGJTrzPxxLwiT5i+OMje4UJHcw4
	4XGrI7T+XQ9Yq9NiWrVVWqNWmieXGCCrXcgSG/nOJ/1EcQh93Xx4UYd7lJ0hXDtmwGde4
X-Gm-Gg: ASbGncumRuuHhCxCeysCCs1z99hP67+Fb0a7k7PjwiTaQ+toWj1cpCnPxTW+G1rllin
	NCoachFo5OiM2fC1xDsG1kJRBFnDDVNUfWKJX3WPTL9+n7/ISmvzag5I0CrexcIRzPgN/U6KfLw
	I78X0VtECQM2tYYJjq6nYsLGWoK+AkFjcqlRlkP68iZDE98gvFzLKBiGFJD0tNaPNhgK1n1swBX
	yr1RO8h24V0kwsvEnHBL0tWZOyPdw5EqdQz4s3+j6npMD6ctt9WUxU+kkRUJEcWMZaJPBZ9/SEP
	r2G8JpgYlLmX03aZ7gkCBXcCc6cGlVrHbf2+qGoH/qkFZTJpGQ9x8UqCRC9DSZsa9negMafHmBY
	TQLXWd6HkPHrSSN5u247c5g==
X-Received: by 2002:a05:622a:494:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b5f8377327mr122379271cf.1.1757582911833;
        Thu, 11 Sep 2025 02:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhG+r5MhQk3DtkHGVYAZ2SPXev3mp7KPx0SvmxN514iYiy6V4cdUPLo9Ey5HGku7IAAqpEJw==
X-Received: by 2002:a05:622a:494:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b5f8377327mr122379141cf.1.1757582911416;
        Thu, 11 Sep 2025 02:28:31 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ac2efsm806457a12.12.2025.09.11.02.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:28:30 -0700 (PDT)
Message-ID: <fd01c457-abfe-4169-9290-27d8b131cb8e@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: camcc-sm7150: Specify Titan GDSC power
 domain as a parent to IPEx and BPS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c29640 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LDDDIuMr0XRAt-0CmwQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OquJiR6P1WEqJfa56xTD9kf5EbEwZy43
X-Proofpoint-ORIG-GUID: OquJiR6P1WEqJfa56xTD9kf5EbEwZy43
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX8ZbYXbk2PuoM
 u2mGCPTmtfRRJCBpwOHtvlvQQ5LFFlt3MSOiVA0Val7iv3qg791nOO808hJ5oTqLF6yEcG89Fcy
 nT6Mnb0hZ7Ed7yQaYKNZGpBIktWoDMeUQ9KWHHfM3u/3gCMLRktUv2OeSk3d8tikYeFtf47UB41
 4Zru41wbbcqjf7zdJmoDZodEpOPuHlcB/J90hAqY1gMMeyEdwlAjz+Uks6bz8b6xW0HxqHVVMbX
 5MQLQrMgfUt/JmKXSstDpq+xio8PeP8NxvHlRaXy/fziyMwSSleEm3CqaPGMPYYC8eaMdrEqbMo
 LplHj1Ap4hO5zHOuuNVlo1VTaOtLUXxxTeI5Rp1/XJm2BD/vZ+S6WIrJTHBaDnuGOyjEEWAu0Nl
 yzczsPHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040

On 9/11/25 3:12 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM7150 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

