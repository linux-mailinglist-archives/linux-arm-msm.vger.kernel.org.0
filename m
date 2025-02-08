Return-Path: <linux-arm-msm+bounces-47242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3041EA2D829
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 19:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F6AF3A5B3D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 18:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B69F19DF6A;
	Sat,  8 Feb 2025 18:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWdnkHCi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2D317ADE8;
	Sat,  8 Feb 2025 18:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739041130; cv=none; b=p22NX9ER4EfqlXTzS/I/zc/Cl9a79ODM9dk6ONfVddSRMsSD0Wkbjn09PZNYvsv9YPWiD60wyjqDPDwiJzD6N5Xwi66IYg+eTDl+1CBKqZfbdgN5QdV2JPUPoF+sZa0o70T5XDPat3RAFK0nmVwDqeoDxDdQ8YXWy9lOvqqsvm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739041130; c=relaxed/simple;
	bh=WbZ0hbTVYx/mSIb3Za2bBc+5S6gAqWODblg6AScJPwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rqbn1DHqDhZ9Yn25v9MLxF1ttD78iADxdPz7+n7l5vq6+l19+nFrZhZqTOGVk1yKHlwEgj8gxh3EsjLJBRwJM21v3yXCm55+VgSDACKjkyw1SLuZvd3IcUvI128VYjHclo4AwGm8HXqhjfOEwoiXVJvc37uq6g/fq4EJ7YRdpc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWdnkHCi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739041129; x=1770577129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WbZ0hbTVYx/mSIb3Za2bBc+5S6gAqWODblg6AScJPwA=;
  b=IWdnkHCi8eiAo0wJfGgU1HHRC59tkMnuDJOK9IzIe5u8MwLRoBVpz7Id
   j0wT4tFtpOcCQoBS3SZtXK1QUg60FxPxlGVDEXvN0Sg0+kaz1uDQ3z2Q/
   BZqmwevTl1Bjo9gzJHXDQnOw/94aXqc7GIeRLgamzbEPxZVFEmmeu2tcH
   3UGYtaiuS85C5hTq5zIUO3pkxRUP/HxMULVnQt6eBacWMFa0Zr/8V8Q1P
   mOj6adq0ctqlzIUDXmmotjL38+WIUhO/QtPrpjg51A2XYIAekp72QLOrd
   SFDG7bjLdte4xlc+D2hrENffSUrkv6VKzSoyOp6E4N6zpgIc3dgFXXAF5
   g==;
X-CSE-ConnectionGUID: hl0lNl30Q7OAyAb5nhuENQ==
X-CSE-MsgGUID: r9m3afJQQAaz+mdyxXqDaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="49903145"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="49903145"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 10:58:48 -0800
X-CSE-ConnectionGUID: HfjdxAuIT7CFiQv4RByAGg==
X-CSE-MsgGUID: 9PZQPT0sS1Cz52H3vZKq4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="116859948"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Feb 2025 10:58:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgq2M-0010WF-1w;
	Sat, 08 Feb 2025 18:58:42 +0000
Date: Sun, 9 Feb 2025 02:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: fix broken config in
 qcom_param_page_type_exec
Message-ID: <202502090258.EVrsPFF7-lkp@intel.com>
References: <20250207195442.19157-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207195442.19157-1-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on mani-mhi/mhi-next linus/master v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/mtd-rawnand-qcom-fix-broken-config-in-qcom_param_page_type_exec/20250208-035717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20250207195442.19157-1-ansuelsmth%40gmail.com
patch subject: [PATCH] mtd: rawnand: qcom: fix broken config in qcom_param_page_type_exec
config: sh-randconfig-r133-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090258.EVrsPFF7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502090258.EVrsPFF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090258.EVrsPFF7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/qcom_nandc.c:1884:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1884:27: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:1884:27: sparse:     got unsigned long
>> drivers/mtd/nand/raw/qcom_nandc.c:1889:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg1 @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1889:27: sparse:     expected restricted __le32 [usertype] cfg1
   drivers/mtd/nand/raw/qcom_nandc.c:1889:27: sparse:     got unsigned long

