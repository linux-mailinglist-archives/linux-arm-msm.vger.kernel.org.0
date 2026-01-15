Return-Path: <linux-arm-msm+bounces-89266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B0D285EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9B3730635F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E695631AAA8;
	Thu, 15 Jan 2026 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2ENXbK0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hj5oEFQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6712B318EE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768508326; cv=none; b=dYwbRADQtHsdlSRpBC6tGE6vPQyarH/3j9FSeZHQRuNSE+sCoZpQkzCFEhH2syuUbfsaYrTfO4zK7aOXzZfPHwyLgWZvS6nzq/kyf37fYQW0GBQgPohQNEcmicNycfjz2kHoT4PvAlFXrYVp0NzAkpyhgqgWR08zQiiKZhqjzlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768508326; c=relaxed/simple;
	bh=z0xLYSLGPtusqIIoep95Wttu1W+s68UKQtkN3yDDcWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/XNG1N5e/m/pHg/UmaZWQ/rmyFEFP2bYiyCj/ecBUp5gf+huycstgKEMQdAlYOtCZRiWsTNyLg03E11K8XK7C2H2dUz13/ZBdnMHKQc+z4T/xnxzKVmHB20gcTBa8yBsynBffMrkdjVapgNK/YfJMmeePyq1A+TA+C/X3hcimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2ENXbK0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hj5oEFQY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYJC72174643
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnqPiGTSrWOR/jtbptW/xEAGZ61GUmhLAaxKSCpQDGY=; b=L2ENXbK0+HdbT0aW
	qh630rNPRRBgmQZ+NDacP8Y8KRV9R6tE387d8K+6PcL7qQdUscl28le7XJdyniNQ
	tUy73o4nBeIgHobUX33Q+L2773wlqBUXBNSMPtwpNh+9fNba5xQL2RNSALMsWoV4
	gQxSUFkNUj2eY52P5O1jA7BOyF4JEaa5Cwtbb5d0r7wruD07XjPFdJYocDAlsayF
	+RYUbxug9fUpNy3/B7Pkbm8zw78I8T+DiKdVf1G0OYSqsQBJtCud4L4YxCeovUUi
	hdYsEugxTAZCLNdnqnM1Tqop1M2OZ+E3X/kxdBH6X2mi6cYXBh6SkrTAhOh/RweP
	WZ6KNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh940n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:18:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c2a3a614b5so333101885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768508323; x=1769113123; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UnqPiGTSrWOR/jtbptW/xEAGZ61GUmhLAaxKSCpQDGY=;
        b=hj5oEFQYtG3TpPPDmwT4EjZQAibhmc6pADRNMBs1/CqByPtdEoxIukn+sO/EMtFLGm
         lMAg0zTdZ88eSkb6BcJDQ5UCotQawGEowWvQftAaQsj7o/kcf6ZxWn7e/dVrKaVlQ6vn
         4w+kcDXWI3ysBu43XKxtyj1n43lwiMmS4KjQmEt9TFkFUMhLi8ge9oiJ0z8KMlR9rz0h
         MWI6cgouGZ99Yvywpe7qgl6KFdqF1bmU/FOuEmpZUWiX+03PZSWtvQ56HqYAAOsPnD+i
         1H8AvVgQrSMBo5zum9ikM8fWDljIeWpczplI/ZH42Xzqr3MbEmjuXiC/1WpZbM75JVnO
         sPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768508323; x=1769113123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnqPiGTSrWOR/jtbptW/xEAGZ61GUmhLAaxKSCpQDGY=;
        b=ZjoJqKzXY3F2xi1wxfnqzxThujOwsApPqrnqSZgbP5PwOMpyWG5U6pQ97CK1GtZBkf
         RMjucYpDIDqCG83ShmLqiNGdbmW+ANjp7hQmkwEbhv4ctU799JlYc9SU1FEzNbXTRMOt
         YRFC9E+atbahFGci3FOPJHkePgRpLglME0tzKfRsM3m9ALMXdxWQrd2fBhtQ8A5fTK9m
         opiHQnvTjYgSAmJoBiSQJja2Je/EphipcH5wuOZCiDStNUsF9DHYrGJff+8trdcWHGsG
         9Q77S5Ls1cgDRzljpZezJraTXCu+DueqUoyGZiAnoMzdx8SrqYK39WaiuDgpqYRL4S8Y
         n85w==
