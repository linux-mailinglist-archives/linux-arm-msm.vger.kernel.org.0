Return-Path: <linux-arm-msm+bounces-12776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269386A01C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 20:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B11BA1C2382F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 19:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9449524DF;
	Tue, 27 Feb 2024 19:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KuMvnxZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C6D51C5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 19:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709061772; cv=none; b=F/nuIRDJ2WaDeJVRt0+6GX83k2gvco9LhqaQvgH2eVwXTD3WO++wdj/hq3WYIC446yQjhcuHgS2NSrwR6doQkmRHuHSKiRymMMsea9QWch9HcSZfM3yApHliTd0/QWDlyJqHTa6I42471b+priNsgela5xBPHWit/kS788Hfh30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709061772; c=relaxed/simple;
	bh=6CQ5gmdtyYpJOht39IMv2Luza/449m9TszX8sO5JgoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTdBXzdzf+40pZtQqdvjsAXee/5hnGsAvFfO8st1WbPCsqtzotxgE+NirnUh3Qd5vkdEUVFiWP8PvEvwhJvHcQPZudLi6qG0GEGubSwHKYU4rIQ76ES2ODdAtSKiosvyr5D4cAj8LF76ukg46BPXFhnlWLmabQM6YZ/gq8BCQlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KuMvnxZM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709061770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mhq+ZYoih/qrTYF14e3+nwNYDVyTycUAByxpGo4QvPY=;
	b=KuMvnxZMT5Xr4sG5FL41MXYCnXyjlEPohy/HubvSGXVgJE/lTq/1eZ9IX6tA2R3VkDtauj
	2HdLS8pzPAwQmgcF8xJ7HURJY9kFnmfiWdBarHwMEIWq3oBx3LwWh36l7JF1xTeBNck5T1
	iGxAPRwd7Y8voT1fIOiDQGxZiDWb/4g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-2xJvwUzUMquKZ1BUQ-1WLg-1; Tue, 27 Feb 2024 14:22:47 -0500
X-MC-Unique: 2xJvwUzUMquKZ1BUQ-1WLg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6900ad85a4dso2002536d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 11:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709061767; x=1709666567;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhq+ZYoih/qrTYF14e3+nwNYDVyTycUAByxpGo4QvPY=;
        b=WwQPaOOvgVubVOhJClYO1tDLAP6b7FAscEk93Wp6cQC7yr61iBSTAaVMa6BdQL5FsV
         /CGKxYt5AEV7vDBhndKctfQi1FaIzZI8IFKxTLBadANw1HKlpFGVpjR5l2QRkjuVozto
         2ubqjms8Ye5fIs9arbk6qRjk4FRpnYnzvxV/0JUZTjKEHa396nwmb1sXZGrCjeBcCEbf
         ZRl4AKgpRaT9OILxVIe0taIL3C+PKKoC7bj48fYuH8EmEkrE5A9o3u5jqWb1k+jfYIYy
         IxfFEK5vBtakP46nAxg1uRPHzQj0u5gPuVnnYFBHSyap+JQKknhxc39tDKRzsZl4/JAh
         T/bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVZBrUogNMrg6+D9vOJYNwyg68mwLIa8pdvZlCU/zkHWp11Rsm9QlLL7GL2CLHvJtrY81hcZMCzd3Dv9wd/0CooViu0alaPiLNJIgkKQ==
X-Gm-Message-State: AOJu0YxV8UD9qoEAxrjySmf6+CuntWL+o4M1Be9WI79Hx0MeVHXz528q
	EmQytM5Pen1+KBWG6MsWfYp8BGDD7Ft+PReHx8x2MI6FANXIEqFXtCQkd+0+jDN3ICgwhF5N9lo
	9lbvrYQvEC7jvJoc7YEqED7KYYY7k6xmyt9LfWrxaZrOJMEPzGetbvxMoX7fNoC8=
X-Received: by 2002:a0c:a701:0:b0:68f:b941:3463 with SMTP id u1-20020a0ca701000000b0068fb9413463mr389400qva.3.1709061766848;
        Tue, 27 Feb 2024 11:22:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAw3whhp33K3ejS51UcfWRh1RcSEZcDXSSQzXWA6/oS1qCwFTMJD+0WG25R51Ed1Z43180zA==
X-Received: by 2002:a0c:a701:0:b0:68f:b941:3463 with SMTP id u1-20020a0ca701000000b0068fb9413463mr389376qva.3.1709061766538;
        Tue, 27 Feb 2024 11:22:46 -0800 (PST)
Received: from fedora ([142.189.203.219])
        by smtp.gmail.com with ESMTPSA id op10-20020a056214458a00b0068ff8d75a90sm3695560qvb.19.2024.02.27.11.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 11:22:46 -0800 (PST)
