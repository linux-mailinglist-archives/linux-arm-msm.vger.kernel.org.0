Return-Path: <linux-arm-msm+bounces-42527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E91FE9F4A7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 13:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DF9716FE46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5111F12F9;
	Tue, 17 Dec 2024 11:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yizJLmWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C2F1E5708
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436736; cv=none; b=s9ApjqbIOnhS2768aVhDcr+5jUD9nZHLQwhJHoaTQbvmlSvzQmYuIlcRmb8WLRrCNDttAV0mRYpky7tk5RQWaOgFcFYiH+3ps9rE8SL22gfTwexnt/PngEpKnGSa9LysWsCrPxxX0z6XhGasYSTi7IOMig0E1LW7Wt26UIkg7u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436736; c=relaxed/simple;
	bh=soafBNLZ8FGsouJngfMjummC+Zy4UWC6gJKnUPp3ebg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VwtusIjnVauUVWen9ODI+ntKmKEsbRJGA0gk7b9pNjhUf4gf5lYknLs5ZgjUlnGi0xEZ+5qQiwO1dY8U1nuHROM94elIjmV4cvEf2coirodyI1cdvSP5Hiu3CZ6RGQI5VMxTDsHJUj01PUMAbUNODWVdHHVDIV3O6BBc8T3fpiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yizJLmWe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361f796586so57578195e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 03:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734436733; x=1735041533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9hqEW7XeYBzAUP6ZyZ8OpTtmoSTfB8RARV4imdTM0g=;
        b=yizJLmWekfXcfAI/YzzzHnkncHvjUOq9CLDFmHWHV7gmZt+VAYCj1+Rqz4DMU+jfYN
         DssxO3UFy9NuI+mOc+IcHQ2/sV5xvWZEm302R7ifl+D6nNF5oZnAhn/sw9L+w4VK6W+5
         ofMjBfWxX0K5rT6SZmAb9OxDzfXvaA13dK1xysRuQquCNIOvbcHz1n0QJBeUhxa9EzDs
         X4off3nGdqtKYkNM8lILTR+AoDUWW4QyAOtllrpIgNfyZAuXZH/cSisI0/HIw7m34xg4
         6zl//K9sxYOv6y/EYSCPgVo/xyThy+q43kpUq2ylkrFD72GC54IgyVcsOTRSxa+5wF85
         47xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436733; x=1735041533;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9hqEW7XeYBzAUP6ZyZ8OpTtmoSTfB8RARV4imdTM0g=;
        b=BA26uROxabWbfvvRthDZO08I6dDZRil3wGSDn4clX34VSnPATSQxr3Pxeg80/Nptmw
         YWrOEDgZN7HLH+3LEAjDCC0dt6ZzCt1j9UQz3JYcTYgx2E8F60ufu79crsMZEyOY48EB
         e26OQH9GDivC41hxLEH0vf54oOh97LM7EqXBnxmOgrcoEcMwJ0Z3Jpsi6fST3BHyIDeS
         Thtgz4ncjk0lhsPL6/27fFRUmwPHc219PqsmqexbJNdJdRTxFUYbHn6w7jWsVEuiHoQp
         E1iuIMP7tUhnVx/FkhvZnXunYbNu+CRzdFbnitPo53osyv1uChR6QYkC9B6jhdNR7a1X
         7LMA==
X-Gm-Message-State: AOJu0YxhaL8pbdCs25OxCUiR/Lv58IcxyAfnV2ZGCGclmRm0Fbab1tfa
	kDL+7SXUl8b0Mjf/AGfjYRwg8NwYy09fmWcf5XjRlGLLuyC9Zwkcbs9ainhlhz7lXATaiCpppzT
	i
X-Gm-Gg: ASbGncvapUhFusv3WPXR0aPWpU0OrJ5uFR2yeVNLaLO32EHJp3WaioUPz9h9p5v11Io
	vuNPxJa0eTSkRHODSx3SOh+Rabmpmj6fYOa3UWe1UJYrmhwtRq9w/oZhn9dLjJcBld8PFoEnogY
	Fh5yyo6S6K+qEb+1YKiQtjM6EFDJGq3XbUXHCqM05bgONhGDb6XJzQGKHUDwXb+Av2n2hED9flP
	siQHosFz8/DqOrs41lkMEJY6SNpaQbiIUuSwh0SDKBYf5og1mBzK8zCvp9rK19jAkkRxK3MwSM=
X-Google-Smtp-Source: AGHT+IElr3X/+n1C/bzd6Bueh8HghAIVp2JLb0iFduX7Lip+4bcYo3zxNwQH3qGvUMLrIOBL7Q//WA==
X-Received: by 2002:a05:600c:6749:b0:434:f817:4492 with SMTP id 5b1f17b1804b1-4362aaa6334mr172111965e9.31.1734436733370;
        Tue, 17 Dec 2024 03:58:53 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625706caesm170318665e9.32.2024.12.17.03.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:58:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org, Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de
In-Reply-To: <20241203053048.1690069-1-quic_ekangupt@quicinc.com>
References: <20241203053048.1690069-1-quic_ekangupt@quicinc.com>
Subject: Re: [PATCH v6 0/2] Add changes to use session index as identifier
Message-Id: <173443673261.58229.12529777015910898999.b4-ty@linaro.org>
Date: Tue, 17 Dec 2024 11:58:52 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Tue, 03 Dec 2024 11:00:46 +0530, Ekansh Gupta wrote:
> This patch series carries changes to use a masked session index
> as an identifier instead of process tgid to support mutiple PDs
> from same process.
> Patch [v5]: https://lore.kernel.org/all/20241202064806.1164800-1-quic_ekangupt@quicinc.com/
> 
> Changes in v6:
>   - Add single-line comment.
> Changes in v5:
>   - Remove mask and just modify session index.
> Changes in v4:
>   - Use GENMASK for client ID mask
>   - Add a new patch to rename tid and pgid as client ID.
> Changes in v3:
>   - Modified commit text.
>   - Removed idr implementation.
>   - Using session index for client id.
> Changes in v2:
>   - Reformatted commit text.
>   - Moved from ida to idr.
>   - Changed dsp_pgid data type.
>   - Resolved memory leak.
> 
> [...]

Applied, thanks!

[1/2] misc: fastrpc: Add support for multiple PD from one process
      commit: 0c3e383ce74b4239033fceb6f241cb09612f9547
[2/2] misc: fastrpc: Rename tgid and pid to client_id
      commit: 9f86299512e04b24fb0b4a49849affbb397780e1

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


