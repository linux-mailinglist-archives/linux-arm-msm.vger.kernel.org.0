Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC94A20893D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 00:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389159AbgFXWc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 18:32:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:33030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732806AbgFXWc5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 18:32:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BCCC207E8;
        Wed, 24 Jun 2020 22:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593037977;
        bh=re+23lEtejlBL2hZKAV3cnX/dPCJsdHfzCswGg4aOxM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=1t14PuOEhWUKiu8KZmKGnna5WDSKG3rdX2orLMxchl2Cl4eaNr1NeP05Cp+dQd/Nc
         rdlkErZ3YS6jsWYtZNDjj+vGMiWu4ka7lCAEO3IZDGbQwWftkcvi5Y1CvhqwQwsO3/
         6of0YcmCokfaN9zNY9k0UAh1oLasgN8yzYgiQqjM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMS8qEVHxnAwC9fK69Pb4MEMWVEa9N7ZdkQCkXwvqC-JfQEfRA@mail.gmail.com>
References: <20200623230018.303776-1-konradybcio@gmail.com> <CAMS8qEVHxnAwC9fK69Pb4MEMWVEa9N7ZdkQCkXwvqC-JfQEfRA@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: qcom: smd: Add support for MSM8992/4 rpm clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl
Date:   Wed, 24 Jun 2020 15:32:56 -0700
Message-ID: <159303797640.62212.15039388585433005717@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2020-06-24 08:09:18)
> I should also note that for quite some time a hack [1]
> has been needed on some platforms for the RPMCC to register.
>=20
> This includes 8992/94, 8956/76 and possibly many more.
>=20
> With that commit, RPMCC registers fine.
>=20

What happens if that patch isn't applied? Does the system crash? Because
I'd rather not merge a patch in clk tree that causes the system to fail
to boot.
