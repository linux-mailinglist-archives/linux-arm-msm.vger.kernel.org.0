Return-Path: <linux-arm-msm+bounces-38717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D79D5545
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8812B282E3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 22:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD891DD9A8;
	Thu, 21 Nov 2024 22:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bFfteXDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EE71DC05D
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 22:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732227300; cv=none; b=Da8rdaeC0/ZXXSzyAL/eetFDua9fo3/LjlmrcdV7PAYCzyZC6xFr3QJ2coTnJOC1RHLKlLzUI+qgl0xxNmcYH/HNNW71P8HFtwnquMsE0zLwB/JVwam0TPaYAT9c7z/bF+SCW+nHITc/cGUUe5XTLFynlwb02m980SO9prvzMPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732227300; c=relaxed/simple;
	bh=MedtbcPE68w6A1t+0iluDLfV5ixEvAxDTp134mz3ta8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5jvHjF9bzcvc8qr5KwO6ENH2erJT1Jxvuyria7eL6rGn0fgwO4ULKrN65T0bSWYn0vTbMbn6hrgimAzCUfMfQ3iPEDmgqUfFn8mXNi/Ij4sPUaRhbJR603XdSW+q6QL9clSQARC8ZM9Qjm1o3vcHd6+CvST3lFZ3dRIQo5TH2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bFfteXDY; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53d9ff92ee9so1581709e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 14:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732227296; x=1732832096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hi/XevIo1cthNQyPWS6cIe1zGxlhuryhjSAJjzS6ibM=;
        b=bFfteXDY3fA8SWiKKI3+PJ8GBmeGfGdT9gMq0C+aVgXqG9va/5F9z+PUuDuq38sJh6
         CycVpHQPvwrWRXh5JMLHlQcSubmb/AiCbRFHfgigADhhMgzkqlB0zBFIFnqx/w87Hxdm
         2mAVN4cSAKgJMm+kmW9xcxV9EurOgUJGF8Ti89phdDiWa7Q+vVuy0ifDbNHNE8W8aCUS
         d8ibT/xys7ggjN3yq9hG1RSxVsVBVC7O2/SDxA0Zi0sSphMRPsiA0LaLcbDDEsYX6zxi
         WB6I4ncczb5gQ+2UWj7WObdct8lswQx748VQWcP2jT293C5UO5DcVrjDv1NupDEuKmR4
         kHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732227296; x=1732832096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi/XevIo1cthNQyPWS6cIe1zGxlhuryhjSAJjzS6ibM=;
        b=jXDLQ/ACSd2IoD+T77t7tERC29LiSoa5JjUNlk80Wb3UzhCDVMqKg9Ipqxjkw3V1uM
         Z94DpO7lO1xOY8PuXP23ndGMjNvl6xc9sMnsWXSSHZPgLMjzUwZg6Y+/LOlhqPU33FCC
         wjCsOEUNTna5fT0SxTeGl4MU62b8ThV40w/qhNcjc08Ri5d8CH8Ruy9YcAizS1LU7w/8
         RfyAg0Sq9PUbqFTRahHe9MwP2F9KI5M/my5i/zpz8uZGzS2hw75R+4IIuTR2yCG3ILIO
         djSO2fjWG8zByMZgqS703jfk2WNWZbk0y5IRNbu76cnm6nkYfsTmnkdKKUYktWODvCXJ
         QHhg==
X-Forwarded-Encrypted: i=1; AJvYcCUqbCjdpJWypHhEBp8eRAZD80Al/tk77G71IJczH/Qoo0iDNetSNh/+6+ot064rH/QfRNyXeNyKAHRdwZAh@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/gjaop8vxLuV3+4QUPocj9MpCpJKrmk/JgMBnD3K/6XRGZos
	Hz2lmKzKxuQBMGeCu68wk0o1+jU64Qyu3VRSx1el6Kb2RLxgUlw4inQ3AmH55BA=
