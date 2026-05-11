Return-Path: <linux-arm-msm+bounces-106902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PxsCz6+AWpqjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:32:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 934DD50CC5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E0FD305A285
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C6C373BF3;
	Mon, 11 May 2026 11:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmWIukNY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRpfVqSy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8240372ED0
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499000; cv=none; b=GglIIq6zO21VSF79bUg0YurABTySqDPFJIJRya6wlwIHiSBOCcUZvlZ+Zq2zn7Zxvj/eYoW2HBIHzpb+J6maB3Zxn9Tfv7Ra8sszeOCMlAQALoy+gPqY8lN1XTTIidvhWyF8XYjnWGEuZX+NggQjJW1BtQxl5cSfATRetfcv14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499000; c=relaxed/simple;
	bh=8xGv9bUKTHf/ZB7Ao/E/sq5w6bskwcGpeSkW4mzz4Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFlAz6nZnolyC+Il91IQ64er4Q0hcUZxQnctLWsEW78huflY7yVI40zyM0GIfqgEeF0nHQD95JzNdGcS2SgkL3Abudhgbl+/9ZX9Wqz17ggJc+MzeOWFfkjUrf4/nh7YNrbqgEOGvZfwZiTzdqjZymAxd91tTU+ZErODnPJZyN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmWIukNY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRpfVqSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8I7rX1850699
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	54Qf1gEPNGHjmFmXmXwQUZrhQwDWCIR6PrV8xkmilpI=; b=bmWIukNYsoGByNKh
	gJ4IZVCWKYIG5JF0W6IBSHTElBRcA1eKfuP4nFa0QV+SpFI9Ngq3aHhGb2esmHcI
	/h6bMpDWf0dB83KUoYKypCKLIJPYs8E1RyjokCH8yPnoT+alRv14l7tVhLWB7dIl
	2CsaahDM547mqSksddxYdMkb96eHBGQntIPBc7mnqkr9CxoxyVdlfAM+CPnYP1zJ
	FR3YpNtUMb+y78cLZsNuBM9/gbb9OZHl5Rweam5Bx+UNZ4/Y8JtrvlHNZ4gD596b
	yfaguNig7DQYs8GKpRMxMAIPXhU5l3bfSI0ZzUoJgFO/V3Qkp360JS21qqs8Tpxi
	zlo3IA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3bfvgp8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:29:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e576143baso10832101cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 04:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778498997; x=1779103797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54Qf1gEPNGHjmFmXmXwQUZrhQwDWCIR6PrV8xkmilpI=;
        b=XRpfVqSyUAfHYo0ZH/W67GYbVThDZIprP1PBZjOwkIFRmt0cwZJIslBaAW5Gc+FFNa
         SfBYkwATC1kHdVnQMSn7dtnGmaGZb45q/b3Cv0qECV724LmNzotU9GKNusSTd2daEfuV
         Gqj0NoEzstiojS3AXNrRQVf4jgRSGjtiWScpt2zNKvByGq+/xTKWbqg+RK6zqOanL06D
         JriplDvHEgsLCB0ElPgRn/CHSF/xtDa62+yph+p+4NtbZchXloU6A/O3yqSyKm/OvkDj
         MX5buNbazD9ONQuT139hwT5CfwW3V18SueTZhHpfHkR8d8SWHdOuD4sGQbBrGx0C8naI
         5pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778498997; x=1779103797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54Qf1gEPNGHjmFmXmXwQUZrhQwDWCIR6PrV8xkmilpI=;
        b=cgaU8TWxXKF+Neg02aYIdyA+vHnoR2kcrChWh1mWJxKP9Th2plJejszVQ8XZdMyUVU
         R314Xz7hNbKG9FWVT4NPl4geXA10OcDqYHjX7vltK6zqmbHivpflfwdpJaD35OQw/q3E
         iv3QDrVryXrvJX1z1Pmw7lUsKl/Nf9h4Nj1RPLParwnqj2yFrIa5CnsLOLenoHV8XFRI
         okRD0pL9nDLmK0caZ+XYSh9xEN731hmg+bhha2lVct1zME0EWRlSgJXne41g6PFAsjlf
         bIaBRkfq/Q6KPSu/lUSNEMtJAknlMfahcSiymKyMlIyllcRltDW6jkK+M0mu+mCX60IS
         nYyQ==
