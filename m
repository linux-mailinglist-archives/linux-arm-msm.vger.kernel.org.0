Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E623E13E8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 13:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241117AbhHEL3N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 07:29:13 -0400
Received: from mga03.intel.com ([134.134.136.65]:43188 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241026AbhHEL3K (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 07:29:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="214159070"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="gz'50?scan'50,208,50";a="214159070"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 04:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="gz'50?scan'50,208,50";a="668877230"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Aug 2021 04:28:51 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mBbYQ-000Fpz-S4; Thu, 05 Aug 2021 11:28:50 +0000
Date:   Thu, 5 Aug 2021 19:28:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Zijun Hu <zijuhu@codeaurora.org>, marcel@holtmann.org,
        johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, c-hbandi@codeaurora.org,
        hemantg@codeaurora.org, mka@chromium.org
Subject: Re: [PATCH v2] Bluetooth: btusb: Add support different nvm to
 distinguish different factory for WCN6855 controller
Message-ID: <202108051905.xAIK6I5F-lkp@intel.com>
References: <1628152661-5669-1-git-send-email-zijuhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <1628152661-5669-1-git-send-email-zijuhu@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zijun,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on linus/master v5.14-rc4 next-20210804]
[cannot apply to bluetooth/master linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zijun-Hu/Bluetooth-btusb-Add-support-different-nvm-to-distinguish-different-factory-for-WCN6855-controller/20210805-164035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
config: m68k-randconfig-r013-20210804 (attached as .config)
compiler: m68k-linux-gcc (GCC) 10.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7af6ba1121380c4ee146896c833b7ecb7716d82e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zijun-Hu/Bluetooth-btusb-Add-support-different-nvm-to-distinguish-different-factory-for-WCN6855-controller/20210805-164035
        git checkout 7af6ba1121380c4ee146896c833b7ecb7716d82e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross ARCH=m68k 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/bluetooth/btusb.c: In function 'btusb_setup_qca_form_nvm_name':
   drivers/bluetooth/btusb.c:4391:1: error: no return statement in function returning non-void [-Werror=return-type]
    4391 | }
         | ^
   drivers/bluetooth/btusb.c: In function 'btusb_setup_qca_load_nvm':
>> drivers/bluetooth/btusb.c:4404:33: error: passing argument 1 of 'btusb_setup_qca_form_nvm_name' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4404 |   btusb_setup_qca_form_nvm_name(&fwname, sizeof(fwname), ver, "gf");
         |                                 ^~~~~~~
         |                                 |
         |                                 char (*)[64]
   drivers/bluetooth/btusb.c:4357:49: note: expected 'char **' but argument is of type 'char (*)[64]'
    4357 | static int btusb_setup_qca_form_nvm_name(char **fwname,
         |                                          ~~~~~~~^~~~~~
   drivers/bluetooth/btusb.c:4407:33: error: passing argument 1 of 'btusb_setup_qca_form_nvm_name' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4407 |   btusb_setup_qca_form_nvm_name(&fwname, sizeof(fwname), ver, NULL);
         |                                 ^~~~~~~
         |                                 |
         |                                 char (*)[64]
   drivers/bluetooth/btusb.c:4357:49: note: expected 'char **' but argument is of type 'char (*)[64]'
    4357 | static int btusb_setup_qca_form_nvm_name(char **fwname,
         |                                          ~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +/btusb_setup_qca_form_nvm_name +4404 drivers/bluetooth/btusb.c

  4356	
  4357	static int btusb_setup_qca_form_nvm_name(char **fwname,
  4358						int max_size,
  4359						struct qca_version *ver,
  4360						char *factory)
  4361	{
  4362		if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
  4363			/* if boardid equal 0, use default nvm without suffix */
  4364			if (le16_to_cpu(ver->board_id) == 0x0) {
  4365				/* we add suffix factory to distinguish with different factory. */
  4366				if (factory != NULL) {
  4367					snprintf(*fwname, max_size, "qca/nvm_usb_%08x_%s.bin",
  4368						 le32_to_cpu(ver->rom_version),
  4369						 factory);
  4370				} else {
  4371					snprintf(*fwname, max_size, "qca/nvm_usb_%08x.bin",
  4372						 le32_to_cpu(ver->rom_version));
  4373				}
  4374			} else {
  4375				if (factory != NULL) {
  4376					snprintf(*fwname, max_size, "qca/nvm_usb_%08x_%s_%04x.bin",
  4377						le32_to_cpu(ver->rom_version),
  4378						factory,
  4379						le16_to_cpu(ver->board_id));
  4380				} else {
  4381					snprintf(*fwname, max_size, "qca/nvm_usb_%08x_%04x.bin",
  4382						le32_to_cpu(ver->rom_version),
  4383						le16_to_cpu(ver->board_id));
  4384				}
  4385			}
  4386		} else {
  4387			snprintf(*fwname, max_size, "qca/nvm_usb_%08x.bin",
  4388				 le32_to_cpu(ver->rom_version));
  4389		}
  4390	
> 4391	}
  4392	
  4393	static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
  4394					    struct qca_version *ver,
  4395					    const struct qca_device_info *info)
  4396	{
  4397		const struct firmware *fw;
  4398		char fwname[64];
  4399		int err;
  4400	
  4401		switch (ver->ram_version) {
  4402		case WCN6855_2_0_RAM_VERSION_GF:
  4403		case WCN6855_2_1_RAM_VERSION_GF:
> 4404			btusb_setup_qca_form_nvm_name(&fwname, sizeof(fwname), ver, "gf");
  4405			break;
  4406		default:
  4407			btusb_setup_qca_form_nvm_name(&fwname, sizeof(fwname), ver, NULL);
  4408		}
  4409	
  4410		err = request_firmware(&fw, fwname, &hdev->dev);
  4411		if (err) {
  4412			bt_dev_err(hdev, "failed to request NVM file: %s (%d)",
  4413				   fwname, err);
  4414			return err;
  4415		}
  4416	
  4417		bt_dev_info(hdev, "using NVM file: %s", fwname);
  4418	
  4419		err = btusb_setup_qca_download_fw(hdev, fw, info->nvm_hdr);
  4420	
  4421		release_firmware(fw);
  4422	
  4423		return err;
  4424	}
  4425	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--2oS5YaxWCcQjTEyO
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
oSQxrUF712X/A2ALN6mAggEA

--2oS5YaxWCcQjTEyO--