X-Forwarded-Encrypted: i=1; AJvYcCXx1E9xSURXxPTbJFu9fD1jMvOeh4fzr54oPG+G9sqzxznZbTgcYDSQj7zjibp6SDNHjxRCESEwpCT7Y5BE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4aDLEzuVq+42eq2hhQdCLiTkY6KKXbnPNdvI2YW/RrYfBOlH+
	ytDZy5xJUH74e1+OYICcnj9ATDj0Zz6+5RjicZCqbAE3CJxBwu2p5Bf2jPge+Bw/Zf+CD2CIPmB
	gJilwA6DaDGHiYKxnkNme/cMhvoBJsMjIlhzK7JT7RO8GNutgbpafGa5i38vp1Z6bQbMe
X-Gm-Gg: AY/fxX6dtuWRh/1AHse/MeU7ADtbfMSF8Dq0sw54VmNzPDrwcI6xFNyCO59gFE+eOmV
	ErHG5rWCtm6TUL+0+3NsDORg/xtFB2weOwGsO9/ZBI8b3OeEZ1/Tg9E7293Kmj6WKL0XgbYim0O
	fPlCGmjw2D4sG4di5YQTF7gRYLZ2WvlEeh3RzMmGSyyauw6vt7LjgGPsWvFXpOp70HdL8MjMW+m
	Rf+PPfGQvylASDWzBXun99l5E3CJLUAzyWtD+Kh+0eJal5KgCSnqk9hK19vTwPf1q0CnEZkYK7j
	gYS86s9RzClgDJUDEZceNXnWsjiBtUTT+13P/zy/dklb0FPBLgnngBnJuXZfUEqrLwlbAF5n8ku
	F87heh6vkUO5ryp0A3NwHUSfHvuPtclgqThGJr1i+HG9UQfzFQj/IVI6lZ9f2OyLePhoHtjVWRt
	ZOqZU0kh4OGPtp4YeQSCfxbOM=
X-Received: by 2002:a05:620a:31a4:b0:8b2:62ae:acba with SMTP id af79cd13be357-8c5919e2319mr575788285a.26.1768508323450;
        Thu, 15 Jan 2026 12:18:43 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8b2:62ae:acba with SMTP id af79cd13be357-8c5919e2319mr575784885a.26.1768508322960;
        Thu, 15 Jan 2026 12:18:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384f8a1d6sm1416691fa.40.2026.01.15.12.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:18:41 -0800 (PST)
Date: Thu, 15 Jan 2026 22:18:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <ebm6tn3swrzqqzp5qnd7zkasqxo4nqcz2gt3w7j6sxqx2ryyn4@pwrkiumm442t>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BtUpm_kD4TbPimBKPy3dSIMTRDf29yAU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1OCBTYWx0ZWRfX7kZ3BlK669Iq
 TEwn59C0TTg874AFjCmPr7KN5zWlQoBylO/pySm7QWVtGCeJtKh4q8ukkVMiRSl9cSq85GjmXGq
 vYpAI8QiU+aQS1sR3Ku7gnImn9DUmrItnhACRVj8spw2QPXpqNBjeyPpFhpQSTodDW3evckajIo
 do5L74htc1vxNWHkfB2XvifqAYRskR9VXDz5/NUH8Yc3k1U9TUTJXzd/gfmAeDqnz+o5jaYsruX
 0nlNupudBVkPsigQL3h9M4SgXfgee4Sz9T+cVTCIHxqk0UMS6K2Y5LxEd7W3prRGzYipccTkV2e
 9T06YMx+H0P92ZA1zaYEI4xfVf3FqfqP3bjMSsvsna1V3jpC16YAGkPYD8rlaynhLLbs93rw5WA
 hVQQAXb9Ntyl+NONNKGr/0SMnFaQUm+u4TAUKnvTUjDDzFsXlK2TES2GNOk1eGmiLX8wHK+9UC5
 7AuWJ49VbT56ZbppSYg==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=69694ba4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Oh2cFVv5AAAA:8 a=2_JQiIDWNJ96xn4SNR8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: BtUpm_kD4TbPimBKPy3dSIMTRDf29yAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150158

