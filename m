Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E53CA5F736A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Oct 2022 05:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbiJGDo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 23:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJGDo0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 23:44:26 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75003BEFAE
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 20:44:23 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20221007034421epoutp03f07f8cf0cb880b4ee64ad9f6f39db755~brJlGi_uG2311023110epoutp03a
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Oct 2022 03:44:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20221007034421epoutp03f07f8cf0cb880b4ee64ad9f6f39db755~brJlGi_uG2311023110epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1665114261;
        bh=Loj4wWO6Wu0NkXkYpUmThRaJQ0m30/PbCFt7YNRtD8Y=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=Ly6HyrOD7Z1JtwKGVltbP3QHJnv3+2EE85oxAtG05iulOyNYnCAKSQviuGPxu7eFw
         84aDIDhHflyuVbdROy0DNsgwdG0usnaat5dYfC3mp4MA8mYmolX/7k4XMTSQPG3KZ0
         ouQ8BNp4J30N9jPdPg7skLuvUMhzcwDU+NYOT/UM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20221007034420epcas2p4db5c7c5d966140087d37cd346cf244f2~brJkhPjE91817918179epcas2p4z;
        Fri,  7 Oct 2022 03:44:20 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.89]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4MkDh439Chz4x9Pw; Fri,  7 Oct
        2022 03:44:20 +0000 (GMT)
X-AuditID: b6c32a48-1cffb7000000186f-66-633fa0949f8e
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        86.E7.06255.490AF336; Fri,  7 Oct 2022 12:44:20 +0900 (KST)
Mime-Version: 1.0
Subject: RE:(2) [PATCH v2 06/17] ufs: core: mcq: Configure resource regions
Reply-To: daejun7.park@samsung.com
Sender: Daejun Park <daejun7.park@samsung.com>
From:   Daejun Park <daejun7.park@samsung.com>
To:     Daejun Park <daejun7.park@samsung.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
        "quic_bhaskarv@quicinc.com" <quic_bhaskarv@quicinc.com>,
        "quic_richardp@quicinc.com" <quic_richardp@quicinc.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_xiaosenh@quicinc.com" <quic_xiaosenh@quicinc.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "beanhuo@micron.com" <beanhuo@micron.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20221007024138epcms2p729595abf03da8402618c4803b20a4d13@epcms2p7>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20221007034419epcms2p84f51fef929459cef230c34c1dbfbff1d@epcms2p8>
Date:   Fri, 07 Oct 2022 12:44:19 +0900
X-CMS-MailID: 20221007034419epcms2p84f51fef929459cef230c34c1dbfbff1d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmhe6UBfbJBt2XOSxe/rzKZnHwYSeL
        xbQPP5ktXh7StFj1INxi4v6z7Bbd13ewWRz4sIrRYmHHXBaLI4/fM1tMuraBzWLqi+PsFjvu
        tzNanDoUavF9wnZ2i6uLr7I7CHhcvuLtsWlVJ5vH9/UdbB4T99R59G1ZxejxeZOcR/uBbqYA
        9qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygw5UU
        yhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ
        2RkzD65iL1ibXDH3+QLGBsZHCV2MnBwSAiYSk1fsZe9i5OIQEtjBKNG05wpzFyMHB6+AoMTf
        HcIgNcIC3hK9mzeygthCAkoS6y/OYoeI60nceriGEcRmE9CRmH7iPtgcEYGNzBIPZ20CSzAL
        PGWS2NcUC7GMV2JG+1MWCFtaYvvyrWA1nAJ+ElvuPmCHiGtI/FjWywxhi0rcXP2WHcZ+f2w+
        I4QtItF67yxUjaDEg5+7oeKSErfnboKqz5f4f2U5lF0jse3APChbX+Jax0awG3gFfCXmnPoI
        9hiLgKrEjEtvoW5zkVi2o4cN4n5tiWULX4PDhFlAU2L9Ln0QU0JAWeLILRaYrxo2/mZHZzML
        8El0HP4LF98x7wkThK0mse7neqYJjMqzEAE9C8muWQi7FjAyr2IUSy0ozk1PLTYqMIHHbXJ+
        7iZGcBLW8tjBOPvtB71DjEwcjIcYJTiYlUR4d+60SxbiTUmsrEotyo8vKs1JLT7EaAr05URm
        KdHkfGAeyCuJNzSxNDAxMzM0NzI1MFcS5+2aoZUsJJCeWJKanZpakFoE08fEwSnVwKRy4bZg
        aEBdVOqvGb2XxAR9tG0mTiw+rLjk1a24G5sZFFqSlPbm/VGaOWOzymQF/dudeSlcKXknVXhT
        p6y79fbbspnHml7xbF3uuz0z0Foo89Luy+os67aKObffWyS5y+1OfTtnuP1jmw9Hvk6LvCDa
        lHV0V/c2q4OcTa/LXr5YPSNgtcbuuF+S0n+qm/ZFxr03XbWJl2fnvXepMVVS/PfbWsWVbLf3
        Z+1cnyXxdc++l9pv5zO9kFfdM+Xv+daM83Zh39czTF9WeIsnKu8fg0jHTS/L+36XrTUMdzRs
        +ixkrSMp8PzetsL6UKOnb58mX/GrvF3Sc7RP6fpKxsPVF5dXTVlRuEfquNlHFp4tYlVKLMUZ
        iYZazEXFiQBKavUhSwQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221006010745epcas2p38b37890b7e1fefb45b8fbb0e14ab0a82
