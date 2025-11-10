Return-Path: <linux-arm-msm+bounces-81019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B165C46D92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE8BF4E19D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35262EBB9C;
	Mon, 10 Nov 2025 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngCIZ6IZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx4To2D2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFF222579E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780932; cv=none; b=HFm0m19vVbGaFuY7x3qqPkDPVujpUrLvj/0PdjkPQDBplvvHS4a3eTIwbgxxe1swDyyvN5Gx0nJGKY5Vjitzom3XsebamZyKv1bNqgwf5P6MNzk/8z+E1tmE8rKmMSeBliJC6gt7MVOQQTmGMRqGCBaO0zpe9UkvuffWLeX1C9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780932; c=relaxed/simple;
	bh=MEnR2zX5puAIQkCSZiqLDP7yLlxvkF3Pzrw0yu66dDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4WgiSxMbQO7e9X+3PQPfBX8YVxvzQ+8DRGKKaZFEbzfp1O/DS93kcgzRgLoKPp3n6WDrQy3kot6WHvtyIAhAbOPeAlZjEZwwDi3N2RE7HhyNpWGAt1qW2swnt2bTDzXfEQjSw2Agd1A4Kt+zJnvP5hx/iea/DzjjvdYV/AQPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngCIZ6IZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx4To2D2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAAmOel2546907
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNQmS4jbwpplws3/GqBzTBGZxk17z/yI06N48KACXEA=; b=ngCIZ6IZdux4pNlz
	vnryMk3sbvEMOZU+reWLrD08JqPXu386diZPJEfB1xchGD9A33BxUYO1BxZv8o1N
	es8kr9DT/kR14PP+xXdiTP7VatdTVhSRes8TdhdGw3zdJtwjIE81sjHQokc4XGP1
	9aKjSTr5Nivon5u57+4oVoni6XZK2lmgYraKBEjCpEmHcXIZaiDWiDf581NFc0R5
	7mdQuob/QQ4dJuzgzS/GLHLe3sAUzkoGsDM14mWp0rUyOfStBJmMxBjjo8etwJt5
	gCZxjg8zYubR6SqaVoC/XUsDbhSe8GtsT4jYQvZ05RoKcATavjUmeGMAvne6LzIz
	H24phQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab8ea9jys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:22:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29555415c09so38353435ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762780929; x=1763385729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dNQmS4jbwpplws3/GqBzTBGZxk17z/yI06N48KACXEA=;
        b=Gx4To2D2VND/9Medu+PqGz2EqOBryFypFfgLi/xEMI7fjye6VWRaqsL046x3jFuZCJ
         aKhlmDGqr+KztLoZ35KHoOBt3MYLx9s1pMk9jUGmKcW3fHoabO2XdmwA1iB74WJaqEwu
         /o1fd3YG9d5Nnmai0sH2tqZQseY/EKHVseLK6djPjz87gAOrUHpy1YKTX4M2T8o57P0O
         aHZmIo/0CRtmpGGKHE3lJjgLARZYAgANCEEsbD6V2ig6ujHbBDdg4BqXmN58e8rdafZf
         zbepqFFXsDLC0r6KTnm3c2uxreZFe4RN5EV4J1mRon/r+3ZNvRPKYn2lWakCsBJH+m6v
         Tegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780929; x=1763385729;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNQmS4jbwpplws3/GqBzTBGZxk17z/yI06N48KACXEA=;
        b=wsOpd1PQUOZQrdS3FzT9zz5huO93sGJk70d9GtiVliOg+2T3DOsmISW9SD+1EnxEKH
         2FhP1muYQaZOVRk/+Mgk9Quu03CgYBI2ANNf57HitIxISnr1QQq6JHX/U5nG9obkTuY2
         Ct9TkdAtGAwWa3Pahq/p0gj4aQ/rIcCOVe8vO/jm+ll9QDeMAgXbHP3IpfYcmjduYIO+
         g0Z4z3o8IBJee1AnPBx0vMS+ESJcBX3Rr3cv9ZiBP2wNFaqKI1Oa/kX5Kd6Vzf8c1vGd
         KpXurgX/4DftVb3fNjZdt+ahX463VEX91DktCCbm2aOPN/2KhJQ0OJNpu9o3hZItCLVA
         BbWg==
X-Forwarded-Encrypted: i=1; AJvYcCXwham2kJ/Bbts7TL22hhfReJgDHF1kq8MjumtESWu09GL+4UTdFsumUGsT2GdpXRvBPzN9g59NCKSraHiA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9QpcpCaoRasvuNQ+SoDbt5FUmo+NHSabZWmuQsKj+jxcUibTr
	kowwQrbaACJ4TBztM1grq8qg9QSitD+Ff6uyDoUtWillt1CLkQ2KQKkDnANfY3GH8H9XjxHJLP1
	5ik+YJ3HtcGPtaCrI0wlD3c5mzrhGAhBN6IUGp+LF7qTgLIhlekUMWVZUZyhdY9b3jhXd
