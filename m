Return-Path: <linux-arm-msm+bounces-61583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5327EADC90F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 13:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69A0C1764F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B735C2DBF47;
	Tue, 17 Jun 2025 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wpq2gupq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ACD2DBF45
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750158428; cv=none; b=r5Tg2xNLlm1FCK+NIlhDcVVBYl5WcWX0/rTUZLak8lG5ETWPWbfJFYk/+q3PBufwcOZnqpKBzG4ZpMlMOtL5efzB5EiBc+f+xkcUNIO6ktXAzTjjkySt8G2o/xiJ5ri+rgYARJhM331eZxJEFM+2DgqSPz3ddkO5IeFnQY8gpmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750158428; c=relaxed/simple;
	bh=ocgJRSJa6BE3JFmsVpvS45RVD35leZze8Krtljlq6B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSKa2gzgdDuUtWfifo0dgTcQSKtyFav7LfFlfE6XGBaw7zVseT6xiIxJAWt+Ozm2/XJQbk26m4wTpgaWt8/TDkWSstdbi09trog1bxSYNsr4fzaB1XvkKnCJnUAUHEOquXd6cl2N15sST/5X4iUNm3UTSaYAKNuX8uGBMuw2lF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wpq2gupq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H85gbS014469
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 11:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQBuEvx5JTVQWB/H58QAUF5UuJhkg/HVPeKkcx6NHyM=; b=Wpq2gupqxyqZHJsi
	qic+LGF6gO6KlvVYYPy703qlvF7aiP27T40vWYZygr6r/J4e29wLhJECCN6Hnik3
	MU+GRNFZUHjYszkcK0Z0yP5uFBV/s+komAImVBtpOm/rthVinQH4rGPWWcUX2eTI
	JcstzbsrQ8MZubwZ5cjqI98GVe1oFWdLmnGyfx18N21Zdic1PLjfMQO1sC2ijqXc
	fJCDupEleZNpN4teFha8EKq2hy5YxqyouoQ7plF4H8fonAmLEsbH9HCPbDNB5kyN
	DBGZ5KYciWb4RVb8zM3rXHk1x55N5ZrLPiK7yQut9qxIAPGkzUggwgS1SLxLRNRC
	Cup1VA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuwbga3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 11:07:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b26eec6da92so4707650a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 04:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750158425; x=1750763225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQBuEvx5JTVQWB/H58QAUF5UuJhkg/HVPeKkcx6NHyM=;
        b=rDicrIbYYZZLg5dDZSiFstDC4Gf0mo7zyg9j/PeWrY+MTt8twHJTj0s9kAo9GzEmaE
         zIeL/cbgadanyjIAhAvjOwuXoOyu79nbshX+oaZ7eDxGaTskYCAtWwsUfykf4njR+jlY
         BfXijqBOHvE2OcDWOkTa3Mutp/9gtTnPhVPUxK5MYqr+LmAqovZba1Nsqg/3mMXcQRek
         9mKYsVWJWbCX2omhiLbXr6rZbphbYHltiLhLcDUGSwUjAKNbdfIB1eUUXGylLtYpljlk
         eLwE5NDM+cC2CrulyudlPUGQefIEJ8OeZVBVYaTzu1gd6mgK5e7p6dLlgcdoIoDaoLhC
         DbLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUDGBqV+9WvLqrlgiJlRPTmiu3dCp6EAWB/SnwP3z7NEJIpzdhGglFQZvGP/zbT0QmGt/YvPn1/XOxdpNm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3cs9+iDbr5JBlZ1L9RvBOserX43e0Nsy1C3v+AQV6iWLau7eZ
	gPnnOXPOTc+NguLHoR/LALbXafJ3lJTNsA4FtLQxhp335W5ul95/D99fDTCbCyOOq0/BQwqgMbe
	bsNxccwKTZW+3SDqFtlKlgxZWC4/ibEA/RA3W0ryDO/PjTj+VdzBDBYR1PNEpmLLnAWGj
X-Gm-Gg: ASbGncspqbl+sXnc+N5dSc7w+h4Mxby+ylALsFtChnQCM7PAMgxIIqeLKFw8jitfAsp
	L0O6xNqdkN43QUP6D3Lovss4jUnQUQtWiy5M+/HZ7c96vqt/0p7G/8iMiJIeBsXio5MSqW+jKRV
	l44z2dOiUyU6tgw4ruk1RQ66OnZrq1jHMNGnIDj5W5MCMTmelnKB9TE/Pd7IGDVGdmVMwrDUgiv
	V2nNhJuXngctQkYjMKqkOvNQifoE5mqjAbP/PMK4552yrCyD78gkgiMktb5+pmZpr1nhu7+sGQV
	+58DwJ9E2S9DVMTEGk+5JAFHElH9dpdyQMt6nBlquKQwhRPKe4OBLXGr21I=
