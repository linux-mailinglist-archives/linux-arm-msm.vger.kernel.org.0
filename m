Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B41EB139B63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 22:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbgAMV1H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 16:27:07 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45034 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbgAMV1H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 16:27:07 -0500
Received: by mail-qt1-f196.google.com with SMTP id t3so10465338qtr.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 13:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gcgIXagv9xlLeS1uftnUlf0r/3UfyI9j0EIrXBwdKws=;
        b=sbEHlL88mPlpn6n70LlQP7W2VtELrkH7ImeUzIwEWDL9yn9gaaGkL8jfRbZR7vsPXC
         cFpbJgpG7nikKxhg8c7d4FBy0CFRtdt3YoH5kCb383DLWhvan1zP66nrKjkuWirgsOdL
         H8RjUQJC1eZkgQS7sRa4+r5m2Ru5bxNMR/LEzoaNuGtvwfUo8+tBB4+2P0CQH6Jqhobu
         7beSPEV1VdCjWpx7xabXxdKPFGXh68Em/woWEjR3Z7QJ9oPx4VkDUNUBbw2657npgOW6
         4olO0Nb2tGH0VVve8j9s8SYlU9q/zUDuhHhTw3JzQbENufo+DqOsCS0iAKW4uA3ELv82
         psjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gcgIXagv9xlLeS1uftnUlf0r/3UfyI9j0EIrXBwdKws=;
        b=pNjLcZBKz83cudcDLfbRuBnNfNw3a5LWdY+T8OqPZg46mdC30rQVRPDYW3Aj1cPolA
         rPoTpGYlw8dQeDwQF7B3YUgsJsk7md6RX1g4gQWOKYJhnaEiv7sc2Rx0JIIb1eoVbQcS
         WXbLo6PDty18MxcW5fcsEqH+quknUBydNZdMiVIQY7mSbVi4hMTQUv2l4KaeftMUaVW1
         fff6VfDd5gpsTU91iIvfPh/tGmLMw1DpM5Ghu/t+3F386RpMip12PlE5Gp3A200m9O1Q
         BZoKB+BhoU98GdK1jte3DwhVTF6HnngjLfspGrEnPQjP7EX6VL04Ly55rL0pHaArbkcc
         Akjg==
X-Gm-Message-State: APjAAAUhv05C2IYkFPfnVTZWiFo/tBWhqCZJf4gm7VHESChAB0UMrlsi
        xd2EPQTHYzsn91KWL/Ep09CcRdV2UtJHp96favyaaQ==
X-Google-Smtp-Source: APXvYqyM/xikDuCaNzYus/59D6sHaBSDSDCnTVnEruA+p256OWEmOn9Mf67OV2i5zDtjEOlM0GwhnK9DfXdMigBIP8M=
X-Received: by 2002:ac8:7b9b:: with SMTP id p27mr652514qtu.2.1578950826327;
 Mon, 13 Jan 2020 13:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20191230164441.28375-1-mike.leach@linaro.org> <5948ee00-c3e8-749d-2354-5089b0103cee@infradead.org>
In-Reply-To: <5948ee00-c3e8-749d-2354-5089b0103cee@infradead.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Mon, 13 Jan 2020 21:26:55 +0000
Message-ID: <CAJ9a7VjdnWw1KOiRHLpSRu8kLHfpBEeqh7bQvednE0hDjngYYA@mail.gmail.com>
Subject: Re: [PATCH v7 13/15] docs: coresight: Update documentation for
 CoreSight to cover CTI.
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks - these will be fixed in v8

Mike

