Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 098C45F72DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Oct 2022 04:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbiJGClr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 22:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiJGClp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 22:41:45 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85126EB7EF
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 19:41:43 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20221007024140epoutp04a07793c09327a74e6e8b04f7e6cb329a~bqS2NmO0E1674216742epoutp044
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Oct 2022 02:41:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20221007024140epoutp04a07793c09327a74e6e8b04f7e6cb329a~bqS2NmO0E1674216742epoutp044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1665110500;
        bh=PygvURPnPuchsrtMHU44Ip+216Cg4wZE60z7YRgEIcM=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=rTOvHIurYKekRXFjHCJqgF3dzXw1GhHaD37DJDMOAfL/y0+3Pm6xs7ceCNAtjmP8D
         SPfNO79t9bOV0eD5qYxQTllQA1Upor048weCsxeqxhozUDpsOMmnw4Zh+GOEP32THU
         yxhCk9E9srw5C1t3+0PM6ORZf+EtZM4tqv2D0j6c=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20221007024139epcas2p2f92b019d5300e056cf2d145c2c0a914e~bqS1ov9Zu0127401274epcas2p2J;
        Fri,  7 Oct 2022 02:41:39 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4MkCHl1fhTz4x9Q2; Fri,  7 Oct
        2022 02:41:39 +0000 (GMT)
X-AuditID: b6c32a46-5bdfb70000004e8a-4f-633f91e322a7
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        3F.20.20106.3E19F336; Fri,  7 Oct 2022 11:41:39 +0900 (KST)
Mime-Version: 1.0
Subject: RE: [PATCH v2 06/17] ufs: core: mcq: Configure resource regions
Reply-To: daejun7.park@samsung.com
Sender: Daejun Park <daejun7.park@samsung.com>
From:   Daejun Park <daejun7.park@samsung.com>
To:     Asutosh Das <quic_asutoshd@quicinc.com>,
        "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
        "quic_bhaskarv@quicinc.com" <quic_bhaskarv@quicinc.com>,
        "quic_richardp@quicinc.com" <quic_richardp@quicinc.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Daejun Park <daejun7.park@samsung.com>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_xiaosenh@quicinc.com" <quic_xiaosenh@quicinc.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "beanhuo@micron.com" <beanhuo@micron.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <271ed77a0ff46390c90fdcde71890d8cec83b8c9.1665017636.git.quic_asutoshd@quicinc.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20221007024138epcms2p729595abf03da8402618c4803b20a4d13@epcms2p7>
Date:   Fri, 07 Oct 2022 11:41:38 +0900
X-CMS-MailID: 20221007024138epcms2p729595abf03da8402618c4803b20a4d13
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmue7jifbJBjs3cVq8/HmVzeLgw04W
        i2kffjJbvDykabHqQbjFxP1n2S26r+9gszjwYRWjxcKOuSwWRx6/Z7aYdG0Dm8XUF8fZLXbc
        b2e0OHUo1OL7hO3sFlcXX2V3EPC4fMXbY9OqTjaP7+s72Dwm7qnz6NuyitHj8yY5j/YD3UwB
        7FHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAhysp
        lCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoT
        sjMeT1zEWNDiWtG8ahp7A+Nc5y5GTg4JAROJvpmb2LsYuTiEBHYwSvRs2M7WxcjBwSsgKPF3
        hzBIjbCAh8SJB59YQGwhASWJ9RdnsUPE9SRuPVzDCGKzCehITD9xH2yOiMB6Zokj37+BNTAL
        PGWS2NcUC7GMV2JG+1MWCFtaYvvyrWDNnAIJEt0Hf0PFNSR+LOtlhrBFJW6ufssOY78/Np8R
        whaRaL13FqpGUOLBz91QcUmJ23M3QdXnS/y/shzKrpHYdmAelK0vca1jI9guXgFfiberj7GB
        2CwCqhIn7y5jhahxkVh+fCojxP3aEssWvmYGhQmzgKbE+l36IKaEgLLEkVssMF81bPzNjs5m
        FuCT6Dj8Fy6+Y94TJghbTWLdz/VMExiVZyECehaSXbMQdi1gZF7FKJZaUJybnlpsVGAEj9vk
        /NxNjOAkrOW2g3HK2w96hxiZOBgPMUpwMCuJ8O7caZcsxJuSWFmVWpQfX1Sak1p8iNEU6MuJ
        zFKiyfnAPJBXEm9oYmlgYmZmaG5kamCuJM7bNUMrWUggPbEkNTs1tSC1CKaPiYNTqoFJxrOY
        f85KR7GZRaEVhj0a4m6ze/o3npP8Fja/gcH0rdy37X0V29iOJk84VDo3/YOHwsrTbOxzPapY
        Vj3sW5H9wb1rc2D6uiQfR7VgrTSLXUdb+BbvluibeHxGlkK/8AEdLtFCiUmWJ3dF/vnD9zmh
        5lFO6FaXl1duFnln7r5pXO0seMLjREFmO1NSwvrpc3b33NDQTdx5QtruZr+jYBmvRsViL6HP
        X3Knn/r15eMW9edn1i5qL1Gs1D5iHlx8u/3yPc+p7k3SL5Yd2xLQoJm0q3Ta6S5+D4W2pVME
        9K+xvs/U959QdWXhZLlHOdNPzRNT0uD7ER+fUV2/4N6SeO3FETsPxUdszKlYbv/jb5ESS3FG
        oqEWc1FxIgClb3i9SwQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221006010745epcas2p38b37890b7e1fefb45b8fbb0e14ab0a82
References: <271ed77a0ff46390c90fdcde71890d8cec83b8c9.1665017636.git.quic_asutoshd@quicinc.com>
        <cover.1665017636.git.quic_asutoshd@quicinc.com>
        <CGME20221006010745epcas2p38b37890b7e1fefb45b8fbb0e14ab0a82@epcms2p7>
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
;=0D=0AI=20think=20res->base=20has=20already=20NULL=20value.=0D=0A=0D=0ATha=
nks,=0D=0ADaejun
