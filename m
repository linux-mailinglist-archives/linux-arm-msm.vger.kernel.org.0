Return-Path: <linux-arm-msm+bounces-71590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57706B4005D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E86317B6830
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123A442065;
	Tue,  2 Sep 2025 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnOqo/4O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D2927A124
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815723; cv=none; b=lAfQSRUMs4ydg40+eYn3lsh4acRiMFROhODdcgUXtBbnfQMdLQWBdVbKSaFqC4nuZEWMvfLEvhPMB1J0KTUoO1L1NgELdzoPs0oNQ1FWDxAC0xEXZND/+wLb8cTy5XATRaBFcEVSeySa0Eb8hnoaCGVQjaFAxcsTVeVeHfEK/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815723; c=relaxed/simple;
	bh=ap3kBXpxvyJ7Lb20rKEK5xpWR0asUl3cXM4pqomtyeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+iEKZgd80byQ75neXjnq2uqF4M0xyelApZTQIhKRCMSJUFLAXlBJL+AM0MuZMXoDfc/073Pp2/YDR2wlb9FnYVMFomTOgJsM0cOyyw5+m8tuR3zd+eM13yHpEgTyZBhMYxXdzVJZXhu87l5khjjQRNmBiwqsAC/eezozBI7F+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnOqo/4O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582A0Dfg022293
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GdDcm1pPA+690g+TUeCkBcNloEFTwRmM8eHgs04Vf+E=; b=VnOqo/4ORtqBxRxu
	dHeScBQBuYdbLYZnx/DhTH92bz9d1ZQhOEL+jpx/WYq5PEk8Vp2morLRjXoJN4lS
	By5lxcTSfVSZHenAg3lAux58/+oreiC3xlGL1gwki6VFbA2Bu+UedTNwqLZJFXCc
	4y5OqBmNzRqVlTLr0o3Kuad0uDzqqYhfPV534+YjF4XBX3QpXff1mgr/RTAvORYb
	dFgDZS/e0m+Sw4unQP1cDDWcFbtUBDdPRGji/lxXgk6aOmNQo3lnTY5G7fzrU6uK
	jn6tM/PumqY+JKdgGZftoiT+/6J1HmtqpPku3vwJ25blkO9HxjjeXjUiD4T2GeOq
	4MnAwQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp7w0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:22:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7211f13bc24so8955996d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815719; x=1757420519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdDcm1pPA+690g+TUeCkBcNloEFTwRmM8eHgs04Vf+E=;
        b=UOeb4+Gsegs7PU6na5tEdU4zT8+CfF+cT/JZ8P7ElaTvA+QqwkPjznYbT6FrYNpSe6
         B7Pzhu3fZS29iCfFZwBhyG8PLGh0eVcbYjtxor/3loo9TXOZ+CfMo3HTsX/gkAR4J2yj
         6bJlpJ3HnI2sYiJlSnSbT9GxMOq8X12naPkwBaJb9qlYhTkQRFNCiZ0WEWb3luGd9rt0
         vCOOKWFpHo8NA+xXBMeips+K61nsxlHhZ3Ct7VT3EK4en8j9G5dTnY5Je8fSUw8Kvp2P
         eydC0LFp0FyYniKyw7jliTgST3dspXrjTBVXeqYU+ahrPb3QK4mxTL16mMTErNbPCWSB
         YiSA==
X-Forwarded-Encrypted: i=1; AJvYcCVWqaOTF3yraXfNI7O5vdULuq44ZIeuLS9M0lQwlSxNfPoJViJK9ywKVCz8HJdDa68BTJuUSmeKk/jTSosf@vger.kernel.org
X-Gm-Message-State: AOJu0YyKmqMXOU1vtV69RSEPtjaDC4tjnqigIjxDBcXdtPLcIMRpx9A4
	vaWt7EROhe2Rhwh5waPOnFU2ZeTwPnS7qX7NrXsYjuzGotTBJ/nlqm+YC8LvYh00/mlSiapYeIu
	1HI1wuFjKdyou1JXU8gqUJw00pFmI4YJBIjlg4qEXVoxIzHXhmzQlX8qNgqMMBjVR+G3X