X-Gm-Message-State: AOJu0YwCMUvGODctXaYjXjAlBYdnx4iRicDtyYgPbYbBm118/Ri9LZTq
	Jkc6PW1c0bJ1n1O5zRz1JSkHcBGUqveAbuyJBxLit3fFW98jgsRt7/fkOsAlugUJXVJuPxGkQ6b
	ddBTKqckrL7mL6NUYBfmoMRka0O42YSdx6qqfFkQlAkRwmmsgLLyp9YmNxxEr5XFZNE7s
X-Gm-Gg: Acq92OFe4uR74eMA2clAPGy9Dav6AoCeBGsUnJ82RsswKtfmITsS1lqg0Z4a/fJe3/K
	nd3qyn6jl+hCqM0pZa46+fNOKDuzjEk6aB6NhBFq0B1dFvYFQty7FC/F4S2eyAN39mUBIA+hX3y
	T8FgGaceD1OKjs0eYFVkl+HLJaEM7A25YzocbtAu0E2G5Lh7Uq5AtthbBobV4SzSPhVM9VXdyjB
	wCsoaz47OQm99s2NJKxNrPr+7Zm447aJVFvP0bEDBWRfpx+wXYgGN1ENRmdOsw4DwQh4E9Vw/0T
	iKXx7f2Mr9CY/reqDwFuJAIKCUK4DAM09vN5UA0Zad+8cAh68ZN5P/x9CSpixY0iCT3fHZSZqAn
	HohuKXyB34HS/2GjSObwlfKPKvY/UL2T0fMT7UCw1FJahuXEOpGg2yY2NNDlu8uTN7DgiKsKDnv
	WgI1s=
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr231374141cf.0.1778498997098;
        Mon, 11 May 2026 04:29:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1811:b0:509:219f:8e34 with SMTP id d75a77b69052e-514622f5065mr231373951cf.0.1778498996632;
        Mon, 11 May 2026 04:29:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1c2f9sm3593976a12.28.2026.05.11.04.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 04:29:55 -0700 (PDT)
Message-ID: <d63e251d-439a-4514-8b39-cc93b056bafe@oss.qualcomm.com>
Date: Mon, 11 May 2026 13:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Move PHY, PERST, and Wake
 GPIOs to PCIe port nodes
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-8280-move-perst-wake-v1-1-5b33cef2d807@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-8280-move-perst-wake-v1-1-5b33cef2d807@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fa4HAp+6 c=1 sm=1 tr=0 ts=6a01bdb6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=uuc0Ltyocxd8-3Z4bL0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: l8mGgG3RBrqxgPxcNdXOFnOtjE-eZsa2
X-Proofpoint-ORIG-GUID: l8mGgG3RBrqxgPxcNdXOFnOtjE-eZsa2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyNyBTYWx0ZWRfX5f14AoyHRBme
 HZ0JVCuy4QehqQwDAtP3QUKedEKdrd1IJ0W55kpAglAsinZ+/rDQa17BPOsnyME6oI8ES7V/c/2
 4HeDb0jW+0M8kKNeBpGA9WA/sUnhsyFs2gj6IdjxyAVZIiWNuDYqShzdIogqIXVqgNwHM2iBdWT
 0nErTA4638dDigwYxV5eN+NxKzQUOzANJAFtFhuPAoduZA8DO3PHQIjrDWhksiE5OOd56cqZ7n5
 mUsHQZyguQtl3x82Nq5YjlUKs0B2aa6Wiqt3kv/j3Ykt8vxwoqcEc8nQpZfRwSJ6sRhGOrhILg4
 i8fLHWvfugHkaR5q9O01cn2PGIEx5LnWR1kFLDoqd5PhEP3A9IQuyHRoh6hunP3KmLRuYaV5Q6S
 TozROVo1H92IgtLOaWbeEhewN5zJC66Gbaw6kn8lpPh+z9ewnv2DHs0Z1DYiFvWJgi0leaUcPBZ
 re6a60p/0Fjd6/JIu6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110127
X-Rspamd-Queue-Id: 934DD50CC5D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106902-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 4:16 PM, Xilin Wu wrote:
> Since describing the PCIe PHY directly under the RC node is now
> deprecated, move the references to the respective PCIe port nodes.
> 
> And also move the PCIe PERST and wake GPIOs from the controller nodes to
> the corresponding PCIe port nodes on sc8280xp-based platforms:
> 
>  - sa8295p-adp
>  - sa8540p-ride
>  - sc8280xp-crd
>  - sc8280xp-huawei-gaokun3
>  - sc8280xp-lenovo-thinkpad-x13s
>  - sc8280xp-microsoft-arcata
>  - sc8280xp-microsoft-blackrock
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

