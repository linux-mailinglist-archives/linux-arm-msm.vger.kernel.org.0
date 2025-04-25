Return-Path: <linux-arm-msm+bounces-55740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A12ADA9D19B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A25B7A1D53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EF721ABBD;
	Fri, 25 Apr 2025 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eaPxL6V7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B5B218EBD
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609526; cv=none; b=CNZvsUbP9bhZxgl+sMdOsDRrxeO0hEk5OiDCn6JahY1YGMV994qz9O38xr2HUfLV0by2Y+lz9WIQjDNHEAqMoWZcPBqhUFOUtoTJsxacMELrtsevnFA0PaxYuyG17Vf/Lxsdbb3XvdKxQ3wtowK64rSzfPafsdYyi60BMha8e2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609526; c=relaxed/simple;
	bh=cZYLFWcK+AS89wAOfGjXpAYwM+Shr97crXMQH84vsEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhgSMqowVeQu7Jqfx5/Xrh4hMim3SMLQeoCSZedsJjDP957j1x1J/ePNQStqvM7DaAwTIAef01ynP+vvXe4PNVjTySRan2B3g0Z+SGYPXQCLYG5C5Z1HKaBF9PW3hdyYOlzY6NsODyHiK0gesFaUKrc1t+q3334ty00bCOTzBYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eaPxL6V7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrYc011042
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KGuUzdqtIhx93PP1UIylBLxl
	AAkaFyJuQQ5Zgzaz5MM=; b=eaPxL6V7mSSc0vuu4BknBscaogTBxNnAb3CNmZI6
	Z+8MzdnD8UWOPaNeq7Bvic1r6/iBxd1MVHkkVWAp9/7MLqAdolLB085qSZSE4lOo
	rdlmcwg/TCFpkv88F2ABGBWLV6eF6aoINK1GATwzyEkX4HO69gtR2WDLPOKAwvap
	Fxz6ZCGrwSV7q4yx6GP2L8e2p5Uhp5XMw3WpBfIxlNIPrdqYBNyefrlHp03Z0Ypj
	0SLRpMS4x9MiE+zv6Hm6+5E0IPiP2HV+jruZ8NeOkfJfju4nppQU/EHL/MWviWlZ
	yU7+7xKFDcWbrvd9aVIgo9gLwwSeVWaW1rG6wxdSAi46rw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j948-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:32:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53e316734so425616685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745609522; x=1746214322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGuUzdqtIhx93PP1UIylBLxlAAkaFyJuQQ5Zgzaz5MM=;
        b=Bt9qhpccysDIo1WcBBq7L07uBOZeR0RyWEUmndcmjgh8bZqG8YTlSNPaADr6CpWixK
         Rpsml7Wpp6oOGNaYZjs3TUSLPN1rq62yTttJ5zreMtnvf2PvSH3gAHQIDU0DOzDZH7vi
         o63zEGLnzju3s5pPFINmVJcO6Je6FkbRHscnMfQ50AogC2FHeuvi7LdcHikc75rcK0GK
         /vH9QncptwtwsFrjN6sAlqwtKA0BFA2Ab1GbIED0GSFzMNlQ3Taplw5OUtQoBaeXlSWT
         K0Pi8unLDl6DIEKOQlkruKdb5DhRwJs2GbDA5vt8SCKzxHtOYinIyaycXmFf+ofpqPrY
         do4w==
X-Forwarded-Encrypted: i=1; AJvYcCWBo2lLF1HeRZeSt4BgtubMCHVFDeEB7OICe2x1lkDRmqY/4DKE/IOAV7dd60d7CRrE77RNHAT8vW5IeqQK@vger.kernel.org
X-Gm-Message-State: AOJu0YwFNE/BZ9ScACE63EBHM3QAfjdzSwFiuAPYMpBJA2ibTerYfwsq
	i8y2XFcZOjxG6GfRRUztGqRlCvUL/t53+KMD2YS7rHNyL7DDCptxxBJi51ixGUzCpAr/QLlsjJi
	sfg3wKPRYRKaoq9jS36UjnATUWDdGrD9zpWe+790236hUxJYGNlK+/Z5MzyPhl2ft
