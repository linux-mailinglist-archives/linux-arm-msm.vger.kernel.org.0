Return-Path: <linux-arm-msm+bounces-29177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9595951F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 08:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E106C1C20FC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 06:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3874919258E;
	Wed, 21 Aug 2024 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bO8cwyiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1468B19258A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 06:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223162; cv=none; b=rLRTP3HssmCzatJjnVMD085QHOyJjVjtIpge1I51IODGxpskl9BW3Xrc39MYStbJ2ZAlLAGtIeRwzDbP5FD+VqNyUCibr3eyFEQQx5WuCyS+wf3SGPmWFSyXfmcOlfefUuBGNrFp2YruAa/VjGTX4hnzT9h0Q2Xk7/IVWyfIJhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223162; c=relaxed/simple;
	bh=ICrJcs7OEf0Li17q5LhAGGtSH/X/Gt65/30gX0OOqdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxJu31bw3xp1ZKyMkfHf74wta1l1DJ4E/eui7sWEIxwT6Y5HgCuUBi0dKom297CYbh2gRaxYvjZVmqRY9aAAfDMGBqQMGRmEzCZu9JaL6n/UzSIknWezt187GD5eyf+KACLcpg5bZMqHYmdHUJ2V5BtkBYCBgJ14QQfgwbN9Pvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bO8cwyiB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C823C4AF09;
	Wed, 21 Aug 2024 06:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724223161;
	bh=ICrJcs7OEf0Li17q5LhAGGtSH/X/Gt65/30gX0OOqdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bO8cwyiBFF0jjJAYTuyJ+Iz41vBTdRNc4amsvXhPIzmcAnPSJB7Z2eRZrQ16OdZtI
	 ZJ0lWV9QzbCT456luNRbOki7MKFkFgPTfNfmE4XqQDXlZ09s8D8JScE0t4L4E1xLsq
	 +G0jXI3vU5jh0bi7KIyns/7IpZ5xVUw88aPnYthIJLzlQf+ncTpSl1L9SjUUcUvzb0
	 BU2Evzcnhm9jPU9SzEkUN/MiGEmVIrhk5FParrmsrUesGfVMBvKsml/sv1SGVSkhA/
	 T/0AMj1IqC1AaAA54p99JvGnby3aU6/P2YGD09gN0jjnerq++QnL8MyPCvnvlufyWp
	 L3/qavUvyrMlg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sgfD0-000000003ZF-1BNv;
	Wed, 21 Aug 2024 08:52:43 +0200
Date: Wed, 21 Aug 2024 08:52:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: qcom: pmic_glink: Fix race during
 initialization
Message-ID: <ZsWOujOQsJtLcVf-@hovoldconsulting.com>
References: <20240820-pmic-glink-v6-11-races-v3-0-eec53c750a04@quicinc.com>
 <20240820-pmic-glink-v6-11-races-v3-1-eec53c750a04@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820-pmic-glink-v6-11-races-v3-1-eec53c750a04@quicinc.com>

On Tue, Aug 20, 2024 at 01:29:30PM -0700, Bjorn Andersson wrote:
> As pointed out by Stephen Boyd it is possible that during initialization
> of the pmic_glink child drivers, the protection-domain notifiers fires,
> and the associated work is scheduled, before the client registration
> returns and as a result the local "client" pointer has been initialized.
> 
> The outcome of this is a NULL pointer dereference as the "client"
> pointer is blindly dereferenced.

> Resolve this by splitting the allocation of the "client" object and the
> registration thereof into two operations.

It seems something went wrong when you posted v3 (using b4 automagic?)
so the cover letter and changelog is now missing and no one is on CC any
more.

Patches look good, though, with the exception of one nit below.

> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index 49bef4a5ac3f..07758ab6ac1c 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -1387,12 +1387,16 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
>  					     "failed to register wireless charing power supply\n");
>  	}
>  
> -	battmgr->client = devm_pmic_glink_register_client(dev,
> -							  PMIC_GLINK_OWNER_BATTMGR,
> -							  qcom_battmgr_callback,
> -							  qcom_battmgr_pdr_notify,
> -							  battmgr);
> -	return PTR_ERR_OR_ZERO(battmgr->client);
> +	battmgr->client = devm_pmic_glink_client_alloc(dev, PMIC_GLINK_OWNER_BATTMGR,
> +						     qcom_battmgr_callback,
> +						     qcom_battmgr_pdr_notify,
> +						     battmgr);

I'm not a fan of open-parenthesis alignment of arguments, but since this
driver uses it you need to adjust the alignment to the new symbol name
in v3.

> +	if (IS_ERR(battmgr->client))
> +		return PTR_ERR(battmgr->client);
> +
> +	pmic_glink_client_register(battmgr->client);
> +
> +	return 0;
>  }

> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 1e0808b3cb93..c6f3d5188fc6 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -520,12 +520,17 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
>  			return ret;
>  	}
>  
> -	altmode->client = devm_pmic_glink_register_client(dev,
> -							  altmode->owner_id,
> -							  pmic_glink_altmode_callback,
> -							  pmic_glink_altmode_pdr_notify,
> -							  altmode);
> -	return PTR_ERR_OR_ZERO(altmode->client);
> +	altmode->client = devm_pmic_glink_client_alloc(dev,
> +						     altmode->owner_id,
> +						     pmic_glink_altmode_callback,
> +						     pmic_glink_altmode_pdr_notify,
> +						     altmode);

Same here.

> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 16c328497e0b..6425904f2bfc 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -367,12 +367,16 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
>  		ucsi->port_orientation[port] = desc;
>  	}
>  
> -	ucsi->client = devm_pmic_glink_register_client(dev,
> -						       PMIC_GLINK_OWNER_USBC,
> -						       pmic_glink_ucsi_callback,
> -						       pmic_glink_ucsi_pdr_notify,
> -						       ucsi);
> -	return PTR_ERR_OR_ZERO(ucsi->client);
> +	ucsi->client = devm_pmic_glink_client_alloc(dev, PMIC_GLINK_OWNER_USBC,
> +						  pmic_glink_ucsi_callback,
> +						  pmic_glink_ucsi_pdr_notify,
> +						  ucsi);

And here.

> +	if (IS_ERR(ucsi->client))
> +		return PTR_ERR(ucsi->client);
> +
> +	pmic_glink_client_register(ucsi->client);
> +
> +	return 0;
>  }
>  
>  static void pmic_glink_ucsi_remove(struct auxiliary_device *adev)
> diff --git a/include/linux/soc/qcom/pmic_glink.h b/include/linux/soc/qcom/pmic_glink.h
> index fd124aa18c81..4c68385b2765 100644
> --- a/include/linux/soc/qcom/pmic_glink.h
> +++ b/include/linux/soc/qcom/pmic_glink.h
> @@ -23,10 +23,11 @@ struct pmic_glink_hdr {
>  
>  int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len);
>  
> -struct pmic_glink_client *devm_pmic_glink_register_client(struct device *dev,
> -							  unsigned int id,
> -							  void (*cb)(const void *, size_t, void *),
> -							  void (*pdr)(void *, int),
> -							  void *priv);
> +struct pmic_glink_client *devm_pmic_glink_client_alloc(struct device *dev,
> +						     unsigned int id,
> +						     void (*cb)(const void *, size_t, void *),
> +						     void (*pdr)(void *, int),
> +						     void *priv);

And here.

Johan

