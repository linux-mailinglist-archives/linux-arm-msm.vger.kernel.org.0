Return-Path: <linux-arm-msm+bounces-80005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8C8C2843A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 18:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B7571349D12
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 17:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BAFC284881;
	Sat,  1 Nov 2025 17:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANeYj3Wh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BCE2727FE;
	Sat,  1 Nov 2025 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762019380; cv=none; b=LkTzUtNQlWm/PUcWykeTilqslsWw+woewmVhjWx+qDQF0C25B+7KX2Yw3rFTNOcgE5L1BLYJ8WAGxMTfoYMX+C5rRx1IajK+g7f0u8ryJh6BUurLd3RfWp5bTQzYvUVs3ff02Ev14/0sTxGNj6uFJW1tPWVbO7Wp2Daf/vpZzMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762019380; c=relaxed/simple;
	bh=STJfZC4xcxEFfqOX9MMvUBGdnPrvSDkpD7JN9k8B7+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7Lz2oKBRnTwF5vd6wl5Ov0wzRuX0bghNOA70NJp3p4pjJCi6IfrWJHmoTWYX95Z1Ygf7CjHCHt/EMLPuth/vLhZVN13SMmNN6hYnTN6zZ6lt8J6kfXFLk1pc+xxSSBeBALxcAHoIB1Rz92czmBjwYiQj7aQo3Htspk3OCJtTWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANeYj3Wh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762019379; x=1793555379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=STJfZC4xcxEFfqOX9MMvUBGdnPrvSDkpD7JN9k8B7+4=;
  b=ANeYj3Wh8WYn6tNcpeghd8wEdyEtkaxku5bsCz40D+1HPLaWMFJnhAWu
   CfHEWIMiPmSKPHecqWvJuDXWxspsoHPnGZ1R+YQ9w0OW5609W+WqIYAsM
   +H6WEnMrD/ZEzwzWLkzSIyiOZNEF5oIokTH9an+uarR4D8jrxODFLl2s7
   NH3Fdf6tMUKfWlvdLbJcIKhvbE+ILRU+Hy6+UbYcjWL+RKDzLiGLhyHms
   3F6738Nj4DfcSftfn5oID0DO/VdfdxN32yA3J0sNxyk4cK3EphMS7mJ11
   OqeJrY+3QDgzgd7M3uUHZuVYl58WgW5gR/j5d0KRedV3jIsJENHbsxFRr
   g==;
X-CSE-ConnectionGUID: iJ8yGcZ8TFWIELy/188GKw==
X-CSE-MsgGUID: tzaOckKFQ2SDWEjRvp4sKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="86782628"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="86782628"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 10:49:38 -0700
X-CSE-ConnectionGUID: kNPxTVj4RsiI+ZJ1UFFCTw==
X-CSE-MsgGUID: bsHgchHtRf2RBC5/w+vnQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186165479"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Nov 2025 10:49:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFFjI-000OXW-17;
	Sat, 01 Nov 2025 17:49:32 +0000
Date: Sun, 2 Nov 2025 01:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
Subject: Re: [PATCH v2 4/7] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <202511020129.b8wpSSt0-lkp@intel.com>
References: <20251029-knp-remoteproc-v2-4-6c81993b52ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-knp-remoteproc-v2-4-6c81993b52ea@oss.qualcomm.com>

Hi Jingyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on aaa9c3550b60d6259d6ea8b1175ade8d1242444e]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/dt-bindings-remoteproc-qcom-sm8550-pas-Add-Kaanapali-ADSP/20251029-163330
base:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
patch link:    https://lore.kernel.org/r/20251029-knp-remoteproc-v2-4-6c81993b52ea%40oss.qualcomm.com
patch subject: [PATCH v2 4/7] remoteproc: qcom: pas: Add late attach support for subsystems
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20251102/202511020129.b8wpSSt0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cc271437553452ede002d871d32abc02084341a8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020129.b8wpSSt0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020129.b8wpSSt0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/remoteproc/qcom_q6v5_wcss.c:1018:84: error: too few arguments to function call, expected 7, have 6
    1018 |         ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
         |               ~~~~~~~~~~~~~~                                                              ^
   drivers/remoteproc/qcom_q6v5.h:55:5: note: 'qcom_q6v5_init' declared here
      55 | int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
         |     ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      56 |                    struct rproc *rproc, int crash_reason, const char *load_state,
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      57 |                    bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5));
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1018 drivers/remoteproc/qcom_q6v5_wcss.c

