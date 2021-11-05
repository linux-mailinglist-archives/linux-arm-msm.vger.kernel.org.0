Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542D5445F7F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 06:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbhKEFsC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 01:48:02 -0400
Received: from mga01.intel.com ([192.55.52.88]:24239 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232233AbhKEFsC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 01:48:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="255496628"
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; 
   d="gz'50?scan'50,208,50";a="255496628"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 22:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; 
   d="gz'50?scan'50,208,50";a="730420137"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2021 22:45:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 4 Nov 2021 22:45:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 4 Nov 2021 22:45:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 4 Nov 2021 22:45:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 4 Nov 2021 22:45:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffYR0pk8rY8Xt+lDFXxgbx+9bb/P7NLH94QX+nfb7O3oA0bovi6TOiwxGC3kEhT+ow7NLsM/FjZoLWZoGOGc8CdjFxV4is6biBJh2+pys8IiXj1x4N/8rhy7uXTDvPtT40AceU+k2wq1Wbo49hM/+upbbLZrFLX1k6nfyqlQdxGn6T8OcbSWTHeWMJ8S9uKGRBXbwUav1O9Mr6dhM8rjNGyi30zjS3Oifky/5sg4iLhMJD13D7Ysx16ff28wL+4kjnZW37i9s5uhIV5deODnsUgcVDNL46vEtRQrcegdPwaQn+qe6BTmLAeVUyiDUMdZ/crlxXUSes9vs8gp57dDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pupiSdfiYlelZ8hj8LAkzXFQxS8VohrA7UJ+J27auok=;
 b=I/tqejLlEM/gP1PMPjuVX3syzO7S2jTB7YOOrslOXn4PM2Cqn6mziN3XckcQMhf5u9WYqjduE1NfgWCKcqStUt6q/rKnhrROtkizF75ynvvovke0N6JOlX7WMt2D8KDUYKo3N8sRFTNxpEg6W/+ag66lH+armQyalaJ26DEFkwoHCzUe9i1XhPjjHFOJ1fFHYItIg5+XDfUyOld6IiDDXwo7GYyty9CEpQqvcMsij3jhtkd1ws3DNjsaUYaOv+KlCXlPnUDFukgn9elO6ulrzt7l8U4BQE6lu9q411Zt9SWYiMmmvLMDZeJ6m17zJfzXBg+QNWYKmMu8/g0ogl8N8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pupiSdfiYlelZ8hj8LAkzXFQxS8VohrA7UJ+J27auok=;
 b=WSdl4M6xMg/oIJvilNds/hXKV/F2I83GTssoErVVd43tZ+CwIferWSfFaZXcWGkAPYsHXKiH53psUY0eNHzzgslK7OTsO9SvvX6erDb+omqIqwq/XNsoYHv2yn23/EVXgyTKJYZpuiJ+g4Cw0ad4/KwWRGRqZ7Cg4JNxlor6ijg=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5680.namprd11.prod.outlook.com (2603:10b6:a03:305::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 05:45:12 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::3455:d126:2541:7723]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::3455:d126:2541:7723%2]) with mapi id 15.20.4649.019; Fri, 5 Nov 2021
 05:45:12 +0000
Content-Type: multipart/mixed; boundary="------------HiF5TMpo8m6yO3Sl91iFDrJ8"
Message-ID: <87094b86-c5c2-ed2e-344a-c70bae4c5bc5@intel.com>
Date:   Fri, 5 Nov 2021 13:45:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [RESEND PATCH v2 7/7] usb: typec: qcom: Add a pm8150b TCPM driver
References: <202110301822.cMPH2aH0-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202110301822.cMPH2aH0-lkp@intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC:     <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>,
        <linux@roeck-us.net>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
From:   kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202110301822.cMPH2aH0-lkp@intel.com>
X-ClientProxiedBy: SG2PR0601CA0001.apcprd06.prod.outlook.com (2603:1096:3::11)
 To SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