On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
> Hello Sudeep,
> 
> Thanks for the feedback.
> 
> On 1/14/2026 1:01 PM, Sudeep Holla wrote:
> > On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > Hello Sudeep,
> > > 
> > > On 1/13/2026 4:29 AM, Sudeep Holla wrote:
> > > > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > > > 
> > > > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > > > > 
> > > > Instead of relying on a vendor-specific SoC driver, we should consider
> > > > disabling it and using the OS-agnostic SoC information interface provided by
> > > > the firmware.
> > > Would like to add some history here. Vendor interface existed [1] even
> > > before
> > > SMCCC SMC ID was introduced [2]. And there are several user space entities
> > > which
> > > uses the soc0 interface already.
> > True, but that's not the main point.
> 
> That is one of the point which needs to be considered in my honest opinion.
> Vendor driver existed from long time (v3.10 Kernels) in Android
> https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-dr/drivers/soc/qcom/socinfo.c
> and lot of user space entities in Android depends on soc0 which is not just
> limited
> Qualcomm user space, but also, 3rd party ones.
> 
> > > > The presence of this interface strongly suggests that the
> > > > firmware is designed to support multiple operating systems or software stacks
> > > > that already depend on it.
> > > That is correct. We started seeing the issue with user space when our
> > > firmware
> > > started implementing support for SMCCC SOC ID recently for non-Linux based
> > > product.
> > > As the firmware remain same across OSes, user space is broken on Linux.
> > What exactly do you mean by "firmware started implementing support for SMCCC
> > SOC ID recently for non-Linux based product" ? Does that really mean that
> > you can change the firmware for Linux based products ? I don't think so and
> > hence we are in this discussion.
> > 
> > 1. Either it exists in which case deal with it by disabling vendor driver
> >     and/or fixing the userspace.
> > 
> > or
> > 
> > 2. It doesn't exist which is not a problem.
> 
> Allow me to add some more details, so far, our firmware hasn't been
> supporting
> SMCCC SMC ID.  Due a requirement on non-Linux based product, firmware
> started
> to support the feature and same firmware is used even on Linux Android
> (android16-6.12)
> based product.
> 
> I would say, firmware started supporting the feature on our newer product
> instead
> of firmware being updated on any older products.

These are two different cases. But as you explicitly state that it is
only for a new products, then you can fix the userspace to check all
SoC devices. Broken userspace was never _shipped_ on those.

> Now, as the user space remain same and is relying on soc0 interface already,

Why does it have to be the same for new devices?

> user space is broken as SMCCC SOC ID enabled by default which gets compiled
> into Kernel and takes precedence over vendor driver which is a vendor module
> in case of Android.
> 
> > The userspace
> > tool seem to have made a wrong assumption and can't expect the kernel to
> > magically fix the issue here.
> > 
> > E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
> > made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.
> 
> Sorry, at risk of repeating the same thing again, the user space was using
> soc0 interface on Linux Android products for a long time base on vendor
> implementation. While I agree that, user space had some assumptions based
> on vendor implementation, if not disabling the SMCCC SOC ID by default, we
> should at-least have a way to disable it (via cmdline) based on vendor
> requirements.

How will that command line parameter be set and passed to the kernel?

A better approach would be to fix the issue where is is broken:
- Add a switch to the firmware, letting it ignore SMCCC SOC_ID calls
  (like it was beforehand)

OR

- Fix the userspace

The kernel was never broken, it is not a kernel change that introduced
the regression. Why are you trying to change the kernel? If it ain't
broken, don't fix it.

-- 
With best wishes
Dmitry