0af65b9b915e52 Govind Singh          2021-01-29   971  
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   972  static int q6v5_wcss_probe(struct platform_device *pdev)
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   973  {
6549f42c3d1795 Govind Singh          2021-01-29   974  	const struct wcss_data *desc;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   975  	struct q6v5_wcss *wcss;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   976  	struct rproc *rproc;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   977  	int ret;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   978  
6549f42c3d1795 Govind Singh          2021-01-29   979  	desc = device_get_match_data(&pdev->dev);
6549f42c3d1795 Govind Singh          2021-01-29   980  	if (!desc)
6549f42c3d1795 Govind Singh          2021-01-29   981  		return -EINVAL;
6549f42c3d1795 Govind Singh          2021-01-29   982  
41854ea92baad3 Andrew Davis          2024-01-23   983  	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, desc->ops,
6549f42c3d1795 Govind Singh          2021-01-29   984  				 desc->firmware_name, sizeof(*wcss));
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   985  	if (!rproc) {
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   986  		dev_err(&pdev->dev, "failed to allocate rproc\n");
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   987  		return -ENOMEM;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   988  	}
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   989  
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   990  	wcss = rproc->priv;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   991  	wcss->dev = &pdev->dev;
0af65b9b915e52 Govind Singh          2021-01-29   992  
0af65b9b915e52 Govind Singh          2021-01-29   993  	wcss->version = desc->version;
0af65b9b915e52 Govind Singh          2021-01-29   994  	wcss->requires_force_stop = desc->requires_force_stop;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   995  
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   996  	ret = q6v5_wcss_init_mmio(wcss, pdev);
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   997  	if (ret)
41854ea92baad3 Andrew Davis          2024-01-23   998  		return ret;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07   999  
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1000  	ret = q6v5_alloc_memory_region(wcss);
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1001  	if (ret)
41854ea92baad3 Andrew Davis          2024-01-23  1002  		return ret;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1003  
0af65b9b915e52 Govind Singh          2021-01-29  1004  	if (wcss->version == WCSS_QCS404) {
0af65b9b915e52 Govind Singh          2021-01-29  1005  		ret = q6v5_wcss_init_clock(wcss);
0af65b9b915e52 Govind Singh          2021-01-29  1006  		if (ret)
41854ea92baad3 Andrew Davis          2024-01-23  1007  			return ret;
0af65b9b915e52 Govind Singh          2021-01-29  1008  
0af65b9b915e52 Govind Singh          2021-01-29  1009  		ret = q6v5_wcss_init_regulator(wcss);
0af65b9b915e52 Govind Singh          2021-01-29  1010  		if (ret)
41854ea92baad3 Andrew Davis          2024-01-23  1011  			return ret;
0af65b9b915e52 Govind Singh          2021-01-29  1012  	}
0af65b9b915e52 Govind Singh          2021-01-29  1013  
0af65b9b915e52 Govind Singh          2021-01-29  1014  	ret = q6v5_wcss_init_reset(wcss, desc);
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1015  	if (ret)
41854ea92baad3 Andrew Davis          2024-01-23  1016  		return ret;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1017  
c1fe10d238c025 Sibi Sankar           2021-09-16 @1018  	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1019  	if (ret)
41854ea92baad3 Andrew Davis          2024-01-23  1020  		return ret;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1021  
25f9f5a2107fdc Bjorn Andersson       2020-05-14  1022  	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, "q6wcss");
5b9f51b200dcb2 Dmitry Baryshkov      2024-06-22  1023  	qcom_add_pdm_subdev(rproc, &wcss->pdm_subdev);
8a226e2c71bb37 Sivaprakash Murugesan 2020-05-01  1024  	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, "q6wcss");
8a226e2c71bb37 Sivaprakash Murugesan 2020-05-01  1025  
60e7c43e61c9a6 Joe Hattori           2024-11-08  1026  	if (desc->ssctl_id) {
0af65b9b915e52 Govind Singh          2021-01-29  1027  		wcss->sysmon = qcom_add_sysmon_subdev(rproc,
0af65b9b915e52 Govind Singh          2021-01-29  1028  						      desc->sysmon_name,
0af65b9b915e52 Govind Singh          2021-01-29  1029  						      desc->ssctl_id);
60e7c43e61c9a6 Joe Hattori           2024-11-08  1030  		if (IS_ERR(wcss->sysmon)) {
60e7c43e61c9a6 Joe Hattori           2024-11-08  1031  			ret = PTR_ERR(wcss->sysmon);
60e7c43e61c9a6 Joe Hattori           2024-11-08  1032  			goto deinit_remove_subdevs;
60e7c43e61c9a6 Joe Hattori           2024-11-08  1033  		}
60e7c43e61c9a6 Joe Hattori           2024-11-08  1034  	}
0af65b9b915e52 Govind Singh          2021-01-29  1035  
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1036  	ret = rproc_add(rproc);
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1037  	if (ret)
60e7c43e61c9a6 Joe Hattori           2024-11-08  1038  		goto remove_sysmon_subdev;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1039  
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1040  	platform_set_drvdata(pdev, rproc);
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1041  
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1042  	return 0;
60e7c43e61c9a6 Joe Hattori           2024-11-08  1043  
60e7c43e61c9a6 Joe Hattori           2024-11-08  1044  remove_sysmon_subdev:
60e7c43e61c9a6 Joe Hattori           2024-11-08  1045  	if (desc->ssctl_id)
60e7c43e61c9a6 Joe Hattori           2024-11-08  1046  		qcom_remove_sysmon_subdev(wcss->sysmon);
60e7c43e61c9a6 Joe Hattori           2024-11-08  1047  deinit_remove_subdevs:
60e7c43e61c9a6 Joe Hattori           2024-11-08  1048  	qcom_q6v5_deinit(&wcss->q6v5);
60e7c43e61c9a6 Joe Hattori           2024-11-08  1049  	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
60e7c43e61c9a6 Joe Hattori           2024-11-08  1050  	qcom_remove_pdm_subdev(rproc, &wcss->pdm_subdev);
60e7c43e61c9a6 Joe Hattori           2024-11-08  1051  	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
60e7c43e61c9a6 Joe Hattori           2024-11-08  1052  	return ret;
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1053  }
3a3d4163e0bfde Sricharan Ramabadhran 2018-06-07  1054  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

