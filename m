Return-Path: <linux-arm-msm+bounces-17981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888A8AB4CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 20:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FC402813E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 18:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB1613A871;
	Fri, 19 Apr 2024 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hi1FTXJh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EA913AD02
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713550264; cv=none; b=RK+m6f08xT2MQXKRiOTImfV3dLSYFl6C1szaAoBTmtcQi1eAyHp0On3yt4aEt5RYp6xbBnhh9bLnjSD20atGbgOK5CtO2Swo6U70kLk7WvZ+laYDA6oTFHYlSWZ7S3udFh0tYuP/sWd+pe+Ra/vhXFlksbrU2f9/jeL6bbACf+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713550264; c=relaxed/simple;
	bh=9Cou39w11VUIybQ8c1AVWzRaerwRLXy2Ap9JfA+LYgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROSrh1H5t2hPzuYZUtgcOzEXrBvqN4Y+NR+rfNCVSqSf//3PPhdNkwoJhrOQduPkMxkuYQCi7sYBVYrnSQcHSfvW/C8yH9loO3vl7Opb0vX017Fti8w6+T+tarMD2OnyJWk7BPB3FMeunKCbXEx0ztRLfJbe/fzZE/j9yC2qUBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hi1FTXJh; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dbed0710c74so2274658276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 11:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713550260; x=1714155060; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y1Vh4W5PGSQYd9AXrLlnVt/X2Fcpukike0ctA84Fp3U=;
        b=hi1FTXJh7Lq761dpEv98c3L76LEC0ih8hCEoIx58eSN6+w40SMlo7lfDBYaD2C7EEx
         q5uN/Z9vfLYfKa4Y6ybVHZnyvS7vtdx6Pp8+11PebKkKrL7IMf/k+3jqB03z9OxVaTuE
         9CmC+5BvOZ4YItQ5KBvxeoR1k0fKU68fALkQkNm7zM8tQL5PifUDUBJNi2ZNOjiQsXXz
         EgXzDCDjqpK8Nnyi3lfSSk1bhNhIDSb+Wm7sn4RzYUTll1bkfy1p4qfX92DdQNOJ5DkW
         QeFtfOTnfLqlVhHWi5mYBMkTOnpRvRBeVyomouh4z4Y83kYUhmGS21SXnfDNBbPrHJwV
         ZOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713550260; x=1714155060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1Vh4W5PGSQYd9AXrLlnVt/X2Fcpukike0ctA84Fp3U=;
        b=cSBiBvG/IxjgB1O+1o9LQ69WFZB8yYIpwdFaTpsFlFmNG2t/47iR0y6pmxubrHnZHA
         1YZBEfxk9EaKcG1u+QnE5I6nlstOd81W+JX6EKsmf3wXHpmiAZSe7bAELksziqyEqS/d
         07IjfBPoXEcemP5l6qGeGNfC0/KFtd1hFDv0SSQZ/bkbCUf3fyBgJCOJpIHevQbjBvOI
         Ph32TUX7lblu7O0lFN2BGMPz9j98vpH3T6/SK+paex45Ml7ZCMHWf2MGb3AMbQhXGNEq
         5fT/fxorB4o3P8pq2bY3p1Xyyum0aT0PEEgjBQsQ4gndUSytj5XvfzQxU7oOr0LALR6L
         cMgA==
X-Forwarded-Encrypted: i=1; AJvYcCVfWu/z3KPE+eHDCLTzexgcfvDmZwMv89ZhD01FxJNUoQy86da9hlighqC8p7Y8c+mEyUPVI4q+JECIMc+soIl3OLJwBxgY4vHbOrwNKA==
X-Gm-Message-State: AOJu0YzBZ5EYEg7pcGbv83sj02xRix1C1q/8O+sH+0iEAM46Q8UpTi7e
	f1djCvyKJTslF51LihyjvZ4IpIwR7bvwFxbypyKto291IWvB9METb165WmiC7pN9UeV33uUGWJj
	uayD62/+ESEI+szxW0Qr0+d/2tZJCXh+rtt3s6g==
