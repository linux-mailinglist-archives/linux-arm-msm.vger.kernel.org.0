Return-Path: <linux-arm-msm+bounces-72276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 686CAB45738
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98D5F7A1E5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBD734AAF2;
	Fri,  5 Sep 2025 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+az5kPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958A534A323
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073972; cv=none; b=tYgUjFpxABPSezn7lJf1xMMMh5eFsWTeWnUQMXotR9+XtRrN1k0uJoasyclkYT4egpxb9nFxxmd1rNmd2Qrsqs36VmaGI8oE0oUP9NBRP9VWPRs7dDlTkjzoxKo4aIQNCBm19p8l7XSH6UR8tFIx/WV0rWgOgjccWX3oK3gYXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073972; c=relaxed/simple;
	bh=ldlxiteVjgDeP8xEo3N2AmqNAbePsfuqyTzaH+6MAcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nj3toRqIp3oI53YflODPgeCgOBX54EMMMJ6IJcQ9ovRJU0p3UHM4PapqoqaoT0f/C03VMapm2CrjIGqvniAw5hjZ57bNepXr3GG64YRWbVc2IxE4yndKubGmSWv1z7wjzC7thSdAaSNMzHYYJJbyz3bezrNsMxwFAraEGC/Zi4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+az5kPI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856s3pj013642
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 12:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIUWCEcqZtXBeXsUMytwaz17zqmex3UoROOIhHg+zWE=; b=g+az5kPI9X9pasaF
	y1g7Irqn9G/L3wLDcrG63AV1iuDyN+JhWgRrtSfkhZiT2mlDD0PTQ6TQxbFi7DKD
	n5xCwc6vd5QRrdgaX3bcYJzUc0+lNd98YxzUQKkHDzTSYxvJflEAeTE7WBMRb/nq
	FOwMtQTPsxCBQCohxjSlWQa7R4qSbJdRRpu+Y+IYBt1+KhQvu8vLD5T5XN0r2ckJ
	QfirlxHrePqRSDKVfzhFh04+XPymQE9jpDyOKg6T2NpbCKDkRv1jPmURDb7AdW9z
	YsPl/d8Ltuhv/xVl6XPf5886DHagCrHUsam//vdc7g5sGkhoPE3mYgWnOhsBzMZU
	XF6tsg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyf0dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:06:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-71f2e7244c7so779926d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 05:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073968; x=1757678768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIUWCEcqZtXBeXsUMytwaz17zqmex3UoROOIhHg+zWE=;
        b=eyV/j6uUGXVQ1IeMWC5KjWEw04WMd3+IZIXY8ThjYrnPrCfHjMi2hceizwnc6yeZ4g
         irxkNVkR6AxhhMcroQ5J0g3s1WEiFk+Muv7yw0+krRoEr8VEsjsfaIZQakTcwaluHUx3
         3YDKqUiMlYmhP6mgXodTO2vGM/2lhVQTiwBTGXOvZkbQvsCmcyjYqJqq0OdwvBhq4fKF
         YvQaw1uJkAEZE/8noBFCs8EuSTTzaQb/buBNnc6QMJOHga7Q33/vcufyVvKx5hN83yXD
         DEc8eYz39vjXEcUhrGFHihJvWhTBdN27sUgs0I0wEmMYCegfXJ5ENsA7NNHwo8aUcduV
         l4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWmTS0ANzGdg8lJP1uB63954VtUa6yEiST4f79lOibPLv2tIfiyPpuMDerzOJv3yWrqNnYsa+8CFTcMa3C9@vger.kernel.org
X-Gm-Message-State: AOJu0YxIjOZStpv1qGQWZjlHIzesYy4S9IBzs9Y716tGnrpIEgsuE1iy
	SOP0iP8n27aFuA3TCqHUtSBWoR41OZEuKrOymoRgD4a3Knv7DtUw+6dbMM3sWv+2SU+xylb9lzg
	EOkgoU3CvkpJnOYCluaA98mANqM2jveRbgeYnYCzPdyQpfJfSWDoeidlNnoEoEz6bBITG
X-Gm-Gg: ASbGncvbTTi+NQVdJucc6sQnj3dfeOAZfwXagbuOqZzD7LK8N2qobP1m0/xHBsORoLy
	ucXbR2u0Z6xHtpwDr+tiBtoXxhh24Vtj/gnlGG/loqGqfKtwA4eSHyPW0fHB9FdOxhILxnb5npu
	Wt+jiCbrYvWSEfvvnI0A1chykBJL0GebMeu/QI3gAyvWC3zl3QPqYb/kZ1Ri7uiWmO4q6Uu3aX/
	lYBvmVyEvIG/3bjG3MwRpq1SDCsIr0I1iBAgXszMrC1f5PAcnN8K8JysVyKxOATCzMD9Gk3gDJc
	knHvPF6gsdS19jUFM99J3Wy8gzkZ3AJTdcQgYBcWUFqnLPKzCteMr3+Ph1jhnEi/FHKcAbPkhaF
	pIX0fhvRJI3WIESFf66rjVw==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr59876811cf.2.1757073967356;
        Fri, 05 Sep 2025 05:06:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbClop9hg8atD+aWFohh2CZ/t3jFlq5ci05mjat29SqiFLYOqxeot/a8+aYFeKlmRNuQXfyQ==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr59874841cf.2.1757073966067;
        Fri, 05 Sep 2025 05:06:06 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b045e576edbsm785026566b.75.2025.09.05.05.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:06:05 -0700 (PDT)
Message-ID: <b7d1985f-3c3f-4776-9990-42a343661c51@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:06:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O
 expander
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-4-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-4-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bad230 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=TqwOrElcE3fYHNaCTFUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PkPFgCEEBT-H_DEymdPmn5FacJD_ykxZ
X-Proofpoint-ORIG-GUID: PkPFgCEEBT-H_DEymdPmn5FacJD_ykxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX7GaEeMjNQbx0
 1Av0wArDtUVzFeZb+pEpmdO560rsafpvcl9EDZAxvx27pDRWpSADjqL86WeSGkXekeq8hqN8Lm5
 BZj3tT7qu7HozcDVKpETahq/3oE+Dbm8GfsMtmK215dNLGewYa14GNFxSo1xo7HoIHbsY7IZQP5
 KMGLnqrdTQfUEHMnRpP8Hj2D/BIYm1eT/r9pUNRNBFeVCUmnvbq4D/+xgXoVOiq+7Wpovge4/a4
 oqTww6HzHhj6Ym3iS9M6RT5qnbzJdDA34AOr4EbAzcRe8epKO0yVLDCBc8HdeF5pJNKVpbP1huk
 OoKNOsK0z5DJJ3AIKQDf+Qx7Sc/DyrPfZAqxRqOXRFtonfyzyVrkA5yGkIuW57Oai0JCEwCpVSo
 73j/cIBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> 
> Integrate the TCA9534 I/O expander via I2C to provide 8 additional
> GPIO lines for extended I/O functionality.
> 
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

