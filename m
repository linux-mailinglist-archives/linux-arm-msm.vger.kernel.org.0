Return-Path: <linux-arm-msm+bounces-84792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D75CB08E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 17:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E24CC3020C43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 16:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEC8321420;
	Tue,  9 Dec 2025 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2jBinvb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7749F320A29
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 16:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765297567; cv=none; b=nHxXibZBCnzQi2sFDZH/jdEronLl2/ClczB0b4Vkd2EDg3JuMzF3DSL7vxEehMbNvndeYnQVBB+N0tshN8DCSgiySTfbEJMpkDK9pKIcrioOBpK9pEaYCtSzaYGVPug5XnCWzcnn3AS//yplvmxczzdnst1Mad/pci4FxT+wFPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765297567; c=relaxed/simple;
	bh=biGOZb1RIX5ikhtgxteyi8161lILYFSAu5T6Hgxesz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVQXVNAaf4g4Dwc56NEPQq/lDIEFk24B9dgy/kahC6CCiyca5mnVrSBpw1kl/a7zvfmq5hDFR4hDM9BJKIyc0l3XrU1EI4xuLiTTHpuHcVLHuXYC6QHRT6rdc4lOKpgIEHjbDQAAMCCxGTVpPcTaipzb8IpWupCGUGY8rLamcn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2jBinvb; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7cac8231d4eso373664a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 08:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765297563; x=1765902363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F5zRiXPRY1gEzqlGjNHUp6dTOKIROF+8I0Et8Ms264g=;
        b=C2jBinvbVNa/LLRajtZBKuHhItW+5FLYNeykX9t4tHmeTokqpast7pqX859Qjmm+Rq
         WaemVJGB3uLUdmK24n/XMGAnQ+LfWNx1FdXRBXgeJ9lA+YhkpSct+vjaBsTAPAuwyzgK
         0kyVoKjFgwrTInImER4OCxdWrL/ofG1gCpsilUL7iPmqkintlXHbkpTqndKnqdVNmITD
         kqFnFsKteu3XiQsjNpvxRJyI3LcrulUxlwEdEh6KsCpKea9QOf21yxJXbwn9XrgVt0SA
         zov56aP7+Ukjd9NWM1Zs8kpNRRUgCmJl3L1UhdnxsAG1lkzvn7h3onuWksuOZdinX/1d
         PSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765297563; x=1765902363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5zRiXPRY1gEzqlGjNHUp6dTOKIROF+8I0Et8Ms264g=;
        b=Pc/HsPruB9nswaFECdB32sp4T1f6jpgQvNyFw8KQ4GdEf1uowm1GXFmzgLh3Cwjdow
         XLVGD3Qhw4l/rqP7FGs5Db6w+naFyv6dXSWCVJ9+AchaoGTivDx2xPKP4pN0aJ7wk94o
         WtXEt1pdRS35ULcKsW2khNWMvoBa5XUtia2Zt1uJAp+oHSSU7zBP/yqYpPpNPw0gNEyR
         bTG0lzLFBeG9zarsQBM5GuRx5Yr1RBlz1NLvOtm8IOZpKCfNlQJ11C/ui49uy1rqygLN
         dJoWocncDJtgv3dxMSA/aQBLdjmJBJch7+0KDq2OV3c9qpLXJXjE8uk3guW5L73/lv12
         5xXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyTtltVO28voF4C44P6sdzR1t1s7curZ773DBl6bEGtVYoeBtaketbDkTTEGhohnLQWxxpUTZ2xtuk+1r/@vger.kernel.org
X-Gm-Message-State: AOJu0YxooDqqsuSRWt8wNas9MqlHjlCL64/sK2mzHbnyxmXzAZ7MhWcx
	UZjmeofYF8C9WJhVofnZ/0/tIdH4ZoW+dpcyj9j2psTtzYDiVdhp0TGCrrAmn6bg
