Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531602AD127
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 09:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgKJIS6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 03:18:58 -0500
Received: from m176150.mail.qiye.163.com ([59.111.176.150]:4567 "EHLO
        m176150.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJIS6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 03:18:58 -0500
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
        by m176150.mail.qiye.163.com (Hmail) with ESMTP id 6443F1A3B86;
        Tue, 10 Nov 2020 16:10:27 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AI*ANACSDfnjQejyeNXUnKoQ.1.1604995827401.Hmail.bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Drew Davenport <ddavenport@chromium.org>,
        Bernard Zhao <bernard@vivo.com>,
        Zheng Bin <zhengbin13@huawei.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com
Subject: =?UTF-8?B?W1Jlc2VuZF1bUEFUQ0hdIGRybS9tc206IGRlbGV0ZSBjb252ZXJzaW9uIGZyb20gYm9vbCB2YWx1ZSB0byBib29sIHJldHVybg==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.213.83.157
MIME-Version: 1.0
Received: from bernard@vivo.com( [58.213.83.157) ] by ajax-webmail ( [127.0.0.1] ) ; Tue, 10 Nov 2020 16:10:27 +0800 (GMT+08:00)
From:   Bernard <bernard@vivo.com>
Date:   Tue, 10 Nov 2020 16:10:27 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZTB5JGUhOGkkdTR9LVkpNS09CQk5DSUxPQ05VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzoyUTo1OjgoPx0VESoeEQIeNSMu
        FTAUKlVKVUpNS09CQk5DSUxCQk1VMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWU5DVUlK
        SFVDSFVKTkxZV1kIAVlBSUJDTzcG
X-HM-Tid: 0a75b134c6e093b4kuws6443f1a3b86
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RGVsZXRlIHRoZSBjb252ZXJzaW9uIGZyb20gYm9vbCB2YWx1ZSB0byBib29sIGZ1bmN0aW9uIHJl
dHVybi4KClNpZ25lZC1vZmYtYnk6IEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c19j
bWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfY21k
LmMKaW5kZXggODQ5M2Q2OGFkODQxLi40MTEyMjJmNGNkNmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfY21kLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYwpAQCAtMzcsNyAr
MzcsNyBAQAogCiBzdGF0aWMgYm9vbCBkcHVfZW5jb2Rlcl9waHlzX2NtZF9pc19tYXN0ZXIoc3Ry
dWN0IGRwdV9lbmNvZGVyX3BoeXMgKnBoeXNfZW5jKQogewotCXJldHVybiAocGh5c19lbmMtPnNw
bGl0X3JvbGUgIT0gRU5DX1JPTEVfU0xBVkUpID8gdHJ1ZSA6IGZhbHNlOworCXJldHVybiAocGh5
c19lbmMtPnNwbGl0X3JvbGUgIT0gRU5DX1JPTEVfU0xBVkUpOwogfQogCiBzdGF0aWMgYm9vbCBk
cHVfZW5jb2Rlcl9waHlzX2NtZF9tb2RlX2ZpeHVwKAotLSAKMi4yOS4wCgoNCg0K
