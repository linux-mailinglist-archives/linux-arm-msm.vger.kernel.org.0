Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B64C10103B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 01:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbfKSAbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 19:31:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:47966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726809AbfKSAbQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 19:31:16 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CDEC32230B;
        Tue, 19 Nov 2019 00:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574123475;
        bh=Ciy+kavBN/3k3GU7N2RPeMh5M4yUnt7elR8oPK5rWCk=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=XBAe0DFD0avUmgQd/cvE1pSQcMzRdMviXvRIh4xAGoF+3/ebdIU/YK7JNg1ibtH+P
         StLwDFioB4HPWVxAG3Zo4FWiry1EVo8FiOXJNNwUJnq+qJnrrWTwY6hEvAM6ot0ZhD
         b8iZJsUfc8W51+s1Qi3irRfsiszX4nwXXVmj+mUA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e7f30995e-3b0444eb-598a-4af3-9ea2-6ae0e4cbdf0f-000000@us-west-2.amazonses.com>
References: <20191118154435.20357-1-sibis@codeaurora.org> <0101016e7f30995e-3b0444eb-598a-4af3-9ea2-6ae0e4cbdf0f-000000@us-west-2.amazonses.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        saravanak@google.com, viresh.kumar@linaro.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, georgi.djakov@linaro.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: Add OSM L3 DT bindings
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 18 Nov 2019 16:31:14 -0800
Message-Id: <20191119003115.CDEC32230B@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2019-11-18 07:45:21)
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.y=
aml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> new file mode 100644
> index 0000000000000..fec8289ceeeed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> @@ -0,0 +1,56 @@
> +examples:
> +  - |
> +    osm_l3: interconnect@17d41000 {
> +      compatible =3D "qcom,sdm845-osm-l3";
> +      reg =3D <0x17d41000 0x1400>;
> +
> +      clocks =3D <&rpmhcc 0>, <&gcc 165>;

Can you use #define names here? That would make it clearer what sort of
clk is expected here.

> +      clock-names =3D "xo", "alternate";
> +
> +      #interconnect-cells =3D <1>;
> +    };
