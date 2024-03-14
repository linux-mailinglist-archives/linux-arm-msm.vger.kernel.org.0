Return-Path: <linux-arm-msm+bounces-14066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF44D87B5B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 167A61C220C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625B87FD;
	Thu, 14 Mar 2024 00:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u16ou+af"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36E238F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710375008; cv=none; b=VDlnwb2N4BdvwIK2mmW2hsZ14ewbAuP4v4t+GHNHhl/+e6/z7O1eLrum3Y2Teef9Yy8f/N4DlzZwZgGzRONo5QOEcW2Mr4HP9IPduf7LLIzeqVBrYFwUr3Ki4FrYAnyYlpwa8eOhCxl9YZfxns85EVLQwwInGk/IJCv9abv649g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710375008; c=relaxed/simple;
	bh=ec22eP484v/AXC4kjGAAzrxbXX6N5ohUbSJGQR4ZIww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQzrAPcPsgZ4EUbnViVy0G9aEjFOXUCWHjg+bKc8iVJPDD4mYn75RByHXSzpPjP1Pjiqtplrfah9ONNJNJp6Y4rtYa58S7BenXVTrIfj0Z08ZTXTmX6E5cFhfAI+mmRW8d8Vhvb31OSYOkfRyuIICirL7taxAg7Kl00L1f8e9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u16ou+af; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60a0579a931so4646377b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710375005; x=1710979805; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CObZLoh3uZD+J/vo9QTXq7jAF93NORabu7T4LEk61OA=;
        b=u16ou+afCsS//aOvI4TUCfbvIE4N3YjX22Z8wjGF48YzCR2Y0+iewqF0a/tA8H1YnK
         J6zsPBl5dq/iWLt8YKPNd40smMZPiUbEucsXwxb15DegwdAbZAzs2o8i0ClyTvNfCQGD
         sK+crNRtpG5WZgWDOBnrAg0AkMAYdnNFPB8k+VkHpepVda64QFytdmpAcwiY0mmjAZ0d
         KIp1M9gYaRR6S3GCLvoQfNiia2zxLJFUSEf9ArxgRzHkz4mvga1mfBScHFlOP1LI9zss
         6kJzstzLO6TOfR+Wy+3padlad86z6If+ENRXSmbtVtbfKNF/BIklc5pGK5jANP+1x8zz
         GACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710375005; x=1710979805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CObZLoh3uZD+J/vo9QTXq7jAF93NORabu7T4LEk61OA=;
        b=SQUL2Xem8wM1k1CdDKIa3DPQ1k+LjeVyGGGYWyZhvgIGAcvpO6djeL0Lr/kONOsbfM
         gubkHXc17pnH0JFunlgC03xdVoxGa1lD5uzS9vhQZhi03/YtOCa7c7PKl2nzUjn4Z0wi
         VcdF6vz2zdnlJGjhMr6jvDBoSOFm3FZfOha+KRRzNQV0o+vNyF8nk0VerDgkLiKAYC6H
         TKLcl4AqmE+rRrS8QtN5Zzx8DeRjd2DgCtfBGLIATfXhAERU8UwkJDpBsADBU/lbjg59
         B9IVepX0+BvfjplqV6gFVqgsluDblwp+Mt0xYQNsw5m5aJoUgSLLQ+XuMGUVm3NMirDS
         kfpg==
X-Forwarded-Encrypted: i=1; AJvYcCWxSvVrwI0noiQTyJdz7tb3vz+98pnoLdQuv7+YA0t6mirenOY3DHBQSOszTNPbNRChpgehSoa7MXCToo6JW5kAWeRe79e01CTxyL7rvQ==
X-Gm-Message-State: AOJu0YzTeluMR9a4MVYYh3zRGOavwyq8JwUDtGYs6hOPTfIqQDb9ccw9
	c6uhYxzGVw/Xy6aVN+3N1aPI9ITZp6U86nHKAw6gX2QDPkYbj7TOkPTvgZvaZHZJiR8FCNPrWQM
	SD2cw++3+B3ui8dx23+ZTfY22Vlek/+wuzhSPBs8VVzReBP2Z
X-Google-Smtp-Source: AGHT+IHdrgV0AmpnXR7NivcZfh9QuBWnkGN4Tif18Aw8PrgVxPSxQyie2ULwkB9RBOYiLqqC2uWDaTku/4dWuExCB8k=
X-Received: by 2002:a25:b7c2:0:b0:dcc:6112:f90d with SMTP id
 u2-20020a25b7c2000000b00dcc6112f90dmr262699ybj.62.1710375005672; Wed, 13 Mar
 2024 17:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org> <9785a6e6-3700-0b89-b4b5-7981ed5bdd38@quicinc.com>
In-Reply-To: <9785a6e6-3700-0b89-b4b5-7981ed5bdd38@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 02:09:54 +0200
Message-ID: <CAA8EJpr0vV4THO=+rNTXmK5YJtQwzfcsWCWHUgU1XaiSEudtsA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] soc: qcom: qmi: add a way to remove running service
To: Chris Lew <quic_clew@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 02:03, Chris Lew <quic_clew@quicinc.com> wrote:
>
>
>
> On 3/11/2024 8:34 AM, Dmitry Baryshkov wrote:
> > +/**
> > + * qmi_del_server() - register a service with the name service
>
> s/register/deregister/g

ack

>
> > + * @qmi:     qmi handle
> > + * @service: type of the service
> > + * @instance:        instance of the service
> > + * @version: version of the service
> > + *
> > + * Remove registration of the service with the name service. This notifies
> > + * clients that they should no longer send messages to the client associated
> > + * with @qmi.
> > + *
> > + * Return: 0 on success, negative errno on failure.
> > + */
> > +int qmi_del_server(struct qmi_handle *qmi, unsigned int service,
> > +                unsigned int version, unsigned int instance)
> > +{
> > +     struct qmi_service *svc;
> > +     struct qmi_service *tmp;
> > +
> > +     list_for_each_entry_safe(svc, tmp, &qmi->services, list_node) {
> > +             if (svc->service != service ||
> > +                 svc->version != version ||
> > +                 svc->instance != instance)
> > +                     continue;
> > +
> > +             qmi_send_del_server(qmi, svc);
> > +             list_del(&svc->list_node);
> > +             kfree(svc);
> > +
> > +             return 0;
> > +     }
> > +
>
> is list_for_each_entry_safe required if we stop iterating and return
> after we find the first instance of the service?

Yes, it just adds a temp variable here.

>
> > +     return -EINVAL;
> > +}
> > +EXPORT_SYMBOL_GPL(qmi_del_server);



-- 
With best wishes
Dmitry

