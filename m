Return-Path: <linux-arm-msm+bounces-19719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C870B8C29DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 20:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 400D11F236EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 18:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3737C17BA3;
	Fri, 10 May 2024 18:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kOASB9/O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8048044375
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 18:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365734; cv=none; b=QWgB8dpF6SNIjav3JonB9g7IWjkw3cH18w8HsO7/7rTQ7ct/hJsxx0IFuFMztUc20LWB4JBImnvF+8dym6mdyC4ea+1N9D/HhOuTjvUaw8uv0c9zobSYs6SLwzwltRCYmwgUnlYZFqZahdrcI1Oisr4gAVp77G4OFkUIpP1SvtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365734; c=relaxed/simple;
	bh=epoXW1waP+MwH99xf6rC682FICComy7UfCT9VhplzdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2HwjUhPBkbIE2dKzBhIM1ig8K9BjPctwpVheqC4cSGQW7LN/QYIcnM/bxJwPKbKMMjmigMCrNFbpouHaKDRQCYaMaOAJGcIYkI7yJsBxDVtNjjd+b49eBQsDCrwskP/lPJJDp7XojTjGKzpVfiBMyHnrQTOxDbpC90wwc53O5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kOASB9/O; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51ef64d051bso2845741e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365731; x=1715970531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFg4ayAexiWKOzOXFoyc3idLGyKV44tIY5d5O3liHs0=;
        b=kOASB9/OV8cpiKeoCrqdZop/lZXYUfjcOQfuCDvv04nwcjeltsiR6gdZFSCRp87LSc
         Wmi4ZXkKiu0/42CP1MAr64Tj/MbeY85pdse4Nrv0YaWJjYCR/J8H6NDICHeZlXXtXAN3
         accFAiD7vhU37gaHjUkCq4eyRzWtlnAUBxb8xAiVG45s2viMAXYscusFKSNo2ZR5TXOO
         jx6uErkIpy8iSb4DKOaKymoApFj6PmftfhDFaqDiERfre56fWoEhXmbQ3yAeykEL8oGl
         ccgG/Y2bnPOAWXjvD3NnUSDg/PAm1zuNAn232FJuf/8X9LeIVNDQ5K7WLbBxQ/KOD6J1
         7S5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365731; x=1715970531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFg4ayAexiWKOzOXFoyc3idLGyKV44tIY5d5O3liHs0=;
        b=TFlijPjbKaB+VNu8RevQ8GKVQz25Oa0TYWkEC/I9SYZ37VdKEdKPZoS8VnldqWpLcV
         2LAQtlRbG8xX/4CI4sbUioUwO9DqGT/+JqwO7r4VT9mWjDQEws30O9uKba3lgqg/9+u2
         1v4y7plaJyvo1rVsUd1rqa72bpbKgO6QcfbtMIybhEpW2tdG26PXGcOFJlN6wHS6fCt5
         0ARsqrXfa8PcPN+qZpF/aJYgpfxjo+tKV6J3+q3wjv77Ia2YXoUNegC9j91LBhdU6Dcp
         iSJSFaxA4I+IWQ4MLbEXiTMbNEkMjUlWbE6QvCyOv7HZP6Hy0fv6OiCqQ42/9nZ8bLuG
         HMAg==
X-Forwarded-Encrypted: i=1; AJvYcCW0P98dJCEKxPufTI2rgOhYBf79PvWvxYNkLXY14i8vNlJz9akZk3MDBRyGjSUgx1sal4PBtOXCmYlSkIW6RbLYSbQBihMYfe2tP8+WvQ==
X-Gm-Message-State: AOJu0Yw/9UQj6iH6/tKo8pSlDh5yGAYVjrvjPKnyQdFJ+Mn/n7h093uE
	0RnEx3H9FMSke8HrjZb/fJIydZ/4Pw94H5Y2JkQErGFASWLR5BmqpnrDaIjskPQ=
X-Google-Smtp-Source: AGHT+IFTTIXd6P+2xpMOVHOVAj9yA/GxgU12mKxNlNuyXL9J+PwnVML97iLnokLxyBdelRuQZ25D3Q==
X-Received: by 2002:a19:6b0b:0:b0:51d:97e8:d2ea with SMTP id 2adb3069b0e04-5220fb77411mr2139996e87.30.1715365730768;
        Fri, 10 May 2024 11:28:50 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad02csm5148688f8f.67.2024.05.10.11.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:28:50 -0700 (PDT)
Message-ID: <be76c36a-2233-4fcb-87be-d6a5fe5b0c93@linaro.org>
Date: Fri, 10 May 2024 19:28:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] media: qcom: camss: Split testgen, RDI and RX for
 CSID 170
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-7-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-7-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> Split the RAW interface (RDI), the CSID receiver (RX)
> and test pattern generator (testgen), configurations
> for CSID on Titan 170
> 
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # 
sc8280xp/sm8250/sdm845/apq8016


