Return-Path: <linux-arm-msm+bounces-3730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2652F808B08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EDD51C208FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E823D0D4;
	Thu,  7 Dec 2023 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a9mwNEUW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0799D170A
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 06:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701960628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z40f2Fj9Y4MJPtpLN8oop6sdLxqO9gAb+p2VS6poMvg=;
	b=a9mwNEUWP8tWD2dKlRhFpoFef6AkM8uYVNKLtJU31szh8Ud5uzLQQQBgQLJVeQ8orPhtEq
	OLGOAu1123NRsCNorB0j/xoDi7PIWDJz/uCY4Hi4aKlrrXuUMv+jjlRiVixBc8fNLaIDQZ
	JGIA7z5rdiEUoELh/hYrBZOs0/tU+N0=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-9ByeB6BHONa7tJzfOiOj9w-1; Thu, 07 Dec 2023 09:50:26 -0500
X-MC-Unique: 9ByeB6BHONa7tJzfOiOj9w-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-58a276efa48so1002446eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 06:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701960626; x=1702565426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z40f2Fj9Y4MJPtpLN8oop6sdLxqO9gAb+p2VS6poMvg=;
        b=Lx/RYxg2eR3yliylvNgEHAm4V9fRse2sRcZTT0gsCtfpZcqG3Mm0A0x8Y8cvxdj7ug
         qNhfwDOWZkUMaxbclqYxVnK+u85XKCMyFzbicvjzioXzsJQb3IR+LSzyThKRswgJPopH
         koPRZyHWAnsiYCwWLKgT7xotLvZkQBiKthX7QrzRQKIjAmUB827+Wjd4Np5OofuRfwGl
         6SAhHw9nnVOelYKV7G+tbQOWdTIdB2eEv3PfVOEdG1g8w7Mt3I1mj2Xs0Dad+2lO7Oqz
         TbjGOUVX51396QpbscS7UVmSrdYcW/D74hVwzX9g3L0msqjjbHAqieU43sIRtnB5AiTs
         R0Gg==
X-Gm-Message-State: AOJu0YyfOYbWFKc2Xu7fAXgD6csyqstErvoZR0QqvN86gLJ/Fx1dTidl
	j+Ls10EOofxN+2lNNx4SMKH+q6UedqT3g5TH8uXSPP46zwErRoACczcKnaIQGunddCwljdh5MQ5
	F4/gduRK5p5BcUwZFkGvqB6fuug==
X-Received: by 2002:a05:6358:938c:b0:16f:eb38:e930 with SMTP id h12-20020a056358938c00b0016feb38e930mr2901432rwb.13.1701960626273;
        Thu, 07 Dec 2023 06:50:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFN6r3K4vxPrfCUgyW4H13rPHjCx4Kbxc3KQVv9VJAn/47jz87juDBKDdsYhKUTxdaPY9iGhA==
X-Received: by 2002:a05:6358:938c:b0:16f:eb38:e930 with SMTP id h12-20020a056358938c00b0016feb38e930mr2901423rwb.13.1701960625993;
        Thu, 07 Dec 2023 06:50:25 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id m16-20020ad44b70000000b0067a2b91f969sm540730qvx.117.2023.12.07.06.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:50:25 -0800 (PST)
Date: Thu, 7 Dec 2023 08:50:23 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] soc: qcom: pmic_pdcharger_ulog: fix sparse warnings
Message-ID: <tavnoj3mt7ylwuqn6giyqimppxn4s6ig2b2uusu2dgd6knybkt@p6ljuiq7nkef>
References: <20231207-topic-sm8x50-upstream-fix-pdcharger-ulog-sparse-v1-1-43f75455a9e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207-topic-sm8x50-upstream-fix-pdcharger-ulog-sparse-v1-1-43f75455a9e3@linaro.org>

Hey Neil,

On Thu, Dec 07, 2023 at 09:31:54AM +0100, Neil Armstrong wrote:
> Fix sparse warning by comverting values to le32() as expected
> in the get_ulog_req_msg.hdr struct.
> 
> Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312060355.M0eJtq4X-lkp@intel.com/
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

I already sent this change (among two other small issues I found) over
at:

    https://lore.kernel.org/linux-arm-msm/20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com/

Thanks,
Andrew


