Return-Path: <linux-arm-msm+bounces-13886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ACB878C10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 01:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D51D71C20F6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 00:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4319610E6;
	Tue, 12 Mar 2024 00:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZ7bWkzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8CCECC
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 00:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710204932; cv=none; b=K7L0VSxdu9UlYrKpry5pEnBCel/1eJ1KiSb88lTL0toh9KgcZUZ+ZevvFEvgAqXvUU/ZyXunAZurYkpm9g/pJpKtA2Zx+TpD9z6eZI0lpijUfnpa1vJ3g4Pa5DMVyOWuE2lJhRRPQm8FXOSlpIqlA3tvSFlWRtUHxN6S2yZAj7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710204932; c=relaxed/simple;
	bh=jsqyfNEt0TxDtZ+H+pJTRDnuvRvMVS0DcA6RBF1ySg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jhj4YnU6x0GCKLWW9sxPv+DtEcDg2TKI719MptJ+ehN2NxA4MmkuwbmPQrc7yVuLmY9S4UAg580b5PA6kE1whY15lDB7QGtrV9MjKOhLUBH0QGLnvLB7zL1aGdFP5TS4aFQ5Lp4Artm533IvxgKl7anPjjPoI1/8BaMKojN17+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZ7bWkzQ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5131c0691feso6448656e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 17:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710204928; x=1710809728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PdoIEcD5Pj5IoGiWkY5Edp6gwijkMLmt1mJCGCeVgkA=;
        b=TZ7bWkzQIGy9G5YxB065b/UdEBrV4IlU1Vqel4LsI7ch21F4TtiaGS3KcvPqs1+cZz
         UMu6VYh8N2rLLWH2lRpsIFfid1YxF1t25q2gSkwzpHHqDZqgE1Q6yqlBej/QNaJYYBZs
         u/1EzqAFVrI8SyaOMYzP+tclDYD85RzNGXvvPnzs/J+Rx1Z+cVP8zGSmtX6Jm8qBBZKH
         2cpxNvOkoW6+K6pXnK3K5tVITX0AU/oB1S8zsHxRAa/bNaOurUY/iNF0WpFCvQwj87VX
         2VIufTrBi9+n9cgnOQfXmv1aDdleIsAl8+yqiUP5QYrGj7nMwpMLaOgNuMkjLljkSXbK
         yPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710204928; x=1710809728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdoIEcD5Pj5IoGiWkY5Edp6gwijkMLmt1mJCGCeVgkA=;
        b=VyMpW4CO6s4cC0+e3h9n+3SDMqgGUuSTkrYYKtGE29hChap4ascbVsy9YC7zyCAs1f
         H9pKBxsLuT6/uKUA6C2nyt4m2LE9IpJY7qNEPPfElSSRLJBs/jiKzz9jP+HPpUZLR8g9
         s+YuUajqimhc0CrvpT6fPBNtxU2nd6rNNKZLvVFfnZOS0U1GhMPcsHFAAiwRAKUJ6d7k
         FnRY7vv8fHH6280QmIN0kgs9pZxE4Y/pDJbiy0wKuUfjJ8vDb2LQ9b+coH76oahBNwJt
         xQvPTvjiF3Rpc0I5ywlxwOcn0noSyuaWSdhIuzCQNvPZsyBCzBa0XVJSoguuh8RqrLdf
         Pw1Q==
X-Gm-Message-State: AOJu0YyiYIrqGd0Omm3063UqwCwuIEPZTYqDw/UHNDkge7R+gCLXvo0f
	ZYQBiyjTtPisxY32cAA6fZrYmU4i25HsjUyT8ZXTTpG7YlTC8/0MRYofU0fXHUU=
X-Google-Smtp-Source: AGHT+IH/UsisTDBRXhaCG1Dg+Th26na8Pxiwz2vqMx2ZxUl282ks0HFWJT4eGbyTX7PNkbgsHg9J8w==
X-Received: by 2002:a05:6512:741:b0:513:1cf6:5598 with SMTP id c1-20020a056512074100b005131cf65598mr4257224lfs.42.1710204928626;
        Mon, 11 Mar 2024 17:55:28 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n23-20020ac242d7000000b005131b423d80sm1311890lfl.160.2024.03.11.17.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:55:28 -0700 (PDT)
Message-ID: <5219fa82-125c-4b8e-a6fa-e0960181a62f@linaro.org>
Date: Tue, 12 Mar 2024 01:55:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] soc: qcom: add pd-mapper implementation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/24 16:34, Dmitry Baryshkov wrote:
> Existing userspace protection domain mapper implementation has several
> issue. It doesn't play well with CONFIG_EXTRA_FIRMWARE, it doesn't
> reread JSON files if firmware location is changed (or if firmware was
> not available at the time pd-mapper was started but the corresponding
> directory is mounted later), etc.
> 
> Provide in-kernel service implementing protection domain mapping
> required to work with several services, which are provided by the DSP
> firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I'm far from an expert on how this works, but to a non-expert eye,
there is nothing outrageously wrong.

One suggestion I have is to use cleanup.h and scoped guards to
save on some LoC

Konrad

