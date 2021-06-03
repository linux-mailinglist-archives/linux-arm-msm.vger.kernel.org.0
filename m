Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 544AA39B185
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 06:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhFDEbq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 00:31:46 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:34674 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhFDEbq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 00:31:46 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210604042958epoutp0184ad584d4ee9c10823913b79366ee14e~FRrhpVWyq0483904839epoutp019
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jun 2021 04:29:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210604042958epoutp0184ad584d4ee9c10823913b79366ee14e~FRrhpVWyq0483904839epoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1622780998;
        bh=5t04RlzQl0RyBI4gJM0ad0zEyozsoAuFKyhCdf1pY3k=;
        h=From:To:In-Reply-To:Subject:Date:References:From;
        b=k4PlVXAL+rSeoMOvbkgM0jiVDea+WpdlRfHGc0zn8AX+Ao/w73GPNkbQX20wl25DV
         fP7uIUtOVHkhpeLwAtWpiVj+8OVinITQ3GFoLZlnkmxPuA1ToGyTLGYoOuanGMSgzK
         J13TVPuXg1BO8/vfjInTrbHvk2FT/70CRxFszvMA=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20210604042957epcas5p2914e089ea9e9d9cbb403fa5b501bae18~FRrgr85Nf0828608286epcas5p2w;
        Fri,  4 Jun 2021 04:29:57 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        25.F5.09697.54CA9B06; Fri,  4 Jun 2021 13:29:57 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20210603145716epcas5p151b1e268e09301c4c4c646d5f087b038~FGl8bk_qL1034210342epcas5p1g;
        Thu,  3 Jun 2021 14:57:16 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210603145716epsmtrp11174ce14d14f3c4e6bdfdfe8fe889bf2~FGl8ad9D32297722977epsmtrp1G;
        Thu,  3 Jun 2021 14:57:16 +0000 (GMT)
X-AuditID: b6c32a4a-64fff700000025e1-81-60b9ac459be3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C6.3B.08163.CCDE8B06; Thu,  3 Jun 2021 23:57:16 +0900 (KST)
Received: from alimakhtar02 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210603145715epsmtip1ee74c17d7887cc26200750a672b2233d~FGl7KUm1B1456414564epsmtip1C;
        Thu,  3 Jun 2021 14:57:15 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Felipe Balbi'" <balbi@kernel.org>,
        "'Avri Altman'" <avri.altman@wdc.com>,
        "'James E.J. Bottomley'" <jejb@linux.ibm.com>,
        "'Martin K. Petersen'" <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <asutoshd@codeaurora.org>, <cang@codeaurora.org>
