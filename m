Return-Path: <linux-arm-msm+bounces-35074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE88F9A4CD1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 12:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A77CB2853FF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 10:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2F219007E;
	Sat, 19 Oct 2024 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="NhMFqeM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5A318C34B;
	Sat, 19 Oct 2024 10:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729333037; cv=none; b=CuV7K1TUWyur2L41jc3Az5yDOcwRtRpDvYMAlWBvZn41fga/gi/4pJt4WW6hGcEXPrypS1rODffux21FKIukfoynWyL3gLtQb9N+L6X2NsRXG1hXfGcPu/dsDJZs+WMLV8GpbQyQWwXSktEzQGP8dS3sz+gjDwKPU/ifTvZIOdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729333037; c=relaxed/simple;
	bh=EEoegO5HOQfYcl3gGqouvUqNUEa6zCKW1b8JWwcSwno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qNcmXbi3/0/Rg2EEZePBaxZXciCqvflpkAXIUR63ZxyGJ9LcLERYIEenbrsC0h2uJcb3gvxrKY2h+2FNrH6tNVbzujL1QbFZ3SOxyjDsFri9E5IdxB+TpaqvjKiGc5XPO7lYklkSWmpW/u0Eg3lTUK0mvCXwaIiYcF4+lbY8HQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=NhMFqeM1; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1729332413; bh=EEoegO5HOQfYcl3gGqouvUqNUEa6zCKW1b8JWwcSwno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NhMFqeM1xVfZLawOWT92RfW8LTIOJfidwNp7MHnmkEBLJateXf6PVaPck2LUqDeS9
	 L+wZ2/Vm2kGurlrUdKzeMsmY/dNoppxdhMlYDKiOqgn87zlRQTmxGHO5UHZFJDo3FR
	 xYuxtG/a5fdw0XwYNfGVAIa2TMrrJSVpLYx0808o=
From: Luca Weiss <luca@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject:
 Re: [PATCH v2] rpmsg: qcom_smd: Improve error handling for
 qcom_smd_parse_edge
Date: Sat, 19 Oct 2024 12:06:50 +0200
Message-ID: <2827287.mvXUDI8C0e@g550jk>
In-Reply-To: <20240606-apcs-mboxes-v2-1-41b9e91effb6@z3ntu.xyz>
References: <20240606-apcs-mboxes-v2-1-41b9e91effb6@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Donnerstag, 6. Juni 2024 21:01:36 MESZ Luca Weiss wrote:
> When the mailbox driver has not probed yet, the error message "failed to
> parse smd edge" is just going to confuse users, so improve the error
> prints a bit.
> 
> Cover the last remaining exits from qcom_smd_parse_edge with proper
> error prints, especially the one for the mbox_chan deserved
> dev_err_probe to handle EPROBE_DEFER nicely. And add one for ipc_regmap
> also to be complete.
> 
> With this done, we can remove the outer print completely.

Ping, looks like this is still pending.

Regards
Luca

> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes in v2:
> - Rebase on qcom for-next, drop dts patches which have been applied
> - Improve error printing situation (Bjorn)
> - Link to v1: https://lore.kernel.org/r/20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz
> ---
>  drivers/rpmsg/qcom_smd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 43f601c84b4f..06e6ba653ea1 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1369,7 +1369,8 @@ static int qcom_smd_parse_edge(struct device *dev,
>  	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
>  	if (IS_ERR(edge->mbox_chan)) {
>  		if (PTR_ERR(edge->mbox_chan) != -ENODEV) {
> -			ret = PTR_ERR(edge->mbox_chan);
> +			ret = dev_err_probe(dev, PTR_ERR(edge->mbox_chan),
> +					    "failed to acquire IPC mailbox\n");
>  			goto put_node;
>  		}
>  
> @@ -1386,6 +1387,7 @@ static int qcom_smd_parse_edge(struct device *dev,
>  		of_node_put(syscon_np);
>  		if (IS_ERR(edge->ipc_regmap)) {
>  			ret = PTR_ERR(edge->ipc_regmap);
> +			dev_err(dev, "failed to get regmap from syscon: %d\n", ret);
>  			goto put_node;
>  		}
>  
> @@ -1501,10 +1503,8 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
>  	}
>  
>  	ret = qcom_smd_parse_edge(&edge->dev, node, edge);
> -	if (ret) {
> -		dev_err(&edge->dev, "failed to parse smd edge\n");
> +	if (ret)
>  		goto unregister_dev;
> -	}
>  
>  	ret = qcom_smd_create_chrdev(edge);
>  	if (ret) {
> 
> ---
> base-commit: 2c79712cc83b172ce26c3086ced1c1fae087d8fb
> change-id: 20240423-apcs-mboxes-12ee6c01a5b3
> 
> Best regards,
> 





