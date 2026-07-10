Return-Path: <linux-arm-msm+bounces-118331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IddAOdMaUWrH/QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:16:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A19673C82D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:16:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="TZaFYX/M";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118331-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118331-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D35A302F739
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 16:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A6243C078;
	Fri, 10 Jul 2026 16:11:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B4346A08;
	Fri, 10 Jul 2026 16:11:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699903; cv=none; b=A71kA/ALtORvsNU7dCeI6hNdsU4jeUTNVLRvBxjkhB6AWas/JhyCU871Ag6g+JUhuhb+Tni9beuAVwqMUx+6YxN/KjJZTbun7WBxBIpAylnZ2vGT+b1dKq1AcDrbNjZyqiotEWY5f2Q2SFaBFR8gnbWiDemNcRUijPasaQST8aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699903; c=relaxed/simple;
	bh=c65AG8Fb0J78dDaq/KFS+loZXXo/NeYjm1p1ZmsckAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHL7UBLPNX4cVpMhoBcZVy7ePyOgvCRkbvNpkidyuWjhC3O0iVwHzSdb6Th85fSrlbxVLtkIEEFpv8WoXuUeBejRYDdNh1GwxdL/JC0S4q7uVa0T10x64TxzHT3O3TGops2zBEfD44X1eqfv8mSauYo0meYgC0jWaEk70v1Vc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZaFYX/M; arc=none smtp.client-ip=192.198.163.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783699887; x=1815235887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c65AG8Fb0J78dDaq/KFS+loZXXo/NeYjm1p1ZmsckAk=;
  b=TZaFYX/Mn8dsZxGI34rw4CeRPS5ZtRumFzzDB0+Pd3xwIZetQPLduIvc
   kKIdFBi9CP40/xq5LQC188GnHPTkY1awbTVqrwLJO2v3qVW1ZDvi7xp5T
   HgpqvjNLVS9PxrOevcxzXvfBRycXj+1l4yca8g97lcDDCvMQ628zQjcc2
   yig/HqxIVWT4FY06ZTjbLypvMPTT9aSqVxhUIV+EU1c3hGSHEU/GRmYn+
   n1dg6ITiZHXYO/p/FzUYRkmaxaM8Z1YyGIX5vCNlUsLtOh0EshaqhiKU6
   FzFVZnsOuuuhpEub7u7pvCmFLGGQtjgMZiP7zY2FfkEptWe29vXYVyEAR
   w==;
X-CSE-ConnectionGUID: r/7G6KTxQaagSpfSKGehQQ==
X-CSE-MsgGUID: pBdICf0TTlqStkkIY873bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95774468"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95774468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 09:11:21 -0700
X-CSE-ConnectionGUID: Kau5sVvQSN2Tia0KpcORow==
X-CSE-MsgGUID: 7JztQlF+Qiyw5/wot4xciA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250499475"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jul 2026 09:11:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiDop-00000000J5v-3XCv;
	Fri, 10 Jul 2026 16:11:15 +0000
Date: Sat, 11 Jul 2026 00:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, bjorn.andersson@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: Re: [PATCH] serial: qcom-geni: remove .pm callback, use runtime PM
 in startup/shutdown
Message-ID: <202607110008.JQ2vBeKC-lkp@intel.com>
References: <20260710-remove_uart_change_state-v1-1-8e8468da22a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-remove_uart_change_state-v1-1-8e8468da22a1@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118331-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andriy.shevchenko@linux.intel.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:email,intel.com:mid,intel.com:dkim,01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A19673C82D

Hi Praveen,

kernel test robot noticed the following build errors:

[auto build test ERROR on b9810cd75b9fb56a3425d391cba3f608502bd474]

url:    https://github.com/intel-lab-lkp/linux/commits/Praveen-Talari/serial-qcom-geni-remove-pm-callback-use-runtime-PM-in-startup-shutdown/20260710-173518
base:   b9810cd75b9fb56a3425d391cba3f608502bd474
patch link:    https://lore.kernel.org/r/20260710-remove_uart_change_state-v1-1-8e8468da22a1%40oss.qualcomm.com
patch subject: [PATCH] serial: qcom-geni: remove .pm callback, use runtime PM in startup/shutdown
config: loongarch-randconfig-002-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110008.JQ2vBeKC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110008.JQ2vBeKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110008.JQ2vBeKC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/qcom_geni_serial.c:1910:4: error: cannot jump from this goto statement to its label
    1910 |                         goto error;
         |                         ^
   drivers/tty/serial/qcom_geni_serial.c:1916:44: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1916 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
         |                                                   ^
   drivers/tty/serial/qcom_geni_serial.c:1901:3: error: cannot jump from this goto statement to its label
    1901 |                 goto error;
         |                 ^
   drivers/tty/serial/qcom_geni_serial.c:1916:44: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1916 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
         |                                                   ^
   drivers/tty/serial/qcom_geni_serial.c:1896:3: error: cannot jump from this goto statement to its label
    1896 |                 goto error;
         |                 ^
   drivers/tty/serial/qcom_geni_serial.c:1916:44: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1916 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
         |                                                   ^
   drivers/tty/serial/qcom_geni_serial.c:1872:3: error: cannot jump from this goto statement to its label
    1872 |                 goto error;
         |                 ^
   drivers/tty/serial/qcom_geni_serial.c:1916:44: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1916 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
         |                                                   ^
   drivers/tty/serial/qcom_geni_serial.c:1866:3: error: cannot jump from this goto statement to its label
    1866 |                 goto error;
         |                 ^
   drivers/tty/serial/qcom_geni_serial.c:1916:44: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1916 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
         |                                                   ^
   drivers/tty/serial/qcom_geni_serial.c:1857:4: error: cannot jump from this goto statement to its label
    1857 |                         goto error;
         |                         ^
   drivers/tty/serial/qcom_geni_serial.c:1916:44: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1916 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
         |                                                   ^
   drivers/tty/serial/qcom_geni_serial.c:1841:3: error: cannot jump from this goto statement to its label
    1841 |                 goto error;
         |                 ^
   drivers/tty/serial/qcom_geni_serial.c:1916:44: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1916 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
         |                                                   ^
   7 errors generated.


