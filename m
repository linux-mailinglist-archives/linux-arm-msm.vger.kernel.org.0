Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 060D39D578
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 20:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730327AbfHZSI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 14:08:56 -0400
Received: from mout.gmx.net ([212.227.15.19]:55159 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729777AbfHZSI4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 14:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566842921;
        bh=gweS6sFBqw7a79B6BUPIuvNnAjFw784tgZTGVNSFG4M=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=ccXD9KWdx8djHzwWHNhEQU9UbL3MLnu10LoFg9o+E4vpxF2DWC/U1mJ3uLgP9AIPj
         5m1t8qASpsQX/dJGOu/9DwSnuS0oXGuxzqX3ycGvBxmBMloEuIanN56To2UxfwdlJU
         +Gxz7cJmVb3Zw/BBaU5j1B7ZX7eEYUfehlt7OpPw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.106]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MNIi1-1i9DJA0o5R-006zWi; Mon, 26
 Aug 2019 20:08:41 +0200
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
From:   Stefan Wahren <wahrenst@gmx.net>
Subject: qcom: build issue in Linux 5.3-rc6 with CONFIG_XEN=y
Message-ID: <d0ab0e86-a409-10bf-24ff-8bb984055752@gmx.net>
Date:   Mon, 26 Aug 2019 20:08:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:BFzBuSg1yc+c4VxvUnTxlCAwvxmbHViiZ1BzmW2Wt24EhucwFgx
 F0zBkvnMr4a9FnlNu1Fpb3XGfKKUWf7PIuG+vnjF1gW6KOzvxmE5w9WKY0RrRkOLy06DBzr
 UUau1NiXf6KR3m+J37KmlRYbPMX0ZKOH1UY6CxNtM5zK1KxSiGvm+cVaha3WAl6ZVBst6Xe
 jXmyAGDAvNy9rdNACJfpQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0LHqDGeWPHw=:LMEPYeER0SocJjfPhu405R
 lYwfvU+KmI7XR8SQfAD5aDNrR9pdTPQXr3+/Kd7kHUP55x++wbnBLZ4+sitnVdKYPf9V0UJOd
 FGTjiM5mfUplp3vJI2pJj6wCocV3mgvlHcponAUEwavgXb7j1EStk7mlgGZxXtquSYhAogemc
 VQxTWVoCqM7u6qgTKMbI2sqSqmB/X9eYcfOcbXShmaJbgb3ysF64HJT4nstIKE1ouXw/toX5k
 HWln8rC9kX3vh3hdwgJvR/ZSOA0IB6IvUTP1s3q+i2Q216Y5c6PWBW9BxfDyl3gkqtiTVEpir
 qiVRgC5Wt7qYVQiC0U/Bv4cHvWvigvaZLQJ+y9EqnmlBatk+xgbRZaDXESMAvGAK+ki2z6114
 ZKch6mn2RH53g8pETGCBJuQkT0uJS0jZMsSN57HgIjcyC4DJxSOdALyDc1WJElauC5h23N2ae
 9bkPJOj3JAOOjYzyBnZGiZxECeBzf6/BAT+ev5QWaFAMLH6q4uzlnZGQZx9CNQJxPdG/RoNuB
 rOqN28A48iPnazXG9E+VtXA3mYTe+1YJY9NiGGF9JkDQA/0CRexRZOIVKDxZwqz5OQRXxGZtq
 d+iOX3dvn36S+k2qLxgg650KaxgZEVE35SDp8oCT8lrKAhwqduiLjncdu4YyJUak2i1Z0w60e
 FZg0VfI3qXakmG41A8QMQrMu14HaK9qh1AtdVYcIV1BMbN9pDmrnHG/kmvLGfHiZowxE0ClFX
 RfkYSTW6y9UzAblLH40cmJ6f/5HqT60J8cOtMYa6Fz1CDeC5o7zpo+pXjkdS6J+wR/uJ9QIsy
 SiMAKzymjhCHo5z3CTYqmDqGGdNU/XrFo9biVSHvlZ7lndiiUOdVnvQ3EduzkpvYmP888evPd
 BeCvMIZIXpsxcqSwBf7Fv4ckotsAUnC9mR4dqhBCfYS/Eymb7PW4ly9Fdlr57k0uvHGSWTlbq
 +t6Kk9roM+M7AFg/cNB4tvqjLkm5QbBbAikjQizJlI9nQaL6tQLKA20IU2FhGwkV9OVtdBH5o
 5vUNGGQvC+oEvxieSnK0FDfLxeP0gXogdrrU1G4GKTT+KY2oPFQ3wR3Ebn/Z0J3dB4kngDjQS
 sKX4VaRCcQ9F202I3e8zquqoQetS8nCvjcfKe4fTWxzwbYkc15aRxyMUewFQcfvqebb0A8o8z
 AoJh8=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

i tried to cross compile arm/multi_v7_defconfig with CONFIG_XEN=3Dy with L=
inux 5.3-rc6 and i'm getting this:

=C2=A0drivers/firmware/qcom_scm.c: In function =E2=80=98qcom_scm_assign_me=
m=E2=80=99:
drivers/firmware/qcom_scm.c:460:47: error: passing argument 3 of =E2=80=98=
dma_alloc_coherent=E2=80=99 from incompatible pointer type [-Werror=3Dinco=
mpatible-pointer-types]
  ptr =3D dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
                                               ^
In file included from drivers/firmware/qcom_scm.c:12:0:
./include/linux/dma-mapping.h:636:21: note: expected =E2=80=98dma_addr_t *=
 {aka long long unsigned int *}=E2=80=99 but argument is of type =E2=80=98=
phys_addr_t * {aka unsigned int *}=E2=80=99
 static inline void *dma_alloc_coherent(struct device *dev, size_t size,
                     ^~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
scripts/Makefile.build:280: die Regel f=C3=BCr Ziel =E2=80=9Edrivers/firmw=
are/qcom_scm.o=E2=80=9C scheiterte
make[2]: *** [drivers/firmware/qcom_scm.o] Fehler 1
scripts/Makefile.build:497: die Regel f=C3=BCr Ziel =E2=80=9Edrivers/firmw=
are=E2=80=9C scheiterte

Luckily there is already a patch to fix this in linux-next:

firmware: qcom_scm: Use proper types for dma mappings

I hope someone can take care of this.

Regards
Stefan

