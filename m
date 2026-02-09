Return-Path: <linux-arm-msm+bounces-92351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNnHKJ4ximkPIQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 20:12:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F53113FD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 20:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB3F930247F5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 19:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4084413254;
	Mon,  9 Feb 2026 19:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bffKQ7QW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB9E3F23D7;
	Mon,  9 Feb 2026 19:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770664319; cv=none; b=ObBkHJ8BKYNVq8By7o8ixMK1HRACY8XUtEU66XJz2zpQyixwuRHc6oIh57RYlrYJlBfZjzEZXuonLUHnTchgU0QiYLhmoNCBEchMAL3ivEGm/UWIu/kdugaVBQlLSA8bYr0ENjw/tPfu67K/ykXO6V4oAL/i8dGWP0vTEx3e7nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770664319; c=relaxed/simple;
	bh=zR+Zs5URN3kh9VajH7r1F2ORsv8Ow7hJRaFQ/xw8DHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnkbOMmkh1LEVdXEuAk83FWggOQFCP6sJ6OiH9sCk3XF/mVC90Mrj2eVQNmpq634LzALDXNrqZD5y3ots/SRJTzq3WsqDEdFE3GdYJCjFTa7IkbqHZGB8LKnDu5bm0wWmQyX3ifhl7ao0yF8I5H/dWCsWtbbdJor8ySWT0S/k5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bffKQ7QW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770664319; x=1802200319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zR+Zs5URN3kh9VajH7r1F2ORsv8Ow7hJRaFQ/xw8DHg=;
  b=bffKQ7QWY3z/npHnkbi2OL5Cc487Hj5D3TgVAjm9IgpMGJg+pJmYowQo
   slOvpuXRHzQxE8owxxb2blm3fwbtfmO6M/Ky1+oIiHg0I2Vt1JUOlpqY2
   igXu2dRSX/R2qhTdbpyi6TB3ZZcSeamquoYloyOQLsXON+cs+Yyslcfhl
   T1bwH0fTu+qWVOwDMU3oJEeF21YG8bw3sDy/LCBFtQwOIvpqVaIHKQ435
   H1ac7N9qdATsBqM3FshXtYM6eiB6rsmRb+CFnyMlvvklv6QSXjtaMB7y6
   x6MUY1wV9+SdJq1ZjtP7C+7tBeTlkGEE1Wh+XhyZd54PHo0chwVLrrVj/
   A==;
X-CSE-ConnectionGUID: 3dn7LXgxQXq7J5dWlhy0AA==
X-CSE-MsgGUID: csB2vvbzTkmBSX2WOVt47A==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71684217"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71684217"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 11:11:58 -0800
X-CSE-ConnectionGUID: m71o2vQQR7yq8r6Iwm20Sw==
X-CSE-MsgGUID: 05QVkUVNSpS/0UAIJnP/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="210780646"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Feb 2026 11:11:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpWfo-00000000oGC-1lQM;
	Mon, 09 Feb 2026 19:11:52 +0000
Date: Tue, 10 Feb 2026 03:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, quic_mohamull@quicinc.com,
	quic_hbandi@quicinc.com, linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] Bluetooth: qca: add QCC2072 support
Message-ID: <202602100332.6QKGVLHq-lkp@intel.com>
References: <20260209070356.187301-2-vivek.sahu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209070356.187301-2-vivek.sahu@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92351-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,holtmann.org,gmail.com,kernel.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,git-scm.com:url,intel.com:mid,intel.com:dkim,intel.com:email,01.org:url]
X-Rspamd-Queue-Id: F1F53113FD2
X-Rspamd-Action: no action

