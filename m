Return-Path: <linux-arm-msm+bounces-26150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD769312F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 13:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B08F1F23B4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 11:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88F91891B4;
	Mon, 15 Jul 2024 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MVnXAzCs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1651D13A3E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721042281; cv=none; b=V1UMlxB4bkDBqAWaGYGUUgxdR7Qpq8KF5rgY7PTifYULVQS/4tCO5U2MlCtRzF9P8r+sorBoXNB/FnVGrcjw5BsKP1oQjcelHMvOSM3pslJfN54ovF8/wHrcviTDLXYnSa/qBIvOOaNoBWqvNSDaW9epTNjGXTu3MXdCITohNo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721042281; c=relaxed/simple;
	bh=F6nPlNFjvSL5hHKaGrRmsMQTJQxHkN7LmQRO1aSkssc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luJupexQ/o5+b+wghU6KlCJ2kwgboC4BhBWcV/VMKrv+i1Ue/0r5kem0JbZ49CKci9W3vPZtdS7aDhx0RoHVdVejL2lkBXo4YCQGl0hFPHCAGlVp6IpAMbomKGMEGDHAV32/vcsJXh+YfzBIvR4rgnWEbRanys+ARTqH2vgJqnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MVnXAzCs; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e057c25dd34so3728464276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721042278; x=1721647078; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0nsMHYvyytvB0GcQcRWQhieGQMx8L/l5mGgk1F9IiI=;
        b=MVnXAzCsfhZEPtwFLcMjltELzRMY6ApC2/zYeBWgQikVmyAgeNjO2NdYGynJ5zSkrL
         RunPhGA7Xw4F3hlby5PHbTSXEDypY+ehP4qzEuoBrza3UdA8+6acQyY/sjxMVdTGtNw+
         Oq5SlKdBfqK657Q0s0F9u1QItDvMDAMTS5pTnB3O1CDfdvzGtlytVtQpyvaJfsyuaWiX
         jf8IKo/ALPOKnFOpiW6UIpV8A7/Zj+kzRa9Zg7EVmPWO1axcg3dqZD2QUovC7mpdihME
         foGJ3LYKAq2UAJBqHae4oZpWDAVSMPQYueO9OgAVVK0wXpt2J54XEEhAKiBHBhCqvf27
         sXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721042278; x=1721647078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0nsMHYvyytvB0GcQcRWQhieGQMx8L/l5mGgk1F9IiI=;
        b=Ko89x20k7dFAN2J6fEckbj/gkJm++DcJoVOM0tE+0Ipcang9RsTwPdY933NaEp7nvy
         FktterOIo8v6+0WxMFE0e/k96r/e3pHDCFXLis3sewfkEwoIAJbzp783p7CgVFn5IztZ
         pncKmjd9rdlEspbXF4KewtXTp8kqHmaE21Vh74y10J44EmcEVFdANwYtTK4f60SksMPo
         wyIAJlIkRcTRs8tmc3uG3VVNeTBOAzrBnA1SQT9pjdt9FzPA6uAJl++/cYjl/MALzEJV
         JMdQoqh3pmvWCnBv7SKe1gItuCx6esBBYCV5BH9k/hU52+B01zgJM7Q3IVMOR//I+X3S
         HDEw==
X-Forwarded-Encrypted: i=1; AJvYcCVxRePF185JidarRFd79p2denOXOj6rKXBYsArjGJgT60SwQDjzZ+TQH9TJ2Pgv5KDTTcJYM63hGCLjKUfs1VXaCbcwo95D9/vqXirnNQ==
X-Gm-Message-State: AOJu0Yx3SNSvRcrywgpV6tXEKfHxnyqZwjwD0Hh/8Ofc3fxV5boyNG+y
	mComR0ZInvsJxLStASWnOFAjTjnIrF2j+11v/h0gBh+Kr0la8wAnficIctuNKrPyQvx9cDTzc5Z
	g4eCqQ3+EJmvGRTzUqIQO8kK5A5epv0bgapYWjQ==
X-Google-Smtp-Source: AGHT+IGLXkpZxf5SwZRwilp0h5f1EqxnZ58jIcQl/Dg8fhJhziq7OC9pG7TnHNdfC3tUtLirO7j3kKAjrv2vNsA4rao=
X-Received: by 2002:a25:7408:0:b0:e03:34ec:16b2 with SMTP id
 3f1490d57ef6-e041b11d31amr20722985276.42.1721042278123; Mon, 15 Jul 2024
 04:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1720763312-13018-1-git-send-email-quic_dikshita@quicinc.com>
In-Reply-To: <1720763312-13018-1-git-send-email-quic_dikshita@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Jul 2024 13:17:22 +0200
Message-ID: <CAPDyKFosMMAWfiEvpaXHn5X+fEL=Asi=o-YEa9Hj5AYzyoRcHg@mail.gmail.com>
Subject: Re: [PATCH 0/2] add device managed version of dev_pm_domain_attach|detach_list()
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2024 at 07:49, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> These patches add the devres-enabled version of dev_pm_domain_attach|detach_list
> in pm domain framework and use the same APIs in venus driver.
> If any client drivers use devm_pm_domain_attach_list() to attach the PM domains,
> devm_pm_domain_detach_list() will be invoked implicitly during remove phase.
>
> Dikshita Agarwal (2):
>   PM: domains: add device managed version of
>     dev_pm_domain_attach|detach_list()
>   media: venus: use device managed APIs for power domains
>
>  drivers/base/power/common.c                    | 41 ++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/pm_helpers.c |  5 +---
>  include/linux/pm_domain.h                      |  4 +++
>  3 files changed, 46 insertions(+), 4 deletions(-)
>

This ended up being a little bit late for v6.11, please re-post a new
version when rc-1 is out.

Kind regards
Uffe