vim +1910 drivers/tty/serial/qcom_geni_serial.c

c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1792  
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1793  static int qcom_geni_serial_probe(struct platform_device *pdev)
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1794  {
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1795  	int ret = 0;
71581242164f11 Colin Ian King              2021-04-23  1796  	int line;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1797  	struct qcom_geni_serial_port *port;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1798  	struct uart_port *uport;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1799  	struct resource *res;
066cd1c4e4b9b4 Karthikeyan Ramasubramanian 2018-04-06  1800  	int irq;
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1801  	struct uart_driver *drv;
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1802  	const struct qcom_geni_device_data *data;
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1803  
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1804  	data = of_device_get_match_data(&pdev->dev);
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1805  	if (!data)
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1806  		return -EINVAL;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1807  
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1808  	if (data->console) {
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1809  		drv = &qcom_geni_console_driver;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1810  		line = of_alias_get_id(pdev->dev.of_node, "serial");
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1811  	} else {
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1812  		drv = &qcom_geni_uart_driver;
08b0adb1ae5456 Dmitry Baryshkov            2021-06-22  1813  		line = of_alias_get_id(pdev->dev.of_node, "serial");
08b0adb1ae5456 Dmitry Baryshkov            2021-06-22  1814  		if (line == -ENODEV) /* compat with non-standard aliases */
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1815  			line = of_alias_get_id(pdev->dev.of_node, "hsuart");
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  1816  	}
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1817  
c3e7966c60745f Zong Jiang                  2025-08-12  1818  	port = get_port_from_line(line, data->console, &pdev->dev);
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1819  	if (IS_ERR(port)) {
6a10635e90e8cb Karthikeyan Ramasubramanian 2018-05-03  1820  		dev_err(&pdev->dev, "Invalid line %d\n", line);
6a10635e90e8cb Karthikeyan Ramasubramanian 2018-05-03  1821  		return PTR_ERR(port);
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1822  	}
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1823  
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1824  	uport = &port->uport;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1825  	/* Don't allow 2 drivers to access the same port */
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1826  	if (uport->private_data)
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1827  		return -ENODEV;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1828  
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1829  	uport->dev = &pdev->dev;
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1830  	port->dev_data = data;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1831  	port->se.dev = &pdev->dev;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1832  	port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
4b2601ae3066da Praveen Talari              2025-07-21  1833  
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1834  	ret = port->dev_data->resources_init(uport);
4b2601ae3066da Praveen Talari              2025-07-21  1835  	if (ret)
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1836  		return ret;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1837  
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1838  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1839  	if (!res) {
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1840  		ret = -EINVAL;
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1841  		goto error;
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1842  	}
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1843  
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1844  	uport->mapbase = res->start;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1845  
4fcc287f3c6924 Anup Kulkarni               2025-06-03  1846  	uport->rs485_config = qcom_geni_rs485_config;
4fcc287f3c6924 Anup Kulkarni               2025-06-03  1847  	uport->rs485_supported = qcom_geni_rs485_supported;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1848  	port->tx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1849  	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1850  	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1851  
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1852  	if (!data->console) {
2aaa43c7077833 Bartosz Golaszewski         2022-12-29  1853  		port->rx_buf = devm_kzalloc(uport->dev,
2aaa43c7077833 Bartosz Golaszewski         2022-12-29  1854  					    DMA_RX_BUF_SIZE, GFP_KERNEL);
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1855  		if (!port->rx_buf) {
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1856  			ret = -ENOMEM;
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1857  			goto error;
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1858  		}
f9d690b6ece7ec satya priya                 2020-03-06  1859  	}
f9d690b6ece7ec satya priya                 2020-03-06  1860  
f3974413cf0209 Akash Asthana               2020-01-06  1861  	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
f3974413cf0209 Akash Asthana               2020-01-06  1862  			"qcom_geni_serial_%s%d",
f3974413cf0209 Akash Asthana               2020-01-06  1863  			uart_console(uport) ? "console" : "uart", uport->line);
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1864  	if (!port->name) {
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1865  		ret = -ENOMEM;
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1866  		goto error;
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1867  	}
f3974413cf0209 Akash Asthana               2020-01-06  1868  
066cd1c4e4b9b4 Karthikeyan Ramasubramanian 2018-04-06  1869  	irq = platform_get_irq(pdev, 0);
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1870  	if (irq < 0) {
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1871  		ret = irq;
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1872  		goto error;
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1873  	}
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1874  
066cd1c4e4b9b4 Karthikeyan Ramasubramanian 2018-04-06  1875  	uport->irq = irq;
8f122698a64b87 Dmitry Safonov              2019-12-13  1876  	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1877  
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1878  	if (!data->console)
f3974413cf0209 Akash Asthana               2020-01-06  1879  		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
f3974413cf0209 Akash Asthana               2020-01-06  1880  
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1881  	if (of_property_read_bool(pdev->dev.of_node, "rx-tx-swap"))
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1882  		port->rx_tx_swap = true;
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1883  
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1884  	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1885  		port->cts_rts_swap = true;
9fa3c4b1fa379f Roja Rani Yarubandi         2020-03-04  1886  
e42d6c3ec0c7ad Douglas Anderson            2020-06-26  1887  	port->private_data.drv = drv;
e42d6c3ec0c7ad Douglas Anderson            2020-06-26  1888  	uport->private_data = &port->private_data;
f3974413cf0209 Akash Asthana               2020-01-06  1889  	platform_set_drvdata(pdev, port);
f3974413cf0209 Akash Asthana               2020-01-06  1890  
3e4aaea7a0391d Akash Asthana               2019-10-10  1891  	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
3e4aaea7a0391d Akash Asthana               2019-10-10  1892  	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
3e4aaea7a0391d Akash Asthana               2019-10-10  1893  			IRQF_TRIGGER_HIGH, port->name, uport);
3e4aaea7a0391d Akash Asthana               2019-10-10  1894  	if (ret) {
3e4aaea7a0391d Akash Asthana               2019-10-10  1895  		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1896  		goto error;
3e4aaea7a0391d Akash Asthana               2019-10-10  1897  	}
3e4aaea7a0391d Akash Asthana               2019-10-10  1898  
4fcc287f3c6924 Anup Kulkarni               2025-06-03  1899  	ret = uart_get_rs485_mode(uport);
4fcc287f3c6924 Anup Kulkarni               2025-06-03  1900  	if (ret)
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1901  		goto error;
4fcc287f3c6924 Anup Kulkarni               2025-06-03  1902  
f3974413cf0209 Akash Asthana               2020-01-06  1903  	if (port->wakeup_irq > 0) {
f3974413cf0209 Akash Asthana               2020-01-06  1904  		device_init_wakeup(&pdev->dev, true);
f3974413cf0209 Akash Asthana               2020-01-06  1905  		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
8b7103f3195044 Akash Asthana               2019-10-10  1906  						port->wakeup_irq);
8b7103f3195044 Akash Asthana               2019-10-10  1907  		if (ret) {
f3974413cf0209 Akash Asthana               2020-01-06  1908  			device_init_wakeup(&pdev->dev, false);
a53be6945f5123 Viken Dadhaniya             2025-03-27  1909  			ida_free(&port_ida, uport->line);
abffd1e6c4f1c9 Praveen Talari              2025-11-10 @1910  			goto error;
8b7103f3195044 Akash Asthana               2019-10-10  1911  		}
8b7103f3195044 Akash Asthana               2019-10-10  1912  	}
f3974413cf0209 Akash Asthana               2020-01-06  1913  
fb47423dc7bf43 Praveen Talari              2026-01-08  1914  	devm_pm_runtime_enable(port->se.dev);
fb47423dc7bf43 Praveen Talari              2026-01-08  1915  
3db863266714a9 Praveen Talari              2026-07-10  1916  	PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
3db863266714a9 Praveen Talari              2026-07-10  1917  	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
3db863266714a9 Praveen Talari              2026-07-10  1918  	if (ret < 0) {
3db863266714a9 Praveen Talari              2026-07-10  1919  		dev_err(uport->dev, "Failed to resume and get %d\n", ret);
3db863266714a9 Praveen Talari              2026-07-10  1920  		goto error;
3db863266714a9 Praveen Talari              2026-07-10  1921  	}
3db863266714a9 Praveen Talari              2026-07-10  1922  
fb47423dc7bf43 Praveen Talari              2026-01-08  1923  	ret = uart_add_one_port(drv, uport);
fb47423dc7bf43 Praveen Talari              2026-01-08  1924  	if (ret)
fb47423dc7bf43 Praveen Talari              2026-01-08  1925  		goto error;
fb47423dc7bf43 Praveen Talari              2026-01-08  1926  
f3974413cf0209 Akash Asthana               2020-01-06  1927  	return 0;
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1928  
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1929  error:
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1930  	dev_pm_domain_detach_list(port->pd_list);
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1931  	return ret;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1932  }
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1933  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

