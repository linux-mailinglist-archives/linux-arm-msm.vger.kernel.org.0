Return-Path: <linux-arm-msm+bounces-17592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 332958A6E5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 16:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2C89B28970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 14:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9991D12BEAE;
	Tue, 16 Apr 2024 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ca2BeV89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1CE1DFE1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277842; cv=none; b=j6ZpycAPFdeVwL4rd49SuZGjU3EGmpkfEwA1uah1C+7Qidf9aMCKpoQKqveWlksFR23dpHOS3fFMFQafkLJy+m1KZwibGeFVeZVeI1MsUaSPQ+519vcJbil1YEmfO2bw15XJdriRfsYo04S8dGEcBVfcjxxnEBFlhX/yWEJX548=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277842; c=relaxed/simple;
	bh=CAARwFVs3yKtCFYh6SSnNVSgkeqkGD+D2UB4mgMiryI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdxIV0dx99/tMdwSp9DWB80Lbmud7Htxhnfw7qnVzaI42u1Y0JA7yU5kxg9inSkDGglk6ba9TgJ5NWY21NrP6fkswjN6yyT2wZdDhRvf5Vx72DAS2C+Ro34cHSiKHvHg/U86l+TtDlNoS7hTmg346QPRtIIw2NElM4GLd+CT+MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ca2BeV89; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516d1c8dc79so5614973e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713277838; x=1713882638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qtlZKHIIRTPrmMPlNl8Y4g3IVRv6I4I2Gd41GRQ6SNE=;
        b=Ca2BeV89Guy6F32bAlZwvBBu+IIfV9BGYU2y4i2dQl3lcI+5qbmD84jaxX5KpcSc5k
         tw6ZHUXgC8zpmojotXgwUYTQT8LZ3gMoQDTEASVUrYA4nKmxepySJvtt/4dbjomCkt9t
         tfgtGdjDaNpiUI/U4XaihQ7rYx8C5pZL0hQGQIweCzekCP8nTRNG0RIqr6wfVepq0D5L
         kzjxS97DpHp3RpV+bQer2ymb5G5EJygtAbBaLheE0W6qnAVUg7cv6bdEP+DmInLWUiSg
         QUqCBjwcJqw5B+YpiiVG8Xpr68C+HhhVmem4O6tA0T3yBnxgZG5qbAocng2SjDDGdlv8
         O03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713277838; x=1713882638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtlZKHIIRTPrmMPlNl8Y4g3IVRv6I4I2Gd41GRQ6SNE=;
        b=wlDLyi99TY54lnJgnEMUQqgciM8TSHZuChtDdt99pUzSenxzlNCGFNnDnpZqYKtJ1Z
         gsUA2nG9xjBeBeoKC271QTKKFdRR5Gs19iLIl5x3MvbngTwz8TsJocqbb6O1UREDeniK
         2n/5hOA9LisQzuPhTUBCrEoETFNR9hSwFIf0zlC3Hvhx3mso5ffGfkXgOLPWQhhKM4HJ
         DtSJbYAKmR92mlIa0ARgFWirf6awv9krVIqJYZ165iLV6O+T1A6Ol11CfhB+GDQnyF+d
         LR9gb4fq/ysBvkblfYd3r8zB3830RqlxlCuu2Xeo38d/TqXuXtPmiLeZleaJNJxI42Un
         iUWg==
X-Forwarded-Encrypted: i=1; AJvYcCWADKfvh+LDPrGr4Yrz3Cp3kSAJGa7WbgzUX10REyAVuSMkirvCfZ1oNPmub+6kLRZp2i2orhi/p+JeE1a1r1GQ7+XQCYPV1WrH62jbDg==
X-Gm-Message-State: AOJu0YwXlmFuY430MO4wmztbEcI98GgV1ySv/hcY+0xHiWqexW7vzMUX
	CfkBjpK9pytKHO3cMAKDWjkztKB1lSlrseITIFE7hR2Zhk26JdDXNYw3xupajcc=
X-Google-Smtp-Source: AGHT+IEMK3ToPpFre8TBGqqiH04egFU2RIZe5ZOa5Ve6c3up7Osw5BJsl/VXC/ZDiEBh5lIfs2bIVQ==
X-Received: by 2002:a05:6512:280a:b0:518:e249:c10d with SMTP id cf10-20020a056512280a00b00518e249c10dmr5163603lfb.37.1713277838030;
        Tue, 16 Apr 2024 07:30:38 -0700 (PDT)
Received: from [172.30.205.49] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g8-20020a19e048000000b00516d2c05b3dsm1633547lfj.299.2024.04.16.07.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 07:30:37 -0700 (PDT)
Message-ID: <548f4b0e-b765-4184-8b90-eec7fe0e7f69@linaro.org>
Date: Tue, 16 Apr 2024 16:30:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] usb: typec: Handle retimers in typec_set_mode()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-1-890db00877ac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-1-890db00877ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/16/24 04:20, Dmitry Baryshkov wrote:
> Make typec_set_mode() also handle retimers in addition to muxes. Setting
> the USB mode requires retimers to be configured in addition to just
> switching the mux configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

