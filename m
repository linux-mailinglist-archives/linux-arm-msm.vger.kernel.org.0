Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF78F57CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 21:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389547AbfKHTlF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 14:41:05 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:37035 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388041AbfKHTlF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 14:41:05 -0500
Received: by mail-il1-f193.google.com with SMTP id s5so6160501iln.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2019 11:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PyL7QIbbkltCxwaoH07IawNE2jNHVrqm8WyCOzItjeg=;
        b=URngXFsFBSlORoHTddkypzyzZQFTUiLnXUkdZpuMXhrfMjZG2m3oD/USA9MmfowJrk
         BMrMYPwPxK6xydfQPU3kY847M5KyFEeuL1Ogm/eD6iLT+1zj8wPSvAQtT56S3GJrn6I6
         7YA+MRoku5DcTPQ4B05MB6Wm1oMj1BTNXV248=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PyL7QIbbkltCxwaoH07IawNE2jNHVrqm8WyCOzItjeg=;
        b=anFVgUk0N3TkWJ7gxjRzbOr3aXq0rbIH5C2v6Rl+zHL3v9puOfmrjIYv1h2cjgV2hO
         kj5SbhOC+ITr1mENF5z8yxQa66vKkWnByLlAn3UP7R0oXUtRfdmNvyoZA/OC00iOMCjc
         N2SNFNWs0yjQ3JMA1LZiAx9eaIl6ExxzjcW6kULfV182atTSm+g5jcntQ8IHEXErxN/s
         artvSrTf0ylcwuZeJxN/9ZE0Vca+Nq2NdIYqQd3XhrTE5RMn4cFi1dVfJ+zYkF+pCvx5
         ksQu20egeE12KPn8wgX0ZkJHTzhagXDDDshB+dZYMsGvMMNyylD8pQRV1iN5jCuibKOb
         wagA==
X-Gm-Message-State: APjAAAVaXd/5j3pC9Miu65cQP5f6tx4vpVjNQCq9gY2cfOXDO1aV0b1G
        uIBGABfJ33v+86cHbvoedQdUVz1uGzJKU5deuRfacGXG0TRY3A==
X-Google-Smtp-Source: APXvYqzgnLEMJElY4feWjyM/e0rxUVe4GQXAu+8IyDWYpTOQ5KSWXeop6SLQ9dXAUJ2jigPykTv+1s0bdZOnPNNxlws=
X-Received: by 2002:a92:ce0d:: with SMTP id b13mr14965777ilo.26.1573242064120;
 Fri, 08 Nov 2019 11:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20191014102308.27441-1-tdas@codeaurora.org> <20191014102308.27441-6-tdas@codeaurora.org>
 <20191029175941.GA27773@google.com> <fa17b97d-bfc4-4e9c-78b5-c225e5b38946@codeaurora.org>
 <20191031174149.GD27773@google.com> <20191107210606.E536F21D79@mail.kernel.org>
 <CAJs_Fx60uEdGFjJXAjvVy5LLBXXmergRi8diWxhgGqde1wiXXQ@mail.gmail.com>
 <20191108063543.0262921882@mail.kernel.org> <CAJs_Fx5trp2B7uOMTFZNUsYoKrO1-MWsNECKp-hz+1qCOCeU8A@mail.gmail.com>
 <20191108184207.334DD21848@mail.kernel.org>
