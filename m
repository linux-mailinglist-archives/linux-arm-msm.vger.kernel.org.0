Return-Path: <linux-arm-msm+bounces-35273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D869A726C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 20:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D740DB21B0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 18:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAD61F9419;
	Mon, 21 Oct 2024 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KLv8i0wX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BBC194AF9
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 18:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729535680; cv=none; b=jlkvb9M9icZkwp82Wp7nEf700E7/k/o9uPmKdV2PY9y61OTb0DZQzCKJF9SsvwvfzX8EhOtAuzGjZsj2ijZ11dNHwKGVhGLQ2UeoIritKKZ7dL8opOYQ6kSekvxCYiHq9I5j+Ne7uIlpzdQGgy+RaUvHMmtOq+CP6lvH5RZRCu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729535680; c=relaxed/simple;
	bh=XV4b4N7OrFlNeyaq5jlGdXp2s3u7LlB64r/zF+jqELw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6yjLhM1qaUVG8e+GDWZ2pvq04vLNM/aWZKYYFK2Zgmbs3/XbfTnsG5CtnfwL5qMkeKf4JG3OBfqH/NC5jETDMrKQxQqs3ziAB4Hh2VsW+2ULo7O4pylsQsXhY/XMIqSPJJAbOCtbMDPdCf0A05k/B4ydC4HPbQ3gBkOZi7YUH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KLv8i0wX; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e305c2987bso45401937b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729535677; x=1730140477; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rFcb8rltxucDM0VY2MrSo0XTJGmweYgn/oHDViodxcw=;
        b=KLv8i0wX2Cq+erFSxbeIpxsH304+l83gdTPpYHHZG4WDsOCvQts5qjPGyG/IvrNuxn
         Z/K1YK1Q06B4Gk9ET1GAea8U4NTpQvLdfepr3O5cmGLTwA1RFe8s0ag+LsbTaSvCR3s/
         85VlWmo/7COZUd2TH636QQ3Pqmpg7pKJxTcMvvPH4+y72TisdBcVWxuxHL6V8fAK7993
         WAzKsrLwQHU+x8K19g1Q5WksVRJSuyAuBxUWj/PznMOVBB6c45Vano3NZAqYu6OsS0UT
         MimkkWJC/T/VVmNS9V9ivt09CilHSNBEVhci77cRUVeVFOtpbDp5MGFNf1Z7uskXBjVP
         LZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729535677; x=1730140477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFcb8rltxucDM0VY2MrSo0XTJGmweYgn/oHDViodxcw=;
        b=YDwMNnk5wrEqHcmKAT3U78nSRE7Do7pVEztZiF4CQaOwpQhEqwZGHu1zlEBz/Wufkw
         UfRYOznblQ6dZa/PiblB1lSoVf06rY61uqIpTA9IvjH82O1xJ57F5fBQ+acw4q6+SmUJ
         7Mbu9OoPbvsHchzNlI4P42g7lhUkZVg777IfIi8iL00Vy/mJYP9l8oMpVDdI2sbUJOvB
         /9LH05VTBom5gh47flboiOoayoD05kCcmhpBrvJ0x0tKfYtdziJCfJ3V0f2fXoVaHeDu
         56qrbcv8YXngviWunVdCBR9TRfUK3ppqwoRLyggtpQSl+yDzCw7/kGFhgpYKRj6B7Qmb
         XNdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4LVcAvcz89TzkCq4i4X8pxu0qQSQOTp24SCMeNY4m43eqhxLvcVf7SIG3VVJnu9Iye6/R2qoNCC086wfq@vger.kernel.org
X-Gm-Message-State: AOJu0YwCA0ImrD8mN2yYd/eg410BnTCXVqcBJ/iRgTzCR9v0QhbUsgJb
	vjxIGS1y1c8IM83ZiEh7Guv/ekzvyNjPYptk5CJ0BzHEqmoNBBcwxpgFK2QoMNm6Xy1T5h0EdWF
	8n3ztxQOvbSILAJJ3L484EEMkOnikXr5I63cFHQ==
