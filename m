Return-Path: <linux-arm-msm+bounces-72244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E79B45459
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A2221C80547
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC982D47E9;
	Fri,  5 Sep 2025 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQOqg39a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8AC2D5C76
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067497; cv=none; b=bvi/TRAjwsvh7mO51b91T9jWpZBMY2a+hcP9TQJM3oXsKIfS78GFQQATDpntdm2TN2mVJuPp8FZ4m4OvyJSRMgb1+BVnltsIv30t5bVicUzQUJUeDj/pns22Jx77upGh963Y+2xcKIQTKJ1Zi9nSLmRwaPHC/C41MF4tLBShrtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067497; c=relaxed/simple;
	bh=ABIur89UaUQH4iZhJ+8yg3G7Bz9ucP0nEgnuQpXKwug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FsxprE6gcpX3bAxsaCE6xmeeSLOSLziBGvPPlgZ4vWsNqFiY9++34y4M3RCeofeFHDxn74QayABtWWAuRQ7xCUE8gbwmQb7FgeH4drIHwvkcfCWRQRLm4hHxvS+O8s5yOHlpoGP/gfcyCIbvf+Z9AZSD/rYH4sFTvLPq3UJi8OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQOqg39a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856dIui023895
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 10:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/gSGlaIzRrQ1UraurtZ6p5ivpZcdKP5Wh2vnAwoGro=; b=DQOqg39aApWu6FTB
	f21EDHdaRmdaVRIupxSUQpQELbNVMqW0EdY7poiLjg/hn1vpJkab76h+bo6I97NV
	RMBv8hCjllImFopK2GstBG4XQ3+UMF6ho7Us1gUoJzGf+FiNS3yHVOP/pEZ4bs88
	0JzpFSSpyqLnDDj2dc+9eU11mNNnaPBTh/fRRYUQr4UO48kqs/dnI26g72v48Ju3
	OFLHG579QUPkqzjyUTgFq6Qh/ap+RsAvy8V/gViWMPb/qfFVCDanjM2wEpb6OPM5
	1SjlIwkT4VXAu1Pw8pSF3EdF5jzbevDWUAS3Qg3WsjXFaLvRfJ9vi6D0L/z+Q9tN
	NnZ5+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2ftmkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 10:18:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3037bd983so9484091cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067494; x=1757672294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/gSGlaIzRrQ1UraurtZ6p5ivpZcdKP5Wh2vnAwoGro=;
        b=Gt+UlEq74/5OfMy/8t3y+apLzgTj3NEzkhxTlLWzX3x8STDsnc18joM48jkIjZV8zi
         BqqbZPBNl1Xuxq2ArqylaR1YABgdiEoD5wH6X5kO8La3u1ra4qE6npcdc7KhWbbLbnVx
         3o0ht5uxLE4FrmAGlymXaF+im3L8tS09j/X+CWtZylkvgzBjtP6yAemr+bN6AsFFz67k
         dA2Kl3Uj5yUksTHQ17lVB5OyBgeNcax8yvr3N9/W1+1Gtlpy8W0QO45oGmcmp76QFkyN
         i2ekd83mHAlnQpD6N3s9HYFwYbONusllEECq+kUaFRx+JY0/+2YLlxHnmbjB502BkDR6
         KuJw==
X-Forwarded-Encrypted: i=1; AJvYcCXnbgmrkADXrIIT1YLtN1sg9Uuz6TKCvqgoclYu4CdztjUDF5gBBVyIfvxOv38jdoIwpCIjWUdwDwCZQtB4@vger.kernel.org
X-Gm-Message-State: AOJu0YxE9l9bFx2CMPNiPgmx+SoVgK99XygF9N7n2i4V3ZPmNscuK0Nz
	Kzv1ydibU0yM7le13JPBsl1vInK6WJYf5aTWR6/qfhJRZiAHYh28qpO8TtGVanecCx1NLXeFx7b
	cmGFZTRwZk2dAWYWJNiw4soHWxvzfV8Vb7H1JlkJFng1uMlKENwNjPAwZq1gjVnxtRB+h
X-Gm-Gg: ASbGncv62mq0fxtN7zQeK2RceNiDeY6jyP08FamNxKdfV2Y3rWT/Y9VQuocxj0FRnAl
	Z+d8plRqMR+tF1Pti7JbZeZu7IktR0hrlK+AYfhhT2BYnXhZNexR5J7uiRddkWjyPld7xJ6jHDT
	rAd3qrWp5H/IBwlD16/GI8qZ2e03GKNMYjD/A0T/Y7UDpZudXBPdQMIBCZXYLA0KJyZxe50kMEo
	Bp7uZ7Ud48abESDtb3HINH6fuxiaDcFPhF9aX83Ws3BOR5iPgwL5JK+eDeQByokaTKI42ncT1Uy
	UGOrAH6Im9JGRJDmCsn8NQKFHlLd93dZkcjxx+TsA9pt7jTA39AiKvQCeTpo
