Return-Path: <linux-arm-msm+bounces-56539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB80AA7753
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 18:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC7B94E2998
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2013A25DB03;
	Fri,  2 May 2025 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jr8hSbse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D10625D53A
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203477; cv=none; b=YhkO9ILO1f4SjT7etuLOZwStHwrRIu2mWFWcOaTHSKivGi5Ph/4nxmX5tH3GvX+piFuykPxfCwKs8wLEJWFlc6Z6g5OyLQTb3P+KzRQzSPKhg5aXVrOijhgzkS5minH/6xw5ttw8/d6YF6sBvMUaXfX57g9T818Tlt3z/hYBYYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203477; c=relaxed/simple;
	bh=HfhrNn6qbcYUoPHjEUu/qbSmHEO8TLmjIKVCSB/6Hz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iL86iNVktNwhMkzz+azzMijChR9X8ti0GXXVDkTRbL2M/U6WKhpJHc/gkIL8xJ6KAIoK8Eeve8KD4ReP/H1XXwBlegvvR12bqVOtKWgNYkpYzDFBmVhikDLBeRjiRa+zC8wW+E6gIi7PV0TKuBRGSOJqh6mgRlNKl7DJ9b/dt6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jr8hSbse; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DaoJ2009023
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 16:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtXRYG9Q5qrj8myubAvBaI3Oe8aAUXM6QH1Fw8r6toU=; b=jr8hSbseZYhk5GDK
	eCuf6SvK55ZwCkZniRU+ObTIGXCxY21vMQDvrklXPN2qqZJ92AwR6bBX0SgIQF4n
	z8KOBR1XjtxADECTzZ2iCgFyaKE2RhxQ+NmqHkBk7bsdKmoGhyqNvMT8S+iUUkth
	Lvi1X6TbcqbpmFolEAMPlscvuDkOjWdE43J/4r2Vy3ipr5pVWNSFXE3z5MtDTozh
	K0kNv4CE6FjiaANQGmJa2dfEPME4O0+F+KfC2x6DrSvoSz/974P7ouYZCiqYYhMC
	ZDocXhHZS0XXFDVXijElGCc5JYh/7606Emgcy7s59j5o+zYFTLrKNIp8NMF55z8B
	gqieAw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubrwrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 16:31:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7394772635dso1389882b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 09:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203472; x=1746808272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtXRYG9Q5qrj8myubAvBaI3Oe8aAUXM6QH1Fw8r6toU=;
        b=P2bOQy8BmYRxqR50yhgBAWPui3FcInsyG+IP2KqJFJLFIf4MaXXDoS3HmO8s6oVM7t
         tY2XeUGwg5ace8eY/2ZWMpafUti2AswknzOp/uRsAliVLK0j7yOs3S9iVJ7YHDfMXGg3
         d9n+85xrNK1nqSnhIVuH+nC3cBboh/yNaxEGxkf9PcPNXykSMMtlbR6FVuASY372xw8g
         sndgfu07ZPt+HgSaGejSlmhRKYe8zhMGp2rb3FJqwZKnA7u5+4oVRblkG8Ssw3rE63I1
         6s2ddwSrbNcdOsMdal72fJHpnd8XA8S399LqROdGKsqYlvmZCGVTMu/04HSg/Fk2ehmt
         VHaA==
X-Forwarded-Encrypted: i=1; AJvYcCWnbIJIR/wY5P9OYEXh6+MJvcMFqjIol87sed/CgstQ9jWc1urLK0ydvMwOoDKO15C2ezzR9MK9lniS3RP1@vger.kernel.org
X-Gm-Message-State: AOJu0YyoKURbYLmegXdcAmJpM5CFnL5UPyYgcLYLmFttVkf7e2Fb9J+4
	/vExLx68XQ/HVk7viwDucxmmvcnEETnht0Cayg90ReqOa7tU0hNQikhv1Jf5Jl/9gbEWqB1hA2o
	4fvAn2+K4SDHoBby01aRzXZZyCWdx9Trh0X7gL3sfUqNwcwCV/d5fzqtorWsJy53x