References: <20221007024138epcms2p729595abf03da8402618c4803b20a4d13@epcms2p7>
        <271ed77a0ff46390c90fdcde71890d8cec83b8c9.1665017636.git.quic_asutoshd@quicinc.com>
        <cover.1665017636.git.quic_asutoshd@quicinc.com>
        <CGME20221006010745epcas2p38b37890b7e1fefb45b8fbb0e14ab0a82@epcms2p8>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Asutosh=C2=A0Das,=0D=0A=0D=0A>Define=C2=A0the=C2=A0mcq=C2=A0resources=C2=
=A0and=C2=A0add=C2=A0support=C2=A0to=C2=A0ioremap=0D=0A>the=C2=A0resource=
=C2=A0regions.=0D=0A>=0D=0A>Co-developed-by:=C2=A0Can=C2=A0Guo=C2=A0<quic_c=
ang=40quicinc.com>=0D=0A>Signed-off-by:=C2=A0Can=C2=A0Guo=C2=A0<quic_cang=
=40quicinc.com>=0D=0A>Signed-off-by:=C2=A0Asutosh=C2=A0Das=C2=A0<quic_asuto=
shd=40quicinc.com>=0D=0A>---=0D=0A>=C2=A0drivers/ufs/core/ufs-mcq.c=C2=A0=
=7C=C2=A099=C2=A0++++++++++++++++++++++++++++++++++++++++++++++=0D=0A>=C2=
=A0include/ufs/ufshcd.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7C=C2=A02=
8=C2=A0+++++++++++++=0D=0A>=C2=A02=C2=A0files=C2=A0changed,=C2=A0127=C2=A0i=
nsertions(+)=0D=0A>=0D=0A>diff=C2=A0--git=C2=A0a/drivers/ufs/core/ufs-mcq.c=
=C2=A0b/drivers/ufs/core/ufs-mcq.c=0D=0A>index=C2=A0659398d..7d0a37a=C2=A01=
00644=0D=0A>---=C2=A0a/drivers/ufs/core/ufs-mcq.c=0D=0A>+++=C2=A0b/drivers/=
ufs/core/ufs-mcq.c=0D=0A>=40=40=C2=A0-18,6=C2=A0+18,11=C2=A0=40=40=0D=0A>=
=C2=A0=23define=C2=A0UFS_MCQ_NUM_DEV_CMD_QUEUES=C2=A01=0D=0A>=C2=A0=23defin=
e=C2=A0UFS_MCQ_MIN_POLL_QUEUES=C2=A00=0D=0A>=C2=A0=0D=0A>+=23define=C2=A0MC=
Q_QCFGPTR_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GENMASK(7,=C2=
=A00)=0D=0A>+=23define=C2=A0MCQ_QCFGPTR_UNIT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00x200=0D=0A>+=23define=C2=A0MCQ_SQATTR_OFFSET(c)=C2=A0=5C=
=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0((((c)=C2=A0>>=C2=
=A016)=C2=A0&=C2=A0MCQ_QCFGPTR_MASK)=C2=A0*=C2=A0MCQ_QCFGPTR_UNIT)=0D=0A>+=
=23define=C2=A0MCQ_QCFG_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x40=0D=0A>=C2=A0=0D=0A>=C2=A0static=C2=A0int=C2=A0rw_queue_count_set(co=
nst=C2=A0char=C2=A0*val,=C2=A0const=C2=A0struct=C2=A0kernel_param=C2=A0*kp)=
=0D=0A>=C2=A0=7B=0D=0A>=40=40=C2=A0-67,6=C2=A0+72,97=C2=A0=40=40=C2=A0modul=
e_param_cb(poll_queues,=C2=A0&poll_queue_count_ops,=C2=A0&poll_queues,=C2=
=A00644);=0D=0A>=C2=A0MODULE_PARM_DESC(poll_queues,=0D=0A>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=22Number=C2=A0of=C2=A0poll=C2=A0queues=C2=A0used=C2=A0fo=
r=C2=A0r/w.=C2=A0Default=C2=A0value=C2=A0is=C2=A01=22);=0D=0A>=C2=A0=0D=0A>=
+/*=C2=A0Resources=C2=A0*/=0D=0A>+static=C2=A0const=C2=A0struct=C2=A0ufshcd=
_res_info=C2=A0ufs_res_info=5BRES_MAX=5D=C2=A0=3D=C2=A0=7B=0D=0A>+=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7B.name=C2=A0=3D=C2=A0=22ufs_mem=22=
,=7D,=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7B.name=C2=A0=
=3D=C2=A0=22mcq=22,=7D,=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0/*=C2=A0Submission=C2=A0Queue=C2=A0DAO=C2=A0*/=0D=0A>+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7B.name=C2=A0=3D=C2=A0=22mcq_sqd=22,=7D,=
=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*=C2=A0Submission=
=C2=A0Queue=C2=A0Interrupt=C2=A0Status=C2=A0*/=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=7B.name=C2=A0=3D=C2=A0=22mcq_sqis=22,=7D,=0D=0A=
>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*=C2=A0Completion=C2=A0Q=
ueue=C2=A0DAO=C2=A0*/=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=7B.name=C2=A0=3D=C2=A0=22mcq_cqd=22,=7D,=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/*=C2=A0Completion=C2=A0Queue=C2=A0Interrupt=C2=
=A0Status=C2=A0*/=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=7B.name=C2=A0=3D=C2=A0=22mcq_cqis=22,=7D,=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/*=C2=A0MCQ=C2=A0vendor=C2=A0specific=C2=A0*/=0D=0A=
>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7B.name=C2=A0=3D=C2=A0=
=22mcq_vs=22,=7D,=0D=0A>+=7D;=0D=0A>+=0D=0A>+static=C2=A0int=C2=A0ufshcd_mc=
q_config_resource(struct=C2=A0ufs_hba=C2=A0*hba)=0D=0A>+=7B=0D=0A>+=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct=C2=A0platform_device=C2=A0=
*pdev=C2=A0=3D=C2=A0to_platform_device(hba->dev);=0D=0A>+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct=C2=A0ufshcd_res_info=C2=A0*res;=0D=0A>=
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct=C2=A0resource=C2=A0=
*res_mem,=C2=A0*res_mcq;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0int=C2=A0i,=C2=A0ret=C2=A0=3D=C2=A00;=0D=0A>+=0D=0A>+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memcpy(hba->res,=C2=A0ufs_res_info,=C2=A0s=
izeof(ufs_res_info));=0D=0A>+=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0for=C2=A0(i=C2=A0=3D=C2=A00;=C2=A0i=C2=A0<=C2=A0RES_MAX;=C2=A0i=
++)=C2=A0=7B=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res=C2=A0=3D=C2=A0&hba->res=5Bi=
=5D;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res->resource=C2=A0=3D=C2=A0platform_get_r=
esource_byname(pdev,=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0IORESOURCE_MEM,=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res->name);=0D=0A>+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0if=C2=A0(=21res->resource)=C2=A0=7B=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_info(hba->dev,=C2=A0=22Resour=
ce=C2=A0%s=C2=A0not=C2=A0provided=5Cn=22,=C2=A0res->name);=0D=0A>+=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if=C2=A0(i=C2=
=A0=3D=3D=C2=A0RES_UFS)=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
return=C2=A0-ENOMEM;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0continue;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7D=C2=A0els=
e=C2=A0if=C2=A0(i=C2=A0=3D=3D=C2=A0RES_UFS)=C2=A0=7B=0D=0A>+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res_mem=C2=A0=3D=C2=
=A0res->resource;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0res->base=C2=A0=3D=C2=A0hba->mmio_base;=0D=0A>+=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0continue;=0D=
=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=7D=0D=0A>+=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res->b=
ase=C2=A0=3D=C2=A0devm_ioremap_resource(hba->dev,=C2=A0res->resource);=0D=
=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if=C2=A0(IS_ERR(res->base))=C2=A0=7B=0D=0A>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_err(h=
ba->dev,=C2=A0=22Failed=C2=A0to=C2=A0map=C2=A0res=C2=A0%s,=C2=A0err=3D%d=5C=
n=22,=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res->name,=C2=A0(int)PTR_ERR(res->base)=
);=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0res->base=C2=A0=3D=C2=A0NULL;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret=C2=A0=3D=C2=A0PTR_ERR(res->base)=
;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return=C2=A0ret;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7D=0D=0A>+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7D=0D=0A>+=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/*=C2=A0MCQ=C2=A0resource=C2=A0provided=C2=A0in=
=C2=A0DT=C2=A0*/=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res=
=C2=A0=3D=C2=A0&hba->res=5BRES_MCQ=5D;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/*=C2=A0Bail=C2=A0if=C2=A0NCQ=C2=A0resource=C2=A0is=C2=
=A0provided=C2=A0*/=0D=0AMaybe=20MCQ?=0D=0A=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if=C2=A0(res->base)=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0got=
o=C2=A0out;=0D=0A>+=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
/*=C2=A0Manually=C2=A0allocate=C2=A0MCQ=C2=A0resource=C2=A0from=C2=A0ufs_me=
m=C2=A0*/=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res_mcq=C2=
=A0=3D=C2=A0res->resource;=0D=0AWhy=20we=20assign=20the=20value=20to=20res_=
mcq?=0D=0A=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res_mcq=
=C2=A0=3D=C2=A0devm_kzalloc(hba->dev,=C2=A0sizeof(*res_mcq),=C2=A0GFP_KERNE=
L);=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if=C2=A0(=21res_=
mcq)=C2=A0=7B=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_err(hba->dev,=C2=A0=22Failed=
=C2=A0to=C2=A0allocate=C2=A0MCQ=C2=A0resource=5Cn=22);=0D=0A>+=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0return=C2=A0ret;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=7D=0D=0A>+=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0re=
s_mcq->start=C2=A0=3D=C2=A0res_mem->start=C2=A0+=0D=0A>+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MCQ_SQATTR_OFFSET(=
hba->mcq_capabilities);=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0res_mcq->end=C2=A0=3D=C2=A0res_mcq->start=C2=A0+=C2=A0hba->nr_hw_queu=
es=C2=A0*=C2=A0MCQ_QCFG_SIZE=C2=A0-=C2=A01;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0res_mcq->flags=C2=A0=3D=C2=A0res_mem->flags;=0D=0A>=
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res_mcq->name=C2=A0=3D=C2=
=A0=22mcq=22;=0D=0A>+=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0ret=C2=A0=3D=C2=A0insert_resource(&iomem_resource,=C2=A0res_mcq);=0D=0A>=
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if=C2=A0(ret)=C2=A0=7B=0D=
=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_err(hba->dev,=C2=A0=22Failed=C2=A0to=C2=A0in=
sert=C2=A0MCQ=C2=A0resource,=C2=A0err=3D%d=5Cn=22,=C2=A0ret);=0D=0AShould=
=20we=20free=20the=20res_mcq?=0D=0A=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return=C2=
=A0ret;=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7D=0D=0A>+=
=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res->base=C2=A0=3D=
=C2=A0devm_ioremap_resource(hba->dev,=C2=A0res_mcq);=0D=0A>+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if=C2=A0(IS_ERR(res->base))=C2=A0=7B=0D=0A=
>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0dev_err(hba->dev,=C2=A0=22MCQ=C2=A0registers=C2=A0m=
apping=C2=A0failed,=C2=A0err=3D%d=5Cn=22,=0D=0A>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(int)PTR_ERR(res->base));=0D=
=0AShould=20we=20call=20remove_resource=20and=20free=20the=20res_mcq?=0D=0A=
=0D=0AThanks,=0D=0ADaejun
