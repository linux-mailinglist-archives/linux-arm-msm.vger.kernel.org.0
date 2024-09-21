Return-Path: <linux-arm-msm+bounces-32131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9834F97DC02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 09:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B5DC1F2152A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 07:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C7915E97;
	Sat, 21 Sep 2024 07:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lh9i/CUb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6D215E8B;
	Sat, 21 Sep 2024 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726904734; cv=none; b=qWCrJnciK7M3941+Pi0UUw9evTE/Dx3DWVi+agPKcCFxx+DTplp/HWcUhDyWXUFJGqLOPzTicVtWvty86D/N2CaBKKT9I5Hwp2DlDuBy0jjpEBOuEyD/DoJI4wNsjAGSnzz6lW0G7x54Zf2/FyafFXvcqd4M4v1yunTqvVf8j48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726904734; c=relaxed/simple;
	bh=P4A8/TeKUeWC19dX+4wsOaQphVgDgS5LnrFxCEn3j7s=;
	h=From:Content-Type:Mime-Version:Subject:In-Reply-To:Cc:Date:
	 Message-Id:References:To; b=TzRGzgy7AU1JiYP5B3ErFUZtKV1Qv1S6JwZHNqcADpFu6dqO8IegAgKrjFO3zEBoDcY/NRzcGga6Oo+nHXWy1Vh1e1VCh0Xp72u3FEwUDW+cBp7D5hRpodIF47kRFJk9fKhLPBnJR1a0ZCJwe5EgQHbcdLt98/G84G9CmJlIFoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lh9i/CUb; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3dd16257b7bso1311329b6e.1;
        Sat, 21 Sep 2024 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726904731; x=1727509531; darn=vger.kernel.org;
        h=to:references:message-id:date:cc:in-reply-to:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4A8/TeKUeWC19dX+4wsOaQphVgDgS5LnrFxCEn3j7s=;
        b=Lh9i/CUbds5OYaPvVeytBKnJOTlIAcfcdlv+Xry9un7adicP4lK8fhOFpucfZUwz5N
         cohxIUK+IiGYQmhq+ku67CHE7WoBlQM8tfw1Wn3gdVFuydSxaTlD3SlaqBbaYZRyy11X
         4lLB65xEnyjEPuBCMmD3l+nAN+DpnJBmgCZ9XxFknHsZLdv6OKm13XnyFOcihKkph1C8
         s3mEUq9XzEiCPz9tuexEV/9SPNF/Wrg8AlU7IrrZUUCB73FeqK9KHJEGhDxYi8byV1W2
         uP9hBs96WnWRf5VCblJPgxd0xr8lMolDt6jJKze0mG4uT44kfOfZS8JuUc2ALFFJNk7N
         aw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726904731; x=1727509531;
        h=to:references:message-id:date:cc:in-reply-to:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4A8/TeKUeWC19dX+4wsOaQphVgDgS5LnrFxCEn3j7s=;
        b=ALafzTtkrJU/kbuC47ePFepXlgFxWE+wk8nlDd2ytfAi2XYddUp9uVcLJr+IcuG1wt
         vhRA/9n86f9WJvYFSGPciFdsVKSwXwKkVaXr0Hfx4hzRMCKBLZUPqiAsvryqDXZnXugF
         CGU8ir42ipIqEvTm5K550kRM5TlI4ulvy/Tfax1onXpS3O3QYP1UD/rrRM8HgnwtkkS9
         ZIZPQg1CDFq1w9VSNEU/eK7HGio5nIVRLbMKKRQDvkJa5j4ymDI3TEDgCmI/K4QC3xjq
         NiU7jv2NHNTgkr29t5kGX/RF6nH1Mi1SD+J8AqMCj4qvuD24f1PpcJvwHCMfmrx7tq+V
         EYow==
X-Forwarded-Encrypted: i=1; AJvYcCUHOyNBKhfeF6Gho+tpreK7EIIk8iuEQNTjKQkKg4es0dnPKl90Z6f4mjuJHgB3Fvm0iinqeRTQNnlnKL+R@vger.kernel.org, AJvYcCXC9qRwgtSkj38mEdkI2rPDfNFmp4I/xWi71UcKCrT7UXAi3/fu4fD+VHDFhFKkzaQmiHfq3uS2BlxMNodY@vger.kernel.org
X-Gm-Message-State: AOJu0YzAAhdR1T6Qz8H7EU+c7mvS0YtEtiXOrF6vlXqBlFXAduw+5NTo
	ltk3jxJcL8Hd0pNiorUIFzjLH21HFRbp4nOiZio1p4fxQyJl8IbS196+SsBg
X-Google-Smtp-Source: AGHT+IHB7WVkdYZ1w1eCx+yBcJxQ9FiDVTJ4u01Fh4ZGEgs3Ld54S3HP36zHfsP7UFFJ7oCdMJBCEg==
X-Received: by 2002:a05:6808:3a0b:b0:3e2:6b70:7a79 with SMTP id 5614622812f47-3e2728ec132mr2921964b6e.1.1726904731321;
        Sat, 21 Sep 2024 00:45:31 -0700 (PDT)
Received: from smtpclient.apple ([2600:381:5b92:bfe2:2169:4915:ffee:bb2d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5e3b0e43754sm2520849eaf.42.2024.09.21.00.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Sep 2024 00:45:30 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
X-Google-Original-From: Rudraksha Gupta <GuptaRud@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] firmware: qcom: scm: Allow devicetree-less probe
In-Reply-To: <fqdmcct5b5sxv3rpxiksmzpjbpcwmyuwpb5epjnhgpzxh344pp@pxggownwv44n>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 21 Sep 2024 00:45:19 -0700
Message-Id: <547C76B7-8E41-44C3-8433-374B4E6BC341@gmail.com>
References: <fqdmcct5b5sxv3rpxiksmzpjbpcwmyuwpb5epjnhgpzxh344pp@pxggownwv44n>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: iPhone Mail (20H350)

> Which devicetrees? I assume that this mostly concerns arm32 machines,
> but I don't see if you have tested this on any of them. Also on some of
> those machines SCM require additional clocks, I don't see that being
> handled in the patch.
>=20
> If we are to manually instantiate SCM node, I'd prefer for it to be
> explicit, e.g. MSM8x60, create SCM device, using this-and-that clock.

I believe the consensus was that we will be using your one liner fix instead=
 of this. If I misunderstood, please let me know and I will happily test thi=
s patch.

