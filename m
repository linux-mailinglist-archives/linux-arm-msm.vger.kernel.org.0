Return-Path: <linux-arm-msm+bounces-92365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPCyANWIimmPLgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:24:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF5115F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7A3F300D33A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 01:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D54257849;
	Tue, 10 Feb 2026 01:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxZgKlNZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DED248F47;
	Tue, 10 Feb 2026 01:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770686657; cv=none; b=f3XjnQxEcqiYRZiYqCL9FU0XCd0HGVfi9py7Zu1mod7kPMyrAfH2UjESmGHCJfIM9ShmpdEI2X5c7Q+rmy48TikG+oG3RyRCBMuJVbSR7Peg+38BbdP47NLM09A9tzOWqtLhhZvtrLb83/lyKaFJV2z9bPIvXls27BRv++Ddl74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770686657; c=relaxed/simple;
	bh=PvVwudmtPtjsX5UGyZSa5MCCsZnjurcZGYxWo/bgphY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIy6XxfvW2DuxfWNYT8qjRce/vuSbKl1DXopzKBKUxnO4vVq0WeL/4VP6Hg/rQaWwSTN2VYup3W3brdb0hAIBXucjJ2Ftilug+na0b72HGbgguTscAkWTmv0QA7XNggN4kWQ7TkP1dZwugjGMi4/It1JS62NXUDVweQN0Q0vdAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxZgKlNZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770686655; x=1802222655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PvVwudmtPtjsX5UGyZSa5MCCsZnjurcZGYxWo/bgphY=;
  b=CxZgKlNZbYukUqhGElF6iTRnpfI5BnLlYTZI5Ogq3TOcMbUCrhSkVlWB
   LzApT1QbNtgZ8QUsDoEjw7Z9Mq+wZ9j4/ovwz6jH1mAi11QnB22ozAEYf
   j3B162S+iwrhxxD3Q+jv0/STykoasUennpwWpDBpzsDG2j4d8gUo9RCw6
   ++ah2lC0WXnqNdBSV9Sp2CdNllkdSRM/BN0eh5Yl5lmzxqq8qKx3UmxFB
   ACIm3rVXMsZAk0mgnSzokNRl2wmHbzA02MKzxLkf4olOWqRvUM35w8g1r
   HBJc9reVeGRCV/ZMA7lxpbYaaE6GTgjMC/H3FFza3773DDCzb47Wd9WPU
   g==;
X-CSE-ConnectionGUID: Y+sSw/jVTLOAHCDcoWmIew==
X-CSE-MsgGUID: LWuw1pdsQviUlhviNmwy7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83179838"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83179838"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 17:24:14 -0800
X-CSE-ConnectionGUID: VHgs0qttSjSFC5/I06D6MA==
X-CSE-MsgGUID: 0TO677yTS66fSIKNkE1tNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216275893"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2026 17:24:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpcU2-00000000oUS-1Nar;
	Tue, 10 Feb 2026 01:24:06 +0000
Date: Tue, 10 Feb 2026 09:23:31 +0800
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
Message-ID: <202602100949.3T4kUNgD-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92365-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,holtmann.org,gmail.com,kernel.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 95EF5115F70
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260210/202602100949.3T4kUNgD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100949.3T4kUNgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100949.3T4kUNgD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/btqca.c:830:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     830 |                 case QCA_WCN3950:
         |                 ^
   drivers/bluetooth/btqca.c:830:3: note: insert '__attribute__((fallthrough));' to silence this warning
     830 |                 case QCA_WCN3950:
         |                 ^
         |                 __attribute__((fallthrough)); 
   drivers/bluetooth/btqca.c:830:3: note: insert 'break;' to avoid fall-through
     830 |                 case QCA_WCN3950:
         |                 ^
         |                 break; 
   1 warning generated.


vim +830 drivers/bluetooth/btqca.c

