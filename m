Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4CA44E08D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 03:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbhKLCyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 21:54:06 -0500
Received: from mga11.intel.com ([192.55.52.93]:56557 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229908AbhKLCyD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 21:54:03 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="230524692"
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; 
   d="gz'50?scan'50,208,50";a="230524692"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 18:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; 
   d="gz'50?scan'50,208,50";a="502284432"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2021 18:51:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 18:51:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 18:51:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 11 Nov 2021 18:51:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 11 Nov 2021 18:51:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yal+IEC9oXFdu5uYPt46qmU3JOfjxljVlvtkjvTFr+c63bwIPYrDmTKyPkT1Z9V/GiUze8k3OD7QGDG369FoSuyFwKuP4Y4zrCuNwacIk3NZPaqRKG2CV/SqEuaLPafxFI8TXoHw9ZkRGIN/O03p7BP/ewy5fOIve8VBv7B+rFKTBLaVqQ88JMhmw+7rWjMy9NVXQAc/hMoJ4jwy2bFujSUp/kRRt9T4G7Idh7JElHG53B6fxqaG33TIkemtLp6+3gJysErTKjcFkLFeR6jT6CcHEYaVKGXyB9dQLFfRo2a5SxcJwVsfx7k5AjFtptH8qQxeMvDp4jbYgifxr09CJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YMYn5k/6TTK7l10QdDwQq9YDxtl1A6C8lc7ZAHZNwM=;
 b=hEjB0eFuN3bdpXIo+VWOUY3SVfByV4trUEaqr1G6FNiUnlUVEoukvMP6FZpOl3q6qhhD6NTc1/L/dvwX8OfvvC1MV90WXu6JIO6Fh7LJEO35J/xtU7Ukf4ocZu3OYiTfO6nG0IzBqtMr6rtrgJWXnrBUwnArB2GiPz+8zO8a2LctkNpi6NIGRy5v5gRWUkH2B9TKL89wi47eSLKBBHMN0YL8GMgMZM61sYKBBewAVoQCPH3q88lgZyxeCBkH4gyvrT5Qmh0Ybx+dZUtwnmRHlz0IIZaUk6+qih/MjKt40tQsaypw0+L3Kb1c7cpNfSyQETo6bgX2s06kMvYcA6vO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YMYn5k/6TTK7l10QdDwQq9YDxtl1A6C8lc7ZAHZNwM=;
 b=iN3ya0Nw18NFtrFpKkp6VQRM4UaX7FXZPGs3H7r/rt8rjAktzvZXOmZCMRjjYBSvWKzoZR+0R9ed6qM6TKO0K+isteIaKLkL7Kw98eVO1ZFokDbtutPlCfP5ZHzf8p9U+aarJfrT6oybsbv6xMuFRoL6wlmm/p/t49ud+h+ZMCo=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5582.namprd11.prod.outlook.com (2603:10b6:a03:3aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 12 Nov
 2021 02:51:02 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::3455:d126:2541:7723]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::3455:d126:2541:7723%2]) with mapi id 15.20.4690.019; Fri, 12 Nov 2021
 02:51:02 +0000
Content-Type: multipart/mixed; boundary="------------zMKI3eia0rhwJklVoKAffYWz"
Message-ID: <b037d266-6e1f-1dde-5f4c-e180ca1ba869@intel.com>
Date:   Fri, 12 Nov 2021 10:50:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH V1 3/3] rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
References: <202111081917.zPNurV3x-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202111081917.zPNurV3x-lkp@intel.com>
To:     Deepak Kumar Singh <deesin@codeaurora.org>, <clew@codeaurora.org>
CC:     <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
From:   kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202111081917.zPNurV3x-lkp@intel.com>
X-ClientProxiedBy: HK2PR0302CA0017.apcprd03.prod.outlook.com
 (2603:1096:202::27) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
