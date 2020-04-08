Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBA7D1A2BFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 00:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgDHWn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 18:43:57 -0400
Received: from foss.arm.com ([217.140.110.172]:43850 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbgDHWn5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 18:43:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59CFA30E;
        Wed,  8 Apr 2020 15:43:56 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0878B3F52E;
        Wed,  8 Apr 2020 15:43:54 -0700 (PDT)
Date:   Wed, 8 Apr 2020 23:43:47 +0100
From:   Suzuki K Poulose <Suzuki.Poulose@arm.com>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        swboyd@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        suzuki.poulose@arm.com
Subject: Re: [RFC PATCH] coresight: dynamic-replicator: Fix handling of
 multiple connections
Message-ID: <20200408224347.GA388414@ewhatever.cambridge.arm.com>
References: <20200405102819.28460-1-saiprakash.ranjan@codeaurora.org>
 <CAJ9a7VgQzK1XSCvLwuqODwkWfvo=6Wwps7Db+pL5xYDeCuktrg@mail.gmail.com>
 <6c0f45488f8a44bf860759e00fcabd09@codeaurora.org>
 <906d374d-a4d6-f2f2-6845-88b97a5ff7d9@arm.com>
 <39a2b3fff165a108fa59d72b630b5f14@codeaurora.org>
 <bb209f80-ac02-6321-dac4-ebf9ee6fa9a0@arm.com>
 <bd05b31c2391edfff5044f22f2f83edf@codeaurora.org>
 <e9c299c4-caeb-9eb8-f019-b311bfce756a@arm.com>
 <a7074f44ebbde720b5e0189801eab7c9@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7074f44ebbde720b5e0189801eab7c9@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 07, 2020 at 08:48:54PM +0530, Sai Prakash Ranjan wrote:
> Hi Suzuki,
> 
> On 2020-04-07 20:23, Suzuki K Poulose wrote:
> > On 04/07/2020 02:56 PM, Sai Prakash Ranjan wrote:
> > > Hi Suzuki,
> > > 
> > > On 2020-04-07 18:38, Suzuki K Poulose wrote:
> > > > On 04/07/2020 12:29 PM, Sai Prakash Ranjan wrote:
> > > > > Hi Suzuki,
> > > > > 
> > > > > Thanks for looking into this issue.
> > > > > 
> > > > > On 2020-04-07 15:54, Suzuki K Poulose wrote:
> > > > > > On 04/07/2020 10:46 AM, Sai Prakash Ranjan wrote:
> > > > > > 
> > > > > > There seems to be two replicators back to back here.
> > > > > > What is connected
> > > > > > to the other output of both of them ? Are there any
> > > > > > TPIUs ? What happens
> > > > > > if you choose a sink on the other end of "swao_replicator" (ETB ?)
> > > > > > 
> > > > > 
> > > > > The other outport of swao replicator is connected to EUD which is a
> > > > > QCOM specific HW which can be used as a sink like USB.
> > > > > And the other outport of other replicator(replicator_out) is
> > > > > connected to
> > > > > TPIU.
> > > > > 
> > > > > > After boot, what do the idfilter registers read for both
> > > > > > the replicators ?
> > > > > > 
> > > > > 
> > > > > Added some prints in replicator_probe.
> > > > > 
> > > > >   replicator probe ret=-517 devname=6046000.replicator
> > > > > idfilter0=0x0 idfilter1=0x0
> > > > >   replicator probe ret=0 devname=6b06000.replicator
> > > > > idfilter0=0xff idfilter1=0xff
> > > > >   replicator probe ret=0 devname=6046000.replicator
> > > > > idfilter0=0xff idfilter1=0xff
> > > > 
> > > > Curious to see how the idfilterX is set to 0:
> > > >      if that is never used.
> > > >         Or
> > > >      if the user doesn't reset it back to 0xff.
> > > > 
> > > 
> > > For both replicators, the default value seems to be 0x0.
> > > 
> > >   replicator probe in res ret=0 devname=6046000.replicator
> > > idfilter0=0x0 idfilter1=0x0
> > >   replicator probe ret=-517 devname=6046000.replicator idfilter0=0x0
> > > idfilter1=0x0
> > >   replicator probe in res ret=0 devname=6b06000.replicator
> > > idfilter0=0x0 idfilter1=0x0
> > >   replicator probe ret=0 devname=6b06000.replicator idfilter0=0xff
> > > idfilter1=0xff
> > >   replicator probe in res ret=0 devname=6046000.replicator
> > > idfilter0=0x0 idfilter1=0x0
> > >   replicator probe ret=0 devname=6046000.replicator idfilter0=0xff
> > > idfilter1=0xff
> > 
> > I am not sure how you have added the debugs, but it looks like the
> > drivers set 0xff for both the port filters on a successful probe.
> > 
> 
> Yes, thats done by replicator_reset in probe right? Below is the diff:
> 
> @@ -242,6 +244,9 @@ static int replicator_probe(struct device *dev, struct
> resource *res)
>                 }
>                 drvdata->base = base;
>                 desc.groups = replicator_groups;
> +               pr_info("replicator probe in res ret=%d devname=%s
> idfilter0=%#lx idfilter1=%#lx\n",
> +                       ret, dev_name(dev), (readl_relaxed(base +
> REPLICATOR_IDFILTER0)),
> +                       (readl_relaxed(base + REPLICATOR_IDFILTER1)));
>         }
> 
>         dev_set_drvdata(dev, drvdata);
> @@ -272,6 +277,12 @@ static int replicator_probe(struct device *dev, struct
> resource *res)
>  out_disable_clk:
>         if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
>                 clk_disable_unprepare(drvdata->atclk);
> +
> +       if (res)
> +               pr_info("replicator probe ret=%d devname=%s idfilter0=%#lx
> idfilter1=%#lx\n",
> +                       ret, dev_name(dev), (readl_relaxed(base +
> REPLICATOR_IDFILTER0)),
> +                       (readl_relaxed(base + REPLICATOR_IDFILTER1)));
> +
>         return ret;
>  }
> 
> > > 
> > > > Does your test ever touch EUD (enable the port for EUD at
> > > > swao-replicator) ? What are the values before you run your test ?
> > > > 
> > > > 
> > > 
> > > No, we do not use EUD, downstream it is used as dummy sink.
> > > And I just try to select the ETR as the sink and enable ETM0 as the
> > > trace source.
> > > 
> > > echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> > > echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> > > 
> > > Also I see the KASAN warning but that seems like some other issue.
> > > 
> > 
> > Does your funnel have sparse input described ? I think we have an
> > issue with the "refcnt" tracking for funnels (especially). When we
> > have a sparse input ports described (ie. if only input ports 0, 3,
> > 5 are described to protect the secure side connections), we could
> > end up accessing beyond the memory allocated for csdev->refcnts.
> > i.e, csdev->pdata->nr_inport = 3, and we could access csdev->refcnts[5],
> > while sizeof(csdev->refcnts) = sizeof(atomic_t) * 3.
> > 
> > I will send a patch.
> > 
> 
> Thanks, I can test it out.

