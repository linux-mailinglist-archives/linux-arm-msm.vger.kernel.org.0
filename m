Return-Path: <linux-arm-msm+bounces-21268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA3A8D61EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75AC6287B1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24FA1F95A;
	Fri, 31 May 2024 12:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DhujHNFj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FC8158848
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717158997; cv=none; b=sibru41U75Lgz6tfaXNElt+CR8Z2WgmOgoCEk94fCxqzh1WJopSIaCer1e01uCrmyNyVA2kUg18k3XrZJartNyX9KtZVRA4xm4WFH14x9qvcwBHVf9kj3BOlK5cmNEyEaBwCfwdTbIC5TY3tCBYg7XIOHszG3Cbfcx6J8l9QhjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717158997; c=relaxed/simple;
	bh=8IRl2KYuj516vFNJtmTpu4XOOLEoWIZ2J1vtWWCGysU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nnn5wxCVt6YlE5JTNgBC5sIhuzkJL9BH1FaDrlPXAm89Zdeg/1WuddQjKHeCj1nHXIy1g8jOf0JBOgAslHSJde/RZQ4GJimrvHFY07X8Ke99qSJIkfgtVu8C8OAg6lZJL3OKeo4F4Ys8QS1e3OkWgghk1fF9BEwnerWvJ0cxu3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DhujHNFj; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-572c65cea55so3459094a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717158994; x=1717763794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8XZBLIqnXNM9Un5YTWGG1Va1zThZVXs53HH2tyzxECs=;
        b=DhujHNFjnvovg2+fFEySEJKNFtuGGkyrwoA/dTy1WPE8Aa493sOVVnBksz8KhxD4jV
         xAJm+w+nzdzMFaCzsL5Izi1G2ed3KtcTEdOwjyBezL9SbHgu86fT+BFle1s7dUlLtb88
         +2rlKLTaqkrKBkGtVawALZXwB0z+tzehagF4O/MTGalNC2Xl8UKLNWOvcJXJSma64OPu
         7nt/aF3eQ0GYGgw+WtZ7L30WPKqleSAbFRdMJN+c8LFoKXEKpi3Fg/gJSe+CdwOUAMYt
         nzSrhPXR6HkgrZQ/hriCvJjbgGot+WUAWy4iRKYFFVoc4vLZIkqqrj/SUS340fVpdTKi
         7J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717158994; x=1717763794;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XZBLIqnXNM9Un5YTWGG1Va1zThZVXs53HH2tyzxECs=;
        b=jIhJP7q207yWti5MP3TGXtrhQxXa4g7xQAR6jq11IvfW4Zg971uW4B9CD4VUmZYZq5
         zDcqF/oksgZRt/zWPah6j9uvOKaYcZ6ZGidm87noV7cnJ2S0QTywhHY18SXrUMZrafYM
         P8Q32/8Z1dA/SLUEnQPosliwUiN61J9PRfSy9m5lJk8W1Z1UXMQ4ZMBtB+vAZxDXng74
         6w+E5oy/cM/qR6vixE4rGi7Gm6a8iHgExTU87Pa9nD95/XBoCXpCvgXUqQIn3cnHWScY
         n1+MyJpXOXhVj6LBjkrO4YqV/atub53Jk5jWHB4xAYUcmnefVWPo18ZFXo6NMo36WOi/
         olVA==
X-Gm-Message-State: AOJu0Yw3ZRB49XAcvJceZlwXMvsZfIOrXNw6Kilv4e5csePjk4comj77
	Pb3Kr0T7gBtzjZaXQ68+pIRlIFkRTDK2b28wtWyWDdd5pQDUaCiIWF/pHhqQiMs=
X-Google-Smtp-Source: AGHT+IESjAZPkMAj82KTGZ0MO0M/rX+h8lxPfgVYEv7S4L4XVOap9zxd8mdxwbJMGfuxQPYBHFpdsA==
X-Received: by 2002:a50:d701:0:b0:579:c37c:1b36 with SMTP id 4fb4d7f45d1cf-57a364e86e7mr1836599a12.17.1717158994458;
        Fri, 31 May 2024 05:36:34 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be5695sm977406a12.55.2024.05.31.05.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 05:36:34 -0700 (PDT)
Message-ID: <e0d6c3c4-9649-4494-af33-1017d75e639d@linaro.org>
Date: Fri, 31 May 2024 14:36:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Add IMEM and PIL info
 region
To: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_kbajaj@quicinc.com, kernel@quicinc.com
References: <20240531093531.238075-1-quic_tengfan@quicinc.com>
 <20240531093531.238075-3-quic_tengfan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240531093531.238075-3-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.05.2024 11:35 AM, Tengfei Fan wrote:
> Add a simple-mfd representing IMEM on SA8775p and define the PIL
> relocation info region, so that post mortem tools will be able
> to locate the loaded remoteprocs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