X-Gm-Gg: ASbGncsGAyss1DPPrsvIxeNDWh6hx6E8ZL+7nyxmHN6+bbIufXFs8dW4oLO4WNWpxf/
	o/ZdYqIlNfquB2RRCgGrlbQ0WOgUKvbuKD8qvL70LFHF1TQRd3zvcVH95tEYWbmyHCKZ2IInRok
	tbMdHXs6doNwhWIiDQyhn4se5ZTmrw0R/J/BHU/Y+l/WEmgFFn3ah07RCcseGSI5jJU27ckDSaW
	6HjHezKXrhlUFYYgOABDhKwj2h7K/au7n2AqHSD3U+oURzufHGho3iBHN1zsX93mdBtm3Z9wbnc
	3+9jnM72zFcyb6RD7bXSBNC72DYIEaq82mXblhHX0nPBSUewAhc20a6JcfGQ1h8rfsUYo1c5pKE
	=
X-Received: by 2002:a05:620a:4113:b0:7c5:48bc:8c77 with SMTP id af79cd13be357-7c9606b0aefmr440892385a.12.1745609522380;
        Fri, 25 Apr 2025 12:32:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzn/o6ObQ/xxhr7InTaJwrYRheiEdWShDWyF+W4eomGBtYByJsXx/Wd9e7WmCER8UrfAZSLQ==
X-Received: by 2002:a05:620a:4113:b0:7c5:48bc:8c77 with SMTP id af79cd13be357-7c9606b0aefmr440890285a.12.1745609522096;
        Fri, 25 Apr 2025 12:32:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a834bsm8773091fa.73.2025.04.25.12.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:32:01 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:31:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8550: add iris DT node
Message-ID: <hqltmh3pixqnimr4zp4brcy2hn3qpqkz4q6bhb3cga4w4ndtux@gft5cjqj47oy>
References: <20250424-topic-sm8x50-upstream-iris-8550-dt-v3-1-92f6b692bd52@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-topic-sm8x50-upstream-iris-8550-dt-v3-1-92f6b692bd52@linaro.org>
X-Proofpoint-GUID: 9jiOOyI9kiGXkwqFV7k5FkleNLjLGb7t
X-Proofpoint-ORIG-GUID: 9jiOOyI9kiGXkwqFV7k5FkleNLjLGb7t
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680be333 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=gEkYAqE2pGcBd09D3BMA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzOSBTYWx0ZWRfX2GvUwSa3z1Kf R0jkIR4VWUZ4HtQ2KVTjySg4tQfm7MZpf6kSvBLL3ZelSZknEWj8nkljyBWDA5TfJPF5NXRSAan r7lBBd2o44R2bwHxPcHnNNmyA4jQDriQLrGQxDAu/FmKCFSmEnj4EXPrxNxaraaHHkDiRJVzdBe
 gO71rgeLoE0Lq0w7QhajoiAvy4rQNWXkWOa95BN0iiIZRlSI+NHgtxEDxIH6/3hUX8oZvhU7W1+ PVfUtuM6PC15o3St87EVLQmh62Dyejm7nfVEjO6Rn0v3wI2qYg6iXQXBwZZCPtKL7EYuUtXi87J 5FsrkHs83X4XhkvJwkJdyy52o5uQajUjLscC5YzwxFtdIPUUWjAK+XuSnQUuLShoKAXhX3Dx+7t
 nZlUaVqliAE5izS0Vmn93ZDxksCzlbOi5g26GIvTN4JbIsKfen6ODQupwrej21tdQdbc4IBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250139

On Thu, Apr 24, 2025 at 06:34:28PM +0200, neil.armstrong@linaro.org wrote:
> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> Add DT entries for the sm8550 iris decoder.
> 
> Since the firmware is required to be signed, only enable
> on Qualcomm development boards where the firmware is
> publicly distributed.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v3:
> - remove useless firmware-name
> - Link to v2: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8550-dt-v2-1-9218636acbdd@linaro.org
> 
> Changes in v2:
> - Only enable on qcom dev boards
> - Link to v1: https://lore.kernel.org/r/20250407-topic-sm8x50-upstream-iris-8550-dt-v1-1-1f7ab3083f49@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts |  4 ++
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts |  4 ++
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts |  4 ++
>  arch/arm64/boot/dts/qcom/sm8550.dtsi    | 76 +++++++++++++++++++++++++++++++++
>  4 files changed, 88 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

