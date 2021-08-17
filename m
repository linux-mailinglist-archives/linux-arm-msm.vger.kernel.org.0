Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85103EE83F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 10:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239009AbhHQIQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 04:16:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:58775 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239101AbhHQIQo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 04:16:44 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N0F9t-1n2dbj37eZ-00xGzb for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug
 2021 10:16:08 +0200
Received: by mail-wm1-f44.google.com with SMTP id k5-20020a05600c1c85b02902e699a4d20cso1559784wms.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 01:16:08 -0700 (PDT)
X-Gm-Message-State: AOAM532mbmkSUOj/pFOmBbShvEYGM2REN/C8dBvBMQxp9VKBjaWfxUvw
        Ky65GnUy+wHOUmRCB9FqI7v4EbCuW86O37zzAHo=
X-Google-Smtp-Source: ABdhPJzlr2DgXf+7LxALEnoTzhLxUSfXQkSzf2m61KgnQs42OE+o8NnnlZ/uvQYVbXlgb9n2lgVbC3mBF768k2rcJPY=
X-Received: by 2002:a1c:6a18:: with SMTP id f24mr2092620wmc.142.1629188168249;
 Tue, 17 Aug 2021 01:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210816231223.586597-1-bjorn.andersson@linaro.org>
 <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com> <YRr6rLXRn0m4KUMx@builder.lan>
In-Reply-To: <YRr6rLXRn0m4KUMx@builder.lan>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 17 Aug 2021 10:15:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0_dS_wvWSLx4RmnGc5dwYFyrsPrVNBAGs1DTXnWWoX-g@mail.gmail.com>
Message-ID: <CAK8P3a0_dS_wvWSLx4RmnGc5dwYFyrsPrVNBAGs1DTXnWWoX-g@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v5.15
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Doug Anderson <dianders@chromium.org>, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Martin Botka <martin.botka@somainline.org>,
        Robert Marko <robimarko@gmail.com>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Felipe Balbi <felipe.balbi@microsoft.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kathiravan T <kathirav@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        Robert Foss <robert.foss@linaro.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        satya priya <skakit@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0d5aa5XU4YPQQgjeFvgPGsKpX/9WWAwbdrGuQP5OVmVfBpehepX
 iaf+CKVGWJKLzL1Mk4BEoMKRJIZVjrg9GinZKOKXcIWzAtv1vcAo5TNo6KjRLny+7FSmglY
 ugZq9H4WpnLebaXz0u52oFoWszYYYJBpFmA+jfd93NNqdrAJlbR/b6pO99cZcmxg0U5fcrO
 ksEy7TbTlmWbrbtHbR2dQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ixVRfgf/BHg=:Gw5r7xfO5CTVlpAvlH5VDS
 stBcieeu+bGSSTKXB85CbXY5v0YmCi0tflsoncATvu35hsHVo/BjzaxtQE3UtbAkfgAscyqH0
 owLpushDy1z3yIAtEhhkzxp+t43ig2vp4ig0Xx0Dhh1RgASx3mJWiiwZdHfJj2zPKwkDTFMda
 Eyw9K5cmKsNrj9vgK6TZRSaGPSu6gzDgDOL6j1vJq1ubsZwzLt0mSCe7WCddbLSTSRVnwnk9o
 ElI92JpMP4e4r0BI5G3l68dJTHxSI0Nt8wD8pR/0tsEdPBUvVxuqZmyWU96L9ZgJZyUXH2M0b
 dQxAktECEsm1dP+3K/FwT9lYfTYEJuS7u+7acsw9j8JsOwLbBuYmR99bgQgX5MDQ52C6fn8ej
 j+rn8nj2y9w/lYR5+oVy4ypIy+GHGvY42RAwwVFA02nn8w3yK63RZ3gjcmyCv1nfXt5QICgLN
 TERrM62qYkLFi1kmPZYPkZepG+/KmUzSlv94nZq3OJRZzhyb5rQw/uOskkYmu47dV+oDdJsyX
 Wqz1fZ1+3xBGpff3iEE+By7eQMtxX7dWVq8FiOj2Ad9RtdlW/cZCprv0gB0XVaHopXQzki/Ti
 LLFndOUDEenng3hzp4hMDaHg6uJvEGEUhH1X40UFJ3jATKLd9CQsDom6Dju/0He6kVe2jcbzh
 GYwAg9PX8deo351heSTHJhJbgW20QAq8JS9+suDxp34B/VWnCDqAZLEgvjXgIhKbEGUNHIfdU
 /aWL0xZyFqXwCmltAEuv8yUYMitCesHWfoggoA3Ten01ihlkYKuaOsEX3ZBmyk/TT2qBtHk1e
 /dUoocGOLknUQNI4Lx6i3AED370ERUoHl6KHMsmfwjrwAbWAYuPS34s4HSxcwOl437CRyosKf
 Tegv/owm/+IPR+oBvSnEI5Jj9tXKkNwAWjkSzj5hKWfgImtfr4i+qdCqwQGtKdO+rTVXCLxii
 fSm+fB7MqJS6q+3imTozEFfgjjJiVYBwb0LP2TfxEqt6XBfgJWCOt
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 17, 2021 at 1:54 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 16 Aug 18:41 CDT 2021, Doug Anderson wrote:
> > On Mon, Aug 16, 2021 at 4:12 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > Douglas Anderson (1):
> > >       arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> >
> > I hope the above patch doesn't cause problems. I had landed it in the
> > drm-misc-next tree as per:
> >
> > https://lore.kernel.org/linux-arm-msm/YMDdyEzCpdttQyNu@builder.lan/
> >
> > Presumably git will magically do the right thing here since nothing
> > else on nearby lines is changing, but I at least wanted to point this
> > out in case there are any issues. Right now in linuxnext I see both
> > changes:
> >
> > ab428819ee3f arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> > ab6f24b404c9 arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> >
>
> Yes, we agreed that you should take it through drm-misc and I must have
> forgotten about that as I drained the patchwork queue.
>
> This has been sitting in linux-next for a while now and I've not seen
> any reports from Stephen, so I think we're good.

I just double-checked that the merge went in properly, sometimes
this kind of patch causes entries, but in this case it's fine.

        Arnd