X-Received: by 2002:a17:902:d552:b0:235:f091:11e5 with SMTP id d9443c01a7336-2366ae01073mr195545495ad.10.1750158425352;
        Tue, 17 Jun 2025 04:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMk/25sYGw7/noMCtsDarXs981kExTrASeeTn/1Izn7gqk+MKOiCOPdIyos0682zfgI0LP7Q==
X-Received: by 2002:a17:902:d552:b0:235:f091:11e5 with SMTP id d9443c01a7336-2366ae01073mr195545055ad.10.1750158424942;
        Tue, 17 Jun 2025 04:07:04 -0700 (PDT)
Received: from [10.218.15.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d98sm77290745ad.151.2025.06.17.04.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:07:04 -0700 (PDT)
Message-ID: <11827cf0-8985-43e7-8c05-3c554bf1fdbf@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 16:36:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] interconnect: qcom: Add EPSS L3 support on QCS8300
 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mike Tiption <mdtipton@quicinc.com>, Sibi Sankar
 <quic_sibis@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
 <20250617090651.55-3-raviteja.laggyshetty@oss.qualcomm.com>
 <43ebe623-8822-4437-92cc-9d24e97295d7@kernel.org>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <43ebe623-8822-4437-92cc-9d24e97295d7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: h-LK_NLrwtFLf7e-JimWlHmxL7KAkkLE
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=68514c5a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5YNjd6bEO5n3GnEyyeIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: h-LK_NLrwtFLf7e-JimWlHmxL7KAkkLE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4OSBTYWx0ZWRfX5a/tciue+kmy
 ZbDVq+gXoe1610iaRvrXBATbiwLTrxtOUvU2BVk4/HmB9igMXAaZ5f8yDBouq8qOZ/ZHq3S0eXT
 sqjcqEdeg4iVQHTHw3GDEUpGqmrLt74dcVItC3Ne6hRsbiZ16cojw6D463Xd9wUeYGroNPRtJl9
 Ww0zQkkQl/Mu9db6vyxhauwCPJkhamDgoO1RwwLtwaTRt0vbp6lyRlvB5ngm7FdkshwaHg8NkCH
 abg6mms/PdMoiAcMolef5cwjxOGaxs9YZHvQW/SD7Z5KDTVFHMds1YMNuNEkqXiwxTuxfJnA8fO
 e2BGmmI4ZGjIXWbtMbyMO/SAvsOc8VvPCJyS8p1/cC5EWrk48ms3IFjdhFJ/+SilBVXFhzFJrQM
 MKtGpr9CDgOtW4qPHl7GvIQSoPcAA8Eq6rsfiLInbV0c+td1jr4Kfr/ShN8dydsG56HIiRPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170089


On 6/17/2025 2:56 PM, Krzysztof Kozlowski wrote:
> On 17/06/2025 11:06, Raviteja Laggyshetty wrote:
>> Add Epoch Subsystem (EPSS) L3 interconnect provider support on
>> QCS8300 SoC.
>>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> ---
>>  drivers/interconnect/qcom/osm-l3.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
>> index baecbf2533f7..d8f1e0a4617b 100644
>> --- a/drivers/interconnect/qcom/osm-l3.c
>> +++ b/drivers/interconnect/qcom/osm-l3.c
>> @@ -270,6 +270,7 @@ static const struct of_device_id osm_l3_of_match[] = {
>>  	{ .compatible = "qcom,sm8150-osm-l3", .data = &osm_l3 },
>>  	{ .compatible = "qcom,sc8180x-osm-l3", .data = &osm_l3 },
>>  	{ .compatible = "qcom,sm8250-epss-l3", .data = &epss_l3_perf_state },
>> +	{ .compatible = "qcom,qcs8300-epss-l3", .data = &epss_l3_perf_state },
> Heh, the same as some time ago. We discussed this.
>
> No, stop adding more redundant entries. For explanation look at previous
> discussions.

Will remove the compatible "qcom,qcs8300-epss-l3" from driver and retain
it in bindings and devicetree. 

This will allow the driver to probe using generic compatible, without
the need of additional target specific compatible.

>
> Best regards,
> Krzysztof

