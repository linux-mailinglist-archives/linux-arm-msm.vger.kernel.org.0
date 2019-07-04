Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F36F95F82C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 14:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbfGDMdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 08:33:40 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48536 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbfGDMdk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 08:33:40 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190704123339euoutp01e4b58c025333394fd2a102e4eca14a03~uNEtkzey63236432364euoutp01Y
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2019 12:33:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190704123339euoutp01e4b58c025333394fd2a102e4eca14a03~uNEtkzey63236432364euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1562243619;
        bh=mYLCby5nlISaQhXXuJdUjXravGum4plveihG8QiRIG4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=imINaO/461IxCKbNTOJOzm9Xdv5whpFZyVnsuC1B0lK+MvJrA25yW1SfP78VtQRtv
         Nyf6m0/jwJYZjiSjN//7HUT/aXGHPzt97tvaxPTYjNO8XYayzuP+jco9tfJL0dGEVP
         8Cjw3n13J/Te9elmM7ZIsT9nN/Kpcz7yky7chRPg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190704123338eucas1p10d40920fbdb0b1427562f7df660946c3~uNEs9Mane2422424224eucas1p1O;
        Thu,  4 Jul 2019 12:33:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 12.0F.04377.222FD1D5; Thu,  4
        Jul 2019 13:33:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190704123337eucas1p1514a97326732843cca28573659266158~uNEsNoJmH2133121331eucas1p1c;
        Thu,  4 Jul 2019 12:33:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190704123337eusmtrp1e0080ccb381db80ebe5f8beaca270666~uNEr-Y2G91415714157eusmtrp1B;
        Thu,  4 Jul 2019 12:33:37 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-60-5d1df222b385
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 7E.28.04146.122FD1D5; Thu,  4
        Jul 2019 13:33:37 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190704123337eusmtip2c0b915691796defb198fd7bfae90e363~uNErkqYkS1170411704eusmtip2E;
        Thu,  4 Jul 2019 12:33:36 +0000 (GMT)
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: correct dsi mode_flags
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        lkml <linux-kernel@vger.kernel.org>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <dcb2b28d-38d9-255d-e91f-05e6e713aee0@samsung.com>
Date:   Thu, 4 Jul 2019 14:33:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAOCk7Nq91abTQ02dUNY=8_mgY_kuwU4MFxdO71AjWz1nwUkBGA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEKsWRmVeSWpSXmKPExsWy7djPc7pKn2RjDS418Fn0njvJZPF/20Rm
        iytf37NZtC3/xmzROXEJu8XE/WfZLS7vmsNmce3nY2aL5wt/MFvc3XCW0YHLY3bDRRaPvd8W
        sHjsnHWX3WN2x0xWj+3fHrB63O8+zuTxeZNcAHsUl01Kak5mWWqRvl0CV0brjilsBRO4KiZe
        2c7cwPiHvYuRk0NCwERi1dEdjF2MXBxCAisYJSYv+s8C4XxhlLjW28AO4XxmlFi15TNcy+Vz
        PawgtpDAckaJlceDIYreMkqc+n+cDSQhLOApsebaMkYQW0TAR2Ld/mXMIDazwBUmiaX3bEFs
        NgFNib+bb4LV8wrYSXTsmsACYrMIqEh8WrAerFdUIELi8pZdjBA1ghInZz4Bq+EUCJRou78C
        aqa8RPPW2VC2uMStJ/OZQA6SELjELrHiQjsLxNUuEn1XHrJC2MISr45vgfpGRuL05B6omnqJ
        +ytamCGaOxgltm7YyQyRsJY4fPwiUDMH0AZNifW79EFMCQFHiZfT/SFMPokbbwUhTuCTmLRt
        OjNEmFeio00IYoaixP2zW6HmiUssvfCVbQKj0iwkj81C8swsJM/MQli7gJFlFaN4amlxbnpq
        sVFearlecWJucWleul5yfu4mRmDKOv3v+JcdjLv+JB1iFOBgVOLhfbBFJlaINbGsuDL3EKME
        B7OSCO/330Ah3pTEyqrUovz4otKc1OJDjNIcLErivNUMD6KFBNITS1KzU1MLUotgskwcnFIN
        jF6ar5X7L+vI3krJCJEvefCvR3T7b77k0IPVp35u2/j35LJJfw2U5Zof3pf55f9u9t540T8O
        q07cW75K4+Gc45veHPP9NsFuoWHXotWvvC2tSzjtEjichPOVb53R6Hpwfv2CpTMff/7X831G
        V7WhXGgvy8qAW5EHWNeWbBERMFbjWMBcrLAuIlSJpTgj0VCLuag4EQCHbv8iVQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsVy+t/xe7qKn2RjDXZ0S1v0njvJZPF/20Rm
        iytf37NZtC3/xmzROXEJu8XE/WfZLS7vmsNmce3nY2aL5wt/MFvc3XCW0YHLY3bDRRaPvd8W
        sHjsnHWX3WN2x0xWj+3fHrB63O8+zuTxeZNcAHuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
        iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXkbrjilsBRO4KiZe2c7cwPiHvYuRk0NCwETi8rke
        1i5GLg4hgaWMEpc+fYBKiEvsnv+WGcIWlvhzrYsNoug1o0TvzStgRcICnhJrri1jBLFFBHwk
        1u1fxgxSxCxwjUni3/yPTCAJIYEJzBLflyaA2GwCmhJ/N99kA7F5BewkOnZNYAGxWQRUJD4t
        WA82SFQgQqKvbTZUjaDEyZlPwGo4BQIl2u6vALuIWUBd4s+8S1C2vETz1tlQtrjErSfzmSYw
        Cs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERip24793LyD8dLG
        4EOMAhyMSjy8D7bIxAqxJpYVV+YeYpTgYFYS4f3+GyjEm5JYWZValB9fVJqTWnyI0RTouYnM
        UqLJ+cAkklcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgbGhcqVn
        7nWXCQYsgiVz1rqrmXzOy0y7vV+z/7XWQaml8dmp999nmW2uDWdkizWKN6w0Mj1kdF0xQ8rh
        cONJla8GkUYTGphM73hp3WStXVTibZcV3Nk8L49lwauzRg+5dcJSevf8cL4jeXf7Qtn/+rWc
        92773GLXFvdYUfEm9ILk59rv8gePKrEUZyQaajEXFScCAHzz3sfqAgAA
