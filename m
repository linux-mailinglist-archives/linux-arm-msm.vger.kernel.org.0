Return-Path: <linux-arm-msm+bounces-86647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 31063CDEB9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 14:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E63173006727
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 13:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9071332255C;
	Fri, 26 Dec 2025 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aXQEcuUc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C1F218ADD
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766755042; cv=none; b=ia2Xp7tNrob2YfU9mv8/QTOgjusJFE0FvoDP+yr+u33k99LjmsIG2d4nEgKrZkXSSL1lnrwoPM6YB5pY6dh/y1EcaHP0cyVUbs9Oi7RttQea+Kxn3icxHzrpuF+aCjYWagxo0q8soVbBxkl6EdoEnE+EQyOXoVrmcrNDd+Xxg8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766755042; c=relaxed/simple;
	bh=bxBw9WTqsdPsvVlLRGbxHJ6nYZczcf6QkHvZ/gvVMCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XUDYR8ckH51ZdsP2V1BfNs8wpW/iuVuoehnh2Wj2d2M6RmmeyUbsAaMtgnQ0wx2d2fBfbff9NVcnUqXtq3Y904108i9G6I/W7+KF7SU0yzYHUoV4wyIQMCyYetS9sbWUoQrk02uEOmCA2BPMKNbHJ+WRF+LxieJv+KtmkirSNUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aXQEcuUc; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso45694705e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 05:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766755037; x=1767359837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3nq+EYlL++mG/3TFa3FwRdzZI9jSs+tcNFo3bySgaV0=;
        b=aXQEcuUcMT5A8lSu0kC+TT8NCbneHcruXkkWaIsjDrVM3hiAPPgvC7bhAK83Hs+sXB
         +R+7lhC44/CbBJzgPblgpcuK36gEeAiXI4Ud++yY7CERdr2mg7fvfzDfSEPdadJohSoa
         leRBGSx1+mjBmq/U7nO1eA+dq8FX1CqCeDG2Oara9y9AvW0W1peB8a2H3CfGF02lO/o1
         8/WTMwsvh6XjmqI2NeS5dhkLfekYwAPMg/dOqZhdi4B0XgF4xcUom/fWTYjDzTH/LOn4
         eL2OA/m5q7VahaAUTGuRhUZEBnqNzxYX9Q8/Zby6OC4Q7TpNhzawQa7LZkp8hfLPFhBs
         AKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766755037; x=1767359837;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nq+EYlL++mG/3TFa3FwRdzZI9jSs+tcNFo3bySgaV0=;
        b=MVUBTvj3H2AaJKjCqTLjZjAS+R4jsqaS0ArWYYsf3TYjpEf9fwYBgT+Cc/qByw2Gz4
         Zcj8MNLPSCrW1AFshBwc3Kh7XHboXEJbZ2WseeBIM2K4yPU3zH/X0t75y95C5T/jnIhl
         W7r4hSA3vrz4NmZBBnbRJTUuyULyH6U4eFqB77Po44qBeWPKquAl7bJ96N1cZ1PWiBQC
         hLERW8jlQpZgWb8gmIUXksQg04JwLWu7kg5wgWHG3F4EJH00yhcocvntGzD+a3JiQlBb
         qzygoCgrl57YJOvQ2fK/wsMdVNkkb9dn2EFT3RsEhGtCAA5wDnPuMM899uHN/sJ//U3h
         oesA==
X-Forwarded-Encrypted: i=1; AJvYcCWpWuqv2wR5Ep4Lv/1bPf0zvjss0MeVkd6WFKAS36+NCQKUs7NzQeFZEEokKCQ2Fuzd4l4i2KOrUrQ/hwfg@vger.kernel.org
X-Gm-Message-State: AOJu0YxLKor5fYBQ4wdPqfA0VUaX0OH1baiGdpuj9ctkgr5Ys+M8LmZG
	z2w5R3dDT9fz2AjjPMmwnHoyITM21udeqITvV151gp/3f90o3IZNMwxi40cr/r/LPhE=
X-Gm-Gg: AY/fxX6frBEm1OJtuqeSED606fYdIQ/HoRAhEFo8H9AhdpDfASj4NGpJ+OA7opf34GR
	PP6a/kjRdBy4zx45CXRyl04NWhFGOffJx+KbmSqFXVlsW32dbKTF8ewzmO1Ukx+YU+3AGiPE8IO
	DXPW3CfWB9DL1pUAgWfwYeuSIT4RBfFEr/82VX6yGp9vZ20XawqOf7oImOjVIaJ0XoJYQ5uX+we
	cNa/VwMnlZUv7SFlA0eiYUqnUlosKd1Xgt63w54Ep71mOg5lw4DDF7j91/tvW9JHBL7NVAXNnlm
	dV+H0L+OveF0j2bLGYOmBKvQxYN1xBdSwU8LPNrcxSwGXHFjo/ZPDy2chq+NHjTOYn51XRmljpW
	vmZnm2BDAsGufm4jq7cWd7I1rkyIuVBHG0j8/yo7Hz9wns8Q3oqxD9WhjHJuzG5ycZrVPPIigF8
	Ielwf/kVVJWh+n0I1G
X-Google-Smtp-Source: AGHT+IGemvX5W+7cNu+/fYMuzoT9IV7eJMQ9HN7J6El6QbJ0mh0x3X7WIlEDnhHX9DTKeesGfgSayQ==
X-Received: by 2002:a05:600c:1d1d:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-47d19532f48mr217783085e9.5.1766755037373;
        Fri, 26 Dec 2025 05:17:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272e46fsm434235755e9.4.2025.12.26.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 05:17:17 -0800 (PST)
