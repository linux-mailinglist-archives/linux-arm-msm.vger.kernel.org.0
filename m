Return-Path: <linux-arm-msm+bounces-40402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD89E47FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4244228300A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8776E1F541B;
	Wed,  4 Dec 2024 22:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n6d4EGvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6845C1F03D5
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 22:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733351857; cv=none; b=Gv13pUE9hPQTKgRS0BlZA4R914mz7nWbg2BZVt8SYWEm1Znbd0IEJj1x52vZjlGeSdq3y4FvI4Jpm/MQN+YUwZXs0ezhvky09gBcpdHjeBbb5hSefYj6gfCcsP2FRLAXMBO+RbNv7OPg7elTk7QB323j6WQgS9aNjWjpmALL6/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733351857; c=relaxed/simple;
	bh=POdnmzd1BwpN+rTYy9qwuw16Q1+HWaZPsMmd69hHKmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwLmfcEjz2iifCYHsfA88CsKBugPOQGagg+mHI52f18iriE7rmtGYzfMpz1w08Z6/msjP+R/ppGB/u/oMZ56d3hF4OeYBVFVVfq8MGIe4ROuZmgFSC1zMjUSW+Hau4I4YR6lOovWjuxk93eGr+tZZhNJgPegoM1K8mtxKswvWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n6d4EGvm; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de79c2be4so310310e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733351854; x=1733956654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HnWatFIPmnccGlZwUZNxD71tRzMsuLeasLd0swmh5OI=;
        b=n6d4EGvm/qBFEHJU0A3Vp+C4yF3YYuh/+kHuMkbyfLFp7d4iXC9C6mHD2kpXFU5IVQ
         Ell8C/Z/K5EaOCBCcPMRo439Ln29OsM2hBlPGljOztrG+Z5EPGF+qC4tzlj+oUjCD70u
         sPP4if+1JQhh6oIVd/V1IE5W9vIMz/iCGG5lCPY9YC8xAx2RnDpoMadLOePiO3BFd1tC
         I2/83n45anhRdAZK7ZRb5MM8eZkTiuJoK1AxuVgznpA56dylyblgAejAFWtmzYrz6bV4
         vkhHx7MGLmC0cdcY4BS4jxFsIzJ2UaMca5SKW0hdvTkNoImr646h6b2dTTcd3v/lRWTM
         cFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733351854; x=1733956654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnWatFIPmnccGlZwUZNxD71tRzMsuLeasLd0swmh5OI=;
        b=SVmRs1FNAfum1n654kP5sXxz7MOgaOss0Ddo1kK3GTxiETTDaN03yj/tO1rfjPTg8J
         MCtmbRvZ4PGkXDsMdF0esfNmyXn0FONHsh9/EQD8P1hnQCYKlpxm5tlDVF5SoZ+A27Md
         HiBUmbMwWQ5t83beYnLZfQ7jcU1VjkLevi9aTJn2Nfnezloryz9JT1gCHJ1xK8voDeEt
         fOKoK2kNsYv0IoIkuRy1bkNLNh0Ew5fzf2qp5KETQUOuBxPp4XebEBiblURNBS1UzF3W
         ULdfas29uMoj8bPMTPYxqXIK7rGcQbf9qOoTat9tDbZ0JIKaPEOQ3GYmIgcpS/Y2Vk8H
         RGwA==
X-Forwarded-Encrypted: i=1; AJvYcCWbxGqiVdR5dgpHVPIRCLzBklt/yFVxxBRUamE33K7FtkB4UmmT3V2vaYvIgXoYrH4j7JwjlmvfPT4n4/8u@vger.kernel.org
X-Gm-Message-State: AOJu0Yzea1FOWZN1lpFvIcAqaEXWeVwYUV8PNZ7IhF7HJVwSwoJ9jOdt
	neSIT6RpeSFmvfXKfsz7kCfmu/H+LNvDg8qgTWj/QU4fe2sUAREw1DCcD9rq9oQ=
X-Gm-Gg: ASbGncuPh1w/jQsCm9vzEu4mbYJezAVaqK6JZSJ37vnKMgkQt3pdaAEKVB1zmTPwHNN
	pgxe68OMdKg68J1xkQaDUa2wR1N72yz5o4ut0s9urC4lGH43hIl3+rbH+/Jt4gZa4X4FNpMOFeS
	JiY9ICZHfSsWpMnK3xe2ZXzzzAOyW/KhmyWjeKThjXftOtT30rjJHbXmJL0URCbMV8ziUpY0kBO
	oB6DqQputzpELjlRoOVGdNX4DKwdY2+Ca+zOhxHfKUlN7R4v9Pkjwlc0iBqfvH9IdGpwjDQvWks
	Zf/9uDUT5wykjF45c7n1Z9X52Nglww==
X-Google-Smtp-Source: AGHT+IF9ZCG3qMcJKun4Nqjsn74bToQ1plUYb38GzwepHbZ/WeGz6MaSKqA2QFB+Dtkj7t4l5nk2ZQ==
X-Received: by 2002:a05:6512:3b23:b0:53d:c2f6:8399 with SMTP id 2adb3069b0e04-53e12a35234mr4334401e87.53.1733351853604;
        Wed, 04 Dec 2024 14:37:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229c2386sm21821e87.215.2024.12.04.14.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 14:37:32 -0800 (PST)
Date: Thu, 5 Dec 2024 00:37:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or, andersson@kernel.org, 
	konradybcio@kernel.org, johan+linaro@kernel.org, dianders@chromium.org, 
	agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, oe-kbuild-all@lists.linux.dev, =quic_msavaliy@quicinc.com, 
	quic_anupkulk@quicinc.com, Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v1 4/7] soc: qcom: geni-se:: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <5sni4plocjjtzdijtmlxnipthpfz4w3x27th3mergdhhaqjs3y@aqyngjkmg33h>
References: <20241204150326.1470749-5-quic_vdadhani@quicinc.com>
 <202412050429.SJvNsU2f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412050429.SJvNsU2f-lkp@intel.com>

On Thu, Dec 05, 2024 at 04:19:25AM +0800, kernel test robot wrote:
> Hi Viken,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on andi-shyti/i2c/i2c-host]
> [also build test WARNING on tty/tty-testing tty/tty-next tty/tty-linus broonie-spi/for-next linus/master v6.13-rc1 next-20241204]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/dt-bindings-i2c-qcom-i2c-geni-Document-DT-properties-for-QUP-firmware-loading/20241204-230736
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> patch link:    https://lore.kernel.org/r/20241204150326.1470749-5-quic_vdadhani%40quicinc.com
> patch subject: [PATCH v1 4/7] soc: qcom: geni-se:: Add support to load QUP SE Firmware via Linux subsystem
> config: arm-randconfig-002 (https://download.01.org/0day-ci/archive/20241205/202412050429.SJvNsU2f-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050429.SJvNsU2f-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412050429.SJvNsU2f-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/soc/qcom/qcom-geni-se.c: In function 'read_elf':
> >> drivers/soc/qcom/qcom-geni-se.c:975:23: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>      975 |                 *phdr = &phdrs[i];
>          |                       ^
>    drivers/soc/qcom/qcom-geni-se.c: At top level:
>    drivers/soc/qcom/qcom-geni-se.c:1268:5: warning: no previous prototype for 'qup_fw_load' [-Wmissing-prototypes]
>     1268 | int qup_fw_load(struct qup_se_rsc *rsc)
>          |     ^~~~~~~~~~~

This doesn't looks like it was properly compile-tested. Please always
make sure that the build cleanly passes "make W=1" for the changed
paths.


-- 
With best wishes
Dmitry

