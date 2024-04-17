Return-Path: <linux-arm-msm+bounces-17691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A7C8A828E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 13:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 214081C219B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 11:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCBE13CFBD;
	Wed, 17 Apr 2024 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oTZLn+Kp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E86613CF87
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713354885; cv=none; b=KKvnWiOay1gG43BptlvDf9zOAX2GJucXr/30OK7pdPL/RcL0lVha90j0IQeLDodZr8zFSZ+1NuiDZT+pScZClK34tvXcyf8brz1jWhhkTxsi8qS2xSf6wHC7k0kQpYMsk2Z1a9eH6lV31EEJKuB2ypXWQXtAFrdiOs1dbBrCMRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713354885; c=relaxed/simple;
	bh=ikR4nZxOK0Zrn2QCHC7pm1fQ1ul5cEKckbJljCi6v6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tz9sNZCMROsbMqNBXE4YMd7j5fHMiH7u++LkQDHT6Kl/UeRqOG1npCYNX8PxrDh5yu/pSzjLFOFWdKHAm7hFV3bqZSjKTwxHmV6INRvU4jR+LlQiY7WPBIsc8kNhLhg2/QAJ+ncUCo/Ri9OWLwIlL+sviaRW8B5Iregoqb0SRgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oTZLn+Kp; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso5668725276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 04:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713354881; x=1713959681; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+wTbu0Nn+T3CJEEi3xzg5dvMqu7Psfagz5+cmNlziwk=;
        b=oTZLn+KpKyzsEn3oEPV04KWHbVbJEbU+p60cjTam/NHVGhEsrwBZhvrQP0w7I6oaLU
         ZrYGVrrZdeUWIwfD+6rswRE7i51K/RdkmNv70Oe4ktc4VRjqX1kmF7Ff2IgG/Yb8XE/1
         UBZckGyuXQS4PFAjmoOBe39BfHS/GUPgZnxSYAodZeDs25xurslCKQJMC1XCACgj+BQs
         F842N3byRxbcpEVd/I3DHLbFahCphvMmdYQeJB3WdiITP1NZe4YrER6iEScO6+LF7n0C
         hhN+OCrmWSpY+/kgdJBzWmBm6fX72i7YXqd0odWhc8z03JAkpVemXa13SA2TLfD+WzIv
         de1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713354881; x=1713959681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wTbu0Nn+T3CJEEi3xzg5dvMqu7Psfagz5+cmNlziwk=;
        b=YwzEe3kVWpVbYDZuoaWy6Nwr/6uStRSbI8fmyV2ye0T6lOWVbibyUhBmbOwOKaJIxd
         xQqDkZ6N/YZzWTRdHzycn+5XEIxu0glIbEHdnmzgavZevWf/nzyPS2U74JFTHQrN00G4
         5TCjJ4u7vjelKkNZQ6ahBQXa6AI0zTlsXeSSSHLHlHFiDdaLR+CxDRkwaaMzM6U15rHP
         UFdMbTgJB3T2nyy7YwrBQ+AbHC5WQAHc3V45pzNuj79sZ0+qAExSQ6k+6qqdi4O/9xnD
         Hb2R+LjoPNH68QOolI8APJoQBFvmsRFrAyxkQ4dYNu4lJ0lHqu1vRrLjYgZZQAhT184f
         UM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFpHlfHGhONDCOKmc6T0FdWV4qReiis/1ErNSJ5CaLC2Y5tJPMBIMci2PMWm8gwdRRwzbaLyysPkzePuuDQAY+VuL6mpizDhS6htaViw==
X-Gm-Message-State: AOJu0YwtNdzVAzdq+ytp5rDmPrIKSrm0jAakKMVhSNSULws3AfLWMzvp
	2qTJgS8TjfK8oEle5GtWcxiJVuBjQJPiH071zwkzK2Xhi1sl8d/PkPxC6Eip/REm2sBRKImDE//
	jzxKDZD5wDzGAsTxT+y+GYGVlskuY/5RP9TH5qw==
X-Google-Smtp-Source: AGHT+IGdD940iUJhcJhp8ehVt6aqkRTyO2ZKf1Ew7LbisYbNffOYCRJ2TNbI0DmWPUFJEU9DZ8PHsbGJeMFmJRpMfQE=
X-Received: by 2002:a25:b9cb:0:b0:dcc:9e88:b15 with SMTP id
 y11-20020a25b9cb000000b00dcc9e880b15mr15106658ybj.41.1713354881361; Wed, 17
 Apr 2024 04:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328095044.2926125-1-quic_sibis@quicinc.com>
 <20240328095044.2926125-3-quic_sibis@quicinc.com> <CAA8EJpoQyzF1E2xFPHvzz5Nk=w3J2abd3Y13nc+4FK-jRQbnFw@mail.gmail.com>
 <f32b7e43-5e39-0c82-1e03-18a2219adfdb@quicinc.com>
