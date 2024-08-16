Return-Path: <linux-arm-msm+bounces-28779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7D49544A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 10:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 377852831B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB92113A258;
	Fri, 16 Aug 2024 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nmbP91de"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD571DFFC
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797738; cv=none; b=qPAs1NyrFh8d8Hkf22Y/rHHzzEEKbMpCsMKdAaNd9GjOwGza8gtvrsV+WEkqD1207gtf4Wc+YWki0+hdKf78Ta43IR5frVvM3m9Hp315pgTiEvRFbvoikY6nx52z11NM9KAa18nzdmgYpOU4K0bgOvVBAFx1AFh3oeDXS58lPo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797738; c=relaxed/simple;
	bh=0oLem+Qw7ToSbyPqLYeM0bwsjJ18/XCGqteG7JrZBqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uNRm5HmesQnXT0htOkb2O5oqRl6j9GHlY5Zuy4cWZCAUBjTZ+Ohg6/sneiaj6ZXsJ1zPPlkfilSfhOoeTixYgVEaIZ8tJJmKrwWO+VwWD+BKHtFqpQnqgGfWADLjOnPn8gtPlmQymdM4ZGztwNtyVu8YTwcxelQ8o8Xor2yryEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nmbP91de; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428243f928cso12441705e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 01:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723797735; x=1724402535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Mf1jwtU1IEC5inSpAw3zK8tivE5WAs13EhnH9rtxkM=;
        b=nmbP91deSlmVc53sNgg2P288kTYh0BaMgP+CjpUxSbQIJB/axrKoeml6ZMMh44QSY2
         B8I8kQ/83DdrvnhP9lKpOOr1oKWQkYGH52FKZJ9A0B/90eu2QsxTZFRGUCBCiZNwqe+t
         DLrjvfZoh/FTfSmFyLexxlHuVNiOSkavWoAp7gqsmX4YdsR6HlzLFUpPVT31VoRUSjBr
         14QMvIJBLnd7HsZ0I1pZFTpUfuxh5dfRv2GFpi8XrWj4+ot7vF4IK24Khq5qn+YAF/gz
         bIbiQxG7Wkx5Yufr+xUS1mzxKxPNthP9lu2oCvB9bAMUBX/lT8c6tAm4qpoh3AviBwvM
         ygrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723797735; x=1724402535;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Mf1jwtU1IEC5inSpAw3zK8tivE5WAs13EhnH9rtxkM=;
        b=X+Go1vKUdjlAktRb8fCmKY5UKvM23LqepJnOecHTU7YKx/HZAharrfvuNCYU0Zw9/U
         bUUl0m3FKE20QP2iXJRE7gl8P4OS+Z8yckCplLsGzS28AuzCPnTN9K/ouUFqLjLSUY0K
         T0Jxgs9K8Z/PL8FesrWv7umKzez/ZjOlEO76Q5Wn1a5fokh28Bu/1/hCFdUYmHLhfwAG
         p3GMxoo+B11jDqBHRwTeWt2/alWTeoIIbNm7kHLTyJBayySL9a+MLxXJ542lwqNQdRfl
         b2PD2zvTrgoqEYOqoBaqnTGShrEoQu/Wxg+TZ2wMwV3Lnj3YObmlbI0LbQAWjox27FmR
         DISA==
X-Gm-Message-State: AOJu0YxEe0k6ML+KaFL5cV9wKj55k2D0g1vuy3yDOfa5pI8blZ2ehvey
	Zu3UA1/5GVxC9OZnmnp8VwFS1C3z0H3nieG/72RpdwtTn7WXoaebwU56eWSYAmE=
X-Google-Smtp-Source: AGHT+IEf7cfbN+gD7oBAopP7fq2DDt7WFnAIqgbBVgGTKPU7rB9hSONbmM2OmELOKV6w4B7AP104YQ==
X-Received: by 2002:a05:600c:4f4f:b0:426:64a2:5375 with SMTP id 5b1f17b1804b1-429ed77da5fmr14056025e9.1.1723797735389;
        Fri, 16 Aug 2024 01:42:15 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189849831sm3134341f8f.30.2024.08.16.01.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 01:42:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Sukrut Bellary <sukrut.bellary@linux.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230602113602.1271695-1-sukrut.bellary@linux.com>
References: <20230602113602.1271695-1-sukrut.bellary@linux.com>
Subject: Re: [PATCH v2] misc: fastrpc: Fix double free of 'buf' in error
 path
Message-Id: <172379773428.48571.12712764336372215330.b4-ty@linaro.org>
Date: Fri, 16 Aug 2024 09:42:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Fri, 02 Jun 2023 04:36:02 -0700, Sukrut Bellary wrote:
> smatch warning:
> drivers/misc/fastrpc.c:1926 fastrpc_req_mmap() error: double free of 'buf'
> 
> In fastrpc_req_mmap() error path, the fastrpc buffer is freed in
> fastrpc_req_munmap_impl() if unmap is successful.
> 
> But in the end, there is an unconditional call to fastrpc_buf_free().
> So the above case triggers the double free of fastrpc buf.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: Fix double free of 'buf' in error path
      commit: b056e4e23acbbbf12fa011caa781f7cecbd5b311

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


