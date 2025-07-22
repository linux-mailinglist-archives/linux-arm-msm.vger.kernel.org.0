Return-Path: <linux-arm-msm+bounces-65992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0760B0D270
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C7526C334F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B994628BABC;
	Tue, 22 Jul 2025 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBqUFhod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EE27F477
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753168707; cv=none; b=MgPx5LlLhwdWjSfUWK9AfRmmrdNxxI0ZjUSFegK78SSUSQx9AahhrwwA6zMmUmZDcd5WdOJZChFeRq3ODdAoDPFtk48f50WmbHvotidaj0EuvVc6OUE4qgsKDeQqMhYPfQymPdHYQhfrYMDVf6UJKDgH50g0Rm8sRaSrVgzoaa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753168707; c=relaxed/simple;
	bh=5T8JIkKfiUjVkjvG6ft28382jyrh8mx118uNTKp4Tiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smiVW1fDAUpRFbZQoUdPAkum5PVvWwZ5uyNmjYqUR1I+wVJbXBTwgms/x0kLVhM2cHVNx8jQpPz3ybcYFJmEBRenhPEK/SmVuqbbnyGbdi8203VDaV/82LEK4JWA76QR+bzTVfMCvEHkDLFWnQ3XW3e7X1nMdkPB0oBgAaCuZ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBqUFhod; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LNIJiJ012530
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C3bjn0K1BpuI5g7LymF9fp6Df55M6Pk8nkAxDqY4xk=; b=SBqUFhodBglIJfVw
	AtEmf5nhoR5q/PRqQuAUMrSTfyQy3KJ1auCpKFK52RT75nm9NGUrFfwY+btfpdOt
	+Bmc6vFboCJKt2jD/mfZsJlkLDqjU3lxSJLKOJXelszau3uFlZl6n8Z7e1wJrlPW
	r6kacsQU1COxWYAQX2r5oZpoxbPpcskA2MzcFh33q+XEGVVmntxXHB6IWwWu9/3L
	6JstIE1RgFvqTK0Hld4GkCdE6ZCmvob1IJhYXi3uaODKtTWXL3LvnaxhI3oC4Ni2
	jMJN6Ouhk2XB6PJ5q7uw6tLqgCaNY3snFK+YjzmrXWXzRAo/2yScZYv49NflaCGR
	KOfD5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6jrua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:18:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3139c0001b5so4710435a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 00:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168703; x=1753773503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0C3bjn0K1BpuI5g7LymF9fp6Df55M6Pk8nkAxDqY4xk=;
        b=LxcDxjXJNWMyR4PJDh9wVzAnjVNvwdviizW/yiJOaqW70Mpui7pF8/RSkq6uxEqUtT
         X4kSzCejpgN+ND31pM3lQDPu+apkiwBWUlojGycCPgtIN8SiMogonqPcDjlpZk5gXK3Z
         BqP8GWyJi7xLMgzvPsjs1nRFbB0Fj2BYa4fFuy6goW0GBYtJhXfMAliBCtOGNZ3fvE71
         UQaLuW1yKM1JcEZLi9dH5GSTuAmzx5rNezv9lIA9QirLYmZyJp1bqcTXdhBZRU4Zh7Aj
         GYNX3s9UaEcI5UJg66oy4ayhW/ljCps8eg2X2cv7yTNrTyV3rL5xeVMYgZbAS6xGtJkq
         1PMw==
X-Forwarded-Encrypted: i=1; AJvYcCVsWBInrkhW2x+byCw+A/4tfK4NPv+rkxE+fcwGmfP6Z680cur0tzobxtJdVfMuHcfcMIrENXDwxf62mcPb@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3PmI2joFQ0FGJzlNHlnW3Hroq6bIi7Gh4MjmgdwRg7wJmJEM
	VHjAUFmR0yUZ0wcnUAs3MRyhUgb3neicSnMPqBy5tR2vc9VvijSvttD6jBfvKb5u4rH8pfWJc31
	CdXvq7DhUd5ceyLUXRwS42BxLhvimh2a7jeF50wTsjo9LjS/A38DtKbjmK2M39e98D7au
X-Gm-Gg: ASbGnctedAqjVrCSZYChidr6wq4PhPm5nqPr1kXIbxJrCLQ5Dk3EvXCRHjnOj5mUo8j
	Zr5/PHXgez7YsXJX4M0UKFhNjREFhRLOP8XSXU+KCVLUvaU6+vZs+Vw+jjzYHMAWncLfTuOM8Cd
	TDr0Hvpw4vvlicRpU6S87cFSTIgJcwubr2+7L7VGhCQBuZhkhneWR8ZLwwErwHpvTZ8oK+4Fijw
	roN/Rzp+U+3eHro50PIPDdc/WLNGv1pLsl+J/7ijLb6CSrlVupojLz/fWlzPtca9g5C/x8+mSSP
	lpjuHQj/NCKvsC2664yt66gtK7s3DTNJZFm5r2QkfshTWMYjFguygrZpwb9IRvMiLSfBWL0=