In-Reply-To: <f32b7e43-5e39-0c82-1e03-18a2219adfdb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:54:30 +0300
Message-ID: <CAA8EJppQ9Saoytar7-xXORR=BppddWQ5fnrqg+x1rzRFctOt8Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] mailbox: Add support for QTI CPUCP mailbox controller
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	quic_gkohli@quicinc.com, quic_nkela@quicinc.com, quic_psodagud@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 14:51, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
>
>
> On 4/16/24 21:51, Dmitry Baryshkov wrote:
> > On Thu, 28 Mar 2024 at 11:52, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> >>
> >> Add support for CPUSS Control Processor (CPUCP) mailbox controller,
> >> this driver enables communication between AP and CPUCP by acting as
> >> a doorbell between them.
> >>
> >> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> >> ---
> >>
> >> rfc:
> >> * Use chan->lock and chan->cl to detect if the channel is no longer
> >>    Available. [Dmitry]
> >> * Use BIT() instead of using manual shifts. [Dmitry]
> >> * Don't use integer as a pointer value. [Dmitry]
> >> * Allow it to default to of_mbox_index_xlate. [Dmitry]
> >> * Use devm_of_iomap. [Dmitry]
> >> * Use module_platform_driver instead of module init/exit. [Dmitry]
> >> * Get channel number using mailbox core (like other drivers) and
> >>    further simplify the driver by dropping setup_mbox func.
>
> Hey Dmitry,
>
> Thanks for taking time to review the series.
>
> >>
> >>   drivers/mailbox/Kconfig           |   8 ++
> >>   drivers/mailbox/Makefile          |   2 +
> >>   drivers/mailbox/qcom-cpucp-mbox.c | 205 ++++++++++++++++++++++++++++++
> >>   3 files changed, 215 insertions(+)
> >>   create mode 100644 drivers/mailbox/qcom-cpucp-mbox.c
> >>
> [snip]
> ...
> >> +
> >> +       status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
> >> +
> >> +       for (i = 0; i < APSS_CPUCP_IPC_CHAN_SUPPORTED; i++) {
> >> +               val = 0;
> >> +               if (status & ((u64)1 << i)) {
> >
> > BIT() or test_bit()
>
> I'll use BIT()
>
> >
> >> +                       val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD + (i * 8) + APSS_CPUCP_MBOX_CMD_OFF);
> >
> > #define APSS_CPUCP_MBOX_CMD_OFF(i)
>
> ack
>
> >
> >> +                       chan = &cpucp->chans[i];
> >> +                       spin_lock_irqsave(&chan->lock, flags);
> >> +                       if (chan->cl)
> >> +                               mbox_chan_received_data(chan, &val);
> >> +                       spin_unlock_irqrestore(&chan->lock, flags);
> >> +                       writeq(status, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
> >
> > Why is status written from inside the loop? If the bits are cleared by
> > writing 1, then you should be writing BIT(i) to that register. Also
> > make sure that it is written at the correct time, so that if there is
> > an event before notifying the driver, it doesn't get lost.
>
> Thanks for catching this. I probably didn't run into this scenario
> because of using just one channel at point any time. I'll move it
> outside the loop.

It might be better to write single bits from within the loop under the spinlock.

>
> >
> >> +               }
> >> +       }
> >> +
> >> +       return IRQ_HANDLED;
> >> +}
> >> +
> >> +static int qcom_cpucp_mbox_startup(struct mbox_chan *chan)
> >> +{
> >> +       struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> >> +       unsigned long chan_id = channel_number(chan);
> >> +       u64 val;
> >> +
> >> +       val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> >> +       val |= BIT(chan_id);
> >> +       writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static void qcom_cpucp_mbox_shutdown(struct mbox_chan *chan)
> >> +{
> >> +       struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> >> +       unsigned long chan_id = channel_number(chan);
> >> +       u64 val;
> >> +
> >> +       val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> >> +       val &= ~BIT(chan_id);
> >> +       writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> >> +}
> >> +
> >> +static int qcom_cpucp_mbox_send_data(struct mbox_chan *chan, void *data)
> >> +{
> >> +       struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
> >> +       unsigned long chan_id = channel_number(chan);
> >> +       u32 *val = data;
> >> +
> >> +       writel(*val, cpucp->tx_base + APSS_CPUCP_TX_MBOX_CMD + (chan_id * 8) + APSS_CPUCP_MBOX_CMD_OFF);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static const struct mbox_chan_ops qcom_cpucp_mbox_chan_ops = {
> >> +       .startup = qcom_cpucp_mbox_startup,
> >> +       .send_data = qcom_cpucp_mbox_send_data,
> >> +       .shutdown = qcom_cpucp_mbox_shutdown
> >> +};
> >> +
> >> +static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
> >> +{
> >> +       struct qcom_cpucp_mbox *cpucp;
> >> +       struct mbox_controller *mbox;
> >> +       int ret;
> >> +
> >> +       cpucp = devm_kzalloc(&pdev->dev, sizeof(*cpucp), GFP_KERNEL);
> >> +       if (!cpucp)
> >> +               return -ENOMEM;
> >> +
> >> +       cpucp->dev = &pdev->dev;
> >> +
> >> +       cpucp->rx_base = devm_of_iomap(cpucp->dev, cpucp->dev->of_node, 0, NULL);
> >> +       if (IS_ERR(cpucp->rx_base))
> >> +               return PTR_ERR(cpucp->rx_base);
> >> +
> >> +       cpucp->tx_base = devm_of_iomap(cpucp->dev, cpucp->dev->of_node, 1, NULL);
> >> +       if (IS_ERR(cpucp->tx_base))
> >> +               return PTR_ERR(cpucp->tx_base);
> >> +
> >> +       writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
> >> +       writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
> >> +       writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
> >> +
> >> +       cpucp->irq = platform_get_irq(pdev, 0);
> >> +       if (cpucp->irq < 0) {
> >> +               dev_err(&pdev->dev, "Failed to get the IRQ\n");
> >> +               return cpucp->irq;
> >
> > It already prints the error message.
>
> ack
>
> >
> >> +       }
> >> +
> >> +       ret = devm_request_irq(&pdev->dev, cpucp->irq, qcom_cpucp_mbox_irq_fn,
> >> +                              IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
> >> +       if (ret < 0) {
> >> +               dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
> >> +               return ret;
> >
> > return dev_err_probe();
>
> ack
>
> >
> >> +       }
> >> +
> >> +       writeq(APSS_CPUCP_RX_MBOX_CMD_MASK, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
> >> +
> >> +       mbox = &cpucp->mbox;
> >> +       mbox->dev = cpucp->dev;
> >> +       mbox->num_chans = APSS_CPUCP_IPC_CHAN_SUPPORTED;
> >> +       mbox->chans = cpucp->chans;
> >> +       mbox->ops = &qcom_cpucp_mbox_chan_ops;
> >> +       mbox->txdone_irq = false;
> >> +       mbox->txdone_poll = false;
> >> +
> >> +       ret = mbox_controller_register(mbox);
> >
> > Use devm_mbox_controller_register()
>
> ack
>
> >  >> +       if (ret) {
> >> +               dev_err(&pdev->dev, "Failed to create mailbox\n");
> >> +               return ret;
> >
> > return dev_err_probe();
>
> I guess ^^ is a typo? Since devm_mbox_controller_register wouldn't
> return -EPROBE_DEFER.

Anyway, using dev_err_probe is a simpler and better style. It's not a
question of returning -EPROBE_DEFER.

>
> >
> >> +       }
> >> +
> >> +       platform_set_drvdata(pdev, cpucp);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int qcom_cpucp_mbox_remove(struct platform_device *pdev)
> >> +{
> >> +       struct qcom_cpucp_mbox *cpucp = platform_get_drvdata(pdev);
> >> +
> >> +       mbox_controller_unregister(&cpucp->mbox);
> >  > This will be replaced by devm_mbox_controller_register().
>
> ack
>
> >
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static const struct of_device_id qcom_cpucp_mbox_of_match[] = {
> >> +       { .compatible = "qcom,x1e80100-cpucp-mbox"},
> >> +       {}
> >> +};
> >> +MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
> >> +
> >> +static struct platform_driver qcom_cpucp_mbox_driver = {
> >> +       .probe = qcom_cpucp_mbox_probe,
> >> +       .remove = qcom_cpucp_mbox_remove,
> >> +       .driver = {
> >> +               .name = "qcom_cpucp_mbox",
> >> +               .of_match_table = qcom_cpucp_mbox_of_match,
> >> +               .suppress_bind_attrs = true,
> >
> > No need to. Please drop.
>
> ack
>
> -Sibi
>
> >
> >> +       },
> >> +};
> >> +module_platform_driver(qcom_cpucp_mbox_driver);
> >> +
> >> +MODULE_DESCRIPTION("QTI CPUCP MBOX Driver");
> >> +MODULE_LICENSE("GPL");
> >> --
> >> 2.34.1
> >>
> >>
> >
> >



-- 
With best wishes
Dmitry

