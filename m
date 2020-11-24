Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFEF2C26A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 13:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733262AbgKXM54 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 07:57:56 -0500
Received: from z5.mailgun.us ([104.130.96.5]:48396 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732512AbgKXM54 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 07:57:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606222675; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Type: MIME-Version: Sender;
 bh=p3o5O2rDOoKz7JnE/QmTS9ZiRoVNLotQeymZMjfvd8Y=; b=AX44xxKgbXglZVsSB8IYM3YtpEIrHts7L8zP1MDxzUxUKaJx9f+6sDd83UGjfVOuQw+3n8CE
 f8N7t+kFgKAOPLCx1S0DN8O0eBRr8CQ7oFyOsF0gM/ACptUC5e9UVXhDU7lNF7s/9pEQ43rw
 dDZicC/zotoa+9HCpUA+4lTP9XU=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fbd03477f0cfa6a16006a1a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 12:57:43
 GMT
Sender: kalyan_t=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 902ABC43460; Tue, 24 Nov 2020 12:57:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 366ACC433ED;
        Tue, 24 Nov 2020 12:57:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_b2b938fb10d812d8faa8fd415ac40fd7"
Date:   Tue, 24 Nov 2020 18:27:41 +0530
From:   kalyan_t@codeaurora.org
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
        John Stultz <john.stultz@linaro.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        abhinavk@codeaurora.org
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: add support for clk and bw
 scaling for display
Message-ID: <5b07a7be8d136392dc7f93933a7ee68e@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=_b2b938fb10d812d8faa8fd415ac40fd7
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

On 2020-11-08 23:25, Amit Pundir wrote:
> On Tue, 4 Aug 2020 at 21:09, Rob Clark <robdclark@gmail.com> wrote:
>> 
>> On Thu, Jul 16, 2020 at 4:36 AM Kalyan Thota <kalyan_t@codeaurora.org> 
>> wrote:
>> >
>> > This change adds support to scale src clk and bandwidth as
>> > per composition requirements.
>> >
>> > Interconnect registration for bw has been moved to mdp
>> > device node from mdss to facilitate the scaling.
>> >
>> > Changes in v1:
>> >  - Address armv7 compilation issues with the patch (Rob)
>> >
>> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>> 
>> Reviewed-by: Rob Clark <robdclark@chromium.org>
>> 
> 
> Hi Kalyan, Rob,
> 
> This patch broke the display on the PocoF1 phone
> (sdm845-xiaomi-beryllium.dts) running AOSP.
> I can boot to UI but the display is frozen soon after that and
> dmesg is full of following errors:
> 
> [drm:dpu_core_perf_crtc_update:397] [dpu error]crtc-65: failed to
> update bus bw vote
> [drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
> 7649746kb > 6800000kb
> [drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance 
> check -7
> [drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
> 7649746kb > 6800000kb
> [drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance 
> check -7
> [drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
> 7649746kb > 6800000kb
> [drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance 
> check -7
> 
> Here is the full dmesg https://pastebin.ubuntu.com/p/PcSdNgMnYw/.
> Georgi pointed out following patch but it didn't help,
> https://lore.kernel.org/dri-devel/20201027102304.945424-1-dmitry.baryshkov@linaro.org/
> Am I missing any other followup fix?
> 
> Regards,
> Amit Pundir
> __

Hi Amit,

Apologies for the delay.

I have gone through the logs and referred to the below panel file for 
the timings.
https://github.com/Matheus-Garbelini/Kernel-Sphinx-Pocophone-F1/blob/master/arch/arm64/boot/dts/qcom/dsi-panel-tianma-fhd-nt36672a-video.dtsi

if the above is correct file, then below could be the possible root 
cause.

The panel back porch and pw is less and it is causing the prefill bw 
requirement to shoot up per layer as currently we are not considering 
front porch in the calculation. can you please try the attached patch in 
the email as a solution and provide me the feedback, i'll post it as a 
formal change.

Thanks,
Kalyan

_____________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

--=_b2b938fb10d812d8faa8fd415ac40fd7
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=0001-drm-msm-dpu-consider-front-porch-in-the-prefill-calc.patch
Content-Disposition: attachment;
 filename=0001-drm-msm-dpu-consider-front-porch-in-the-prefill-calc.patch;
 size=2297

RnJvbSAwMjhmYjQ3Y2NjNWEzZjhmOGU1MTUxM2JkMjcxOWFhMTRjNjhhYzA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWx5YW4gVGhvdGEgPGthbHlhbl90QGNvZGVhdXJvcmEub3Jn
PgpEYXRlOiBUdWUsIDI0IE5vdiAyMDIwIDAyOjM5OjUyIC0wODAwClN1YmplY3Q6IFtQQVRDSF0g
ZHJtOiBtc206IGRwdTogY29uc2lkZXIgZnJvbnQgcG9yY2ggaW4gdGhlIHByZWZpbGwKIGNhbGN1
bGF0aW9uCgpJbiBjYXNlIG9mIHBhbmVscyB3aXRoIGxvdyB2ZXJ0aWNhbCBiYWNrIHBvcmNoIGFu
ZCBwdywKdGhlIHByZWZpbGwgYncgd2lsbCBpbmNyZWFzZSBhcyB3ZSB3aWxsIGhhdmUgbGVzcyB0
aW1lIHRvIGZldGNoCmFuZCBmaWxsIGFsbCB0aGUgaHcgbGF0ZW5jeSBidWZmZXJzLgoKZm9yIGV4
OiBod19sYXRuZWN5X2xpbmVzID0gMjQsIGFuZCBpZiB2YnArcHcgPSAxMCB0aGVuIHdlIG5lZWQg
dG8KZmV0Y2ggMjQgbGluZXMgb2YgZGF0YSBpbiAxMCBsaW5lIHRpbWVzLiBUaGlzIHdpbGwgaW5j
cmVhc2UgcHJlZmlsbApidyByZXF1aXJlbWVudC4KCkRQVSBodyBjYW4gZmV0Y2ggZGF0YSBkdXJp
bmcgZnJvbnQgcG9yY2ggYWxzbyBwcm92aWRlZCBwcmVmZXRjaCBpcwplbmFibGVkLiBVc2UgZnJv
bnQgcG9yY2ggYWxzbyBpbnRvIHRoZSBwcmVmaWxsIGNhbHVjdWxhdGlvbiBhcwpkcml2ZXIgZW5h
YmxlcyBwcmVmZXRjaCBpZiB0aGUgYmxhbmtpbmcgaXMgbm90IHN1ZmZpY2llbnQgdG8gZmlsbAp0
aGUgbGF0ZW5jeSBsaW5lcy4KClNpZ25lZC1vZmYtYnk6IEthbHlhbiBUaG90YSA8a2FseWFuX3RA
Y29kZWF1cm9yYS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3Bs
YW5lLmMgfCAxMSArKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9wbGFuZS5j
CmluZGV4IDdlYTkwZDIuLjMxNWI5OTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9wbGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9wbGFuZS5jCkBAIC0xNTEsNyArMTUxLDcgQEAgc3RhdGljIHZvaWQgX2RwdV9wbGFuZV9j
YWxjX2J3KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCXU2NCBwbGFuZV9idzsKIAl1MzIgaHdf
bGF0ZW5jeV9saW5lczsKIAl1NjQgc2NhbGVfZmFjdG9yOwotCWludCB2YnAsIHZwdzsKKwlpbnQg
dmJwLCB2cHcsIHZmcDsKIAogCXBzdGF0ZSA9IHRvX2RwdV9wbGFuZV9zdGF0ZShwbGFuZS0+c3Rh
dGUpOwogCW1vZGUgPSAmcGxhbmUtPnN0YXRlLT5jcnRjLT5tb2RlOwpAQCAtMTY0LDYgKzE2NCw3
IEBAIHN0YXRpYyB2b2lkIF9kcHVfcGxhbmVfY2FsY19idyhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSwKIAlmcHMgPSBkcm1fbW9kZV92cmVmcmVzaChtb2RlKTsKIAl2YnAgPSBtb2RlLT52dG90YWwg
LSBtb2RlLT52c3luY19lbmQ7CiAJdnB3ID0gbW9kZS0+dnN5bmNfZW5kIC0gbW9kZS0+dnN5bmNf
c3RhcnQ7CisJdmZwID0gbW9kZS0+dnN5bmNfc3RhcnQgLSBtb2RlLT52ZGlzcGxheTsKIAlod19s
YXRlbmN5X2xpbmVzID0gIGRwdV9rbXMtPmNhdGFsb2ctPnBlcmYubWluX3ByZWZpbGxfbGluZXM7
CiAJc2NhbGVfZmFjdG9yID0gc3JjX2hlaWdodCA+IGRzdF9oZWlnaHQgPwogCQltdWx0X2ZyYWMo
c3JjX2hlaWdodCwgMSwgZHN0X2hlaWdodCkgOiAxOwpAQCAtMTc2LDcgKzE3NywxMyBAQCBzdGF0
aWMgdm9pZCBfZHB1X3BsYW5lX2NhbGNfYncoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJCXNy
Y193aWR0aCAqIGh3X2xhdGVuY3lfbGluZXMgKiBmcHMgKiBmbXQtPmJwcCAqCiAJCXNjYWxlX2Zh
Y3RvciAqIG1vZGUtPnZ0b3RhbDsKIAotCWRvX2RpdihwbGFuZV9wcmVmaWxsX2J3LCAodmJwK3Zw
dykpOworCWlmICgodmJwK3ZwdykgPiBod19sYXRlbmN5X2xpbmVzKQorCQlkb19kaXYocGxhbmVf
cHJlZmlsbF9idywgKHZicCt2cHcpKTsKKwllbHNlIGlmICgodmJwK3Zwdyt2ZnApIDwgaHdfbGF0
ZW5jeV9saW5lcykKKwkJZG9fZGl2KHBsYW5lX3ByZWZpbGxfYncsICh2YnArdnB3K3ZmcCkpOwor
CWVsc2UKKwkJZG9fZGl2KHBsYW5lX3ByZWZpbGxfYncsIGh3X2xhdGVuY3lfbGluZXMpOworCiAK
IAlwc3RhdGUtPnBsYW5lX2ZldGNoX2J3ID0gbWF4KHBsYW5lX2J3LCBwbGFuZV9wcmVmaWxsX2J3
KTsKIH0KLS0gCjIuNy40Cgo=
--=_b2b938fb10d812d8faa8fd415ac40fd7--
