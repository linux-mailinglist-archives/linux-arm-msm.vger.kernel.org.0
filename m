Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEAFF7E30BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 00:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232790AbjKFXLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 18:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233080AbjKFXLB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 18:11:01 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E1492
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 15:10:58 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A6MwOGU024339;
        Mon, 6 Nov 2023 23:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=qcppdkim1;
 bh=2jnwvE88yl8CLCEAiKZwik90qtUyemJkutYzFYtv9DE=;
 b=Ti6VMJUI3JDDUmjV6SkgR3DNHQ7Nqv1PFNIqp0AYKJlRF5OVNFtk8rDRhFk7ZdDU70qS
 JtoMnnXWG/wR1iYXoIEU7NX40k7/h7wUvmHpbSnZi1wAh2DdzWOTDcbEzkHuleeDhRZ0
 VbB4UuTmdrdCFJxYVbEcrudNWNEG9u/VxGTrr8PZWzJ2cc929BvRCf7C+q8IOGSYvC5O
 wmKibYgmcseonaWQka2lKHwat7cMvEAHMKPicH6MWEaif5OsLo0SCzOKCVua22ExFCAz
 n55bz3JcxuinCVouj+9PpTZzuPYTHjjdl+QyfKkWObKV+UcS8jw1WBBdpCwOx8tktypX DA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u6yehskdv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Nov 2023 23:10:55 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A6NAsri004344
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 6 Nov 2023 23:10:54 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 15:10:54 -0800
Date:   Mon, 6 Nov 2023 15:10:53 -0800
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Brian Masney <bmasney@redhat.com>
CC:     <linux-arm-msm@vger.kernel.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Eric Chanudet <echanude@redhat.com>
Subject: Re: External display on the x13s?
Message-ID: <20231106231053.GB3553829@hu-bjorande-lv.qualcomm.com>
References: <ZUUrMm1Q/PI5xv6a@brian-x1>
 <20231103190433.GX3553829@hu-bjorande-lv.qualcomm.com>
 <CABx5tqJRVWtDpVZD++EK9RrRK-nZh-sZJFSd9xsf6p=o_wdp4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABx5tqJRVWtDpVZD++EK9RrRK-nZh-sZJFSd9xsf6p=o_wdp4g@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: peYXP9u_Tgc3NjfMAKcZ8rcAcwgwPkZ8
X-Proofpoint-ORIG-GUID: peYXP9u_Tgc3NjfMAKcZ8rcAcwgwPkZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060190
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 04, 2023 at 07:35:07AM -0400, Brian Masney wrote:
> On Fri, Nov 3, 2023 at 3:04 PM Bjorn Andersson
> <quic_bjorande@quicinc.com> wrote:
> > With the ADSP remoteproc and pd-mapper running, and pd-mapper being able
> > to pick up the json files you should get your power-supply, and you
> > should get your USB Type-C events.
> >
> > Unless I'm mistaken, there's still some issue with Gnome, but you should
> > be able to validate if the display is detected using "modetest -c". It
> > should present you with a eDP-1, USB-1 and USB-2 (or eDP-1, DP-1, DP-2
> > now in the future).
> >
> >
> > For reference, I'm running v6.6 with no modifications and built straight
> > from the upstream defconfig. I just confirmed that I can drive my 4k TV
> > (at 30Hz...) over HDMI with that.
> 
> The issue ended up being my HDMI adapter since it looks like it's
> thunderbolt. I found a different USB-C to HDMI adapter in my box of
> cables and it's now detected on the x13s.

Woho!

> However, mutter crashes and
> I believe it's this issue:
> https://gitlab.gnome.org/GNOME/mutter/-/issues/2398
> 

:(

> To get Fedora 39 on the x13s, I had to take the nvme drive out, put it
> in a USB caddy, dd the image to the drive using another computer, and
> modify the grub config. It looks like Fedora's initramfs is missing
> one or more modules that's needed so that the USB storage is detected.
> I'm going to look into that as I have free time. I heard from Andrew
> that there is (or was) an issue on boot up where the USB voltage
> drops. Is that still an issue?
> 

I've not scoped the cable, or analysed the problem further, but the USB
bus is at least re-enumerated when the USB Type-C firmware is loaded by
remoteproc.

> For the search engines: To get Fedora 39 booting on the x13s
> 
> directly dd the image using a different computer as I describe above
> 
> Mount the second partition and edit the loader/entries/xxx.conf file
> on that partition:
> 
> Under options, remove 'quiet' and add 'arm64.nopauth clk_ignore_unused
> pd_ignore_unused'
> Add a new line:
> 
>     devicetree /dtb-6.5.6-300.fc39.aarch64/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb
> 
> Put the drive back in the system.
> 
> To persist the kernel options once you boot the system, edit
> /etc/default/grub. Change this line to:
> 
> GRUB_CMDLINE_LINUX="arm64.nopauth clk_ignore_unused pd_ignore_unused"
> 
> Add a new line GRUB_DEFAULT_DTB=/dtb/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb
> 
> Fedora 39 currently has the 6.5.6 kernel and you can upgrade to a 6.6
> kernel with:
> 
> sudo dnf copr enable @kernel-vanilla/mainline-wo-mergew
> sudo dnf upgrade 'kernel*'
> 

Thank you for sharing,
Bjorn
