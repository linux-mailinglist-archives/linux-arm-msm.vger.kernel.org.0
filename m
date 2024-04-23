Return-Path: <linux-arm-msm+bounces-18288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BCE8AE5E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 14:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2131B1C20FED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 12:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BA784A54;
	Tue, 23 Apr 2024 12:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EdikYgOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AEE8405C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713874995; cv=none; b=YFEsX+EQ0kgTjQxLO/P12Q1wi1feEukk38plPESFLH4Rmns8/UjPFxhZ1xCFO9jrMq1r7VkQjnS8p/opECxvWAj64f7IvEMekLA4qnG3VW9/vkUqn0vrcO4OZ6nNG6yCvwZdGovlaiN+GHEIgaRmU/z5FQ8GQbiqnN4dhgA++ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713874995; c=relaxed/simple;
	bh=TUxh2dmmpJX7WBc4srURr73XE2ORniuV1E9p5uloACs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8j0Y5rzS1yQyp+CgaI0rRJgporklShJhQOEoDJ21gRC0gzrQICjaIyACOgnHPYlIeyTnLiGVM25Veh9GiVukVIX6ULKHsvLGhV2uF0p35936CGBbgnvPsqsWpdCHx0Rgs0BGZARGKD9xfcCr++1+sISZwcFhE9QgzGVxXJtddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EdikYgOQ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-518a3e0d2ecso8379602e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 05:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713874992; x=1714479792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGk9qx4loxnh2Hbq3VLgz6hVCnEHtgT/Tl0bzU4S7gs=;
        b=EdikYgOQaOF+DjJj6wYiMtlrYBQptQABUHj1f/A5evpmcQ0/gjFqbk9NJ11xzorI9e
         dN+IbtCl+fAB1LulXWXrU2f30m9turJKLV02tMAxZnqE80dg7xPlvM4Jschtt3ohvAtZ
         8EVQz2uKc+FvUNTlqbgl4v7mf+AqK/ptNM0U9GBH0Q4qzYcSqzbVu/TyihX3HKhVwImI
         wUSzzKPoRCmcJE2A7/szmaIOC3ETbjWK4hTxEJRAAsHWNXG2GVoYzL94Aq9bfiHqV+9a
         BGEhb6vKlhDxuKff3KBphSU+Y3fbT/ruGpM2wIKdWTI7ciwnoh5UDlUHmynjqY2g3awS
         vOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713874992; x=1714479792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGk9qx4loxnh2Hbq3VLgz6hVCnEHtgT/Tl0bzU4S7gs=;
        b=Ry9uCs7PSWHP4tPU2jlg9m40qc/kJkyxd2/RXTIoVBUWMjfEepQ02g7UWmPZ/89TH/
         xju8wvylGNxc1YKXRVoqGkYA3jcH2RHVtcmnXPD7f2CI9fPHcmlS5055LVRWzSooO4lI
         atRkU+LpJGupO5m+jWocdEDUYGM+cqnVusE5PB7RO0Y1Z5kqxVhMY9ttXlLgZfRX9i47
         FlllFNlh/pK1JEha8AuyA/9boWb57FuKXJLOSVLIQtZtPYXoef6KjeWPlToWxeJ1tLTi
         ujd1QpjxOWdePBXzG7ShEakvQnaUmvwv6/5MulIYgw0cA+mOlXAwCLQBcT7g3Z5cyMLk
         7AQw==
X-Forwarded-Encrypted: i=1; AJvYcCWOu58IC/O13B2YLgCZIkPyWwNuohWd6urJBRtuozXkaH5TUHfbHDrVNeNkDUbeQPudmuenfLbIZ1eDc/hCCrPL9PyAUNGopiI7iHF0+w==
X-Gm-Message-State: AOJu0YxKJKqkxmVzfQFf8Ucs4QnI2O0RtWULbOJ5B1mILVFTBDL4ryQB
	CFmVQdP+8qWtj6sE+GqH0N71/eES7NP4UUXubDyUn/OOrfL3AdyDWaO7S2daLOE=
X-Google-Smtp-Source: AGHT+IGqlffKALibqA7oQ0C8VqbOeS6gh87vCW6HVVS6KS/gfpEZGOEf1bmt5zpFpHDf5E5+lyF7aA==
X-Received: by 2002:a19:5e12:0:b0:515:af1f:5bad with SMTP id s18-20020a195e12000000b00515af1f5badmr9270103lfb.28.1713874991796;
        Tue, 23 Apr 2024 05:23:11 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id s27-20020ac2465b000000b00519296c7d91sm2007161lfo.71.2024.04.23.05.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:23:11 -0700 (PDT)
Message-ID: <9267bf8f-bbd9-4b61-80ff-c1f43277ef0e@linaro.org>
Date: Tue, 23 Apr 2024 14:23:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq9574: add MDIO bus
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, robert.marko@sartura.hr,
 ansuelsmth@gmail.com
References: <20240323160935.2848095-1-mr.nuke.me@gmail.com>
 <20240323160935.2848095-2-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240323160935.2848095-2-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/23/24 17:09, Alexandru Gagniuc wrote:
> The IPQ95xx uses an IPQ4019 compatible MDIO controller that is already
> supported. Add a DT node to expose it.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 7f2e5cbf3bbb..4ab9da9fffb6 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -232,6 +232,16 @@ rng: rng@e3000 {
>   			clock-names = "core";
>   		};
>   
> +		mdio: mdio@90000 {
> +			compatible =  "qcom,ipq9574-mdio", "qcom,ipq4019-mdio";
> +			reg = <0x90000 0x64>;

Please pad the size part to 8 hex digits with leading zeroes

Konrad

