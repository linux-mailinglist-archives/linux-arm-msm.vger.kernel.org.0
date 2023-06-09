Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9487729D2E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 16:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240813AbjFIOoG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 10:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbjFIOoG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 10:44:06 -0400
X-Greylist: delayed 96 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Jun 2023 07:44:05 PDT
Received: from pv50p00im-ztdg10011201.me.com (pv50p00im-ztdg10011201.me.com [17.58.6.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767BAE43
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 07:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
        s=1a1hai; t=1686321845;
        bh=CY8s07ypV5krtUwSmbPxJXUTAsPd9WgEEdu9C5VBRc8=;
        h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
        b=oMQatZKhcCUdUWmylcG+gVoA6xxXtVjCBxCeTgwg2D0WZf+qSE1iPpxdRdlVdWmex
         KhQIc+FkB1q1yDkE0Yp0V4pvDK05MeZnZ1SvKA1gtMBRvLiqlZrC6bXKzZ009X1QB1
         6U0Ox/8T4ZG2Z7o8zqBjU7x00k3NpFPpAni8Y0Cy/HbbaID0dk6vtHHe6RDBvAkY9O
         m4kYCAXv5iUSnQWis1yskxMXwlkwDVPkHikKtZb+jYgBDZ+/lXitZ9upWvrSry5Xq/
         KxI/hg4nkG2XQkhZWKNb7gcBjVd2Ayr7v2TSPsGY8DF6GIbyN+vKiHpPWHBCE4flUl
         zdz7f7GRLHXDw==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
        by pv50p00im-ztdg10011201.me.com (Postfix) with ESMTPSA id 379D1680309;
        Fri,  9 Jun 2023 14:44:03 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Abdurrahman Eksi <eksizadeeksi@icloud.com>
Mime-Version: 1.0 (1.0)
Date:   Fri, 9 Jun 2023 17:43:59 +0300
Subject: =?utf-8?Q?Re:_=E5=9B=9E=E5=A4=8D:_[PATCH_v4]_bus:_mhi:_host:_pci?=
 =?utf-8?Q?=5Fgeneric:_Add_support_for_quectel's_new_EM160R-GL_prod?=
 =?utf-8?Q?uct?=
Message-Id: <E8738161-65CE-40B8-B8D5-00DA6A21D367@icloud.com>
Cc:     bhelgaas@google.com, duke_xinanwen@163.com,
        fabio.porcedda@gmail.com, jerry.meng@quectel.com,
        koen.vandeputte@citymesh.com, linux-arm-msm@vger.kernel.org,
        loic.poulain@linaro.org, mani@kernel.org, mhi@lists.linux.dev,
        slark_xiao@163.com, song.fc@gmail.com
To:     duke.xin@quectel.com
X-Mailer: iPhone Mail (19H332)
X-Proofpoint-ORIG-GUID: BS1t2JlJDTl1OhGfB3OLP2Hnq1hn9-jr
X-Proofpoint-GUID: BS1t2JlJDTl1OhGfB3OLP2Hnq1hn9-jr
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=848 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2306090123
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

X

iPhone=E2=80=99umdan g=C3=B6nderildi=
