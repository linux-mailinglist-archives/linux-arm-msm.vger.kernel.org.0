Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06091EEA31
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 20:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730736AbgFDSYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 14:24:46 -0400
Received: from mout.web.de ([217.72.192.78]:54947 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730714AbgFDSYp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 14:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1591295076;
        bh=nil5JN57Rxa6Zg/7er4FrelLppL4VQaglgRdUWjzBe0=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=C+jwrDD2gM3/ex7+E7bIp69BwAelmRnbXRXOJURUFARHfnAyHOSGKUbkKC3047bcf
         /zsZ+MVO22nXviF8Rfb0+HLGMkUeySD86bk+t081tSEEmyB70e92rfkk/2Stze0Kxh
         YAYy11fJUymJN9ZPjwmEe8DdOW3DiiIBSUgT/1Jc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.94.220]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M8hsl-1imBMN0ovz-00wEut; Thu, 04
 Jun 2020 20:24:36 +0200
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
Cc:     Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        hemantg@codeaurora.org, Johan Hedberg <johan.hedberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rocky Liao <rjliao@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Claire Chang <tientzu@chromium.org>, yshavit@google.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_qca: Fix double free during SSR timeout
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d3444be6-28e6-bef5-08cf-6038620f65c6@web.de>
Date:   Thu, 4 Jun 2020 20:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:z3amskq1UWPBdHEnJ2qbXAr/4jQ/NbVHv57NvQfk5LeIL+YcHF/
 XWAJ+1qPWcyit7scpJlLuLlHJ/BubgnXKeOA4jl2Cm8etXfV5hjw8iJvskTPvKMGs7BxLBs
 fUDPybfn0DgKbigdkSBOZl9Ax5lSI0NOCgqvRpW7PfnZPYILNXkcJKv+T3PPf7JAd9pIwYv
 MpzEBGmQDBmlgnqoquLAg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vhqmhcfZzQA=:RkHhpTWK/4JxrK+ltlVtCQ
 bQeeKWe8lNNq8kh92Z+EH6VdgBQVPaOM+Epd9C0EmUVqITb9ZrjT5/2zziAK5RE2Ilhf+QsFn
 BXukae83MX0UXPz0wcYKw++0GGaJ8nHaGm1isnBMdC5ndZ5orJhfK8iuzIQbB6e9jIkAZCAiy
 0yYl5MKNRHOp2myDbI34hRexn8xALshLlDQt1PdmAfe4Zq550U+ihtWyNBfk8H8g28KeMoVfu
 WVysFrjCcwNMgNrBigojhJKbkeuusjyMl3qqX8FlJVft3hE5rpAZ+0kU3fB3F+xxf7L8/WpRo
 eUva2yU9bVe5Qx6zKQ1xM45aRDCGMzhHDSqIE5Z2Gfy8UBi2k6hVwkHQwjBJsAFydgaod9eTT
 r3qmL6aX6Wd2JJVSAM02msXXdyHZGm5elna751s946OM9wFSFfme2qGVCKwPbCrzCceqR2+aU
 fa3OmCM3FSgnmDD8z1OxEfquiy1JqVL9dpW7yHq3tGDSCF8muvoLw67UWDs4vmQ+fGWXybw7y
 Uw49EymUBwJkAC543Ou7TWHKSU5YSykc1Kl3ZxYKZKnYgOAakQt6if1Ul1/VsWgkJxF54kgJj
 +tVpjJwnrRUFK25tB05/96cE6NwdPndiUk+bACiCbjzOV5VSoFTpOiqWsao6Uu+9lHHqgVdB4
 ZTEadWfUPeY6whFVvF3yItnVIm/vLotcPsPDQTziF6nonVGwin/lNtgRAulLgVMMq69O0G+qf
 jOOaJ7QCrYPCtahNXJHvOnIsTwBtn+CYB97GrB0ZN/tBES53spayESfg6tAUk5YD8jlApypPw
 k0j2ekSprS7a6yIFsxepXSVgAJOClkcnhQuSz88uzwJFn0i2uWEyl0Bm/7D9KMONpQDhsTzrc
 rHK12suVcD4x6IHr34FOsrOUCQX92eooF/LPsckRAQkH0qhq9339qDt/+tmfcaTZJftR/yDA3
 +OVuXnuduKbMT5uRWcMeIDd0fOjM3kM+g9EBmlrvwRkNjigifNgIaaAwqbeQsiaz0ddZzO3aL
 hfiBzQiEi0dkBsY5P2j9YyWcaTnP0yvopWboNZxdWpPfdOV7L5PhdI2vTicvk2daeLwR+Gm3n
 r5JAhD3Fx+LNgQmgZx91SkVisEAeSVe3xtnAFwa67QP2SkJmCF2kWm6PJDWy2ad41SdVwZVM7
 AXDOjiAdzK5FgJI0oHLP6W5gQebhWht98tFzR8Ldna6MUb5lHMwbNhoMsVVSCi7PQdIkuvpCI
 X/B9sdIUtOncWx4i8
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Due to race conditions between qca_hw_error and qca_controller_memdump
> during SSR timeout,the same pointer is freed twice.

This is an unfortunate software situation.


> Which results to double free error.

How do you think about to omit this sentence from the change description?


> Now a lock is acquired while SSR state moved to timeout.

I suggest to convert this information into an imperative wording.

Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit messag=
e?

Regards,
Markus
