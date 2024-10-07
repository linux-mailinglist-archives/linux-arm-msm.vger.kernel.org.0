Return-Path: <linux-arm-msm+bounces-33448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92835993741
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 21:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A36A2848B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 19:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5551DDA3C;
	Mon,  7 Oct 2024 19:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YBYpVsV6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75AE13B797;
	Mon,  7 Oct 2024 19:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728329025; cv=none; b=oUlCLMwWvGIbVV6yBz8iZ1bk5gda1DBdfeRZwn32TDN84UiAyH/ORqH7lKRBeH+SfZ+gBj6ay3/XuATGwDMa0a8MfvgnEZGK4+9y1LRKjxJbKF+PE0Eb9aUEKXt/DnyUFMbLWGlzEdGz1vg/OQeUAyFJBJOb0b9faSVAvLW32ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728329025; c=relaxed/simple;
	bh=0jljGmY6PN0GJBzo5UrRdlg7PesUC+Z5bcaPW8iXpIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I7KxrRC0QSFZd+NiymtG2HMEiJEq9Jzz+BaQX8vAK0CIf19+X1kjc/EIIKuInTa5LnU8k9DhQiECReSV/fBgYC3QWlXWCxLHAiWY2tuqXVVKKKl1XGxkMo80xAZH1zitke0oRe/H4w8YkOnVbHAq1ZKzaasSMaRz+MPoXE+qkyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YBYpVsV6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4979NTGY006603;
	Mon, 7 Oct 2024 19:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1EGGJPxSmvLiTrrD2VO8xxQnqrJnihpAqAU2vH7SE0=; b=YBYpVsV6Xh48Or/U
	fbGvKD0mk8wJXXXK4yeCgfe4vTc2hqBsOLomu4DjWX5ugEyvUc+XIitTKaiT+RKK
	k1rXLZc2cd1r9hODKZApvR7rgbNC+HV9ySn7OSW9Lmqrir8tRJSwFfpqBe1JXW8u
	Uho2Y6bNvDyEFiwsswDzokjK34wa65AfGcanTN/tKNZAYnREuFCJPah7C0UxGsqC
	OyAbjSy2Tmk5QBkh63l1uQ48+8Zhhkpxke9vLNCFsGVHHu8yrABnmCBM+MAsyXcS
	jqK59Tck5fH1hCS4m368++HkQR0e4d5YlUkXK9MKdlyRBrryLbZDdSMqvWMl8Hbf
	PUE2aQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy79jff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 19:23:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497JNcQp019014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 19:23:38 GMT
Received: from [10.216.6.71] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 12:23:36 -0700
Message-ID: <0c91b95f-1945-4c9d-a119-fac5dc4f5661@quicinc.com>
Date: Tue, 8 Oct 2024 00:53:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-3-quic_kuldsing@quicinc.com>
 <ylfkupkpy26gupri4lbwij3sh4uwrm7lxr7q7q2rhrgiwai6mc@bkplz3mlrsxb>
 <CACMJSevsbXeVV8t=nZ1L_ZCefuaU0Ew5=VFcSWTSHpMj_Bo92A@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <CACMJSevsbXeVV8t=nZ1L_ZCefuaU0Ew5=VFcSWTSHpMj_Bo92A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8kNErFsOb0MBtzI3J2fDS0LSEYvAmOH2
X-Proofpoint-GUID: 8kNErFsOb0MBtzI3J2fDS0LSEYvAmOH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 mlxlogscore=904 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070133


On 10/7/2024 7:53 PM, Bartosz Golaszewski wrote:
> On Mon, 7 Oct 2024 at 03:18, Bjorn Andersson <andersson@kernel.org> wrote:
>>
>> On Sat, Oct 05, 2024 at 07:31:50PM GMT, Kuldeep Singh wrote:
>>> The qcom_tzmem driver currently has multiple exposed APIs that lack
>>> validations on input parameters. This oversight can lead to unexpected
>>> crashes due to null pointer dereference when incorrect inputs are
>>> provided.
>>>
>>> To address this issue, add required sanity for all input parameters in
>>> the exposed APIs.
>>>
>>
>> Unless there's good reason for the opposite, I rather see that we define
>> the API to only accept valid pointers. Then if a client passes a NULL we
>> get a oops with a nice callstack, which is easy to debug>>
>> The alternative is that we return -EINVAL, which not unlikely is
>> propagated to some application which may or may not result in a bug
>> report from a user - without any tangible information about where things
>> went wrong.

Discussing with Dmitry as well on other thread over same point.
Not all checks are needed but I believe some sanity is still needed to avoid crashes.

> 
> Agreed, I don't think this is a good pattern in a kernel API (as
> opposed to user-space interfaces where we validate everything). We
> expect a certain level of sanity from in-kernel users.
> 
> Bart

-- 
Regards
Kuldeep

