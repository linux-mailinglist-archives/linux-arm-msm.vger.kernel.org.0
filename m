Return-Path: <linux-arm-msm+bounces-21705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC548FC3F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 550E71C22495
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 06:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5EB13174B;
	Wed,  5 Jun 2024 06:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="GYYskoFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F8F190488;
	Wed,  5 Jun 2024 06:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717570412; cv=none; b=Bs+VUEcoz/tUATIa44VVSs9diIhMwMiiBQwiNXJ5IusEVbTaQLwUNUHHkE+641+RaNV4ST9T92Kg0tziL5Mb2KyUmgcoed46JcOi7mv4apqOu3NLtjVAc/k0BgNBPAq8SiORfGPmCPX1IyADDUsaLk7E9wuRdt/kPCPDspSBOIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717570412; c=relaxed/simple;
	bh=CiowKBQtwoqws7745eWWWJUDxkUAb/qiOhfe+HtXISc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGHsf3x6foO35uCDCmb+wfWl2RNlonuTI2pHZ78ocg4xxqiZ5J+AnGdTCMJbPWAb0gjC4wynLaI9Gw/0C7/xDv23PW2Xu9ufZFL9wQ6NNEVebfFZXdDXzkE8+4YkMfrftMwidLUE79PY2z8RvlkEbkrbcV3BlP5pAJFv4HXjWvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=GYYskoFT; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454LBQIM003926;
	Tue, 4 Jun 2024 23:52:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=TETFWkQC3O48rg20M9mDGPFWt
	BDifIvqBD+1Fgvl8M0=; b=GYYskoFTTVG4aTxX5MyD6SbeMcfBS40+d+3sxaufg
	mJQvs1IjRKvUhSkPIFuLC3Ybnuec8qglo+1JHYQyJntcMxPt1yjSYGgeobS1rbJe
	+pvF1Y0O/6hfvPsXEpq3jiDFsF5KAAWn7+/je6LB44hGgJzNfpSX0ckOuJIoNcT1
	to+HfTKkN+zC0lI3pxIRfBKZPRO/+qhfh/k3KmL8xKcQg8BLVX+Iuc8XwZsiVwIi
	evaadzx7ORS+3X847CSb49jyK82Z1oHvwtHypHBFJdxUul+rdIv9El/U0gjLgUjA
	eKWb5E9ZSdcJJ9uNTzJS3HjFy9OnRl6dTwhYPg7jPvesg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3yj167c703-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 23:52:58 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 23:52:57 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 4 Jun 2024 23:52:57 -0700