Please find the untested patch below.

---8>---

[untested] coresight: Fix support for sparse port numbers

On some systems the firmware may not describe all the ports
connected to a component (e.g, for security reasons). This
could be especially problematic for "funnels" where we could
end up in modifying memory beyond the allocated space for
refcounts.

e.g, for a funnel with input ports listed 0, 3, 5, nr_inport = 3.
However the we could access refcnts[5] while checking for
references.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 .../hwtracing/coresight/coresight-platform.c  | 74 ++++++++++++-------
 drivers/hwtracing/coresight/coresight.c       |  8 +-
 2 files changed, 56 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 3c5bee429105..1c610d6e944b 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -67,6 +67,7 @@ static void of_coresight_get_ports_legacy(const struct device_node *node,
 					  int *nr_inport, int *nr_outport)
 {
 	struct device_node *ep = NULL;
+	struct of_endpoint endpoint;
 	int in = 0, out = 0;
 
 	do {
@@ -74,10 +75,16 @@ static void of_coresight_get_ports_legacy(const struct device_node *node,
 		if (!ep)
 			break;
 
-		if (of_coresight_legacy_ep_is_input(ep))
-			in++;
-		else
-			out++;
+		if (of_graph_parse_endpoint(ep, &endpoint))
+			continue;
+
+		if (of_coresight_legacy_ep_is_input(ep)) {
+			in = (endpoint.port + 1 > in) ?
+				endpoint.port + 1 : in;
+		} else {
+			out = (endpoint.port + 1) > out ?
+				endpoint.port + 1 : out;
+		}
 
 	} while (ep);
 
@@ -117,9 +124,16 @@ of_coresight_count_ports(struct device_node *port_parent)
 {
 	int i = 0;
 	struct device_node *ep = NULL;
+	struct of_endpoint endpoint;
+
+	while ((ep = of_graph_get_next_endpoint(port_parent, ep))) {
+		/* Defer error handling to parsing */
+		if (of_graph_parse_endpoint(ep, &endpoint))
+			continue;
+		if (endpoint.port + 1 > i)
+			i = endpoint.port + 1;
+	}
 
-	while ((ep = of_graph_get_next_endpoint(port_parent, ep)))
-		i++;
 	return i;
 }
 
@@ -171,14 +185,12 @@ static int of_coresight_get_cpu(struct device *dev)
  * Parses the local port, remote device name and the remote port.
  *
  * Returns :
- *	 1	- If the parsing is successful and a connection record
- *		  was created for an output connection.
  *	 0	- If the parsing completed without any fatal errors.
  *	-Errno	- Fatal error, abort the scanning.
  */
 static int of_coresight_parse_endpoint(struct device *dev,
 				       struct device_node *ep,
-				       struct coresight_connection *conn)
+				       struct coresight_platform_data *pdata)
 {
 	int ret = 0;
 	struct of_endpoint endpoint, rendpoint;
@@ -186,6 +198,7 @@ static int of_coresight_parse_endpoint(struct device *dev,
 	struct device_node *rep = NULL;
 	struct device *rdev = NULL;
 	struct fwnode_handle *rdev_fwnode;
+	struct coresight_connection *conn;
 
 	do {
 		/* Parse the local port details */
@@ -212,6 +225,12 @@ static int of_coresight_parse_endpoint(struct device *dev,
 			break;
 		}
 
+		conn = &pdata->conns[endpoint.port];
+		if (conn->child_fwnode) {
+			dev_warn(dev, "Duplicate output port %d\n", endpoint.port);
+			ret = -EINVAL;
+			break;
+		}
 		conn->outport = endpoint.port;
 		/*
 		 * Hold the refcount to the target device. This could be
@@ -224,7 +243,6 @@ static int of_coresight_parse_endpoint(struct device *dev,
 		conn->child_fwnode = fwnode_handle_get(rdev_fwnode);
 		conn->child_port = rendpoint.port;
 		/* Connection record updated */
-		ret = 1;
 	} while (0);
 
 	of_node_put(rparent);
@@ -238,7 +256,6 @@ static int of_get_coresight_platform_data(struct device *dev,
 					  struct coresight_platform_data *pdata)
 {
 	int ret = 0;
-	struct coresight_connection *conn;
 	struct device_node *ep = NULL;
 	const struct device_node *parent = NULL;
 	bool legacy_binding = false;
@@ -267,8 +284,6 @@ static int of_get_coresight_platform_data(struct device *dev,
 		dev_warn_once(dev, "Uses obsolete Coresight DT bindings\n");
 	}
 
-	conn = pdata->conns;
-
 	/* Iterate through each output port to discover topology */
 	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
 		/*
@@ -280,15 +295,9 @@ static int of_get_coresight_platform_data(struct device *dev,
 		if (legacy_binding && of_coresight_legacy_ep_is_input(ep))
 			continue;
 
-		ret = of_coresight_parse_endpoint(dev, ep, conn);
-		switch (ret) {
-		case 1:
-			conn++;		/* Fall through */
-		case 0:
-			break;
-		default:
+		ret = of_coresight_parse_endpoint(dev, ep, pdata);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -627,6 +636,11 @@ static int acpi_coresight_parse_link(struct acpi_device *adev,
 		 *    coresight_remove_match().
 		 */
 		conn->child_fwnode = fwnode_handle_get(&r_adev->fwnode);
+	} else if (dir == ACPI_CORESIGHT_LINK_SLAVE) {
+		conn->child_port = fields[0].integer.value;
+	} else {
+		/* Invalid direction */
+		return -EINVAL;
 	}
 
 	return dir;
@@ -672,10 +686,14 @@ static int acpi_coresight_parse_graph(struct acpi_device *adev,
 			return dir;
 
 		if (dir == ACPI_CORESIGHT_LINK_MASTER) {
-			pdata->nr_outport++;
+			if (ptr->outport > pdata->nr_outport)
+				pdata->nr_outport = ptr->outport;
 			ptr++;
 		} else {
-			pdata->nr_inport++;
+			WARN_ON(pdata->nr_inport == ptr->child_port);
+			/* Do not move the ptr for input connections */
+			if (ptr->child_port > pdata->nr_inport)
+				pdata->nr_inport = ptr->child_port;
 		}
 	}
 
@@ -684,8 +702,13 @@ static int acpi_coresight_parse_graph(struct acpi_device *adev,
 		return rc;
 
 	/* Copy the connection information to the final location */
-	for (i = 0; i < pdata->nr_outport; i++)
-		pdata->conns[i] = conns[i];
+	for (i = 0; conns + i < ptr; i++) {
+		int port = conns[i].outport;
+
+		/* Duplicate output port */
+		WARN_ON(pdata->conns[port].child_fwnode);
+		pdata->conns[port] = conns[i];
+	}
 
 	devm_kfree(&adev->dev, conns);
 	return 0;
@@ -787,6 +810,7 @@ coresight_get_platform_data(struct device *dev)
 		goto error;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	pdata->nr_outport = pdata->nr_inport = -1;
 	if (!pdata) {
 		ret = -ENOMEM;
 		goto error;
diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
index ef20f74c85fa..f07bc0a7ab88 100644
--- a/drivers/hwtracing/coresight/coresight.c
+++ b/drivers/hwtracing/coresight/coresight.c
@@ -990,6 +990,9 @@ static int coresight_orphan_match(struct device *dev, void *data)
 	for (i = 0; i < i_csdev->pdata->nr_outport; i++) {
 		conn = &i_csdev->pdata->conns[i];
 
+		/* Skip the port if FW doesn't describe it */
+		if (!conn->child_fwnode)
+			continue;
 		/* We have found at least one orphan connection */
 		if (conn->child_dev == NULL) {
 			/* Does it match this newly added device? */
@@ -1029,6 +1032,9 @@ static void coresight_fixup_device_conns(struct coresight_device *csdev)
 		struct coresight_connection *conn = &csdev->pdata->conns[i];
 		struct device *dev = NULL;
 
+		if (!conn->child_fwnode)
+			continue;
+
 		dev = bus_find_device_by_fwnode(&coresight_bustype, conn->child_fwnode);
 		if (dev) {
 			conn->child_dev = to_coresight_device(dev);
@@ -1061,7 +1067,7 @@ static int coresight_remove_match(struct device *dev, void *data)
 	for (i = 0; i < iterator->pdata->nr_outport; i++) {
 		conn = &iterator->pdata->conns[i];
 
-		if (conn->child_dev == NULL)
+		if (conn->child_dev == NULL || conn->child_fwnode == NULL)
 			continue;
 
 		if (csdev->dev.fwnode == conn->child_fwnode) {
-- 
2.24.1



