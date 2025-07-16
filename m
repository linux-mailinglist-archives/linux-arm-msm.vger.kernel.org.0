Return-Path: <linux-arm-msm+bounces-65163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E6EB06FAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 09:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E8B37B2E56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 07:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9DD29B8D3;
	Wed, 16 Jul 2025 07:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iB1Vv3du"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6079F29B77B
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752652464; cv=none; b=C4ijwiO0R2TEpd5nCaGiaUaFlb8+ADGoqtQnggV7L45KV1MNMKjuSq3iOa/yxXNomyDOsubx8bWJ/5hVnxFCPkJNg9/hYKMo1qvuL/IsSDo9u8PyHLzMMNid6GqLyfW8Ces9VXrjOfZLSAuh5SkZRH0QfKMMjlSZ8zF7hLtJWpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752652464; c=relaxed/simple;
	bh=WZPrGCih4QhFqUjqncLKZbwNIORABzOIKJgzxiGn7dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ls/bMN5pHX5YVwrcWHWa500Ixvj46ghyg3cT3G0567n6G9+Kvb9uVWfeDV5ZHXfl7b/XebjA6Kux5AJ/xq4LDsm/9qUSlMSiphPjBcoXR+wfcZRioErsO/gKiHY3Gaoqa8rGRnjXDJCUCivr949E9ZFl8kkfxa1j8dqhbnayukM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iB1Vv3du; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6Nhxm017581
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBrfWQZ+1CwS128iKb2ACQE+uP5XIkInTUzV1zP5bIU=; b=iB1Vv3dur8IyBWtF
	tj4RLsJko0Ti9cVWrW4gC6aiptVr1lx73ghDqRGvDDSxXd0dmnEb+gg5hM9SraGI
	uenYrwNSGZBRMzRIyeMx37rJ+Q+6pjeKHRR72IAD1XKhu01GWBuuEHTcrt7TtVEx
	/1vDb1ku70vCF1ZvEHNkvI6eGKBq3EUXkMva4ENauN/I8P37oQJKaoblHXTSK5iF
	JK8fhatakKwLFLky6sDn+d+35clwBqIBO9HREQ/4aq/9/Ty7Gc9Ade1U/u3opeEk
	Qmyy2TDT+ASYX5JSym1EM01gvAQChRN+BwNXpn5jp28HYPt+mF2pMviKYdeANoXu
	XtXcdQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8ax60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:54:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74ce2491c0fso8732140b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752652460; x=1753257260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBrfWQZ+1CwS128iKb2ACQE+uP5XIkInTUzV1zP5bIU=;
        b=rcw7NOoRAHW6ghwL1iBtwTQLho5gciRfimzz4MQG/3eQR2Ykde8Xr1qtR0oXD8F/YN
         o7aOZHfLev/yI84lT5G7G9ap9USBR0p4mv1HFyKGuVVKzIiXDBcCYXQ7Jjkr5WmUB0hX
         LVy4xpJmtGv8tfnhwP3ba9C32pcZzOEqtnP4wK4eWQzSqkbwYIWAhu9asicX83yrGSd/
         Rk7NZwkJnVRfI4LsVO25yIPdM7hBOLCcDd6XinN6OGT+ZlYFpOw3ZUqn7QKvPU9lvOC7
         lS63WkGDQxlWhuKPjhk8CbcL4NktrKbVY+FtppZUTeDstWsguY9/tHjfqZZVxOV/px0d
         6D+w==
X-Forwarded-Encrypted: i=1; AJvYcCX2xDg8rmNgWVLvBtvG4ulMpiuhF9esgTBIQFiTwwMSEamYEHoeBFOgPBOIq77ecXyYhLjwjL0kDfV20Dlp@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPw5nZJWJt8yqh5UgtqStNt5zKgk2bR29Y1acLkM/v59UbgV+
	hGLLRzXdsEzZpWpxUyyKUFIuU6+HDLeUlRrllrBb19+dppGRxwPhCIpYwUdI+bbbgORRK7ibJ8Q
	GWg/cRRSGOKDXVqaLIIwUBjivrPS2mTkni7+4HHc1miEMPpLS/SC3N+SzEyNoqeXwwnUs
X-Gm-Gg: ASbGncvd76O7cqyD107yqJ3hPchnJGC1sQt92NGrSgRx5txtBtYKSvpWoCeKL3VpbZc
	oOqmPXE26OlmmN5JrFu3o/Ga2zAeMm2MwsIWsbrPRDfF3znKdwo55Ir6QxqPfsAn7pFLBXP2flU
	V0QFgeMzjtDEmts3a58aMi2VKtC9mnhAtkH4cViBhnkj+2cGwRAu6KjWw0vff7J9qW6fx1299TM
	HT/4BFEUYPtV537uWvtCgFdwUrIO/kS8uERMX5p94C10yA50FUaG+4h82o5S/LDbvyg2y0ASKll
	WHCzLoULKiXwbbwgHfDH+eUYexVLrD1LQG0E0nnr7n+dkr+uEQrIuC6LYX5g7kJ6jbKA4tE=