X-Google-Smtp-Source: AGHT+IGzp3bS0/yBAcAAtIbPNI57bBEn3G4KdcPii7ioB9yTzjaRlUk8HNa9n07CI3dB9w0LLDoeqLNlg3viJhd0zMI=
X-Received: by 2002:a25:bc3:0:b0:dcc:c279:d2fa with SMTP id
 186-20020a250bc3000000b00dccc279d2famr2876449ybl.30.1713550260491; Fri, 19
 Apr 2024 11:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
 <20240419-qcom-pd-mapper-v5-5-e35b6f847e99@linaro.org> <b26b5d54-d04d-41e1-abe1-600633882989@kernel.org>
In-Reply-To: <b26b5d54-d04d-41e1-abe1-600633882989@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 21:10:49 +0300
Message-ID: <CAA8EJpoyTXWY5uxJs2gt1Rths-HdgskuQFyw5dJSL66mxQOv7g@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] soc: qcom: add pd-mapper implementation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Xilin Wu <wuxilin123@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Apr 2024 at 20:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 19/04/2024 16:00, Dmitry Baryshkov wrote:
> > Existing userspace protection domain mapper implementation has several
> > issue. It doesn't play well with CONFIG_EXTRA_FIRMWARE, it doesn't
> > reread JSON files if firmware location is changed (or if firmware was
> > not available at the time pd-mapper was started but the corresponding
> > directory is mounted later), etc.
> >
> > Provide in-kernel service implementing protection domain mapping
> > required to work with several services, which are provided by the DSP
> > firmware.
> >
>
> ...
>
> > +
> > +static const struct of_device_id qcom_pdm_domains[] = {
> > +     { .compatible = "qcom,apq8096", .data = msm8996_domains, },
> > +     { .compatible = "qcom,msm8996", .data = msm8996_domains, },
> > +     { .compatible = "qcom,msm8998", .data = msm8998_domains, },
> > +     { .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
> > +     { .compatible = "qcom,qcs404", .data = qcs404_domains, },
> > +     { .compatible = "qcom,sc7180", .data = sc7180_domains, },
> > +     { .compatible = "qcom,sc7280", .data = sc7280_domains, },
> > +     { .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
> > +     { .compatible = "qcom,sc8280xp", .data = sc8280xp_domains, },
> > +     { .compatible = "qcom,sda660", .data = sdm660_domains, },
> > +     { .compatible = "qcom,sdm660", .data = sdm660_domains, },
> > +     { .compatible = "qcom,sdm670", .data = sdm670_domains, },
> > +     { .compatible = "qcom,sdm845", .data = sdm845_domains, },
> > +     { .compatible = "qcom,sm6115", .data = sm6115_domains, },
> > +     { .compatible = "qcom,sm6350", .data = sm6350_domains, },
> > +     { .compatible = "qcom,sm8150", .data = sm8150_domains, },
> > +     { .compatible = "qcom,sm8250", .data = sm8250_domains, },
> > +     { .compatible = "qcom,sm8350", .data = sm8350_domains, },
> > +     { .compatible = "qcom,sm8450", .data = sm8350_domains, },
> > +     { .compatible = "qcom,sm8550", .data = sm8550_domains, },
> > +     { .compatible = "qcom,sm8650", .data = sm8550_domains, },
> > +     {},
> > +};
>
> If this is supposed to be a module, then why no MODULE_DEVICE_TABLE?

Ok, I should add this to the commit message.

For now:

This module is loaded automatically by the remoteproc drivers when
necessary. It uses a root node to match a protection domains map for a
particular device.

>
> > +
> > +static int qcom_pdm_start(void)
> > +{
> > +     const struct of_device_id *match;
> > +     const struct qcom_pdm_domain_data * const *domains;
> > +     struct device_node *root;
> > +     int ret, i;
> > +
> > +     pr_debug("PDM: starting service\n");
>
> Drop simple entry/exit debug messages.

ack

>
> > +
> > +     root = of_find_node_by_path("/");
> > +     if (!root)
> > +             return -ENODEV;
> > +
> > +     match = of_match_node(qcom_pdm_domains, root);
> > +     of_node_put(root);
> > +     if (!match) {
> > +             pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
> > +             return 0;
> > +     }
> > +
> > +     domains = match->data;
>
> All this is odd a bit. Why is this not a driver? You are open coding
> here of_device_get_match_data().

Except that it matches the root node instead of matching a device.

>
>
> > +     if (!domains) {
> > +             pr_debug("PDM: no domains\n");
> > +             return 0;
> > +     }
> > +
> > +     for (i = 0; domains[i]; i++) {
> > +             ret = qcom_pdm_add_domain(domains[i]);
> > +             if (ret)
> > +                     goto free_domains;
> > +     }
> > +
> > +     ret = qmi_handle_init(&qcom_pdm_handle, 1024,
> > +                           NULL, qcom_pdm_msg_handlers);
> > +     if (ret)
> > +             goto free_domains;
> > +
> > +     ret = qmi_add_server(&qcom_pdm_handle, SERVREG_LOCATOR_SERVICE,
> > +                          SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +     if (ret) {
> > +             pr_err("PDM: error adding server %d\n", ret);
> > +             goto release_handle;
> > +     }
> > +
> > +     return 0;
> > +
> > +release_handle:
> > +     qmi_handle_release(&qcom_pdm_handle);
> > +
> > +free_domains:
> > +     qcom_pdm_free_domains();
> > +
> > +     return ret;
> > +}
> > +
> > +static void qcom_pdm_stop(void)
> > +{
> > +     qmi_del_server(&qcom_pdm_handle, SERVREG_LOCATOR_SERVICE,
> > +                    SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +
> > +     qmi_handle_release(&qcom_pdm_handle);
> > +
> > +     qcom_pdm_free_domains();
> > +
> > +     WARN_ON(!list_empty(&qcom_pdm_services));
>
> This should be handled, not warned.

I'll just drop it, qcom_pdm_free_domains() should free them.

>
> > +
> > +     pr_debug("PDM: stopped service\n");
>
> Drop debug. Tracing gives you such information.
>
> > +}
> > +
> > +/**
> > + * qcom_pdm_get() - ensure that PD mapper is up and running
> > + */
>
> Please provide full kerneldoc, so also return and short description.
>
> > +int qcom_pdm_get(void)
> > +{
> > +     int ret = 0;
> > +
> > +     mutex_lock(&qcom_pdm_mutex);
> > +
> > +     if (!qcom_pdm_count)
> > +             ret = qcom_pdm_start();
> > +
> > +     if (!ret)
> > +             ++qcom_pdm_count;
> > +
> > +     mutex_unlock(&qcom_pdm_mutex);
>
> Looks like you implement refcnt manually...

Yes... There is refcount_dec_and_mutex_lock(), but I found no
corresponding refcount_add_and_mutex_lock(). Maybe I'm
misunderstanding that framework.
I need to have a mutex after incrementing the lock from 0, so that the
driver can init QMI handlers.

> Also, what happens if this module gets unloaded? How do you handle
> module dependencies? I don't see any device links. Bartosz won't be
> happy... We really need to stop adding more of
> old-style-buggy-never-unload-logic. At least for new code.

Module dependencies are handled by the symbol dependencies.
Remoteproc module depends on this symbol. Once q6v5 remoteproc modules
are unloaded this module can be unloaded too.
But I know what got missing. I should add 'depends on PD_MAPPER ||
!PD_MAPPER' to remoteproc Kconfig entries.

>
> > +
> > +     return ret;
> > +}
>
> No export? Isn't this a module?

Ack, missed them.

>
> > +
> > +/**
> > + * qcom_pdm_release() - possibly stop PD mapper service
> > + */
> > +void qcom_pdm_release(void)
> > +{
>
> Best regards,
> Krzysztof
>


-- 
With best wishes
Dmitry

