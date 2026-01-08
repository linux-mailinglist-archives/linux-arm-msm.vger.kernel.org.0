Return-Path: <linux-arm-msm+bounces-87969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AEFD00E79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 04:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53F673020C6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 03:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAFD277CBF;
	Thu,  8 Jan 2026 03:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pykfSlC/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+jTPtEN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1342367A2
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 03:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767843778; cv=none; b=t+FUONtrk737JQtzIFiOQVAEo5u+R1Qzzd/RBSC1F4NA3KObsrNh7qWY1OofjTE2tA+xjvds9fkA9tuAaiDGfIC5ipaCepB6zVTG+fxjOBS0xecNTLYr4zTb79Br6341FHg+oiYQBTmpOkGFmIeHwQcqT97r3Wu/TXadnszcsh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767843778; c=relaxed/simple;
	bh=NctJ8MPpll2bE+ZY5Z5JQ7iUEuw5Cp2KDSNIagPzCBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6Wuf1YEMugpn2A0yC4Ifh6pirBVSLXx805ZYoKN8OvlohA5Ap8KgzETVvMuqtfl5cPYHN3xKz5L+Ax4LaLgk6TlwXwUx/As1z07g9+W2kanII9jks/nNFDe/tzp0AQx2ZnGUB2eDr94mHAGN99ipg2f4j+pTmOgzK38KjLN/O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pykfSlC/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+jTPtEN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HTTmZ3751427
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 03:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sU2Sk/joZdHWNbXOxz+NFQy9EA44nouEcmpGbgOYYBs=; b=pykfSlC/H0UqZGKC
	fwjQeUPoASsEXdEnuc0fifWNiQFr58KCxJlM9LZIRXzCXsGjDc3L6kxjZ9ggyvyG
	msyuA6lAcgkA5Hk3cAjK5jvdyq9uYjjIK2DcLlIEfcd9kngOQk8A7aFAAtRUzLGq
	7LZjZfU9AIehJVg2/tiA1O6mSmgQ9srpeoNKsaU17OZAgJjDPUfB58yCQIZzL8pe
	2gq0837HevwIjmHwK39cqW8/ww0ayMPM69MhRSmFzIQCc23aD+1wAQc5XcVVoTPa
	UfL4mUt26GWjmBYHb169dvmapcRsNmxApZEaWST9VVZO7BxmwOqD44XTH6MRUx/z
	eZ3FHA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcsq1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 03:42:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba92341f38so2900702b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 19:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767843776; x=1768448576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sU2Sk/joZdHWNbXOxz+NFQy9EA44nouEcmpGbgOYYBs=;
        b=K+jTPtENo4wQITpJF8AQcHiHqYTOIPd1Y5P5E85xy+aeWnizbXM5s/IrBMrpItyQxE
         IeoWbQAW4O1UNJWBivqS3mXQNbtdVy9+DfQGuLd3lVdITzAuX2O6rq3WSx1ggJHRge7F
         bT6+MgnSQRUfAJ8F3MYf/IrPQWUMOYCihZ3M/Y54EGdX39Xg8U2gDukeaVoqGtdXQC2O
         PV0AT0tW16L3eszCSSLvGVogjJQ3+/jU4dHGF16JJWKVwS1LrzBVnNizmP5r2k0ARbwk
         9nV4TTrbuHvNyOHoc7kQa0pAEMZgBn/XI+Xckw8aA+jXZVazofkoSaJrd9LZ3FbcjsSI
         NrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767843776; x=1768448576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sU2Sk/joZdHWNbXOxz+NFQy9EA44nouEcmpGbgOYYBs=;
        b=JHiuMFL4WDIx8d1LqKNs7fdRNAjIXKvi7Ih7qYmCM3+iTbCGIIfx29v2SE4hXmI7F0
         zYMdMe7gYHSclBZEdP1yqt9iGnUPXr+/DcRj9OhWtYb6+EmQgyiB30eJodIpbEyYKdQb
         moyaaKwWrcueKBsn8+VSIXhn+HF/3tgqbxtUK4LK80x5y7GHP3fFzivWGs2s18ByWsbj
         dLR94mA+va2tFIFFYIyP/RVgQzfFgRDnFgoVzrc1xg5/t36hFnc4xCAbCJAqnXpMh0C5
         m7YDzLCDysvHWAKkb9qtCBLbz72RMxbLaWDWN799ty0EYlDwaCFbSNbCxxmAFWYB25D5
         BGkw==
X-Forwarded-Encrypted: i=1; AJvYcCX1giz2JX0mjg1I0xNAOOjV6X+4lJTZki3wLje8McWfib/5bnAnpRi7G6OLkm73Pf/rYuk/pmwvzDyiPH0k@vger.kernel.org
X-Gm-Message-State: AOJu0YxAU+nVe514R1ry0ISrZOdYjxqcxKdckUhiKJKZWVYORHXHRhpQ
	BhRYTVWvmdbsAQyjjv7XuF7XNfIj64Me8grlrIxAey9/EEb1NUTV+3UM6zPzWHveJstxLBApa+J
	JP34p8Jn5qoNAVM4D9LFG4x3f7VZ0w05fsXPahPJwSi2w7ARW96VPt0QmGKxFBFlhUlGI
