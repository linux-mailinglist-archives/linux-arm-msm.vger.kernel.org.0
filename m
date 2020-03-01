Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 543E1174E9D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2020 17:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgCAQzL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Mar 2020 11:55:11 -0500
Received: from mout.gmx.net ([212.227.17.21]:42669 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726204AbgCAQzL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Mar 2020 11:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1583081710;
        bh=HZMgLpTpxl1e1ENInbOssj+6tKEqhJIzOYowFr9xRTw=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=SsaA0oNf6s3U3CwnszISJ9KvnXLb4dlVmGHcMJyR8HYdvEvVLGQ6z9mAXO/8A1reA
         t+dSXqAteiegocvldhmxuTbpLUu56CQhvQpAHVAx9fITo6HSoRwoL1IgCEb4/2rXVg
         in3UNHifhKhMbADqeRAzSC1mqVUchx8DcGNXQIEE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.202] ([95.91.236.254]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUYu-1jkmos01ym-00psxQ for
 <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2020 17:55:10 +0100
To:     linux-arm-msm@vger.kernel.org
From:   Andreas Schaufler <andreas.schaufler@gmx.de>
Subject: HugeTLB on ARM64
Message-ID: <f994797a-96ad-ba51-9e93-e4c4e34d24d5@gmx.de>
Date:   Sun, 1 Mar 2020 16:55:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kFM9dMNE0GdjyjXllFB1Owt2zO4U9R+Yh5VMbDNkeQvi4SR/w5w
 4U6YUg1kYv8ACGikvzkVhplareZ5MRIhWvVneXy0on4/NQ5DUBGF+tv8FZ5Ug/aY8wd3Kd4
 rd9Pg1d/xKuqwvSrVhToALzgPBR3KcfLRQ80Hy3V9SKguN3JmHRjull1zz+RtAvDUaqELQ5
 G+yTk1y6T2mCq6wIw5Tsw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8ZZcRbG7n/s=:iowyq1ieYtB4ZJvp5NXEz1
 4yUny4RP5SMdvBds86YPYWjWF9iDhYthXwJAF+iy/mlcabZonj/aFLeKP6RwE+iue/MDdWFPw
 L5FK+HZy6mp0U1gzCkNrZYYELEQ8R1YEEOWTsm3rt+lxGwy3Cr1QtdVNkMhm562X1JRHRj5dP
 V+swruQJ4B8GtzIqLAQtFHZqk1u+kbkOFXD6k9yMi3NdeCilTjhN4N4stV6C8qihlbNPVecSr
 AjIS10zfg6QbEqznS4mnN354B7KQ5IbWZBYzb7I6dg5XJb16mBFsYuid5x6hkmuPJb2EJA10T
 9jGIrOzudSb0a1pOb3ZX40KlI7CJK0OtjYnpBliHE+ArnAK+9Em69+ze7kGezDac9YYNZoo4X
 gD24yj3JmA3hsTRR1W6CtO62YLheY1wsALO5tOE6ensAd/Mz6NSB19Nt6laMATd2T95pdf5xv
 XjqqgvJpnA2KDlv+qsGCiJMlNeQ3hRumn13h05TOiVuULZg60eDfIzyqQBAIni3zh3LQtNwjn
 iXH1n9KpjWj9eD6YaHpY0uBAV0g5StLLswo4heFjJ/P88i20nQJo8ah5h5bYU5MDElvF4bV7O
 Y23dlEoCnnld99kX6Q2GBJ4ACbwjo9+hbG8ha/Ivn263vEstxiZDpNSJUprEvdtJ0EjSO3sGU
 BMeWDguHgci946THqBDVPj5CU43YNOykJRYTzRYQIf4tGNkrOsrPSw+woXRF3d6uf8kkw5svY
 g9H+Ohjb5J535fBO4XICgB+puWUX/q9tM9q34FBLXj6dUW/j0GL5ooz+YEvnNR/r0eSh5ON66
 7dZSbTlq2V22y/Yj5Wo07oCTZDxOJ8WvE5cNxKFiSc/Bj5ORzoTli2BrmXI0r4MnwTK4YujoJ
 HhEO4zFPWouprlsT5j9Bhs+VzxajSLTX0gg4APWFhhe7vU/iqQFBQ83Uw6+Qd0Wv+uicRRMj3
 1x4lqPV4uhGgfTs3BqB4QhTxNsPpbDhu4f/nlXqhExq/h84Ij3STvf0GBoAkbqBAmBAPdAq7P
 QTxhovumvb3TtMgefQryE5kWgWPvb6GQwOG6f5kji8vCg9X2vicWzewYrdrT9f4068vEWskeh
 CM8/6RDs5JXq2KG3xbB4JUumKZDZ5t0F6CxYwm9ye/unJiayGV7v+Hicq0wU60kbfLmM7RG2y
 w9Blet1E6BrLJYBlWO22YUAoBwnoJJQ4+3hVX2Qky3d7F6Lnt7Rf8BbBHvfNlSndj8xk0QAVP
 tdM3L6kLQ6RiAPIHb
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dear all,

I am working on a project based on a A53 SoC. The goal is for the CPU to
receive and process data. I am running vanilla 5.4.9.

Benchmarking memory performance shows improvements when using HugeTLBs.
I managed to run with 4K base pages and 2MB Huge
Pages specifying on the kernel command line how many pages to allocate,
i.e. hugepages=3D512 default_hugepagesz=3D2m hugepagesz=3D2m.

The ARM64 when using 4K pages should also support 1G Huge Pages.
However, when specifying this:

hugepages=3D1 default_hugepagesz=3D1G hugepagesz=3D1G

I see the size properly taken into account in /proc/meminfo, but it does
not manage to allocate them:

# cat /proc/meminfo
=E2=80=A6..
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:    1048576 kB
Hugetlb:               0 kB

There is enough memory on the board. For instance if I declare a CMA
area of 1G in the device tree it manges to reserve it properly at
0x40000000. Of course I remove CMA reservation when defining 1G Huge Pages=
.

I am looking for the reason why this would fail, but I am not
successful. Any hints will be highly appreciated.

Thanks a lot and best regards
Andreas