e41137d8bd1a8e Zijun Hu                       2024-04-17   782  
aadebac4639d84 Balakrishna Godavarthi         2018-08-03   783  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
059924fdf6c1c3 Venkata Lakshmi Narayana Gubba 2020-11-19   784  		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
30209aeff75fe1 Cheng Jiang                    2025-01-07   785  		   const char *firmware_name, const char *rampatch_name)
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   786  {
dd336649ba8978 Johan Hovold                   2024-04-30   787  	struct qca_fw_config config = {};
1cc41b5092e3aa Dmitry Baryshkov               2025-02-07   788  	const char *variant = "";
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   789  	int err;
523760b7ff8871 Harish Bandi                   2019-04-26   790  	u8 rom_ver = 0;
059924fdf6c1c3 Venkata Lakshmi Narayana Gubba 2020-11-19   791  	u32 soc_ver;
a7f8dedb4be2cc Tim Jiang                      2023-09-12   792  	u16 boardid = 0;
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   793  
ba493d4fbcb84b Balakrishna Godavarthi         2018-08-03   794  	bt_dev_dbg(hdev, "QCA setup on UART");
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   795  
059924fdf6c1c3 Venkata Lakshmi Narayana Gubba 2020-11-19   796  	soc_ver = get_soc_ver(ver.soc_id, ver.rom_ver);
059924fdf6c1c3 Venkata Lakshmi Narayana Gubba 2020-11-19   797  
059924fdf6c1c3 Venkata Lakshmi Narayana Gubba 2020-11-19   798  	bt_dev_info(hdev, "QCA controller version 0x%08x", soc_ver);
059924fdf6c1c3 Venkata Lakshmi Narayana Gubba 2020-11-19   799  
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   800  	config.user_baud_rate = baudrate;
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   801  
4219d4686875fd Balakrishna Godavarthi         2018-08-03   802  	/* Firmware files to download are based on ROM version.
4219d4686875fd Balakrishna Godavarthi         2018-08-03   803  	 * ROM version is derived from last two bytes of soc_ver.
4219d4686875fd Balakrishna Godavarthi         2018-08-03   804  	 */
f904feefe60c28 Luca Weiss                     2023-08-02   805  	if (soc_type == QCA_WCN3988)
f904feefe60c28 Luca Weiss                     2023-08-02   806  		rom_ver = ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver & 0x0000000f);
f904feefe60c28 Luca Weiss                     2023-08-02   807  	else
99fba8e3f1d1fd Venkata Lakshmi Narayana Gubba 2021-05-18   808  		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
99fba8e3f1d1fd Venkata Lakshmi Narayana Gubba 2021-05-18   809  
4fac8a7ac80b18 Sai Teja Aluvala               2022-01-07   810  	if (soc_type == QCA_WCN6750)
4fac8a7ac80b18 Sai Teja Aluvala               2022-01-07   811  		qca_send_patch_config_cmd(hdev);
4fac8a7ac80b18 Sai Teja Aluvala               2022-01-07   812  
99fba8e3f1d1fd Venkata Lakshmi Narayana Gubba 2021-05-18   813  	/* Download rampatch file */
99fba8e3f1d1fd Venkata Lakshmi Narayana Gubba 2021-05-18   814  	config.type = TLV_TYPE_PATCH;
30209aeff75fe1 Cheng Jiang                    2025-01-07   815  	if (rampatch_name) {
30209aeff75fe1 Cheng Jiang                    2025-01-07   816  		snprintf(config.fwname, sizeof(config.fwname), "qca/%s", rampatch_name);
30209aeff75fe1 Cheng Jiang                    2025-01-07   817  	} else {
691d54d0f7cb14 Neil Armstrong                 2023-08-16   818  		switch (soc_type) {
5590323f5a3811 Vivek Sahu                     2026-02-09   819  		case QCA_QCA2066:
5590323f5a3811 Vivek Sahu                     2026-02-09   820  			snprintf(config.fwname, sizeof(config.fwname),
5590323f5a3811 Vivek Sahu                     2026-02-09   821  				 "qca/hpbtfw%02x.tlv", rom_ver);
5590323f5a3811 Vivek Sahu                     2026-02-09   822  			break;
5590323f5a3811 Vivek Sahu                     2026-02-09   823  		case QCA_QCA6390:
5590323f5a3811 Vivek Sahu                     2026-02-09   824  			snprintf(config.fwname, sizeof(config.fwname),
5590323f5a3811 Vivek Sahu                     2026-02-09   825  				 "qca/htbtfw%02x.tlv", rom_ver);
5590323f5a3811 Vivek Sahu                     2026-02-09   826  			break;
5590323f5a3811 Vivek Sahu                     2026-02-09   827  		case QCA_QCC2072:
5590323f5a3811 Vivek Sahu                     2026-02-09   828  			snprintf(config.fwname, sizeof(config.fwname),
5590323f5a3811 Vivek Sahu                     2026-02-09   829  				 "qca/ornbtfw%02x.tlv", rom_ver);
d5712c511cb358 Dmitry Baryshkov               2025-02-07  @830  		case QCA_WCN3950:
d5712c511cb358 Dmitry Baryshkov               2025-02-07   831  			snprintf(config.fwname, sizeof(config.fwname),
d5712c511cb358 Dmitry Baryshkov               2025-02-07   832  				 "qca/cmbtfw%02x.tlv", rom_ver);
d5712c511cb358 Dmitry Baryshkov               2025-02-07   833  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   834  		case QCA_WCN3990:
691d54d0f7cb14 Neil Armstrong                 2023-08-16   835  		case QCA_WCN3991:
691d54d0f7cb14 Neil Armstrong                 2023-08-16   836  		case QCA_WCN3998:
4219d4686875fd Balakrishna Godavarthi         2018-08-03   837  			snprintf(config.fwname, sizeof(config.fwname),
4219d4686875fd Balakrishna Godavarthi         2018-08-03   838  				 "qca/crbtfw%02x.tlv", rom_ver);
691d54d0f7cb14 Neil Armstrong                 2023-08-16   839  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   840  		case QCA_WCN3988:
691d54d0f7cb14 Neil Armstrong                 2023-08-16   841  			snprintf(config.fwname, sizeof(config.fwname),
691d54d0f7cb14 Neil Armstrong                 2023-08-16   842  				 "qca/apbtfw%02x.tlv", rom_ver);
691d54d0f7cb14 Neil Armstrong                 2023-08-16   843  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   844  		case QCA_WCN6750:
ecf6b2d9566606 Venkata Lakshmi Narayana Gubba 2021-05-18   845  			/* Choose mbn file by default.If mbn file is not found
ecf6b2d9566606 Venkata Lakshmi Narayana Gubba 2021-05-18   846  			 * then choose tlv file
ecf6b2d9566606 Venkata Lakshmi Narayana Gubba 2021-05-18   847  			 */
ecf6b2d9566606 Venkata Lakshmi Narayana Gubba 2021-05-18   848  			config.type = ELF_TYPE_PATCH;
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18   849  			snprintf(config.fwname, sizeof(config.fwname),
ecf6b2d9566606 Venkata Lakshmi Narayana Gubba 2021-05-18   850  				 "qca/msbtfw%02x.mbn", rom_ver);
691d54d0f7cb14 Neil Armstrong                 2023-08-16   851  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   852  		case QCA_WCN6855:
095327fede005f Steev Klimaszewski             2023-03-26   853  			snprintf(config.fwname, sizeof(config.fwname),
095327fede005f Steev Klimaszewski             2023-03-26   854  				 "qca/hpbtfw%02x.tlv", rom_ver);
691d54d0f7cb14 Neil Armstrong                 2023-08-16   855  			break;
e0c1278ac89b03 Neil Armstrong                 2023-08-16   856  		case QCA_WCN7850:
e0c1278ac89b03 Neil Armstrong                 2023-08-16   857  			snprintf(config.fwname, sizeof(config.fwname),
e0c1278ac89b03 Neil Armstrong                 2023-08-16   858  				 "qca/hmtbtfw%02x.tlv", rom_ver);
e0c1278ac89b03 Neil Armstrong                 2023-08-16   859  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   860  		default:
4219d4686875fd Balakrishna Godavarthi         2018-08-03   861  			snprintf(config.fwname, sizeof(config.fwname),
4219d4686875fd Balakrishna Godavarthi         2018-08-03   862  				 "qca/rampatch_%08x.bin", soc_ver);
4219d4686875fd Balakrishna Godavarthi         2018-08-03   863  		}
30209aeff75fe1 Cheng Jiang                    2025-01-07   864  	}
4219d4686875fd Balakrishna Godavarthi         2018-08-03   865  
ecf6b2d9566606 Venkata Lakshmi Narayana Gubba 2021-05-18   866  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   867  	if (err < 0) {
ba493d4fbcb84b Balakrishna Godavarthi         2018-08-03   868  		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   869  		return err;
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   870  	}
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   871  
8059ba0bd0e469 Matthias Kaehlcke              2019-07-09   872  	/* Give the controller some time to get ready to receive the NVM */
8059ba0bd0e469 Matthias Kaehlcke              2019-07-09   873  	msleep(10);
8059ba0bd0e469 Matthias Kaehlcke              2019-07-09   874  
e41137d8bd1a8e Zijun Hu                       2024-04-17   875  	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
a7f8dedb4be2cc Tim Jiang                      2023-09-12   876  		qca_read_fw_board_id(hdev, &boardid);
a7f8dedb4be2cc Tim Jiang                      2023-09-12   877  
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   878  	/* Download NVM configuration */
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   879  	config.type = TLV_TYPE_NVM;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   880  	if (firmware_name) {
a4c5a468c6329b Cheng Jiang                    2025-01-07   881  		/* The firmware name has an extension, use it directly */
a4c5a468c6329b Cheng Jiang                    2025-01-07   882  		if (qca_filename_has_extension(firmware_name)) {
a4c5a468c6329b Cheng Jiang                    2025-01-07   883  			snprintf(config.fwname, sizeof(config.fwname), "qca/%s", firmware_name);
a4c5a468c6329b Cheng Jiang                    2025-01-07   884  		} else {
a4c5a468c6329b Cheng Jiang                    2025-01-07   885  			qca_read_fw_board_id(hdev, &boardid);
a4c5a468c6329b Cheng Jiang                    2025-01-07   886  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
a4c5a468c6329b Cheng Jiang                    2025-01-07   887  				 firmware_name, soc_type, ver, 0, boardid);
a4c5a468c6329b Cheng Jiang                    2025-01-07   888  		}
691d54d0f7cb14 Neil Armstrong                 2023-08-16   889  	} else {
691d54d0f7cb14 Neil Armstrong                 2023-08-16   890  		switch (soc_type) {
5590323f5a3811 Vivek Sahu                     2026-02-09   891  		case QCA_QCA2066:
5590323f5a3811 Vivek Sahu                     2026-02-09   892  			qca_get_nvm_name_by_board(config.fwname,
5590323f5a3811 Vivek Sahu                     2026-02-09   893  				sizeof(config.fwname), "hpnv", soc_type, ver,
5590323f5a3811 Vivek Sahu                     2026-02-09   894  				rom_ver, boardid);
5590323f5a3811 Vivek Sahu                     2026-02-09   895  			break;
5590323f5a3811 Vivek Sahu                     2026-02-09   896  		case QCA_QCA6390:
5590323f5a3811 Vivek Sahu                     2026-02-09   897  			snprintf(config.fwname, sizeof(config.fwname),
5590323f5a3811 Vivek Sahu                     2026-02-09   898  				 "qca/htnv%02x.bin", rom_ver);
5590323f5a3811 Vivek Sahu                     2026-02-09   899  			break;
5590323f5a3811 Vivek Sahu                     2026-02-09   900  		case QCA_QCC2072:
5590323f5a3811 Vivek Sahu                     2026-02-09   901  			snprintf(config.fwname, sizeof(config.fwname),
5590323f5a3811 Vivek Sahu                     2026-02-09   902  				 "qca/ornnv%02x.bin", rom_ver);
5590323f5a3811 Vivek Sahu                     2026-02-09   903  			break;
d5712c511cb358 Dmitry Baryshkov               2025-02-07   904  		case QCA_WCN3950:
d5712c511cb358 Dmitry Baryshkov               2025-02-07   905  			if (le32_to_cpu(ver.soc_id) == QCA_WCN3950_SOC_ID_T)
d5712c511cb358 Dmitry Baryshkov               2025-02-07   906  				variant = "t";
d5712c511cb358 Dmitry Baryshkov               2025-02-07   907  			else if (le32_to_cpu(ver.soc_id) == QCA_WCN3950_SOC_ID_S)
e92900c9803fb3 Dmitry Baryshkov               2025-04-01   908  				variant = "s";
d5712c511cb358 Dmitry Baryshkov               2025-02-07   909  
d5712c511cb358 Dmitry Baryshkov               2025-02-07   910  			snprintf(config.fwname, sizeof(config.fwname),
d5712c511cb358 Dmitry Baryshkov               2025-02-07   911  				 "qca/cmnv%02x%s.bin", rom_ver, variant);
d5712c511cb358 Dmitry Baryshkov               2025-02-07   912  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   913  		case QCA_WCN3990:
691d54d0f7cb14 Neil Armstrong                 2023-08-16   914  		case QCA_WCN3991:
691d54d0f7cb14 Neil Armstrong                 2023-08-16   915  		case QCA_WCN3998:
1cc41b5092e3aa Dmitry Baryshkov               2025-02-07   916  			if (le32_to_cpu(ver.soc_id) == QCA_WCN3991_SOC_ID)
1cc41b5092e3aa Dmitry Baryshkov               2025-02-07   917  				variant = "u";
1cc41b5092e3aa Dmitry Baryshkov               2025-02-07   918  
4219d4686875fd Balakrishna Godavarthi         2018-08-03   919  			snprintf(config.fwname, sizeof(config.fwname),
1cc41b5092e3aa Dmitry Baryshkov               2025-02-07   920  				 "qca/crnv%02x%s.bin", rom_ver, variant);
691d54d0f7cb14 Neil Armstrong                 2023-08-16   921  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   922  		case QCA_WCN3988:
691d54d0f7cb14 Neil Armstrong                 2023-08-16   923  			snprintf(config.fwname, sizeof(config.fwname),
691d54d0f7cb14 Neil Armstrong                 2023-08-16   924  				 "qca/apnv%02x.bin", rom_ver);
691d54d0f7cb14 Neil Armstrong                 2023-08-16   925  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   926  		case QCA_WCN6750:
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18   927  			snprintf(config.fwname, sizeof(config.fwname),
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18   928  				 "qca/msnv%02x.bin", rom_ver);
691d54d0f7cb14 Neil Armstrong                 2023-08-16   929  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   930  		case QCA_WCN6855:
a2fad248947d70 Zijun Hu                       2025-01-13   931  			qca_read_fw_board_id(hdev, &boardid);
a2fad248947d70 Zijun Hu                       2025-01-13   932  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
a2fad248947d70 Zijun Hu                       2025-01-13   933  						  "hpnv", soc_type, ver, rom_ver, boardid);
691d54d0f7cb14 Neil Armstrong                 2023-08-16   934  			break;
e0c1278ac89b03 Neil Armstrong                 2023-08-16   935  		case QCA_WCN7850:
a4c5a468c6329b Cheng Jiang                    2025-01-07   936  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
a4c5a468c6329b Cheng Jiang                    2025-01-07   937  				 "hmtnv", soc_type, ver, rom_ver, boardid);
e0c1278ac89b03 Neil Armstrong                 2023-08-16   938  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   939  		default:
4219d4686875fd Balakrishna Godavarthi         2018-08-03   940  			snprintf(config.fwname, sizeof(config.fwname),
4219d4686875fd Balakrishna Godavarthi         2018-08-03   941  				 "qca/nvm_%08x.bin", soc_ver);
691d54d0f7cb14 Neil Armstrong                 2023-08-16   942  		}
691d54d0f7cb14 Neil Armstrong                 2023-08-16   943  	}
4219d4686875fd Balakrishna Godavarthi         2018-08-03   944  
ecf6b2d9566606 Venkata Lakshmi Narayana Gubba 2021-05-18   945  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   946  	if (err < 0) {
ba493d4fbcb84b Balakrishna Godavarthi         2018-08-03   947  		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   948  		return err;
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   949  	}
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   950  
691d54d0f7cb14 Neil Armstrong                 2023-08-16   951  	switch (soc_type) {
691d54d0f7cb14 Neil Armstrong                 2023-08-16   952  	case QCA_WCN3991:
a7f8dedb4be2cc Tim Jiang                      2023-09-12   953  	case QCA_QCA2066:
691d54d0f7cb14 Neil Armstrong                 2023-08-16   954  	case QCA_QCA6390:
691d54d0f7cb14 Neil Armstrong                 2023-08-16   955  	case QCA_WCN6750:
691d54d0f7cb14 Neil Armstrong                 2023-08-16   956  	case QCA_WCN6855:
e0c1278ac89b03 Neil Armstrong                 2023-08-16   957  	case QCA_WCN7850:
590deccf4c0690 Balakrishna Godavarthi         2020-06-12   958  		err = qca_disable_soc_logging(hdev);
590deccf4c0690 Balakrishna Godavarthi         2020-06-12   959  		if (err < 0)
590deccf4c0690 Balakrishna Godavarthi         2020-06-12   960  			return err;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   961  		break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16   962  	default:
691d54d0f7cb14 Neil Armstrong                 2023-08-16   963  		break;
590deccf4c0690 Balakrishna Godavarthi         2020-06-12   964  	}
590deccf4c0690 Balakrishna Godavarthi         2020-06-12   965  
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18   966  	/* WCN399x and WCN6750 supports the Microsoft vendor extension with 0xFD70 as the
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   967  	 * VsMsftOpCode.
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   968  	 */
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   969  	switch (soc_type) {
d5712c511cb358 Dmitry Baryshkov               2025-02-07   970  	case QCA_WCN3950:
691d54d0f7cb14 Neil Armstrong                 2023-08-16   971  	case QCA_WCN3988:
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   972  	case QCA_WCN3990:
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   973  	case QCA_WCN3991:
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   974  	case QCA_WCN3998:
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18   975  	case QCA_WCN6750:
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   976  		hci_set_msft_opcode(hdev, 0xFD70);
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   977  		break;
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   978  	default:
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   979  		break;
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   980  	}
eaf19b0c47d142 Miao-chen Chou                 2020-12-17   981  
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   982  	/* Perform HCI reset */
ba493d4fbcb84b Balakrishna Godavarthi         2018-08-03   983  	err = qca_send_reset(hdev);
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   984  	if (err < 0) {
ba493d4fbcb84b Balakrishna Godavarthi         2018-08-03   985  		bt_dev_err(hdev, "QCA Failed to run HCI_RESET (%d)", err);
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   986  		return err;
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   987  	}
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10   988  
095327fede005f Steev Klimaszewski             2023-03-26   989  	switch (soc_type) {
095327fede005f Steev Klimaszewski             2023-03-26   990  	case QCA_WCN3991:
095327fede005f Steev Klimaszewski             2023-03-26   991  	case QCA_WCN6750:
095327fede005f Steev Klimaszewski             2023-03-26   992  	case QCA_WCN6855:
e0c1278ac89b03 Neil Armstrong                 2023-08-16   993  	case QCA_WCN7850:
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08   994  		/* get fw build info */
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08   995  		err = qca_read_fw_build_info(hdev);
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08   996  		if (err < 0)
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08   997  			return err;
095327fede005f Steev Klimaszewski             2023-03-26   998  		break;
095327fede005f Steev Klimaszewski             2023-03-26   999  	default:
095327fede005f Steev Klimaszewski             2023-03-26  1000  		break;
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  1001  	}
c0187b0bd3e94c Venkata Lakshmi Narayana Gubba 2020-12-08  1002  
dd336649ba8978 Johan Hovold                   2024-04-30  1003  	err = qca_check_bdaddr(hdev, &config);
32868e126c7887 Johan Hovold                   2024-04-16  1004  	if (err)
32868e126c7887 Johan Hovold                   2024-04-16  1005  		return err;
32868e126c7887 Johan Hovold                   2024-04-16  1006  
ba493d4fbcb84b Balakrishna Godavarthi         2018-08-03  1007  	bt_dev_info(hdev, "QCA setup on UART is completed");
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10  1008  
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10  1009  	return 0;
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10  1010  }
ba493d4fbcb84b Balakrishna Godavarthi         2018-08-03  1011  EXPORT_SYMBOL_GPL(qca_uart_setup);
83e81961ff7ef7 Ben Young Tae Kim              2015-08-10  1012  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

