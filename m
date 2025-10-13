Return-Path: <linux-arm-msm+bounces-76942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A1BD1F97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 770853AE121
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F492EF65C;
	Mon, 13 Oct 2025 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XR+o92d6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFFB2ECEAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760343376; cv=none; b=obhk5i0bfohlGtpYQ2xKg5HMcO1dfa6V8sR7ZXhr8pNqrc+v0Co1OOB1iulizH3unmAQo3ZGVQj80oPvdAqORv83CbeORXFPQe9KEJEw5Qccto1bJhyz2aXHr53GVTv+CaNSUTSKNIr9cosYsjQabJQ/cbIFxgQTb8IdH/EekVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760343376; c=relaxed/simple;
	bh=OJlBTsvSxOkcP4IulZUo7W/MD7FWB0v5P1QHZlWLCWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOJrwwg90BO4mCAoVbfSEphrTDlKX967ZwWibBQGZ4NB88JW5qZPG6lKp2eTyAM9Keqr07fiJbCPsjNx6mQlY5OzEXoDpnTeb4ImOHspfg5rj+Cv1vEojZXxBWbFAWIsU4z85e0n7UH+yXfTohwBQq03lZ/Qmu5HsEGw7VAF2PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XR+o92d6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nKDg023103
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dtZY/OAN7u0qy7UYIqN06nPgBQTWNhTlY/8haez5SFI=; b=XR+o92d6O2c5jooo
	Z0uAfvPh5+/D7nD43WK8uAyuhQ1zPFHFD5MrBs9+Ino75mhwE2Q5xYFp2DwXhqaf
	0vmYIi7qsUb4XF4WmR8LjfXfd6L+aG/Of0JPB6QNvREf4KqUwjbfI1sFB1SJL38s
	tv2jMN0PxrxNlVXNuZI8I4iDE2B4TfuVcPJR1cJVicKJqVrTkPrC44t0wMZR0x69
	blIeqgKoMuvu6cZ4L6vrFut0XgvHtQf0ShP5+siWpS8UmuvRCfyNMmfOmGNyvYo7
	qPGDOCRFsntFubsrg0fvIGuBdcP4kGrsAaIZ1gGHDUnmzFE0LVbRZTqzEomX4FUM
	nlu/Yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfupdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:16:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-860fe46b4easo246712785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760343373; x=1760948173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtZY/OAN7u0qy7UYIqN06nPgBQTWNhTlY/8haez5SFI=;
        b=rWywmAd94LZ+DSGMPkruytkmrEDl4vUY3zloMDBARWbZnRkC+ysaGK30WkfdgS0ieg
         mX/aE/LfTs07lYKEOyQyX5mg968LEq7ETVaoY7MjGoT9Ls95r2T48F5U7m3//0FG6pf+
         l5d9x2D1ZBQKKGEBJRhrWSeK1j2fljzF03GoEVEpHKR0eUuI14wNk1BcgxM4MMHGPG9q
         0g6a9Nt7I/FH7MeEgvl0Nk0rCpFm2KXQPrZ51rxBOXyJdBVIGRoERMLNepeE2ywdUf1r
         Eib3L0H+PrU1l6ZyGrlFsnnIBPah979HSLxin/Hlde3RHbkotz+vsrUBzpDjOXBoAwOX
         Mp3Q==
X-Gm-Message-State: AOJu0YwgxukEu7PNVO0NOc2qImT5sk4kBieHfTE+EicLfQUmy+gS+y/U
	yNnmj0Usy1EfxObk8XV1Ig1LBYjoQ6YxvOr07CIrjbDJi9UOPSmEQ49W5sJZ51iGPAbNZJxqkUi
	yY1HftHZvs2fdHv7taZg81OdtKrjX+x5NFjBpUVqxDTyvfkgbf0pw46sZ35lBRNr7btKK
X-Gm-Gg: ASbGnctcl3L8UbtjzF9ow4Kgdl7+q23+CDqMuTG2y5YYPXQahPcJRX4YiowzpLv08fS
	rh2ExqApFZACzVsPsYZz/RzOZPufpQ8xUzZDWUMMSg409y3ZYcnGY9wVP+IqpLL2oU7YfZOOYiU
	1N1Ukj7ONjO9g32eBVX5j5OvFy71B+96B59BwAsXx8k80qKxELn5binJjwiGIqWuWwun9Kn722G
	3sgmo61CbKL/w/TsiFwm8m+sloXXXrlADA1gePkYc34Or014tADwoOtRNt0MlIbZEOLsIBm69R8
	SWDPaNIjKdPRUavJeoZHXRdJud56+bX7Js3+b5qKfG6XnpOgyXAdIIgsEQEdFOGI8ofrJbxnCjl
	7QXEF6WOCXQ/tBIVRZUn3KA==
X-Received: by 2002:a05:620a:f05:b0:864:1d18:499b with SMTP id af79cd13be357-883527b50e5mr1874644485a.5.1760343372876;
        Mon, 13 Oct 2025 01:16:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOrHcqxp2/qm6jjWC7xwfUjcVZZpvm7/3rrvDLAl8BX/cMX7CbtLqrEuXtw/C2eVcHparQDA==
X-Received: by 2002:a05:620a:f05:b0:864:1d18:499b with SMTP id af79cd13be357-883527b50e5mr1874643185a.5.1760343372405;
        Mon, 13 Oct 2025 01:16:12 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d61ccb09sm843421266b.19.2025.10.13.01.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 01:16:11 -0700 (PDT)
Message-ID: <d7d8bee0-db62-4ed3-a418-506887d54810@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 10:16:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1-dell-thena: remove dp data-lanes
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012224909.14988-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251012224909.14988-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX47K3jMbfHgVu
 grgdcrWHytcvmJnyHeMBere5Fkwfslhl15h8ZPSBFwczTkWwj8yN1jeE8Wni1+IWLL8o2ln61jR
 r5HpggIppNyNlCjJZB5I2F3s/LPRgUMhp6Xx6RVrwWQYKmeWA2DRu7ZuDYba/sSw+CrsZpYIGot
 oiLJyI5d4cMDo/ltaNjYYD4R5Rlsc4t1zEooRWe3uIElsCrGInmiOb4Eqo62jUC55tRdSMOXhK/
 HJpvJMA2MtYpX86GRClr1+b/oa8ZAEStTCvFymi2FUy3DdwAq2nSnmFKwxn1ZhHhVFqe0Mv9Wqj
 c0ySkbFE2ym3/dYrdx4d37ga/NIm5QF4x+c12KTf8+MO/7dq9nPehU8kySXYz7oTHJWIlfT6XS4
 jYg+OG7BuA3vPpFNqL44BEqDjV72NA==
X-Proofpoint-GUID: pW4LOSwD7cXNpKvHV1W0LKd5BPc15z5M
X-Proofpoint-ORIG-GUID: pW4LOSwD7cXNpKvHV1W0LKd5BPc15z5M
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ecb54e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=vs_YNVWh7-Gz6y0r928A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On 10/13/25 12:48 AM, Val Packett wrote:
> The commit 458de584248a ("arm64: dts: qcom: x1e80100: move dp0/1/2
> data-lanes to SoC dtsi") has landed before this file was added, so
> the data-lanes lines here remained.
> 
> Remove them to enable 4-lane DP on the X1E Dell Inspiron/Latitude.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Val Packett <val@packett.cool>
> ---

The commit message could say "enable 4-lane DP" instead, but
it's okay

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

