Return-Path: <linux-arm-msm+bounces-115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C73EC7E4ABA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 22:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56E28B20C40
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 21:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086DA2A1D2;
	Tue,  7 Nov 2023 21:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZuvTLcls"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AE2A21
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 21:31:23 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC6712F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 13:31:22 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c6cb4a79deso1455271fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 13:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699392681; x=1699997481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3cjcydHxIorezAPUHx1OwQBP/4NI/MtP2lbJKQNyzF4=;
        b=ZuvTLclsRG1H9bJpySMtaI2lxT2KeQWpSXU3QyLqZEroj2GACvreHc3pZdwUDCGDjB
         EklBgJOtk68dwO3DmA6jdVc4nRqaUCCDpp/5aMqukq+0Uvw9Wb9Jh0reifbrL8TijVHZ
         exQxykItDj2VYwP2EWvkNCrnB2ukuumNyujGtsjSiLdl4CpEJ2L1+iH4Ajg6Vok0iu8d
         xfzguYniR1CJOzYxndFAht7QWBPZcd/59Beorgulen029vybHbai5EDU9VHhNZV0J7Vz
         GMruYD0qtRQJXzVXUH6ArimqFCmcWBA0rBzDoS33XYoLrNkH3VensQ8ueqydso7ka6aT
         DM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699392681; x=1699997481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cjcydHxIorezAPUHx1OwQBP/4NI/MtP2lbJKQNyzF4=;
        b=IKm7AAIo7bWKjaC0/mi+mjgp0t5q9Oll4Z5MoPAuC2JlxlBqj5PHqIbrT0p1/5Jjmd
         OJKN+hecGSIQk5q9LUGToP6AWPhcUmv0QxcwwzqZlnIxYsOg2YJoSOvAABsYVjUu9Ins
         0rO6mFhs0vT0Q7ya4TnYyFKXZtUWo4QxTENvoERFIii4ioc9sWDBUscmx9dk7QrrfAO4
         bPEa6wyTvRwTnAEAnh1IT1/4KQN3nUMqKK68d3ICVezLq4cmseMfNZf1gkYy2HWuESjM
         jzxNffz1wNXZ+WViTqJOkWSyiY9x7eSkjmD4Ge8edEa/aBmZp/X/0AzjeLREqOYsOF4V
         it1Q==
X-Gm-Message-State: AOJu0Yzf7K+8HhARCM81MGYtjl/17WoSUPFgPAK8xBCNBxLkmEWByO22
	bGFPa30hG8teBkwqUkCf32bXEQ==
X-Google-Smtp-Source: AGHT+IEcPohYZTJ3w0ky7RXZCSKIbfFSjTiYyVaHUiQ49U0/Z9gXmsprWIKjBBC+Y2X/U/JQpub0rw==
X-Received: by 2002:a2e:3309:0:b0:2c4:fe28:7b45 with SMTP id d9-20020a2e3309000000b002c4fe287b45mr1395368ljc.8.1699392680998;
        Tue, 07 Nov 2023 13:31:20 -0800 (PST)
Received: from [172.30.205.109] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t4-20020a05651c148400b002b6daa3fa2csm1607587lje.69.2023.11.07.13.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:31:20 -0800 (PST)
Message-ID: <94647dcb-257b-4b76-a046-56436a7dbf48@linaro.org>
Date: Tue, 7 Nov 2023 22:31:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/18] mfd: qcom-pm8xxx: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
References: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
 <20231106171708.3892347-14-u.kleine-koenig@pengutronix.de>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231106171708.3892347-14-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/6/23 18:17, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

