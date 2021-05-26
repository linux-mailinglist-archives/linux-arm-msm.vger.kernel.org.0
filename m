Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD1E3922BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 00:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234467AbhEZWdx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 18:33:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:51316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234440AbhEZWdw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 18:33:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A30D3613D2;
        Wed, 26 May 2021 22:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622068340;
        bh=xwNSfapbBNFnmlQ74xn76XUJZwmoy9By2PMjUjDn4kc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iCJK0HzKnHCXkz5rwjBBUmp2kAL7u15XbB4iQUJdiIHBlEGV91BIb9ntCxFjUxkgl
         fr6LoKsS+HcD4SMmtwIsoJW5nuYThwuMEOcZGkog/vDiKZ+Mv89Uu0G4JEzaON+niY
         wdsy3sjmkX+gXIpyIB6VvnVvVsu4kEqE/PaKYV/cORLkvnh7Q0LNC8wXZSvqXNMNXf
         hLgjjAn/DLMJviaeM5v+Y4HlHpQYjySK/2TmIhloPEDnf99j98ZzlzXY8uWYGjn0KI
         qtvnOay9FbT/3UFcwHFky7T6Qz/nftbH8PcuooD5YevcC8npZHSSTeceHaE2rExaOZ
         zM/2PaYGIgxXA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dc4539a6-4a8b-91bc-791b-846ab0182a8f@somainline.org>
References: <20210220155618.176559-1-konrad.dybcio@somainline.org> <20210220155618.176559-5-konrad.dybcio@somainline.org> <161404077336.1254594.15002572465360321874@swboyd.mtv.corp.google.com> <3917fba4-e5b0-911f-9220-f401a90aac38@somainline.org> <161724198675.2260335.14358880292682931985@swboyd.mtv.corp.google.com> <abc821cc-ef43-3241-793a-cc4c85b72563@somainline.org> <dc4539a6-4a8b-91bc-791b-846ab0182a8f@somainline.org>
Subject: Re: [PATCH 5/6] clk: qcom: gcc-sdm660: Account for needed adjustments in probe function
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Wed, 26 May 2021 15:32:19 -0700
Message-ID: <162206833939.4130789.17552236719284643931@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-05-26 12:11:13)
> Hi,
>=20
>=20
> I am aware that the comments I left are highly controversial and a bit em=
otional, but I'd still like to get a response. It's been almost two months =
and I have phones on the desk waiting for things to be merged, so that I ca=
n develop more things.
>=20
>=20
> P.S. I still stand by my stance that the more info we can get about what'=
s going on in the black boxes that we are not allowed to get docs for, the =
better for us, developers.
>=20

I marked this patch as "changes requested". Please make the changes
requested.