In-Reply-To: <87lf7rc9es.fsf@kernel.org>
Subject: RE: UFS failures with v5.13-rc4
Date:   Thu, 3 Jun 2021 20:27:13 +0530
Message-ID: <0acb01d75888$be51fe00$3af5fa00$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFo4vPJKnQDl+7tnsLsmUF4WWdqJwIJTNTJq88AIjA=
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7bCmuq7rmp0JBosb5Sz2tp1gt3j58yqb
        xbG2J+wWn9YvY7VYdGMbk8XE/WfZLbqv72CzWH78H5MDh8flvl4mj02rOtk8Jiw6wOjx8ekt
        Fo/Pm+Q82g90MwWwRXHZpKTmZJalFunbJXBl/Fq6lLHgpnrFhN0vmRsYu+S7GDk5JARMJA71
        TGbpYuTiEBLYzSjRdP8oE4TziVFiSfMBRgjnM6PEhrb7zDAtGy9uhErsYpRouLaaHcJ5ySjx
        fMkqVpAqNgFdiR2L29hAEiICq5kkVn07xASS4BTQkDjcu5EFxBYGso9suwoWZxFQkWiY0Q3W
        zCtgKXHi/lQoW1Di5MwnYPXMAvIS29/OgTpDQeLn02VgNSICVhK9P9azQdSISxz92cMMslhC
        YCaHxMsPh6EaXCTan66CsoUlXh3fwg5hS0m87G8DsjmA7GyJnl3GEOEaiaXzjrFA2PYSB67M
        YQEpYRbQlFi/Sx8iLCsx9dQ6Joi1fBK9v58wQcR5JXbMg7FVJZrfXYUaIy0xsRviRQkBD4kf
        vw+yTmBUnIXky1lIvpyF5JtZCJsXMLKsYpRMLSjOTU8tNi0wykst1ytOzC0uzUvXS87P3cQI
        Tk9aXjsYHz74oHeIkYmD8RCjBAezkgjvHrUdCUK8KYmVValF+fFFpTmpxYcYpTlYlMR5Vzyc
        nCAkkJ5YkpqdmlqQWgSTZeLglGpgavi5/He26xmLkk0L8xZKz9Ysf7j28arASc3Bfh2B69Y8
        7b7t0KUaYMB0bN3yLzmhwrvL5TSUP3pdYb1ytfUP0135/anlZvPsE3gz7k/5r6UR8TQ/N3pe
        gIr8X+0jFrMKGHWllwvtlfaK/pS8kO3g9Js3Hqd8PPx2ackCn6wvnNvb3havn+xRMPWL5cuv
        vu+n+nj1JzHH/nU9uc+i+q7uzx2vX2ztC5N0bN3rZ3TQfN6WFSVa6x9euvVeIWqKhYjYG4+O
        tucJEdf5rU19/CtyRIrjqraFcrxvlsgXZWmQc/3ZbHLyoHhq3tOFCte/WBTd/RIQOekR662a
        V1vaVFkXReYXif1klBI/6ba5bou1EktxRqKhFnNRcSIAUwNyNb4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSnO6ZtzsSDDZfkbDY23aC3eLlz6ts
        FsfanrBbfFq/jNVi0Y1tTBYT959lt+i+voPNYvnxf0wOHB6X+3qZPDat6mTzmLDoAKPHx6e3
        WDw+b5LzaD/QzRTAFsVlk5Kak1mWWqRvl8CV8WvpUsaCm+oVE3a/ZG5g7JLvYuTkkBAwkdh4
        cSMjiC0ksINRYtPLIoi4tMT1jRPYIWxhiZX/ngPZXEA1zxkl9h9oAmtgE9CV2LG4jQ0kISKw
        kUni+KRjTF2MHEBVlRKTn6uD1HAKaEgc7t3IAmILA9lHtl1lArFZBFQkGmZ0s4LYvAKWEifu
        T4WyBSVOznzCAjKGWUBPog3iNmYBeYntb+cwQ9yjIPHz6TKwchEBK4neH+vZIGrEJY7+7GGe
        wCg0C8mkWQiTZiGZNAtJxwJGllWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMFRpKW1
        g3HPqg96hxiZOBgPMUpwMCuJ8O5R25EgxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0
        xJLU7NTUgtQimCwTB6dUA9OR+Q6//vZovPx4LVXrhYDpmxffjkZ7iU78sa70mO3JiYsYX7oZ
        vFoY13fV81XXtYeG8+wW5OhuVzOXWKRgtsypNGTlxrPvtq8/lPaitrloF9Pxsus/5fq+u0Q4
        vb0kqKgonPd+2/LvF79Yhaq8/9ZcP2Uh77Fc7ps5pX39Ejw3fv/b9e8Iz5XSk0WPbn0Sk6r9
        GjW/WfD+1Q17fn1I7Q+u28nVXZnGl9vhUrbL1Sqx9r2HjnvAlvgK18cFgjOv5J9L5+lbrX1J
        Wnx/v/8qv8Xqcyt0ZllNyZnqacz9PvrgbsGPJ85tDmqyP9lt/lSxqTG3TbfMNGVz9OQyh939
        QcI/a/JvLApcnpTQIPI1iEGJpTgj0VCLuag4EQA9r7VMEQMAAA==
X-CMS-MailID: 20210603145716epcas5p151b1e268e09301c4c4c646d5f087b038
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210603142546epcas5p2bea63eb4359ddec8ccd257ee3aa9af61
References: <CGME20210603142546epcas5p2bea63eb4359ddec8ccd257ee3aa9af61@epcas5p2.samsung.com>
        <87lf7rc9es.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ codeaurora guys ( Can and Asutosh)