X-Google-Smtp-Source: AGHT+IGoryo/V98eUYJVIboovm9PDH29dbaEnlJflrmfDlr9asiqpeu7bAg1da1x9WGMG497Wk7nop6pzhvLW7FRhg0=
X-Received: by 2002:a05:690c:9c07:b0:6e5:9bc2:53a0 with SMTP id
 00721157ae682-6e7d3c0f114mr9738967b3.41.1729535677016; Mon, 21 Oct 2024
 11:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
 <379780f5-bf30-4452-aa9e-f1b6915b6389@quicinc.com> <87plntnwon.fsf@kernel.org>
In-Reply-To: <87plntnwon.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 21:34:27 +0300
Message-ID: <CAA8EJppAiktoPk9hZnDdj5igZ9-D0229WRfwg08y8CPnwerx-g@mail.gmail.com>
Subject: Re: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific subdir
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-firmware@kernel.org, 
	ath11k@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 21:22, Kalle Valo <kvalo@kernel.org> wrote:
>
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>
> > On 10/10/2024 11:16 PM, Dmitry Baryshkov wrote:
> >
> >> The firmware under ath11k/WCN6750 can not be utilized on other devices using
> >> WCN6750 to provide WiFi (e.g. on the Qualcomm RB3 gen2 board).  This is an
> >> attempt to propose a solution by moving the file into device-specifig subdir.
> >> Other platforms can place firmware files in other subdirs, depending on the
> >> SoC.
> >>
> >> Note, while performing the move I also propose squashing the firmware
> >> file.
>
> I assume you mean squashing the files to wpss.mbn?
>
> >> This is the practice recommended by the msm platform maintainers for the DSP
> >> firmware (not to mention that it also saves us from the extra symlinks). If
> >> Kalle, ath11k maintainer, objects, I will keep the firmware in the split form.
> >>
> >> For now this is an RFC in order to gather opinion form respective platform and
> >> driver maintainers.
> >>
> >> ----------------------------------------------------------------
> >>
> >> The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:
> >>
> >>   Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/lumag/linux-firmware wcn6750-device-specific
> >>
> >> for you to fetch changes up to abe8c109a2b4c422b627335d124473734c8790d8:
> >>
> >>   ath11k: move WCN6750 firmware to the device-specific subdir (2024-10-10 22:26:20 +0300)
> >>
> >> ----------------------------------------------------------------
> >> Dmitry Baryshkov (1):
> >>       ath11k: move WCN6750 firmware to the device-specific subdir
> >>
> >>  WHENCE                                             |  12 ++----------
> >>  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
> >>  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
> >>  11 files changed, 2 insertions(+), 10 deletions(-)
> >>  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
>
> So this follow basically the same directory hierarchy as you Dmitry
> implemented for ath10k in commit 5abf259772df ("wifi: ath10k: support
> board-specific firmware overrides"), right? Just making sure we are on
> the same page. I think ath10k/ath11k/ath12k drivers should follow the
> same design as much as possible.

Yes, that was my goal. Having subdirs under the main dir.

>
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt
> >
> > I'm waiting for Kalle to respond, but at a minimum I suspect our internal
> > firmware tooling would be impacted by this change.
>
> Yeah, most likely we need to update our tools. But we would have to do
> it anyway so I'm not concerned about that.

Ok. If there are no concerns from your side, could you possibly
respond with Acked-by? Then we can unblock and merge this.

> > Kalle, do you have concerns or suggestions on how to handle this issue?
>
> Looks good to me.
>
> Dmitry, if you have the time please take a look at this:
>
> https://patchwork.kernel.org/project/linux-wireless/cover/20241001033053.2084360-1-quic_miaoqing@quicinc.com/
>
> Based on a quick look it seems to do things differently and not really a
> fan of that.

Yes, I'd prefer a subdir rather than this implementation. I'll respond
either today or tomorrow.

-- 
With best wishes
Dmitry

