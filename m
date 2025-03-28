Return-Path: <linux-arm-msm+bounces-52758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7234A7496B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 12:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67E2B7A8D27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 11:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093A021B182;
	Fri, 28 Mar 2025 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aDg9Xopd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1A021ADD4
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162285; cv=none; b=nh9Wa5ngFfFqzV8hZSIPDvWJUSV0VN7+Ctd2Z6/w36AhlqIc+Ws3PixkqraMB2ohMP/eosR4E4SPCbJwO0pHNhJ8ovjOXhci+6QBY6wSv7Hu+2HIGn9FP8lXUjBjHNG8inLT8+DxuTeFwvR0uTExxlfjAcVqx7o2V7zavMMA7pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162285; c=relaxed/simple;
	bh=0eEexOOeT/SY+ca/h/ehqjYRmc5PKPVJnb87Ylg+OO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uwj5dW18cewxzydacM6GnMTYhtLwnJMxbqizwoMf2NAgJDmIdAckWn/3KMfW0xbf68I+DyZ8NKWOi/yt9YlZC4y1/0rdXSDYpVPh+D7JI8SfCaH9MdV7mg+Hef71ry/dGaPqHfuT07a4ygQtqAjg5uxbFtrNyTQV/dJjFiSJpwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aDg9Xopd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224100e9a5cso40665755ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 04:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743162283; x=1743767083; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jTloo0qHYC+ISZzDRD8m8XjFyQar/rHgRYQcIyveKkQ=;
        b=aDg9XopdXsHLr9oQLoRbF4J7P4CLv/IV9zcOkRusum40bxoy7Etz/lGb8xWTfnYdJg
         H16iYc1cTg0rny9SszA6FPkGazFotyfDlStdVI+CjVMiqgmhlxgCnwELps6EyxMMVbBj
         nwPszkVbmfGr6/UDHnkUzIS84Gcl+0D1T+MVRG447J1vLoYPnwA1AVQRdMzpA5TMKRQH
         Y/xKg6DDVHjuCDg9ONW7ojipyeCg3qCCoAtO1YE6Nvm5DSid7q9QlKGEl8fNAK87VBdI
         GwBUwrl8xDm80M8y01zLz83Kd/IHExDMQDChOXrY8EAzk592hNTxCPsZnIiWYFwnRw1c
         /E6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743162283; x=1743767083;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTloo0qHYC+ISZzDRD8m8XjFyQar/rHgRYQcIyveKkQ=;
        b=BvpwNDgsO9s8CTFhPLAR/dAyNSG1wnJlPhhPogzkGh2nd/ZFxacpMGQ7kgJbgHubNF
         /iG/Q/0Rrw5jqheaqU5AYD0j3IlMzfE5MB0J2EPjbLuappLkdZF8dqFqsQ3IadziogeU
         yda1EJxrRCCVKqM3K69Edn5L/nVO4aSTfNZy2H5CDdulhRCi7O9dnB+BZLxZD23f+nWp
         RnTEZYd1c2E1L3wPSVor3ARwOrkmPb5h8d674Onb5dAB7dv4EQu+pTk7gIZuCd0KAeEz
         B5OsIsEzhPP+xNo3wg4LrYSeJpjLs5u/9LgN58HSkNm8A/xLDDlCZ/PlUv3NhCDn1yWT
         rvrg==
X-Forwarded-Encrypted: i=1; AJvYcCWY4YSfx76RmGVlqfCVTA/B8mmLZMjCt3sLx6tzu7UUQgO4tJyCxNS4rRUogrygWILrR80wr+9R/IkNPzKh@vger.kernel.org
X-Gm-Message-State: AOJu0YwCxhfmL8OBjtKpItD4vKLRjDuLbMtHGSixlvbehWkw+eN/9RXm
	gGKLKnEutzFdBHqCMAzcGvZwLPfNi3Iy5VVxX8xbOKCIDRAzdgW0mmIXIogwJA==
X-Gm-Gg: ASbGnctTchWGgBTddagngwREd2IOS2RL2ZdzZ8jLHYUM+N1gmG5LLEOsKIxOUXl0cIo
	7ajF4cTl4FgEcBBgzSySKyCWUrPMzvD3aeBOK2OyrMHMlWCF/FPAE/W5eqvySwMOkyhgOdehv9d
	xAk3Ra7nUG5ZYfTwCdcekJQos3lty17NkSkIh8VUakpog07dLjHnf69yePV+X15voCUdHw0SGtu
	VC94HPNNMwZjJZWV21Mz3N8djFsgdd2YNln/fP6ws1lO8eoYZV5l4alv6Mw8Sg+hDVXCGA5EKVH
	xXyRkRKcu5A9dWPpVLBBfCeLSqJtKu7QI4oofPn/zSQ/yQLBlqdicP0=
X-Google-Smtp-Source: AGHT+IH4cX76e+Kw6r9q701qOqS2ghJcXD4tXbOLq9WjgRCZlZGCIjtUewxEQ6foaU9Rigl+Wt5/4g==
X-Received: by 2002:a05:6a20:160f:b0:1f6:6539:e026 with SMTP id adf61e73a8af0-1fea2d70098mr11659053637.15.1743162283310;
        Fri, 28 Mar 2025 04:44:43 -0700 (PDT)
Received: from thinkpad ([120.60.68.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b69ccb0sm1407036a12.24.2025.03.28.04.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:44:42 -0700 (PDT)
Date: Fri, 28 Mar 2025 17:14:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com, quic_vpernami@quicinc.com, 
	mmareddy@quicinc.com
Subject: Re: [PATCH v5 1/7] arm64: dts: qcom: sc7280: Increase config size to
 256MB for ECAM feature
Message-ID: <h6bnt7ti3yy3welkzqwia7kieunspfqtxf6k46t4j4d5tathls@hra2gbpzazep>
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
 <20250309-ecam_v4-v5-1-8eff4b59790d@oss.qualcomm.com>
 <3332fe69-dddb-439d-884f-2b97845c14e1@oss.qualcomm.com>
 <0cc247a4-d857-4fb1-8f87-0d52d641eced@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cc247a4-d857-4fb1-8f87-0d52d641eced@oss.qualcomm.com>

On Wed, Mar 26, 2025 at 06:56:02PM +0100, Konrad Dybcio wrote:
> On 3/11/25 12:13 PM, Konrad Dybcio wrote:
> > On 3/9/25 6:45 AM, Krishna Chaitanya Chundru wrote:
> >> PCIe ECAM(Enhanced Configuration Access Mechanism) feature requires
> >> maximum of 256MB configuration space.
> >>
> >> To enable this feature increase configuration space size to 256MB. If
> >> the config space is increased, the BAR space needs to be truncated as
> >> it resides in the same location. To avoid the bar space truncation move
> >> config space, DBI, ELBI, iATU to upper PCIe region and use lower PCIe
> >> iregion entirely for BAR region.
> >>
> >> This depends on the commit: '10ba0854c5e6 ("PCI: qcom: Disable mirroring
> >> of DBI and iATU register space in BAR region")'
> >>
> >> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >> ---
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I took a second look - why are dbi and config regions overlapping?
> 

Not just DBI, ELBI too.

> I would imagine the latter to be at a certain offset
> 

The problem is that for ECAM, we need config space region to be big enough to
cover all 256 buses. For that reason Krishna overlapped the config region and
DBI/ELBI. Initially I also questioned this and somehow convinced that there is
no other way (no other memory). But looking at the internal documentation now,
I realized that atleast 512MiB of PCIe space is available for each controller
instance.

So I just quickly tried this series on SA8775p and by moving the config space
after the iATU region, I was able to have ECAM working without overlapping
addresses in DT. Here is the change I did:

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3394ae2d1300..e41c8e3dd30c 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6395,18 +6395,18 @@ arch_timer: timer {
        pcie0: pcie@1c00000 {
                compatible = "qcom,pcie-sa8775p";
                reg = <0x0 0x01c00000 0x0 0x3000>,
-                     <0x0 0x40000000 0x0 0xf20>,
-                     <0x0 0x40000f20 0x0 0xa8>,
-                     <0x0 0x40001000 0x0 0x4000>,
-                     <0x0 0x40100000 0x0 0x100000>,
+                     <0x4 0x00000000 0x0 0xf20>,
+                     <0x4 0x00000f20 0x0 0xa8>,
+                     <0x4 0x10000000 0x0 0x4000>,
+                     <0x4 0x10004000 0x0 0x10000000>,
                      <0x0 0x01c03000 0x0 0x1000>;
                reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
                device_type = "pci";
 
                #address-cells = <3>;
                #size-cells = <2>;
-               ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
-                        <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
+               ranges = <0x01000000 0x0 0x00000000 0x0 0x40000000 0x0 0x100000>,
+                        <0x02000000 0x0 0x40100000 0x0 0x40100000 0x0 0x1ff00000>;
                bus-range = <0x00 0xff>;
 
                dma-coherent;
 

Krishna: Could you also try similar change on SC7280 and see if it works?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

