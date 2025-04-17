Return-Path: <linux-arm-msm+bounces-54612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33FAA913E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 08:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A41A3B903A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 06:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6211EB195;
	Thu, 17 Apr 2025 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMbZXpsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD431E3DD3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870773; cv=none; b=V2ga9tnX/Xrjra5tUHeyiE02qKVoomYAuS43tctU+Uy0Ov648prn2TMtGkRH4I0tvROtV+xTRFOj3QD8mBtSMwplN0iyIx98l5wKvGlfsCJS5V3IhfvqSMfPeTkgHZ1Z7mtPLlXq3hlsucE3ZoiQPXAEdwDZKaE3qNlcJhx3Jig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870773; c=relaxed/simple;
	bh=4SaNcvRSUmw17peZENYtXe9a5+FLCzXbF63BdifSfFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmtpRVKuDDbnWljS47eGUKXQ3wleeDX/OtWnsVYH8gMIt4f9qqfyEmJCYcKunjCDuK4nk+j5jxBt1c9w/t1KbJkjHyoLkKcqEweh/rtE2cidgZV60kz49FqBgazdubU0eTBnPx3bEv1bQ4vbQUmqb8seb5LObS2qvDaQeSjEwr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMbZXpsj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l7Fn003046
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmyWTVfTvdIgm61cHoCvvxTKB4qtt0R/AYVgAU4T22c=; b=gMbZXpsj2/M068/p
	4ruAl7VtuWgK1C67UJP5JHGrIKlSr3/lwG50WvRBhPlcS5GmolnQQHzAX/EI6e/n
	/2h/iEhM3XNTqM0+fbevxZapo+8BFSaWDga4CX05I4GD5lQS42EyR770jLLv6hIP
	DKA8SJVNFA/A/SIJhUpeQjQqOTqUlhM8Y5PvNXkveEOp3RID23JtShhc0Lzvi4kj
	j2KeMze3y1lWAPC7hOyF4Ygb+X22YHAfhF59nAih5SLxcwifcBe4NZSFKONJ4OGJ
	6JahJJv+yCh6hH2yyF5KjLTiFejNxhry5nnrzaIsMCWAxPjBrXHfdEvQycdPeIm2
	1MdNYw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk5rrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:19:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-896c1845cb9so465371a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870770; x=1745475570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmyWTVfTvdIgm61cHoCvvxTKB4qtt0R/AYVgAU4T22c=;
        b=LFW0OuiKF1JjpistK8cneodiYSvoD6Hqb6fh0Qd5Fjt+a17GJNXqh3mm9nT3WKCbz2
         a9XRhNhYVnfhnNCjBO2UyaTDFSHLmU/kdh4DYfSg0clMx25znBWSlf+S1e2/61SPNyWA
         JaTEKn4StStCpEces5b/yfZsmos49r4kv+OCJmJNm5zPrxjovpZV04USP4YcDHDW+aQS
         JjVRrkeRbHSO/+nf8tiwHjxPEywLZo95u95oqX9U3WkEny6baUTxa12tQnmHs9iITEhI
         bkThtxm56XXimPagBaKSicaqIkLgmFCYfW96dBrr/rHHNss1gQAP1oxI9PXf91Q6hZc/
         aYWQ==
X-Gm-Message-State: AOJu0YzSm721TbsCE4Cy6dmpHkt6bvHmITBLUlDjznajFFLSFrJyYaYs
	7yaBr/JXHotRwJ/ZqQRU8tHIYfdDPIcxve6Q+v0viC8ZrJNQXzTHWC+DE0gydJqcExx6bQ1PQiO
	1U0uO7ugNnRuCF/GU5GSU7uxlTYAzxDIHF3BF4f720ibDwJNkm953HqQemklIhBfg
X-Gm-Gg: ASbGncuH22306YPZUbsGKtfbQdJukplXermCC4g3gyWDHbjw4NvVhA7OvDvQiR6D2Z9
	HrzV7krB5mptO4Rw8WiS/BqA6qJrYnfr+bwQwLBuzvwNKoiGWFPMeQTmnYhUNX66qKQQR+jUETm
	ZAzeaFg2z3fS3iUou6iRrfU+pjCksjXgVn2+52Z7TMvPnnjvVzml4bEuIouWQWj10XScQSPT/Zg
	AhGtL4hmYLGs8QfTixI0j6g6d5bpKgAricbSX0fCyl8aVEpRcHsSEdqPF6AF+RHVTa2KjQLaglZ
	e1hFEaADdnNuco/+40uu+VHYigWlvmllvkhsJPLllWpn1tpjYKKk
X-Received: by 2002:a05:6a20:3950:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-203bdf7c2a6mr2467367637.1.1744870770138;
        Wed, 16 Apr 2025 23:19:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfR2q7EsCzAFAh2c6ykwdluIfy3j4GXbBtHOsR6AYzf219xIeMD/6Dxz9o4TroUZTIXvTXfA==
X-Received: by 2002:a05:6a20:3950:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-203bdf7c2a6mr2467330637.1.1744870769786;
        Wed, 16 Apr 2025 23:19:29 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220fd37csm2326166a12.44.2025.04.16.23.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 23:19:28 -0700 (PDT)
Message-ID: <0a774c34-e82d-4ff0-aa3f-4f348f4c2296@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 11:49:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-5-c65bba312914@oss.qualcomm.com>
 <4e9621c2-f347-4cba-9422-b14f96ee4c0b@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <4e9621c2-f347-4cba-9422-b14f96ee4c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68009d73 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=it6VRh0H-s_lwkDzcJIA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: IkvgO06qP-OGNr2AGjQeRtvPoXKcKXZy
X-Proofpoint-ORIG-GUID: IkvgO06qP-OGNr2AGjQeRtvPoXKcKXZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=986 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170047


On 4/16/2025 8:21 PM, Konrad Dybcio wrote:
>>   	.max_tick_count = 0xFFFFFU,
>>   };
>>   
>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
> double space> +					const struct qcom_wdt_match_data *data)
>
> Please align this


Ack.


>> +{
>> +	struct regmap *imem;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	imem = syscon_regmap_lookup_by_compatible(data->compatible);
> I still think nvmem could be better here, as it allows to plug in
> more magic values


Sure, I will be on vacation next week. I shall check on how to use nvmem 
here once I'm back.


>
> Konrad

