Return-Path: <linux-arm-msm+bounces-22046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0745590019F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E6BD1C21A76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E79818629A;
	Fri,  7 Jun 2024 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kdRobhu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0309312FB01
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 11:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717758497; cv=none; b=p7sGyQIa1OS1AQj4ON08w22gJN9jV+/UKxWZQuqEaneWwm9CBvAjK6v3mk7AhM8AM65ZG7gwusqAernLxCg2gqNw3LMeRecDFmlcW3PAqqGTHaHgxwygQRstgvCnv9THxZZfLoAWq0NKnhwAKkfgYjd4kDr+pX998nD3fcklGtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717758497; c=relaxed/simple;
	bh=grRwC724PvUmoNcGmdXgtk47euMXChWb+9LwIxsSnRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmZPafHDN0tJmgnaI/aCrCcZuehBkiH1kQTJkYlvQUGIdZQZwGv9TsNil4AcikIGoFjttu1pnR87z+JYy90AhALBmzyNRWMOdI65+IFHNNqaigqLxcPOvF9m6VfyBFc3XW1cJxsVWfxSVrG+ryZIAiodOQEijOMekEraN6+jK9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kdRobhu9; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b840cfecdso2348697e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 04:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717758494; x=1718363294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwvApUeqo/GeZM3yb0HNmlUq35XuhdMdPtdEy3Zogv4=;
        b=kdRobhu9AGcaO1stgTyvif1eN+kQNrtnOkAgo1ucPz/tBGc/g6skg+0nwYCeE0UbLI
         Fxv3kbz0VBrT7y3TyS16KO7lA7mnJdxP3r6XAhGcE61Mc9wgzl2m1/i95aVKgESVuS9y
         cu+xv1ePWw7fB0hLY+bmsvb1qLv1upK5DQmkDd/IqfCwvsVNfZHixRZXrUymgmyE+C8p
         vW/nfCeWpxlGD61jNPbvbwbunxAWYDLvtAVa3e55sliT5ls7MZG/Fl8n59PhDJxY5cZQ
         cuU2tt7tQtCkBrk09ZpC1D2Ug6KfVbfO3UpSedDpZmPd/M8VwdjACMVUg7nZt5R8XMej
         SHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717758494; x=1718363294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwvApUeqo/GeZM3yb0HNmlUq35XuhdMdPtdEy3Zogv4=;
        b=Qjiqa7Ooz9MiXfLdLK06CXmNU/GLFQbVGzDJ3lB9KouT7b4OTC7L9PslRhfu2XLRcg
         ce8VN3Z/hthWjapNgMj/ndEl/HNwo50jtAwaC4AUx+q2qkqped76h9epT/yRliorX39i
         XOnvLKG+Wdd7QboJiaUwnxwGK4xV45K+a1H4twVc2c3qJwwhXMkfKZtGWJ9fk7TFLQ+o
         AIHX7CVy875ddihOfgI5HAXKnz9uDTMRnwmLSsGrqpGB4FNayGfZVuN9lP72DfJaVRko
         QeLIoxjr/0UY/yZCA8/m9icdIoHh3jt9nM99q8Ew0r8rY0MLauGAWYBS6QTwkdYIyj4a
         MCjg==
X-Forwarded-Encrypted: i=1; AJvYcCW+3pdNZzb1geT5OX6jAgUfh4s4qlEyNPzUxYDDA65IC+VF4Dhfbl6/d5emVZRvUCJd5oiWws2TPq4VVddF+qiu2jeXK9dlVE6MTZItHQ==
X-Gm-Message-State: AOJu0YxEMiOQvyB/pcJ6rvzpTzffnaPk3Y49NudgqsL0jCKLwireiXW2
	4G8qcRck2S4QI724xFCHGBS0C1zLfWHIrftw+I60DWbSN0vQgHLVq8E1/Q/EUhQ=
X-Google-Smtp-Source: AGHT+IHMqehAzz0w5PPYFquWBtdJd6J+PcTWUMrSDVqV2ejVV83fMkFQGsrAwfj1Oh2Peqi8rq2fUQ==
X-Received: by 2002:a05:6512:b9f:b0:52b:82d5:b369 with SMTP id 2adb3069b0e04-52bb9f7e70fmr1530867e87.27.1717758494141;
        Fri, 07 Jun 2024 04:08:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb42166c9sm498491e87.164.2024.06.07.04.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:08:13 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:08:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v4 02/11] misc: fastrpc: Fix DSP capabilities request
Message-ID: <ueglf7wcoi7prt7wrjp6nfjavzksk4wybepep3qa3xmpug4hkr@ha37oovjfbbf>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-3-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606165939.12950-3-quic_ekangupt@quicinc.com>

On Thu, Jun 06, 2024 at 10:29:22PM +0530, Ekansh Gupta wrote:
> The DSP capability request call expects 2 arguments. First is the
> information about the total number of attributes to be copied from
> DSP and second is the information about the buffer where the DSP
> needs to copy the information. The current design is passing the
> information about te size to be copied from DSP which would be
> considered as a bad argument to the call by DSP causing a failure
> suggesting the same. The second argument carries the information
> about the buffer where the DSP needs to copy the capability
> information and the size to be copied. As the first entry of
> capability attribute is getting skipped, same should also be
> considered while sending the information to DSP. Add changes to
> pass proper arguments to DSP.
> 
> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