vim +1884 drivers/mtd/nand/raw/qcom_nandc.c

  1857	
  1858	static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_subop *subop)
  1859	{
  1860		struct qcom_nand_host *host = to_qcom_nand_host(chip);
  1861		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
  1862		struct qcom_op q_op = {};
  1863		const struct nand_op_instr *instr = NULL;
  1864		unsigned int op_id = 0;
  1865		unsigned int len = 0;
  1866		int ret;
  1867	
  1868		ret = qcom_parse_instructions(chip, subop, &q_op);
  1869		if (ret)
  1870			return ret;
  1871	
  1872		q_op.cmd_reg |= cpu_to_le32(PAGE_ACC | LAST_PAGE);
  1873	
  1874		nandc->buf_count = 0;
  1875		nandc->buf_start = 0;
  1876		host->use_ecc = false;
  1877		qcom_clear_read_regs(nandc);
  1878		qcom_clear_bam_transaction(nandc);
  1879	
  1880		nandc->regs->cmd = q_op.cmd_reg;
  1881		nandc->regs->addr0 = 0;
  1882		nandc->regs->addr1 = 0;
  1883	
> 1884		nandc->regs->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
  1885				    FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
  1886				    FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
  1887				    FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
  1888	
> 1889		nandc->regs->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
  1890				    FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
  1891				    FIELD_PREP(CS_ACTIVE_BSY, 0) |
  1892				    FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
  1893				    FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
  1894				    FIELD_PREP(WIDE_FLASH, 0) |
  1895				    FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
  1896	
  1897		if (!nandc->props->qpic_version2)
  1898			nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
  1899	
  1900		/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
  1901		if (!nandc->props->qpic_version2) {
  1902			nandc->regs->vld = cpu_to_le32((nandc->vld & ~READ_START_VLD));
  1903			nandc->regs->cmd1 = cpu_to_le32((nandc->cmd1 & ~(0xFF << READ_ADDR))
  1904					    | NAND_CMD_PARAM << READ_ADDR);
  1905		}
  1906	
  1907		nandc->regs->exec = cpu_to_le32(1);
  1908	
  1909		if (!nandc->props->qpic_version2) {
  1910			nandc->regs->orig_cmd1 = cpu_to_le32(nandc->cmd1);
  1911			nandc->regs->orig_vld = cpu_to_le32(nandc->vld);
  1912		}
  1913	
  1914		instr = q_op.data_instr;
  1915		op_id = q_op.data_instr_idx;
  1916		len = nand_subop_get_data_len(subop, op_id);
  1917	
  1918		nandc_set_read_loc(chip, 0, 0, 0, len, 1);
  1919	
  1920		if (!nandc->props->qpic_version2) {
  1921			qcom_write_reg_dma(nandc, &nandc->regs->vld, NAND_DEV_CMD_VLD, 1, 0);
  1922			qcom_write_reg_dma(nandc, &nandc->regs->cmd1, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
  1923		}
  1924	
  1925		nandc->buf_count = len;
  1926		memset(nandc->data_buffer, 0xff, nandc->buf_count);
  1927	
  1928		config_nand_single_cw_page_read(chip, false, 0);
  1929	
  1930		qcom_read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
  1931				   nandc->buf_count, 0);
  1932	
  1933		/* restore CMD1 and VLD regs */
  1934		if (!nandc->props->qpic_version2) {
  1935			qcom_write_reg_dma(nandc, &nandc->regs->orig_cmd1, NAND_DEV_CMD1_RESTORE, 1, 0);
  1936			qcom_write_reg_dma(nandc, &nandc->regs->orig_vld, NAND_DEV_CMD_VLD_RESTORE, 1,
  1937					   NAND_BAM_NEXT_SGL);
  1938		}
  1939	
  1940		ret = qcom_submit_descs(nandc);
  1941		if (ret) {
  1942			dev_err(nandc->dev, "failure in submitting param page descriptor\n");
  1943			goto err_out;
  1944		}
  1945	
  1946		ret = qcom_wait_rdy_poll(chip, q_op.rdy_timeout_ms);
  1947		if (ret)
  1948			goto err_out;
  1949	
  1950		memcpy(instr->ctx.data.buf.in, nandc->data_buffer, len);
  1951	
  1952	err_out:
  1953		return ret;
  1954	}
  1955	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

