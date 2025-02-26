Return-Path: <linux-arm-msm+bounces-49438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EE6A457B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7792016BA78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751741898FB;
	Wed, 26 Feb 2025 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXcPbggz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEA7258CC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 08:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740557425; cv=none; b=PoQx/aYnFEbFfETNQ07LTNS+CbE1UGw4XvdHeNpdl8RRnZwgI6jMPnbALoX5tmEu4QIRu3zLsjb9bZ8qaW7LX6RQQMsAtVd24ci0QJpnGUilizbOLUVW9v/YURZk+nT7YExMeUDMzRdTjfodV7ZhQe+MaU5VgLK0v7qU9cZzZig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740557425; c=relaxed/simple;
	bh=m16n2a0G+H+R4XeqWbUshVKKT5SxZQTLx9zmaPENiPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZO1v8XS6HPOrxz4w3kNu5Up8s2FX/dvm5bLSQi93dQWk5CExljExvClVU1TNB6xpBoDqIgj7ufDNYFiDT2Lqo8qZAIdFU25ruzOPOo/u8xcGsVnnTc1KKkncQ7QNG9ay47ZkK2jY63XpOhwNKr7kmiBQ/7SjrDxb5FEUoHFYl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXcPbggz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abb7f539c35so1262007266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 00:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740557420; x=1741162220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yzL0HH6+3pjB6JtUVnEkC+XEezkYR9X8Kd/L450a2PU=;
        b=kXcPbggzg2g9xvRUylTF5YWyTUmcdLbmPK3oABsnoBDK//we7JdIKTt2/XMfMi1pC4
         maH7IhVx4bOSVkDAdHuRhZCeoOTVOTXurXCh33QzGGNxaxN4zDXA1KM4ZQKJ17WBLNXm
         N9/FO5S3PKTV0odv15Kw/EpbupM/Rge3xzhxs7vq5WEfiR2PYYax0UUENo1TiGWjSHkV
         ChF203hu8Af5cv6LSBttJE7paPVm53c1CYnUTWWJOyysP+degwnaAbq9mAO//AWh5mam
         zbOiuDUd0nG3K2jdkYuAF3sLbro82fStSj9cyDGcIwn22r1mvGXuWtKXDQjdD6+tKbBp
         iIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740557420; x=1741162220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzL0HH6+3pjB6JtUVnEkC+XEezkYR9X8Kd/L450a2PU=;
        b=IK+YS+ZrXSWNCar+7yT+Mk655sn87IfatlbNbHuMFIm3LeI3gywpaQvXZciEN/cBKs
         3rIdgI67rRKcADCl/HwKnvZxr+eTVsqPvUI+SVGBxOdE8ooAJN/wVfW77nQUUnUf0eng
         UGJJA9r58neg8+GJ9/Z+KECuRVOxUrU2ohDMYxgWqTrNisX7AcDgg2/Z59DTtgW//BJX
         Kl70dXlEdOyc6OectFttfLKrAhqapXX7/f5v9ugGohdsI9V4TEe9NNlLsuQCyuXbzvTo
         FfKlDBbTWpoW35zJe5egn+SfnqNmoXU3PwoPQ5nbzgTmuG87t9m0uFu5XLyyKUfXj6vf
         5uGw==
X-Forwarded-Encrypted: i=1; AJvYcCXtK+9jYn2SsjRMmVVPt41SHCkBLn3eF741hoEaQoz3i4WX2YGLMV+sbscCYRAKbeSFZ60beY7CuISC/RoT@vger.kernel.org
X-Gm-Message-State: AOJu0YwvESRUJbkBOdFhS6V/BcMWYEbxAeB1MdfJ8/u8qyARDzJ1KPaQ
	LW6mSpO75WyNc0PfVdUun+1TU5sqjxigzhUOFAH3mMDg04dVUivCOhWU4J0eY0E=
X-Gm-Gg: ASbGncv1nWhtrT+pBbB+IzkE9ZdJuBMSZrmE7tn+oKLyCJO78w18H9ywMy1H2m0anio
	9iwVLO8f5O+wvsPDUbIH+AwaMdF0WiTuN79PjWOjF7pFyTBYGxw/Dn1jXrMQTM97Kq/ZTf+yWyG
	rmbQiQbKwiUwTh4l8JBHFUlgUE0gv0C7lXp//m6MhCbnSCfbMszkeSBcRk9w1tBZAmTGlgPBz0E
	+6+qJQkX4tBBeUXSMsClcO8oxLDKBe6Mlb47UskdebSspZIDLP4kCKf5g8GoZdScyLmHYk7U4ao
	ul9uvRVNVIaIq6NMArXzmrJO1QsGKuY=