X-CMS-MailID: 20190704123337eucas1p1514a97326732843cca28573659266158
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190702172346epcas1p29ebecfac70d87abb5379f00cdd1a913a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702172346epcas1p29ebecfac70d87abb5379f00cdd1a913a
References: <20190702154419.20812-1-robdclark@gmail.com>
        <20190702154419.20812-4-robdclark@gmail.com>
        <CAOCk7NrXko8xR1Ovg6HrP2ZpS83mjZoOWdae-mq_QJMRzeENLQ@mail.gmail.com>
        <CAF6AEGsUve1NnzF2kEeW0jwgXnxZTgFaHbq-c-+CKru1jS9tWg@mail.gmail.com>
        <CGME20190702172346epcas1p29ebecfac70d87abb5379f00cdd1a913a@epcas1p2.samsung.com>
        <CAOCk7Nq91abTQ02dUNY=8_mgY_kuwU4MFxdO71AjWz1nwUkBGA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02.07.2019 19:23, Jeffrey Hugo wrote:
> On Tue, Jul 2, 2019 at 11:12 AM Rob Clark <robdclark@gmail.com> wrote:
>> On Tue, Jul 2, 2019 at 10:09 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>>> On Tue, Jul 2, 2019 at 9:46 AM Rob Clark <robdclark@gmail.com> wrote:
>>>> -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
>>>> -                         MIPI_DSI_MODE_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
>>>> +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
>>> Did you check this against the datasheet?  Per my reading, EOT_PACKET
>>> and VIDEO_HSE appear valid.  I don't know about VIDEO_SYNC_PULSE.
>> The EOT flat is badly named:
>>
>> /* disable EoT packets in HS mode */
>> #define MIPI_DSI_MODE_EOT_PACKET    BIT(9)
>>
>> I can double check out HSE, but this was one of the setting
>> differences between bootloader and kernel
> Ah yeah, you are right.  My eyes apparently skipped over the "disable".
>
> If the bootloader is not setting the HSE, then I can't think of a
> reason why we would be having an issue also not setting it.
>
> Seems good to me
>
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>
>
Yes, the flags require cleanup.

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej


