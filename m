Return-Path: <linux-arm-msm+bounces-3419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3910804B74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 08:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A857028100F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 07:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A7C2EAF3;
	Tue,  5 Dec 2023 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aMt0c9fP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC488CB
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 23:51:07 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a1b68ae40efso257157066b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 23:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701762666; x=1702367466; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyuJyxUi/Di3ImMftt85DOYwPWljWaiyyMsVFy/09DE=;
        b=aMt0c9fPfP8qqAIN9CfLZgG9ylV0LZhFN11LbzoPd1TLgc+C0dZzdub5qgfAjuzQl1
         t3t4HTZHtOrvVO7hsjrQnXfLES6Obx9ULohP0o5XucMSRDpto+Nagaq+1m/xCFZP7i/c
         fgF9+TYa+t9e/w/CZeKMlqSMZE0424HIs+tr7MyWWtYxfYLun50upedPMa7Nf5UgB/gD
         himKFPpghY7ZyKGj8QQ4HWVxOid3WrpXWdheICYQMcadOcbf2Ldkl2iCsedqCWfJhXoj
         2RjiYoMQqm/wc7uWuRbxDBJXUmbkp8FEDQcZvaV4sKbEP3EhkIxR4zcW5LmJ0sc2VPj1
         T+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701762666; x=1702367466;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HyuJyxUi/Di3ImMftt85DOYwPWljWaiyyMsVFy/09DE=;
        b=iV58+qoMbVRToBI46n8PfYa9r2v2GwB7dBJRLLgEzi2mXc5WMHNgNiHa7JIHKwn3Pm
         XOU0VQ3C2c+3miMeh4weNZOBnpIV79a01kU99ByK3m7o3cRIY/U+NisRawbq+t1PbpxW
         dWGA22Zd7BD98qR8WTV+TCUP2cWUXei4yuztKRHu7Ic74/xYCWb9Lior7E7Edb/MWWT8
         pbUbJjdQwY0xEsrsH7XKwF51AXSW88YYVLLAIf28HNxkMXEMAQm7kXuLpgRd26LZLwF4
         HJt0Xlm/28WcMDi1+bcg9yWR9EY8Vh6aOFzuy7dZI3ZE2mylg9zIJPWeSuR0FDW/2Efc
         lZJw==
X-Gm-Message-State: AOJu0Ywp8BW9DWRYnXEeW4tAh+bjnEMfYOsijExtO2mRhe4lZx6mUBI1
	bPo0SFM4YNcmnKU+6f0l1Y5wGA==
X-Google-Smtp-Source: AGHT+IHw20d12kH/ta2Dik5X+CSFd/UQj8q5dFtrpvVTRqBYOC+dwW0hwx9QKF+FyY9N8PbWouG3Gw==
X-Received: by 2002:a17:907:1003:b0:a19:736f:fa25 with SMTP id ox3-20020a170907100300b00a19736ffa25mr3792405ejb.46.1701762666286;
        Mon, 04 Dec 2023 23:51:06 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id lr25-20020a170906fb9900b00a19a073e946sm5259853ejb.124.2023.12.04.23.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 23:51:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Dec 2023 08:51:05 +0100
Message-Id: <CXG8INYXCEXN.C6TF6FALDP6D@fairphone.com>
Cc: "Nitin Rawat" <quic_nitirawa@quicinc.com>, "Andy Gross"
 <agross@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Avri Altman" <avri.altman@wdc.com>, "Bart Van
 Assche" <bvanassche@acm.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: sc7280: Add UFS nodes for
 sc7280 soc
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Manivannan Sadhasivam" <mani@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231204-sc7280-ufs-v5-0-926ceed550da@fairphone.com>
 <20231204-sc7280-ufs-v5-2-926ceed550da@fairphone.com>
 <621388b9-dcee-4af2-9763-e5d623d722b7@quicinc.com>
 <CXFJNBNKTRHH.2CS6TO2MEGJWL@fairphone.com>
 <20231204172829.GA69580@thinkpad>
In-Reply-To: <20231204172829.GA69580@thinkpad>