Date: Tue, 27 Feb 2024 14:22:44 -0500
From: Lucas Karpinski <lkarpins@redhat.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, Alex Elder <elder@ieee.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH V26 2/3] misc: dcc: Add driver support for Data Capture
 and Compare unit(DCC)
Message-ID: <cnbntxeussvhvkgwqm7c6jtpondmrlrnsyskhxhqp2463r7lfw@3umkzfwoa5le>
References: <cover.1691496290.git.quic_schowdhu@quicinc.com>
 <2624304811c253e1a28350668fb69cf463ac47f9.1691496290.git.quic_schowdhu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2624304811c253e1a28350668fb69cf463ac47f9.1691496290.git.quic_schowdhu@quicinc.com>
User-Agent: NeoMutt/20231221

On Tue, Aug 08, 2023 at 05:58:26PM +0530, Souradeep Chowdhury wrote:
> diff --git a/Documentation/ABI/testing/debugfs-driver-dcc b/Documentation/ABI/testing/debugfs-driver-dcc
> index 27ed5919d21b..7f588580a906 100644
> --- a/Documentation/ABI/testing/debugfs-driver-dcc
> +++ b/Documentation/ABI/testing/debugfs-driver-dcc
> @@ -1,4 +1,4 @@
> -What:           /sys/kernel/debug/dcc/.../ready
> +What:           /sys/kernel/debug/qcom-dcc/.../ready
>  Date:           December 2022
Looks like this patch set is getting closer to being accepted, please 
keep the date updated accordingly.

> +#define DCC_LL_NUM_INFO			0x10
> +#define DCC_LL_LOCK			0x00
> +#define DCC_LL_CFG			0x04
> +#define DCC_LL_BASE			0x08
> +#define DCC_FD_BASE			0x0c
> +#define DCC_LL_OFFSET                   0x80
> +#define DCC_LL_TIMEOUT			0x10
> +#define DCC_LL_INT_ENABLE		0x18
> +#define DCC_LL_INT_STATUS		0x1c
> +#define DCC_LL_SW_TRIGGER		0x2c
> +#define DCC_LL_BUS_ACCESS_STATUS	0x30
> +
> +/* Default value used if a bit 6 in the HW_INFO register is set. */
> +#define DCC_FIX_LOOP_OFFSET		16
> +
> +/* Mask to find version info from HW_Info register */
> +#define DCC_VER_INFO_MASK		BIT(9)
> +
> +#define MAX_DCC_OFFSET			GENMASK(9, 2)
> +#define MAX_DCC_LEN			GENMASK(6, 0)
> +#define MAX_LOOP_CNT			GENMASK(7, 0)
> +#define MAX_LOOP_ADDR			10
> +
> +#define DCC_ADDR_DESCRIPTOR		0x00
> +#define DCC_ADDR_LIMIT			27
> +#define DCC_WORD_SIZE			sizeof(u32)
> +#define DCC_ADDR_RANGE_MASK		GENMASK(31, 4)
> +#define DCC_LOOP_DESCRIPTOR		BIT(30)
> +#define DCC_RD_MOD_WR_DESCRIPTOR	BIT(31)
> +#define DCC_LINK_DESCRIPTOR		GENMASK(31, 30)
> +#define DCC_STATUS_MASK			GENMASK(1, 0)
> +#define DCC_LOCK_MASK			BIT(0)
> +#define DCC_LOOP_OFFSET_MASK		BIT(6)
> +#define DCC_TRIGGER_MASK		BIT(9)
> +
> +#define DCC_WRITE_MASK			BIT(15)
> +#define DCC_WRITE_OFF_MASK		GENMASK(7, 0)
> +#define DCC_WRITE_LEN_MASK		GENMASK(14, 8)
> +
> +#define DCC_READ_IND			0x00
> +#define DCC_WRITE_IND			(BIT(28))
> +
> +#define DCC_AHB_IND			0x00
> +#define DCC_APB_IND			BIT(29)
> +
> +#define DCC_MAX_LINK_LIST		8
> +
> +#define DCC_VER_MASK2			GENMASK(5, 0)
> +
> +#define DCC_SRAM_WORD_LENGTH		4
> +
> +#define DCC_RD_MOD_WR_ADDR              0xC105E
> +
> +enum dcc_descriptor_type {
> +	DCC_READ_TYPE,
> +	DCC_LOOP_TYPE,
> +	DCC_READ_WRITE_TYPE,
> +	DCC_WRITE_TYPE
> +};
Can you fix the spacing in the macros?

> +static int dcc_add_loop(struct dcc_drvdata *drvdata, unsigned long loop_cnt, int curr_list)
u32 loop_cnt

Lucas


