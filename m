Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C81E1170A10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 21:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbgBZU64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 15:58:56 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46498 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgBZU6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 15:58:55 -0500
Received: by mail-pg1-f195.google.com with SMTP id y30so235555pga.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 12:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5i4kIErvQGw44vXaerAikXm4yrNAjy2U007Z9HcTHsk=;
        b=xV1PffHpd8aoWxT9tCiJoOHV/o1IukGw0zUuVqpv7XALZeER9YCv0vzCn1YZ47eY2R
         fOfYoK3gHDaA9ioH6flf7RtJXJbYfVGWKWEjVgC9Qm/iUxRGJx/5hL+TofnEUBP4y5Yi
         tJfPS8CEGTxAnZFcrPMyBEWiwdEH6zXXJQX1BpuD6DrtqKCxqvufNYXfJIftAU0Tvv+R
         8h1iNWL/j6dZyL8bAGrqJ5Ec3mr1SUVO8mG9A8W+AxFpf6eqo+jzkdYBoxFze7FKtBaz
         unFsgzB2FyhStLd1JOz+6ZK9SALqmiJvL61w/9GHW5QUo+UZoujd/et+Ob6UJvQ5ES5s
         1G7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5i4kIErvQGw44vXaerAikXm4yrNAjy2U007Z9HcTHsk=;
        b=Fog+taQqX7aBfo9kjA7HYdXbt/k8gK6iLZ5P/rXRlF4Nx5glYOoyKsYyGh7194kmp5
         zSb3LCmNweaDYC18gOWnAtwjeDj5pM9CWdva5/GJLF+ETSq2B8LO8km9ldgTYRpdPDIe
         Rq77uw0sjXaNbUcNVBi1YukDWnKh6zgnfpFOIf9QkzhjELL/NJP4IQiaoyQaSR9z3RrW
         GJS2wPrQBT7s7LPOFrYiCfQL9g48sl/QD19wGqaEJU70zKWCP0Se8N5vCtu/XUHMIJmI
         7cKFelBVb5wNId76ckMbgUxRGxhfnWL4HvqOYzS93U1pGtLan7egW3C6b8b3yX5yZiyk
         aAdQ==
X-Gm-Message-State: APjAAAU6X3Nc4SLuTrxpOlqNoRJZqX9fqd/acSTyOfmg8gMNl+HThU8t
        bojZHYZF9wfw2xS1JBqrUUS3DA==
X-Google-Smtp-Source: APXvYqxxfLDrLKEpazTetrahW8GWUVcCfC+U2Ect9o5IlSTMhO3ug8VVxzoXdqY9qvj1D3MGbvV61A==
X-Received: by 2002:a65:478a:: with SMTP id e10mr639577pgs.197.1582750733873;
        Wed, 26 Feb 2020 12:58:53 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 10sm3992727pfu.132.2020.02.26.12.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 12:58:53 -0800 (PST)
Date:   Wed, 26 Feb 2020 13:58:51 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, suzuki.poulose@arm.com,
        robh+dt@kernel.org, maxime@cerno.tech, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, agross@kernel.org,
        corbet@lwn.net
Subject: Re: [PATCH v10 00/15] CoreSight CTI Driver
Message-ID: <20200226205851.GA30754@xps15>
References: <20200225234611.11067-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225234611.11067-1-mike.leach@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

On Tue, Feb 25, 2020 at 11:45:56PM +0000, Mike Leach wrote:
> CTIs are defined in the device tree and associated with other CoreSight
> devices. The core CoreSight code has been modified to enable the registration
> of the CTI devices on the same bus as the other CoreSight components,
> but as these are not actually trace generation / capture devices, they
> are not part of the Coresight path when generating trace.
> 
> However, the definition of the standard CoreSight device has been extended
> to include a reference to an associated CTI device, and the enable / disable
> trace path operations will auto enable/disable any associated CTI devices at
> the same time.
> 
> Programming is at present via sysfs - a full API is provided to utilise the
> hardware capabilities. As CTI devices are unprogrammed by default, the auto
> enable describe above will have no effect until explicit programming takes
> place.
> 
> A set of device tree bindings specific to the CTI topology has been defined.
> The driver accesses these in a platform agnostic manner, so ACPI bindings
> can be added later, once they have been agreed and defined for the CTI device.
> 
> Documentation has been updated to describe both the CTI hardware, its use and
> programming in sysfs, and the new dts bindings required.

