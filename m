Return-Path: <linux-arm-msm+bounces-70629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFE4B33F02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE12448803E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4142E2DFE;
	Mon, 25 Aug 2025 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aADJZSdy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BB926B77D
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123893; cv=none; b=HAsaEZuNOe+o51guATFLMZIxC8RF+sMzPDCJhWsbcjCscKPQjcMRGrQwiPARk1vQ+LHW4qrd6df63o6UqhDuibYHK7Zrh+VViw3jlg0JexRFJ3ywKfJZf294Pd43xx0Ndpx5fcgG72h8Bg0CvhyqtssbJEgDi+FFkJ3ugytKLjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123893; c=relaxed/simple;
	bh=vLlamXWBSQHZZ9eA+LhLnoR7PU3S7eCIzBFd9n5LXu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ci8CS2VL2//EAAptO0349oXWRNXNiysoZfhjb5GPmcrjZADflBs5zJ3BPcVkkLqs2lf6orZzkQadGcxMf5XtP3uWyRIN63cJ7mJQIkHatAA6etp3Ow63kr3SuMgalRw74REjNVDP7HCHNUnkn7Zk/9wkwwHuuyuwQOx6ZW742rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aADJZSdy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8arBV006049
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 12:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7FbX2s1S4G/T5+nXuI9tHeqbBremko5yoicVgE1dm0=; b=aADJZSdyewjEcbpR
	8APYbLYYmxKu8hAklV8H6/dlFHPjgjuJLwsR7U64gf4WGjHRho+DrgAOvf0XKHsR
	p3vgT5K2ULIQypyMmxb6fAIl0Wr2txBP65kwFgq2l0VjuYDTJywR2o0ovJYd2Jj5
	4UyjBywzESyMFfS6j/ke9QtODvmwHi6cTNJPWw+s7k9A3JbeyAf1KTUj32hFUitk
	fkujqXvu6p5sJpzsFPgnH0z55Bcg/oJLDJ9Ztlj0dFNg+1Bs92OmHugOG7PKHILC
	D9r7I2XjKWmqWPFPDQ26MrglaZRHDT/fkQZkkC68kYt8PmySts3+UMW1pbjrX/Ym
	nWqosw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thvyx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 12:11:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3235e45b815so5115842a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 05:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756123890; x=1756728690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7FbX2s1S4G/T5+nXuI9tHeqbBremko5yoicVgE1dm0=;
        b=n9/jZdgL/G+2fUiK/sMCz3Vo34BcpY5ll/X2ttPy/NOctqnYDIZH+asYMjRveN414i
         evFpeytV9HCbtwZBfaj9wRPNXVc7D5T8xyFYQWS8lo6gVjR9QYuHdyO8cainlRBap9eo
         V7Hs/A5jmnPFtPSI18LH1v9vWuCu2noUXjyu7ZXeVCYAm07FhapgbTgei3IVGtyYI2y3
         Mu+9DH1L/+1aAt1JzQgdsHGFxOGze3UhdKK3uaxELFPlYYVw/5CvXgClKyA9KesVPz3M
         q0VatyK2axZz30xBkCP7t49Rep0Jjx54nuEpiKzuaAO3NV9/A5D3FByaKBMOfBNBZwFk
         RRnw==
X-Gm-Message-State: AOJu0YzIAc/3nHu2ooFseISBONBZx4zRXz429jhf4EXHMc1m5FnUOeXm
	qyROkko54Jx5baRJv4b0yCDjBNEvlUea4iY5D+vSntUYgGF5eu2EmI9/JWoSilSX/DkU2bzZ1Vm
	3ms0OI8PCExFI8vOMVFPOr97WUmfC70jRP1hSYtPnwOFn6WVc/CakPD3wP9KvcVJ+QQM9