In-Reply-To: <20191108184207.334DD21848@mail.kernel.org>
From:   Rob Clark <robdclark@chromium.org>
Date:   Fri, 8 Nov 2019 11:40:53 -0800
Message-ID: <CAJs_Fx6KCirGMtQxE=xA-A=bd5LeuYWviee0+KqO5OtGT9GKEw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>
Content-Type: multipart/mixed; boundary="00000000000060dee60596daf6fb"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--00000000000060dee60596daf6fb
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 8, 2019 at 10:42 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Rob Clark (2019-11-08 08:54:23)
> > On Thu, Nov 7, 2019 at 10:35 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Rob Clark (2019-11-07 18:06:19)
> > > > On Thu, Nov 7, 2019 at 1:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > >
> > > > >
> > > > > NULL is a valid clk pointer returned by clk_get(). What is the display
> > > > > driver doing that makes it consider NULL an error?
> > > > >
> > > >
> > > > do we not have an iface clk?  I think the driver assumes we should
> > > > have one, rather than it being an optional thing.. we could ofc change
> > > > that
> > >
> > > I think some sort of AHB clk is always enabled so the plan is to just
> > > hand back NULL to the caller when they call clk_get() on it and nobody
> > > should be the wiser when calling clk APIs with a NULL iface clk. The
> > > common clk APIs typically just return 0 and move along. Of course, we'll
> > > also turn the clk on in the clk driver so that hardware can function
> > > properly, but we don't need to expose it as a clk object and all that
> > > stuff if we're literally just slamming a bit somewhere and never looking
> > > back.
> > >
> > > But it sounds like we can't return NULL for this clk for some reason? I
> > > haven't tried to track it down yet but I think Matthias has found it
> > > causes some sort of problem in the display driver.
> > >
> >
> > ok, I guess we can change the dpu code to allow NULL..  but what would
> > the return be, for example on a different SoC where we do have an
> > iface clk, but the clk driver isn't enabled?  Would that also return
> > NULL?  I guess it would be nice to differentiate between those cases..
> >
>
> So the scenario is DT describes the clk
>
>  dpu_node {
>      clocks = <&cc AHB_CLK>;
>      clock-names = "iface";
>  }
>
> but the &cc node has a driver that doesn't probe?
>
> I believe in this scenario we return -EPROBE_DEFER because we assume we
> should wait for the clk driver to probe and provide the iface clk. See
> of_clk_get_hw_from_clkspec() and how it looks through a list of clk
> providers and tries to match the &cc phandle to some provider.
>
> Once the driver probes, the match will happen and we'll be able to look
> up the clk in the provider with __of_clk_get_hw_from_provider(). If
> the clk provider decides that there isn't a clk object, it will return
> NULL and then eventually clk_hw_create_clk() will turn the NULL return
> value into a NULL pointer to return from clk_get().
>

ok, that was the scenario I was worried about (since unclk'd register
access tends to be insta-reboot and hard to debug)..  so I think it
should be ok to make dpu just ignore NULL clks.

From a quick look, I think something like the attached (untested).
(Sorry, I'd just paste it inline but gmail somehow eats all the
whitespace when I do that :-/)

--00000000000060dee60596daf6fb
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-msm-dpu-ignore-NULL-clocks.patch"
Content-Disposition: attachment; 
	filename="0001-drm-msm-dpu-ignore-NULL-clocks.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k2qjo8of0>
X-Attachment-Id: f_k2qjo8of0