X-Gm-Gg: AY/fxX5cltI/ed3sph7CQbSDl7dwv8+X2Ej3CGD1qxPJ2Ex7sBka3d/rUPVvEij07vE
	rpWb5wFAeXAG5W7ze+yp3aMU3yPpFTEjyYywq3+J8cRtxOeD4xlsnWI2hHcQM6YOV65zNfCOaya
	/4Ui8Z3YhfCSWkh+vJDutBP/BnMpaN2gBtBz3/O0muQ9YCs70Ev3i6g6oUyPVsV1fCImglVnI8W
	/mYQc0l7J1zBRlzmw9J6jlw4m56U3llVZrKNObA4HIpHOK6+5Lq36810f/8NTrXIaMq33ed8tzS
	MWB3VQVllJecxfu+ddnIW9vQ8H9QhBrsFEKRP+CSCNroYEJn1SZA+Ba03inWU7hcMEeZFV79L4V
	6nkVs9aJ3agrbKif/fykVXcOg4siRxyiUd6X8yDrz
X-Received: by 2002:aa7:9e0c:0:b0:81c:96b7:7fb6 with SMTP id d2e1a72fcca58-81c96b79317mr1202685b3a.35.1767843775544;
        Wed, 07 Jan 2026 19:42:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5UcW7dtR5CuRWrHBzONACXx8SFxOD4Rlopg1hIDigD6UL/526+Xs2slaNmtNS8CMz0wiGnA==
X-Received: by 2002:aa7:9e0c:0:b0:81c:96b7:7fb6 with SMTP id d2e1a72fcca58-81c96b79317mr1202664b3a.35.1767843774883;
        Wed, 07 Jan 2026 19:42:54 -0800 (PST)
Received: from [192.168.1.2] ([49.204.107.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5de655bsm6175281b3a.60.2026.01.07.19.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 19:42:54 -0800 (PST)
Message-ID: <59be6427-1163-407e-9cfb-61fa258010e7@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:12:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom_geni: Fix BT failure regression on RB2
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        bryan.odonoghue@linaro.org, andersson@kernel.org, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20260107162610.1582626-1-praveen.talari@oss.qualcomm.com>
 <kgt7t2el7rpbdxrwhdsfnte6ja4pt3aruhbw6xb5hnehvyxxym@2pvcy76dyvwd>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <kgt7t2el7rpbdxrwhdsfnte6ja4pt3aruhbw6xb5hnehvyxxym@2pvcy76dyvwd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAyMyBTYWx0ZWRfXwqv7o9eW6SLl
 /3MTxYtj5+rFQhgvW4T6+bv/kEelNYSRmqSA119qSK/ddkYlaOEonR/8hjv8xqiY2KjwKowedCo
 pBXuV5v9Wi0Gm3Woc36nQHFX2fleP/bqNMuMy3UKr4AGjqQnE1d36P+67QY8gXKyIKQtmmxJq+7
 4/VmfSkuVBy5T1Mwl/PMKCWKeiENPbz05UyLm/im2acfZgLoTvE0XqY0lUoHdKkA2C9fpTTbU4C
 oDf7daD3FpzAkR0Z8CBEDpglHh8iNEHpcj+PUNQygJdtYV7JL/mNV9TPrdt9Gw/xqYWdhDn25Ya
 vn6OjOav/OwSkBKj2Qgcz1lt4HZI84dhrHm8rE1e1/VnH8vM6QW8xTEq3leNvDYJRBKv33810NS
 Cz9bTTlWOI6H5uqo4o4feQW4ruD45bEjjEkCsFm4IWqdZDEKabbQPAxPTp8u50ZSApelRxM23o2
 ig4UHfXR7lei63QXCjg==
X-Proofpoint-ORIG-GUID: DW0TkloiSiY6RdvqIW8ir8BUzkfA70Fy
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695f27c0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=+gEgXnvjvgnLECGlQBulyQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=WXs9VOiMqbt5e-qogh8A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: DW0TkloiSiY6RdvqIW8ir8BUzkfA70Fy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080023

Hi Dmistry,

Thank you for your inputs.

On 1/7/2026 11:11 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 07, 2026 at 09:56:10PM +0530, Praveen Talari wrote:
>> Commit 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial
>> driver") caused BT init to fail during bootup on the RB2 platform,
>> preventing proper BT initialization. However, BT works correctly after
>> bootup completes.
>>
>> The issue occurs when runtime PM is enabled and uart_add_one_port() is
>> called before wakeup IRQ setup. The uart_add_one_port() call activates
>> the device through runtime PM, which configures GPIOs to the "qup_x"
>> pinmux function during runtime resume. When wakeup IRQ registration
>> happens afterward using dev_pm_set_dedicated_wake_irq(), these GPIOs
>> are reset back to the "gpio" pinmux function, which impacts the RX GPIO
>> and leads to Bluetooth failures.
>>
>> Fix this by ensuring wakeup IRQ setup is completed before calling
>> uart_add_one_port() to prevent the pinmux function conflict.
>>
>> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Closes: https://lore.kernel.org/all/20251110101043.2108414-4-praveen.talari@oss.qualcomm.com/
>> Fixes: 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial driver")
> 
> The order of tags is odd. How can it be tested before being reported?
> I'd suggest the following order:
> - Fixes
> - Reported-by
> - Closes
> - Tested-by
> - Reviewed-by

Thank you for your inputs. Will do it in next patch.

Thanks,
Praveen Talari
> 
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>> v1 -> v2
>> - Updated commit text.
>> - Added Tested-by in commit text
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
> 
> With the tag order fixed:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 


