Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7A5412D4D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 23:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727735AbfL3Wb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 17:31:56 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:60868 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727695AbfL3Wb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 17:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=VMKfHLqRT2R2sg5Nk4++uNSF4hBm9QlbBpbhWdr26ug=; b=RjQsh5TNuMgwnnYYgIj/heu4M
        ayZy1FSJtnRYOsoEJ275SOfMfTJqSdoLh9krotEEcuAVlsFBb07bJ1XEZkHeI8WdW+zNx4zLwEahv
        GkbipATHefXtqGNj8AV82A+ngRJkHJRlgeFQBpqsrI1pF2X66C6LC48NvN2wWlbXv+V76ccJqHiM6
        y7a5Xm3wFDE8UJV/3TD0BKYkXa2TeDsWGFB+LD1bcWSLSo26Xzro5Jz6K4FL3Xq0E5n3KudwlcB+/
        2XDR4aE+QN/sN/iUfs+CJapcEY7ZsX5/L9YQHyAz1VFcyegzdjgFj764o5ypzprXAVwSFZtenvP+1
        kwAjWKayw==;
Received: from [2601:1c0:6280:3f0::34d9]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1im3Zm-0006NR-Du; Mon, 30 Dec 2019 22:31:50 +0000
Subject: Re: [PATCH v7 13/15] docs: coresight: Update documentation for
 CoreSight to cover CTI.
To:     Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net
References: <20191230164441.28375-1-mike.leach@linaro.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5948ee00-c3e8-749d-2354-5089b0103cee@infradead.org>
Date:   Mon, 30 Dec 2019 14:31:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191230164441.28375-1-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

Just a couple of small nits below.


On 12/30/19 8:44 AM, Mike Leach wrote:
> Add new document covering CTI / CTM usage in CoreSight.
> 
> Add section in coresight.rst introducing CTI and CTM modules with link
> to new document.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  .../trace/coresight/coresight-ect.rst         | 211 ++++++++++++++++++
>  Documentation/trace/coresight/coresight.rst   |  13 ++
>  2 files changed, 224 insertions(+)
>  create mode 100644 Documentation/trace/coresight/coresight-ect.rst
> 
> diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
> new file mode 100644
> index 000000000000..3e06588f24fa
> --- /dev/null
> +++ b/Documentation/trace/coresight/coresight-ect.rst
> @@ -0,0 +1,211 @@
> +=============================================
> +CoreSight Embedded Cross Trigger (CTI & CTM).
> +=============================================
> +
> +    :Author:   Mike Leach <mike.leach@linaro.org>
> +    :Date:     November 2019
> +
> +Hardware Description
> +--------------------
> +
> +The CoreSight Cross Trigger Interface (CTI) is a hardware device that takes
> +individual input and output hardware signals known as triggers to and from
> +devices and interconnects them via the Cross Trigger Matrix (CTM) to other
> +devices via numbered channels, in order to propagate events between devices.
> +
> +e.g.::
> +
> + 0000000  in_trigs  :::::::
> + 0 C   0----------->:     :             +======>(other CTI channel IO)
> + 0  P  0<-----------:     :             v
> + 0   U 0  out_trigs :     : Channels  *****      :::::::
> + 0000000            : CTI :<=========>*CTM*<====>: CTI :---+
> + #######  in_trigs  :     : (id 0-3)  *****      :::::::   v
> + # ETM #----------->:     :                         ^   #######
> + #     #<-----------:     :                         +---# ETR #
> + ####### out_trigs  :::::::                             #######
> +
> +The CTI driver enables the programming of the CTI to attach triggers to
> +channels. When an input trigger becomes active, the attached channel will
> +become active. Any output trigger attached to that channel will also
> +become active. The active channel is propagated to other CTIs via the CTM,
> +activating connected output triggers there, unless filtered by the CTI
> +channel gate.
> +
> +It is also possible to activate a channel using system software directly
> +programming registers in the CTI.
> +
> +The CTIs are registered by the system to be associated with CPUs and/or other
> +CoreSight devices on the trace data path. When these devices are enabled the
> +attached CTIs will also be enabled. By default/on power up the CTIs have
> +no programmed trigger/channel attachments, so will not affect the system
> +until explicitly programmed.
> +
> +The hardware trigger connections between CTIs and devices is implementation
> +defined, unless the CPU/ETM combination is a v8 architecture, in which case
> +the connections have an architecturally defined standard layout.
> +
> +The hardware trigger signals can also be connected to non-CoreSight devices
> +(e.g. UART), or be propagated off chip as hardware IO lines.
> +
> +All the CTI devices are associated with a CTM. On many systems there will be a
> +single effective CTM (one CTM, or multiple CTMs all interconnected), but it is
> +possible that systems can have nets of CTIs+CTM that are not interconnected by
> +a CTM to each other. On these systems a CTM index is declared to associate
> +CTI devices that are interconnected via a given CTM.
> +
> +Sysfs files and directories
> +---------------------------
> +
> +The CTI devices appear on the existing CoreSight bus alongside the other
> +CoreSight devices::
> +
> +    >$ ls /sys/bus/coresight/devices
> +     cti_cpu0  cti_cpu2  cti_sys0  etm0  etm2  funnel0  replicator0  tmc_etr0
> +     cti_cpu1  cti_cpu3  cti_sys1  etm1  etm3  funnel1  tmc_etf0     tpiu0
> +
> +The ``cti_cpu<N>`` named CTIs are associated with a CPU, and any ETM used by
> +that core. the ``cti_sys<N>`` CTIs are general system infrastructure CTIs that

              The