X-Google-Smtp-Source: AGHT+IHpAStU3+Mniiaci5QMGYjPh41Vll/PquOYd6UlaCbeosoKMMhRy2Vp0kLKhOE9xPeFAQTT2Q==
X-Received: by 2002:a17:907:868a:b0:ab7:d179:2496 with SMTP id a640c23a62f3a-abed0c77de1mr720783166b.6.1740557420331;
        Wed, 26 Feb 2025 00:10:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed1d5c369sm288355466b.60.2025.02.26.00.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:10:19 -0800 (PST)
Date: Wed, 26 Feb 2025 11:10:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, johan@kernel.org,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <4fe60edd-6e0b-4e7f-9d4b-632203790b5b@stanley.mountain>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226024338.3994701-3-quic_sibis@quicinc.com>

On Wed, Feb 26, 2025 at 08:13:38AM +0530, Sibi Sankar wrote:
> The addition of per message-id fastchannel support check exposed
> a SCP firmware bug which leads to a device crash on X1E platforms.

You're fixing a bug that is introduced in patch 1.  That's not allowed.
These need to be squashed into one patch.  I means the patch will be
slightly long and the commit message will be slightly long but I
feel like it's manageable.

> The X1E firmware supports fastchannel on LEVEL_GET but fails to
> have this set in the protocol message attributes and the fallback
> to regular messaging leads to a device crash since that implementation
> has a bug for all the X1E devices in the wild. Fix this by introducing
> a quirk that selectively skips the per message-id fastchannel check only
> for the LEVEL_GET message on X1E platforms.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/firmware/arm_scmi/driver.c    |  5 +++--
>  drivers/firmware/arm_scmi/perf.c      | 30 +++++++++++++++++++++------
>  drivers/firmware/arm_scmi/powercap.c  |  8 +++----
>  drivers/firmware/arm_scmi/protocols.h |  2 +-
>  4 files changed, 32 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 9313b9020fc1..b182fa8e8ccb 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1903,7 +1903,8 @@ static void
>  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
>  			     u8 describe_id, u32 message_id, u32 valid_size,
>  			     u32 domain, void __iomem **p_addr,
> -			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
> +			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
> +			     bool skip_check)
>  {
>  	int ret;
>  	u32 flags;
> @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
>  
>  	/* Check if the MSG_ID supports fastchannel */
>  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
>  		return;

This is explained well in the commit message but the comment here needs
to be better.  Also if scmi_protocol_msg_check() fails then we should
return.  Let's rename the variable to "force_fastchannel".

	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
	if (ret)
		return;

	/*
	 * Check if the MSG_ID supports fastchannel.  The force_fastchannel
	 * quirk is necessary to work around a firmware bug.  We can probably
	 * remove that quirk in 2030.
	 */
	if (!force_fastchannel && !MSG_SUPPORTS_FASTCHANNEL(attributes))
		return;


>  
>  	if (!p_addr) {
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> index c7e5a34b254b..5b4559d0b054 100644
> --- a/drivers/firmware/arm_scmi/perf.c
> +++ b/drivers/firmware/arm_scmi/perf.c
> @@ -48,6 +48,10 @@ enum {
>  	PERF_FC_MAX,
>  };
>  
> +enum {
> +	PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET,
> +};

Let's keep the FORCE_FASTCHANNEL naming.  Normally we would do this like:

#define PERF_QUIRK_FORCE_FASTCHANNEL BIT(0)

> +
>  struct scmi_opp {
>  	u32 perf;
>  	u32 power;
> @@ -183,6 +187,7 @@ struct scmi_perf_info {
>  	enum scmi_power_scale power_scale;
>  	u64 stats_addr;
>  	u32 stats_size;
> +	u32 quirks;
>  	bool notify_lvl_cmd;
>  	bool notify_lim_cmd;
>  	struct perf_dom_info *dom_info;
> @@ -838,9 +843,10 @@ static int scmi_perf_level_limits_notify(const struct scmi_protocol_handle *ph,
>  }
>  
>  static void scmi_perf_domain_init_fc(const struct scmi_protocol_handle *ph,
> -				     struct perf_dom_info *dom)
> +				     struct perf_dom_info *dom, u32 quirks)
>  {
>  	struct scmi_fc_info *fc;
> +	bool quirk_level_get = !!(quirks & BIT(PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET));

	bool force_fastchannel = !!(quirks & PERF_QUIRK_FORCE_FASTCHANNEL);

>  
>  	fc = devm_kcalloc(ph->dev, PERF_FC_MAX, sizeof(*fc), GFP_KERNEL);
>  	if (!fc)

regards,
dan carpenter