MIME-Version: 1.0
Received: from [10.238.2.77] (192.198.143.18) by SG2PR0601CA0001.apcprd06.prod.outlook.com (2603:1096:3::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 05:45:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e13f0427-6b70-4b08-b279-08d9a01f6f33
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5680:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB56806982F1D57FB6821A5317FB8E9@SJ0PR11MB5680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ir3AQGhYJq15XftABqZHx9XN9Iqx9cL+zjyLyHpFD20sOQKO37kuRC56of26YsrkgEw0tb2dCeNopHM5beaghoSOGB4+VGEQMpEZJtI1Sr9eLlEDSLxixJ3DWmGOUyryPLNIOeSFz2rFVvXHd0DODe81LLwOzPYl7dqCekDML7EWNA+aKYtxEey7OBmRtJlQEAwb8arWABsQZ0pQRmW+AnKV3nXhx5i0n2SAPScQevaIZYzSCv1o/LxiuaYB5KUESdk6/FM0g88rebY5vO1pocK5xfxuAM0PzAgVKbl0lKfpatHuu3M2RuqA/ECaDy0/fQt5QdWQMpJUfrPjN2BS4mPc7HKIF8iDBKyAkED9WgXpoAVOpUrPQWKFUUpKm1z9kWkQyFVVWpj9xEdgtewMZkANy+XwR0MMioAWQMi5Pae0NHOqzO9+jayp7PcOliFVKzKFcKaQ8ZYsos/KeuEkUqi8RSaK/u8W6Xi9uO7GJsCFwlnXhC13KCxDNcc6TvpWFdwcXtB1i7U6rmS2ZKocqjSXTJ/BHIeBlXnjXPwzmgNz8dMsZriDuH04tZCu0UlueJpL+joTv2WdxVVafJ7Mv3Pgt4Ijp4bxJcpG5iGfAEhm+jzXXnZpk/KqXiznGzOJAUsZu8oeMbcjnew2m/5yJcY91KxyzlIoQqRsGT7Q+vrrHtsPfL1m9kjKJKi5/ormOt84trG5Pu+R181h6UIVbkiDzvcsaLmjUlOwJ1tpMyRNm/QhWbzbWO47vqTDJYRe4QL09vyQiJhnnCY51Q8O1gbcBVlpF22kZGSjuADHuimOK6Oz6mvI5AGH940kVww
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(82960400001)(186003)(38100700002)(8936002)(4326008)(2906002)(33964004)(26005)(36756003)(966005)(31696002)(956004)(6486002)(8676002)(4001150100001)(508600001)(2616005)(6666004)(66556008)(31686004)(66946007)(235185007)(6916009)(66476007)(86362001)(5660300002)(316002)(16576012)(30864003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXJOd3VSemJJOW1sYUFrU2h3cExYaFhZK0cyTEV1OEprSUZCOFhXbHpiQW4z?=
 =?utf-8?B?aDR2VVpTZDJ6RTlTVXUzdzR0N0c0R0hqNkpzUG52RnJQaE8yMUNaZmx6VHI4?=
 =?utf-8?B?ZFF2VVpGRkxVMTRBMkZ2ZXB1NnhUK2o0ekhxZ3JxRUFZaE4xMkcwb3NNZzI3?=
 =?utf-8?B?cy93L0NMa1VIUHZNblo5VnVSRFl6M2NSeVdGOUpNWXQ4WWpld2xtYkNqR3Ez?=
 =?utf-8?B?VkNyakpBTnFjMGpaYWNnOUdXYUhyamNHSzJJZ2xpZVNERm5DZWJXbVY0L3R4?=
 =?utf-8?B?UlFLSzdGK1BIc1RUVktMbG01ZjRmc3ZNclNDZjdZZE5TSDN0UGJadm9zU2ky?=
 =?utf-8?B?OUkvcUl0K3QvOHV1T3AyOTA0MFhIbW4rTHRUM0hMd0d0WWRLNDRUT2F2Q3Zx?=
 =?utf-8?B?d3kxOG45UnNvOHcvVk9sd2xwNE5nNEF6ZzZWcm02blM3Q3hxTmw1TkxkNUlx?=
 =?utf-8?B?MS9oZkxhZUxwZjFNTndKNVVWTXVuOVY3S3cxdWFxWDdhdWUrb2NVQjZqenZB?=
 =?utf-8?B?VEN5cVpRbHd2RXNJV3d4aU5QZlduZDVWampMVUdoTXAxUTk5emFqcWdLa2NC?=
 =?utf-8?B?UDdIZFZqUjkyZkU3ZVpNNUhnMi9hb0VIdkJDdW9GdVgxajUxMjBBSUhiYU5X?=
 =?utf-8?B?ZWxwN3AxTjlQQm9zbGlLK3I4QTR6UWVGb1U4TGpUbmpzVVM1aDVBeVdyTUgw?=
 =?utf-8?B?S1FvYXRBRzBQbWp3Umw1V1F2ZGdwSHQvSTd3THhIQkRlL3J4UzcxalZvRUtT?=
 =?utf-8?B?OGVhMlozR004MUJVcFlXYkUwSmtQY09lQWNINitnNVQzTmFOY2dwS2xKVnNX?=
 =?utf-8?B?dXNjcTh1T3kxbjJtb3psTjErOVpleFVZemVmdFF6S1pNSGVXOWlibnhROWhY?=
 =?utf-8?B?YTdvV3hySHFHWUcwNWhGVWNuZi9DdlE0QnFpR0U4WVpybmRKRDJlc0NwMFpN?=
 =?utf-8?B?WUdYM1hYMC9Ga1RBU1Rnc1BQb1FCeFBJMnVNL2tVbVBuODJWUVYrbG41bVR1?=
 =?utf-8?B?QmczQnY3SGZlWEhpRUEzQlEwVktJV1kreTdBY3g4ZWtsUGUzZ2gyVzVyRk01?=
 =?utf-8?B?L21VUmxHYXdUbjBMZUIwK25Zb243VWZtckFEaGdXU09Kd1ZGSEFXQTNzNjhr?=
 =?utf-8?B?a2VXLzkyVkQ0blYxa0RBNmZNMWhDc3lSZHo1SDZ3U3Y3b1VXM3B1Zk50RzlL?=
 =?utf-8?B?c01hMUlyazJMYWQwN1A2VkhocDJBNkQvVnVvRDZ6OWhjNDVEM1BFczV2T3Ez?=
 =?utf-8?B?ZC9NMHUrdGp5b2pFdVZxYlIyZkFwbzB4N3NXYmZiTkxpcFgwUUwvV0pvU1U4?=
 =?utf-8?B?dDZiNm1kRnhIQ0dIS3NGZnVtZTgyS3dIbWhkQW44M2VYMzloOVhNTFoxWXln?=
 =?utf-8?B?SFk4RCt3STdETVJNMVlHSW1Ceng4R3JtTnVwTEFZZng3eUFXNGpEN2V4Wklt?=
 =?utf-8?B?Z0haU2RKNWtKWGhUQXVEblNqRjlLbVNMdzlLWkJRYVRQam5rY0wvTWZFQ0ZM?=
 =?utf-8?B?Qk00SUw1dW5hQUU4a3R1MkJHMm9jb2FRa3d3TGxDWU03N2F5aFhKWVZPTTY1?=
 =?utf-8?B?N0NESHdHWWNoVnRBZE5ycExMSm5MTWlEZDUxdW1iRms2UUxJTDFnY0tUVWht?=
 =?utf-8?B?QTludExhcytxcDBTTExFcG8rS3hyRDVWL01yM2xvRUtzOEJNV1NqOWNpREE0?=
 =?utf-8?B?Q1MxNlJjVWZZeklzWFhINCtDb2lRSGo1U2lyYWRhVzRiUEhiRjFSS3RqTG5v?=
 =?utf-8?B?emZwZmtqbmx1ZkEyT3ZFNXNhWEVWWlVWQkpWd05aaldwam91endHMVpmdG1H?=
 =?utf-8?B?azVSR01iTWpPZ0daUWJ3Q2U2QWRyZmdzektueFlNSVpEZm1vS1RtMGx6cDZz?=
 =?utf-8?B?YUVNU1V0NDhKdTNkNGdjckJReXhVem12TW12MFNYaHNFaWlRM1ZRb0w2VTE4?=
 =?utf-8?B?RXQ0YzVCamxaYUJRRmNuZ0lWazFHRDRpUEZobjZ0bmtEQzdUbE5yN29seGlK?=
 =?utf-8?B?QVg5LytxRHpkcWU5UEcwK0ZGaVp0Yk96ZDlvdmZUenV1cnZtRTRFYk92OC9V?=
 =?utf-8?B?MUkyNTUvRzkzaGlLcDBMbWdXWjUza2I2UWM0L1RPdmkrVm9kT3ZVYVpjZTJk?=
 =?utf-8?B?cUZscDdnRE5oc1M5LzB3N3I2YUFQV2VNRUtadmVWbmo3R0pLVWlzNElYQjBU?=
 =?utf-8?Q?McWF00ceUtwfFiZRX+8SNDk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e13f0427-6b70-4b08-b279-08d9a01f6f33
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 05:45:12.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylas2ZcTW1kO4gWIOXiczCcrJwIZLNqz4s7sgZW+8ukevCL6B2QobRuYozfGi0ErnJyu+I8WzXVzZ2vNgph/PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5680
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--------------HiF5TMpo8m6yO3Sl91iFDrJ8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

Thanks for your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next linus/master v5.15-rc7 next-20211029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bryan-O-Donoghue/Add-pm8150b-TPCM-driver/20211029-010406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: riscv-randconfig-c006-20211028 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5db7568a6a1fcb408eb8988abdaff2a225a8eb72)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install riscv cross compiling tool for clang build
         # apt-get install binutils-riscv64-linux-gnu
         # https://github.com/0day-ci/linux/commit/fe4e9d995058581a4428c9c5c91e848eab3beef5
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Bryan-O-Donoghue/Add-pm8150b-TPCM-driver/20211029-010406
         git checkout fe4e9d995058581a4428c9c5c91e848eab3beef5
         # save the attached .config to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.c:214:2: warning: Value stored to 'debounced' is never read [clang-analyzer-deadcode.DeadStores]
            debounced = !!(misc & TYPEC_DEBOUNCE_DONE);
            ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 >> drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.c:308:2: warning: Value stored to 'orientation' is never read [clang-analyzer-deadcode.DeadStores]
            orientation = !!(misc & CC_ORIENTATION);
            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/debounced +214 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.c

fe4e9d99505858 Bryan O'Donoghue 2021-10-28  199  int qcom_pmic_tcpm_typec_get_cc(struct pmic_typec *pmic_typec,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  200  				enum typec_cc_status *cc1,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  201  				enum typec_cc_status *cc2)
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  202  {
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  203  	struct device *dev = pmic_typec->dev;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  204  	unsigned int misc, val;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  205  	bool attached, debounced;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  206  	int ret = 0;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  207
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  208  	ret = regmap_read(pmic_typec->regmap,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  209  			  pmic_typec->base + TYPEC_MISC_STATUS_REG, &misc);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  210  	if (ret)
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  211  		goto done;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  212
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  213  	attached = !!(misc & CC_ATTACHED);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28 @214  	debounced = !!(misc & TYPEC_DEBOUNCE_DONE);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  215
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  216  	if (pmic_typec->debouncing_cc) {
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  217  		ret = -EBUSY;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  218  		goto done;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  219  	}
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  220
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  221  	*cc1 = TYPEC_CC_OPEN;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  222  	*cc2 = TYPEC_CC_OPEN;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  223
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  224  	if (!(attached))
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  225  		goto done;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  226
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  227  	if (misc & SNK_SRC_MODE) {
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  228  		ret = regmap_read(pmic_typec->regmap,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  229  				  pmic_typec->base + TYPEC_SRC_STATUS_REG,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  230  				  &val);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  231  		if (ret)
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  232  			goto done;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  233  		switch (val & DETECTED_SRC_TYPE_MASK) {
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  234  		case SRC_RD_OPEN:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  235  			val = TYPEC_CC_RD;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  236  			break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  237  		case SRC_RD_RA_VCONN:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  238  			val = TYPEC_CC_RD;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  239  			*cc1 = TYPEC_CC_RA;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  240  			*cc2 = TYPEC_CC_RA;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  241  			break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  242  		default:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  243  			dev_warn(dev, "unexpected src status %.2x\n", val);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  244  			val = TYPEC_CC_RD;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  245  			break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  246  		}
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  247  	} else {
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  248  		ret = regmap_read(pmic_typec->regmap,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  249  				  pmic_typec->base + TYPEC_SNK_STATUS_REG,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  250  				  &val);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  251  		if (ret)
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  252  			goto done;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  253  		switch (val & DETECTED_SNK_TYPE_MASK) {
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  254  		case SNK_RP_STD:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  255  			val = TYPEC_CC_RP_DEF;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  256  			break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  257  		case SNK_RP_1P5:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  258  			val = TYPEC_CC_RP_1_5;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  259  			break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  260  		case SNK_RP_3P0:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  261  			val = TYPEC_CC_RP_3_0;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  262  			break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  263  		default:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  264  			dev_warn(dev, "unexpected snk status %.2x\n", val);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  265  			val = TYPEC_CC_RP_DEF;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  266  			break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  267  		}
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  268  		val = TYPEC_CC_RP_DEF;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  269  	}
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  270
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  271  	if (misc & CC_ORIENTATION)
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  272  		*cc2 = val;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  273  	else
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  274  		*cc1 = val;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  275
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  276  done:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  277  	dev_dbg(dev, "get_cc: misc 0x%08x cc1 0x%08x %s cc2 0x%08x %s attached %d cc=%s\n",
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  278  		misc, *cc1, cc_to_name(*cc1), *cc2, cc_to_name(*cc2), !!(misc & CC_ATTACHED),
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  279  		misc_to_cc(misc));
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  280
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  281  	return ret;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  282  }
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  283
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  284  static void qcom_pmic_set_cc_debounce(struct pmic_typec *pmic_typec)
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  285  {
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  286  	pmic_typec->debouncing_cc = true;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  287  	schedule_delayed_work(&pmic_typec->cc_debounce_dwork,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  288  			      msecs_to_jiffies(2));
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  289  }
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  290
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  291  int qcom_pmic_tcpm_typec_set_cc(struct pmic_typec *pmic_typec,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  292  				enum typec_cc_status cc)
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  293  {
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  294  	struct device *dev = pmic_typec->dev;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  295  	unsigned int mode, currsrc;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  296  	unsigned int orientation, misc;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  297  	unsigned long flags;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  298  	int ret;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  299
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  300  	spin_lock_irqsave(&pmic_typec->lock, flags);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  301
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  302  	ret = regmap_read(pmic_typec->regmap,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  303  			  pmic_typec->base + TYPEC_MISC_STATUS_REG,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  304  			  &misc);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  305  	if (ret)
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  306  		goto done;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  307
fe4e9d99505858 Bryan O'Donoghue 2021-10-28 @308  	orientation = !!(misc & CC_ORIENTATION);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  309
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  310  	mode = EN_SRC_ONLY;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  311
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  312  	switch (cc) {
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  313  	case TYPEC_CC_OPEN:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  314  		currsrc = TYPEC_SRC_RP_SEL_80UA;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  315  		break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  316  	case TYPEC_CC_RP_DEF:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  317  		currsrc = TYPEC_SRC_RP_SEL_80UA;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  318  		break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  319  	case TYPEC_CC_RP_1_5:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  320  		currsrc = TYPEC_SRC_RP_SEL_180UA;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  321  		break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  322  	case TYPEC_CC_RP_3_0:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  323  		currsrc = TYPEC_SRC_RP_SEL_330UA;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  324  		break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  325  	case TYPEC_CC_RD:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  326  		currsrc = TYPEC_SRC_RP_SEL_80UA;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  327  		mode = EN_SNK_ONLY;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  328  		break;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  329  	default:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  330  		dev_warn(dev, "unexpected set_cc %d\n", cc);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  331  		ret = -EINVAL;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  332  		goto done;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  333  	}
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  334
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  335  	if (mode == EN_SRC_ONLY) {
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  336  		ret = regmap_write(pmic_typec->regmap,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  337  				   pmic_typec->base + TYPEC_CURRSRC_CFG_REG,
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  338  				   currsrc);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  339  		if (ret)
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  340  			goto done;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  341  	}
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  342
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  343  	pmic_typec->cc = cc;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  344  	qcom_pmic_set_cc_debounce(pmic_typec);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  345  	ret = 0;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  346
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  347  done:
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  348  	spin_unlock_irqrestore(&pmic_typec->lock, flags);
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  349
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  350  	dev_dbg(dev, "set_cc: currsrc=%x %s mode %s debounce %d attached %d cc=%s\n",
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  351  		currsrc, rp_sel_to_name(currsrc),
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  352  		mode == EN_SRC_ONLY ? "EN_SRC_ONLY" : "EN_SNK_ONLY",
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  353  		pmic_typec->debouncing_cc, !!(misc & CC_ATTACHED),
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  354  		misc_to_cc(misc));
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  355
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  356  	return ret;
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  357  }
fe4e9d99505858 Bryan O'Donoghue 2021-10-28  358

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--------------HiF5TMpo8m6yO3Sl91iFDrJ8
Content-Type: application/gzip; name=".config.gz"
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--------------HiF5TMpo8m6yO3Sl91iFDrJ8--