X-Received: by 2002:ac8:5d12:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b313f0e6e7mr209821081cf.8.1757067493859;
        Fri, 05 Sep 2025 03:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm0GDPluBTH8wXrFIv4L7Am13spyB96fU1sGLB+ZWmCx8jJQENGynGmk9e8TYrCKMaZBJvQw==
X-Received: by 2002:ac8:5d12:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b313f0e6e7mr209820761cf.8.1757067493074;
        Fri, 05 Sep 2025 03:18:13 -0700 (PDT)
Received: from [192.168.149.223] ([78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-621295d635asm1546531a12.40.2025.09.05.03.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:18:12 -0700 (PDT)
Message-ID: <e7f0b014-3dec-4276-a2dd-479d4248c7e6@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 12:18:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250904001014.GA3405605-robh@kernel.org>
 <a547ecce-31c7-4627-ac6f-aeeef81bd0ff@oss.qualcomm.com>
 <CAL_JsqKuoJrkActpLXVUW9e9=R1FESUbD_rwBd5NGX2_Yv2ASw@mail.gmail.com>
 <99cacf08-0fb4-4b44-9036-96ea5fe01c10@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <99cacf08-0fb4-4b44-9036-96ea5fe01c10@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX9fcTIMlxtha2
 729Wpt7nfTajXUzwFxZ1tNVoykDTwUzGpzOrj/LqxVA5QEUmcyPSo0pMV67k9VDTv8VV3mlXvV/
 aUM6iVAwl6mesxK440gHgN4adGF4Ayp67BGLtcv2Y39cIGGEpsmciOonLUwVuC6gh/U/jMQb+CI
 3RBrGSlfSWpgJnTU14JeaxdWd8l98AeCudkUXz4qJ78ozGDTddXrsUejPAMRvn9pSupSW8zD+BP
 f002cy4mDNCkINCD4gPnUFVGp32BxPbFe3XIaGlhasb6YM57asjpjQMVJzDGuX++GxX96G1si8F
 Pupj1Z8onQA5CofcT9hgKoHVLddzycldmtNAO8G3o7V5Z+6/qC2u/+og8PYhMG36NcEU2qgAiow
 Y3nQGpRY
X-Proofpoint-ORIG-GUID: hc5d0Oauuj9A1qLYl4JjBTZHC-VNgktf
X-Proofpoint-GUID: hc5d0Oauuj9A1qLYl4JjBTZHC-VNgktf
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68bab8e7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=GTJIHFHLksMJQnmeIaAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 9/5/25 2:00 AM, Pavan Kondeti wrote:
> On Thu, Sep 04, 2025 at 05:51:24PM -0500, Rob Herring wrote:
>>>>
>>>> Why can't you probe by trying to see if watchdog smc call succeeds to
>>>> see if there is a watchdog? Then you don't need DT for it.
>>>
>>> There apparently isn't a good way to tell from a running system whether
>>> Gunyah is present, unless you make a smc call (which could in theory be
>>> parsed by something else, say a different hypervisor..), but then this
>>> patch only introduces the watchdog interface, without all the cruft that
>>> would actually let us identify the hypervisor, get its version ID and
>>> perform sanity checks..
>>
>> IIRC, last time we got just a gunyah node. Now it's that plus a
>> watchdog. What's next? I'm not really a fan of $soc_vendor hypervisor
>> interfaces. I doubt anyone else is either. We have all sorts of
>> standard interfaces already between virtio, vfio, EFI, SCMI, PSCI,
>> etc. Can we please not abuse DT with $soc_vendor hypervisor devices.
>>
> 
> We are trying to make the watchdog work with existing SoCs, so we are
> sticking with the existing interfaces. The newer devices will not
> necessarily need DT to probe hypervisor interfaces.
> 
> To answer your question on why can't you probe watchdog smc call to see
> if there is a watchdog. Yes, we can do that. It is just that we won't be
> able to support pre-timeout IRQ. This IRQ is optional for watchdog
> functionality, so this is something we can explore.

FWIW Rob, we moved on to SBSA watchdog on newer Gunyah releases..
Which is not ideal as it's still over MMIO, but there's some
progress

I'm not a fan of including the hypervisor in the picture, but as
Pavan said above, we're trying to squeeze the least amount of hacks
necessary to get the most out of existing platforms (i.e. ones which
will not get newer Gunyah).

Perhaps we could extend the MSM KPSS watchdog driver (which pokes at
the physical watchdog on the SoC and whose DT node represents
"reality") and have it attempt to make the SMC call early during probe,
making way for both physical and virt configurations without additional
dt alterations..

Konrad

