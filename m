Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB21125ACE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 06:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbfLSFcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 00:32:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:46078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfLSFcq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 00:32:46 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88D3A222C2;
        Thu, 19 Dec 2019 05:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576733564;
        bh=3TqDyq33bDOA1DBAAdKO4OY8wnBgiYZgW9/buyRHLqc=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=PcpMTHNRau9NZL1ZlOqBXpdNprIkeT+kV7OT+iz0x+RJP2h9jWZkg8d/Ht+9GNZj+
         UiO1w/+mRpxc2YSTdgWcO+6kWc8/wdbw+wjqaQlFhizz8oo1FVpNDlOM3twBK4b2cx
         7z3B5lV256lAwcJJQ5d76sOQLf/9V/gCQhEsgZsY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016eab0a4e76-b8eb44c5-d076-46b9-a156-b80dc650ca31-000000@us-west-2.amazonses.com>
References: <1573812304-24074-1-git-send-email-tdas@codeaurora.org> <1573812304-24074-4-git-send-email-tdas@codeaurora.org> <CAOCk7NqfHe6jRPmw6o650fyd6EyVfFObHhJ9=21ipuAqJo6oGA@mail.gmail.com> <20191126181154.275EA20727@mail.kernel.org> <0101016eab0a4e76-b8eb44c5-d076-46b9-a156-b80dc650ca31-000000@us-west-2.amazonses.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 21:32:43 -0800
Message-Id: <20191219053244.88D3A222C2@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-11-26 20:06:49)
>=20
>=20
> On 11/26/2019 11:41 PM, Stephen Boyd wrote:
> > Quoting Jeffrey Hugo (2019-11-15 07:11:01)
> >> On Fri, Nov 15, 2019 at 3:07 AM Taniya Das <tdas@codeaurora.org> wrote:
> >>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml =
b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> >>> new file mode 100644
> >>> index 0000000..c2d6243
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> >>> +      - description: GPLL0 source from GCC
> >>
> >> This is not an accurate conversion.  GPLL0 was not valid for 845, and
> >> is required for 8998.
> >=20
> > Thanks for checking Jeff.
> >=20
> > It looks like on 845 there are two gpll0 clocks going to gpucc. From
> > gpu_cc_parent_map_0:
> >=20
> >       "gcc_gpu_gpll0_clk_src",
> >       "gcc_gpu_gpll0_div_clk_src",
> >=20
>=20
> There are branches of GPLL0 which would be connected to most external=20
> CCs. It is upto to the external CCs to either use them to source a=20
> frequency or not.

Yes, they can decide to use them or not, but they really do go to the
CCs so the DT should describe that.