X-Gm-Gg: ASbGncvH5mjxdbBoThrN0t9ATitE1KfdfAfpUefU1GEtC48wiT+jnRWFNdDoB9L0CH4
	NGzLpUer0MZgUN8jdRKH/MzI/1kTL0yORxN996+5Mq+hBpFoLp4wuQSt3wfTa5YWFyLW9Yj8lkd
	2p6UYVb0tmstFnN9XeHWEiijm7VKye5BmAIC+YDCiN0rSu++rlMmig+uU8q/b7cvAfmq5vXp3n4
	iZj+0faIWKr8lcJw4fd9RvfWOTkicBp2CNG53aUWucJnbddcKtw5zNMIOpsXBTDD19tJ1ggoLIY
	rlxt+4XNFJxKtt2OU+6ucWi7lauHw/8TpAYVbdy3gQaBtNARDHDFnEG4vIsNbapdNvvA4vr0CpT
	oTtCc/6onVKSAgtvHURAY+ca0EiOT7u/CnNElz85nqBQYRsc/juc8AIUMAhJgwABky3kz22K5mY
	bPdZsbY7C2PbgQofEuSj6bihTXQ1j/9qlYpXMGylflaeBvBfegflMt4FvNULfQdH+J6POqXnd+0
	FOpsL+/2If9DmNqK0ejQTq2+ZC0llTm2VF2E7mc1wf5
X-Google-Smtp-Source: AGHT+IFmTKjIjeFDsRUal05BF/whcGMQ56pIqRSSm2fIFKSoV0XP7XVAyr9RBrBMhtPaZ7mpmksR4Q==
X-Received: by 2002:a05:6830:412a:b0:7c5:3798:fa3f with SMTP id 46e09a7af769-7c970748674mr4845571a34.2.1765297563411;
        Tue, 09 Dec 2025 08:26:03 -0800 (PST)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95ac833d3sm12560318a34.17.2025.12.09.08.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 08:26:02 -0800 (PST)
Message-ID: <23d3bc82-0909-42a4-b4a9-742834faec76@gmail.com>
Date: Tue, 9 Dec 2025 10:26:01 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Use 'usb-phy' for node names
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251209160755.3878878-1-mr.nuke.me@gmail.com>
 <xmserprghzwpcxt7ionh2ju7o3cudj5emtkycvurbz5obztzr5@lkllnnsag6ri>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <xmserprghzwpcxt7ionh2ju7o3cudj5emtkycvurbz5obztzr5@lkllnnsag6ri>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/9/25 10:17 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 09, 2025 at 10:07:54AM -0600, Alexandru Gagniuc wrote:
>> The devicetree spec allows node names of "usb-phy". So be more
>> specific for the USB PHYs, and name the nodes "usb-phy" instead of
>> just "phy".
> 
> Why? "phy" is more generic.

Hi Dmitry,

The goal is to be more specific. I find usb-phy, ethernet-phy and others
to me much clearer. As I see these more specific names being used throughut
dts files, I did not expect this to be controversial.

I am trying to follow devicetree v0.4, "2.2.2 Generic Names Recommendation",
which allows these more-specific node names.

Alex



> 
>>
>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 86c9cb9fffc98..4b8cbf1ff131b 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -702,7 +702,7 @@ qpic_nand: spi@79b0000 {
>>   			status = "disabled";
>>   		};
>>   
>> -		usb_0_qusbphy: phy@7b000 {
>> +		usb_0_qusbphy: usb-phy@7b000 {
>>   			compatible = "qcom,ipq9574-qusb2-phy";
>>   			reg = <0x0007b000 0x180>;
>>   			#phy-cells = <0>;
>> @@ -716,7 +716,7 @@ usb_0_qusbphy: phy@7b000 {
>>   			status = "disabled";
>>   		};
>>   
>> -		usb_0_qmpphy: phy@7d000 {
>> +		usb_0_qmpphy: usb-phy@7d000 {
>>   			compatible = "qcom,ipq9574-qmp-usb3-phy";
>>   			reg = <0x0007d000 0xa00>;
>>   			#phy-cells = <0>;
>> -- 
>> 2.45.1
>>
> 
The