X-Received: by 2002:a17:90b:1c07:b0:311:e8cc:4264 with SMTP id 98e67ed59e1d1-31c9f3decd2mr33663779a91.12.1753168703017;
        Tue, 22 Jul 2025 00:18:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfWROZAN8xnaU3AGOGzeHb21uHu6cc8XWYoJJlMXthbXoWRNTVmmRgM4/DanAva3Ppxlpi+A==
X-Received: by 2002:a17:90b:1c07:b0:311:e8cc:4264 with SMTP id 98e67ed59e1d1-31c9f3decd2mr33663744a91.12.1753168702519;
        Tue, 22 Jul 2025 00:18:22 -0700 (PDT)
Received: from [10.92.181.248] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef976sm69124245ad.202.2025.07.22.00.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 00:18:22 -0700 (PDT)
Message-ID: <a6e26f6d-67ba-47b2-a4d6-6d4c6be1e914@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 12:48:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: dwc3: qcom: Remove extcon functionality from glue
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250718053856.2859946-1-krishna.kurapati@oss.qualcomm.com>
 <2025072021-rounding-oversized-5b4b@gregkh>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <2025072021-rounding-oversized-5b4b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f3b40 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=C-RkopLJPYdHzFFRb_oA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 7TTseSQpIku9Kl3YZSaT2wfLlYaEJxch
X-Proofpoint-GUID: 7TTseSQpIku9Kl3YZSaT2wfLlYaEJxch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX6T/h9AOe49HD
 m5h+xOJQbxApLy3YXULEJ3+7woXY6963tExIY55YBKdShMUhZeGBC/EF0OV3ij9DxYH/BWAmlMW
 K7nCrTGgtpy57P6ABYCh+1CGdgZ1mCppCjiWs9v8+BrZRAABL/qI+NHIT4jrZxRgF/KqQjQty1g
 WCfhRGhg7tRiar7Oa6C2aybyVahh3f+W4L2gAggnIt4YJvxyg7F6vLLpG2czxENdk9qM0WCdclx
 G6fG/tdBjfoRQqCNxhF390MZyrQ3zLy7x79Cro1f/aozi7FRFHtIl6UZX34vKBx0PcGvN86wTFq
 ayL3sLIjUMyC5wmDe3vZ5TL3qN6XpzOL2VcLtCbSYYLDNAPYnlyiFIq22NYV9WgCJ66m2rrJ276
 1ywp5+u79maraalSQdvCEH9CXn5fC/lvMpUWpD/fs0noF4aKzr+ZCRY4Rt2Sss173uz2SYqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059



On 7/20/2025 5:10 PM, Greg Kroah-Hartman wrote:
> On Fri, Jul 18, 2025 at 11:08:56AM +0530, Krishna Kurapati wrote:
>> Deprecate usage of extcon functionality from the glue driver.
> 
> It's not "deprecate", it is "delete".  "deprecate" means that you don't
> want future users of this, you are flat out deleting it entirely.
> 

ACK, will rephrase it to "removing code".

>> Now
>> that the glue driver is a flattened implementation, all existing
>> DTs would eventually move to new bindings.
> 
> When is this happening?
> 
>> While doing so let them
>> make use of role-switch/ typec frameworks to provide role data
>> rather than using extcon. None of the existing in-kernel extcon users
>> have moved to using new bindings yet, so this change doesn't affect
>> any existing users.
> 
> I don't understand, who does this affect?
> 
>> On upstream, summary of targets/platforms using extcon is as follows:
> 
> What is "upstream" here?  In-tree?  We only have one development place :)
> 
>> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
>> effect on them.
>>
>> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
>> driver which relies on id/vbus gpios to inform role changes. This can be
>> transitioned to role switch based driver (usb-conn-gpio) while flattening
>> those platforms to move away from extcon and rely on role switching.
> 
> "most" do, but not all.
> 
>> 3. The one target that uses dwc3 controller and extcon and is not based
>> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
>> This platform uses TI's Type-C Port controller chip to provide extcon. If
>> usb on this platform is being flattened, then effort should be put in to
>> define a usb-c-connector device in DT and make use of role switch in
>> TUSB320L driver.
> 
> I really still do not understand what is happening here.
> 
> Does this break existing in-tree users?  If yes, we can't do that.  If
> no, they this is just unused code?  That's all that we should be
> concerned about here.
> 

Thanks for the comments Greg. Basically, all extcon users today use 
legacy glue bindings (dwc3-qcom-legacy.c). In the new bindings 
(dwc3-qcom.c), we wanted to remove extcon functionality and enforce 
usage of usb-role-switch framework instead. So no existing users of 
extcon would be affected now. But when the above mentioned platforms 
(the ones that use extcon-usb-gpio driver and 
msm8996-xiaomi-common.dtsi) are being flattened (by anyone), we want to 
enforce usage of role-switch (moving to use usb-conn-gpio driver). Would 
it be clear if I incorporated the following in commit text:

1. Extcon users today use legacy bindings, so this change wont affect 
any existing in-kernel users since no flattened dT today uses extcon.
2. Extcon code is being removed and usage of role-switch is being 
encouraged instead.
3. Effort to be be put in while flattening platforms using extcon based 
on gpio to convert them to use ubs-conn-gpio based on role switch.

Let me know your thoughts on this. And thanks for taking the time to 
review the patch.

Regards,
Krishna,

