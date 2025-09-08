Return-Path: <linux-arm-msm+bounces-72599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B608AB493D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF368173985
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B1730F931;
	Mon,  8 Sep 2025 15:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIovl2uI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C553430F816
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346052; cv=none; b=edfymsBpSklTWRVQRPB7GE+8FRHazWYaWwMcoSHuqTBQPcxaKP4JBxfFB958O6k078H2SIadNztgHd8EX4kQ1Fh7z9tMmwlg33mKtJvmUSw7mPHfOJyEn9rD6joVrB1Grd9TZXrgk36NRr+uuT1/j8cMGorlNOjzbjQlb37VLjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346052; c=relaxed/simple;
	bh=XQXO+Tzhlv6Nwt4EWVGJNi5s6zZrQnUFejRGMlJMDwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+gKDNvcFNW9mnMWjy3RtN92jtdWU4WMj+MqDXnmjgOBiniedPiPZp9wxnet4EdIUqprhSRWmoeMQgmi+75PX9ZI+tp7eWeWWm0zW7agIcJm8gdjvGldTe7pkP/IvMJ9QPgkZnRNBMd186rIEFmW2uC0OBhTyszqKRRB+FYK/Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIovl2uI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58892tNe008905
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEL/f0fiN9vSyXycSIa4kThderOPszVm82CtrwmVcn0=; b=fIovl2uI5mDRcrPg
	lVdvcU+/5wOC93/HcguaLdwltpugxYyabIvW2WHRMcm0fpDO7TIRSkJI3eC7gEHV
	9HXHOjq5KTuutnRITjdDRSfqBhcHsQLU9ujIiQ3/HCfKbe/LJ7YHpoqvOOzkmByt
	FJXPovaCzpZgSKZ+ZGuwV0TJu135QuX8gnyMhlmw36oiT/+UZZ5apm6QxNhBSREA
	aHX8fgArVYXXVwRGtsdouDhhuvLdZe5a29vSnccOhWfYr/gkG67lj/gzfbDCIP98
	MXKMm/IPYMvimjpPsWvCcVcKzGVodtBlnrb1c6WHb2s2hX7l0hw8JPWIwufFVZSU
	ReEtmg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8w4t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:40:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b48f648249so17170061cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346049; x=1757950849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEL/f0fiN9vSyXycSIa4kThderOPszVm82CtrwmVcn0=;
        b=UoAAEQXi4SggVHq1a5MFPSsdje5Q/A/+BA0LN0cYsC2RKV/W+hnn1QVSYBlByRFGH2
         xWrhlG3/8ztGX70lhk4HUI28rR0eSmgBDNhtZX5xMHxOpd367lYe+D6/GW/XMd4ib1j3
         W0yffTQkwQVi7ST6EB+p6xy0zfBIub4oe0eYOnWEWjBnLhgdNc+sX9D1kzNIpOLEHRqX
         jLFqYJLALWZz/niLj7m+FID39IqFypsk2ZkV4urjaVHo2PoOMqukWHqgCg58k63xwzTp
         AzmOh0qzN258Bk5znBzVZrAfk78oVLXYq15/dOHC3n2zaOC0RhN6F7CthQazouzwJskD
         yRlg==
X-Forwarded-Encrypted: i=1; AJvYcCXPwDDc/5obB+94aC9sho7NPJkAvUTqq6zdwSQTVXWMEc0sj3mUp+QEam+NN4ZVAYKUgy5i91ePK9+dRrmg@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQUZAgUF158B9jOofyavxphLGOfhvNbl0vBDYpSQ4kaboB+K7
	Lzu7XQa50MgJHq/k53kKaj6xMoqHeiWrAw0bdgUFagv1uncU5Hb6wM6NmKBD9Tlkd9Ga079CxWV
	my9fNetsYJT8QIk4Q37UrgDxPKln8G5ev6HVXOmlF2pPxzYFdVe/qO5T0I3FdpmFAWLkD
X-Gm-Gg: ASbGncsZFQAxQfW8OGdJAtwK6to3OlrhleQPcWHVP4akiz+FxSvGU5h1a0ZVpNuwT67
	KUbN+9MmHOTST4U7qpy5XbUa+nOWaXiX9dz1HjqZu26N+54OqEXRQ0jQz6zwT/dUHm7x1EecYV7
	PhynHgM57aOfGxTBTQOMpAm0gnF0/KRULPJf17WFvCrSz0o8kStpFNIpAoxL2QeAojSVbO7AZYC
	UMxW4DRzmA0v+Vwaa+aCJchPHm9TYFNomo0XB2qD4f6CStHxcd0Kcra/x3xk0+GKUFL6GbhbcM7
	QowZ19De5Vzf1+kJNTVvNkbCe1HvPyy4DIYSqtVCb26jrgiDFNU/YDspjUa9jo7vKMZ6JF964jm
	xOXfXTVwcED3TnSLmotmKXg==
X-Received: by 2002:a05:622a:58b:b0:4b4:9d38:b93e with SMTP id d75a77b69052e-4b5f83860e2mr57363711cf.4.1757346048723;
        Mon, 08 Sep 2025 08:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSQXBBnYcaEbWaiBHeiamyobKP1WAkRxcpeUav1deyl3r76u7Rjk/xxH6krW0KNLxWuUfTog==
X-Received: by 2002:a05:622a:58b:b0:4b4:9d38:b93e with SMTP id d75a77b69052e-4b5f83860e2mr57363431cf.4.1757346048119;
        Mon, 08 Sep 2025 08:40:48 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0438102debsm1819568266b.66.2025.09.08.08.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:40:47 -0700 (PDT)
Message-ID: <6a00646c-2b25-4193-8db2-157669817d61@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:40:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] cpuidle: qcom-spm: fix device and OF node leaks at
 probe
To: Johan Hovold <johan@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250908152213.30621-1-johan@kernel.org>
 <20250908152213.30621-2-johan@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908152213.30621-2-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bef901 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=tVI0ZWmoAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LotNk_tcR8CuMVeKJCUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: wh-P_25gzR0Z1i4IyKJqsS7SfbrnJ9Dh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX3BhzomRoOIV7
 UDIWTq4R+ALdqLcTaVLJQFriA845cJ0g+AG42+sc6Qp05aSOwYiWZCTFRae7H4jI9MCFlWpkNRh
 n0y5JFLnhXxPbFi+lRVUhYwjmJmSBqDZCsmTaMlZMsSGrzXM45wlbYh0khxkihB5pZt0AGixuCJ
 lJs5lpL+L+cLY+NvR2wAGYJe4XnY335ZGnF6qnknGA+3R0cxb2rF/y8pWDsAA0crJVWXwW750Q+
 TkV3EHUzoi/9OI7G6plvil86n01LsnLKnBc8WUk4QlVqeS60isfCx49HKIrur8bSaaPSDeo3ach
 jU5/wxEbGM6wFjoQvu9fqjAPilOJLnTUVAqiiwizxUfDfap+v9gVDbcS266FZBo4yyqV1xurQ0g
 sBk5UQFy
X-Proofpoint-ORIG-GUID: wh-P_25gzR0Z1i4IyKJqsS7SfbrnJ9Dh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/8/25 5:22 PM, Johan Hovold wrote:
> Make sure to drop the reference to the saw device taken by
> of_find_device_by_node() after retrieving its driver data during
> probe().
> 
> Also drop the reference to the CPU node sooner to avoid leaking it in
> case there is no saw node or device.
> 
> Fixes: 60f3692b5f0b ("cpuidle: qcom_spm: Detach state machine from main SPM handling")
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

