Return-Path: <linux-arm-msm+bounces-71537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62337B3FB79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84D0D16B4DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572812F531B;
	Tue,  2 Sep 2025 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVCdi+Ji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01C12F3C38
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806974; cv=none; b=MGtsnovsHZd/qV19SpKhhPAk2trB9wY6XjagTeL5h2fypZetiH9oRA8pdGTNaJqm4MqSvvZtNjJn/KccD8xlLJRxOQcWxxX7g8PpNUGty/9FQANPj2ZQnP2EMlZ4zqoG2/p0mKva294usB8pGA1qq4JmvaicvGh+/QZabwnBFn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806974; c=relaxed/simple;
	bh=6cCV1wRKzNabvk8/xfdlhZ5ZHgh6aqqij8ou4VgthzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVCUOIaoG6Mvkd/hGfxSMAEYoD3Sb6k0hDb4mvoMerFA1gSkzSd12C5S/F/1zqA+P3gWZe6GiVd/le7hj+eZidz/RTR0MGO7xh2vgjrmk7g9b0QmbMPch4ih8KFY71RqqZnENZqsDkAinU0LphTx0pzLA5QFDwU8RvHTPUQyIGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVCdi+Ji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SaQN030840
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 09:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9a6GtTXtoxuJyBbnHBz6l0K5hhQ+6jxe0VIlfDfGZE=; b=gVCdi+Ji3DJ8iHKV
	QG6JRyvKFk1L0LPiESnNzyGxqNsHRsCK4IejX12uMXtSj3lu03F0A9ANdayl64Jm
	lmoxXQjakMJxP+7y0NLF0lhlZrbNsFAgI3xmcjyriVQa3iWy8xYEjCEzzkYStMIf
	OrPex6+kiRE+/0jXsLBxY3sMFMSWhmbJ62u1Tqy8luhu9RDwokgL8Khial7uAdA+
	fronRDR3wXdJk6OFbf6xNv1po96n3ASzhTPYlYkWpsWyxPJR5m+JaFmF2uuvOirR
	pctSQFuWsVoWOoHVPpMMJDU4mAq+k+g19Wv7lj630S5qonqBwjo5sOeDveey99aY
	RzXE8g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8qb4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:56:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-329ee88fb47so352063a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806970; x=1757411770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B9a6GtTXtoxuJyBbnHBz6l0K5hhQ+6jxe0VIlfDfGZE=;
        b=idsjS8C212kBQmFBVNvQYtWvSJttH64myRAgO8VARP437NG9W3Hg34LqCVX7gd0tJl
         sk3k/+GtsbCci0uKAOCDUHmIikFfJPbxy3mHJpBHjUiaAQP6NxaVx/vJ+zfS/WU7p3tZ
         Z8lhQBhvwRaHvbRlk4ySvwcQEg22jqVFkIyW7v+DeWi0k641haeYqrcXfiG+q5PBrPNr
         P3v0DQXrf0W6hLvly1g3c/ihZH43PAdyLpQJTKRPYhonDwdYeESnhx0f8CEGW2jiBDU8
         EcUww02RAZgckkwUkT5URDmDiqD8Bb2qvj/IZbMLSEekhCY6BnhBXQ8O0EfLXL+1VklT
         0IzA==
X-Forwarded-Encrypted: i=1; AJvYcCWj10WT63FdkF7kSAtgPb1xu5+HDV0Kyp+dae/K/klZHgEHP5emR6bMtY6+HwYIUTydY85Xy53cErx8Wf/1@vger.kernel.org
X-Gm-Message-State: AOJu0YxlyJ/BYiY9K2EmIHJh43qLlkZvCJqelJzgnhqoMQdNGs+AGtQV
	FkFGCiguMUglS2LjlVRSe0ldF/hsMzce2rmX7cZC9NAD6972zSNgPd2FvEexkh2ImqLWc2lP5X8
	X9z/FTqnypa7+dvWPuuVnazVr0evMs8AzBrinPYjsfV1dJub5J5em7j8KxX+IHpvX9RMY
X-Gm-Gg: ASbGncv5K+qRALmNuxbk5NnIGPcozvwXF7kSpWHZNKG60YNHen1O78OOM/Cwijd1Hvq
	q9TjRUHXvWOAFVmc2Uz37UPN/WCvtJBGCsaYVzVU9SpPhbm9mOH8rIw+Hb26rYtgyBjZA3yBWvG
	cdiwDQ1Q3tDp4F49jf2iRzsaqVQorsUBeRFU4bAm2D2YxJIOp/obFsl9RdekWJL14p3Ti3HEepx
	cZH2B4itb4xOsM8Wd6CpgtZ77wtPYNF1PkNoNixpNJoghXkdixTstQkDpUDvs2Zttawe4mF35+F
	ocUvQyznp9sBJtZa1uqYZvLqbAaRAHGUSYBe1+edE3OuatAt5fANhQtTKIFpSJdhguSkbg0+Sw=
	=