X-Gm-Gg: ASbGncsbsmn5KIB6eXkN0JHOZKwYzGKWQLhh7S6NLJiRWELwyT+zYc02F68f3py2k4H
	ksOByqFETCaanjdGAIawybAKmriqwhhjIvKvJqR+Ld+43gAuBEmAYRlzR0MqzM6dfHhpAygAHmV
	8F+e9gy1Yn343rmbmkAsZFKoz8fdVcRfqXX2yN8ddSOQ9E2Ulm6f1or2BJMVA+50Wnv6dOXAAy5
	1JZBlZmUaNdjfX5sabQQItsDtaLUaeO7O8qGRL8FJ8d0g0vh+8i5bruZ2VrCKDgvdtfdCxDAiRj
	QHeTqA3VGlN1nehofUcr2t7ZI4SEyQ==
X-Google-Smtp-Source: AGHT+IGV/C1nBqdFgvJeMR65ubRSZVeKyIlihXhmqtyVdAP02zb8OqzD3cvC0frxkEgh3Df6nv5ppg==
X-Received: by 2002:a05:6512:304a:b0:53d:d0dd:8dae with SMTP id 2adb3069b0e04-53dd36a075fmr261668e87.17.1732227296249;
        Thu, 21 Nov 2024 14:14:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd248b42esm91463e87.206.2024.11.21.14.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 14:14:54 -0800 (PST)
Date: Fri, 22 Nov 2024 00:14:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Odelu Kukatla <quic_okukatla@quicinc.com>, Mike Tipton <quic_mdtipton@quicinc.com>, 
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 3/4] interconnect: qcom: Add EPSS L3 support on SA8775P
Message-ID: <u2jfxvmn6qazhpvmehrh7ifc3ei7qucuwbk5dq5jzpoqkxmdbk@tsx4di2fdj4h>
References: <20241121113006.28520-1-quic_rlaggysh@quicinc.com>
 <20241121113006.28520-4-quic_rlaggysh@quicinc.com>
 <bc926d6d-e3d1-4fbf-9b6a-bbd3816a766d@kernel.org>
 <b2a05dfb-a820-4450-a156-8d6b4bd59be3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2a05dfb-a820-4450-a156-8d6b4bd59be3@quicinc.com>