X-Gm-Gg: ASbGncvI7QI3TFRjUsxwzhS7vL3jtyCbQ5YgNaa9PyfDpG0qUEYO+xMPQk8fszB1SIQ
	7e9GfkhmgJ3iSklCzHRSR5nxvWvExfQ4dv6AIqadXG6P439jehRzKODYx/C0KxZpisy8jwVr8rf
	/QQoBA879w4WODbTzDUO63Sv9pMUgzYIm+GoP+YsP2ApMQ/P6A/prDziBD8jtqBhiF/msRKLlsR
	qNK4ViQYtauO1mj7E02Sv/74DcFEZJQpTlnZuNMiaC1OaFWdQ/roJaVxcjlXMDvlEeJ/W0nu9+0
	EJGjKP6KVmZJsh2aWHsEqmTBmvE07CKKm49POZeIBBfe5xwaxpiw
X-Received: by 2002:a05:6a00:1c9d:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-74058b25d87mr5417115b3a.24.1746203472636;
        Fri, 02 May 2025 09:31:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb54Eg6fwcaKmb+QzmXQ8iGK/9mI8N87y3T04YynY4pAo54pLrPvinNqZ/362AoLpwlYrDpQ==
X-Received: by 2002:a05:6a00:1c9d:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-74058b25d87mr5417076b3a.24.1746203472209;
        Fri, 02 May 2025 09:31:12 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb804sm1839193b3a.52.2025.05.02.09.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:31:11 -0700 (PDT)
Message-ID: <c2b0b0b3-6fa9-46b8-84ef-81314965848a@oss.qualcomm.com>
Date: Fri, 2 May 2025 22:01:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <gmoe3ykmns5hmmz6hdyxgzxiejb3nycghhvt3pgjysq6xa2zni@wpqyuz2pj5vy>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <gmoe3ykmns5hmmz6hdyxgzxiejb3nycghhvt3pgjysq6xa2zni@wpqyuz2pj5vy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KIVkwx6E8eaHRyLDhRV1O6Ffoa-r6GMn
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6814f352 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=sAsrsCsg_48icDTAn_UA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzMiBTYWx0ZWRfX1TrusgmH0I2x c9BEBkH0zO7I+Sc0mY2CUAMn+rjCQIDnixMpxX2ZOK4k2wTebWo/HgtHxZDiB/A1FOxOy198ucH A+gx0LKAvPEcDeUb+6gRfwH1cjg8C8YK8w4gtQrOedKC0nCraYW9ICoLukejMDHmdyTGbPOiXAP
 iUTV2s06kzdI5WEREC52tQkSqOBVmACQtds3T6V56B6O0hYI3USJtdsXGPwH6sgMlkBn0zuRW4+ aphqFUZ9GJIgbbJLXTy079lrmOFfdqaZo2k7yDhPZZpS1OnA11yL7vSdqBcRgXls2hO/XwmddW+ IGTeci8xmz/6tC4gfyloSYx7dPaOMO2R/PWYTSZD/bGjOdEIp/aIVsHIwuFIkqi3hmxZRUoOB25
 fh0iCWX1epVi4cSVN/MsORNb/dUeJEh4ZYugnhbXKd72DmxpNAFKaZKUmoSOhO1eCJ0cG2HO
X-Proofpoint-ORIG-GUID: KIVkwx6E8eaHRyLDhRV1O6Ffoa-r6GMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=871
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020132


On 5/2/2025 8:24 PM, Dmitry Baryshkov wrote:
>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>> +					const struct qcom_wdt_match_data *data)
>> +{
>> +	struct regmap *imem;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
>> +	if (IS_ERR(imem))
>> +		return PTR_ERR(imem);
> Why? Just pass the syscon directly via DT.


Ack. As replied to Konrad, will rework this.


