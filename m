Return-Path: <linux-arm-msm+bounces-87360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6FBCF1BD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 04:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECA7A3025FAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 03:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620963203AB;
	Mon,  5 Jan 2026 03:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlidGvy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTFl2tS5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6169F320393
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 03:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767584182; cv=none; b=AtSH2wiWAecd57R4FCFWW5vI5LwF5wd7RP2dXaBuAnWXxON/88mIDAEMbUCpSlXxC32z1EKsbpInfm30HW+mZ/tMF3FhrU/pBeqCSx/TGguKhIxwgQkkEtlaZxng2UP61Mh2iYjGlAFpOsMzLUnQiVkRmovWMS0HshObM09cNFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767584182; c=relaxed/simple;
	bh=RK3mM+JyW4Cnvvc6n/DM00kKog3bKewO3ETWD1g4amI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPMRZHW6dmOU72JZBh/9oYT1NuHCt+ZACSNZncDvNgIpxVNKe+PrltCGVM/EZ/aC+gss2ZcovxpBcTdCiY96vcE7HDn8W04bHITTMbw1uXkovVx4UVV1oELbaoMd4dzU53hn33Mo6jEoJUj3bHQleJUcxpOxX1/8cPYeBeNHXoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlidGvy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTFl2tS5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6053Enxq3541362
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 03:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jjx6sjiI6K21BuWUx0qBdRxfRjPTICLiJZHLgsGwlsk=; b=QlidGvy7VaDjk/Y1
	NApr5qoNNV7mjJsV0lywGMPqxjVHJHLowohwZ8PrWMtrUGH37xWV6Smm+x2tftzK
	c8P7EPE2a0zrPIZ90CQTLJmKudfxh/MiNLQcpoEaYBh/CI2RtiidgnMcOChUNeTR
	IdwjsuGT3hCl533N0KT51zmNq6GO4h+TewUt80IVRDKsEc6swxcX6rKNa3t0oLyE
	0WkXpYOnhFqo1Z9AOKd9l3bgpWBEjb2cHsPzBLXOc3OqXpw4VS0Jo1RY1V5X0LF9
	/tBDtHqFkRsfYaGTN3GHmm1v3b9S3gZr9GfsdVQyBCcoRfbhkDsBHv+m+zLN+Ek7
	nXIdpQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57sg1ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 03:36:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471737e673so17507161a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 19:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767584178; x=1768188978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jjx6sjiI6K21BuWUx0qBdRxfRjPTICLiJZHLgsGwlsk=;
        b=fTFl2tS5oPnH0Iy1UuhTeCmoy1JTsqdmzfE3DF+v+lluEzfS0Tl04rzW1e/toi5toX
         4UrCZmw9/Dj3+It2lysQtK2CldFh6SPjqeloTQpbD3FEpfcwzBl6kgDnL+vlwEqDM0Kq
         pqO5WWQEkAkjL1Pa44DMQarVT3RKKHpMn7T7+U82SUjaOnfRBKs0M5GZA7+qmuuOZpL5
         qTQPZ1p6XOHFC1TXNnXbazsU3QhUb1Vih0Qjc1B2beqQTcF9DLhn4OjBQzbWXoiK0tQF
         ugKihlff+sbHhKEeZkR/nyr15SLimhzZEXvQ1b/UqMUGPGaA+7Njs0N7wFHhlLDmFH9M
         bl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767584178; x=1768188978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jjx6sjiI6K21BuWUx0qBdRxfRjPTICLiJZHLgsGwlsk=;
        b=LVkQGJ/3e2pH5dS5+XgpItstgnjDAmhGWWJOGglJ+sSX0n04y8CfjIGMGyOoE3YCPM
         LDgozmeJ3mdYm4VyBFQ9Y7imvBnkQropLDc4Ep46W4fCKUPuNrmCdn3Tcyu334qMn5NP
         QxwunTP8rnnEfD5u7zAEnPC9N6r5QBRFrDRsfCesIIevYo/KMdUUdB+zHFKnpjtSG3u0
         Lqv0OoaFcUNwdS3zfN9h2JDFLuqS3R8Tn14lRVAnVwNHSR5wU23um8v8BFNJyLMU+t1U
         kr+SX516mGJEnK/E/ealkopNlAvSxXl/D8b8wlp5Swblx7RODEgybYF54/1kgS8Dx15E
         f3dg==
X-Forwarded-Encrypted: i=1; AJvYcCUQmuvHBhmkKe0qq+5Wtt9ezXs/ERhTH8LUapF9XW0h4xVYbhCkXiniJE0aMlhBg+Mm/U3y0q9ogQLSbLU0@vger.kernel.org
X-Gm-Message-State: AOJu0YzDobMNe6kSUhEyPqrcc/NC6cTLf/dkQv8aNs/9Ea1GeBe/Qrt+
	oytznGfmAtuy9EeACdUAzZmqMYyAXAe35pwNSfo4bQrERqeg6ZlZsg4F50xPNlorKj84kCqrj46
	ZZ0nkStyhhuAN0p/ZoolzLJZEDKSwLJPdYHNFyFsy9xnKvXWXtnZZtmokMYoF/j3jPhht
