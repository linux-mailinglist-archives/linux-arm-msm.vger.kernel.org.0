Return-Path: <linux-arm-msm+bounces-56603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE3CAA7C89
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C73743A81DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE1A21FF4C;
	Fri,  2 May 2025 22:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3ND3PGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C44F21D59F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226654; cv=none; b=bCSuirBlEYzNrR0tBr+q5W0ZQhAozwb3MrvwhqQXJmTOuCpaHIqlI0kI++BpqHA40/ZsCTmNqsxGd3XgHpLEoF9oK/ChRK0oIM0l/HCnaNqtphfiPe0LvS4VCIpJ+W7RKeyuJiRiR2VEQtXp7v2zrJABGY3Y7uqzGVTh9h/pv2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226654; c=relaxed/simple;
	bh=6oi1d7L3dOM1r7BbAPAT5Ksm9yveX6Z64T2a7u5u2qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgGEVXpBAXJKszCgTH2S7zwU5dMOWkYmCEc2YTZzIg+5NU1fpUYrTXktj6pOhYKl7cK9g0a8bZ6BaGcnYofI1T8mwvNJe+fqOxqSrhQAKpM2eNLXTRv8MgozRomEbYrvd+KQJlsvRwkjVBQjMw6iUdVPwgsJW9tK78rmUjb/gpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3ND3PGJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAoU4015724
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 22:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nNKChsHdf8IXoQprYYi5KKVigp5di6ek5Hz3xT2EYKY=; b=W3ND3PGJ4345fspW
	+mmAeDizYMPX5a5vl9TlLIRa9kiRhHeNj9B3HpYyzLTXkWsDj8iHhqEWDYy+PSUl
	8UeUMDiEbg5HjQ9vioIWQtzd5UNKdiFZBTPys1Z0s95Mcn2T8gz21t8oO5SFyKrv
	Z8Lth+pA852Wi3JgeZdRFIYR7j+dkd6Kh+xAZLLddlokUgDu1voHxJH8WFYkThTG
	ACFalp9zKXv5X3IQJdECjg3hSCVnSNQMTmfHff8V6AN7tUN6iqNx/aXN6CVskpu0
	n7pqXWmVlo9jqermasEgkNxbiCP6eNJvp4gY3IWIvhKcQhySEV7hozN22aMkGTOQ
	tKr9Ew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u79kgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:57:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5560e0893so38413485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 15:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226651; x=1746831451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNKChsHdf8IXoQprYYi5KKVigp5di6ek5Hz3xT2EYKY=;
        b=kLGZhM103V5nLY2BId4mKNwgtxs97M/N23d1Vu1B9XvVKDAtLwr8dlFlHJUxIlIwGA
         GNKNZOMfmevAEPLA/WCXxMynboo4bHKoplUU4WVdzY0xN0QrxM4CxVAz7YqmIpcWVwQi
         BpvkTB3XtMg4S738G1LBwclgaiVn1ephw7sCpFQ+r5d7rd0igdnjqiwjtimiIkzd/SN7
         w2uBy+KApcHyCFxbd79Y7j4EdQJyJUv/SUSCJ0HdkdWmE7Sz9NAzLgpHL1cELuevkYQR
         PzFWo3vCB/ti17WYeVScj7SRyQHndZT/UG0YVDtNJmIuNr2syax2RSACgYdUeKqS53wn
         jirg==
X-Forwarded-Encrypted: i=1; AJvYcCVyWltaFNVIabDByel4X6tGuxDv8N+vWwT4D8UP3eP7Bnx+BoUKrRc6NGfyl1qjD330X6Cx6udX3CNXS/Lu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8YKE2e3VPAWwEKy8tgBOMfjTs88DwDNVwhkNubXSdfGMk89r3
	pgwCEXdQIzmaZyA6JbkciDzjAtddYn2ZPdjqFnrXjRSg41FBJUlj6vaE21iNXpQ2nM/vI62pH5c
	gvtCbpLsouuc/4O6hjNn43TzejtIfp9oU+ZbEWsRbQnxbLBZd9AQ47kba0vXAge1E
