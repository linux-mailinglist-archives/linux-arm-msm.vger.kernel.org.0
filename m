Return-Path: <linux-arm-msm+bounces-45963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4B6A1A3A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A7393A433B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B3629B0;
	Thu, 23 Jan 2025 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j41tlNGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EBB20D4F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737633394; cv=none; b=ra1NYvEhkAcsNM9cbOhjBlcrBJPukek40SCw8GZa7ok5jKsCKWBJrK3sDIOYw1CXRGxmQVcr96sbTfyUlDWyzWDMLmruBt/8uyAElRgI/f1nswnDe20k/c0b10E84uGK+LTo26P+9u2w0bkiG3X890BOOvK7YSB+lxwGqwKFjiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737633394; c=relaxed/simple;
	bh=DTktLa7TL9WUA0tFp6kGCh2U/cBwUq1yyfKy900nlDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlJwDS0eKsUPuKb4PHcfl9mWC7/jp4U5QxGPzcaw9mgy9/DXvCIIbwgN8ku0Ymo4paX1qd7o0QlJq9xg8TFPgFhf9/WYFjZR0PSkRwhcycz2dj4KAVC6zoPYLn4MkP+T9wfYaTxCeNxsQMJyMi1pCRQ7RkrqSl0SuXgDbJQTWYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j41tlNGu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N4rgsQ023161
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wK52CJ5xMcCyEh8kOz79HAiB1+yVCvhzKxakmBYrVKM=; b=j41tlNGurZJVNRa/
	CinJNw9pNasYL20+P3f2So91KnbnB6hfDAVFqa2UKbpbOK0EL/yx+F4fT5OKO+HX
	2rluOsaL88abF148roOP8kPznaeGQc7tagSrxWkNwlpeWirP7dYBMseuemClMueb
	Gv52CjfZ0Pco8uVCdP3mFNGFuT36Xd29mRS8mPwuv9Ph7R+tiL+LYEtx03Qq+m8U
	l5F470egWW375mrU8N11kosDc1RDw75P3MqdtUFoHYH9R2E5JkXXVDvL1CsLYVD8
	4FlI92DYw9LX8y7lkDf1l0IQ0/Ik0hRAIl4HQawK16iI6oDio1Omkh3dcoKpfjRT
	fBVTYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bf518xyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:56:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7be6f7207cbso20538285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737633389; x=1738238189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wK52CJ5xMcCyEh8kOz79HAiB1+yVCvhzKxakmBYrVKM=;
        b=KWGX9DYf6dZ/m6VqXshwk5mqBxzMhj8aSGSzxUgI23qV2fLyOHrxTNiH96zC/dzjUC
         YBw953BN197oPsZ31GzR5XHDFxg8d+VJsUhrl9ozLM8fJECevtw6XWrcGSWw1kUpdd2+
         mswxp6f7J2kA50KuJrjzYapeTgXNqTkr41J6airKjE/tUkKrZ6SA7x6Md04/bi6VhMZ2
         KeZ7YZSLT0sltFub6UpMk4FSUCCIMtJdpymo6kfWUXaNp3TY4AV6n3175Ql43Ixedhts
         WTZPxJxISQmKvAftoLFrmkYAmZwnOxw6ngrZpTdtwzuWBMNnEoKPxDIxbyl5aq5SpJ3u
         5QUw==
X-Forwarded-Encrypted: i=1; AJvYcCUGWcnPUF+fe1+ZoVAgsE+2rFERPdCPP43cfANRFg2JLcfhSwcBukDonb+xy3z0khopUyLudIjgJgwxWLtl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4dl6od0FXJVwrKKWZt3gJSToefRuWOWiY32K6lyHZChOvcHk
	dTI85j11ZzkxQhdg63IXOAqKf5APSbl09rxXqpxZfb5F2pLd69WmnOLaXtpublLjs3Oe0taGO1h
	Hvr6j1URS4gBWBlFW1ihMoh7I7Tcq6vWv7ZXRMmg6mLrpZ+7p77Coo0KJ+FdbH+rF
X-Gm-Gg: ASbGnct1K+drgGNbrRsqY+XStJfPGiHrJlXX47wsW63uF1XgSQpu8XVQwpQKYgbNpxQ
	ZseVZ1PaOAlp1BKvof/toFSF2PB5ARZNKhFeDSMxXb/CD5mP5lO++T4Foe9doIi4WfeMko5yrEB
	F7eqKOOoNuPDgG/FqL8UcgTN4MeRNjD8zapoJpeMTsR+aTRVRVdh0rnGwQYMK+ThDQK/BygE1RV
	hRiqn9/+tP8trlijaMp2oGNKzQQkM9LKu0RA2OeTnclwWIj6kZ046Sl7KTBwHTH78D71b2gpiUq
	qSHTWMB8Jmzp12DZ2sOJyFJDSheXWDJ2nC9SZdTsUHiaxaLd
X-Received: by 2002:a05:622a:180c:b0:46a:3176:f78a with SMTP id d75a77b69052e-46e4e82db16mr35126341cf.12.1737633389452;
        Thu, 23 Jan 2025 03:56:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnpU3RQvTf+6lCN/6m8zq31Iwk0OGAy2jekUXHqBAhUw6zOKHXw29Y0WJlVVNJW46AY6Yz6w==
X-Received: by 2002:a05:622a:180c:b0:46a:3176:f78a with SMTP id d75a77b69052e-46e4e82db16mr35126131cf.12.1737633389065;
        Thu, 23 Jan 2025 03:56:29 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f22542sm1057406866b.108.2025.01.23.03.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 03:56:28 -0800 (PST)
Message-ID: <fca8e1e5-3b3a-4a5d-8996-4329cebb8649@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 12:56:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: Add industrial mezzanine support for
 qcs6490-rb3gen2
To: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>, kernel@quicinc.com,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, quic_akdwived@quicinc.com,
        quic_uchheda@quicinc.com
Cc: Sahil Chandna <quic_chandna@quicinc.com>
References: <20250122101424.1810844-1-quic_nkumarsi@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250122101424.1810844-1-quic_nkumarsi@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hwPT9mE9qTBfenjOxblvGRZSOBJRri7f
X-Proofpoint-GUID: hwPT9mE9qTBfenjOxblvGRZSOBJRri7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230091

On 22.01.2025 11:14 AM, Nirmesh Kumar Singh wrote:
> Add DTS support for Qualcomm qcs6490-rb3gen2 industrial mezzanine board.
> 
> Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> 
> ---

[...]

> +&spi11 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	st33htpm0: tpm@0 {
> +		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
> +		reg = <0>;
> +		spi-max-frequency = <20000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tpm_spi_reset>;

Apart from Dmitry's comments, please keep pinctrl-n above pinctrl-names
for style uniformity

Konrad

