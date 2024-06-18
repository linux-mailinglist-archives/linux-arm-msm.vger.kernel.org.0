Return-Path: <linux-arm-msm+bounces-23102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026C90D62A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A53B71C24949
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796DF143898;
	Tue, 18 Jun 2024 14:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z7bGY1TZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964613F016
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718722076; cv=none; b=awLCV5JgWkZNwwzbi3+KVtN5k7cpD/C7CoGfc1cY7vLwJ5D2lUHPuvXzRD4GiQcAm4Ksns+1NCZHmD7AJ+4P4H49GKI1NyPsekxeYF0inXI/txUBw/q4zh1nfau/3ToLv2eup93sDLsjxitDI5Yl1DfnIjjSA2yM/hYfKoujwCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718722076; c=relaxed/simple;
	bh=9+QYKsnxwciPPkF5LJewp9ve91BAy8qGJgnDlZZqgZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKXbJ0SUCW1YMs4Urdad+O6JAi4eBSnH+6ARZD7QocTuLfBl+k6PGRLzlMi1glBhGvffLmG0Yoqz430n1cCrKMcEOc04aSZlAO9J1vHzwjz5cZWITZ6ftA29dAj/6zireq5xjeuwlAISxYvspQrxBL/hhphCMQco6nIUgThg6mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z7bGY1TZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso57856905e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 07:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718722073; x=1719326873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cbw6Bx2xA/wA1wsLz+oR6E+oVt4SHwS049oMAcuOIY=;
        b=Z7bGY1TZGDTiDLjdhkTBum7NCYhdBbkLzPs4wsWTd3EOkoRC95fqSvHN54S13HmNsO
         xngDaAWv2OH7nkm6jCZmJcj4cv0RcdwXq7+dnT/ewToKIJX4PkU52ANvPG2movi3vkaQ
         oL2IAYh6dgmkDNz47rVL74ohq+obQzgVHFV+Tj5ZBGfFiytWGmYx8qQEI9coaAeNIi0+
         qAOxBQPspcCciap2GYsNdHSnLZtezwyfE2gGu1UTQEcI+ANPO05pXONgjlufmUP3z44o
         JhOIaftgv52xtTenGKbxcP+MYmwmWdYF+bEKIQOEbSbQknAHMuQnI9wQZUxvjhJTGiUc
         j4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718722073; x=1719326873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+cbw6Bx2xA/wA1wsLz+oR6E+oVt4SHwS049oMAcuOIY=;
        b=jxI8Cz4bYz/5SXyvWkTZT8ZBEadj0uNhj4gLvkXFUWrV5XRjXoAwe4wgggi3QU6Zja
         26C11u0yhdV4Rz3tQn5xtGzKTzNH1U5CnViqWcgDkINRR+0TVjMT6dZmEyzfzkVBAmfk
         WnWt8kizYT6T8PeOENjhPsMDhz0jLovTiWp4exZl8EhllgKymql5kWeovDn0lNXu3U6F
         69HRooAzVCjJjEKM4hk5UMOO6uo7uYIuT5lk0Dh/8q4c9nvneQXTHiwiMHoFVqhUWIEy
         6xtOLKqIRSvo2WAkabvVow4qmsFV6rbAthdWSv9tAM3h1QmCe02OsDHjZPqRomKXvQNo
         5vjg==
X-Forwarded-Encrypted: i=1; AJvYcCXooBmUn2vyYIL9FVDmGe+TzcIugZmrYpse9zm2LEKm2OmkOZO3ApplULOmfSg3vYV8/OOpUPod9mhe0Ro8ISAXzoxJ9MgKYuMt/3niUw==
X-Gm-Message-State: AOJu0YxF0Z0C4PKA/ZSqoMbDssYofcjXv1Ka8CMNpZq80dJsIWRgZaB3
	GOnISdryrL823wmQ/87YdPspRLPHesI1xPvgWiwo5+IaqBjtr+7BtFsQWfVmsmM=
X-Google-Smtp-Source: AGHT+IF9eWD+iBGTTbMd7s7/ZxukSrBvSi6su/3uP4mI5cG6RCpXNcaANJ63gsUAM54GxX0XWDZuVQ==
X-Received: by 2002:a05:600c:5118:b0:422:2044:a0dd with SMTP id 5b1f17b1804b1-42304825795mr110428695e9.18.1718722073231;
        Tue, 18 Jun 2024 07:47:53 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de63asm229867065e9.30.2024.06.18.07.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:47:52 -0700 (PDT)
Message-ID: <1e10252a-c759-4767-beb2-12bf79c26315@linaro.org>
Date: Tue, 18 Jun 2024 16:47:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sc7280: Add clocks for QOS
 configuration
To: Odelu Kukatla <quic_okukatla@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, cros-qcom-dts-watchers@chromium.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, quic_rlaggysh@quicinc.com,
 quic_mdtipton@quicinc.com
References: <20240607173927.26321-1-quic_okukatla@quicinc.com>
 <20240607173927.26321-5-quic_okukatla@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240607173927.26321-5-quic_okukatla@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/7/24 19:39, Odelu Kukatla wrote:
> Add clocks which need to be enbaled for configuring
> QoS on sc7280.
> 
> Signed-off-by: Odelu Kukatla <quic_okukatla@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