MIME-Version: 1.0
Received: from [10.238.2.77] (192.198.142.18) by HK2PR0302CA0017.apcprd03.prod.outlook.com (2603:1096:202::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.8 via Frontend Transport; Fri, 12 Nov 2021 02:51:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca03d1aa-b1ee-498b-be05-08d9a587437d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5582:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB558238347CCF621A9B856EF4FB959@SJ0PR11MB5582.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:32;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SG/2875J4W6TgI5oyAv8+VAx2UaRzYRE1iWohQe0j+PXBSV7BD6MjdD32WKx/D1ul3BxDZRkXFDI66mD8w47MI2n1WopPayrrp2Ta4yAkzdp4es04F/fuvSBbQcsPh5v+SjKbYhsNdiCauYWXq4REJjK13z8RZOwv/999XyhbpHtqxogwcrx1XT4B6Bpwms0tkPXtSwxVpc0vWM1bOPwbJMLYeP17S991jX6d1rgeL5cpQ+kX5zaWlAHUthd1Uc0QpBuSjDwhzf8FFewZBjpx1lEO6GygB6acGAkK/xLYFsNXpSWg/AhQqUwhzB/I2Gkf0G5I5K0V6chXBzgKMW8ATGCaqu5v4Ts4FXRlO964Yk1ECAXS3rzjFiEsKvOhBTTxryDBcQdo4chZohnkCmda2TyiCT00BSAsBSlQmcCUeqTPnBp432Qg3ZIOkFIFcjYx0yf+hRvs20chkvcWm5ufDTjBQf1Re1dHeCCdFJEg5vpVNt8pLDWX2J74vfzMp+5KnSb+2mD6A5VOdp4IgnI9RUemzqzBtkN1R5RCnUMtXAl++TpP0EP8kjvzEEM6RMh+eRdpN4xP3EaKX7PxFvzXOYWzKDVlcYoMrjk0r1EORFWgPxJf92aUZIKjpoTB2c2A4AwwYff9UMPLGttC8Wk4BAnOR/4QnLHn+G52zOAVtpTxAle6zXwq7WG5mpO1dXhuIqU7yCYHGHPv9HCYyyHkoTjSU24buAvGMNHD/BM8I468rzxBAmBdb3rPqT4oMuJlJwQ7EqDTJXNa1LeS+IAFUnCy4vpPKh6rPO9BTuK8so/flP5YDOEU5Iv/L70OqMN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(82960400001)(38100700002)(66946007)(4326008)(33964004)(66556008)(31686004)(31696002)(2906002)(956004)(6486002)(66476007)(83380400001)(8936002)(86362001)(26005)(508600001)(2616005)(36756003)(235185007)(5660300002)(8676002)(186003)(6666004)(966005)(316002)(16576012)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXNpSHJjOEE5T2I2NWc3UUx6WUNhYzRWVGZkbjhhRjk4dGt1QVVXazB0UWg2?=
 =?utf-8?B?UVVMUlRGUkw0L2UwaG9GUW1uZXYzQng2UGdsTWNoaHk3M3EvREV2UWwwTThU?=
 =?utf-8?B?Qlh1eHc0ZzNldDVycEg1cSthRkNRQ1lHZ1Z4NDQ0azM5M2UxV0NjUDJaWlFM?=
 =?utf-8?B?cVl1TXhrSlZqdGxCY0d1RnUvbHVsdmJNaE9XRW1NOWJSRTVJalZqS2NUSW9k?=
 =?utf-8?B?MUtLSUZUOVk0cTBKdEpyNzJLdjhTSCtOZ2I1YXpaUVlLNUpKV3VRYWk1MEVu?=
 =?utf-8?B?N3hiN1M4UmpwOFBHQzIxa0tSOE1UOXVvWCtWYmQ4R1B6c3RwVU9UNGJHMGl5?=
 =?utf-8?B?QUpROG9hZ3BsTU1xK3l2bjczMG1rUkxrMi9vaUF1d2FBL3pjUWxLMDN1Sm15?=
 =?utf-8?B?NlRiTHZYQ3RDaVk2SXJPN0paeU9BZE5WSzVubEdjeUp6UTVic0E4MkdFS0Yx?=
 =?utf-8?B?clNOSjFNeWtLaWtxNVhGMjd2a1BIb2pYYzhJZ2xHVkVweEpodTY4QnNoa29V?=
 =?utf-8?B?MzVPWkNGcmVqZ01ab1JNN0dtT240Qk1aanJ3QUJXdFVZTmM2NHhubDhsbmxR?=
 =?utf-8?B?MVRzVXBvemtZU2hEQUpycjZtUTJ4TVZReHhpczIxS2s4Q250YXZXZFl2a05O?=
 =?utf-8?B?dkc5ajFkeHM4QTNqdVY4c09DZnVMWGV1SzI5NThaVnhhM3Vrc3ZiRCt1alJr?=
 =?utf-8?B?RVdtTVdlWkgyaTloRGRoT0xLSHRBMnUxV25PaW5qK3RYQkdIZUF6NHd3NFhP?=
 =?utf-8?B?OXI1MzByQ0xwdWYwOGkzN29WbzYrZ3BMZHBUbm5HTVpCSngybWo2WTJaNUpy?=
 =?utf-8?B?UmRGcGVqTWdoS1BEWXkwaVg0UXNTU2RYRjZYMkpkWDhhVjIyNHowWmlLWkUw?=
 =?utf-8?B?WENQOENTWEhSKzJ6Z3V4enhUS3NpSy9QVHhrTjZXbjVqQWMyZmJ1TDlzbURQ?=
 =?utf-8?B?VjVIZ2d0bDdqVUZydGhSOXlsenZwaGpJLzJ5SnlHTXBNTGdJRDZKYW01L2Rr?=
 =?utf-8?B?NVZKWmFHNml4QmYzeC9jcjgrM2pxVzU4RzZaelJMU09jQVk0QWhHVjNSZzJL?=
 =?utf-8?B?UCtCK0FFQ1lneTBUOVV3aStFQllNMUt3bHZDR002NWtJWVZJWmlFY2JYZUd4?=
 =?utf-8?B?SnkvSENTMTdWbERUa09jZm4wbjFpbEszSkRrRzVkbTN6NSs0UzJoS2lJZHB0?=
 =?utf-8?B?Qi85dnFHYUpJQ0VtRWF1TXlkb24rUnR4VWIxR3dZT0R6b1J2WUl6ME93Z1FX?=
 =?utf-8?B?SDRPc2sxc3l5eFpXQ1Bta1VwRkJRcEc1Q3NyVDJzUmNETWk5OWZwV1BXSHBH?=
 =?utf-8?B?Y3d2SW1wbjNVKzBqWFgrWmJTdk1ldjhUa25VdDcvQWFQb0ZKUUZwWUVqeEpE?=
 =?utf-8?B?UUxodzE1enBSNDZZNkY5QnFnRkY5Wk9lajVCSEtOOEk2Y0IwSHJ3QTRFUTBr?=
 =?utf-8?B?UUcva01FSi9kQ2g5NTNBclV5TG1pUGoxbThDajRCaldGVU5RK2ladzRoOExu?=
 =?utf-8?B?cFo2T0REZzZ2akR3cTNhMEozMGFGc3hPam9uZFkranltR1Zra0FhYjlOczgv?=
 =?utf-8?B?Rk0zWWRRY0c3b0ZXUGl0QTNRMVRzQmFjcXF6ZWFlZDF0V0FwMXp6T0V4V3pn?=
 =?utf-8?B?MmxkWVBLVTYrSTZBUVFyRjN0clpTZWhEQkdCZzJQQVYyOCtqY1dCODVRRVBH?=
 =?utf-8?B?YkZNLzNDMWVvY0xid2ROMFpzTDhCRVN1TUk5SkNXYTlvL0VHcDZGZ3o3Vjhv?=
 =?utf-8?B?bG5QVWQreGZTdURKSWp3cnRJN2dPSWtSODRqWHl1bmZsTjZFN1plNzQxNkNq?=
 =?utf-8?B?UWVxQ2FDd1RUbDlCaCs5ZGlET1VZV0ppWlR0N3V1c2d3T1E2RnBqWlZpZGRR?=
 =?utf-8?B?Qk10R3owTklWME1xdDNrZWJYRnd1R2dXdGJQT2FkNDVUeWRrNWt5UnBUY056?=
 =?utf-8?B?U1Z2RmFoMkdSbi80SkMyQjFNcVdYNXV4eXRaRDNmVnNic1ZNS3NuN3VnbXBD?=
 =?utf-8?B?MERRUWVpZDhEcGlpKzIxcUUzL0QrYVRMTGFQQU1ESHEzZWtEN1dJWFpKMXBW?=
 =?utf-8?B?TjdqWkpoRGVaZUt3Tkh4cjYybzFhSHhNNUZxSVdESmNuVWZkYnk1NUpNaEJS?=
 =?utf-8?B?bW1oc2ZVKzdxUytBRTcxQTVhbjkzM20wZCtyZ2NTZGIySXFvd1ZRVTNhRElB?=
 =?utf-8?Q?X6cgfxZWyqZbNI0G3h6PsII=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca03d1aa-b1ee-498b-be05-08d9a587437d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 02:51:02.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTHWKXHjGOXmI25Z89EcTgv6vTnU82PAjbdxfC1JcuI/8pcHfIa/x4huJn4BGjxYlD1nPoPPoA7HOPRWoCNfTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5582
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--------------zMKI3eia0rhwJklVoKAffYWz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Deepak,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.15]
[cannot apply to next-20211108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Deepak-Kumar-Singh/rpmsg-core-Add-signal-API-support/20211001-003225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 02d5e016800d082058b3d3b7c3ede136cdc6ddcb
config: x86_64-randconfig-c007-20211001 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 962e503cc8bc411f7523cc393acae8aae425b1c4)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://github.com/0day-ci/linux/commit/706239528659b90d79d28e52fcd0538747e66a86
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Deepak-Kumar-Singh/rpmsg-core-Add-signal-API-support/20211001-003225
         git checkout 706239528659b90d79d28e52fcd0538747e66a86
         # save the attached .config to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/rpmsg/rpmsg_char.c:310:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                    ret = put_user(eptdev->rsigs, (int __user *)arg);
                    ^
    drivers/rpmsg/rpmsg_char.c:317:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                    ret = rpmsg_set_flow_control(eptdev->ept, set);
                    ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    drivers/rpmsg/rpmsg_char.c:320:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                    ret = rpmsg_eptdev_destroy(&eptdev->dev, NULL);
                    ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    drivers/rpmsg/rpmsg_char.c:323:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                    ret = -EINVAL;
                    ^     ~~~~~~~


