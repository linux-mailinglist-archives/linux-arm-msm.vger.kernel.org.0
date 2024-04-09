Return-Path: <linux-arm-msm+bounces-16945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD7289DFA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 17:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C73E1F212A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 15:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6693D13D615;
	Tue,  9 Apr 2024 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XEoWtRGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD35013698F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712677763; cv=none; b=VyN8QX0It8gQJuJSIvdRv0jAR9olvnqPUpG7dSJrmse2K5np14QqlqqW4PPtNwxSujKD7EhSIl+SsRvMYS6Ak7PYl51m3wmp1zYzeoMwRreN/anfuTUfUtzDLIqflI5kseYn9AemHwPk7YsH0tsXmdGorMG/FnXAYFA/kUIOyDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712677763; c=relaxed/simple;
	bh=xEPOMa3UUwi6CuJPtWx1BPTo8A6Ak+U5QsgkngA70eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qncskk7Yte4StlPiA7noSKKg46YeMrNn58Pj8O1OP+DukruFoChJfUgco0eLrdsQNvjrRTvXeZX/G0r5pEuFJWD5hCaSsngPCS2EROBUIiZUPSMepZmn6asa+nJWkSinoZKWwjzaU/waTEwJDO1cIBxKYAW3K6Yx/mkQpWE8v/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XEoWtRGR; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso5891418276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 08:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712677760; x=1713282560; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OkNdlbndNp8toNAiOgiu6/Unce3sg3CUz/W3fWtHCzc=;
        b=XEoWtRGR9YJT9bjncQLLvPXnXo1IB3VJWowGnu2TLBLafDrA4ksBdOo9YIi7ubs7pP
         ZYudbMrsk+qUzh52TNTuxEp9fgyMObAnUgGDLCZ5bm5/NX7ffFOdl1bjjNEQxFT/6Ogt
         sqkx6RbaSqXQaRNsPlkVnuBFqR7ym97o0mxGaMB/nMK5HDkFoSx8yCOYq1ETPEjTN93V
         VHfaGcCp9YDMhh4DDkZzlGWNfz1x3z9BIX1ZHcZw45iEXpQr70kanUjUtsGdR1LqmDal
         /LgdLF/Q93p6vy5imR7s9oCLenSPTO4p0ShMDa1j7ftjPLaM6WEGeaYe0mwWlqlp5gFg
         y2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712677760; x=1713282560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkNdlbndNp8toNAiOgiu6/Unce3sg3CUz/W3fWtHCzc=;
        b=ugMgB0Pfib9NRlEa9zPXeBQdfBuD6vv3VG3E3vNDjCP7+lB+XwZMP08I2AS7Nj/AoX
         N6e3DBQrjkQgp9ZxVLAeqWFS6N5vyQQy+rUX2ntwjde6s7fVdbRzqNr14dZumogqhD7V
         WaGEq2j38tjU3vs4XDgvhaQBcFYo7e2SOTX3SnA0Gy3pkK2WkdIIrqKM+xN4JJQaADey
         r7spibhLVyJPozmmeIOXIQZGZKeqXYdytdifOCr0oIdZ1KRcMJ43N0ZXVFw6KWQkSlq/
         XBoJnXAWriX3PMKW7UTMImMMFKMZIjKeiyXHwZOK80pyRWBtuAc4PKFMQJUDGhzsNN96
         JF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpV9aZO5XxvhLwWlO21blAFrBdU4s+zoammMnP883OpvlcVTsdx4IFvqZjDPX1APAVHdCKdR6tFYBKERGEoE3Dtx7SvZ3v+muvClDEgA==
X-Gm-Message-State: AOJu0YzKkaEpqaMrx/gaEOI76xP971PtRKghipPHEwo/+vBsYP4hdHlW
	/PMlSxW1as2wJHXGUN8HdzxMZCVze3hk+Z2GNxfu/IkkFZVjJflMmISFyuTeacP2aLWzO2LTK5O
	zvlwgH5qHmwGNCv7ppw9KVALGVcTQhItnY1UKEA==
X-Google-Smtp-Source: AGHT+IFeh65C1hwVrDbeDlM5B8VF02m23KjP2P6B/Tn9ctw/X6XN3vvtAf3zkCKw6Th02bnJpA3n/2Fe18UxYwd3G5Q=
X-Received: by 2002:a25:7b83:0:b0:dcd:4d:d342 with SMTP id w125-20020a257b83000000b00dcd004dd342mr120504ybc.50.1712677759847;
 Tue, 09 Apr 2024 08:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409-qcom-ucsi-fixes-bis-v2-0-6d3a09faec90@linaro.org>
In-Reply-To: <20240409-qcom-ucsi-fixes-bis-v2-0-6d3a09faec90@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 18:49:09 +0300
Message-ID: <CAA8EJpqV+jfE4p943pjVPWS_VOUth5r9JSg=mSyH0x33iaahtw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] usb: typec: ucsi: additional fixes for Qualcomm platforms
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Apr 2024 at 18:29, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Fix small issues in the Qualcomm PMIC-GLINK UCSI implementation.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Fixed indentation in pmic_glink_ucsi_notify() (Heikki)

I have sent this version just few minutes before getting notification
from Greg that v1 was added to usb-testing.
Greg, you can ignore this version, the indentation change is the only
difference between two versions.



> - Link to v1: https://lore.kernel.org/r/20240408-qcom-ucsi-fixes-bis-v1-0-716c145ca4b1@linaro.org
>
> ---
> Dmitry Baryshkov (3):
>       usb: typec: ucsi_glink: enable the UCSI_DELAY_DEVICE_PDOS quirk on qcm6490
>       usb: typec: ucsi_glink: drop NO_PARTNER_PDOS quirk for sm8550 / sm8650
>       usb: typec: ucsi_glink: drop special handling for CCI_BUSY
>
>  drivers/usb/typec/ucsi/ucsi_glink.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> ---
> base-commit: 25e918cf1bb906bd9aca19ae0270feb7f6d68783
> change-id: 20240408-qcom-ucsi-fixes-bis-6b314764c5be
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>


--
With best wishes
Dmitry

