Return-Path: <linux-arm-msm+bounces-35138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8759A5408
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 14:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F3BC1F2220B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 12:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EFD1917E6;
	Sun, 20 Oct 2024 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rskqu2BG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A32C82866;
	Sun, 20 Oct 2024 12:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729428069; cv=none; b=f5iMalkB8NYBmWspoPC7GzgvAsPPBCNktSpO/dOkgn4CUWdghsr34oWchCA56TVN47jgaqcIhU5MN6547nAJXNX0uINMz8c86yytSUsr4Lu3BJrpm7xFFt+uSXXqpyo1VpBB4cDuTwMn+8aurq7aHXH1pDcQcXa952IqdeV2fUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729428069; c=relaxed/simple;
	bh=Baade9IKPollAouHiEUvWPoWWKIQzZxCSNVwIWgogSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/g+CIw44FQ+yQinWVmxRqsKh0SaQiktKi80EhslNPJTAlAM2P3DGO8g1wiR89VpXWpVIwMsDFU+rX9aucli504Dt/iaLTnxYYjuPpv4CEw8BygGt9KDbfFY59XqToQa5LinrzdNcryUjqBoMzH0KAS7rAc6OUlPvDW78/gzMFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rskqu2BG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so27304975e9.0;
        Sun, 20 Oct 2024 05:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729428065; x=1730032865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TOiYzcydyONfO3p9U5vZxO4Orz89dL+ERRC773edJCg=;
        b=Rskqu2BGcLEv+9Iri4d0ajEQzm3NvsZQLbkU3x673uWlc+5nqcGxrDX6ilxYx2WRCD
         duz1dP+jPvp7cqhMBepz88buBgPIM///C64GPw/TnAlC+HtLERcqn9ZPSvc2azz95lPG
         4fpTwA66zRnw0IYsApq9cpZCi55VSFxWtbpPVpc1bd8lShfPc8uRske+EyEpHg0CsPZY
         xtZJDP1r2RpVxTx5X+3ebnzR5aOOKfcYfEL6FELsYkw0JQtCLCChJGEs2ea8w1UtKNJV
         B6SbxlUINozMtHAWlJsp292p28KG0INgepd+Wa2BZJXWsNBihqP0D//GyhhWdWf8ZsLM
         H06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729428065; x=1730032865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TOiYzcydyONfO3p9U5vZxO4Orz89dL+ERRC773edJCg=;
        b=nMLMEV+D24pE9ixLPds+vjeUm0B7A1we2O/x0ems9wBvnEuY9+ZPIqIB1GoWUeF3rW
         ufVdtVM7S4Dq5hCEEWMfqZ46329ICZN8HnLvlxW3gVGhjy3YhBKISyXL+jZX0YTmy+DS
         qHr5mIyt1a4iNLL2+7xtuiIvRlExQ6Jes3Ra+i6muv6R/eyvpXcFCsxAcBjRzVQlGMbz
         DgUbpdsE/iINq0FVSuqBHzR6wwqBaARg6FqXnIL3XL+Z0oFf/aOTf5rN95p/kPID3oEA
         M2APby63BEAEIsnAj6rGl9RpCs2wbAR9qE9UTfGOB7AaJibvyWIMmNlW2ipGlx5dzBg8
         fD1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhkkufeyL1sCv34A197trN9u4HMHasi4J3nLl8F9IKuI9bd6FEJz+iF/sq/MXxWMM3m7i5pe57BwVB3cmQ@vger.kernel.org, AJvYcCWEr69P0XFRC884KvuYiNlYlq/scGUpcdDRKkWurUHWJTK5QJFYk+tNFEp5s7Ge/TKW1J0ZIUDKcQZB@vger.kernel.org, AJvYcCWawxZwcXwkRvZgqFfJkQbWNTK6knFQucndk4OYiGddPYhTYr6Tp8AzevWuK4zeeEEbinlvMgwb66mjrF6L@vger.kernel.org, AJvYcCXsZDYr0Jp4V5u84tSKILt8pVOAWjd1P82ah1OHKKckKHHfPM0Z4ExlrXn/0EP5A2lXZjMIDL3D@vger.kernel.org
X-Gm-Message-State: AOJu0YwfrrBTv7ixNhTf4f8R5/EQ3kW7h6nCsJmmYhai8wNyVdCQmjcW
	S7pqJ+Gr4DLud7rQ/qrKM5mcBfuAYg7eMjVMvXMuakGZjWPSjCgw
X-Google-Smtp-Source: AGHT+IEB2QSrzuka0jaj1gBdAqECmptGTd+307mQ5Q9pRfa1hiWkZsRT7Z1FpumQNgTVmo2czr5AHA==
X-Received: by 2002:adf:f092:0:b0:37d:395a:bb7 with SMTP id ffacd0b85a97d-37ea21c75d8mr5397334f8f.31.1729428065071;
        Sun, 20 Oct 2024 05:41:05 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:5fe4:91f7:fa4f:9c21? (2a02-8389-41cf-e200-5fe4-91f7-fa4f-9c21.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:5fe4:91f7:fa4f:9c21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fbb5sm22505435e9.17.2024.10.20.05.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 05:41:04 -0700 (PDT)
Message-ID: <5355d837-4777-40cf-8a9a-08c9509d3fc5@gmail.com>
Date: Sun, 20 Oct 2024 14:41:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: fix missing fwnode removal
 in error path
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241019-qcom_pmic_typec-fwnode_remove-v1-1-884968902979@gmail.com>
 <nsmpyy736kfdn5h727bfgfd6lufecyi5kz6kfiyzndgz3xiei5@7uzrrve4q3fb>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <nsmpyy736kfdn5h727bfgfd6lufecyi5kz6kfiyzndgz3xiei5@7uzrrve4q3fb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/10/2024 12:40, Dmitry Baryshkov wrote:
> On Sat, Oct 19, 2024 at 11:10:51PM +0200, Javier Carrasco wrote:
>> If drm_dp_hpd_bridge_register() fails, the probe function returns
>> without removing the fwnode via fwnode_remove_software_node(), leaking
>> the resource.
>>
>> Jump to fwnode_remove if drm_dp_hpd_bridge_register() fails to remove
>> the software node acquired with device_get_named_child_node().
> 
> I think the fwnode_remove_software_node() is not a proper cleanup
> function here (and was most likely c&p from some other driver). See the
> comment in front of device_get_named_child_node().
> 
> Please add another patch before this one, replacing
> fwnode_remove_software_node() with fwnode_handle_put().
> 

That is right, it was probably copied from a driver that called
fwnode_create_software_node() to initialize the fwnode. I will replace
it in the probe function as well as in qcom_pmic_typec_remove(), where
the fwnode is again released via fwnode_remove_software_node().

Thanks and best regards,
Javier Carrasco