X-Gm-Gg: ASbGncvLp7XULkmCEp3BL8SI/AW/4OZmz6SDSDaiATKVQAAYAIP1rQuX1qS95AReUSS
	VdEgU0b4zgtakgDoQwphalFKrMRDvVXksdSq1Em8VKKepynjhpSwqy18R1urjg/vqrODSdnYRGb
	sdpwI1DY4eLnT9boA3CFCQjNgO4e9eC5q1XZuE53E2ywanPTbVRsxiPOjJ3RadfGWh6ZrC4llAH
	cTTDIQPGVObqqB+ZH6y1Ho6b1SYCM5nSvI1/Eymkvps/Wb+Y3odpOkddNkQm89MSeuOZatyWm2g
	VE4LhANp4LIuVIscSkkAlcoWsdtxUYVOhrJkDgnJ0Luo83HABNU7Qb6JEBiX7/jH+KAdVaAN4To
	PPk1e/Fw=
X-Received: by 2002:a17:90b:6cd:b0:325:941c:ccb0 with SMTP id 98e67ed59e1d1-325941cd8c0mr5253222a91.34.1756123890312;
        Mon, 25 Aug 2025 05:11:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx8YCW4yGPKF6jpJ2B5L1bLxQQVF62NjexUICV5/Sy9Jos1/wYUBHlSFW4Imyg6eG8ezQ0Cw==
X-Received: by 2002:a17:90b:6cd:b0:325:941c:ccb0 with SMTP id 98e67ed59e1d1-325941cd8c0mr5253186a91.34.1756123889839;
        Mon, 25 Aug 2025 05:11:29 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.82.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254aa63da6sm7046778a91.20.2025.08.25.05.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:11:29 -0700 (PDT)
Message-ID: <f5069582-d245-491f-913f-7488227605da@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 17:41:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 0/4] Add support to read the restart reason
 from IMEM
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <175493766109.138281.3436384432329568509.b4-ty@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <175493766109.138281.3436384432329568509.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX7UWxre21vWgG
 /MXqR8ldIcsQq3ysUMsUfJrO97pmgCDsGJb2yeEOHpQ/IRiBnMw9yX/fizga8Djb8+HqZ0Iz0Kp
 sc+xDTB1B43zhZPLiYVe6luiQf78u/RGk0CG54/cVm6NtI23oShwWlUMSJBW8Q6RUe+xa7yyMIi
 6tz7RG6mYsMUzyKWvBm+Eb3w+k+AF1Pvl9RdhqQlEhneVwMm58NmpgbP/RYOuISuG8Ay5IWCuu/
 Cl+UMntly29KKsdE7ehKXKyzRmx2CKvpoNK8b7dlGPwIW9y6bGYlqpCtanCZ70Vsf7uF7bKt1jB
 gaDwaZRd9I6FoEC7avjpZcvokz8a1LEByDVi9Pxoj13jLMIawYgGPkVOLJADAXc3Tms/WQHKU3o
 BwUHT3Gk
X-Proofpoint-ORIG-GUID: qnNapRbDdSmlj4mJ74Tv_ZIRVhZ_ee7m
X-Proofpoint-GUID: qnNapRbDdSmlj4mJ74Tv_ZIRVhZ_ee7m
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac52f3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=qL8JkhX1/0pBNNwer7kOkw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=cSn2wggv2xD2pGh0t4sA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043


On 8/12/2025 12:10 AM, Bjorn Andersson wrote:
> On Fri, 02 May 2025 18:47:48 +0530, Kathiravan Thirumoorthy wrote:
>> In Qualcomm IPQ SoC, if the system is rebooted due to the watchdog
>> timeout, there is no way to identify it. Current approach of checking
>> the EXPIRED_STATUS in WDT_STS is not working.
>>
>> To achieve this, if the system is rebooted due to watchdog timeout, the
>> information is captured in the IMEM by the bootloader (along with other
>> reason codes as well).
>>
>> [...]
> Applied, thanks!
>
> [1/4] dt-bindings: sram: qcom,imem: Document IPQ5424 compatible
>        commit: 3fa1095979393d5b178264cc1bdfb473e80ab774


Bjorn, IIUC, based on the discussion [1], moving forward we should 
describe the IMEM as "mmio-sram" rather than the "syscon" or 
"simple-mfd". So we need to drop this change from tree.

[1] 
https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/


>
> Best regards,

