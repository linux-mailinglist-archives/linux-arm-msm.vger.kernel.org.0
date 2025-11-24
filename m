Return-Path: <linux-arm-msm+bounces-83135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B01C82BC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 23:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DA5C3ABA4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 22:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE48627144B;
	Mon, 24 Nov 2025 22:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6sLIVRM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74B2253EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764024473; cv=none; b=rzj86RkIo78xJRluCZ6pArmU52k7Kfm6FL5PrXE8cho/ovp77DvC7JNFWi3xyA26RALIfigvqeQnJ9TzmTWUku8ioZZz5iLU8AiJYr9Uj5xMi+lRJKj0pGACcaodi4y8D2+4wQ1qaqPc+cGrzYR+QhU4fMaLgnAW4VDxjOkv5qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764024473; c=relaxed/simple;
	bh=aA1YUuC43wocVJj+6NswUWK8Q5/HyZu5I5uveCK5vyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XbIfQr96ftpMHBbkuY33wJd5Li0pEb4LpT9rdduMpQ/tLsxsKvLzi7/+y8P+pmNCKGZG06JmqBwA1cqfmpa8PpqdqbVSxrfHe3/YmWYAwl4AbFoU+JrS5+otH/kauZZyKyzSXrKreT80TfH5s/qkSFUShf2MB74pe6WxI/4RVos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6sLIVRM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so5799673b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764024471; x=1764629271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6e3N2N50lDJoWd8HR2Vtb36h0pURk4NZSWfVy+aqbs0=;
        b=j6sLIVRMwVa9MaNIEl9vbhIoJHK8k48Vu/GvFQjnyJG0AwrcFlXYGhnfT8YhSQX4YS
         bCI21BE1Z2vmkm3dlGIrILxwpm6b3fIf4OYs9kKQl0WAz5iOFPxrzf+kijjZyn3kcErU
         abnF7E3uZEiXdv7eIetcrX32wyv+HM6Sd9zXc9ZGqq+UUdTClpv9aGeO3AsPzjW5bjKh
         J+UpzlB93JWYAvbF86L/rGolOyehdNvUKGNIIFVqk22weB3upQTkukE48BlY+msHfbDb
         65umKlJyhlsG7WEwDgvVnBRbA/kGCiN6UurfuMD9bNZrX5LW8ecHkKpbbgHSeGuuwQhc
         ZASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764024471; x=1764629271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6e3N2N50lDJoWd8HR2Vtb36h0pURk4NZSWfVy+aqbs0=;
        b=ReRWTSbjXTbfjSYPpUXkE3v0yLQXsWYtOaXlmEI0A+/iMCgrb0+N6prhQPmsLEginZ
         EpE+VYLlPeH3hDSxO4oys58xYLk2lkN8LTy4hMqsJFmXYnocJE02F7oTikDZpZZ7BHvH
         qH3LOmP63cVRcstCJB3pH185kJc7OTQGrdctnhlwWUglCVGKXBhtHxVts+2uPWzW1o/o
         jg1iymurC1Sqso64ve5k0LCithLsDA5X1KX4osWKjXuKM7NVY4CwdldsjIWCNT8oTa1y
         fTNYgvMSo7kREhf0nz+eHClLRvHMZqq94hSrf868S2PFsJEKjENlYOqDB2cvU+/FBZ5S
         wLlA==
X-Gm-Message-State: AOJu0YzAqMlhdRA/IouPnpONU4oZ4V4t8uJt7Du53Ot+0jP6HaWyQyXQ
	LN3GbV5MP3zyhAEmVf50kf3U0D2F557TqDXagwzWgfqDqSoAAOHlhWCn
X-Gm-Gg: ASbGncszVSkobpiEsbXK2yLwzD1wHD9PzKgnEr2a10ExZFsOv0bhrDTzE5j5ak+4GaZ
	pXezNfAldawnHS+B6W4wMsWfYkB/ckrz7uxEkJ9Vge3jSmctrweCyYhqZ3hfnNvarnH0t/opoFe
	RC8rabEHG4lVEOXnY/BbC8zIaBhBFmz36NJloQhU4dmKtcAW6X5a+96AhFA+zNfEM0a51Qkc6Vf
	CkqIlmaFmY9FfM2RVuRK1ChnqFxMmXMlget4NgpNBq/9VvasYCfpAHhxGSxDBHEi1XT7q+GoOgp
	kHYk/Wj90qyq26fYZo/JmmFHiHNE63RcsDCx8vl6ijs0yv3XfN7L2Sfd0876xFBZvp/8QUUJJbG
	uaEN+syut/MAYeLQeWLZ+6mPbgjZmTGKwghwKO13Dg4VA15FlK661Fr0DYMIguqlYua0MU1+fhy
	vOScMQaN6GUpJkGUIUbW0k74RidQA5uxx2u7K7+Qz4mPJjc1TalxSrZQ1Sz+2RS0BL
X-Google-Smtp-Source: AGHT+IGH6IqlruzANVtCT25Q+8rULkZQZIvff4WTLqlZgY+442DpZenW6IpY+Xhp3eFvitb70kqLTA==
X-Received: by 2002:a05:7022:2390:b0:11b:2de8:6271 with SMTP id a92af1059eb24-11c9d8635bcmr10491404c88.39.1764024470297;
        Mon, 24 Nov 2025 14:47:50 -0800 (PST)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11cc631c236sm1964112c88.7.2025.11.24.14.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 14:47:49 -0800 (PST)
Message-ID: <c68cb4ca-61b4-419a-a4b0-b4d9f77cee4c@gmail.com>
Date: Mon, 24 Nov 2025 14:47:49 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] ARM: dts: qcom: msm8960: expressatt: Add
 Accelerometer
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
 <20251122-expressatt_nfc_accel_magn_light-v3-5-78d198632360@gmail.com>
 <a6b824d8-9299-475f-bedf-c75d0912e538@oss.qualcomm.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <a6b824d8-9299-475f-bedf-c75d0912e538@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/24/25 02:31, Konrad Dybcio wrote:
> On 11/23/25 7:44 AM, Rudraksha Gupta via B4 Relay wrote:
>> From: Rudraksha Gupta <guptarud@gmail.com>
>>
>> Add the Bosch Accelerometer.
>>
>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>> ---
> I'm assuming this essentially means "the default settings (no
> mount matrix) work out fine"

I initially thought so... but I recently discovered monitor-sensor:

https://gitlab.freedesktop.org/hadess/iio-sensor-proxy


And it turns out that my testing is wrong. Will send another revision 
with the updated mount-matrix and fixing a driver nullptr bug.


>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

