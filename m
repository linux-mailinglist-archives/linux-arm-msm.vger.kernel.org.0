Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0A330F608
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 16:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237129AbhBDPOJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 10:14:09 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:11302 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237111AbhBDPMS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 10:12:18 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 114F2AAf019077;
        Thu, 4 Feb 2021 16:11:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sE6exNrtQq570ihFE/Urs/fOiX/fcIs+40k5WvNHbCU=;
 b=3YP4elACwrLPsMfVFx3oqTAbN2nrwbUUjDET+rokUwyW58zM/vP0Lrxg01V/Ym4U5wsH
 oIgiCByyqYsDajGrJl/M6v37u1OzgnSPLai11PKUjhUD97SfGlqT1erk2zfKiV9vNC9t
 ZfleUze9tsFYrzJsutJpOfbSkMwIKO3cmPlCJfDp+5UOGIVlZD/l3AsRs1M9wLAi6dBm
 b/I4LArXJ3vHXsns3MY57LxKVlhHAALkO2/f+nrV7zVnm6mqc9IwBRtDPLQehn49qpH0
 hKuQWxs5fl0cAkmcIHMhY8tcxGvhoxzZWbZQ1DIymX3oflIpSVYr5Ec2ZddZV7jvquD/ GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36d0fs86hx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Feb 2021 16:11:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA37010002A;
        Thu,  4 Feb 2021 16:11:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62BEC2BA2CA;
        Thu,  4 Feb 2021 16:11:13 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 16:11:12 +0100
Subject: Re: [PATCH v3 06/15] rpmsg: update rpmsg_chrdev_register_device
 function
To:     kernel test robot <lkp@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <kbuild-all@lists.01.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20210204084534.10516-7-arnaud.pouliquen@foss.st.com>
 <202102042006.UBNrTXCE-lkp@intel.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <c853e1f6-d5f9-4270-5a78-2e9730e5089e@foss.st.com>
Date:   Thu, 4 Feb 2021 16:11:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202102042006.UBNrTXCE-lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-04_08:2021-02-04,2021-02-04 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/4/21 1:44 PM, kernel test robot wrote:
> Hi Arnaud,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.11-rc6 next-20210125]
> [cannot apply to rpmsg/for-next agross-msm/qcom/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Arnaud-Pouliquen/introduce-a-generic-IOCTL-interface-for-RPMsg-channels-management/20210204-165337
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 61556703b610a104de324e4f061dc6cf7b218b46
> config: openrisc-randconfig-r001-20210204 (attached as .config)
> compiler: or1k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/23c166e0b157f0695fa7daefb8c5e30f383c3efd
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Arnaud-Pouliquen/introduce-a-generic-IOCTL-interface-for-RPMsg-channels-management/20210204-165337
>         git checkout 23c166e0b157f0695fa7daefb8c5e30f383c3efd
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=openrisc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>>
> All errors (new ones prefixed by >>):
> 
>    or1k-linux-ld: drivers/rpmsg/qcom_glink_native.o: in function `qcom_glink_native_probe':
>>> qcom_glink_native.c:(.text+0x2e88): undefined reference to `rpmsg_ctrl_register_device'
>    qcom_glink_native.c:(.text+0x2e88): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `rpmsg_ctrl_register_device'

Thanks for highlighting it!

I await further review comments first, but I will address this in my next
revision, if it still relevant.

> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