Received: from maili.marvell.com (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with SMTP id 6D92C3F70A5;
	Tue,  4 Jun 2024 23:52:46 -0700 (PDT)
Date: Wed, 5 Jun 2024 12:22:45 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz
 Augusto von Dentz <luiz.dentz@gmail.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Balakrishna Godavarthi
	<quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, Kalle Valo
	<kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn
 Helgaas <bhelgaas@google.com>,
        Srini Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>,
        <ath12k@lists.infradead.org>, <linux-pm@vger.kernel.org>,
        <linux-pci@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <kernel@quicinc.com>, Amit Pundir
	<amit.pundir@linaro.org>
Subject: Re: [PATCH v8 10/17] power: sequencing: implement the pwrseq core
Message-ID: <20240605065245.GB3452034@maili.marvell.com>
References: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
 <20240528-pwrseq-v8-10-d354d52b763c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-10-d354d52b763c@linaro.org>
X-Proofpoint-ORIG-GUID: r6srh0fYNMTipoydFjNqZ7ug-atWmd4q
X-Proofpoint-GUID: r6srh0fYNMTipoydFjNqZ7ug-atWmd4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-05_01,2024-05-17_01

On 2024-05-29 at 00:33:18, Bartosz Golaszewski (brgl@bgdev.pl) wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Implement the power sequencing subsystem allowing devices to share
> complex powering-up and down procedures. It's split into the consumer
> and provider parts but does not implement any new DT bindings so that
> the actual power sequencing is never revealed in the DT representation.
>
> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  MAINTAINERS                       |    8 +
>  drivers/power/Kconfig             |    1 +
>  drivers/power/Makefile            |    1 +
>  drivers/power/sequencing/Kconfig  |   12 +
>  drivers/power/sequencing/Makefile |    4 +
>  drivers/power/sequencing/core.c   | 1105 +++++++++++++++++++++++++++++++++++++
>  include/linux/pwrseq/consumer.h   |   56 ++
>  include/linux/pwrseq/provider.h   |   75 +++
>  8 files changed, 1262 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dbc5d9ec3d20..dd129735e7c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17893,6 +17893,14 @@ F:	include/linux/pm_*
>  F:	include/linux/powercap.h
>  F:	kernel/configs/nopm.config
>
> +POWER SEQUENCING
> +M:	Bartosz Golaszewski <brgl@bgdev.pl>
> +L:	linux-pm@vger.kernel.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> +F:	drivers/power/sequencing/
> +F:	include/linux/pwrseq/
> +
>  POWER STATE COORDINATION INTERFACE (PSCI)
>  M:	Mark Rutland <mark.rutland@arm.com>
>  M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
> diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
> index 696bf77a7042..9a8e44ca9ae4 100644
> --- a/drivers/power/Kconfig
> +++ b/drivers/power/Kconfig
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  source "drivers/power/reset/Kconfig"
> +source "drivers/power/sequencing/Kconfig"
>  source "drivers/power/supply/Kconfig"
> diff --git a/drivers/power/Makefile b/drivers/power/Makefile
> index effbf0377f32..962a2cd30a51 100644
> --- a/drivers/power/Makefile
> +++ b/drivers/power/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_POWER_RESET)	+= reset/
> +obj-$(CONFIG_POWER_SEQUENCING)	+= sequencing/
>  obj-$(CONFIG_POWER_SUPPLY)	+= supply/
> diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
> new file mode 100644
> index 000000000000..ba5732b1dbf8
> --- /dev/null
> +++ b/drivers/power/sequencing/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menuconfig POWER_SEQUENCING
> +	tristate "Power Sequencing support"
> +	help
> +	  Say Y here to enable the Power Sequencing subsystem.
> +
> +	  This subsystem is designed to control power to devices that share
> +	  complex resources and/or require specific power sequences to be run
> +	  during power-up.
> +
> +	  If unsure, say no.
> diff --git a/drivers/power/sequencing/Makefile b/drivers/power/sequencing/Makefile
> new file mode 100644
> index 000000000000..dcdf8c0c159e
> --- /dev/null
> +++ b/drivers/power/sequencing/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_POWER_SEQUENCING)		+= pwrseq-core.o
> +pwrseq-core-y				:= core.o
> diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
> new file mode 100644
> index 000000000000..e07037ea5be0
> --- /dev/null
> +++ b/drivers/power/sequencing/core.c
> @@ -0,0 +1,1105 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Linaro Ltd.
> + */
> +
> +#include <linux/bug.h>
> +#include <linux/cleanup.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/export.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/property.h>
> +#include <linux/pwrseq/consumer.h>
> +#include <linux/pwrseq/provider.h>
> +#include <linux/radix-tree.h>
> +#include <linux/rwsem.h>
> +#include <linux/slab.h>
> +
> +/*
> + * Power-sequencing framework for linux.
> + *
> + * This subsystem allows power sequence providers to register a set of targets
> + * that consumers may request and power-up/down.
> + *
> + * Glossary:
> + *
> + * Unit - a unit is a discreet chunk of a power sequence. For instance one unit
> + * may enable a set of regulators, another may enable a specific GPIO. Units
> + * can define dependencies in the form of other units that must be enabled
> + * before it itself can be.
> + *
> + * Target - a target is a set of units (composed of the "final" unit and its
> + * dependencies) that a consumer selects by its name when requesting a handle
> + * to the power sequencer. Via the dependency system, multiple targets may
> + * share the same parts of a power sequence but ignore parts that are
> + * irrelevant.
> + *
> + * Descriptor - a handle passed by the pwrseq core to every consumer that
> + * serves as the entry point to the provider layer. It ensures coherence
> + * between different users and keeps reference counting consistent.
> + *
> + * Each provider must define a .match() callback whose role is to determine
> + * whether a potential consumer is in fact associated with this sequencer.
> + * This allows creating abstraction layers on top of regular device-tree
> + * resources like regulators, clocks and other nodes connected to the consumer
> + * via phandle.
> + */
> +
> +static DEFINE_IDA(pwrseq_ida);
> +
> +/*
> + * Protects the device list on the pwrseq bus from concurrent modifications
> + * but allows simultaneous read-only access.
> + */
> +static DECLARE_RWSEM(pwrseq_sem);
> +
> +/**
> + * struct pwrseq_unit - Private power-sequence unit data.
> + * @ref: Reference count for this object. When it goes to 0, the object is
> + *       destroyed.
> + * @name: Name of this target.
> + * @list: Link to siblings on the list of all units of a single sequencer.
> + * @deps: List of units on which this unit depends.
> + * @enable: Callback running the part of the power-on sequence provided by
> + *          this unit.
> + * @disable: Callback running the part of the power-off sequence provided
> + *           by this unit.
> + * @enable_count: Current number of users that enabled this unit. May be the
> + *                consumer of the power sequencer or other units that depend
> + *                on this one.
> + */
> +struct pwrseq_unit {
> +	struct kref ref;
> +	const char *name;
> +	struct list_head list;
> +	struct list_head deps;
> +	pwrseq_power_state_func enable;
> +	pwrseq_power_state_func disable;
> +	unsigned int enable_count;
> +};
> +
> +static struct pwrseq_unit *pwrseq_unit_new(const struct pwrseq_unit_data *data)
> +{
> +	struct pwrseq_unit *unit;
> +
> +	unit = kzalloc(sizeof(*unit), GFP_KERNEL);
> +	if (!unit)
> +		return NULL;
> +
> +	unit->name = kstrdup_const(data->name, GFP_KERNEL);
> +	if (!unit->name) {
> +		kfree(unit);
> +		return NULL;
> +	}
> +
> +	kref_init(&unit->ref);
> +	INIT_LIST_HEAD(&unit->deps);
> +	unit->enable = data->enable;
> +	unit->disable = data->disable;
> +
> +	return unit;
> +}
> +
> +static struct pwrseq_unit *pwrseq_unit_incref(struct pwrseq_unit *unit)
> +{
> +	kref_get(&unit->ref);
> +
> +	return unit;
> +}
> +
> +static void pwrseq_unit_release(struct kref *ref);
> +
> +static void pwrseq_unit_decref(struct pwrseq_unit *unit)
> +{
> +	kref_put(&unit->ref, pwrseq_unit_release);
> +}
> +
> +/**
> + * struct pwrseq_unit_dep - Wrapper around a reference to the unit structure
> + *                          allowing to keep it on multiple dependency lists
> + *                          in different units.
> + * @list: Siblings on the list.
> + * @unit: Address of the referenced unit.
> + */
> +struct pwrseq_unit_dep {
> +	struct list_head list;
> +	struct pwrseq_unit *unit;
> +};
> +
> +static struct pwrseq_unit_dep *pwrseq_unit_dep_new(struct pwrseq_unit *unit)
nit. pwrseq_unit_dep_alloc/create rhymes well with pwrseq_unit_dep_free(),
> +{
> +	struct pwrseq_unit_dep *dep;
> +
> +	dep = kzalloc(sizeof(*dep), GFP_KERNEL);
> +	if (!dep)
> +		return NULL;
> +
> +	dep->unit = unit;
> +
> +	return dep;
> +}
> +
> +static void pwrseq_unit_dep_free(struct pwrseq_unit_dep *ref)
> +{
> +	pwrseq_unit_decref(ref->unit);
> +	kfree(ref);
> +}
> +
> +static void pwrseq_unit_free_deps(struct list_head *list)
> +{
> +	struct pwrseq_unit_dep *dep, *next;
> +
> +	list_for_each_entry_safe(dep, next, list, list) {
no need of 'locks' to protect against simutaneous 'add' ?
> +		list_del(&dep->list);
> +		pwrseq_unit_dep_free(dep);
> +	}
> +}
> +
> +static void pwrseq_unit_release(struct kref *ref)
> +{
> +	struct pwrseq_unit *unit = container_of(ref, struct pwrseq_unit, ref);
> +
> +	pwrseq_unit_free_deps(&unit->deps);
> +	list_del(&unit->list);
> +	kfree_const(unit->name);
> +	kfree(unit);
> +}
> +
> +/**
> + * struct pwrseq_target - Private power-sequence target data.
> + * @list: Siblings on the list of all targets exposed by a power sequencer.
> + * @name: Name of the target.
> + * @unit: Final unit for this target.
> + * @post_enable: Callback run after the target unit has been enabled, *after*
> + *               the state lock has been released. It's useful for implementing
> + *               boot-up delays without blocking other users from powering up
> + *               using the same power sequencer.
> + */
> +struct pwrseq_target {
> +	struct list_head list;
> +	const char *name;
> +	struct pwrseq_unit *unit;
> +	pwrseq_power_state_func post_enable;
> +};
> +
> +static struct pwrseq_target *
> +pwrseq_target_new(const struct pwrseq_target_data *data)
> +{
> +	struct pwrseq_target *target;
> +
> +	target = kzalloc(sizeof(*target), GFP_KERNEL);
> +	if (!target)
> +		return NULL;
> +
> +	target->name = kstrdup_const(data->name, GFP_KERNEL);
> +	if (!target->name) {
> +		kfree(target);
> +		return NULL;
> +	}
> +
> +	target->post_enable = data->post_enable;
> +
> +	return target;
> +}
> +
> +static void pwrseq_target_free(struct pwrseq_target *target)
> +{
> +	pwrseq_unit_decref(target->unit);
> +	kfree_const(target->name);
> +	kfree(target);
> +}
> +
> +/**
> + * struct pwrseq_device - Private power sequencing data.
> + * @dev: Device struct associated with this sequencer.
> + * @id: Device ID.
> + * @owner: Prevents removal of active power sequencing providers.
> + * @rw_lock: Protects the device from being unregistered while in use.
> + * @state_lock: Prevents multiple users running the power sequence at the same
> + *              time.
> + * @match: Power sequencer matching callback.
> + * @targets: List of targets exposed by this sequencer.
> + * @units: List of all units supported by this sequencer.
> + */
> +struct pwrseq_device {
> +	struct device dev;
> +	int id;
> +	struct module *owner;
> +	struct rw_semaphore rw_lock;
> +	struct mutex state_lock;
> +	pwrseq_match_func match;
> +	struct list_head targets;
> +	struct list_head units;
> +};
> +
> +static struct pwrseq_device *to_pwrseq_device(struct device *dev)
> +{
> +	return container_of(dev, struct pwrseq_device, dev);
> +}
> +
> +static struct pwrseq_device *pwrseq_device_get(struct pwrseq_device *pwrseq)
> +{
> +	get_device(&pwrseq->dev);
> +
> +	return pwrseq;
> +}
> +
> +static void pwrseq_device_put(struct pwrseq_device *pwrseq)
> +{
> +	put_device(&pwrseq->dev);
> +}
> +
> +/**
> + * struct pwrseq_desc - Wraps access to the pwrseq_device and ensures that one
> + *                      user cannot break the reference counting for others.
> + * @pwrseq: Reference to the power sequencing device.
> + * @target: Reference to the target this descriptor allows to control.
> + * @powered_on: Power state set by the holder of the descriptor (not necessarily
> + * corresponding to the actual power state of the device).
> + */
> +struct pwrseq_desc {
> +	struct pwrseq_device *pwrseq;
> +	struct pwrseq_target *target;
> +	bool powered_on;
> +};
> +
> +static const struct bus_type pwrseq_bus = {
> +	.name = "pwrseq",
> +};
> +
> +static void pwrseq_release(struct device *dev)
> +{
> +	struct pwrseq_device *pwrseq = to_pwrseq_device(dev);
> +	struct pwrseq_target *target, *pos;
> +
> +	list_for_each_entry_safe(target, pos, &pwrseq->targets, list) {
> +		list_del(&target->list);
> +		pwrseq_target_free(target);
> +	}
> +
> +	mutex_destroy(&pwrseq->state_lock);
> +	ida_free(&pwrseq_ida, pwrseq->id);
> +	kfree(pwrseq);
> +}
> +
> +static const struct device_type pwrseq_device_type = {
> +	.name = "power_sequencer",
> +	.release = pwrseq_release,
> +};
> +
> +static int pwrseq_check_unit_deps(const struct pwrseq_unit_data *data,
> +				  struct radix_tree_root *visited_units)
> +{
> +	const struct pwrseq_unit_data *tmp, **cur;
> +	int ret;
> +
> +	ret = radix_tree_insert(visited_units, (unsigned long)data,
> +				(void *)data);
> +	if (ret)
> +		return ret;
> +
> +	for (cur = data->deps; cur && *cur; cur++) {
> +		tmp = radix_tree_lookup(visited_units, (unsigned long)*cur);
> +		if (tmp) {
> +			WARN(1, "Circular dependency in power sequencing flow detected!\n");
> +			return -EINVAL;
> +		}
> +
> +		ret = pwrseq_check_unit_deps(*cur, visited_units);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pwrseq_check_target_deps(const struct pwrseq_target_data *data)
> +{
> +	struct radix_tree_root visited_units;
> +	struct radix_tree_iter iter;
> +	void __rcu **slot;
> +	int ret;
> +
> +	if (!data->unit)
> +		return -EINVAL;
> +
> +	INIT_RADIX_TREE(&visited_units, GFP_KERNEL);
> +	ret = pwrseq_check_unit_deps(data->unit, &visited_units);
> +	radix_tree_for_each_slot(slot, &visited_units, &iter, 0)
> +		radix_tree_delete(&visited_units, iter.index);
> +
> +	return ret;
> +}
> +
> +static int pwrseq_unit_setup_deps(const struct pwrseq_unit_data **data,
> +				  struct list_head *dep_list,
> +				  struct list_head *unit_list,
> +				  struct radix_tree_root *processed_units);
> +
> +static struct pwrseq_unit *
> +pwrseq_unit_setup(const struct pwrseq_unit_data *data,
> +		  struct list_head *unit_list,
> +		  struct radix_tree_root *processed_units)
> +{
> +	struct pwrseq_unit *unit;
> +	int ret;
> +
> +	unit = radix_tree_lookup(processed_units, (unsigned long)data);
> +	if (unit)
> +		return pwrseq_unit_incref(unit);
> +
> +	unit = pwrseq_unit_new(data);
> +	if (!unit)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (data->deps) {
> +		ret = pwrseq_unit_setup_deps(data->deps, &unit->deps,
> +					     unit_list, processed_units);
> +		if (ret) {
> +			pwrseq_unit_decref(unit);
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
> +	ret = radix_tree_insert(processed_units, (unsigned long)data, unit);
> +	if (ret) {
> +		pwrseq_unit_decref(unit);
> +		return ERR_PTR(ret);
> +	}
> +
> +	list_add_tail(&unit->list, unit_list);
> +
> +	return unit;
> +}
> +
> +static int pwrseq_unit_setup_deps(const struct pwrseq_unit_data **data,
> +				  struct list_head *dep_list,
> +				  struct list_head *unit_list,
> +				  struct radix_tree_root *processed_units)
> +{
> +	const struct pwrseq_unit_data *pos;
> +	struct pwrseq_unit_dep *dep;
> +	struct pwrseq_unit *unit;
> +	int i;
> +
> +	for (i = 0; data[i]; i++) {
Can we add range for i ? just depending on data[i] to be zero looks to be risky.

> +		pos = data[i];
> +
> +		unit = pwrseq_unit_setup(pos, unit_list, processed_units);
> +		if (IS_ERR(unit))
> +			return PTR_ERR(unit);
> +
> +		dep = pwrseq_unit_dep_new(unit);
> +		if (!dep) {
> +			pwrseq_unit_decref(unit);
This frees only one 'unit'. is there any chance for multiple 'unit', then better clean
up here ?
> +			return -ENOMEM;
> +		}
> +
> +		list_add_tail(&dep->list, dep_list);
> +	}
> +
> +	return 0;
> +}
> +
> +static int pwrseq_do_setup_targets(const struct pwrseq_target_data **data,
> +				   struct pwrseq_device *pwrseq,
> +				   struct radix_tree_root *processed_units)
> +{
> +	const struct pwrseq_target_data *pos;
> +	struct pwrseq_target *target;
> +	int ret, i;
> +
> +	for (i = 0; data[i]; i++) {
> +		pos = data[i];
> +
> +		ret = pwrseq_check_target_deps(pos);
> +		if (ret)
> +			return ret;
> +
> +		target = pwrseq_target_new(pos);
> +		if (!target)
> +			return -ENOMEM;
> +
> +		target->unit = pwrseq_unit_setup(pos->unit, &pwrseq->units,
> +						 processed_units);
> +		if (IS_ERR(target->unit)) {
> +			ret = PTR_ERR(target->unit);
> +			pwrseq_target_free(target);
> +			return ret;
> +		}
> +
> +		list_add_tail(&target->list, &pwrseq->targets);
> +	}
> +
> +	return 0;
> +}
> +
> +static int pwrseq_setup_targets(const struct pwrseq_target_data **targets,
> +				struct pwrseq_device *pwrseq)
> +{
> +	struct radix_tree_root processed_units;
> +	struct radix_tree_iter iter;
> +	void __rcu **slot;
> +	int ret;
> +
> +	INIT_RADIX_TREE(&processed_units, GFP_KERNEL);
> +	ret = pwrseq_do_setup_targets(targets, pwrseq, &processed_units);
> +	radix_tree_for_each_slot(slot, &processed_units, &iter, 0)
> +		radix_tree_delete(&processed_units, iter.index);
> +
> +	return ret;
> +}
> +
> +/**
> + * pwrseq_device_register() - Register a new power sequencer.
> + * @config: Configuration of the new power sequencing device.
> + *
> + * The config structure is only used during the call and can be freed after
> + * the function returns. The config structure *must* have the parent device
> + * as well as the match() callback and at least one target set.
> + *
> + * Returns:
> + * Returns the address of the new pwrseq device or ERR_PTR() on failure.
> + */
> +struct pwrseq_device *
> +pwrseq_device_register(const struct pwrseq_config *config)
> +{
> +	struct pwrseq_device *pwrseq;
> +	int ret, id;
> +
> +	if (!config->parent || !config->match || !config->targets ||
> +	    !config->targets[0])
> +		return ERR_PTR(-EINVAL);
> +
> +	pwrseq = kzalloc(sizeof(*pwrseq), GFP_KERNEL);
> +	if (!pwrseq)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pwrseq->dev.type = &pwrseq_device_type;
> +	pwrseq->dev.bus = &pwrseq_bus;
> +	pwrseq->dev.parent = config->parent;
> +	device_set_node(&pwrseq->dev, dev_fwnode(config->parent));
> +	dev_set_drvdata(&pwrseq->dev, config->drvdata);
> +
> +	id = ida_alloc(&pwrseq_ida, GFP_KERNEL);
> +	if (id < 0) {
> +		kfree(pwrseq);
> +		return ERR_PTR(id);
> +	}
> +
> +	pwrseq->id = id;
> +
> +	/*
> +	 * From this point onwards the device's release() callback is
> +	 * responsible for freeing resources.
> +	 */
> +	device_initialize(&pwrseq->dev);
> +
> +	ret = dev_set_name(&pwrseq->dev, "pwrseq.%d", pwrseq->id);
> +	if (ret)
> +		goto err_put_pwrseq;
> +
> +	pwrseq->owner = config->owner ?: THIS_MODULE;
> +	pwrseq->match = config->match;
> +
> +	init_rwsem(&pwrseq->rw_lock);
> +	mutex_init(&pwrseq->state_lock);
> +	INIT_LIST_HEAD(&pwrseq->targets);
> +	INIT_LIST_HEAD(&pwrseq->units);
> +
> +	ret = pwrseq_setup_targets(config->targets, pwrseq);
> +	if (ret)
> +		goto err_put_pwrseq;
> +
> +	scoped_guard(rwsem_write, &pwrseq_sem) {
> +		ret = device_add(&pwrseq->dev);
> +		if (ret)
> +			goto err_put_pwrseq;
> +	}
> +
> +	return pwrseq;
> +
> +err_put_pwrseq:
no need to kfree(pwrseq) ?
> +	pwrseq_device_put(pwrseq);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_device_register);
> +
> +/**
> + * pwrseq_device_unregister() - Unregister the power sequencer.
> + * @pwrseq: Power sequencer to unregister.
> + */
> +void pwrseq_device_unregister(struct pwrseq_device *pwrseq)
> +{
> +	struct device *dev = &pwrseq->dev;
> +	struct pwrseq_target *target;
> +
> +	scoped_guard(mutex, &pwrseq->state_lock) {
> +		guard(rwsem_write)(&pwrseq->rw_lock);
> +
> +		list_for_each_entry(target, &pwrseq->targets, list)
> +			WARN_ONCE(target->unit->enable_count,
> +				  "REMOVING POWER SEQUENCER WITH ACTIVE USERS\n");
> +
> +		guard(rwsem_write)(&pwrseq_sem);
> +
> +		device_del(dev);
> +	}
> +
> +	pwrseq_device_put(pwrseq);
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_device_unregister);
> +
> +static void devm_pwrseq_device_unregister(void *data)
> +{
> +	struct pwrseq_device *pwrseq = data;
> +
> +	pwrseq_device_unregister(pwrseq);
> +}
> +
> +/**
> + * devm_pwrseq_device_register() - Managed variant of pwrseq_device_register().
> + * @dev: Managing device.
> + * @config: Configuration of the new power sequencing device.
> + *
> + * Returns:
> + * Returns the address of the new pwrseq device or ERR_PTR() on failure.
> + */
> +struct pwrseq_device *
> +devm_pwrseq_device_register(struct device *dev,
> +			    const struct pwrseq_config *config)
> +{
> +	struct pwrseq_device *pwrseq;
> +	int ret;
> +
> +	pwrseq = pwrseq_device_register(config);
> +	if (IS_ERR(pwrseq))
> +		return pwrseq;
> +
> +	ret = devm_add_action_or_reset(dev, devm_pwrseq_device_unregister,
> +				       pwrseq);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return pwrseq;
> +}
> +EXPORT_SYMBOL_GPL(devm_pwrseq_device_register);
> +
> +/**
> + * pwrseq_device_get_drvdata() - Get the driver private data associated with
> + *                               this sequencer.
> + * @pwrseq: Power sequencer object.
> + *
> + * Returns:
> + * Address of the private driver data.
> + */
> +void *pwrseq_device_get_drvdata(struct pwrseq_device *pwrseq)
> +{
> +	return dev_get_drvdata(&pwrseq->dev);
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_device_get_drvdata);
> +
> +struct pwrseq_match_data {
> +	struct pwrseq_desc *desc;
> +	struct device *dev;
> +	const char *target;
> +};
> +
> +static int pwrseq_match_device(struct device *pwrseq_dev, void *data)
> +{
> +	struct pwrseq_device *pwrseq = to_pwrseq_device(pwrseq_dev);
> +	struct pwrseq_match_data *match_data = data;
> +	struct pwrseq_target *target;
> +	int ret;
> +
> +	lockdep_assert_held_read(&pwrseq_sem);
> +
> +	guard(rwsem_read)(&pwrseq->rw_lock);
> +	if (!device_is_registered(&pwrseq->dev))
> +		return 0;
> +
> +	ret = pwrseq->match(pwrseq, match_data->dev);
> +	if (ret <= 0)
> +		return ret;
> +
> +	/* We got the matching device, let's find the right target. */
> +	list_for_each_entry(target, &pwrseq->targets, list) {
> +		if (strcmp(target->name, match_data->target))
> +			continue;
> +
> +		match_data->desc->target = target;
> +	}
> +
> +	/*
> +	 * This device does not have this target. No point in deferring as it
> +	 * will not get a new target dynamically later.
> +	 */
> +	if (!match_data->desc->target)
> +		return -ENOENT;
> +
> +	if (!try_module_get(pwrseq->owner))
> +		return -EPROBE_DEFER;
> +
> +	match_data->desc->pwrseq = pwrseq_device_get(pwrseq);
> +
> +	return 1;
> +}
> +
> +/**
> + * pwrseq_get() - Get the power sequencer associated with this device.
> + * @dev: Device for which to get the sequencer.
> + * @target: Name of the target exposed by the sequencer this device wants to
> + *          reach.
> + *
> + * Returns:
> + * New power sequencer descriptor for use by the consumer driver or ERR_PTR()
> + * on failure.
> + */
> +struct pwrseq_desc *pwrseq_get(struct device *dev, const char *target)
> +{
> +	struct pwrseq_match_data match_data;
> +	int ret;
> +
> +	struct pwrseq_desc *desc __free(kfree) = kzalloc(sizeof(*desc),
> +							 GFP_KERNEL);
> +	if (!desc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	match_data.desc = desc;
> +	match_data.dev = dev;
> +	match_data.target = target;
> +
> +	guard(rwsem_read)(&pwrseq_sem);
> +
> +	ret = bus_for_each_dev(&pwrseq_bus, NULL, &match_data,
> +			       pwrseq_match_device);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +	if (ret == 0)
> +		/* No device matched. */
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	return no_free_ptr(desc);
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_get);
> +
> +/**
> + * pwrseq_put() - Release the power sequencer descriptor.
> + * @desc: Descriptor to release.
> + */
> +void pwrseq_put(struct pwrseq_desc *desc)
> +{
> +	struct pwrseq_device *pwrseq;
> +
> +	if (!desc)
> +		return;
> +
> +	pwrseq = desc->pwrseq;
> +
> +	if (desc->powered_on)
> +		pwrseq_power_off(desc);
> +
> +	kfree(desc);
> +	module_put(pwrseq->owner);
> +	pwrseq_device_put(pwrseq);
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_put);
> +
> +static void devm_pwrseq_put(void *data)
> +{
> +	struct pwrseq_desc *desc = data;
> +
> +	pwrseq_put(desc);
> +}
> +
> +/**
> + * devm_pwrseq_get() - Managed variant of pwrseq_get().
> + * @dev: Device for which to get the sequencer and which also manages its
> + *       lifetime.
> + * @target: Name of the target exposed by the sequencer this device wants to
> + *          reach.
> + *
> + * Returns:
> + * New power sequencer descriptor for use by the consumer driver or ERR_PTR()
> + * on failure.
> + */
> +struct pwrseq_desc *devm_pwrseq_get(struct device *dev, const char *target)
> +{
> +	struct pwrseq_desc *desc;
> +	int ret;
> +
> +	desc = pwrseq_get(dev, target);
> +	if (IS_ERR(desc))
> +		return desc;
> +
> +	ret = devm_add_action_or_reset(dev, devm_pwrseq_put, desc);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return desc;
> +}
> +EXPORT_SYMBOL_GPL(devm_pwrseq_get);
> +
> +static int pwrseq_unit_enable(struct pwrseq_device *pwrseq,
> +			      struct pwrseq_unit *target);
> +static int pwrseq_unit_disable(struct pwrseq_device *pwrseq,
> +			       struct pwrseq_unit *target);
> +
> +static int pwrseq_unit_enable_deps(struct pwrseq_device *pwrseq,
> +				   struct list_head *list)
> +{
> +	struct pwrseq_unit_dep *pos;
> +	int ret = 0;
> +
> +	list_for_each_entry(pos, list, list) {
> +		ret = pwrseq_unit_enable(pwrseq, pos->unit);
> +		if (ret) {
> +			list_for_each_entry_continue_reverse(pos, list, list)
> +				pwrseq_unit_disable(pwrseq, pos->unit);
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int pwrseq_unit_disable_deps(struct pwrseq_device *pwrseq,
> +				    struct list_head *list)
> +{
> +	struct pwrseq_unit_dep *pos;
> +	int ret = 0;
> +
> +	list_for_each_entry_reverse(pos, list, list) {
> +		ret = pwrseq_unit_disable(pwrseq, pos->unit);
> +		if (ret) {
> +			list_for_each_entry_continue(pos, list, list)
> +				pwrseq_unit_enable(pwrseq, pos->unit);
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int pwrseq_unit_enable(struct pwrseq_device *pwrseq,
> +			      struct pwrseq_unit *unit)
> +{
> +	int ret;
> +
> +	lockdep_assert_held_read(&pwrseq->rw_lock);
> +	lockdep_assert_held(&pwrseq->state_lock);
> +
> +	if (unit->enable_count != 0) {
> +		unit->enable_count++;
> +		return 0;
> +	}
> +
> +	ret = pwrseq_unit_enable_deps(pwrseq, &unit->deps);
> +	if (ret) {
> +		dev_err(&pwrseq->dev,
> +			"Failed to enable dependencies before power-on for target '%s': %d\n",
> +			unit->name, ret);
> +		return ret;
> +	}
> +
> +	if (unit->enable) {
> +		ret = unit->enable(pwrseq);
> +		if (ret) {
> +			dev_err(&pwrseq->dev,
> +				"Failed to enable target '%s': %d\n",
> +				unit->name, ret);
> +			pwrseq_unit_disable_deps(pwrseq, &unit->deps);
> +			return ret;
> +		}
> +	}
> +
> +	unit->enable_count++;
> +
> +	return 0;
> +}
> +
> +static int pwrseq_unit_disable(struct pwrseq_device *pwrseq,
> +			       struct pwrseq_unit *unit)
> +{
> +	int ret;
> +
> +	lockdep_assert_held_read(&pwrseq->rw_lock);
> +	lockdep_assert_held(&pwrseq->state_lock);
> +
> +	if (unit->enable_count == 0) {
> +		WARN_ONCE(1, "Unmatched power-off for target '%s'\n",
> +			  unit->name);
> +		return -EBUSY;
> +	}
> +
> +	if (unit->enable_count != 1) {
> +		unit->enable_count--;
> +		return 0;
> +	}
> +
> +	if (unit->disable) {
> +		ret = unit->disable(pwrseq);
> +		if (ret) {
> +			dev_err(&pwrseq->dev,
> +				"Failed to disable target '%s': %d\n",
> +				unit->name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = pwrseq_unit_disable_deps(pwrseq, &unit->deps);
> +	if (ret) {
> +		dev_err(&pwrseq->dev,
> +			"Failed to disable dependencies after power-off for target '%s': %d\n",
> +			unit->name, ret);
> +		if (unit->enable)
> +			unit->enable(pwrseq);
> +		return ret;
> +	}
> +
> +	unit->enable_count--;
> +
> +	return 0;
> +}
> +
> +/**
> + * pwrseq_power_on() - Issue a power-on request on behalf of the consumer
> + *                     device.
> + * @desc: Descriptor referencing the power sequencer.
> + *
> + * This function tells the power sequencer that the consumer wants to be
> + * powered-up. The sequencer may already have powered-up the device in which
> + * case the function returns 0. If the power-up sequence is already in
> + * progress, the function will block until it's done and return 0. If this is
> + * the first request, the device will be powered up.
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int pwrseq_power_on(struct pwrseq_desc *desc)
> +{
> +	struct pwrseq_device *pwrseq;
> +	struct pwrseq_target *target;
> +	struct pwrseq_unit *unit;
> +	int ret;
> +
> +	might_sleep();
> +
> +	if (!desc || desc->powered_on)
> +		return 0;
> +
> +	pwrseq = desc->pwrseq;
> +	target = desc->target;
> +	unit = target->unit;
> +
> +	guard(rwsem_read)(&pwrseq->rw_lock);
> +	if (!device_is_registered(&pwrseq->dev))
> +		return -ENODEV;
> +
> +	scoped_guard(mutex, &pwrseq->state_lock) {
> +		ret = pwrseq_unit_enable(pwrseq, unit);
> +		if (!ret)
> +			desc->powered_on = true;
> +	}
> +
> +	if (target->post_enable) {
> +		ret = target->post_enable(pwrseq);
> +		if (ret) {
> +			pwrseq_unit_disable(pwrseq, unit);
> +			desc->powered_on = false;
> +		}
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_power_on);
> +
> +/**
> + * pwrseq_power_off() - Issue a power-off request on behalf of the consumer
> + *                      device.
> + * @desc: Descriptor referencing the power sequencer.
> + *
> + * This undoes the effects of pwrseq_power_on(). It issues a power-off request
> + * on behalf of the consumer and when the last remaining user does so, the
> + * power-down sequence will be started. If one is in progress, the function
> + * will block until it's complete and then return.
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int pwrseq_power_off(struct pwrseq_desc *desc)
> +{
> +	struct pwrseq_device *pwrseq;
> +	struct pwrseq_unit *unit;
> +	int ret;
> +
> +	might_sleep();
> +
> +	if (!desc || !desc->powered_on)
> +		return 0;
> +
> +	pwrseq = desc->pwrseq;
> +	unit = desc->target->unit;
> +
> +	guard(rwsem_read)(&pwrseq->rw_lock);
> +	if (!device_is_registered(&pwrseq->dev))
> +		return -ENODEV;
> +
> +	guard(mutex)(&pwrseq->state_lock);
> +
> +	ret = pwrseq_unit_disable(pwrseq, unit);
> +	if (!ret)
> +		desc->powered_on = false;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_power_off);
> +
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +
> +struct pwrseq_debugfs_count_ctx {
> +	struct device *dev;
> +	loff_t index;
> +};
> +
> +static int pwrseq_debugfs_seq_count(struct device *dev, void *data)
> +{
> +	struct pwrseq_debugfs_count_ctx *ctx = data;
> +
> +	ctx->dev = dev;
> +
> +	return ctx->index-- ? 0 : 1;
> +}
> +
> +static void *pwrseq_debugfs_seq_start(struct seq_file *seq, loff_t *pos)
> +{
> +	struct pwrseq_debugfs_count_ctx ctx;
> +
> +	ctx.dev = NULL;
> +	ctx.index = *pos;
> +
> +	/*
> +	 * We're holding the lock for the entire printout so no need to fiddle
> +	 * with device reference count.
> +	 */
> +	down_read(&pwrseq_sem);
> +
> +	bus_for_each_dev(&pwrseq_bus, NULL, &ctx, pwrseq_debugfs_seq_count);
> +	if (!ctx.index)
> +		return NULL;
> +
> +	return ctx.dev;
> +}
> +
> +static void *pwrseq_debugfs_seq_next(struct seq_file *seq, void *data,
> +				     loff_t *pos)
> +{
> +	struct device *curr = data;
> +
> +	++*pos;
> +
> +	struct device *next __free(put_device) =
> +			bus_find_next_device(&pwrseq_bus, curr);
> +	return next;
> +}
> +
> +static void pwrseq_debugfs_seq_show_target(struct seq_file *seq,
> +					   struct pwrseq_target *target)
> +{
> +	seq_printf(seq, "    target: [%s] (target unit: [%s])\n",
> +		   target->name, target->unit->name);
> +}
> +
> +static void pwrseq_debugfs_seq_show_unit(struct seq_file *seq,
> +					 struct pwrseq_unit *unit)
> +{
> +	struct pwrseq_unit_dep *ref;
> +
> +	seq_printf(seq, "    unit: [%s] - enable count: %u\n",
> +		   unit->name, unit->enable_count);
> +
> +	if (list_empty(&unit->deps))
> +		return;
> +
> +	seq_puts(seq, "      dependencies:\n");
> +	list_for_each_entry(ref, &unit->deps, list)
> +		seq_printf(seq, "        [%s]\n", ref->unit->name);
> +}
> +
> +static int pwrseq_debugfs_seq_show(struct seq_file *seq, void *data)
> +{
> +	struct device *dev = data;
> +	struct pwrseq_device *pwrseq = to_pwrseq_device(dev);
> +	struct pwrseq_target *target;
> +	struct pwrseq_unit *unit;
> +
> +	seq_printf(seq, "%s:\n", dev_name(dev));
> +
> +	seq_puts(seq, "  targets:\n");
> +	list_for_each_entry(target, &pwrseq->targets, list)
> +		pwrseq_debugfs_seq_show_target(seq, target);
> +
> +	seq_puts(seq, "  units:\n");
> +	list_for_each_entry(unit, &pwrseq->units, list)
> +		pwrseq_debugfs_seq_show_unit(seq, unit);
> +
> +	return 0;
> +}
> +
> +static void pwrseq_debugfs_seq_stop(struct seq_file *seq, void *data)
> +{
> +	up_read(&pwrseq_sem);
> +}
> +
> +static const struct seq_operations pwrseq_debugfs_sops = {
> +	.start = pwrseq_debugfs_seq_start,
> +	.next = pwrseq_debugfs_seq_next,
> +	.show = pwrseq_debugfs_seq_show,
> +	.stop = pwrseq_debugfs_seq_stop,
> +};
> +DEFINE_SEQ_ATTRIBUTE(pwrseq_debugfs);
> +
> +static struct dentry *pwrseq_debugfs_dentry;
> +
> +#endif /* CONFIG_DEBUG_FS */
> +
> +static int __init pwrseq_init(void)
> +{
> +	int ret;
> +
> +	ret = bus_register(&pwrseq_bus);
> +	if (ret) {
> +		pr_err("Failed to register the power sequencer bus\n");
> +		return ret;
> +	}
> +
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	pwrseq_debugfs_dentry = debugfs_create_file("pwrseq", 0444, NULL, NULL,
> +						    &pwrseq_debugfs_fops);
> +#endif  /* CONFIG_DEBUG_FS */
> +
> +	return 0;
> +}
> +subsys_initcall(pwrseq_init);
> +
> +static void __exit pwrseq_exit(void)
> +{
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	debugfs_remove_recursive(pwrseq_debugfs_dentry);
> +#endif  /* CONFIG_DEBUG_FS */
> +
> +	bus_unregister(&pwrseq_bus);
> +}
> +module_exit(pwrseq_exit);
> +
> +MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
> +MODULE_DESCRIPTION("Power Sequencing subsystem core");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
> new file mode 100644
> index 000000000000..7d583b4f266e
> --- /dev/null
> +++ b/include/linux/pwrseq/consumer.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Linaro Ltd.
> + */
> +
> +#ifndef __POWER_SEQUENCING_CONSUMER_H__
> +#define __POWER_SEQUENCING_CONSUMER_H__
> +
> +#include <linux/err.h>
> +
> +struct device;
> +struct pwrseq_desc;
> +
> +#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
> +
> +struct pwrseq_desc * __must_check
> +pwrseq_get(struct device *dev, const char *target);
> +void pwrseq_put(struct pwrseq_desc *desc);
> +
> +struct pwrseq_desc * __must_check
> +devm_pwrseq_get(struct device *dev, const char *target);
> +
> +int pwrseq_power_on(struct pwrseq_desc *desc);
> +int pwrseq_power_off(struct pwrseq_desc *desc);
> +
> +#else /* CONFIG_POWER_SEQUENCING */
> +
> +static inline struct pwrseq_desc * __must_check
> +pwrseq_get(struct device *dev, const char *target)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +
> +static inline void pwrseq_put(struct pwrseq_desc *desc)
> +{
> +}
> +
> +static inline struct pwrseq_desc * __must_check
> +devm_pwrseq_get(struct device *dev, const char *target)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +
> +static inline int pwrseq_power_on(struct pwrseq_desc *desc)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int pwrseq_power_off(struct pwrseq_desc *desc)
> +{
> +	return -ENOSYS;
> +}
> +
> +#endif /* CONFIG_POWER_SEQUENCING */
> +
> +#endif /* __POWER_SEQUENCING_CONSUMER_H__ */
> diff --git a/include/linux/pwrseq/provider.h b/include/linux/pwrseq/provider.h
> new file mode 100644
> index 000000000000..e627ed2f4d91
> --- /dev/null
> +++ b/include/linux/pwrseq/provider.h
> @@ -0,0 +1,75 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Linaro Ltd.
> + */
> +
> +#ifndef __POWER_SEQUENCING_PROVIDER_H__
> +#define __POWER_SEQUENCING_PROVIDER_H__
> +
> +struct device;
> +struct module;
> +struct pwrseq_device;
> +
> +typedef int (*pwrseq_power_state_func)(struct pwrseq_device *);
> +typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *);
> +
> +/**
> + * struct pwrseq_unit_data - Configuration of a single power sequencing
> + *                           unit.
> + * @name: Name of the unit.
> + * @deps: Units that must be enabled before this one and disabled after it
> + *        in the order they come in this array.
> + * @enable: Callback running the part of the power-on sequence provided by
> + *          this unit.
> + * @disable: Callback running the part of the power-off sequence provided
> + *           by this unit.
> + */
> +struct pwrseq_unit_data {
> +	const char *name;
> +	const struct pwrseq_unit_data **deps;
> +	pwrseq_power_state_func enable;
> +	pwrseq_power_state_func disable;
> +};
> +
> +/**
> + * struct pwrseq_target_data - Configuration of a power sequencing target.
> + * @name: Name of the target.
> + * @unit: Final unit that this target must reach in order to be considered
> + *        enabled.
> + * @post_enable: Callback run after the target unit has been enabled, *after*
> + *               the state lock has been released. It's useful for implementing
> + *               boot-up delays without blocking other users from powering up
> + *               using the same power sequencer.
> + */
> +struct pwrseq_target_data {
> +	const char *name;
> +	const struct pwrseq_unit_data *unit;
> +	pwrseq_power_state_func post_enable;
> +};
> +
> +/**
> + * struct pwrseq_config - Configuration used for registering a new provider.
> + * @parent: Parent device for the sequencer. Must be set.
> + * @owner: Module providing this device.
> + * @drvdata: Private driver data.
> + * @match: Provider callback used to match the consumer device to the sequencer.
> + * @targets: Array of targets for this power sequencer. Must be NULL-terminated.
> + */
> +struct pwrseq_config {
> +	struct device *parent;
> +	struct module *owner;
> +	void *drvdata;
> +	pwrseq_match_func match;
> +	const struct pwrseq_target_data **targets;
> +};
> +
> +struct pwrseq_device *
> +pwrseq_device_register(const struct pwrseq_config *config);
> +void pwrseq_device_unregister(struct pwrseq_device *pwrseq);
> +struct pwrseq_device *
> +devm_pwrseq_device_register(struct device *dev,
> +			    const struct pwrseq_config *config);
> +
> +void *pwrseq_device_get_drvdata(struct pwrseq_device *pwrseq);
> +
> +#endif /* __POWER_SEQUENCING_PROVIDER_H__ */
>
> --
> 2.43.0
>