On Thu, Nov 21, 2024 at 11:33:04PM +0530, Raviteja Laggyshetty wrote:
> 
> 
> On 11/21/2024 5:28 PM, Krzysztof Kozlowski wrote:
> > On 21/11/2024 12:30, Raviteja Laggyshetty wrote:
> >> Add Epoch Subsystem (EPSS) L3 interconnect provider on
> >> SA8775P SoCs with multiple device support.
> >>
> > 
> > 
> > ...
> > 
> >> -DEFINE_QNODE(osm_l3_master, OSM_L3_MASTER_NODE, 16, OSM_L3_SLAVE_NODE);
> >> -DEFINE_QNODE(osm_l3_slave, OSM_L3_SLAVE_NODE, 16);
> >> +DEFINE_QNODE(osm_l3_master, 16, osm_l3_slave);
> >> +DEFINE_QNODE(osm_l3_slave, 16);
> >>  
> >> -static const struct qcom_osm_l3_node * const osm_l3_nodes[] = {
> >> +static struct qcom_osm_l3_node * const osm_l3_nodes[] = {
> >>  	[MASTER_OSM_L3_APPS] = &osm_l3_master,
> >>  	[SLAVE_OSM_L3] = &osm_l3_slave,
> >>  };
> >>  
> >> -DEFINE_QNODE(epss_l3_master, OSM_L3_MASTER_NODE, 32, OSM_L3_SLAVE_NODE);
> >> -DEFINE_QNODE(epss_l3_slave, OSM_L3_SLAVE_NODE, 32);
> >> +DEFINE_QNODE(epss_l3_master, 32, epss_l3_slave);
> >> +DEFINE_QNODE(epss_l3_slave, 32);
> >>  
> >> -static const struct qcom_osm_l3_node * const epss_l3_nodes[] = {
> >> +static struct qcom_osm_l3_node * const epss_l3_nodes[] = {
> > 
> > 
> > I think dropping const makes the code worse, not better. Commit msg does
> > not explain all these changes and I could not figure out the intention
> > (except modifying but that's just obvious).
> 
> EPSS L3 on SA8775P has two instances and this requires creation of two device nodes in devicetree.
> As Interconnect framework requires a unique node id, each device node needs to have different compatible and data.
> To overcome the need of having two different compatibles and data, driver code has been modified to acquire unique node id from IDA 
> and the node name is made dynamic (nodename@address).
> Updating node id and node name is not possible with const.

Has this been described in the commit message? No. Have you had similar
questions since v1? Yes. What does that tell us?

Also, while we are at it. Please fix your email client settings to wrap
message body text on some sensible (72-75) width.

> > 
> > 
> > 
> >>  	[MASTER_EPSS_L3_APPS] = &epss_l3_master,
> >>  	[SLAVE_EPSS_L3_SHARED] = &epss_l3_slave,
> >>  };
> >> @@ -123,6 +125,19 @@ static const struct qcom_osm_l3_desc epss_l3_l3_vote = {
> >>  	.reg_perf_state = EPSS_REG_L3_VOTE,
> >>  };
> >>  
> >> +static u16 get_node_id_by_name(const char *node_name,
> >> +			       const struct qcom_osm_l3_desc *desc)
> >> +{
> >> +	struct qcom_osm_l3_node *const *nodes = desc->nodes;
> >> +	int i;
> >> +
> >> +	for (i = 0; i < desc->num_nodes; i++) {
> >> +		if (!strcmp(nodes[i]->name, node_name))
> >> +			return nodes[i]->id;
> >> +	}
> >> +	return 0;
> >> +}
> >> +
> >>  static int qcom_osm_l3_set(struct icc_node *src, struct icc_node *dst)
> >>  {
> >>  	struct qcom_osm_l3_icc_provider *qp;
> >> @@ -164,10 +179,11 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
> >>  	const struct qcom_osm_l3_desc *desc;
> >>  	struct icc_onecell_data *data;
> >>  	struct icc_provider *provider;
> >> -	const struct qcom_osm_l3_node * const *qnodes;
> >> +	struct qcom_osm_l3_node * const *qnodes;
> >>  	struct icc_node *node;
> >>  	size_t num_nodes;
> >>  	struct clk *clk;
> >> +	u64 addr;
> >>  	int ret;
> >>  
> >>  	clk = clk_get(&pdev->dev, "xo");
> >> @@ -188,6 +204,10 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
> >>  	if (!qp)
> >>  		return -ENOMEM;
> >>  
> >> +	ret = of_property_read_reg(pdev->dev.of_node, 0, &addr, NULL);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>  	qp->base = devm_platform_ioremap_resource(pdev, 0);
> >>  	if (IS_ERR(qp->base))
> >>  		return PTR_ERR(qp->base);
> >> @@ -242,8 +262,13 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
> >>  
> >>  	icc_provider_init(provider);
> >>  
> >> +	/* Allocate unique id for qnodes */
> >> +	for (i = 0; i < num_nodes; i++)
> >> +		qnodes[i]->id = ida_alloc_min(&osm_l3_id, OSM_L3_NODE_ID_START, GFP_KERNEL);
> >> +
> >>  	for (i = 0; i < num_nodes; i++) {
> >> -		size_t j;
> >> +		char *node_name;
> >> +		size_t j, len;
> >>  
> >>  		node = icc_node_create(qnodes[i]->id);
> >>  		if (IS_ERR(node)) {
> >> @@ -251,13 +276,29 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
> >>  			goto err;
> >>  		}
> >>  
> >> -		node->name = qnodes[i]->name;
> >> +		/* len = strlen(node->name) + @ + 8 (base-address) + NULL */
> >> +		len = strlen(qnodes[i]->name) + OSM_NODE_NAME_SUFFIX_SIZE;
> >> +		node_name = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> >> +		if (!node_name) {
> >> +			ret = -ENOMEM;
> >> +			goto err;
> >> +		}
> >> +
> >> +		snprintf(node_name, len, "%s@%08llx", qnodes[i]->name, addr);
> >> +		node->name = node_name;
> > 
> > 
> > Why the node name becomes dynamic?
> > 
> > Best regards,
> > Krzysztof
> 

-- 
With best wishes
Dmitry

