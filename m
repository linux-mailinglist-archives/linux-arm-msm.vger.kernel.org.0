Return-Path: <linux-arm-msm+bounces-110300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KByRKtWoGWodyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:55:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0825860408C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4097300D14A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5AC3E2AD6;
	Fri, 29 May 2026 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pQa9iw4w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDA63E9F7D;
	Fri, 29 May 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065661; cv=none; b=tPdkNLK9FFqqYdSP5cs7pYP8M71k4s7AHFaoYikiBOguLD1/sykXSMNZ+RJzQQDmb2oiodRNWVbgOKqBSTfokrp934AbNi9k+skxC2eoFeHB/sSkYFC8prOddzQ8w24FTtIjYJO//zCxuJQOZwGlvFnbpZ+SYhdgZWj20RWl2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065661; c=relaxed/simple;
	bh=SaSJnQrDHy26ahs5WkmoCdUA8qqhur7vMZILhcqQpYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTcPzvqeHzU/m4E1bYnk+TzlwebKhWhuxZ6oQ7Hwn0Uc2Dzmgs0NZd98I7FFlG1vHOogv9WvEYGeVH17fSV9f1PdGGFckHcdOWLrZXwvFUmplrj30qNnpJR3k+Abv492c3Cx6+C4NJzy+P29VyTLW3xEWtyj90lvMda4DTuO4WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pQa9iw4w; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 878451FC7;
	Fri, 29 May 2026 07:40:53 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 247A23F905;
	Fri, 29 May 2026 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780065658; bh=SaSJnQrDHy26ahs5WkmoCdUA8qqhur7vMZILhcqQpYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pQa9iw4we79cyPR7M1QBB5Qcr4ZgyPHdo+IWFUSsUwjFVyyXCW91NcFUool1WTWcz
	 E/25jC3m2pzJT2w2YxJ6QNBMws7LXlLLxZaqorWv4ySL14w8EEXnPd9vJ8Yvflv5pa
	 w7RRBLC/d4Yl7Xv8gm3nkhxhmLNwVkGxti1UyG34=
Date: Fri, 29 May 2026 15:40:55 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
	tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 2/4] coresight: cti: use __reg_addr() helper for
 register access
Message-ID: <20260529144055.GK101133@e132581.arm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-2-d21f4f92c51e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-extended_cti-v9-2-d21f4f92c51e@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-110300-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,e132581.arm.com:mid]
X-Rspamd-Queue-Id: 0825860408C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 08:16:28PM +0800, Yingchao Deng wrote:

[...]

> +static void __iomem *__reg_addr(struct cti_drvdata *drvdata, u32 off,
> +				u32 index)
> +{
> +	return drvdata->base + off + sizeof(u32) * index;
> +}
> +
> +#define reg_addr(drvdata, off)		__reg_addr((drvdata), (off), 0)
> +#define reg_index_addr(drvdata, off, i)	__reg_addr((drvdata), (off), (i))

> -u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
> +u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index)
>  {
> -	int val;
> +	u32 val;
>  
>  	CS_UNLOCK(drvdata->base);
> -	val = readl_relaxed(drvdata->base + offset);
> +	val = readl_relaxed(reg_index_addr(drvdata, off, index));
>  	CS_LOCK(drvdata->base);
>  
>  	return val;
>  }
>  
> -void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
> +void cti_write_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index,
> +			  u32 value)
>  {
>  	CS_UNLOCK(drvdata->base);
> -	writel_relaxed(value, drvdata->base + offset);
> +	writel_relaxed(value, reg_index_addr(drvdata, off, index));
>  	CS_LOCK(drvdata->base);
>  }

I prefer to move the register helpers into coresight-cti.h and add two
additional helpers: cti_read_single_reg_index() and
cti_write_single_reg_index().

I also found circular dependency between coresight-cti.h and qcom-cti.h.
Since qcom-cti.h only contains register definitions and a small inline
function for register conversion, we can simply fold it into
coresight-cti.h and dismiss the circular dependency.

Based on this idea, I played around with the code a bit (see the snippet
below). Would you be okay with applying this approach to patches 02/03?
If have any questions, please let me know.

---8<---

--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -60,6 +60,31 @@ struct fwnode_handle;
  */
 #define CTIINOUTEN_MAX		128
 
