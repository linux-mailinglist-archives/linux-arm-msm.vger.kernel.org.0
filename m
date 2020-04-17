Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081AA1ADAF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 12:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbgDQKYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 06:24:35 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:33730 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgDQKYf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 06:24:35 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03HAOIUK144895;
        Fri, 17 Apr 2020 10:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=MLO25+uu0p1lJymH6NFPaGxDp70jIn+676ep69GijtY=;
 b=ML+VRCiAPW6O4RJ9+mw3z4cV+yo+IkuCjjm2nmF7rW3uBvSDQFmzzAWhfCt0yrcgNHiR
 xp/40Qa78iZECt3yOT/UYOxFzwOnfjXFv3lAjANPhZKGgyuEpeJ1hU18J4c5S7PSwq+Q
 VggjoB1hfzqV8/8PnmzB85psTYVeshzsiFAqpDPlEnAzfRWfhDbOYCzzIWAJpyOzA+NO
 JHzIiRvmaNXIbjISABgikDIcU9GgXc5p1QyOsuUaACf0FmaDX5tEuJVOGx2wpuwstjlP
 ogvciNFi8xR78R+6uFecobRrAKI8S6e9xzeBxYu4AgHDCNpsUFmBQlIJ/90P86oPo2Ps kQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 30emejp5ex-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Apr 2020 10:24:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03HAMBEi131502;
        Fri, 17 Apr 2020 10:24:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 30dn9jjn8p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Apr 2020 10:24:30 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03HAOT7W011924;
        Fri, 17 Apr 2020 10:24:29 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 17 Apr 2020 03:24:28 -0700
Date:   Fri, 17 Apr 2020 13:24:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
Message-ID: <20200417102420.GR1163@kadam>
References: <20200407135559.GA109574@mwanda>
 <20200407143304.GH2442@Mani-XPS-13-9360>
 <d30c7648-b657-d8b2-ba64-71f1178b4a68@codeaurora.org>
 <20200417101428.GA10295@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417101428.GA10295@Mani-XPS-13-9360>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9593 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004170082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9593 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004170082
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 17, 2020 at 03:44:28PM +0530, Manivannan Sadhasivam wrote:
> Hi Hemant,
> 
> On Thu, Apr 16, 2020 at 08:37:16PM -0700, Hemant Kumar wrote:
> > 
> > On 4/7/20 7:33 AM, Manivannan Sadhasivam wrote:
> > > Hi Dan,
> > > 
> > > On Tue, Apr 07, 2020 at 04:55:59PM +0300, Dan Carpenter wrote:
> > > > Hello Manivannan Sadhasivam,
> > > > 
> > > > The patch 189ff97cca53: "bus: mhi: core: Add support for data
> > > > transfer" from Feb 20, 2020, leads to the following static checker
> > > > warning:
> > > > 
> > > > 	drivers/bus/mhi/core/main.c:1153 mhi_queue_buf()
> > > > 	error: double locked 'mhi_chan->lock' (orig line 1110)
> > > > 
> > > > drivers/bus/mhi/core/main.c
> > > >    1142          }
> > > >    1143
> > > >    1144          /* Toggle wake to exit out of M2 */
> > > >    1145          mhi_cntrl->wake_toggle(mhi_cntrl);
> > > >    1146
> > > >    1147          if (mhi_chan->dir == DMA_TO_DEVICE)
> > > >    1148                  atomic_inc(&mhi_cntrl->pending_pkts);
> > > >    1149
> > > >    1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
> > > >    1151                  unsigned long flags;
> > > >    1152
> > > >    1153                  read_lock_irqsave(&mhi_chan->lock, flags);
> > 
> > parse_xfer_event is taking read lock : read_lock_bh(&mhi_chan->lock); first
> > and later
> > 
> > mhi_queue_buf takes read lock: read_lock_irqsave(&mhi_chan->lock, flags);
> > 
> > Both are read locks which are recursive, is this problematic ?
> > 
> 
> read_locks are recursive but I wanted to make the static checker happy.

Don't do things just to make the static checker happy.

regards,
dan carpenter

