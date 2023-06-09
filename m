Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5E2F729D3C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 16:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbjFIOsU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 10:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbjFIOsT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 10:48:19 -0400
Received: from pv50p00im-ztdg10012001.me.com (pv50p00im-ztdg10012001.me.com [17.58.6.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DBEE4A
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 07:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
        s=1a1hai; t=1686321748;
        bh=CY8s07ypV5krtUwSmbPxJXUTAsPd9WgEEdu9C5VBRc8=;
        h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
        b=g0ZSzbQBlh0fCfHrXFNLdgRx+0HcvSxltAymOJr29Q5lCYcG9Ye7Jzyn/KAPrvnxJ
         NY0jPg/QpkXFBzscuZz7Id3UI4j11dQ+LTQFJP+coQcyF0BsVQSBCv2JiXRohCnHsi
         5/LNNVDrdyS0pGXRgA5WBPGl49czOwNUlIdeQX2JhAMP2IU+0sdg+99f6dQ10WeYI2
         8X9LRJuZYSrYiBvL9+Xe4QWgnJ0Zz5BLlQ6N5+xkYJdIiYbZlUDmxf6Ntq1elw7Nvi
         0XYK74JkmEWW7kZfee2IzSQXD+OgtND9SfxG9Y/+X6rrMEJoOnmFfbZGbCOMmV6ZR3
         6piAXS/R93dAw==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
        by pv50p00im-ztdg10012001.me.com (Postfix) with ESMTPSA id 7154BA02E9;
        Fri,  9 Jun 2023 14:42:26 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Abdurrahman Eksi <eksizadeeksi@icloud.com>
Mime-Version: 1.0 (1.0)
Date:   Fri, 9 Jun 2023 17:42:22 +0300
Subject: =?utf-8?Q?Re:_=E5=9B=9E=E5=A4=8D:_[PATCH_v4]_bus:_mhi:_host:_pci?=
 =?utf-8?Q?=5Fgeneric:_Add_support_for_quectel's_new_EM160R-GL_prod?=
 =?utf-8?Q?uct?=
Message-Id: <8640F4DE-6B68-4E35-B779-1519BAAB6524@icloud.com>
Cc:     bhelgaas@google.com, duke_xinanwen@163.com,
        fabio.porcedda@gmail.com, jerry.meng@quectel.com,
        koen.vandeputte@citymesh.com, linux-arm-msm@vger.kernel.org,
        loic.poulain@linaro.org, mani@kernel.org, mhi@lists.linux.dev,
        slark_xiao@163.com, song.fc@gmail.com
To:     duke.xin@quectel.com
X-Mailer: iPhone Mail (19H332)
X-Proofpoint-GUID: PEUjI3x2ooztbEPiKjru8NSzWGTVMVGS
X-Proofpoint-ORIG-GUID: PEUjI3x2ooztbEPiKjru8NSzWGTVMVGS
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 clxscore=1011
 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=848 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