+/* QCOM CTI extension */
+#define QCOM_ARCHITECT		0x477
+
+#define QCOM_CTIINTACK		0x020
+#define QCOM_CTIAPPSET		0x004
+#define QCOM_CTIAPPCLEAR	0x008
+#define QCOM_CTIAPPPULSE	0x00C
+#define QCOM_CTIINEN		0x400
+#define QCOM_CTIOUTEN		0x800
+#define QCOM_CTITRIGINSTATUS	0x040
+#define QCOM_CTITRIGOUTSTATUS	0x060
+#define QCOM_CTICHINSTATUS	0x080
+#define QCOM_CTICHOUTSTATUS	0x084
+#define QCOM_CTIGATE		0x088
+#define QCOM_ASICCTL		0x08C
+/* Integration test registers */
+#define QCOM_ITCHINACK		0xE70
+#define QCOM_ITTRIGINACK	0xE80
+#define QCOM_ITCHOUT		0xE74
+#define QCOM_ITTRIGOUT		0xEA0
+#define QCOM_ITCHOUTACK		0xE78
+#define QCOM_ITTRIGOUTACK	0xEC0
+#define QCOM_ITCHIN		0xE7C
+#define QCOM_ITTRIGIN		0xEE0
+
 /**
  * Group of related trigger signals
  *
@@ -222,9 +247,8 @@ int cti_enable(struct coresight_device *csdev, enum cs_mode mode,
 int cti_disable(struct coresight_device *csdev, struct coresight_path *path);
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata);
 void cti_write_intack(struct device *dev, u32 ackval);
-void cti_write_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index,
-			  u32 value);
-u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index);
 int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 			enum cti_trig_dir direction, u32 channel_idx,
 			u32 trigger_idx);
@@ -237,6 +261,78 @@ struct coresight_platform_data *
 coresight_cti_get_platform_data(struct device *dev);
 const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 
+static inline u32 cti_qcom_reg_off(u32 offset)
+{
+	switch (offset) {
+	case CTIINTACK:		return QCOM_CTIINTACK;
+	case CTIAPPSET:		return QCOM_CTIAPPSET;
+	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
+	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
+	case CTIINEN:		return QCOM_CTIINEN;
+	case CTIOUTEN:		return QCOM_CTIOUTEN;
+	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
+	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
+	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
+	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
+	case CTIGATE:		return QCOM_CTIGATE;
+	case ASICCTL:		return QCOM_ASICCTL;
+	case ITCHINACK:		return QCOM_ITCHINACK;
+	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
+	case ITCHOUT:		return QCOM_ITCHOUT;
+	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
+	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
+	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
+	case ITCHIN:		return QCOM_ITCHIN;
+	case ITTRIGIN:		return QCOM_ITTRIGIN;
+
+	default:
+		return offset;
+	}
+}
+
+static inline void __iomem *__reg_addr(struct cti_drvdata *drvdata,
+				       u32 off, u32 index)
+{
+	if (unlikely(drvdata->is_qcom_cti))
+		off = cti_qcom_reg_off(off);
+
+	return drvdata->base + off + index * sizeof(u32);
+}
+
+#define reg_addr(drvdata, off)		__reg_addr((drvdata), (off), 0)
+#define reg_index_addr(drvdata, off, i)	__reg_addr((drvdata), (off), (i))
+
+static inline u32 cti_read_single_reg_index(struct cti_drvdata *drvdata,
+					    u32 off, u32 index)
+{
+	u32 val;
+
+	CS_UNLOCK(drvdata->base);
+	val = readl_relaxed(reg_index_addr(drvdata, off, index));
+	CS_LOCK(drvdata->base);
+
+	return val;
+}
+
+static inline u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off)
+{
+	return cti_read_single_reg_index(drvdata, off, 0);
+}
+
+static inline void cti_write_single_reg_index(struct cti_drvdata *drvdata,
+					      u32 off, u32 index, u32 value)
+{
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(value, reg_index_addr(drvdata, off, index));
+	CS_LOCK(drvdata->base);
+}
+
+static inline void cti_write_single_reg(struct cti_drvdata *drvdata,
+					u32 off, u32 value)
+{
+	cti_write_single_reg_index(drvdata, off, 0, value);
+}
+
 /* Check if a cti device is enabled */
 static inline bool cti_is_active(struct cti_config *cfg)
 {