vim +/ret +310 drivers/rpmsg/rpmsg_char.c

c0cdc19f84a4712 Bjorn Andersson    2017-01-11  295
c0cdc19f84a4712 Bjorn Andersson    2017-01-11  296  static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
c0cdc19f84a4712 Bjorn Andersson    2017-01-11  297  			       unsigned long arg)
c0cdc19f84a4712 Bjorn Andersson    2017-01-11  298  {
c0cdc19f84a4712 Bjorn Andersson    2017-01-11  299  	struct rpmsg_eptdev *eptdev = fp->private_data;
706239528659b90 Deepak Kumar Singh 2021-09-30  300  	bool set;
706239528659b90 Deepak Kumar Singh 2021-09-30  301  	u32 val;
706239528659b90 Deepak Kumar Singh 2021-09-30  302  	int ret;
c0cdc19f84a4712 Bjorn Andersson    2017-01-11  303
c0cdc19f84a4712 Bjorn Andersson    2017-01-11  304  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
c0cdc19f84a4712 Bjorn Andersson    2017-01-11  305  		return -EINVAL;
c0cdc19f84a4712 Bjorn Andersson    2017-01-11  306
706239528659b90 Deepak Kumar Singh 2021-09-30  307  	switch (cmd) {
706239528659b90 Deepak Kumar Singh 2021-09-30  308  	case TIOCMGET:
706239528659b90 Deepak Kumar Singh 2021-09-30  309  		eptdev->sig_pending = false;
706239528659b90 Deepak Kumar Singh 2021-09-30 @310  		ret = put_user(eptdev->rsigs, (int __user *)arg);
706239528659b90 Deepak Kumar Singh 2021-09-30  311  		break;
706239528659b90 Deepak Kumar Singh 2021-09-30  312  	case TIOCMSET:
706239528659b90 Deepak Kumar Singh 2021-09-30  313  		ret = get_user(val, (int __user *)arg);
706239528659b90 Deepak Kumar Singh 2021-09-30  314  		if (ret)
706239528659b90 Deepak Kumar Singh 2021-09-30  315  			break;
706239528659b90 Deepak Kumar Singh 2021-09-30  316  		set = (val & TIOCM_DTR) ? true : false;
706239528659b90 Deepak Kumar Singh 2021-09-30 @317  		ret = rpmsg_set_flow_control(eptdev->ept, set);
706239528659b90 Deepak Kumar Singh 2021-09-30  318  		break;
706239528659b90 Deepak Kumar Singh 2021-09-30  319  	case RPMSG_DESTROY_EPT_IOCTL:
706239528659b90 Deepak Kumar Singh 2021-09-30 @320  		ret = rpmsg_eptdev_destroy(&eptdev->dev, NULL);
706239528659b90 Deepak Kumar Singh 2021-09-30  321  		break;
706239528659b90 Deepak Kumar Singh 2021-09-30  322  	default:
706239528659b90 Deepak Kumar Singh 2021-09-30 @323  		ret = -EINVAL;
706239528659b90 Deepak Kumar Singh 2021-09-30  324  	}
706239528659b90 Deepak Kumar Singh 2021-09-30  325
c0cdc19f84a4712 Bjorn Andersson    2017-01-11  326  	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
c0cdc19f84a4712 Bjorn Andersson    2017-01-11  327  }
c0cdc19f84a4712 Bjorn Andersson    2017-01-11  328

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--------------zMKI3eia0rhwJklVoKAffYWz
Content-Type: application/gzip; name=".config.gz"
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
Ghjfxhxlti4+KYgF+ZmUa91/AVGe2dmRXwIA

--------------zMKI3eia0rhwJklVoKAffYWz--