X-Received: by 2002:a05:6a00:4b03:b0:748:34a4:ab13 with SMTP id d2e1a72fcca58-756e91399a9mr3454893b3a.6.1752652459704;
        Wed, 16 Jul 2025 00:54:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMaHAZay6FJjbVSrmvnJq5rdjl0VOhjN2ocwn2/dA4ha4qKow12hndyWKDDFwGGN4xY3Wx4Q==
X-Received: by 2002:a05:6a00:4b03:b0:748:34a4:ab13 with SMTP id d2e1a72fcca58-756e91399a9mr3454862b3a.6.1752652459177;
        Wed, 16 Jul 2025 00:54:19 -0700 (PDT)
Received: from [10.92.166.183] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06bd7sm13590795b3a.70.2025.07.16.00.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 00:54:18 -0700 (PDT)
Message-ID: <c13af350-3036-4b80-bfa9-0c3f02886fc5@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 13:24:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
 <2025071518-aware-tipping-4e27@gregkh>
 <arp6ujd3463lzrpi77e6sb5mwie3uzsyzildct3hkgkni7ozfb@zxomg4beii2b>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <arp6ujd3463lzrpi77e6sb5mwie3uzsyzildct3hkgkni7ozfb@zxomg4beii2b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA3MCBTYWx0ZWRfX8GrjJGtjxCCY
 GtcDNjIIkOVfAMhFpbXXMT/wmDK1oR8vOTz98fggtNMbwxCU+68S4+IwyCv6Ifb/7vTDR0VVX/l
 lJj22EnHbWebV/4VFMXrrk2HFzHd33Aii6kBajdrAl6ESFfeSRsi5VnLw7I8GbqFJffmVm7rMFk
 eDF5XrAHpld5RcI5aMKv4qwKpP3QuVUuV4AX+9rwco6dlNMo27cauXKT/C+W5fjJklbxzoelvHr
 OZwMd44T1hvvivs8Fva/EVv6F1O98+sLv2sapT5PZwiy3/pg8GPXKX5649/mCJBuM4TjnIBLOkq
 HJJk+Lu3aSoTDNHt1nplHODMYrnyw0a8gnXK/6rUFkznpKxsRENOuMqwT01co/Zk6NsdHYumZnn
 IoqRQQg7dhBlFYPDtMu2Oe+KODcMnkTtrIa/4KOYPV5qpMfgRL0yACwiKZVYU/ZtkRtoWolq
X-Proofpoint-ORIG-GUID: 2JUjszgikQ0VWP1GcXFlc1c9Rc8MC_ms
X-Proofpoint-GUID: 2JUjszgikQ0VWP1GcXFlc1c9Rc8MC_ms
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68775aad cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=oVqxdD7jYjwwTgy-nFwA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=998 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160070



On 7/15/2025 11:31 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 15, 2025 at 07:47:20PM +0200, Greg Kroah-Hartman wrote:
>> On Mon, Jul 14, 2025 at 10:17:02AM +0530, Krishna Kurapati wrote:
>>> Deprecate usage of extcon functionality from the glue driver. Now
>>> that the glue driver is a flattened implementation, all existing
>>> DTs would eventually move to new bindings. While doing so let them
>>> make use of role-switch/ typec frameworks to provide role data
>>> rather than using extcon.
>>

Hi Greg,

  Thanks for the comments. We wanted the users of these new bindings to 
start using role switch instead of extcon.

>> "Deprecate"?  Looks like you are just deleting all of this code, what is
>> going to break when this is removed?  Are there any in-kernel users of
>> it?

Currently, there are no in-kernel users of this new bindings using extcon.

>>
>>> On upstream, summary of targets/platforms using extcon is as follows:
>>>
>>> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
>>> effect on them.
>>
>> Ok, so those are fine, but:
>>
>>> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
>>> driver which relies on id/vbus gpios to inform role changes. This can be
>>> transitioned to role switch based driver (usb-conn-gpio) while flattening
>>> those platforms to move away from extcon and rely on role
>>> switching.
>>
>> When is that going to happen?  Where are those patches?
> 
> This should be better explained in the commit message, I agree here.
> 
> Krishna, please point out that existing extcon platforms use legacy glue
> driver (due to using legacy DT bindings), while this patch touches only
> the new ("flattened") DWC3 driver.
> 

Sure, will add it to commit message saying that there are no in-kernel 
extcon users of new bindings.

>>
>>> 3. The one target that uses dwc3 controller and extcon and is not based
>>> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
>>> This platform uses TI chip to provide extcon. If usb on this platform is
>>> being flattneed, then effort should be put in to define a usb-c-connector
>>> device in DT and make use of role switch functionality in TUSB320L driver.
>>
>> Again, when is that going to be changed?  We can't break in-kernel users
>> :(
>>

I think if someone is updating the bindings to flattened implementation, 
they need to use Type-C and role switching framework instead of extcon 
since this chip is a Typec port controller one.

Regards,
Krishna,

