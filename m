Return-Path: <linux-arm-msm+bounces-29123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBFE958843
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 15:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B68831F23294
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 13:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C439B18FC93;
	Tue, 20 Aug 2024 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxywgFtQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E4A189F3F;
	Tue, 20 Aug 2024 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724161793; cv=none; b=X8WeFVXRb+uvxnzchWTO5ejKR/HN74UY6tbe9FvaEZfBo1jeSGvcACunm6hfnADMRzm6Ytx1TDizxYqpbQx+X1/L6vwzbUYQXGhGgmKTTGL4jg41xpZraoHMH0rJDQYUV8cDG7c3urH3ahyPz8VOwHzlbomQld+8jiLyLQYu3cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724161793; c=relaxed/simple;
	bh=mq326+oxJPr30Y8cLcAldCHG2SBJ9NCNUB1ptLzX3QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhTZ+Ypz74uowe5RSILYPqnH+u+Unh9kJfCW8tb7RvFU5LTrslJabjs2oXuOp719l9vbu2PKyzZe+CCn4Pq/zxy5y0dz3gZeOZf92T+uUB6TSU8Cqdi96v9oGMH84Vy86Gjg19iFN7N8fRkD5kqOhnybBu6QJjdG5xXZ7oLW2X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxywgFtQ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bed0a2ae0fso4593932a12.1;
        Tue, 20 Aug 2024 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724161790; x=1724766590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mi6P0KgyJuOg2DIv54r5lv9DcqvreKk8Q0moUstK6LI=;
        b=KxywgFtQvN+eiPky5IauhHhJbN5XWKlamoPc8jkzjYCoHLH+ul3xRFyKczK4gHaiLb
         Os4kJ4O2OABgTFEwB6+PZrBNc0H/OiV7L+bpGgn5nV44ey8K4HIL9VSKh9lC6oUmHCl/
         ozcGWrkvjhCu/bU4Iw0a9nzP/gtOUtCb22m9bWVcfuzoGvznKsAt1Mj+LA9AxS11LG8D
         RrCz9cQJnlWeMFEhuwPitti+BesyabF3NGA+LSaMEouaB5Gw6ZAIz4hgVX1aM6DC4Scd
         cgumkvTgd0AMXElmcu3rj4wL7TbjPtcuvDBIB/OmPcD/kb3PC/wymZuVQfb+5i8KXJI2
         lz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724161790; x=1724766590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mi6P0KgyJuOg2DIv54r5lv9DcqvreKk8Q0moUstK6LI=;
        b=O/lBB15IUf2OD40+2bI0uWQeJqU+Q/nScNrMVCTVG0VHYpyLd7YhkMV8A+aPzQ2ndi
         dWDUflwrjUFvSM883cIPM1NiHM6sA9VPvEFT136Q7+SLsSlcRQB1cR8Ezm70P9qusk8y
         ZjTQQk8TGwFXhjFUDdv3ti4pE7hvaQd+OQv7MloH6wLaq/MSZvjL3vbKQJowcjcefXYA
         Qs8S5ENbr7eWKn+GNGrToMfpMui4i4r1UMkKgbegp0333er+9pSigPLh+izrgG5lasUZ
         jM50t4z/Fw3LDMLiZwp7dYguifUGLSfHZR/U1XgvHSe6QFhS7l/w1Q5uYTlbDGhtgsmT
         bkhg==
X-Forwarded-Encrypted: i=1; AJvYcCWw27gbWpS5uTVy8p7UhzU/lVwQfkhoQNzTJIJPOzw5DsG7jhWWa4ZjSG9owPCcn0BzBs80sB6URaCstxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc5DiRuKBAVu9lq/mKJc66VBEoi474iXQ3LFq5gOskrTatuY/4
	Z/iTwq1P1h9ocLi0D6xtk1rpLb4k5KlGLFrhlxWdBIeSijsixm1s
X-Google-Smtp-Source: AGHT+IEXvQEyjaLUUTKVUVXyC1PuVlUVxioiqu3aSU26ykNG9MQuXj9MG1IeuWH1QcCO0RHfQJinRg==
X-Received: by 2002:a17:907:3e1a:b0:a7d:a031:7bad with SMTP id a640c23a62f3a-a86479ae76dmr141428466b.16.1724161790082;
        Tue, 20 Aug 2024 06:49:50 -0700 (PDT)
Received: from [192.168.1.14] (host-80-104-252-9.retail.telecomitalia.it. [80.104.252.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cfa0dsm762254566b.69.2024.08.20.06.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 06:49:49 -0700 (PDT)
Message-ID: <e0ec6c9f-898e-4bd1-9b32-d291ec716788@gmail.com>
Date: Tue, 20 Aug 2024 15:49:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/msm: Add submitqueue setup and close
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-2-7bda26c34037@gmail.com>
 <613c79a6-c32c-4c3f-b648-673529004e49@kernel.org>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <613c79a6-c32c-4c3f-b648-673529004e49@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/24 12:10 PM, Konrad Dybcio wrote:
> On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
>> This patch adds a bit of infrastructure to give the different Adreno
>> targets the flexibility to setup the submitqueues per their needs.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> ---
> 
> This email doesn't exist anymore and doesn't match yours
> 
> Konrad

I hadn't added mine since this commit is from the previous patch without 
modifications, I will add my Signed-off-by to it since this address is 
no longer valid.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