I have applied this set to my next branch.

Thanks,
Mathieu

> 
> Tested on DB410 board and Juno board, against the Linux 5.6-rc3 tree.
> 
> Changes since v9:
> 1) Removed 2 unneeded devm_kstrdup calls, fixed error check on another.
> 2) Fixed variable array declaration from [0] to [].
> 
> Changes since v8:
> 1) Use devm_ allocation in cti_match_fixup_csdev() to match other allocations.
> 2) Minor comment update per request.
> 
> Changes since v7:
> NB: No functional driver changes in this set. Full set released for
> consistency, completeness and ease of use.
> 1) Updates to device tree bindings .yaml following comments from Rob Herring.
>    Adds #size-cells and #address-cells to properties and constrained as
>    required. Validated using dt_binding_check.
> 2) Minor typo fixes to cti documentation file.
> 
> Changes since v6:
> NB: No functional driver changes in this set. Full set released for
> consistency, completeness and ease of use.
> 1) Updates to .yaml following comments from Maxime Ripard. Correct child node
>    descriptions, fix validation, and ensure reg entries required in child
>    nodes as per DeviceTree specification.
> 2) Update to Juno bindings to implement reg entry specification requirements.
> 
> Changes since v5:
> 1) Fixed up device tree .yaml file. Using extra compatible string for
> v8 architecture CTI connections.
> 2) Ensure association code respects coresight mutex when setting cross
> referenced pointers. Add in shutdown code.
> 3) Multiple minor code fixes & rationalisation. 
> 
> Changes since v4:
> Multiple changes following feedback from Mathieu, Leo and Suzuki.
> 1) Dropped RFC tag - wider distribution
> 2) CTI bindings definition now presented as a .yaml file - tested with
> with 'dt-doc-validate' from devicetree.org/dt-schema project and in kernel
> build tree with 'make dtbs_check' per kernel docs.
> 3) Sysfs links to other CoreSight devices moved out of this set into
> a following set that deals with all CoreSight devices & sysfs links.
> 4) Documentation in .rst format and new directory following patchset in [1].
> Extended example provided in docs.
> 5) Rationalised devicetree of_ specifics to use generic fwnode functions
> where possible to enable easier addition of ACPI support later.
> 6) Other minor changes as requested in feedback from last patchset.
> 
> Changes since v3:
> 1) After discussion on CS mailing list, each CTI connection has a triggers<N>
>    sysfs directory with name and trigger signals listed for the connection.
> 2) Initial code for creating sysfs links between CoreSight components is
>   introduced and implementation for CTI provided. This allows exploration
>   of the CoreSight topology within the sysfs infrastructure. Patches for
>   links between other CoreSight components to follow.
> 3) Power management - CPU hotplug and idle omitted from this set as ongoing
>    developments may define required direction. Additional patch set to follow.
> 4) Multiple fixes applied as requested by reviewers esp. Matthieu, Suzuki
>    and Leo. 
> 
> Changes since v2:
> Updates to allow for new features on coresight/next and feedback from
> Mathieu and Leo.
> 
> 1) Rebase and restructuring to apply on top of ACPI support patch set,
> currently on coresight/next. of_coresight_cti has been renamed to
> coresight-cti-platform and device tree bindings added to this but accessed
> in a platform agnostic manner using fwnode for later ACPI support
> to be added.
> 2) Split the sysfs patch info a series of functional patches.
> 3) Revised the refcount and enabling support.
> 4) Adopted the generic naming protocol - CTIs are either cti_cpuN or
> cti_sysM
> 5) Various minor presentation /checkpatch issues highlighted in feedback.
> 6) revised CPU hotplug to cover missing cases needed by ETM.
> 
> Changes since v1:
> 1) Significant restructuring of the source code. Adds cti-sysfs file and
> cti device tree file. Patches add per feature rather than per source
> file.
> 2) CPU type power event handling for hotplug moved to CoreSight core,
> with generic registration interface provided for all CPU bound CS devices
> to use.
> 3) CTI signal interconnection details in sysfs now generated dynamically
> from connection lists in driver. This to fix issue with multi-line sysfs
> output in previous version.
> 4) Full device tree bindings for DB410 and Juno provided (to the extent
> that CTI information is available).
> 5) AMBA driver update for UCI IDs are now upstream so no longer included
> in this set
> 
> Mike Leach (15):
>   coresight: cti: Initial CoreSight CTI Driver
>   coresight: cti: Add sysfs coresight mgmt reg access
>   coresight: cti: Add sysfs access to program function regs
>   coresight: cti: Add sysfs trigger / channel programming API
>   dt-bindings: arm: Adds CoreSight CTI hardware definitions
>   coresight: cti: Add device tree support for v8 arch CTI
>   coresight: cti: Add device tree support for custom CTI
>   coresight: cti: Enable CTI associated with devices
>   coresight: cti: Add connection information to sysfs
>   dt-bindings: qcom: Add CTI options for qcom msm8916
>   dt-bindings: arm: Juno platform - add CTI entries to device tree
>   dt-bindings: hisilicon: Add CTI bindings for hi-6220
>   docs: coresight: Update documentation for CoreSight to cover CTI
>   docs: sysfs: coresight: Add sysfs ABI documentation for CTI
>   Update MAINTAINERS to add reviewer for CoreSight
> 
>  .../testing/sysfs-bus-coresight-devices-cti   |  221 ++++
>  .../bindings/arm/coresight-cti.yaml           |  336 +++++
>  .../devicetree/bindings/arm/coresight.txt     |    7 +
>  .../trace/coresight/coresight-ect.rst         |  211 +++
>  Documentation/trace/coresight/coresight.rst   |   13 +
>  MAINTAINERS                                   |    3 +
>  arch/arm64/boot/dts/arm/juno-base.dtsi        |  162 ++-
>  arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi     |   37 +-
>  arch/arm64/boot/dts/arm/juno-r1.dts           |   25 +
>  arch/arm64/boot/dts/arm/juno-r2.dts           |   25 +
>  arch/arm64/boot/dts/arm/juno.dts              |   25 +
>  .../boot/dts/hisilicon/hi6220-coresight.dtsi  |  130 +-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi         |   85 +-
>  drivers/hwtracing/coresight/Kconfig           |   21 +
>  drivers/hwtracing/coresight/Makefile          |    3 +
>  .../coresight/coresight-cti-platform.c        |  485 +++++++
>  .../hwtracing/coresight/coresight-cti-sysfs.c | 1175 +++++++++++++++++
>  drivers/hwtracing/coresight/coresight-cti.c   |  745 +++++++++++
>  drivers/hwtracing/coresight/coresight-cti.h   |  235 ++++
>  .../hwtracing/coresight/coresight-platform.c  |   20 +
>  drivers/hwtracing/coresight/coresight-priv.h  |   15 +
>  drivers/hwtracing/coresight/coresight.c       |   86 +-
>  include/dt-bindings/arm/coresight-cti-dt.h    |   37 +
>  include/linux/coresight.h                     |   27 +
>  24 files changed, 4098 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
>  create mode 100644 Documentation/trace/coresight/coresight-ect.rst
>  create mode 100644 drivers/hwtracing/coresight/coresight-cti-platform.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-cti-sysfs.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-cti.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-cti.h
>  create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h
> 
> -- 
> 2.17.1
> 
