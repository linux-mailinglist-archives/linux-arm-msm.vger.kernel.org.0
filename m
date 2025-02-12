Return-Path: <linux-arm-msm+bounces-47783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F0AA32BD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 582911697D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 16:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28764253353;
	Wed, 12 Feb 2025 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzQyaAEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35AA253340;
	Wed, 12 Feb 2025 16:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378071; cv=none; b=rqrn8PwRnce15271Lid48UiS9s+RHaAwbLQnmd3SzaE+slpXdLMdzsqqC6Rha0HakH4i8a34SBwasp9VVvM0QTUCECUsYE6gXlO0pygYp8o86i88MWqh8jHPQmVcgHTqd4W2bf8bknoMDN/NrPVlP4ahEy5slLblyvwp/zOpZIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378071; c=relaxed/simple;
	bh=dBQoUYaXa4d4ogi2nyqmcSgid6trtFQxYEtCTUyXRKY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K5GiJamqAy+BI6uq2gcIZb/3JwfNKdQT8BXIj8cd8TmnIjL8Vlj6mcV8J7seuF9lW8n4VGFZbJaGA9bFYnlk4+yq1wMt8oJ3TwNuPvZV8WL97dSa1LPzwisXp9OvQ+q3wSiPN/iSzxIlI+2iZ6c9yAVbzyDBR3WcAf7koJg1pD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzQyaAEp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f7f03d856so77351885ad.1;
        Wed, 12 Feb 2025 08:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739378069; x=1739982869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHPS8ONfsNETWz2nc3cOX8k/kEuKPVG4fQ9/eH959Z0=;
        b=FzQyaAEpBTr2dp2BJ1FAyiUZFe3CBV8urQlicoh9CJ5l7M6QD3Ds+Md3Hbt9C4Mgbm
         K3QwbX6D6Bq3HLOYASxD+KVqfyAHN2NVwRX2qrQZqGArh8EYvczTO1hH08aIkFc6FiEK
         HIxmHf7FUabZ5z+v4aEwnZ/q+3Q5zNgHvGIoUXujE97UM+Y12h7B4KGvcMF8x3WTDJNC
         JjNqRGoPeUigii33I6pHSTLhlgw7Y2BAiVygrE3Hun6PVK7bWG+69khTx6J8Z3ZdsLhj
         ywVKbp6MoXb8FeI4Y4lrnpV+UbjHPT1PQ92T1cgR15NigW0PSM1NNJ8w5J2OSyafCWrE
         4c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378069; x=1739982869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHPS8ONfsNETWz2nc3cOX8k/kEuKPVG4fQ9/eH959Z0=;
        b=EZM62oYJJXdwfyJ4gU+i4ztyGSm67/92oT2QNDiJmQlSGsvmRyWj7nzZFYz0QVL/nQ
         Jlk6DOILramjhApLHMAYM6tCotQCvWKMQQolKhTETublmXcp/6QbHOMUOCxS6Dw02xnT
         7cMp59WNjtdPxt8aEisw6rUVJMQsVQ20BdBp3iu4/7OiIUheron7aZSni9YAJHqv9642
         X3QbPKBqnpZTDx+yBrrv5Ryio6ifR7sjc+qw0PU4g+UT3V++85tou2uJvh9HIdBY8RjY
         baBjY5Ccwv1uN/i2Dj0LFiYF4yWLT6Nk0W4YRSdkQcl9y+0IZSVbNDF74fzNDriECfZE
         29Uw==
X-Forwarded-Encrypted: i=1; AJvYcCV/Xn8O5zDmjnKoTZRBe35DnjvcV5ry3xLBmzp2+HgLcYTJ1OqGoAZnhixCUthz9GNAJkSEKbtb+ZQnUyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRf9S9KNtHwB9QOaWAcW4s/h59mzDtT81jeP/MP0H0UtTPBXg3
	wKJc9m4S03lBF/JwaDV9qlrJp6rgBtBmm3GkHmGcFGIAnTXbTR26
X-Gm-Gg: ASbGncuQrRB8NlqCnW3lSoibBLVrGR21LZ8VC8VcMqD8aY7iCdBsltQqMgdfvoFnYDZ
	VbPF3vGuBW46gmw6iWboC2f7X1Ws5S+vhIFajnr9bt/mENKgb3d66FwZAbLmQae/3u2tjuQUd0I
	wlNnyfnjy54ZS+EfjFSGO9+5SIyPjA1b9R/hpzpNlFtEqXxz36p/vQl1iFuI4HTcWPiQmIb8PL0
	0PLeU+QZhVdiRnAdtXueQE5LtVKiwmuYnE6B6APl5pHs6l+aQffcrNBe5RhYSmH/Sl/uumItWjL
	Fv95cLqNg+JwVx0eLL7khyTUOcWR+G5EQwz45BQYqA==
X-Google-Smtp-Source: AGHT+IHpWCKkyJHSEXStV4LCf+CwXDSfRaygI/Fta18M0uObTTXfOcrYoXNzZs2kPRJ5RVucDH+dfA==
X-Received: by 2002:a05:6a00:4188:b0:730:9a55:d921 with SMTP id d2e1a72fcca58-7322c390464mr6068874b3a.14.1739378068903;
        Wed, 12 Feb 2025 08:34:28 -0800 (PST)
Received: from jamesmacinnes-VirtualBox ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730882d214fsm6596794b3a.18.2025.02.12.08.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:34:28 -0800 (PST)
Date: Wed, 12 Feb 2025 08:34:24 -0800
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 0/2] drm/msm/dp: Fix Type-C Timing
Message-ID: <20250212083424.2bf95a43@jamesmacinnes-VirtualBox>
In-Reply-To: <yle4tv3rhxkygvxvq56pls2u4muzmuxlzg5mp6ibckkyhbaycm@mv4hmom2e46c>
References: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
	<yle4tv3rhxkygvxvq56pls2u4muzmuxlzg5mp6ibckkyhbaycm@mv4hmom2e46c>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Feb 2025 13:20:01 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Tue, Feb 11, 2025 at 07:42:23PM -0800, James A. MacInnes wrote:
> > SDM845 DisplayPort output inop on DP Monitor and tears on HDMI.
> > 
> > Fixed
> >  - SDM845 does not support wide mode.
> >  - SDM845 does not need porch shift.
> > 
> > Verified functionality on SDM845.  
> 
> Please use ./scripts/get_maintainer.pl to get the To / Cc lists. Your
> messages missed several mailing lists and maybe some of maintainers.
> 

Will do. The list from get_maintainers.pl was very long and I was
attempting to not spam everyone. On revision I will include everyone.