X-Gm-Gg: ASbGnctpV9sEu1cn2JkIYWADAIMvfadIPhM8S9bE4gbnf75iygX1cYeoUR6u4c5qJum
	sq9PVOlVUEnj8QJjNv5fZ40lg1dfdrdtJJ0nSEQjPO0wsbj1BfEjbQN44qp06x65uRX8ORF08p5
	SyMF2/A16aC8hx3t1h36hSrXUn9sWirN6A6MAVjwCftdgYNXNC5LmjIqqJcJTWxFsMyWtBpeM7Z
	hePlZQIyQB7LROV+IchMQ/Vqe59Ellwvn6uvjcoQxo9UUoYEI6Vv7zRfG02gqbQPhkNJJTM5YZs
	Z5bIjUbUQeW5CaNnuYwtsNcgi+fuAWn5cKErYbet2B1SPodPOUuDSeZfu+UPIQGaCPo=
X-Received: by 2002:a05:6214:2b0a:b0:715:b3b4:3dca with SMTP id 6a1803df08f44-715b4008c59mr89663536d6.61.1756815719009;
        Tue, 02 Sep 2025 05:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9wa99YxWc0KmCjnw35EiTSnM8Lj2uAWvqOXuvGUw99Z2V2CZAizJnqDpJXZko+cJCA5uqgA==
X-Received: by 2002:a05:6214:2b0a:b0:715:b3b4:3dca with SMTP id 6a1803df08f44-715b4008c59mr89662976d6.61.1756815718141;
        Tue, 02 Sep 2025 05:21:58 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b85090262sm146498895e9.17.2025.09.02.05.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:21:57 -0700 (PDT)
Message-ID: <a5343bae-af16-48ed-b113-aa8a76986691@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 13:21:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] of: base: Add of_property_read_u8_index
To: kernel test robot <lkp@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, conor+dt@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250901195037.47156-2-srinivas.kandagatla@oss.qualcomm.com>
 <202509021915.6WBFuf9m-lkp@intel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <202509021915.6WBFuf9m-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GkWkv84YxJfpet3-gAyl6iGc-2vG0cli
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6e168 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=CoiT50wjLESuYxH19fwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: GkWkv84YxJfpet3-gAyl6iGc-2vG0cli
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX9wdeS+jgiFDT
 7Zo/sHMPTnw5iWFoUhQ5oGTTE7VD/Utpi0HwQvcPRXFnA2J0NvafV9TKYWm5Q6fbQnuKtXIpwr7
 +WAZAG1lFoDiUF5FfcVLvV0FtEq1x6VDl5R0t/51lkJaCjBhcnZ4G9fdZCN3KT9nK5AHV24xBQ5
 oD9eqtvQx+j4oAa52PnGiWIIyjIpaTeQurAvlqgYmVLb/MkTaUD6vPscC54ciYLswhVXMWwGHkw
 sNmcMwqI6Jh/3M5ifDkl0iU1fvFcmscB4RA+fwwJmQt5PuHGT2TAhdEiC8CUpoKrFzivz5m6jmy
 1ZK/dU8A2B1XF5zsfZm5uMqt+MbnR2E8XgL7Ze2cfslaj7uw/sQb55F2C5ozHb/UvazgaUYNCQb
 IMQ1GvBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001



On 9/2/25 12:34 PM, kernel test robot wrote:
> Hi Srinivas,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on linus/master v6.17-rc4 next-20250902]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/of-base-Add-of_property_read_u8_index/20250902-035407
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20250901195037.47156-2-srinivas.kandagatla%40oss.qualcomm.com
> patch subject: [PATCH 1/7] of: base: Add of_property_read_u8_index
> config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250902/202509021915.6WBFuf9m-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021915.6WBFuf9m-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509021915.6WBFuf9m-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from init/main.c:56:
>    In file included from include/linux/tick.h:8:
>    In file included from include/linux/clockchips.h:14:
>    In file included from include/linux/clocksource.h:19:
>>> include/linux/of.h:645:8: error: unknown type name 'inlinen'; did you mean 'inline'?
>      645 | static inlinen int of_property_read_u8_index(const struct device_node *np,
>          |        ^~~~~~~
>          |        inline
>    1 error generated.
Opps sorry, not sure how it ended up this way,.. will fix this in v2.

--srini
> 
> 
> vim +645 include/linux/of.h
> 
>    644	
>  > 645	static inlinen int of_property_read_u8_index(const struct device_node *np,
>    646				const char *propname, u32 index, u8 *out_value)
>    647	{
>    648		return -ENOSYS;
>    649	}
>    650	
> 