X-Gm-Gg: AY/fxX6BjeoTucoIbiZwoy9bbPzHpsbSm4jBI9k0rLkCDUKsRG/1WCmBZ54i9uHVE4/
	kpFnDmltNn+gRLnBgaY5R1CWQtSM111c01Wy3L6Ncp2mQVw5ZAS6VSbwZoho8r/mRkF2xV9XezW
	h43sQ33SD3px4CyqWbDAniyCBDeZ6FwJUAcI6al5uJzXYALQJ+ddO4OathL07kLeaJJCmKw54lY
	Yd4/G4Zxg0VjeBgn4AkQ/lC4LXvm32B67BO5KT26e2Hf/fN2rtVyMNvkeWONPMrRTou9t5miu42
	s0udfNSMtfJUMQDAC7YgUWnSQ4s3pBWj0+uNHZ31k6MWnHASyOLxDfQR4esdOJS+h497ZAKif9g
	Y6hSokAqecZD4TQQgfuGlQjJR0C2dC5V7B2+8KUfVRr2lf5LIKd5Zb97mFnwPW48V
X-Received: by 2002:a05:7022:6290:b0:11a:4016:4491 with SMTP id a92af1059eb24-121722e1205mr54700719c88.24.1767584177739;
        Sun, 04 Jan 2026 19:36:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5btsRlhlcTOBkTuAvXfkwyaAUU+fgoiuLOy1yCZxWtMb/49h7AYDyvyO1x2PD1mAyS6iVwQ==
X-Received: by 2002:a05:7022:6290:b0:11a:4016:4491 with SMTP id a92af1059eb24-121722e1205mr54700694c88.24.1767584177093;
        Sun, 04 Jan 2026 19:36:17 -0800 (PST)
Received: from [10.110.40.60] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm164772468c88.9.2026.01.04.19.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 19:36:16 -0800 (PST)
Message-ID: <4d9c38b2-d2c7-49a0-8034-e7874e000466@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 11:36:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com>
 <20251231075817.2611848-3-shuai.zhang@oss.qualcomm.com>
 <wxfba3ldef52mwuhthyh76qd3ppmmhmhuzhck3yziju2iil2vy@6elo3tzkjdvq>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <wxfba3ldef52mwuhthyh76qd3ppmmhmhuzhck3yziju2iil2vy@6elo3tzkjdvq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695b31b2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n7h1oodGu2A6BxIyKk0A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDAzMSBTYWx0ZWRfX3X1tnm6uVm8L
 wMwdveTtqRsl9wjTWArhl12zA9kbqreCICQYwMFjfxQUb1YIdPFQQYoX7wydrvnM5sZ/zZUMfrW
 uxDmxyes5dzU8QBO81DlTb/2qBCjSlwtxA8k+Gckpqwf9gQNQ5Sxbu7wd8QkzZbXwvqT39aQIaR
 pOcrGcCjQu1UTFxFU2A2wL0qXq9Umtha43ZibMU8QfxT0va09oZ7kKiuhQwpzoYxwjyq581GQ96
 QVQjh28kUiK+EheSfEeJNFu+dtvgLDGua30PuUkMoccl7RXzV/Qo70W7YoSi5wu+080AsFRdgGD
 /qEaBdkshk8khiTKFB3i747l8uY9Zmgpi6k26T+sCT8ctwAv500kx1vYi/IR4tploHn4obW4udk
 bUWUWhmf+VugXnWzzE5CRZFELV+qUBzLX7vJ3YjaPnHTiaU22ZHHOt1O2cmqEC1FpbAm6dpyqjJ
 mK4ugdJ4bFf45JLU7yQ==
X-Proofpoint-ORIG-GUID: CoYSnfR9gyL4khspW8Ou-aTDTudcbSot
X-Proofpoint-GUID: CoYSnfR9gyL4khspW8Ou-aTDTudcbSot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050031

Dear

On 1/1/2026 1:23 AM, Dmitry Baryshkov wrote:
> On Wed, Dec 31, 2025 at 03:58:17PM +0800, Shuai Zhang wrote:
>> Historically, WCN685x and QCA2066 shared the same firmware files.
>> Now, changes are planned for the firmware that will make it incompatible
>> with QCA2066, so a new firmware name is required for WCN685x.
>>
>> Test Steps:
>>   - Boot device
>>   - Check the BTFW loading status via dmesg
>>
>> Sanity pass and Test Log:
>> QCA Downloading qca/wcnhpbftfw21.tlv
>> Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
>> QCA Downloading qca/hpbftfw21.tlv
>>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>>   drivers/bluetooth/btqca.c | 25 +++++++++++++++++++++----
>>   1 file changed, 21 insertions(+), 4 deletions(-)
>> @@ -936,8 +944,17 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>   
>>   	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>   	if (err < 0) {
>> -		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
>> -		return err;
>> +		if (!firmware_name && soc_type == QCA_WCN6855) {
> Same comment as for the first patch: move this one level up,
> incorporating err < 0 check.


Thank you for your suggestion, I will update it.


>
>> +			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>> +						  "hpnv", soc_type, ver, rom_ver, boardid);
>> +			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>> +		}
>> +
>> +		if (err) {
>> +			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
>> +				   config.fwname, err);
>> +			return err;
>> +		}
>>   	}
>>   
>>   	switch (soc_type) {
>> -- 
>> 2.34.1
>>