On Mon, 30 Dec 2019 at 22:31, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi Mike,
>
> Just a couple of small nits below.
>
>
> On 12/30/19 8:44 AM, Mike Leach wrote:
> > Add new document covering CTI / CTM usage in CoreSight.
> >
> > Add section in coresight.rst introducing CTI and CTM modules with link
> > to new document.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  .../trace/coresight/coresight-ect.rst         | 211 ++++++++++++++++++
> >  Documentation/trace/coresight/coresight.rst   |  13 ++
> >  2 files changed, 224 insertions(+)
> >  create mode 100644 Documentation/trace/coresight/coresight-ect.rst
> >
> > diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
> > new file mode 100644
> > index 000000000000..3e06588f24fa
> > --- /dev/null
> > +++ b/Documentation/trace/coresight/coresight-ect.rst
> > @@ -0,0 +1,211 @@
> > +=============================================
> > +CoreSight Embedded Cross Trigger (CTI & CTM).
> > +=============================================
> > +
> > +    :Author:   Mike Leach <mike.leach@linaro.org>
> > +    :Date:     November 2019
> > +
> > +Hardware Description
> > +--------------------
> > +
> > +The CoreSight Cross Trigger Interface (CTI) is a hardware device that takes
> > +individual input and output hardware signals known as triggers to and from
> > +devices and interconnects them via the Cross Trigger Matrix (CTM) to other
> > +devices via numbered channels, in order to propagate events between devices.
> > +
> > +e.g.::
> > +
> > + 0000000  in_trigs  :::::::
> > + 0 C   0----------->:     :             +======>(other CTI channel IO)
> > + 0  P  0<-----------:     :             v
> > + 0   U 0  out_trigs :     : Channels  *****      :::::::
> > + 0000000            : CTI :<=========>*CTM*<====>: CTI :---+
> > + #######  in_trigs  :     : (id 0-3)  *****      :::::::   v
> > + # ETM #----------->:     :                         ^   #######
> > + #     #<-----------:     :                         +---# ETR #
> > + ####### out_trigs  :::::::                             #######
> > +
> > +The CTI driver enables the programming of the CTI to attach triggers to
> > +channels. When an input trigger becomes active, the attached channel will
> > +become active. Any output trigger attached to that channel will also
> > +become active. The active channel is propagated to other CTIs via the CTM,
> > +activating connected output triggers there, unless filtered by the CTI
> > +channel gate.
> > +
> > +It is also possible to activate a channel using system software directly
> > +programming registers in the CTI.
> > +
> > +The CTIs are registered by the system to be associated with CPUs and/or other
> > +CoreSight devices on the trace data path. When these devices are enabled the
> > +attached CTIs will also be enabled. By default/on power up the CTIs have
> > +no programmed trigger/channel attachments, so will not affect the system
> > +until explicitly programmed.
> > +
> > +The hardware trigger connections between CTIs and devices is implementation
> > +defined, unless the CPU/ETM combination is a v8 architecture, in which case
> > +the connections have an architecturally defined standard layout.
> > +
> > +The hardware trigger signals can also be connected to non-CoreSight devices
> > +(e.g. UART), or be propagated off chip as hardware IO lines.
> > +
> > +All the CTI devices are associated with a CTM. On many systems there will be a
> > +single effective CTM (one CTM, or multiple CTMs all interconnected), but it is
> > +possible that systems can have nets of CTIs+CTM that are not interconnected by
> > +a CTM to each other. On these systems a CTM index is declared to associate
> > +CTI devices that are interconnected via a given CTM.
> > +
> > +Sysfs files and directories
> > +---------------------------
> > +
> > +The CTI devices appear on the existing CoreSight bus alongside the other
> > +CoreSight devices::
> > +
> > +    >$ ls /sys/bus/coresight/devices
> > +     cti_cpu0  cti_cpu2  cti_sys0  etm0  etm2  funnel0  replicator0  tmc_etr0
> > +     cti_cpu1  cti_cpu3  cti_sys1  etm1  etm3  funnel1  tmc_etf0     tpiu0
> > +
> > +The ``cti_cpu<N>`` named CTIs are associated with a CPU, and any ETM used by
> > +that core. the ``cti_sys<N>`` CTIs are general system infrastructure CTIs that
>
>               The
>
> > +can be associated with other CoreSight devices, or other system hardware
> > +capable of generating or using trigger signals.::
> > +
> > +  >$ ls /sys/bus/coresight/devices/etm0/cti_cpu0
> > +  channels  ctmid  enable  nr_trigger_cons mgmt  power  regs  subsystem
> > +  triggers0 triggers1  uevent
> > +
> > +*Key file items are:-*
> > +   * ``enable``: enables/disables the CTI.
> > +   * ``ctmid`` : associated CTM - only relevant if system has multiple CTI+CTM
> > +     clusters that are not interconnected.
> > +   * ``nr_trigger_cons`` : total connections - triggers<N> directories.
> > +
> > +*Sub-directories:-*
> > +   * ``triggers<N>``: contains list of triggers for an individual connection.
> > +   * ``channels``: Contains the channel API - CTI main programming interface.
> > +   * ``regs``: Gives access to the raw programmable CTI regs.
> > +   * ``mgmt``: the standard CoreSight management registers.
> > +
> > +
> > +triggers<N> directories
> > +~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Individual trigger connection information. This describes trigger signals for
> > +CoreSight and non-CoreSight connections.
> > +
> > +Each triggers directory has a set of parameters describing the triggers for
> > +the connection.
> > +
> > +   * ``name`` : name of connection
> > +   * ``in_signals`` : input trigger signal indexes used in this connection.
> > +   * ``in_types`` : functional types for in signals.
> > +   * ``out_signals`` : output trigger signals for this connection.
> > +   * ``out_types`` : functional types for out signals.
> > +
> > +e.g::
> > +
> > +    >$ ls ./cti_cpu0/triggers0/
> > +    in_signals  in_types  name  out_signals  out_types
> > +    >$ cat ./cti_cpu0/triggers0/name
> > +    cpu0
> > +    >$ cat ./cti_cpu0/triggers0/out_signals
> > +    0-2
> > +    >$ cat ./cti_cpu0/triggers0/out_types
> > +    pe_edbgreq pe_dbgrestart pe_ctiirq
> > +    >$ cat ./cti_cpu0/triggers0/in_signals
> > +    0-1
> > +    >$ cat ./cti_cpu0/triggers0/in_types
> > +    pe_dbgtrigger pe_pmuirq
> > +
> > +If a connection has zero signals in either the 'in' or 'out' triggers then
> > +those parameters will be omitted.
> > +
> > +Channels API Directory
> > +~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +This provides an easy way to attach triggers to channels, without needing
> > +the multiple register operations that are required if manipulating the
> > +'regs' sub-dir elements directly.
>
> spell out: sub-directory
>
> > +
> > +A number of files provide this API::
> > +
> > +   >$ ls ./cti_sys0/channels/
> > +   chan_clear         chan_inuse         chan_xtrigs_view      trigin_detach
> > +   chan_free          chan_pulse         chan_xtrigs_view_sel  trigout_attach
> > +   chan_gate_disable  chan_set           trig_filter_enable    trigout_detach
> > +   chan_gate_enable   chan_xtrigs_reset  trigin_attach         trigout_filtered
> > +
> > +Most access to these elements take the form::
> > +
> > +  echo <chan> [<trigger>] > /<device_path>/<operation>
> > +
> > +where the optional <trigger> is only needed for trigXX_attach | detach
> > +operations.
> > +
> > +e.g.::
> > +
> > +   >$ echo 0 1 > ./cti_sys0/channels/trigout_attach
> > +   >$ echo 0 > ./cti_sys0/channels/chan_set
> > +
> > +Attaches trigout(1) to channel(0), then activates channel(0) generating a
> > +set state on cti_sys0.trigout(1)
> > +
> > +
> > +*API operations*
> > +
> > +   * ``trigin_attach, trigout_attach``: Attach a channel to a trigger signal.
> > +   * ``trigin_detach, trigout_detach``: Detach a channel from a trigger signal.
> > +   * ``chan_set``: Set the channel - the set state will be propagated around
> > +     the CTM to other connected devices.
> > +   * ``chan_clear``: Clear the channel.
> > +   * ``chan_pulse``: Set the channel for a single CoreSight clock cycle.
> > +   * ``chan_gate_enable``: Write operation sets the CTI gate to propagate
> > +     (enable) the channel to other devices. This operation takes a channel
> > +     number. CTI gate is enabled for all channels by default at power up. Read
> > +     to list the currently enabled channels on the gate.
> > +   * ``chan_gate_disable``: Write channel number to disable gate for that
> > +     channel.
> > +   * ``chan_inuse``: Show the current channels attached to any signal
> > +   * ``chan_free``: Show channels with no attached signals.
> > +   * ``chan_xtrig_view``: write a channel number to select a channel to view,
> > +     read to show the cross triggers programmed for the selected channel.
> > +   * ``trig_filter_enable``: Defaults to enabled, disable to allow potentially
> > +     dangerous output signals to be set.
> > +   * ``trigout_filtered``: Trigger out signals that are prevented from being
> > +     set if filtering ``trig_filter_enable`` is enabled. One use is to prevent
> > +     accidental ``EDBGREQ`` signals stopping a core.
> > +   * ``chan_xtrigs_reset``: Write 1 to clear all channel / trigger programming.
> > +     Resets device hardware to default state.
> > +
> > +
> > +The example below attaches input trigger index 1 to channel 2, and output
> > +trigger index 6 to the same channel. It then examines the state of the
> > +channel / trigger connections using the appropriate sysfs attributes.
> > +
> > +The settings mean that if either input trigger 1, or channel 2 go active then
> > +trigger out 6 will go active. We then enable the CTI, and use the software
> > +channel control to activate channel 2. We see the active channel on the
> > +``choutstatus`` register and the active signal on the ``trigoutstatus``
> > +register. Finally clearing the channel removes this.
> > +
> > +e.g.::
> > +
> > +   .../cti_sys0/channels# echo 2 1 > trigin_attach
> > +   .../cti_sys0/channels# echo 2 6 > trigout_attach
> > +   .../cti_sys0/channels# cat chan_free
> > +   0-1,3
> > +   .../cti_sys0/channels# cat chan_inuse
> > +   2
> > +   .../cti_sys0/channels# echo 2 > chan_xtrigs_view
> > +   .../cti_sys0/channels# cat chan_xtrigs_view
> > +   [2] IN: 1 OUT: 6
> > +   .../cti_sys0/# echo 1 > enable
> > +   .../cti_sys0/channels# echo 2 > chan_set
> > +   .../cti_sys0/channels# cat ../regs/choutstatus
> > +   0x4
> > +   .../cti_sys0/channels# cat ../regs/trigoutstatus
> > +   0x40
> > +   .../cti_sys0/channels# echo 2 > chan_clear
> > +   .../cti_sys0/channels# cat ../regs/trigoutstatus
> > +   0x0
> > +   .../cti_sys0/channels# cat ../regs/choutstatus
> > +   0x0
>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>
> thanks.
> --
> ~Randy
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