X-Received: by 2002:a17:90b:2692:b0:328:725:970c with SMTP id 98e67ed59e1d1-32815452f62mr16043534a91.16.1756806970127;
        Tue, 02 Sep 2025 02:56:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZVuzFiwlfBsSZxogTgJWw5dQ7gwHZiQ9EvvRoG0AY6Zu/sUmSXNmDrdeZxxVTBwQDQosRIg==
X-Received: by 2002:a17:90b:2692:b0:328:725:970c with SMTP id 98e67ed59e1d1-32815452f62mr16043495a91.16.1756806969618;
        Tue, 02 Sep 2025 02:56:09 -0700 (PDT)
Received: from [10.216.28.67] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329d8c939e6sm2349177a91.29.2025.09.02.02.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 02:56:09 -0700 (PDT)
Message-ID: <b4e26633-b892-fda1-4738-5c8aa85d71d1@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 15:25:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 03/10] power: reset: reboot-mode: Add support for 64
 bit magic
To: Casey Connolly <casey.connolly@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-3-37d29f59ac9a@oss.qualcomm.com>
 <88ee0a26-8d64-4060-b703-40156cd011a7@linaro.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <88ee0a26-8d64-4060-b703-40156cd011a7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bXjarJCZU90hWw12fEJ9b60kET4bFbtL
X-Proofpoint-GUID: bXjarJCZU90hWw12fEJ9b60kET4bFbtL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX7OkaYkZEQcl7
 Oupu86YFTSd8dT8qCSHvwA5XrjI9EtPcAW9b1uS+bzb8PWWVv6ZhC+bGcaK3NYFLh1BL+QBDqUa
 lAe9FPBO0y1O5DKGsjFYZywav7EeEjRwSLCBl6jiB5V3wJdZUdbgLxuZmRGCxnA+SCGnVdQ5QAv
 5JM/ctbA6EpWbF6ZuuXTBXGyLkm6J2JOBhilV+S5J2QCY8qeuYssHuSfIyq79huhEL3YddbITgs
 Q7g+rAHZNOEraHpeEWMhuFxWOjqS9BSIs5ZYLs4n6bTEHG/29s0TiUZ1GTbulVw4qdHDTwDVgcc
 IfKAWuDJXs1tE7dBUq0U4sy6J9tckZdDA3juZU9Gj72Hjb/IWlSe5QrdOwYp2HNLfSLjWH7HrR3
 HGPl8fng
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b6bf3b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=FBzynz1gJkPyhc2EhIcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020



On 8/28/2025 6:52 PM, Casey Connolly wrote:
> Hi Shivendra,
> 
> On 15/08/2025 16:35, Shivendra Pratap wrote:
>> Current reboot-mode supports a single 32-bit argument for any
>> supported mode. Some reboot-mode based drivers may require
>> passing two independent 32-bit arguments during a reboot
>> sequence, for uses-cases, where a mode requires an additional
>> argument. Such drivers may not be able to use the reboot-mode
>> driver. For example, ARM PSCI vendor-specific resets, need two
>> arguments for its operation – reset_type and cookie, to complete
>> the reset operation. If a driver wants to implement this
>> firmware-based reset, it cannot use reboot-mode framework.
>>
>> Introduce 64-bit magic values in reboot-mode driver to
>> accommodate dual 32-bit arguments when specified via device tree.
>> In cases, where no second argument is passed from device tree,
>> keep the upper 32-bit of magic un-changed(0) to maintain backward
>> compatibility.
> 
> How about adding a n_magic_args property to struct reboot_mode_driver?
> Then in struct mode_info change magic to be a u32 array of a fixed
> length (currently two in-keeping with the DT bindings).
> 
> Parsing the DT values then gets simpler (u32_array) and the magic value
> can be passed into the ->write() cb as a pointer since all the
> reboot_mode drivers already know how big the array is. Unpopulated DT
> values would just be 0.


sure. Will convert it to u32 magic[2] and ->write can now pass
"u32*" and can be de-referenced by the using driver.

Could not understand that how we want to use n_magic_args and who shall
set it? Do we statically define it to two for now? or should we skip
n_magic_args for now?

thanks,
Shivendra

