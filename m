Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9B661964BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 10:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgC1JPv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Mar 2020 05:15:51 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:39675 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgC1JPv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Mar 2020 05:15:51 -0400
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N1fzM-1jOy9W0V5s-0121BJ for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar
 2020 10:15:50 +0100
Received: by mail-qk1-f181.google.com with SMTP id q188so13563595qke.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2020 02:15:49 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2LQzclO+PJKXfez5p1KA205vPR9qYqZzYAsfqgsbEb3zKHloRN
        CeO2DZw93ba70YDs8s7Mqb2ySCHDZt0sasZphdE=
X-Google-Smtp-Source: ADFU+vsEwsZ6iJg1C4TSE1cMWb+UnTTxhSDojVw/L0OAefIFglRrWD4E/aTUDz6YJYnZmNCawfDP+EZ7VusIyFa5cpQ=
X-Received: by 2002:a37:6455:: with SMTP id y82mr3167433qkb.286.1585386949004;
 Sat, 28 Mar 2020 02:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200106135715.1159420-1-robert.marko@sartura.hr>
 <CA+HBbNHEetusFNH-8Qmva=2-_HQRRJ33qfBRSudZBVW+vK0tnw@mail.gmail.com> <20200327220545.GC5063@builder>
In-Reply-To: <20200327220545.GC5063@builder>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 28 Mar 2020 10:15:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1_eyVSTgKDk+qph6CCKswWFWhPfX=yi3=jAeUf4uWC6w@mail.gmail.com>
Message-ID: <CAK8P3a1_eyVSTgKDk+qph6CCKswWFWhPfX=yi3=jAeUf4uWC6w@mail.gmail.com>
Subject: Re: [PATCH] ARM: qcom: Add support for IPQ40xx
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Andy Gross <agross@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ddJVXC4EQ/e6/wR0IgXzsOts6UtkuB7RSjXotUtPqbwTV6IgtpD
 LBgSxrQ/7XNRuAl5zqYaQXGvwf/68gouV0ZdefcMYhdHywaH+hyHdV85X1XvFnRfU8Z2bM8
 zRGMGU9JHgRUwYMegm7+cFhAyp5BQvdDuhSTfnljURj1o7TY+WauwHo2ZXes9lV7BvCAML2
 9oYic1Nna4Xvpit7OWJCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0pJbh7YAWXY=:GGMo4oyzFDKY3FDKSRzFSa
 2LanNzttxQRaCCSKdvPJdvthW9DA6Skypfh1ZlNjSa6OlRUqDQlKQ4xxZIkdQIxDx6QCDGZ2f
 P9+kAekv0+mQgI0EkfkiRt7nqlcW/qw0YcrBSvAqORp3Rc0z9XOotAuiFiBpPgy3r/qfMSYx7
 PM//FpJpEMqTj7Blk75YuKqkxtPMafoznjt0gE0hE54XpmHx8pzhknB21xN38R1bieFY5AcpL
 Z/h3hTyrMPSAtRoJRrl00s080RpFLQ8JcUguowGtXHVEgV1PaKkERrQa2DUK/CKAxelV+8s7K
 4tC+oS3fX/qY8Uhv3nRg/30c/UG3ndfLmIdLwxHK1Aj5UTnYlfGCqSy4lMqRvy/VJWEz/OKz3
 oCDiMj2OuNB3GbSFEbWI/Nk/Jj1sr2vvtU8eRkHRun1tjzyYCxyWsZ4zjBeJAYzzRgrcmlMr3
 7HPcWIoijxB9muWhZ15/GlvzriBPRthygCBpB8fNO2H6GATRANmuVhhsvR34cFRZupsLWDjSD
 Zy2Qs5YNGZmJyVhnMFEjtgYPjxKg+usOFViIhp+xJ7QYXbnJnUhRiXC0xQt3gvX/+jpGgsF5Q
 C97NdEQQHwAQXGjq+yLYU6tSrf45hGdB9ZVFnWkhtI5urCUJiMpkPdGcipSTHQR0HDU5uHsex
 ZeQpdAmLsgumvnzjWijPMYiEx8EFsE1l5uQ/GaNjEnNbUTxIdRRWnUthE14bsavkK++SwrCd9
 0rPc2DCUYg6FhPqQI4WsCdBr5Qg7DsuKGeVpMYNmia/Z+IxGf/5IEqh3i+ii581bFCTDllHLC
 3xiy5gcIKvAOqmxIU5cvgiZrRuGQ8UGjBUfBpje6ydB/zO6boM=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 27, 2020 at 11:05 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 25 Mar 03:25 PDT 2020, Robert Marko wrote:
>
> > On Mon, Jan 6, 2020 at 2:57 PM Robert Marko <robert.marko@sartura.hr> wrote:
> > >
> > > From: Christian Lamparter <chunkeey@gmail.com>
> > >
> > > Add support for the Qualcomm IPQ40xx SoC in Kconfig.
> > > Also add its appropriate textofs.
> > Any blockers on this patch?
> >
>
> No, I must have missed it in the past. I've picked it up for 5.8.
>

If we only need these few lines, I can still squeeze it in for v5.7 last minute,
just forward that patch to soc@kernel.org. If other things are still needed,
let's wait until v5.8.

      Arnd
