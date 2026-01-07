Return-Path: <linux-arm-msm+bounces-87909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 253DECFE1BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 14:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2886310A4BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 13:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4179B32A3D8;
	Wed,  7 Jan 2026 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWviJchN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReiK0p8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B3A32B990
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793657; cv=none; b=AD6rpoWNbWIvbjeJ3BfUhfgbZr8PCgKl5MCbDBg9EXpc0JLbTtKH8tzvzt/EJQEysXCfCAWJgcXBTxAflCiDPpfvyYrZRgX8sZAATLYVI5AJUW3O2Dt6c3bbNjxVbl/fuZPfRD70hT0E6CyG9D9J9XGVFPTOBf8UWHbsNIr0+iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793657; c=relaxed/simple;
	bh=VGE45WNxQDTO014blHHjIi5tZVWuHW3PG7dXHce6NLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2NbGSj9ieSIJo9rLhZzI4v+sit98pJk0GeQcw/M7S5hYqBwUgvuW/9jia0DMl8F6Nx5hl6nSq7CtI4dwEeKqkU4IFpXOaYlRUa6hkB51FjsyU6TVz2bPLZtySJcdos2vBHc9uSdPZEA8OyC2oqoOza4IA+ZQmHursj1Xt7qqP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWviJchN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReiK0p8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607CsSX42239464
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 13:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgZSlnstuL+bWNOM3fLTFdzNQEvh4E0HKjNHVKtgJqc=; b=lWviJchNA/PsdJa2
	68HBFGAAEZATXJ31rW+2RG6l43QqyyRaxzF684XJltEXQSM/ozKObb9cw4aBVQpH
	aWTUCpkY7u9lVShSCiU8NyIbZtzl+Kb5NljkVbDKlx3x6xLL3ZME8NFKgL2XZNHz
	XWqL3dpqT74RhVzHVCJyvzBDMRPw2zZhrXr1qGLIPo04Htpt+kHmU7pzXK121ySt
	46ymjU6S0c79H1QjB4Qn33d/6CC1z1vlTugIxOV6l9O+WuApMaVjuEbkYi1VJN2d
	sLswJmRgRDpritd/ExnaDdVPkFVGh3WOHJxQD42tNFMuka43qg7ikNffbNf8XaD6
	YpCB/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg04xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 13:47:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee05927208so6354801cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 05:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767793652; x=1768398452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UgZSlnstuL+bWNOM3fLTFdzNQEvh4E0HKjNHVKtgJqc=;
        b=ReiK0p8rv6lbD4R1+H4CcSbkWKoBEZEQNOz7h5ZTQiuh41UBCPzS9p1/KiRx/nEar3
         KMwiGmXLRR5AC18mK8Osi3xUwh1sQkzaDYt5gmiHzb8MHg9lha0O+5uzRpaB8so5X8IZ
         XuLcD+UBFYXE96gjcxccFSkBd3Bd4m0t+Jd0mf/O+Um8w7lggIueVoOzug30GnCu4yfq
         XAWg7rIhP6sD1FFzau/xX9CIIr45q7SHRVyJ3nMsaYzq6CwjilW6TWIPwuTJY203MJth
         Tvw5aDOnNcOiLNYU50rjkwlTyQt0jcMNRJjMwPe6uWUj5IXKFQpKOb0Pi+AcDg+QtHQB
         9Obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793652; x=1768398452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgZSlnstuL+bWNOM3fLTFdzNQEvh4E0HKjNHVKtgJqc=;
        b=cKrb27nkjD8hAO+VXu4DtFX8v9PeA4Jpbxpy+dAAWOTYiqli38g3O3bsrnIqn1xdxe
         fboFjn35uM7NyBeCvvaEhUXMfQDKDXYqnNQ4dBXR7U0h3twns60So5uE9LHjXQjEIbpr
         smSNDXwnwktDOhXKYLadv/ueYQuA345eIFlCPbbAyDmsuHqdAX+JMd0uMOV2t8JcE00+
         C2CpVXN2z3LcmsFz6/0nf70QxyL8l8/E+jkOhIvgx8agj/Z/9svEJJ+aU+XPLQvuf1rF
         /qOewgIraeAlEBQF2nG0QSthHE4WwMl1ZIpF6JiNNPIEjF0aPlzcs00jarfExyQBKVkE
         vvFg==
