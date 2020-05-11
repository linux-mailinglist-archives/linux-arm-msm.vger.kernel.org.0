Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD171CE2F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 20:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbgEKSnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 14:43:35 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56102 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729727AbgEKSne (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 14:43:34 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04BIREs5162785;
        Mon, 11 May 2020 18:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ipZEsRzQpAd3YeSqXHHV6cyBJrvAY2iFbiN9Tq/iOIA=;
 b=z8uFppRsbqNeWz9BAAySEDB+0vzSJHlXxJFzBfgVzBNeuIb8f4m2MCdaY+2dvXfvfYcf
 uztISlNoirk+eaq10PEqWlUQ/uWNLMNxdc8jRSx+tQSST2aUlwsS6burHLvEh/fC7Y01
 1bHkg0bLzop3QGjbY6bbjmoJg7b6w9QrtrX4bKyXYwHPxQ51Zb7h762V0GF2npAnrOvG
 /r12YvQJkSJ7ud+9EH06bzImJwgzhabIlKUG/bGp1YQfxreiKBruGUiO21EJids2696V
 Ts1YKVmIu+v7mPgiLnaZqZXGNAcFbJ3v+tCEKv6RbH8VeiAaR5RGpQNjpqypBlQa4Arw cg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 30x3mbpub9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 May 2020 18:43:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04BITfw2174062;
        Mon, 11 May 2020 18:43:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 30x69rj4bf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 May 2020 18:43:20 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04BIhHnS020044;
        Mon, 11 May 2020 18:43:17 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 11 May 2020 11:43:16 -0700
Date:   Mon, 11 May 2020 21:43:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Walter Harms <wharms@bfs.de>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] bus: mhi: core: Fix some error return code
Message-ID: <20200511184306.GI9365@kadam>
References: <20200509075654.175002-1-weiyongjun1@huawei.com>
 <20200511103124.GA12753@mani>
 <78d3f7d7be1849138df7dcf9d49177b5@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78d3f7d7be1849138df7dcf9d49177b5@bfs.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9618 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005110141
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9618 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005110141
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 02:26:10PM +0000, Walter Harms wrote:
> Hello guys,
> some nitpicking ...
> the prefered kernalstyle is:
> 
> if (condition)
>    set error_code
>    do something
> 
> from what i can see it is
> 
>  set error_code
>       if (condition)

There isn't a prefered style.  Both are accepted.  Most people have a
personal preference, but there isn't an official preference.

regards,
dan carpenter