> -----Original Message-----
> From: Felipe Balbi <balbi@kernel.org>
> Sent: 03 June 2021 19:56
> To: Alim Akhtar <alim.akhtar@samsung.com>; Avri Altman
> <avri.altman@wdc.com>; James E.J. Bottomley <jejb@linux.ibm.com>;
> Martin K. Petersen <martin.petersen@oracle.com>; linux-
> scsi@vger.kernel.org; linux-arm-msm@vger.kernel.org
> Subject: UFS failures with v5.13-rc4
> 
> 
> Hi guys,
> 
> Today I managed to trigger some pretty bad faults with with v5.13-rc4
> running on SM8150 (Snapdragon) and iozone.
> 
> It seems the problem only happens when using bfq iosched, as I couldn't
> trigger it with mq-deadline.
> 
> Here's the relevant snippet of console logs, full dmesg.txt attached.
> 
> # echo bfq > /sys/block/sdg/queue/scheduler # iozone -i 0 -R -t 8 -s 1G -r
> 16M -b /tmp/iozone-bfq.xls -F /mnt/file0 /mnt/file1 /mnt/file2 /mnt/file3
> /mnt/file4 /mnt/file5 /mnt/file6 /mnt/file7
>         Iozone: Performance Test of File I/O
>                 Version $Revision: 3.489 $
>                 Compiled for 64 bit mode.
>                 Build: linux
> 
>         Contributors:William Norcott, Don Capps, Isom Crawford, Kirby
Collins
>                      Al Slater, Scott Rhine, Mike Wisner, Ken Goss
>                      Steve Landherr, Brad Smith, Mark Kelly, Dr. Alain
CYR,
>                      Randy Dunlap, Mark Montague, Dan Million, Gavin
Brebner,
>                      Jean-Marc Zucconi, Jeff Blomberg, Benny Halevy, Dave
Boone,
>                      Erik Habbinga, Kris Strecker, Walter Wong, Joshua
Root,
>                      Fabrice Bacchella, Zhenghua Xue, Qin Li, Darren
Sawyer,
>                      Vangel Bojaxhi, Ben England, Vikentsi Lapa,
>                      Alexey Skidanov, Sudhir Kumar.
> 
>         Run began: Thu Jan  1 02:29:50 1970
> 
>         Excel chart generation enabled
>         File size set to 1048576 kB
>         Record Size 16384 kB
>         Command line used: iozone -i 0 -R -t 8 -s 1G -r 16M -b
/tmp/iozone-
> bfq.xls -F /mnt/file0 /mnt/file1 /mnt/file2 /mnt/file3 /mnt/file4
/mnt/file5
> /mnt/file6 /mnt/fil
> e7
>         Output is in kBytes/sec
>         Time Resolution = 0.000001 seconds.
>         Processor cache size set to 1024 kBytes.
>         Processor cache line size set to 32 bytes.
>         File stride size set to 17 * record size.
>         Throughput test with 8 processes
>         Each process writes a 1048576 kByte file in 16384 kByte records [
> 2475.173128] ufshcd-qcom 1d84000.ufshc: __ufshcd_issue_tm_cmd: task
> management cmd 0x80 timed-out [ 2475.182205] ufshcd-qcom
> 1d84000.ufshc: ufshcd_try_to_abort_task: no response from device. tag = 0,
> err -110 [ 2475.252049] ufshcd-qcom 1d84000.ufshc: Controller enable
failed [
> 2475.317224] ufshcd-qcom 1d84000.ufshc: Controller enable failed [
> 2475.382038] ufshcd-qcom 1d84000.ufshc: Controller enable failed [
> 2475.447318] ufshcd-qcom 1d84000.ufshc: Controller enable failed [
> 2475.453450] ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore:
> Host init failed -5 [ 2475.522779] ufshcd-qcom 1d84000.ufshc: Controller
> enable failed [ 2475.587983] ufshcd-qcom 1d84000.ufshc: Controller enable
> failed [ 2475.653027] ufshcd-qcom 1d84000.ufshc: Controller enable failed
[
> 2475.719555] ufshcd-qcom 1d84000.ufshc: Controller enable failed [
> 2475.725690] ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore:
> Host init failed -5 [ 2475.795173] ufshcd-qcom 1d84000.ufshc: Controller
> enable failed [ 2475.861232] ufshcd-qcom 1d84000.ufshc: Controller enable
> failed [ 2475.926035] ufshcd-qcom 1d84000.ufshc: Controller enable failed
[
> 2475.991184] ufshcd-qcom 1d84000.ufshc: Controller enable failed [
> 2475.997382] ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore:
> Host init failed -5 [ 2476.064948] ufshcd-qcom 1d84000.ufshc: Controller
> enable failed [ 2476.129955] ufshcd-qcom 1d84000.ufshc: Controller enable
> failed [ 2476.194502] ufshcd-qcom 1d84000.ufshc: Controller enable failed
[
> 2476.259851] ufshcd-qcom 1d84000.ufshc: Controller enable failed [
> 2476.265962] ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore:
> Host init failed -5 [ 2476.334428] ufshcd-qcom 1d84000.ufshc: Controller
> enable failed [ 2476.399788] ufshcd-qcom 1d84000.ufshc: Controller enable
> failed [ 2476.465468] ufshcd-qcom 1d84000.ufshc: Controller enable failed
[
> 2476.529965] ufshcd-qcom 1d84000.ufshc: Controller enable failed [
> 2476.536086] ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore:
> Host init failed -5 [ 2476.544523] ufshcd-qcom 1d84000.ufshc:
> ufshcd_err_handler: reset and restore failed with err -5 [ 2476.606521] sd
> 0:0:0:6: [sdg] tag#0 UNKNOWN(0x2003) Result: hostbyte=0x07
> driverbyte=0x00 cmd_age=0s [ 2476.615917] sd 0:0:0:6: [sdg] tag#0 CDB:
> opcode=0x2a 2a 00 00 35 b5 7c 00 00 10 00 [ 2476.623715]
> blk_update_request: I/O error, dev sdg, sector 28158944 op 0x1:(WRITE)
> flags 0x4000 phys_seg 16 prio class 0