RnJvbSAwYTMxYWRiNTk5NGQ1ZGY0YzMzOTM2ODdiNGM2MDg0MDA1NTAyMjQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+CkRh
dGU6IEZyaSwgOCBOb3YgMjAxOSAxMTozODo0NiAtMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGRybS9t
c20vZHB1OiBpZ25vcmUgTlVMTCBjbG9ja3MKClRoaXMgaXNuJ3QgYW4gZXJyb3IuICBBbHNvIHRo
ZSBjbGsgQVBJcyBoYW5kbGUgdGhlIE5VTEwgY2FzZSwgc28gd2UgY2FuCmp1c3QgZGVsZXRlIHRo
ZSBjaGVjay4KCkNoYW5nZS1JZDogSWIyNzI1YTQ0YTBhYjA3MGU0NGUwYzNkYTVlYWM5MTg5OTky
YTQ1MTcKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9pb191dGlsLmMgfCAyNiArKysr
KystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDE5IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9pb191dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5j
CmluZGV4IDI3ZmJlYjUwNDM2Mi4uZWMxNDM3YjBlZjc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9pb191dGlsLmMKQEAgLTkzLDE5ICs5MywxMiBAQCBpbnQgbXNtX2Rz
c19lbmFibGVfY2xrKHN0cnVjdCBkc3NfY2xrICpjbGtfYXJyeSwgaW50IG51bV9jbGssIGludCBl
bmFibGUpCiAJCQlERVZfREJHKCIlcFMtPiVzOiBlbmFibGUgJyVzJ1xuIiwKIAkJCQlfX2J1aWx0
aW5fcmV0dXJuX2FkZHJlc3MoMCksIF9fZnVuY19fLAogCQkJCWNsa19hcnJ5W2ldLmNsa19uYW1l
KTsKLQkJCWlmIChjbGtfYXJyeVtpXS5jbGspIHsKLQkJCQlyYyA9IGNsa19wcmVwYXJlX2VuYWJs
ZShjbGtfYXJyeVtpXS5jbGspOwotCQkJCWlmIChyYykKLQkJCQkJREVWX0VSUigiJXBTLT4lczog
JXMgZW4gZmFpbC4gcmM9JWRcbiIsCi0JCQkJCQlfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCks
Ci0JCQkJCQlfX2Z1bmNfXywKLQkJCQkJCWNsa19hcnJ5W2ldLmNsa19uYW1lLCByYyk7Ci0JCQl9
IGVsc2UgewotCQkJCURFVl9FUlIoIiVwUy0+JXM6ICclcycgaXMgbm90IGF2YWlsYWJsZVxuIiwK
LQkJCQkJX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLCBfX2Z1bmNfXywKLQkJCQkJY2xrX2Fy
cnlbaV0uY2xrX25hbWUpOwotCQkJCXJjID0gLUVQRVJNOwotCQkJfQorCQkJcmMgPSBjbGtfcHJl
cGFyZV9lbmFibGUoY2xrX2FycnlbaV0uY2xrKTsKKwkJCWlmIChyYykKKwkJCQlERVZfRVJSKCIl
cFMtPiVzOiAlcyBlbiBmYWlsLiByYz0lZFxuIiwKKwkJCQkJX19idWlsdGluX3JldHVybl9hZGRy
ZXNzKDApLAorCQkJCQlfX2Z1bmNfXywKKwkJCQkJY2xrX2FycnlbaV0uY2xrX25hbWUsIHJjKTsK
IAogCQkJaWYgKHJjICYmIGkpIHsKIAkJCQltc21fZHNzX2VuYWJsZV9jbGsoJmNsa19hcnJ5W2kg
LSAxXSwKQEAgLTExOSwxMiArMTEyLDcgQEAgaW50IG1zbV9kc3NfZW5hYmxlX2NsayhzdHJ1Y3Qg
ZHNzX2NsayAqY2xrX2FycnksIGludCBudW1fY2xrLCBpbnQgZW5hYmxlKQogCQkJCV9fYnVpbHRp
bl9yZXR1cm5fYWRkcmVzcygwKSwgX19mdW5jX18sCiAJCQkJY2xrX2FycnlbaV0uY2xrX25hbWUp
OwogCi0JCQlpZiAoY2xrX2FycnlbaV0uY2xrKQotCQkJCWNsa19kaXNhYmxlX3VucHJlcGFyZShj
bGtfYXJyeVtpXS5jbGspOwotCQkJZWxzZQotCQkJCURFVl9FUlIoIiVwUy0+JXM6ICclcycgaXMg
bm90IGF2YWlsYWJsZVxuIiwKLQkJCQkJX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLCBfX2Z1
bmNfXywKLQkJCQkJY2xrX2FycnlbaV0uY2xrX25hbWUpOworCQkJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGNsa19hcnJ5W2ldLmNsayk7CiAJCX0KIAl9CiAKLS0gCjIuMjQuMC40MzIuZzlkM2Y1ZjVi
NjMtZ29vZwoK
--00000000000060dee60596daf6fb--