Date: Fri, 26 Dec 2025 16:17:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jie Gan <jie.gan@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
Message-ID: <202512251923.GDSbVal1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4@oss.qualcomm.com>

Hi Jie,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-Refactoring-ctcu_get_active_port-and-make-it-generic/20251224-171604
base:   47b7b5e32bb7264b51b89186043e1ada4090b558
patch link:    https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4%40oss.qualcomm.com
patch subject: [PATCH v9 2/8] coresight: tmc: add create/clean functions for etr_buf_list
config: arm-randconfig-r073-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251923.GDSbVal1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512251923.GDSbVal1-lkp@intel.com/

smatch warnings:
drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing freed memory 'new_node' (line 1991)
drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing zero to 'PTR_ERR'

vim +/new_node +1992 drivers/hwtracing/coresight/coresight-tmc-etr.c

34af91eeb7e78e Jie Gan 2025-12-24  1959  int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
34af91eeb7e78e Jie Gan 2025-12-24  1960  {
34af91eeb7e78e Jie Gan 2025-12-24  1961  	struct etr_buf_node *new_node;
34af91eeb7e78e Jie Gan 2025-12-24  1962  	struct etr_buf *sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1963  	int i = 0, ret = 0;
34af91eeb7e78e Jie Gan 2025-12-24  1964  
34af91eeb7e78e Jie Gan 2025-12-24  1965  	/* We dont need a list if there is only one node */
34af91eeb7e78e Jie Gan 2025-12-24  1966  	if (num_nodes < 2)
34af91eeb7e78e Jie Gan 2025-12-24  1967  		return -EINVAL;
34af91eeb7e78e Jie Gan 2025-12-24  1968  
34af91eeb7e78e Jie Gan 2025-12-24  1969  	/* We expect that sysfs_buf in drvdata has already been allocated. */
34af91eeb7e78e Jie Gan 2025-12-24  1970  	if (drvdata->sysfs_buf) {
34af91eeb7e78e Jie Gan 2025-12-24  1971  		/* Directly insert the allocated sysfs_buf into the list first */
34af91eeb7e78e Jie Gan 2025-12-24  1972  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
34af91eeb7e78e Jie Gan 2025-12-24  1973  		if (IS_ERR(new_node))
34af91eeb7e78e Jie Gan 2025-12-24  1974  			return PTR_ERR(new_node);
34af91eeb7e78e Jie Gan 2025-12-24  1975  
34af91eeb7e78e Jie Gan 2025-12-24  1976  		new_node->sysfs_buf = drvdata->sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1977  		new_node->is_free = false;
34af91eeb7e78e Jie Gan 2025-12-24  1978  		list_add(&new_node->node, &drvdata->etr_buf_list);
34af91eeb7e78e Jie Gan 2025-12-24  1979  		i++;
34af91eeb7e78e Jie Gan 2025-12-24  1980  	}
34af91eeb7e78e Jie Gan 2025-12-24  1981  
34af91eeb7e78e Jie Gan 2025-12-24  1982  	while (i < num_nodes) {
34af91eeb7e78e Jie Gan 2025-12-24  1983  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
34af91eeb7e78e Jie Gan 2025-12-24  1984  		if (IS_ERR(new_node)) {
34af91eeb7e78e Jie Gan 2025-12-24  1985  			ret = PTR_ERR(new_node);
34af91eeb7e78e Jie Gan 2025-12-24  1986  			break;
34af91eeb7e78e Jie Gan 2025-12-24  1987  		}
34af91eeb7e78e Jie Gan 2025-12-24  1988  
34af91eeb7e78e Jie Gan 2025-12-24  1989  		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
34af91eeb7e78e Jie Gan 2025-12-24  1990  		if (IS_ERR(sysfs_buf)) {
34af91eeb7e78e Jie Gan 2025-12-24 @1991  			kfree(new_node);
34af91eeb7e78e Jie Gan 2025-12-24 @1992  			ret = PTR_ERR(new_node);

s/new_node/sysfs_buf/

34af91eeb7e78e Jie Gan 2025-12-24  1993  			break;
34af91eeb7e78e Jie Gan 2025-12-24  1994  		}
34af91eeb7e78e Jie Gan 2025-12-24  1995  
34af91eeb7e78e Jie Gan 2025-12-24  1996  		/* We dont have a available sysfs_buf in drvdata, setup one */
34af91eeb7e78e Jie Gan 2025-12-24  1997  		if (!drvdata->sysfs_buf) {
34af91eeb7e78e Jie Gan 2025-12-24  1998  			drvdata->sysfs_buf = sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1999  			new_node->is_free = false;
34af91eeb7e78e Jie Gan 2025-12-24  2000  		} else
34af91eeb7e78e Jie Gan 2025-12-24  2001  			new_node->is_free = true;
34af91eeb7e78e Jie Gan 2025-12-24  2002  
34af91eeb7e78e Jie Gan 2025-12-24  2003  		new_node->sysfs_buf = sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  2004  		list_add(&new_node->node, &drvdata->etr_buf_list);
34af91eeb7e78e Jie Gan 2025-12-24  2005  		i++;
34af91eeb7e78e Jie Gan 2025-12-24  2006  	}
34af91eeb7e78e Jie Gan 2025-12-24  2007  
34af91eeb7e78e Jie Gan 2025-12-24  2008  	/* Clean the list if there is an error */
34af91eeb7e78e Jie Gan 2025-12-24  2009  	if (ret)
34af91eeb7e78e Jie Gan 2025-12-24  2010  		tmc_clean_etr_buf_list(drvdata);
34af91eeb7e78e Jie Gan 2025-12-24  2011  
34af91eeb7e78e Jie Gan 2025-12-24  2012  	return ret;
34af91eeb7e78e Jie Gan 2025-12-24  2013  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


