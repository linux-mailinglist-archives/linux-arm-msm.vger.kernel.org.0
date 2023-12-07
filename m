Return-Path: <linux-arm-msm+bounces-3745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E86808CC5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 16:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 519ABB209E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F8D4439F;
	Thu,  7 Dec 2023 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D/+rAQ/F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4A01719
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 07:57:31 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so1192166276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701964650; x=1702569450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=el4KRznzVU5IlewCKT4pxzzQ73Z3gnpPLuO51EUCaHk=;
        b=D/+rAQ/FIcc7nzt7y9CEwkjZKoitB7zKSIr3aIdm135mVxsim2DC7kLTYwgPWAS4vb
         VulvCHMFIGxR9molOuCG9kzNTV9Ph6s47G+hAJrXBBWkE1yW0dd4URCCEsNfkr2UKgFR
         Wa2QvXq06yenqQ2QKB7A3QLLvyhSD2vOMkMp0dmizSuO5xUXVdVdfEYrRNjDFVIbb9rH
         EaswOXKt5w0e08FN4rBh/XDIzCFLr2usyQ7V0cjpB420H6KIajItxnSwhyAi1rjLhcJ0
         Gh8sQye0VdjdfzW/atpZ2s9y1wnX5nCt3nkbOPHy+4uIYv4LZWcpp0Dr1kVLRbz4M/ae
         EHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701964650; x=1702569450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=el4KRznzVU5IlewCKT4pxzzQ73Z3gnpPLuO51EUCaHk=;
        b=LD+K1eV1vxpmpJyu94d8r2Vj3dGf8ecP4Xwu6RUEfIPDFl9NEcQJagTCTXdWBHxQS4
         81v5Rq02SjRBqfID87TKiMB7UMQ+/Fsd3tDsjfr1zQ2lDVbSqkjTeNAye+kLOu7LXnxh
         hi8IMqo3EaZaPi9At8CCHiVu40bwCvM6Xohp5sz610rvVUV1Y8mjDYKYdENdsrQstRoA
         IWY815JiwXUitSH4+3drxoXp6uN82werZUIalXn6bJV8giCDFblaaB7Fp+2tUot2MXJ/
         +zYvo2CzDnS6rzZAu4xbbfl4rGDP8Pro6UL4w13tE5+qgx6j7Mc8Sfz7CD97kP59eg3G
         9B5Q==
X-Gm-Message-State: AOJu0YwUBjV67eaNease2GzbhahDuaeJ+oQNbQ/PjDUzocUyuCCD2oMF
	cqY3VVGBUPXekncQK7X6iSESrk4ati9+GGO56C7BCLjLDn6TIj7V
X-Google-Smtp-Source: AGHT+IG9r4TtcMNcv43vr160Du4eCcoL2z6SGity1U+65JMKznfVphViB/nGW5INoL0z0okFG84CnjiYfCvR/DgIFGA=
X-Received: by 2002:a25:2cb:0:b0:db7:dacf:3fc9 with SMTP id
 194-20020a2502cb000000b00db7dacf3fc9mr2323879ybc.118.1701964650372; Thu, 07
 Dec 2023 07:57:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpqg-CrbzpSqO9W6W2c=V6TN0Yx5mfih3j4cYeOLNRz+Ng@mail.gmail.com>
 <87wmtqm536.fsf@kernel.org>
In-Reply-To: <87wmtqm536.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 17:57:19 +0200
Message-ID: <CAA8EJpr5WUN81qezPx0t8H+AZSHt98Uq78kJJ7wqayAZy0NhYA@mail.gmail.com>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Qualcomm SDM845
 MTP platform
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 16:59, Kalle Valo <kvalo@kernel.org> wrote:
>
>
> I don't see any attachments, forgot to attach to it? Please resend the
> whole file.

Oops. Done.



-- 
With best wishes
Dmitry

