Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA572274F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 03:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgGUBn0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 21:43:26 -0400
Received: from m176150.mail.qiye.163.com ([59.111.176.150]:2099 "EHLO
        m176150.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgGUBn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 21:43:26 -0400
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
        by m176150.mail.qiye.163.com (Hmail) with ESMTP id 083D01A2142;
        Tue, 21 Jul 2020 09:33:03 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AE2AjQBfDVxlYNyBF9u*s4rp.1.1595295183020.Hmail.bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Drew Davenport <ddavenport@chromium.org>,
        Bernard Zhao <bernard@vivo.com>,
        Hongbo Yao <yaohongbo@huawei.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com
Subject: =?UTF-8?B?W1Jlc2VuZF1bUEFUQ0hdIGRybS9tc206IHVzZSBrdGhyZWFkX2NyZWF0ZV93b3JrZXIgaW5zdGVhZCBvZiBrdGhyZWFkX3J1bg==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 14.29.82.33
MIME-Version: 1.0
Received: from bernard@vivo.com( [14.29.82.33) ] by ajax-webmail ( [127.0.0.1] ) ; Tue, 21 Jul 2020 09:33:03 +0800 (GMT+08:00)
From:   Bernard <bernard@vivo.com>
Date:   Tue, 21 Jul 2020 09:33:03 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSE8ZQh5CQ05OSU8eVkpOQk5JQk5KQ0hKT0tVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo#SToRKjkdPy0DFyI1Ajk9Qg5R
        CE8JC1VKVUpOQk5JQk5KQ0hOSENVMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWUpPVUlC
        VUNJVUhIWVdZCAFZQU1OTk83Bg++
X-HM-Tid: 0a736f00b0cd93b4kuws083d01a2142
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VXNlIGt0aHJlYWRfY3JlYXRlX3dvcmtlciB0byBzaW1wbGlmeSB0aGUgY29kZSBhbmQgb3B0aW1p
c2UKdGhlIG1hbmFnZXIgc3RydWN0OiBtc21fZHJtX3RocmVhZC4gV2l0aCB0aGlzIGNoYW5nZSwg
d2UKY291bGQgcmVtb3ZlIHN0cnVjdCBlbGVtZW50IChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRocmVh
ZCAmCnN0cnVjdCBrdGhyZWFkX3dvcmtlciB3b3JrZXIpLCBpbnN0ZWFkLCB1c2Ugb25lIHBvaW50
IChzdHJ1Y3QKa3RocmVhZF93b3JrZXIgKndvcmtlcikuCgpTaWduZWQtb2ZmLWJ5OiBCZXJuYXJk
IFpoYW8gPGJlcm5hcmRAdml2by5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2NydGMuYyB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyAgICAg
ICAgICAgIHwgMTggKysrKysrLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9k
cnYuaCAgICAgICAgICAgIHwgIDMgKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRj
LmMKaW5kZXggZTE1YjQyYTc4MGUwLi5jOTU5Yzk1OTAyMWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2NydGMuYwpAQCAtMzk2LDcgKzM5Niw3IEBAIHN0YXRpYyB2b2lkIGRw
dV9jcnRjX2ZyYW1lX2V2ZW50X2NiKHZvaWQgKmRhdGEsIHUzMiBldmVudCkKIAlmZXZlbnQtPmV2
ZW50ID0gZXZlbnQ7CiAJZmV2ZW50LT5jcnRjID0gY3J0YzsKIAlmZXZlbnQtPnRzID0ga3RpbWVf
Z2V0KCk7Ci0Ja3RocmVhZF9xdWV1ZV93b3JrKCZwcml2LT5ldmVudF90aHJlYWRbY3J0Y19pZF0u
d29ya2VyLCAmZmV2ZW50LT53b3JrKTsKKwlrdGhyZWFkX3F1ZXVlX3dvcmsocHJpdi0+ZXZlbnRf
dGhyZWFkW2NydGNfaWRdLndvcmtlciwgJmZldmVudC0+d29yayk7CiB9CiAKIHZvaWQgZHB1X2Ny
dGNfY29tcGxldGVfY29tbWl0KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2
LmMKaW5kZXggZjZjZTQwYmYzNjk5Li44MmU3OWI4MmE1OTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5j
CkBAIC0yMzgsMTAgKzIzOCw4IEBAIHN0YXRpYyBpbnQgbXNtX2RybV91bmluaXQoc3RydWN0IGRl
dmljZSAqZGV2KQogCiAJLyogY2xlYW4gdXAgZXZlbnQgd29ya2VyIHRocmVhZHMgKi8KIAlmb3Ig
KGkgPSAwOyBpIDwgcHJpdi0+bnVtX2NydGNzOyBpKyspIHsKLQkJaWYgKHByaXYtPmV2ZW50X3Ro
cmVhZFtpXS50aHJlYWQpIHsKLQkJCWt0aHJlYWRfZGVzdHJveV93b3JrZXIoJnByaXYtPmV2ZW50
X3RocmVhZFtpXS53b3JrZXIpOwotCQkJcHJpdi0+ZXZlbnRfdGhyZWFkW2ldLnRocmVhZCA9IE5V
TEw7Ci0JCX0KKwkJaWYgKHByaXYtPmV2ZW50X3RocmVhZFtpXS53b3JrZXIpCisJCQlrdGhyZWFk
X2Rlc3Ryb3lfd29ya2VyKHByaXYtPmV2ZW50X3RocmVhZFtpXS53b3JrZXIpOwogCX0KIAogCW1z
bV9nZW1fc2hyaW5rZXJfY2xlYW51cChkZGV2KTsKQEAgLTUwNCwxOSArNTAyLDE1IEBAIHN0YXRp
YyBpbnQgbXNtX2RybV9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRybV9kcml2ZXIg
KmRydikKIAlmb3IgKGkgPSAwOyBpIDwgcHJpdi0+bnVtX2NydGNzOyBpKyspIHsKIAkJLyogaW5p
dGlhbGl6ZSBldmVudCB0aHJlYWQgKi8KIAkJcHJpdi0+ZXZlbnRfdGhyZWFkW2ldLmNydGNfaWQg
PSBwcml2LT5jcnRjc1tpXS0+YmFzZS5pZDsKLQkJa3RocmVhZF9pbml0X3dvcmtlcigmcHJpdi0+
ZXZlbnRfdGhyZWFkW2ldLndvcmtlcik7CiAJCXByaXYtPmV2ZW50X3RocmVhZFtpXS5kZXYgPSBk
ZGV2OwotCQlwcml2LT5ldmVudF90aHJlYWRbaV0udGhyZWFkID0KLQkJCWt0aHJlYWRfcnVuKGt0
aHJlYWRfd29ya2VyX2ZuLAotCQkJCSZwcml2LT5ldmVudF90aHJlYWRbaV0ud29ya2VyLAotCQkJ
CSJjcnRjX2V2ZW50OiVkIiwgcHJpdi0+ZXZlbnRfdGhyZWFkW2ldLmNydGNfaWQpOwotCQlpZiAo
SVNfRVJSKHByaXYtPmV2ZW50X3RocmVhZFtpXS50aHJlYWQpKSB7CisJCXByaXYtPmV2ZW50X3Ro
cmVhZFtpXS53b3JrZXIgPSBrdGhyZWFkX2NyZWF0ZV93b3JrZXIoMCwKKwkJCSJjcnRjX2V2ZW50
OiVkIiwgcHJpdi0+ZXZlbnRfdGhyZWFkW2ldLmNydGNfaWQpOworCQlpZiAoSVNfRVJSKHByaXYt
PmV2ZW50X3RocmVhZFtpXS53b3JrZXIpKSB7CiAJCQlEUk1fREVWX0VSUk9SKGRldiwgImZhaWxl
ZCB0byBjcmVhdGUgY3J0Y19ldmVudCBrdGhyZWFkXG4iKTsKLQkJCXByaXYtPmV2ZW50X3RocmVh
ZFtpXS50aHJlYWQgPSBOVUxMOwogCQkJZ290byBlcnJfbXNtX3VuaW5pdDsKIAkJfQogCi0JCXJl
dCA9IHNjaGVkX3NldHNjaGVkdWxlcihwcml2LT5ldmVudF90aHJlYWRbaV0udGhyZWFkLAorCQly
ZXQgPSBzY2hlZF9zZXRzY2hlZHVsZXIocHJpdi0+ZXZlbnRfdGhyZWFkW2ldLndvcmtlci0+dGFz
aywKIAkJCQkJIFNDSEVEX0ZJRk8sICZwYXJhbSk7CiAJCWlmIChyZXQpCiAJCQlkZXZfd2Fybihk
ZXYsICJldmVudF90aHJlYWQgc2V0IHByaW9yaXR5IGZhaWxlZDolZFxuIiwKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21f
ZHJ2LmgKaW5kZXggZTJkNmE2MDU2NDE4Li5kYWYyZjRlNTU0OGMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Ry
di5oCkBAIC0xMjksOSArMTI5LDggQEAgc3RydWN0IG1zbV9kaXNwbGF5X2luZm8gewogLyogQ29t
bWl0L0V2ZW50IHRocmVhZCBzcGVjaWZpYyBzdHJ1Y3R1cmUgKi8KIHN0cnVjdCBtc21fZHJtX3Ro
cmVhZCB7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldjsKLQlzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRo
cmVhZDsKIAl1bnNpZ25lZCBpbnQgY3J0Y19pZDsKLQlzdHJ1Y3Qga3RocmVhZF93b3JrZXIgd29y
a2VyOworCXN0cnVjdCBrdGhyZWFkX3dvcmtlciAqd29ya2VyOwogfTsKIAogc3RydWN0IG1zbV9k
cm1fcHJpdmF0ZSB7Ci0tIAoyLjE3LjEKCg0KDQo=