X-Forwarded-Encrypted: i=1; AJvYcCXPFVI3z8MSoOAr4d5erbBJAJGywtREwQCXeeqOURs53X/EA8CLDL+vVeSvrpe+qDyY9IkfwcUiMQDl05jo@vger.kernel.org
X-Gm-Message-State: AOJu0YxbzWMKqvPmDZX+bUU7qF9Vrel5L2BnFarUj2tnbvimielr/sp7
	qhp8kiPttGOKL8GMEEh+4VtkKucca2ukXUbS0dJD4I2XQAFwgjAbpJgmA5C7GVhasV4nJ+Erqm2
	BVbA8LyTZIm0jJsDCDuWdb9UWKGAj1FyACtojPEqL7EJXVZ3tGWzg70qzkT2JRlmORjMc
X-Gm-Gg: AY/fxX7820DP4mZFh8lhUQqBKHm0Iw4g0bChBzf3hVXcE5JyIGWNNkpcH8HUH1XiE9Y
	j/vB468gJFPzKMLxa4BjDAv2FDdHCiIS+9+W/W+dsL9OslVi4Qf20A8r5gEtQ2h7a+fwTKDKGFL
	G+PFmcqOBaLNiRyxD+My1feKw46luePMAHh6bvWefV5PdQymxST8ur8HyX/kiSElIsE7WX/Bq+v
	ctotiVmbz9z4MDfQNZELLpQGyPQ3Cm+cOyUvfcKy0eh3M12kswUCXfHn6BD+pzRgy1L0koJFM9A
	uJIrnWWc2uB1wHkpMqikRP00PL629Fxtb9c1xSfwW+TxAv2RmkGHgFyL6RFV4OWfJJEh9+lA8JZ
	EGYvGSz03rKvgImlJJovfezlvKrK8bbF2EryLXQELdvp7HwBPfBVevHxi4Z0lrV3XYik=
X-Received: by 2002:a05:622a:143:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4ffb49a0042mr24372121cf.6.1767793652371;
        Wed, 07 Jan 2026 05:47:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqSd85JPwhEJMYgx6YhAsjKJYD9xSuGfuAYyKuY5Za86pnaJzUy8cquRaa93zxCj87b0H2UA==
X-Received: by 2002:a05:622a:143:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4ffb49a0042mr24371741cf.6.1767793651855;
        Wed, 07 Jan 2026 05:47:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5e0sm4665696a12.31.2026.01.07.05.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:47:31 -0800 (PST)
Message-ID: <0b27c56c-3aac-4b26-80f5-f8cc52abb66d@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 14:47:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] phy: qcom-qmp-ufs: Add Milos support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-4-6982ab20d0ac@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-milos-ufs-v1-4-6982ab20d0ac@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zh1qv3sFaWjJ8Yud7RNkits5MqghPRlN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwMyBTYWx0ZWRfX/HPTAIaDsFDt
 KLUmPGASQxpkKFLyK+N2q6L7KYJNskced5qaH7H8+g+Dejhnw17R/2oO3xGs4CCt9O8PLeYGlcd
 vevmvCCJ4su+wuvCMEDe9OFwHyV2wfqKkJTHJV05r9irsZqPl4UWMGJwjr7gL6LUjZ50AfKr8hn
 JAttRv61xFGwKdWDMwLcvTxyj3fbiad+2mKz4I4od+YphqoI9D3oLMF2V027CB3r3ZU991UBLH2
 FN8eZpT/kLNBrL/he9TE7iRY0otoPNdRRUiqgLKZRaS5QM/9n4BASiXWb1Tslo5HIQ9CUPvltMs
 iSk55bASsm/2KLequy8NzEON1MAlDbzRBzPAUg+iPNSsDom1m6zfDH5IdfyQKe7tEu7f5V425bG
 fiuY/sqHAlTzJv9RLeRzaj9z7dPu6ypuh0F0btcaQ9rjRQs1Nea8nJpAQVPHJ8L6hv+3uOaskkv
 o8g1An6rvi030DtspuQ==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695e63f4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=RTUAgidmgk2qeza8I2cA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Zh1qv3sFaWjJ8Yud7RNkits5MqghPRlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070103

On 1/7/26 9:05 AM, Luca Weiss wrote:
> Add the init sequence tables and config for the UFS QMP phy found in the
> Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Matches the latest hw team recommendations!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


