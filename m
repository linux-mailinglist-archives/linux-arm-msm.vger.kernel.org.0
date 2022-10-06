Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839835F5FC5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 05:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiJFDuq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Oct 2022 23:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiJFDuo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Oct 2022 23:50:44 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A887D5AA06
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Oct 2022 20:50:41 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20221006035038epoutp04a779c18c79a1c719b278e3d8ac0d4117~bXlx-kjB81953419534epoutp04X
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 03:50:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20221006035038epoutp04a779c18c79a1c719b278e3d8ac0d4117~bXlx-kjB81953419534epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1665028238;
        bh=LzQDMp/vgcthjbAiSfM0vqm/Rw8HxYTxiy78W5X/IwM=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=qSXgycsEYnHEXkftofV7BREyr7YIJ2foz/+ebuP4yy4BPCaZ0qcvUU5D979X7Qo0a
         UilbuFo2n3n/JFcc2q+TvdH/FdL2ge1aYY8RNDLucmAC5KT9kWN8sAX8Ybmpyqbz4d
         G+B7G3SP8PHX8yRSfcmict2ZeXskYDDcrrF+2S5g=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20221006035038epcas2p3dae69a1be35c30c65f01e86135fd757f~bXlxe1Bpq1288812888epcas2p3m;
        Thu,  6 Oct 2022 03:50:38 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.99]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Mjcsn4rbPz4x9Q7; Thu,  6 Oct
        2022 03:50:37 +0000 (GMT)
X-AuditID: b6c32a48-1cffb7000000186f-a3-633e508db6b3
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        60.7C.06255.D805E336; Thu,  6 Oct 2022 12:50:37 +0900 (KST)
Mime-Version: 1.0
Subject: RE: [PATCH v2 01/17] ufs: core: Probe for ext_iid support
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
        Daejun Park <daejun7.park@samsung.com>,
        cpgsproxy3 <cpgsproxy3@samsung.com>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_xiaosenh@quicinc.com" <quic_xiaosenh@quicinc.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "beanhuo@micron.com" <beanhuo@micron.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <1d21e634e86f26e3a22be3c380a85bd4dd17f1ae.1665017636.git.quic_asutoshd@quicinc.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20221006035037epcms2p3053f17ec4b42f48657803b98345d843a@epcms2p3>
Date:   Thu, 06 Oct 2022 12:50:37 +0900
X-CMS-MailID: 20221006035037epcms2p3053f17ec4b42f48657803b98345d843a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmuW5vgF2ywYG5KhYvf15lszj4sJPF
        YtqHn8wWLw9pWjy6/YzRYtWDcIuJ+8+yW3Rf38FmceDDKkaLhR1zWSyOPH7PbDHp2gY2i6kv
        jrNb7Ljfzmhx6lCoxfcJ29ktri6+yu4g6HH5irfHplWdbB7f13eweUzcU+fRt2UVo8fnTXIe
        7Qe6mQLYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0y
        c4CuV1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUmBfoFSfmFpfmpevlpZZYGRoY
        GJkCFSZkZ5y7m1ZwkK3i3tG0BsZVbF2MnBwSAiYSnbt/snYxcnEICexglLhy8DBjFyMHB6+A
        oMTfHcIgNcICThIPNz8AqxcSUJJYf3EWO0RcT+LWwzWMIDabgI7E9BP32UHmiAhcY5bY9+sc
        WBGzwFMmiX1NsRDLeCVmtD9lgbClJbYv3wq2i1MgQeLnGlmIsIbEj2W9zBC2qMTN1W/ZYez3
        x+YzQtgiEq33zkLVCEo8+LkbKi4pcXvuJqj6fIn/V5ZD2TUS2w7Mg7L1Ja51bGSBeNFXoul1
        GYjJIqAqsXtRHkSFi8Te1h3MEMdrSyxb+JoZpIRZQFNi/S59EFNCQFniyC0WmJcaNv5mR2cz
        C/BJdBz+CxffMe8JE4StJrHu53qmCYzKsxChPAvJrlkIuxYwMq9iFEstKM5NTy02KjCBR2ty
        fu4mRnAS1vLYwTj77Qe9Q4xMHIyHGCU4mJVEeLtm2yYL8aYkVlalFuXHF5XmpBYfYjQFenIi
        s5Rocj4wD+SVxBuaWBqYmJkZmhuZGpgrifN2zdBKFhJITyxJzU5NLUgtgulj4uCUamAy9q87
        NmF54QVup6M1vydXyqk0FSfZPbmTwS3cddFgu8Nzw0eWPytvz7q8wk9ibcovrnM7jZ9lvoq4
        c/vYxRZNNbedxjefmjS17eZ+F5yyzaKnddKD811MTlNNzR4ETp9Uk3+w0umW/PaNVzcJq4S4
        aErPZ1d2v8H4TypAuCp1V1X4muz9a1nCNI55vgq7E3Run+Har08lQ5vSCkIOz37W/jdTZ/+y
        B2rl7cW/Jthv1KqZ/Ww3y0lvfr0Ff43UixzvS/z8q8sQc/Ijz3a3ZYXvayLzwsWTOg+8kVl6
        Xi7z1c3VtjUVGZvmfJg1+cGaIxxZaUwGi67L75pmx+6yYYX+OkWHvifdGXabNe4JmHYqsRRn
        JBpqMRcVJwIAoFXxZ0sEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221006010736epcas2p20777225a537d4f2124e9a7264b2fffcf
References: <1d21e634e86f26e3a22be3c380a85bd4dd17f1ae.1665017636.git.quic_asutoshd@quicinc.com>
        <cover.1665017636.git.quic_asutoshd@quicinc.com>
        <CGME20221006010736epcas2p20777225a537d4f2124e9a7264b2fffcf@epcms2p3>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Asutosh=C2=A0Das,=0D=0A=0D=0A>diff=C2=A0--git=C2=A0a/include/ufs/ufshcd.=
h=C2=A0b/include/ufs/ufshcd.h=0D=0A>index=C2=A07fe1a92..da1eb8a=C2=A0100644=
=0D=0A>---=C2=A0a/include/ufs/ufshcd.h=0D=0A>+++=C2=A0b/include/ufs/ufshcd.=
h=0D=0A>=40=40=C2=A0-737,6=C2=A0+737,7=C2=A0=40=40=C2=A0struct=C2=A0ufs_hba=
_monitor=C2=A0=7B=0D=0A>=C2=A0=C2=A0*=C2=A0=40outstanding_lock:=C2=A0Protec=
ts=C2=A0=40outstanding_reqs.=0D=0A>=C2=A0=C2=A0*=C2=A0=40outstanding_reqs:=
=C2=A0Bits=C2=A0representing=C2=A0outstanding=C2=A0transfer=C2=A0requests=
=0D=0A>=C2=A0=C2=A0*=C2=A0=40capabilities:=C2=A0UFS=C2=A0Controller=C2=A0Ca=
pabilities=0D=0A>+=C2=A0*=C2=A0=40mcq_capabilities:=C2=A0UFS=C2=A0Multi=C2=
=A0Command=C2=A0Queue=C2=A0capabilities=0D=0A=0D=0AMaybe=20UFS=C2=A0Multi=
=20Circular=20Queue?=0D=0A=0D=0AThanks,=0D=0ADaejun=0D=0A
