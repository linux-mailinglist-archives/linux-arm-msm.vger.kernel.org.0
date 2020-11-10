Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E492AD128
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 09:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgKJIS7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 03:18:59 -0500
Received: from m176150.mail.qiye.163.com ([59.111.176.150]:4569 "EHLO
        m176150.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgKJIS7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 03:18:59 -0500
X-Greylist: delayed 478 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Nov 2020 03:18:57 EST
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
        by m176150.mail.qiye.163.com (Hmail) with ESMTP id 994491A3B66;
        Tue, 10 Nov 2020 16:10:24 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AGIA*AAMDRjj8OgGeBDLQarV.1.1604995824613.Hmail.bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Zheng Bin <zhengbin13@huawei.com>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        =?UTF-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Subject: =?UTF-8?B?W1Jlc2VuZF1bUEFUQ0hdIGRybS9tc206IGRlbGV0ZSBjb252ZXJzaW9uIGZyb20gYm9vbCB2YWx1ZSB0byBib29sIHZhcmlhYmxl?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.213.83.157
MIME-Version: 1.0
Received: from bernard@vivo.com( [58.213.83.157) ] by ajax-webmail ( [127.0.0.1] ) ; Tue, 10 Nov 2020 16:10:24 +0800 (GMT+08:00)
From:   Bernard <bernard@vivo.com>
Date:   Tue, 10 Nov 2020 16:10:24 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSxhNHkofHhpIHR9CVkpNS09CQk5DSU9MSkNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo8MjpROjo2PykREUM0HDweOT83
        KhoJLVVKVUpNS09CQk5DSU5JS09VMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWU5DVUlK
        SFVDSFVKTkxZV1kIAVlBSE9LQzcG
X-HM-Tid: 0a75b134bc0a93b4kuws994491a3b66
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UmVtb3ZlIHRoZSBjb252ZXJzaW9uIGZyb20gYm9vbCB2YWx1ZSB0byBib29sIHZhcmlhYmxlLgoK
U2lnbmVkLW9mZi1ieTogQmVybmFyZCBaaGFvIDxiZXJuYXJkQHZpdm8uY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwppbmRleCBmN2Y1YzI1OGI1NTMuLmU5OWE1NDNkYTI0
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jCkBAIC0x
MzYyLDcgKzEzNjIsNyBAQCB2b2lkIGRwdV9lbmNvZGVyX3JlZ2lzdGVyX2ZyYW1lX2V2ZW50X2Nh
bGxiYWNrKHN0cnVjdCBkcm1fZW5jb2RlciAqZHJtX2VuYywKIAl1bnNpZ25lZCBsb25nIGxvY2tf
ZmxhZ3M7CiAJYm9vbCBlbmFibGU7CiAKLQllbmFibGUgPSBmcmFtZV9ldmVudF9jYiA/IHRydWUg
OiBmYWxzZTsKKwllbmFibGUgPSAoZnJhbWVfZXZlbnRfY2IgIT0gTlVMTCk7CiAKIAlpZiAoIWRy
bV9lbmMpIHsKIAkJRFBVX0VSUk9SKCJpbnZhbGlkIGVuY29kZXJcbiIpOwotLSAKMi4yOS4wCgoN
Cg0K
