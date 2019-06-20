Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C22224D12D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 17:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732188AbfFTPBD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 11:01:03 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36901 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732094AbfFTPBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 11:01:02 -0400
Received: by mail-io1-f68.google.com with SMTP id e5so326177iok.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2019 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1bOE/P3cR1iycwMiIqmoK7G72wonhBhp5el0vtUYfgQ=;
        b=TXQKaoL8pKLtNAkT0fOzOfdeEFt9s87c1YYuQFVq64hOu6hXhfLX3DgKjoPWmqyn55
         k83HrB9XQJj9cvUpvvypi7UAPCeJLUD8+T+dzV3fuHt3dikJOt5fkxurSRM4NG9c+cTx
         mCkw1Bzzzc+ZVpFPpDSMmbfURFTgR7aR0nH7kpzr8ACxMDSQkpt7d/88A4Tj5qBeWvMH
         NkjziepywVGJTOQ0+H8wZ2HeB0upB7BWdklyto/tSM0UusvgQLnJMyC3rbbpH4f8vIlt
         3N1zfPBcsf8bennBvwBaOvqTqt6Z8n8X1yEFC4zIFfv8V9EYYGISX99ukj08GOx3jruO
         aEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1bOE/P3cR1iycwMiIqmoK7G72wonhBhp5el0vtUYfgQ=;
        b=m6/g6Fa7RzFWnI7eRtlyJ2xo5MLL0oWgqQ9L/Nc06g451115oO2W7pUbMv44QAeyNZ
         OJon6byCd2JnuSQ8DQ6i8fK6plcCbpxcPNE6jZWysD1qSsO7WDeoIVwwQ9fp4azTayII
         lJy8PiJlXB8khbsb/aDDCYNPdvnrE0fZSxMb1hrm+EGAG5CaWbFU/n3J65k5R2rwQ4N/
         cyuHELv5GbIK4q4vIOwi0JMFo8zhm6KuH4Dwv16ztk5Xl9rdlR37VdPQT4hawIJd6V88
         fV3PtMVYqyJZym9G5K83XG3g51+NJH1DDEWRzothLhXPTeNlewIlwldL+sneNZqqneRs
         nawg==
X-Gm-Message-State: APjAAAVApL/Det4ZjtJlGkpV5zCONrqSveUBJF1gIh/cIBda1E7f0uiU
        NgHeNeQtgLpNx9eTJg/J5LpnbUk9Rid8wEDIl5Y+IA==
X-Google-Smtp-Source: APXvYqxBl7ft2Jnjk3WlAEqEHUw7bySVXYWz3ESyxcvXGgpNcgVFkuYDzBudJTnmM93unYZF+JNXxsIVZ/Rw816uLPM=
X-Received: by 2002:a02:b914:: with SMTP id v20mr82198963jan.83.1561042861577;
 Thu, 20 Jun 2019 08:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190618202623.GA53651@gerhold.net> <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net> <0dcea9a1-999d-7d85-267e-c3bfcfcfa95a@codeaurora.org>
 <6589bf4d-5b39-c95e-0ee5-aaf35a87b40e@arm.com>