Hi Vivek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on robh/for-next linus/master v6.19]
[cannot apply to bluetooth-next/master next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Sahu/Bluetooth-qca-add-QCC2072-support/20260209-150905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20260209070356.187301-2-vivek.sahu%40oss.qualcomm.com
patch subject: [PATCH v2 2/2] Bluetooth: qca: add QCC2072 support
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260210/202602100332.6QKGVLHq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100332.6QKGVLHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100332.6QKGVLHq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bluetooth/btqca.c: In function 'qca_uart_setup':
>> drivers/bluetooth/btqca.c:828:25: warning: this statement may fall through [-Wimplicit-fallthrough=]
     828 |                         snprintf(config.fwname, sizeof(config.fwname),
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     829 |                                  "qca/ornbtfw%02x.tlv", rom_ver);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btqca.c:830:17: note: here
     830 |                 case QCA_WCN3950:
         |                 ^~~~


vim +828 drivers/bluetooth/btqca.c

   782	
   783	int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
   784			   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
   785			   const char *firmware_name, const char *rampatch_name)
   786	{
   787		struct qca_fw_config config = {};
   788		const char *variant = "";
   789		int err;
   790		u8 rom_ver = 0;
   791		u32 soc_ver;
   792		u16 boardid = 0;
   793	
   794		bt_dev_dbg(hdev, "QCA setup on UART");
   795	
   796		soc_ver = get_soc_ver(ver.soc_id, ver.rom_ver);
   797	
   798		bt_dev_info(hdev, "QCA controller version 0x%08x", soc_ver);
   799	
   800		config.user_baud_rate = baudrate;
   801	
   802		/* Firmware files to download are based on ROM version.
   803		 * ROM version is derived from last two bytes of soc_ver.
   804		 */
   805		if (soc_type == QCA_WCN3988)
   806			rom_ver = ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver & 0x0000000f);
   807		else
   808			rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
   809	
   810		if (soc_type == QCA_WCN6750)
   811			qca_send_patch_config_cmd(hdev);
   812	
   813		/* Download rampatch file */
   814		config.type = TLV_TYPE_PATCH;
   815		if (rampatch_name) {
   816			snprintf(config.fwname, sizeof(config.fwname), "qca/%s", rampatch_name);
   817		} else {
   818			switch (soc_type) {
   819			case QCA_QCA2066:
   820				snprintf(config.fwname, sizeof(config.fwname),
   821					 "qca/hpbtfw%02x.tlv", rom_ver);
   822				break;
   823			case QCA_QCA6390:
   824				snprintf(config.fwname, sizeof(config.fwname),
   825					 "qca/htbtfw%02x.tlv", rom_ver);
   826				break;
   827			case QCA_QCC2072:
 > 828				snprintf(config.fwname, sizeof(config.fwname),
   829					 "qca/ornbtfw%02x.tlv", rom_ver);
   830			case QCA_WCN3950:
   831				snprintf(config.fwname, sizeof(config.fwname),
   832					 "qca/cmbtfw%02x.tlv", rom_ver);
   833				break;
   834			case QCA_WCN3990:
   835			case QCA_WCN3991:
   836			case QCA_WCN3998:
   837				snprintf(config.fwname, sizeof(config.fwname),
   838					 "qca/crbtfw%02x.tlv", rom_ver);
   839				break;
   840			case QCA_WCN3988:
   841				snprintf(config.fwname, sizeof(config.fwname),
   842					 "qca/apbtfw%02x.tlv", rom_ver);
   843				break;
   844			case QCA_WCN6750:
   845				/* Choose mbn file by default.If mbn file is not found
   846				 * then choose tlv file
   847				 */
   848				config.type = ELF_TYPE_PATCH;
   849				snprintf(config.fwname, sizeof(config.fwname),
   850					 "qca/msbtfw%02x.mbn", rom_ver);
   851				break;
   852			case QCA_WCN6855:
   853				snprintf(config.fwname, sizeof(config.fwname),
   854					 "qca/hpbtfw%02x.tlv", rom_ver);
   855				break;
   856			case QCA_WCN7850:
   857				snprintf(config.fwname, sizeof(config.fwname),
   858					 "qca/hmtbtfw%02x.tlv", rom_ver);
   859				break;
   860			default:
   861				snprintf(config.fwname, sizeof(config.fwname),
   862					 "qca/rampatch_%08x.bin", soc_ver);
   863			}
   864		}
   865	
   866		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
   867		if (err < 0) {
   868			bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
   869			return err;
   870		}
   871	
   872		/* Give the controller some time to get ready to receive the NVM */
   873		msleep(10);
   874	
   875		if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
   876			qca_read_fw_board_id(hdev, &boardid);
   877	
   878		/* Download NVM configuration */
   879		config.type = TLV_TYPE_NVM;
   880		if (firmware_name) {
   881			/* The firmware name has an extension, use it directly */
   882			if (qca_filename_has_extension(firmware_name)) {
   883				snprintf(config.fwname, sizeof(config.fwname), "qca/%s", firmware_name);
   884			} else {
   885				qca_read_fw_board_id(hdev, &boardid);
   886				qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
   887					 firmware_name, soc_type, ver, 0, boardid);
   888			}
   889		} else {
   890			switch (soc_type) {
   891			case QCA_QCA2066:
   892				qca_get_nvm_name_by_board(config.fwname,
   893					sizeof(config.fwname), "hpnv", soc_type, ver,
   894					rom_ver, boardid);
   895				break;
   896			case QCA_QCA6390:
   897				snprintf(config.fwname, sizeof(config.fwname),
   898					 "qca/htnv%02x.bin", rom_ver);
   899				break;
   900			case QCA_QCC2072:
   901				snprintf(config.fwname, sizeof(config.fwname),
   902					 "qca/ornnv%02x.bin", rom_ver);
   903				break;
   904			case QCA_WCN3950:
   905				if (le32_to_cpu(ver.soc_id) == QCA_WCN3950_SOC_ID_T)
   906					variant = "t";
   907				else if (le32_to_cpu(ver.soc_id) == QCA_WCN3950_SOC_ID_S)
   908					variant = "s";
   909	
   910				snprintf(config.fwname, sizeof(config.fwname),
   911					 "qca/cmnv%02x%s.bin", rom_ver, variant);
   912				break;
   913			case QCA_WCN3990:
   914			case QCA_WCN3991:
   915			case QCA_WCN3998:
   916				if (le32_to_cpu(ver.soc_id) == QCA_WCN3991_SOC_ID)
   917					variant = "u";
   918	
   919				snprintf(config.fwname, sizeof(config.fwname),
   920					 "qca/crnv%02x%s.bin", rom_ver, variant);
   921				break;
   922			case QCA_WCN3988:
   923				snprintf(config.fwname, sizeof(config.fwname),
   924					 "qca/apnv%02x.bin", rom_ver);
   925				break;
   926			case QCA_WCN6750:
   927				snprintf(config.fwname, sizeof(config.fwname),
   928					 "qca/msnv%02x.bin", rom_ver);
   929				break;
   930			case QCA_WCN6855:
   931				qca_read_fw_board_id(hdev, &boardid);
   932				qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
   933							  "hpnv", soc_type, ver, rom_ver, boardid);
   934				break;
   935			case QCA_WCN7850:
   936				qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
   937					 "hmtnv", soc_type, ver, rom_ver, boardid);
   938				break;
   939			default:
   940				snprintf(config.fwname, sizeof(config.fwname),
   941					 "qca/nvm_%08x.bin", soc_ver);
   942			}
   943		}
   944	
   945		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
   946		if (err < 0) {
   947			bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
   948			return err;
   949		}
   950	
   951		switch (soc_type) {
   952		case QCA_WCN3991:
   953		case QCA_QCA2066:
   954		case QCA_QCA6390:
   955		case QCA_WCN6750:
   956		case QCA_WCN6855:
   957		case QCA_WCN7850:
   958			err = qca_disable_soc_logging(hdev);
   959			if (err < 0)
   960				return err;
   961			break;
   962		default:
   963			break;
   964		}
   965	
   966		/* WCN399x and WCN6750 supports the Microsoft vendor extension with 0xFD70 as the
   967		 * VsMsftOpCode.
   968		 */
   969		switch (soc_type) {
   970		case QCA_WCN3950:
   971		case QCA_WCN3988:
   972		case QCA_WCN3990:
   973		case QCA_WCN3991:
   974		case QCA_WCN3998:
   975		case QCA_WCN6750:
   976			hci_set_msft_opcode(hdev, 0xFD70);
   977			break;
   978		default:
   979			break;
   980		}
   981	
   982		/* Perform HCI reset */
   983		err = qca_send_reset(hdev);
   984		if (err < 0) {
   985			bt_dev_err(hdev, "QCA Failed to run HCI_RESET (%d)", err);
   986			return err;
   987		}
   988	
   989		switch (soc_type) {
   990		case QCA_WCN3991:
   991		case QCA_WCN6750:
   992		case QCA_WCN6855:
   993		case QCA_WCN7850:
   994			/* get fw build info */
   995			err = qca_read_fw_build_info(hdev);
   996			if (err < 0)
   997				return err;
   998			break;
   999		default:
  1000			break;
  1001		}
  1002	
  1003		err = qca_check_bdaddr(hdev, &config);
  1004		if (err)
  1005			return err;
  1006	
  1007		bt_dev_info(hdev, "QCA setup on UART is completed");
  1008	
  1009		return 0;
  1010	}
  1011	EXPORT_SYMBOL_GPL(qca_uart_setup);
  1012	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