On Mon Dec 4, 2023 at 6:28 PM CET, Manivannan Sadhasivam wrote:
> On Mon, Dec 04, 2023 at 01:21:42PM +0100, Luca Weiss wrote:
> > On Mon Dec 4, 2023 at 1:15 PM CET, Nitin Rawat wrote:
> > >
> > >
> > > On 12/4/2023 3:54 PM, Luca Weiss wrote:
> > > > From: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > >=20
> > > > Add UFS host controller and PHY nodes for sc7280 soc.
> > > >=20
> > > > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > > Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org> # QCM6490 FP5
> > > > [luca: various cleanups and additions as written in the cover lette=
r]
> > > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/sc7280.dtsi | 74 +++++++++++++++++++++++=
++++++++++++-
> > > >   1 file changed, 73 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot=
/dts/qcom/sc7280.dtsi
> > > > index 04bf85b0399a..8b08569f2191 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > > @@ -15,6 +15,7 @@
> > > >   #include <dt-bindings/dma/qcom-gpi.h>
> > > >   #include <dt-bindings/firmware/qcom,scm.h>
> > > >   #include <dt-bindings/gpio/gpio.h>
> > > > +#include <dt-bindings/interconnect/qcom,icc.h>
> > > >   #include <dt-bindings/interconnect/qcom,osm-l3.h>
> > > >   #include <dt-bindings/interconnect/qcom,sc7280.h>
> > > >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > @@ -906,7 +907,7 @@ gcc: clock-controller@100000 {
> > > >   			clocks =3D <&rpmhcc RPMH_CXO_CLK>,
> > > >   				 <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
> > > >   				 <0>, <&pcie1_phy>,
> > > > -				 <0>, <0>, <0>,
> > > > +				 <&ufs_mem_phy 0>, <&ufs_mem_phy 1>, <&ufs_mem_phy 2>,
> > > >   				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
> > > >   			clock-names =3D "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
> > > >   				      "pcie_0_pipe_clk", "pcie_1_pipe_clk",
> > > > @@ -2238,6 +2239,77 @@ pcie1_phy: phy@1c0e000 {
> > > >   			status =3D "disabled";
> > > >   		};
> > > >  =20
> > > > +		ufs_mem_hc: ufs@1d84000 {
> > > > +			compatible =3D "qcom,sc7280-ufshc", "qcom,ufshc",
> > > > +				     "jedec,ufs-2.0";
> > > > +			reg =3D <0x0 0x01d84000 0x0 0x3000>;
> > > > +			interrupts =3D <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			phys =3D <&ufs_mem_phy>;
> > > > +			phy-names =3D "ufsphy";
> > > > +			lanes-per-direction =3D <2>;
> > > > +			#reset-cells =3D <1>;
> > > > +			resets =3D <&gcc GCC_UFS_PHY_BCR>;
> > > > +			reset-names =3D "rst";
> > > > +
> > > > +			power-domains =3D <&gcc GCC_UFS_PHY_GDSC>;
> > > > +			required-opps =3D <&rpmhpd_opp_nom>;
> > > > +
> > > > +			iommus =3D <&apps_smmu 0x80 0x0>;
> > > > +			dma-coherent;
> > > > +
> > > > +			interconnects =3D <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWA=
YS
> > > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > > > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > > > +					 &cnoc2 SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> > > > +			interconnect-names =3D "ufs-ddr", "cpu-ufs";
> > > > +
> > > > +			clocks =3D <&gcc GCC_UFS_PHY_AXI_CLK>,
> > > > +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> > > > +				 <&rpmhcc RPMH_CXO_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> > > > +			clock-names =3D "core_clk",
> > > > +				      "bus_aggr_clk",
> > > > +				      "iface_clk",
> > > > +				      "core_clk_unipro",
> > > > +				      "ref_clk",
> > > > +				      "tx_lane0_sync_clk",
> > > > +				      "rx_lane0_sync_clk",
> > > > +				      "rx_lane1_sync_clk";
> > > > +			freq-table-hz =3D
> > > > +				<75000000 300000000>,
> > > > +				<0 0>,
> > > > +				<0 0>,
> > > > +				<75000000 300000000>,
> > > > +				<0 0>,
> > > > +				<0 0>,
> > > > +				<0 0>,
> > > > +				<0 0>;
> > > > +			status =3D "disabled";
> > > > +		};
> > > > +
> > > > +		ufs_mem_phy: phy@1d87000 {
> > > > +			compatible =3D "qcom,sc7280-qmp-ufs-phy";
> > > > +			reg =3D <0x0 0x01d87000 0x0 0xe00>;
> > > > +			clocks =3D <&rpmhcc RPMH_CXO_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> > > > +				 <&gcc GCC_UFS_1_CLKREF_EN>;
> > > > +			clock-names =3D "ref", "ref_aux", "qref";
> > > > +
> > > > +			power-domains =3D <&gcc GCC_UFS_PHY_GDSC>;
> >=20
> > Hi Nitin,
> >=20
> > >
> > > GCC_UFS_PHY_GDSC is UFS controller GDSC. For sc7280 Phy we don't need=
 this.
> >=20
> > In the current dt-bindings the power-domains property is required.
> >=20
> > Is there another power-domain for the PHY to use, or do we need to
> > adjust the bindings to not require power-domains property for ufs phy o=
n
> > sc7280?
> >=20
>
> PHYs are backed by MX power domain. So you should use that.

Sounds reasonable (though I understand little how the SoC is wired up
internally).

>
> > Also, with "PHY" in the name, it's interesting that this is not for the
> > phy ;)
> >=20
>
> Yes, confusing indeed. But the controllers (PCIe, UFS, USB etc...) are ba=
cked by
> GDSCs and all the analog components (PHYs) belong to MX domain since it i=
s kind
> of always ON.
>
> I'll submit a series to fix this for the rest of the SoCs.

Great!

So I'll send v6 with power-domains =3D <&rpmhpd SC7280_MX>; for the phy.

Regards
Luca

>
> - Mani
>
> > Regards
> > Luca
> >=20
> > >
> > > > +
> > > > +			resets =3D <&ufs_mem_hc 0>;
> > > > +			reset-names =3D "ufsphy";
> > > > +
> > > > +			#clock-cells =3D <1>;
> > > > +			#phy-cells =3D <0>;
> > > > +
> > > > +			status =3D "disabled";
> > > > +		};
> > > > +
> > > >   		ipa: ipa@1e40000 {
> > > >   			compatible =3D "qcom,sc7280-ipa";
> > > >  =20
> > > >=20
> >=20


