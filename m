Return-Path: <linux-arm-msm+bounces-1597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FFD7F5357
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 23:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2BB5B20F5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 22:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE3520B22;
	Wed, 22 Nov 2023 22:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx8BG/eF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BBA10C;
	Wed, 22 Nov 2023 14:23:43 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32f7abbb8b4so150180f8f.0;
        Wed, 22 Nov 2023 14:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700691822; x=1701296622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8GK3SyZL3LXcmpfWT45dHGF9tSwy53Cd0hTs0+Vv48=;
        b=Lx8BG/eFs8FeSzkzYFQu3OGboGR1Ay2XdnvsDVc/wczDW72SblHxGFBvFqMIzXm0b7
         PpPzKDDz/9YzvdLNXa9Pgohend1r3bQNmkOEJta6FViUpv7wzGkkZcJYoAclEZJP92U/
         kR/t/G2PW3sDWA9hoLAzLRIawFmBtWMKpaTyeAEvVSlBtbail2DxH6nCZqe31o4fn9tn
         llfFtpr/adhozmMOSOWINsE3ltUgCZAGquvYmqPz0iLR6cvw4t87OikYzgqy/LHtHV3v
         in1uFpQOZx6zmCKtRooHy3YR2EH+ebg9v/8BHHYdl8muNZE4OA1XMrDUGFCSV0SVZRT2
         6kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700691822; x=1701296622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8GK3SyZL3LXcmpfWT45dHGF9tSwy53Cd0hTs0+Vv48=;
        b=PHctDZWKhdE5qNlYjFsVRRRffipEqRttzee3mIsWboI4KfNEAPGZVVW1ox02iM1MNy
         H0GFLRMbH1UvysphO7SgM2PBkdi2RspurvqHdXMxfYDJjHliaOeouuQTajFAwgCeJsdg
         G/WDj7VFmlQrA+yTTnggs0r63eE486wAHUsjTssKTD4BmNQ4PHjf5G3ekaB83hZQqdN5
         Rg/bhn2S8UF9FRtMmp9nF59FbWkw0K7Am7W7DbrSk/LxCFXd2ewjpl8GIl6fSJcnUHcg
         bNvyEQPETRbnMKq4LAaK5IGsOj3Siqf6CW7LTTMgwj8qdNpAFq6UTAKmEG1tzmtOML3f
         bIZw==
X-Gm-Message-State: AOJu0YyoXmBdhHZgDB26K1WyxYsaKBf5Poibn+ihVqON0b47dsRwJ3TT
	/FTRXQPl5UGCvSjEutEukTA42nm8oxGMt6sx
X-Google-Smtp-Source: AGHT+IGysglQixcIO8sz8ophUPUele1QAx7Y0XkHkc7BQ59vqeS0Y2l1dNamG99kZ2xQY2vFDnKBuQ==
X-Received: by 2002:a5d:584e:0:b0:331:6c3b:4f1e with SMTP id i14-20020a5d584e000000b003316c3b4f1emr2735966wrf.56.1700691822004;
        Wed, 22 Nov 2023 14:23:42 -0800 (PST)
Received: from [192.168.0.3] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id t12-20020adfe10c000000b00332cb1bcd01sm437565wrz.86.2023.11.22.14.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 14:23:41 -0800 (PST)
Message-ID: <a62e93f0-7d95-41ee-91c1-cbdd316f94d7@gmail.com>
Date: Thu, 23 Nov 2023 00:23:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/10] net: wwan: qcom_bam_dmux: Convert to
 platform remove callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: Andy Gross <agross@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Johannes Berg <johannes@sipsolutions.net>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
References: <20231117095922.876489-1-u.kleine-koenig@pengutronix.de>
 <20231117095922.876489-9-u.kleine-koenig@pengutronix.de>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20231117095922.876489-9-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.11.2023 11:59, Uwe Kleine-König wrote:
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

Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