> +can be associated with other CoreSight devices, or other system hardware
> +capable of generating or using trigger signals.::
> +
> +  >$ ls /sys/bus/coresight/devices/etm0/cti_cpu0
> +  channels  ctmid  enable  nr_trigger_cons mgmt  power  regs  subsystem
> +  triggers0 triggers1  uevent
> +
> +*Key file items are:-*
> +   * ``enable``: enables/disables the CTI.
> +   * ``ctmid`` : associated CTM - only relevant if system has multiple CTI+CTM
> +     clusters that are not interconnected.
> +   * ``nr_trigger_cons`` : total connections - triggers<N> directories.
> +
> +*Sub-directories:-*
> +   * ``triggers<N>``: contains list of triggers for an individual connection.
> +   * ``channels``: Contains the channel API - CTI main programming interface.
> +   * ``regs``: Gives access to the raw programmable CTI regs.
> +   * ``mgmt``: the standard CoreSight management registers.
> +
> +
> +triggers<N> directories
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Individual trigger connection information. This describes trigger signals for
> +CoreSight and non-CoreSight connections.
> +
> +Each triggers directory has a set of parameters describing the triggers for
> +the connection.
> +
> +   * ``name`` : name of connection
> +   * ``in_signals`` : input trigger signal indexes used in this connection.
> +   * ``in_types`` : functional types for in signals.
> +   * ``out_signals`` : output trigger signals for this connection.
> +   * ``out_types`` : functional types for out signals.
> +
> +e.g::
> +
> +    >$ ls ./cti_cpu0/triggers0/
> +    in_signals  in_types  name  out_signals  out_types
> +    >$ cat ./cti_cpu0/triggers0/name
> +    cpu0
> +    >$ cat ./cti_cpu0/triggers0/out_signals
> +    0-2
> +    >$ cat ./cti_cpu0/triggers0/out_types
> +    pe_edbgreq pe_dbgrestart pe_ctiirq
> +    >$ cat ./cti_cpu0/triggers0/in_signals
> +    0-1
> +    >$ cat ./cti_cpu0/triggers0/in_types
> +    pe_dbgtrigger pe_pmuirq
> +
> +If a connection has zero signals in either the 'in' or 'out' triggers then
> +those parameters will be omitted.
> +
> +Channels API Directory
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +This provides an easy way to attach triggers to channels, without needing
> +the multiple register operations that are required if manipulating the
> +'regs' sub-dir elements directly.

spell out: sub-directory