X-Gm-Gg: ASbGncvB+JiwlnE3sVAPRcvWkDDprimiBxopBNH2p7noLSvotjO5uFH4lSUpGI7NKFL
	VJBBEMuAY2ayp7ZYwH1CM8JtocE5BDaTsZ814odE6BffvYrHWaUWAgGeIOC8mCLv0ZX5ciGkIhI
	nUCrL8sOl4GH+hylWhon5RjGYOjJ1gh1a5udCCZd028VzxlzOYVT/4XGWuR6l6AMQi0VDFbB/Jy
	JGy+o/QKdpjF2+8fayF04lWIcVyEKqp52o95fK/Dt48I7NspllgOjT4rne0CIiZwftp5b/FCyu7
	GsJNnGpGSUnrveSozYxdF6QrybvVZWGQfOLXMavliixwLx0e1IrX0f7B1m1/hUhjZwM=
X-Received: by 2002:a05:620a:1a04:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7cad5b35ac5mr203475085a.4.1746226651411;
        Fri, 02 May 2025 15:57:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqMMtF1+Riq0SuaiuK3gIeYBYE+/iUBZrjYNrfHWu+zSB4KAYTBvY56L6TqJmfl1HqCBJgnQ==
X-Received: by 2002:a05:620a:1a04:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7cad5b35ac5mr203473785a.4.1746226651023;
        Fri, 02 May 2025 15:57:31 -0700 (PDT)
Received: from [192.168.65.170] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557c4sm1789165a12.15.2025.05.02.15.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 15:57:29 -0700 (PDT)
Message-ID: <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Date: Sat, 3 May 2025 00:57:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
 <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4OCBTYWx0ZWRfX5SKhqb8vDbWQ P3PQzNuuTJ0nVJ6I9w2HDFRor4qTWujtQYdkQAB4LE1u2/vu+Rvz9uV4USCUNoBfmFqOkaRArR8 V1St5DjTk5JR8UUvjptKZxS6Q/L60AuiJ3hC6RKgLktJ2/QiUGXX+1H7fh7LTvhDlc9jgu2VPfh
 WgWgKyn9aMvwBYSzGG6mEGXCrK81yFGp89xiJs/iBUyKy7k68zTZHyM9hSZ9IE/oRfQRvsnmZOL HDpmR0aUb7SFcxMTEV1KIRkA4gF8bVUilcC4Xc6kilexgts60Q82Yer8YvUlLTOZzbfocMViA8e Lc+WMoFhG5nnGKPE5HHZjcBGnCfZqNTN3mkbjtADYz+CWbYmtk/5ytgUJ51+H00ZpUVL5pyvQEv
 GaVsYsrjFLUsgnnELqSjXCrZs345KTpJCdIdv43VKcy/r+uIDotMHUeg3o2EB2hy2cM5kSMF
X-Proofpoint-GUID: JZfVyqKl6jFj2tulVsMjhEHwta6YyvpZ
X-Proofpoint-ORIG-GUID: JZfVyqKl6jFj2tulVsMjhEHwta6YyvpZ
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=68154ddc cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IQSbClYQ3koHTJNU0SQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=720 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020188

On 5/3/25 12:55 AM, Dmitry Baryshkov wrote:
> On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Have your tried enabling it for X13s? Windows drivers provide
> qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.

Forgot to mention, it powers up and exposes the expected qrtr
service on the CRD

[...]

>> +			glink-edge {
>> +				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
>> +							IPCC_MPROC_SIGNAL_GLINK_QMP
>> +							IRQ_TYPE_EDGE_RISING>;
>> +				mboxes = <&ipcc IPCC_CLIENT_SLPI
>> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
>> +
>> +				label = "slpi";
>> +				qcom,remote-pid = <3>;
> 
> No fastrpc contexts?

I frankly don't know how to validate them

Konrad