In-Reply-To: <6589bf4d-5b39-c95e-0ee5-aaf35a87b40e@arm.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 20 Jun 2019 09:00:50 -0600
Message-ID: <CANLsYkyX3x_mmkJ2=f6C+7iSMhO+1NzNmkKqN-oUEjNPCUiAJg@mail.gmail.com>
Subject: Re: Coresight causes synchronous external abort on msm8916
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        David Brown <david.brown@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mike Leach <mike.leach@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 20 Jun 2019 at 03:06, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
>
>
> On 20/06/2019 07:29, Sai Prakash Ranjan wrote:
> > Hi Stephan,
> >
> > On 6/20/2019 12:09 AM, Stephan Gerhold wrote:
> >> Hi,
> >>
> >> On Wed, Jun 19, 2019 at 09:49:03AM +0100, Suzuki K Poulose wrote:
> >>> Hi Stephan,
> >>>
> >>> On 18/06/2019 21:26, Stephan Gerhold wrote:
> >>>> Hi,
> >>>>
> >>>> I'm trying to run mainline Linux on a smartphone with MSM8916 SoC.
> >>>> It works surprisingly well, but the coresight devices seem to cause the
> >>>> following crash shortly after userspace starts:
> >>>>
> >>>>        Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
> >>>
> >>> ...
> >>>
> >>>
> >>>>
> >>>> In this case I'm using a simple device tree similar to apq8016-sbc,
> >>>> but it also happens using something as simple as msm8916-mtp.dts
> >>>> on this particular device.
> >>>>      (Attached: dmesg log with msm8916-mtp.dts and arm64 defconfig)
> >>>>
> >>>> I can avoid the crash and boot without any further problems by disabling
> >>>> every coresight device defined in msm8916.dtsi, e.g.:
> >>>>
> >>>>    tpiu@820000 { status = "disabled"; };
> >>>
> >>> ...
> >>>
> >>>>
> >>>> I don't have any use for coresight at the moment,
> >>>> but it seems somewhat odd to put this in the device specific dts.
> >>>>
> >>>> Any idea what could be causing this crash?
> >>>
> >>> This is mostly due to the missing power domain support. The CoreSight
> >>> components are usually in a debug power domain. So unless that is turned on,
> >>> (either by specifying proper power domain ids for power management protocol
> >>> supported by the firmware OR via other hacks - e.g, connecting a DS-5 to
> >>> keep the debug power domain turned on , this works on Juno -).
> >>
> >> Interesting, thanks a lot!
> >>
> >> In this case I'm wondering how it works on the Dragonboard 410c.
> >> Does it enable these power domains in the firmware?
> >>     (Assuming it boots without this error...)
> >>
> >> If coresight is not working properly on all/most msm8916 devices,
> >> shouldn't coresight be disabled by default in msm8916.dtsi?
> >> At least until those power domains can be set up by the kernel.
> >>
> >> If this is a device-specific issue, what would be an acceptable solution
> >> for mainline?
> >> Can I turn on these power domains from the kernel?
> >> Or is it fine to disable coresight for this device with the snippet above?
> >>
> >> I'm not actually trying to use coresight, I just want the device to boot :)
> >> And since I am considering submitting my device tree for inclusion in
> >> mainline, I want to ask in advance how I should tackle this problem.
> >>
> >> Thanks!
> >> Stephan
> >>
> >
> > This doesn't seem like cpuidle or debug power domain issue, but looks
>
> We are not yet there in the Coresight driver and we crash at AMBA bus layer
> trying to read the PID of the CoreSight device. So I doubt if this is an
> issue your patch trying to address. I still think this is a debug power domain
> issue. More your patch below.
>
> > like cpu affinity issue. Can you please try out this patch and let us
> > know?
>
> In general I am for the patch, breaking the "assumption" that a missing CPU
> phandle gives you the affinity of "0".
>
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> > b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> > index e8819d750938..9acf9f190d42 100644
> > --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> > +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> > @@ -579,7 +579,11 @@ static int debug_probe(struct amba_device *adev,
> > const struct amba_id *id)
> >       if (!drvdata)
> >               return -ENOMEM;
> >
> > -     drvdata->cpu = np ? of_coresight_get_cpu(np) : 0;
> > +     drvdata->cpu = np ? of_coresight_get_cpu(np) : -ENODEV;
>
>
> of_coresight_get_cpu() must be modified to return -ENODEV, rather than
> defaulting to 0. This is something that is required by the CTI driver too.
> And lets not bring up something and assume it belongs to CPU0.
>
> > +     if (drvdata->cpu == -ENODEV) {
> > +             return -ENODEV;
> > +     }
> > +
> >       if (per_cpu(debug_drvdata, drvdata->cpu)) {
> >               dev_err(dev, "CPU%d drvdata has already been initialized\n",
> >                       drvdata->cpu);
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c
> > b/drivers/hwtracing/coresight/coresight-etm4x.c
> > index 8bb0092c7ec2..660432acbac0 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> > @@ -1107,7 +1107,10 @@ static int etm4_probe(struct amba_device *adev,
> > const struct amba_id *id)
> >
> >       spin_lock_init(&drvdata->spinlock);
> >
> > -     drvdata->cpu = pdata ? pdata->cpu : 0;
>
> I believe, we should simply abort when we don't have pdata. There is no point
> in registering this ETM unless we know where this is connected to.
>
> > +     drvdata->cpu = pdata ? pdata->cpu : -ENODEV;
> > +     if (drvdata->cpu == -ENODEV) {
> > +             return -ENODEV;
> > +       }
>
> >
> >       cpus_read_lock();
> >       etmdrvdata[drvdata->cpu] = drvdata;
> > diff --git a/drivers/hwtracing/coresight/of_coresight.c
> > b/drivers/hwtracing/coresight/of_coresight.c
> > index 7045930fc958..8c1b90ba233c 100644
> > --- a/drivers/hwtracing/coresight/of_coresight.c
> > +++ b/drivers/hwtracing/coresight/of_coresight.c
> > @@ -153,14 +153,14 @@ int of_coresight_get_cpu(const struct device_node
> > *node)
> >       struct device_node *dn;
> >
> >       dn = of_parse_phandle(node, "cpu", 0);
> > -     /* Affinity defaults to CPU0 */
> > +     /* Affinity defaults to invalid */
> >       if (!dn)
> > -             return 0;
> > +             return -ENODEV;
> >       cpu = of_cpu_node_to_id(dn);
> >       of_node_put(dn);
> >
> > -     /* Affinity to CPU0 if no cpu nodes are found */
> > -     return (cpu < 0) ? 0 : cpu;
> > +     /* Affinity to invalid if no cpu nodes are found */
> > +     return (cpu < 0) ? -ENODEV : cpu;
>
>         return cpu ?
>
> If you split this into 3 different patches, I would be happy to Ack them.
>
> Mathieu,
>
> What do you think ?

I'm all for it.  Defaulting to '0' was valid in an era that is long
gone and needs to be fixed.

>
>
> Cheers
> Suzuki