X-Gm-Gg: ASbGncs1vvDQn5z18ByrFP0DgBB8r0RH7z6JaJ1CYGlQJelRcH4lCuO/njSBwcALhcq
	/HjpeSsRyxmHVseHSb5wxQGPCZX0J0as40qskDBlEcOkOObQdnpt5uwELMbKjrEzkkA9ePKdfTF
	n3o8hhiTMRG7ix2hlZVhlZMZYGuw8nJp+1SwNZz2tV2HaeBtPDkyEUKneJrZGKgVQfXCvROwLKl
	tJy5jkXjHXh1MZZhMi4xBpwqYl9htzr4rPbjweWMhxB6QlH9//L6bpWhzWlCLsIj40u6Xjnopy7
	Us3CLx3/0/v0NMUOb8k/5Z0h/PDIwxmPr/iXwoXN6Cc/v8OlzgD64DcUIZ+Vbeyig9QDzQMitdM
	WqR73gaek+BG8wEjRuIt2KN2Mk+RGsNSe
X-Received: by 2002:a17:903:32cd:b0:295:2d76:72fe with SMTP id d9443c01a7336-297e56f9b16mr106607405ad.45.1762780928936;
        Mon, 10 Nov 2025 05:22:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3AZW8cePcCTipuquggBDwoFS11PQj8F9mPSOHc6aFTo8bPEdW1wKw0g++4ar8sj+Ro+Qf8A==
X-Received: by 2002:a17:903:32cd:b0:295:2d76:72fe with SMTP id d9443c01a7336-297e56f9b16mr106606915ad.45.1762780928388;
        Mon, 10 Nov 2025 05:22:08 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297e2484bfbsm82037535ad.26.2025.11.10.05.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:22:07 -0800 (PST)
Message-ID: <dfcd8bb5-7278-4345-6d17-1903aea3966a@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 18:51:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 02/12] power: reset: reboot-mode: Add firmware node
 based registration
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-2-46e085bca4cc@oss.qualcomm.com>
 <20251110131306.tkrsfqeh6oa7ql2c@hu-mojha-hyd.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20251110131306.tkrsfqeh6oa7ql2c@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4h6QA7yuXIeMuWvOYr4HAPGtEfe9k8Ht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNyBTYWx0ZWRfXw9C85f+pLf9O
 QCHdkUEbHSqK3Azj9QRmnozIZ3VUlXo5acM+wU0v7kq4LGKjrSV6pzLDKEeOXV+TJ0Yy7CVAecy
 BomW5C52VLPYRKp1i74osaIfm+CNV02B02UHvisg6dXKtpBGzynWQ9YvSw1bIxVPjx3B/t/QUrL
 jAXWIgxWwC0VkfXzH1vxAvd3Z9nzvBRGpglbuMJ6jJLAVkdaA1XlrJ5IuprdaADrv6TeTw8BKj1
 QWlxVoh79gF/wNtYoDQiBqQyfvC3omtfLr64Wl1p7CspB/k6DqKO7SpGV0rekMJ90EzQ/k/V8h4
 ri4tjgKjtnPg/EUdzzwErsT70193Ej+H9vmLzuotz59X3n51xQ2vXNpLubNrRZWjoLCs/rmEhOA
 BisRin7Tmpu4CMqaADd2WnesHCgLfg==
X-Proofpoint-ORIG-GUID: 4h6QA7yuXIeMuWvOYr4HAPGtEfe9k8Ht
X-Authority-Analysis: v=2.4 cv=QLxlhwLL c=1 sm=1 tr=0 ts=6911e702 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=O8xs1vKCwhjr2-LdiPMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100117



On 11/10/2025 6:43 PM, Mukesh Ojha wrote:
> On Sun, Nov 09, 2025 at 08:07:15PM +0530, Shivendra Pratap wrote:
>> The reboot-mode driver does not have a strict requirement for
>> device-based registration. It primarily uses the device's of_node
>> to read mode-<cmd> properties.
>>
>> Remove the dependency on struct device and introduce support for
>> firmware node (fwnode) based registration. This enables drivers
>> that are not associated with a struct device to leverage the
>> reboot-mode framework.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 19 ++++++++++++++++---
>>  include/linux/reboot-mode.h       |  4 +++-
>>  2 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index ac4223794083f36960b2bd37a601b7e1f1872de5..eff60d6e04df2cb84ba59d38512654336f272f8a 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -8,10 +8,12 @@
>>  #include <linux/device.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>> +#include <linux/list.h>
> 
> nit: Looks like stray change and belongs to other patch

Ack.

thanks,
Shivendra

