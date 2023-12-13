Return-Path: <linux-arm-msm+bounces-4497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D1E8108BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 04:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3D0A1F21AA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 03:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8D863A0;
	Wed, 13 Dec 2023 03:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="JK8gUTZX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4712CB0;
	Tue, 12 Dec 2023 19:25:31 -0800 (PST)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BD2LqBh013286;
	Tue, 12 Dec 2023 19:25:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=oHEWwWS/d+ov9oePzS5N8MzuKRMw9eiK625IUaQWN7E=; b=
	JK8gUTZXHPvpSOmd5yh39qi5MxiksPE2stT8b+AeTFA9zI3kZRacQz+d6wt0jFtC
	eLDYTH9SFVtCHY8jxavgvPE6rRfNIw10TC4d/Cr4VN7e6K7Xj1KZD7ftFopaFb2u
	cyIc7eHhUFmw+BxuHgzie5L46J+0YIluMDSWq9UpwXD5tEA9aMwf9cefNKaQ7mwu
	YNcaxPvnPtgHqC/zeGDWoaxVyyLh41jkA0/HTHLwhVrhJRv78+YGyXN/dyOijW54
	F0n/Y4uWjAIcGJzMbMADD5FxxrsiRQ5t2AUUtuW8mzNzBCD4TPMW6wx9wkORy2AM
	o6e5ms9XJvIc116ttNRURw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uwyxja1f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 Dec 2023 19:25:09 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 19:25:13 -0800
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 19:25:10 -0800
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <lkp@intel.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <lizhi.xu@windriver.com>, <mani@kernel.org>, <netdev@vger.kernel.org>,
        <oe-kbuild-all@lists.linux.dev>, <pabeni@redhat.com>,
        <syzbot+006987d1be3586e13555@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH] radix-tree: fix memory leak in radix_tree_insert
Date: Wed, 13 Dec 2023 11:25:04 +0800
Message-ID: <20231213032504.2133661-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202312120651.92GGXeX4-lkp@intel.com>
References: <202312120651.92GGXeX4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9iluF6xhpeAdVt-FoAhNtKxtKrWPHrdW
X-Proofpoint-GUID: 9iluF6xhpeAdVt-FoAhNtKxtKrWPHrdW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=789 adultscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130022

On Tue, 12 Dec 2023 07:16:50 +0800, kernel test robot <lkp@intel.com> wrote:
> kernel test robot noticed the following build warnings:
>    lib/radix-tree.c:558:24: sparse:     got struct xa_node [noderef] __rcu *parent
> >> lib/radix-tree.c:653:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *pn @@     got struct xa_node [noderef] __rcu *parent @@
>    lib/radix-tree.c:653:28: sparse:     expected struct xa_node *pn
>   651			struct radix_tree_node *pn;
>   652			while (shift < mmshift && node) {
> > 653				pn = node->parent;
It can be clarified here that node->parent is the type just alloced as 
"struct radix_tree node *", so there is no need to use cast type conversion,  
Please ignore this warning.

BR,
Lizhi


