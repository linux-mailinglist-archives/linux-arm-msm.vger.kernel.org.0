Return-Path: <linux-arm-msm+bounces-21581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6CE8FB109
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 13:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 032151F23054
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03964145335;
	Tue,  4 Jun 2024 11:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IICL0nSE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589741442E3
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717500300; cv=none; b=qawrbKQZvTuoSElEfOf4YdWa++Xi5RYDyajQhdq+pjnzTPTB9kt7ZkMb2LrTz8++KByp9uPzWfbnHo23QCI9z+6M1ogEl6uNZkay6Torh53c46jkEoNEFyd3cTjSgF9CqJgemN0eF8zv6DfKXZvzRU8tgpyR6uaudbmI3c9ylQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717500300; c=relaxed/simple;
	bh=DtUeQV1ibqKPq8E36su3OXKep5Fe4xTp9Q9KaaYfPT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUGdOSO00piuDtUQlV6y3y8lOdHSfB3+hB0Xa50pzxp+GQVM0Cq6BwQ/RDrzWjo8nCngK/FXxnvMDmVjJnZ8kn1uhydg/vo62/B6JXkmqSeo/iwAEb3MSEg8oGizUQbEDQSy0uCM1yldOWV0KifC8uyBe/XQLYrytmZS1yLRwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IICL0nSE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so6630525a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 04:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717500298; x=1718105098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVoi3iNWHI3Z7TLG9tBj+kYKQu1J8puEVn0QYvkaoGM=;
        b=IICL0nSEsvhoAbnc+dFgCuERPvwbWmUS6MUNFaLbW8m2p+LwBP20Ndb5LdKPFOj1RZ
         HBJQVaNeIU2RtCftg75ClS+uVWmWOX28z5i2ut8GUNDpxG9qtmrc9lTyciD53pnGd/58
         /cmqXly9ZyQOHm5ThTedbJt7UhovSvMh99wKHPRIpUolgj29TrAB318ZRbRuxVREMHx2
         BlYN4G2QPKNMx6jEwHw7vZPWw3cgT5GdyAkgOtQR9KP+M8Wfl3zDmKMRxeCOF4qKUmCH
         b9A3SRlmSG3awgGo9q+KhjQR4MXgsCQa60Dq6B1rIoZy2XpL5tugV6i/UiE0JQJkcWxa
         YLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717500298; x=1718105098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVoi3iNWHI3Z7TLG9tBj+kYKQu1J8puEVn0QYvkaoGM=;
        b=sAeDeAiXo2evwBx57whmELyHO7jkw0XUwnvco9Mzl4yZqmlG1Mg1yyb6VUioqwdM/0
         RDiGXkmiSLpWlW6r9T8nlRMTvvkCz6a87ZdLxmiWugQGhvaqCQMPgyujcnijc4+pd40w
         218PiO3uZ4frpbzOcmnGs/ekmJRHx86JWULGuTXJb26sz/O4PntcUxl6HWFcyVy0XLVL
         vHVXCCduau4EmimQJiNdJ0vJ7mXstypVMmTH1NM14kAcIw4i5CQStTALyGj0S17JqKHr
         TykFBxA4tm1AkpPlcjbDvQcOeoNbs+QZCwvUPnmFk8x4G/2K+9Nbkta10/bEv4rS+3U2
         htQA==
X-Forwarded-Encrypted: i=1; AJvYcCV+IC7F2LrRBIU7whI5ICp35A4i3lwTeRizjt5LnfePfkeiJrt1tWobiNYmc3NM3F+jBn7Z2D9hScdxGApEd515FaOwemTJVQxn7O1eSg==
X-Gm-Message-State: AOJu0Yxq7oTjh9thQKls2fko3lzzUATRD1PI9YvZedSeq/K1CApPUCqv
	5ztpZh5pBz34FHSw7muMNnDZ/sZrrFR+9i0MordWCDhZxtCA43ClEj4d7ZQ/3fM=
X-Google-Smtp-Source: AGHT+IEZd47sJXTMV8uM1ryMX51yN7d49TYJ8zD0MZBF2jijVLZJHBuPnjltlGAa6xBy/w1X1wK6lg==
X-Received: by 2002:a50:9992:0:b0:57a:2546:2512 with SMTP id 4fb4d7f45d1cf-57a36456201mr8060554a12.34.1717500297614;
        Tue, 04 Jun 2024 04:24:57 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8090? ([2a02:8109:aa0d:be00::8090])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bbed6bsm7185517a12.40.2024.06.04.04.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 04:24:57 -0700 (PDT)
Message-ID: <980b0b63-ffea-4bbb-ba47-a0c84de5eba4@linaro.org>
Date: Tue, 4 Jun 2024 13:24:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] misc: fastrpc: Add static PD restart support
To: Bharath Kumar V <quic_bkumar@quicinc.com>,
 Ekansh Gupta <quic_ekangupt@quicinc.com>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-5-quic_ekangupt@quicinc.com>
 <f0dbb385-6aea-4721-92fa-a1f560fc7c5a@linaro.org>
 <2f52b206-3fd9-4508-b9bd-23efc5fb637e@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <2f52b206-3fd9-4508-b9bd-23efc5fb637e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bharath,
> 
> Thank you for reviewing the driver and the patches. Your feedback is 
> greatly appreciated.
> As you mentioned, our current driver is a large file containing various 
> APIs to support multiple features. We are actively discussing 
> modularizing the driver to enhance clarity and improve understanding. 
> Additionally, we are in the process of creating basic documentation, as 
> well as feature-specific documentation for better clarity.

This is really great to hear. I hope to see some patches moving things 
in this direction.

Kind regards,

-- 
// Caleb (they/them)

