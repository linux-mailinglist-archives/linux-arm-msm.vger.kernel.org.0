Return-Path: <linux-arm-msm+bounces-58075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEBFAB8ACC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BDF57B5AF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB567218593;
	Thu, 15 May 2025 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRTIPliF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD002165F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323307; cv=none; b=fHcqvDBhk3miC+Jk9XHHheAwlgHYRJPJUz5Y0eBUj0/aGjqgMPghoCQj4DSandIYlOkkyLZ1nhecKsDPtdDsb9yF4mAzX7KbXbSOvkWBs6Ztej0cUzmuXJ1cDIE41RSTHvs24POFoPz9NdcS7HsxDqrBpfuG0JjZ3+03DnuCo3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323307; c=relaxed/simple;
	bh=PiE+MH1cFiOpy6aub2DtWFiJcuOCWUKrQxaljJ2s49Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbXyamnvTmO6kU+GDLBdUCIJHWizA743wbyP3ej1oFxN9z1kZCaooIGW7VX9Lsynn101BcfuxDdVxnsAsVrEgh80Y22prrLjq70gyhRzlhXD5CbrTRPIrZGvEU/hE2UhQqAbVZcdEt13pnTVsQlwmSJif94O8T3rXT0Vc9/MN00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRTIPliF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFLqt021044
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yB/XQGZjAJwAICW4F7u+rn/T60dhMBEFnCYzfHzDX4=; b=QRTIPliFhSzpIgiw
	pgvEdtyT0EHBMG7dH+tDDmMdDHsD7n4u/QzeFYejwXxcFPo25g7APjxPWgYMfwCe
	LXMFPkqPDjvLT1c3Y9hjWfkheeOFDJ2Wp5OzhSu5EY/fNKkkBM+sW+V7AtKEc2L0
	yI0gouRmgTL1xl/owD9FEWLEfdBQdk9SUhhUidAnhRtqIiW0bgNQD0zx5m1guU7g
	bzGP5cljNX2dwsphn7r9OgWRYReL5jbNXqgYHubaGd9gkJF5vlkOD4RHWXUpI+Hw
	uPZ2VobrBtFCjJ4Jf9I9wlmJbaGXAX/zVzRV8UKKkwZKB7LU3jhrtd/FdvTdfXfs
	An03yw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew6jqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:35:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f539358795so767516d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323304; x=1747928104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yB/XQGZjAJwAICW4F7u+rn/T60dhMBEFnCYzfHzDX4=;
        b=C5Y6eVisxF252n3lQo8oR7UOlfrUBccCLFmuC2/g1xH9KbYn72pPbdwy+go77I0xVW
         w8nt01Nwoc1VDjcEHy0bQCvSPjuvbCJobH07M7fgX3UHGuPOB1XHyayrEhRa0FjEN4we
         +vvAg7Ho9WmrXVH8ZoZfj3otWUIGtJB9SsmQjXIZUU6o+T7zBvsr/IKYqFl52uZfAN7H
         ilS/BQMG4/BYas2aS78PesMremOfphKeXLsJrRGz7zBXvC4gBac0J98lAUKk1zWFAIlC
         W/gZ8/jyyvokYcSKskHHSndaPxTdd5QaE5YSySI84pMM2+udnN/uyfqyt1xImuROKUhF
         Aisg==
X-Forwarded-Encrypted: i=1; AJvYcCWTUU9pI4eEHjwyInIaeJ5pqqXciLfuafhPVPwBGH2m+4M0jMdPLUGL8q+epb6JV9pR8RYs8uYeOr4qpow9@vger.kernel.org
X-Gm-Message-State: AOJu0YyzYEGdekvUXmlHVo5jV2sToKTNaKmMEVJcrGoEUvj65nm1c5C4
	3GV4w6fuLbZ41Q9G7PGI9jXyQasPuORh7tJ/4AjuR4ISGgT9x0YSkQ5FeZtvtFjbu0skJj1tAZc
	aRWM7eE4VWCEXCZPwZfxMoh5m+HIlD+HL4c7eyEXeL7E3gMR7jBQParqmIbRjOBEPYrhS
X-Gm-Gg: ASbGncv9+vOB0iBQNtS0RNMLAPq7G9oP/H5w6iZB5BhDAlV6y4Gf4Y5s3SSjMt2Jrgz
	BqVntTsgPg9Sc8TTeQsJueBn0zh8JP10oJC7hsXS05fWeeqLWCrD6uQrlrgvnbeMtSKR2d68pD2
	z6xz1C+5Su78h6ETLymKzg+ZvstBmA+Jhel5LawkGUcv6fOF/vgijUt1AoveGhP8PvKwdV2M6Wl
	pDbTpm43R02g6OBvUTawqPgQX/8P38tUZbrOdKGBkyFmps5+IV3TXIIBwE+CYeaSNZQxhPV7hCB
	WRVtTMNXPbl3h80b83uB5nRFrwLwLWwwd5hRgPBdkgaJQFf68Ula9wojsPEG++uG4A==
X-Received: by 2002:a05:6214:2403:b0:6f6:e6d1:40d8 with SMTP id 6a1803df08f44-6f8b08c7856mr1053706d6.11.1747323304322;
        Thu, 15 May 2025 08:35:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5GtBANepnczey5ulcTX+FlLpeblm1J2dmWkv5sgN3i5CFmiKb8SQIzrnodlg/LcQE6qf1Ww==
X-Received: by 2002:a05:6214:2403:b0:6f6:e6d1:40d8 with SMTP id 6a1803df08f44-6f8b08c7856mr1053466d6.11.1747323303917;
        Thu, 15 May 2025 08:35:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e637dsm6880a12.43.2025.05.15.08.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:35:03 -0700 (PDT)
Message-ID: <2a49a457-9b6a-481b-9b04-c9747ac67003@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:35:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/18] arm64: dts: qcom: sm8550: Additionally manage
 MXC power domain in camcc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OP4Q2sePwrnR8D42grxOT1_7QDbZfsip
X-Proofpoint-ORIG-GUID: OP4Q2sePwrnR8D42grxOT1_7QDbZfsip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NCBTYWx0ZWRfXw97VHyHlpdi/
 +Fj7Wqb/NwaO3H4k72Nx5nSBFR1P54MCK0o2Vi+32VLUwEGAroGjDSgDBdfISollmdmILuQtDVU
 iVQd9ur9rTLINyy4FvrV7/6AaQ1AvJq3Mj4Y8PM50C5VodCjA6ikX2oIQAXeMEkRwvrp5LuFWML
 fgjHFh9boAL5MCNUc+a5gAkcjptEx91YP3+d5TuOvfDrSQhJwBg7rp21SsY5bnr62zdP18mrfNa
 0ZMkUhy4NNVzMXr6MEkG5snkDzZuhPCdYTz1Q+HvxqMkK7oK9LT/nPoXBbm85+BYITkiGYP67w0
 h/Zih1cKujRjzgWaUx2rJxEJ9TF3Zl9LArYnT+UtgdPsQqTIznJXUXLcSX44ciR/OY17qrMDL9s
 Lv+7Ou689pzHe3AVlRw+NSXS60Rn15ndcyfKyqUpYyfz4TAoUADpPTVFealRV4Q0ZLG62LH2
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=682609a9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=9YvV8F1douotiZniFPIA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=629 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150154

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8550 platform. Hence add MXC power domain to
> camcc node on SM8550. While at it, update SM8550_MMCX macro to RPMHPD_MMCX
> to align towards common macros.
> 
> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

