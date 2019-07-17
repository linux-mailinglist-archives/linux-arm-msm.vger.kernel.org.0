Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0476C1FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2019 22:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfGQUN2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jul 2019 16:13:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:54636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbfGQUN2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jul 2019 16:13:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DCEB520880;
        Wed, 17 Jul 2019 20:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563394407;
        bh=OESj9GZ0OXpMmohEHzH7DGk0qr7u6wuJQJQ0LuliQSw=;
        h=In-Reply-To:References:Subject:To:From:Date:From;
        b=VTLrt/Wddbda5e3atGarJZ1accoS0idhs5NItQk1iNdWwq0YssGxK6d6eXhh5gv0T
         UiQr3SqihUMvQ6C/dzqRZLNB4z4upkfdpfvkYKcRaD+Vql/wL7TYAyEE2P1WcwtCwV
         CKIVjQyCKC22t1MdKTmScv1kvCpK3FZdHfsbyWrg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1562859668-14209-13-git-send-email-gokulsri@codeaurora.org>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org> <1562859668-14209-13-git-send-email-gokulsri@codeaurora.org>
Subject: Re: [PATCH 12/12] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        gokulsri@codeaurora.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 17 Jul 2019 13:13:26 -0700
Message-Id: <20190717201326.DCEB520880@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Gokul Sriram Palanisamy (2019-07-11 08:41:08)
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/=
qcom/ipq8074.dtsi
> index 6a61a63..c24e3f6 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -10,6 +10,22 @@
>         model =3D "Qualcomm Technologies, Inc. IPQ8074";
>         compatible =3D "qcom,ipq8074";
> =20
> +       reserved-memory {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +
> +               smem_region:smem@4ab00000 {

Put a space between the colon and the node name. Also, just call it
memory@4ab00000.

		smem_region: memory@4ab00000 {

> +                       no-map;
> +                       reg =3D <0x0 0x4ab00000 0x0 0x00100000>;
> +               };
> +
> +               q6_region: q6@4b000000 {

memory@

> +                       no-map;
> +                       reg =3D <0x0 0x4b000000 0x0 0x05f00000>;
> +               };
> +       };
> +
>         firmware {
>                 scm {
>                         compatible =3D "qcom,scm-ipq8074", "qcom,scm";
> @@ -431,6 +447,115 @@
>                                       "axi_m_sticky";
>                         status =3D "disabled";
>                 };
> +               apcs: syscon@b111000 {

Add a newline between nodes please.

> +                       compatible =3D "syscon";
> +                       reg =3D <0x0B111000 0x1000>;
> +               };
> +
> +               wcss: smp2p-wcss {

This node should be outside the soc node because it doesn't have a reg
property

> +                       compatible =3D "qcom,smp2p";
> +                       qcom,smem =3D <435>, <428>;
> +
> +                       interrupt-parent =3D <&intc>;
> +                       interrupts =3D <0 322 1>;
> +
> +                       qcom,ipc =3D <&apcs 8 9>;
> +
> +                       qcom,local-pid =3D <0>;
> +                       qcom,remote-pid =3D <1>;
> +
> +                       wcss_smp2p_out: master-kernel {
> +                               qcom,entry-name =3D "master-kernel";
> +                               qcom,smp2p-feature-ssr-ack;
> +                               #qcom,smem-state-cells =3D <1>;
> +                       };
> +
> +                       wcss_smp2p_in: slave-kernel {
> +                               qcom,entry-name =3D "slave-kernel";
> +
> +                               interrupt-controller;
> +                               #interrupt-cells =3D <2>;
> +                       };
> +               };
> +
> +               tcsr_q6_block: syscon@1945000 {

Do you really need _block in these aliases?

> +                       compatible =3D "syscon";
> +                       reg =3D <0x1945000 0xE000>;
> +               };
> +
> +               tcsr_mutex_block: syscon@193d000 {
> +                       compatible =3D "syscon";
> +                       reg =3D <0x1905000 0x8000>;
> +               };
> +
> +               tcsr_mutex: hwlock@193d000 {
> +                       compatible =3D "qcom,tcsr-mutex";
> +                       syscon =3D <&tcsr_mutex_block 0 0x80>;
> +                       #hwlock-cells =3D <1>;
> +               };
> +
> +               smem: qcom,smem@4AB00000 {

lowercase please. And just 'smem' I guess.

> +                       compatible =3D "qcom,smem";
> +                       memory-region =3D <&smem_region>;
> +                       hwlocks =3D <&tcsr_mutex 0>;
> +               };
> +
> +               apcs_glb: mailbox@b111000 {
> +                       compatible =3D "qcom,ipq8074-apcs-apps-global";
> +                       reg =3D <0xb111000 0x1000>;

These addresses should be padded out to 8 digits for the address part
(not the size).

> +
> +                       #mbox-cells =3D <1>;
> +               };
> +
> +               q6v5_wcss: q6v5_wcss@CD00000 {

lowercase.

> +                       compatible =3D "qcom,ipq8074-wcss-pil";
> +                       reg =3D <0xCD00000 0x4040>,
> +                             <0x4AB000 0x20>;
