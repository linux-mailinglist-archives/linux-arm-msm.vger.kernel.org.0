Return-Path: <linux-arm-msm+bounces-52524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1DCA7177A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 14:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 533F63BDBD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 13:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FFE1EA7E2;
	Wed, 26 Mar 2025 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODkgmpkj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B55E1EA7E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742995543; cv=none; b=vFx2+y2CqGrgLw8YJMk+ou/jqor1HJPCnhxGDh09ge9RjxkPym4o3dyk++uzv8a+QWEOIu9L8gSypsWhF2nvum+1gi7w3/puiQW+vX2tGBk4Gs6LO6lJpl5ujF7OFyyyIawG6z/wcKQfXtY7HvIwVOj8QHdxBdkMN1gifSDzwqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742995543; c=relaxed/simple;
	bh=Ec0Xu4PjqUjd3h3Ibtjw0z8jjglSCJ/HQleUwNbwRrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwDzlOaHCyrm8NaLo95TrHYZ8jIRJaJ3aE7eTpbFL6dLdyRjmoA1UYxfM29fmpbMMrHPVPR9JZKsvoxQIbkoMHa9dyRY6vf2SouDAALe0/t2v6wqvR7ebPMPjp02qPxWw9bF1bMbJDugbIZcO7DrophAOSj965oxi+G1fDo5faY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODkgmpkj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QA1mwB025407
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mn+Gs2SyQz1iQ9gjKD3hboP/p+jh4/gpnc6d4YClDFI=; b=ODkgmpkjWML3lzo/
	B/vFlkL016Pi7Js5wrT//WRkX5MlqM3zEGJ7Uu3JJ73ipuV4+OLJypWd7kOgj8uX
	1ulgPLFlj4Ukfa4MfAMwOuGLXKbd/G+QBLTeDw2RkCYY/PULTpFboiwVs9piE1Qv
	lDAOGlFAxEk51GIlj5HkQQcqpgW05/QSAnK24Uzcl6TCz8HKXRjq5lfWKMC9pJjw
	LMSSY/pl+vhX/WH2f8ujDuQQdcq0ivMfJprO6Oyjpma6PzlraW8irvBRsfhnBO+H
	igIWXfaU9zGCDQoVq+9hAol8hVwPwRSlbpijwqhlb4mLsrJYA2oNMuq7DIVPTQmS
	9KJU/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcgj9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:25:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c547dd8b06so118059885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 06:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742995538; x=1743600338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mn+Gs2SyQz1iQ9gjKD3hboP/p+jh4/gpnc6d4YClDFI=;
        b=KT0TlMWPZUfaY1Kq5fdd18ooMMb0VcWrRP9Inf/PZxCOpcFu2C+i7kjwZStq4vTIpW
         iOlssLDL0/xL8R6xCnUezoVySvQ3ruxMvaGtI16SRtVrzREmdoybvNkyViI8AGY5OYBN
         +icd7pi5uxNhGrgDBwcKsNHQc4IeoJHzEwq++4V6nqgOmnLBEOuA2444I+/lmv5fNntd
         3Jp1jBMsUlRrapjl0GrswxL5/6yW6jqo7ugIbZIKgOQYzrWvu2oQq5rjnVBILmDZ+e5i
         OMoUfqTLfFgJUyr+HWsrQi5edYCwWj37Nl69BxZ8Mi098MTHdogTN2dobtx306okoJLk
         4KPw==
X-Gm-Message-State: AOJu0YwPezqq0Z3h7YiFzcUeojrh2DsPxKx30mnqfpD/DJJkxhaq8Ct9
	lkobLs7rh5M90FFxC4OLsT8PETAN03NUclZfULzMvHowFjzjyAstf3FWuk0qu1HoNPo89Ba1zVl
	iZdHRTfvX33YvKEDr66snRhZlsYhDlwVHwI9I2zW4wvmt3L4VJY94hVKPLqolzpZ7
X-Gm-Gg: ASbGnctFSETZV/w/157hxVJ8nnMRzTjOimKTootyH4mpPZuC7dcFP4YAUCAjRAgaVtv
	bFJz6zIyVNnLSnGgnkL1UjZRtnMq1r/5utkiVLA3eErTyTGAaofQL+2/2g0c9caS26Zfn5g83Sy
	Szy6PjSa98KqllLSpo22BfNuKj92iQfHG2le3bE44nrLk0/HuXra2sbbFquGXWoqWKTB2OiESr2
	KKnH4CCFU0Ne+IcjZPkD3WvMHfDRVrc8/AnPDPm2jymiZJ0rXdyPfibC0/GyU1uvrCh3JyNZbSA
	00CFazVUOUriupf4HWVj0dGJ9Y+WcCIraiJGiEMknqhWUOGimqBgNFFHWBeVIYGoxl0o9w==
X-Received: by 2002:a05:620a:31a5:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7c5ba1845a9mr1263113585a.5.1742995538133;
        Wed, 26 Mar 2025 06:25:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP6KqkuwA9cDhKcWVVuPPt8YQPIOz8vB2xkumwy0+ixdBejLE2t0tCRCxjlesEThechUVNkQ==
X-Received: by 2002:a05:620a:31a5:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7c5ba1845a9mr1263111385a.5.1742995537640;
        Wed, 26 Mar 2025 06:25:37 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef21a99asm1033442566b.0.2025.03.26.06.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 06:25:37 -0700 (PDT)
Message-ID: <776fcb22-260e-4c60-81dc-9632d76a85dd@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 14:25:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink: enable UCSI on sc8280xp
To: Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250326124944.6338-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250326124944.6338-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e40053 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=R4_Tb_Y2wpFPbI5QzzAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Dad2hZ6pKpdsNe6mX4VhVHRFApNg0qzu
X-Proofpoint-ORIG-GUID: Dad2hZ6pKpdsNe6mX4VhVHRFApNg0qzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_06,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260081

On 3/26/25 1:49 PM, Johan Hovold wrote:
> Commit ad3dd9592b2a ("soc: qcom: pmic_glink: disable UCSI on sc8280xp")
> disabled UCSI shortly after it had been enabled to fix a regression that
> was observed on the Lenovo ThinkPad X13s.
> 
> Specifically, disconnecting an external display would trigger a system
> error and hypervisor reset but no one cared enough to track down the bug
> at the time.
> 
> The same issue was recently observed on X Elite machines, and commit
> f47eba045e6c ("usb: typec: ucsi: Set orientation as none when connector
> is unplugged") worked around the underlying issue by setting the
> connector orientation to 'none' on disconnect events to avoid having the
> PHY driver crash the machine in one orientation.
> 
> Enable UCSI support also on sc8280xp now that the DisplayPort disconnect
> crashes are gone.
> 
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

