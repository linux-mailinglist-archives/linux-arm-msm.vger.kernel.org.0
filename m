Return-Path: <linux-arm-msm+bounces-35993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F99B170C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 12:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB822B20E59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 10:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A301D0E23;
	Sat, 26 Oct 2024 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6IQstbD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9231898E8
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729938555; cv=none; b=BhmHQ8Bw7nCB/4yp6jmFIOYkxzA3fynu4QKlH5zNUzv63ZvHcO7OSz8UWjmf1fWuML/4KBrs+K++wKxynLay807YfzjOew+IijVbck/HzIfRVphtcndPJkcPNzL5wA1pKNdGwTnNm0iy6w1RIiYJVGqJfuAHqjau38IX9EmjaLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729938555; c=relaxed/simple;
	bh=nICN+wGw0Zlnk7XBJCykqu2YHS88K05117fzsx5U0Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JvImFxSs5ks+xtZuixBI0s/5O3tBol54v5VfxR99MOXRogHysm75q7ADKeiPGnQ7/RRmbCSD3MiDOQJYcUzXBOpGXk9Q6iOfPlUZUrRWJ0MIfvhu+kq1rDFvUWedFKCRR0G3Us8GkNys193JW3OT7fY1tbpfysmMlUFFR9qUL4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6IQstbD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q575H5029874
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drvjg+RX6Oe25bBTeyk4k7Mz7Zh4OVvPYWEd3+8U/qM=; b=p6IQstbDYCTF2vu3
	YdZj0f64Go2DP3zfQ/r279BJOaXViIw6bvi0IGJ5XwNS1kJ2Wny3nlibn2J1h/B7
	eeC346SZbaXcMXb4LR8Tj8neDzvkQBnWAAFViHMRhCV0bMy2tK9uic7WBTnvOvnY
	BS/+Ns0FRyYm8+r9iaO7GlDI9c828EjJDT3FrIUIf0FC7VO9+gxfZOMlwS+zkbge
	4iTWRNWcy91OjrGUR8wWFborAEUuqIoOaPrHYHc4kwAvugiCBtRHdljk12ikDSCb
	MIZYeRvuAtMyvQbBqYojuFBjDH9kIbz243lzggR/Y7LwMRwx6yngZiCL35YMHpNw
	GaJm2w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt6rpf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:29:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe6e6bcf2so8368746d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 03:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729938551; x=1730543351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drvjg+RX6Oe25bBTeyk4k7Mz7Zh4OVvPYWEd3+8U/qM=;
        b=Ut0e4pqT9KhsqXu1rvdIJJho7VBcBJELm0xF8x1x53PG+s3AKdvMzFVXT48N4+erfQ
         MDhNOWF1/ZGTRqZFSJbzqkyV1Pr0gHeyXFUKsGdlggagx5yEO2NR4hcRCgWw8EnIqQu9
         KKJgyQBXZa/WDs+ApuVfhaaFdnV73jKNRQnMb2h77zC11T9YQ7svsIEMBiena5l+ou5k
         UBFJcQaHnzibGfbOtteSjck58KGZWpyLAFFuDLLSRDvHoSNgDa1bc/B5hpm/1ctswD0I
         R709aDgwWmzYnkQq8DaC8xkXdLINjPqq1MyYlWwjuw5aEHh1DzvnA+jdPjS004/C8eTL
         yb9w==
X-Gm-Message-State: AOJu0Yw9Ylt6WhKTnzRxiL38YdPDjWZKktwLM9rNGI30KkT2YyvwnHkI
	xewL9pyDeFgH8cSyjZgCNXX3GUv6g5r7yLaX6SsIEWWKC9vvxKbuWcoxY1g3xOnDKbcyfk5ESFt
	QC0j1vCMIR8UiSsUQx1nYhpeHnekuxwum7yN1yGFUkk34v5iB83ghUEatFBc0DtD1
X-Received: by 2002:a05:6214:1310:b0:6c3:67a8:dd48 with SMTP id 6a1803df08f44-6d185682ebamr16341936d6.6.1729938551703;
        Sat, 26 Oct 2024 03:29:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ7pz+xlCS3swsXKEbLqQvosFijw/dvXVXUM6BjXWJOg7X4GFjj3TA+mHbRBN3TH2OP3ieyg==
X-Received: by 2002:a05:6214:1310:b0:6c3:67a8:dd48 with SMTP id 6a1803df08f44-6d185682ebamr16341856d6.6.1729938551355;
        Sat, 26 Oct 2024 03:29:11 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1e1a66dbsm163308166b.12.2024.10.26.03.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 03:29:11 -0700 (PDT)
Message-ID: <a743fd1b-c6c5-47ec-9ac8-1e4481180ddd@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 12:29:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/12] arm64: dts: qcom: sdm845-starqltechn: add modem
 support
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-12-5445365d3052@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-12-5445365d3052@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OPOptPb1nLAEvvCnPOdHXzK9i-vfnIca
X-Proofpoint-GUID: OPOptPb1nLAEvvCnPOdHXzK9i-vfnIca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=850
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260087

On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
> Add support for modem and ipa(IP Accelerator).
> Add spss reserved memory node.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