> +
> +A number of files provide this API::
> +
> +   >$ ls ./cti_sys0/channels/
> +   chan_clear         chan_inuse         chan_xtrigs_view      trigin_detach
> +   chan_free          chan_pulse         chan_xtrigs_view_sel  trigout_attach
> +   chan_gate_disable  chan_set           trig_filter_enable    trigout_detach
> +   chan_gate_enable   chan_xtrigs_reset  trigin_attach         trigout_filtered
> +
> +Most access to these elements take the form::
> +
> +  echo <chan> [<trigger>] > /<device_path>/<operation>
> +
> +where the optional <trigger> is only needed for trigXX_attach | detach
> +operations.
> +
> +e.g.::
> +
> +   >$ echo 0 1 > ./cti_sys0/channels/trigout_attach
> +   >$ echo 0 > ./cti_sys0/channels/chan_set
> +
> +Attaches trigout(1) to channel(0), then activates channel(0) generating a
> +set state on cti_sys0.trigout(1)
> +
> +
> +*API operations*
> +
> +   * ``trigin_attach, trigout_attach``: Attach a channel to a trigger signal.
> +   * ``trigin_detach, trigout_detach``: Detach a channel from a trigger signal.
> +   * ``chan_set``: Set the channel - the set state will be propagated around
> +     the CTM to other connected devices.
> +   * ``chan_clear``: Clear the channel.
> +   * ``chan_pulse``: Set the channel for a single CoreSight clock cycle.
> +   * ``chan_gate_enable``: Write operation sets the CTI gate to propagate
> +     (enable) the channel to other devices. This operation takes a channel
> +     number. CTI gate is enabled for all channels by default at power up. Read
> +     to list the currently enabled channels on the gate.
> +   * ``chan_gate_disable``: Write channel number to disable gate for that
> +     channel.
> +   * ``chan_inuse``: Show the current channels attached to any signal
> +   * ``chan_free``: Show channels with no attached signals.
> +   * ``chan_xtrig_view``: write a channel number to select a channel to view,
> +     read to show the cross triggers programmed for the selected channel.
> +   * ``trig_filter_enable``: Defaults to enabled, disable to allow potentially
> +     dangerous output signals to be set.
> +   * ``trigout_filtered``: Trigger out signals that are prevented from being
> +     set if filtering ``trig_filter_enable`` is enabled. One use is to prevent
> +     accidental ``EDBGREQ`` signals stopping a core.
> +   * ``chan_xtrigs_reset``: Write 1 to clear all channel / trigger programming.
> +     Resets device hardware to default state.
> +
> +
> +The example below attaches input trigger index 1 to channel 2, and output
> +trigger index 6 to the same channel. It then examines the state of the
> +channel / trigger connections using the appropriate sysfs attributes.
> +
> +The settings mean that if either input trigger 1, or channel 2 go active then
> +trigger out 6 will go active. We then enable the CTI, and use the software
> +channel control to activate channel 2. We see the active channel on the
> +``choutstatus`` register and the active signal on the ``trigoutstatus``
> +register. Finally clearing the channel removes this.
> +
> +e.g.::
> +
> +   .../cti_sys0/channels# echo 2 1 > trigin_attach
> +   .../cti_sys0/channels# echo 2 6 > trigout_attach
> +   .../cti_sys0/channels# cat chan_free
> +   0-1,3
> +   .../cti_sys0/channels# cat chan_inuse
> +   2
> +   .../cti_sys0/channels# echo 2 > chan_xtrigs_view
> +   .../cti_sys0/channels# cat chan_xtrigs_view
> +   [2] IN: 1 OUT: 6
> +   .../cti_sys0/# echo 1 > enable
> +   .../cti_sys0/channels# echo 2 > chan_set
> +   .../cti_sys0/channels# cat ../regs/choutstatus
> +   0x4
> +   .../cti_sys0/channels# cat ../regs/trigoutstatus
> +   0x40
> +   .../cti_sys0/channels# echo 2 > chan_clear
> +   .../cti_sys0/channels# cat ../regs/trigoutstatus
> +   0x0
> +   .../cti_sys0/channels# cat ../regs/choutstatus
> +   0x0


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy

