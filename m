Return-Path: <linux-arm-msm+bounces-43214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2249FBBC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43A3F1886B1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 09:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415741D5ADD;
	Tue, 24 Dec 2024 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EhVfKHnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD41CDFC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735033789; cv=none; b=KodPrLzwdasukl0WtSJNNSl4z1vVwMR4Nb8KtwZJy89SmGE3s7kUPePehBar40Z/oE5lWS6tBzB8MhFw/efgh8wXxqPTOZxiGT8g56BNZeG8ExzsCg/qSmsicWJc1v4B7aleNUdWVnCUr6QezJ3rm0pQl28z9bJcfGIW+PTvNd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735033789; c=relaxed/simple;
	bh=kI77AgfCkxta8sqjYj4smSrKxA8ljbXtR3pGAWoKRV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2DAR67LYlFMgLDD7r5hbFEoDotpzuVqZx2MrdhPuxzvgHhuPPF5aaOuJUChLLn4jzFJYqztSNB9Z914lWo9H4NmGlhK3Aj+TZo0YpScP/BfOOxU9hhmgTsUJyOm0dnqnN3cJefE5d6HHDWq1VLel6c+6KgvPRCFVQtwyAecwNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EhVfKHnQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54021daa6cbso5201224e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 01:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735033786; x=1735638586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sVuShdIMfEAjM33wYIJADhLf//8nBxQDaRVug33yi48=;
        b=EhVfKHnQS90Yl8ADvei9fd11iRGO5lMSnEPgJjSihFGy7YH3/Zp6q1tM2TnnlS6PD5
         LbBuwLhQ8cw9rkxb58z/pZhP42QExn2DLO/85yF/pQBOsaZVE/mDoEv+D0oUer48wQm4
         BKt40VyHHKKkTPvBZ0ihSL2NHt7OFWTWVFBKLIRmGGMkRAsvWBbO3jocGaIBzzTQs0wi
         m5pb/nHT8lBIP19evjzt0sdIzy5+AjLKmUXtLnsH2s475CcgxQO29yAGfdGNvN4CqOIW
         aXFeBb5bY+uiLfmtxfcf7t+GQiSWkW9A6JnKbaPpD6ii8lLyUEgnrpmk/G0gVtyNo8Ss
         i+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735033786; x=1735638586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVuShdIMfEAjM33wYIJADhLf//8nBxQDaRVug33yi48=;
        b=hG20Lgk4ebYwRI7aAlFwGbA4AQaE3pfB4QqFIaAjQUUbq5cJFLtBmc5SkcymQJ/sdh
         UOrAXRRPVxqxB2HRsur6/pbk/b99KfwdbihnpgWV4f5j1bEtRy4OjjjxkT6qWz+cAOM+
         Raa/1IJpehkfBCVNWTpjC+W9kDq5pWzI+YQMqto5WdNU7jL6Lcblwi+3fpZyYym+b6O1
         kJS6E+AWlXv/5B0SoE/2SojVBACzBhBewfNjaIPTL+IhiJU+fJRyMWapCVa9vYtwWoDm
         qs4tOudVb+hETfyo68RqQmBommS394+AeFSm2cAm73YURK+b1rN6nZJWJm13FbFr5leq
         pFBw==
X-Forwarded-Encrypted: i=1; AJvYcCWMRJzRQbRBdpUne3HZjGd9G6t0wLkGSiTrF0NkAvBqShv4UHxR8C+FjO7a+xG8baDCdxOssg2wd6vfx089@vger.kernel.org
X-Gm-Message-State: AOJu0YwConiNYLw4VC44AUUtlncTU9BOZOqOfHfaRnNwLaozziVHT762
	gO0DwlQTzduejaHVFQf8wr3ngnoR/ql/JH2BlY7yU6KTJfvII4t+HEJ/QUfUsVs=
X-Gm-Gg: ASbGncvo16H1+WKH5J1ai42BRtQ9zH9JyAiSdoJZTRLORV3tF3usBCOnAw1+u4C1RYn
	8ZmCKTTX3HimiQ4CQNvFUkBDhr62XKRfjbn50KzHxuclsd4JoJ+jQtPgkiIv0S9ylWnuU6eLzO9
	eNXUuGPyUx0laZAqPxiHbHP3fY0aEPu6ColjxLBFSh/9v6znryQ6XJuS3KttytWbQEzdDgqLIsu
	tMwphM8tAHJxuM0PWZq0P53il3sNIY2EeziA8i73ou5YUU+WD1PZw1d4ZcNNqF0c4Qz1vT6vPmL
	KsATAmTv+M9yzOvx8thcbdA+1m19K94IfelE
X-Google-Smtp-Source: AGHT+IH6V63ifgFbeKKwFBanAOF+dLPaHF+vbsXp2IGkepUBk14/VeJ9ijK7K6Xb3Fp2iR6lKVWOIw==
X-Received: by 2002:a05:6512:104c:b0:541:1c48:8bf6 with SMTP id 2adb3069b0e04-5422956c531mr4824990e87.53.1735033785618;
        Tue, 24 Dec 2024 01:49:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238137f0sm1539369e87.164.2024.12.24.01.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 01:49:44 -0800 (PST)
Date: Tue, 24 Dec 2024 11:49:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, andersson@kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: PCI: Add binding for qps615
Message-ID: <eysqoiiizunkjxqyvfaxbx4szwnz4osv42j7xr247irnthifwu@nhxytsl4brvu>
References: <20241204212559.GA3007963@bhelgaas>
 <3d37e1b2-a658-5de9-c575-6baf9cdaa40f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d37e1b2-a658-5de9-c575-6baf9cdaa40f@quicinc.com>

On Tue, Dec 24, 2024 at 02:41:10PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 12/5/2024 2:55 AM, Bjorn Helgaas wrote:
> > On Tue, Nov 12, 2024 at 08:31:33PM +0530, Krishna chaitanya chundru wrote:
> > > Add binding describing the Qualcomm PCIe switch, QPS615,
> > > which provides Ethernet MAC integrated to the 3rd downstream port
> > > and two downstream PCIe ports.
> > 
> > > +$defs:
> > > +  qps615-node:
> > > +    type: object
> > > +
> > > +    properties:
> > > +      qcom,l0s-entry-delay-ns:
> > > +        description: Aspm l0s entry delay.
> > > +
> > > +      qcom,l1-entry-delay-ns:
> > > +        description: Aspm l1 entry delay.
> > 
> > To match spec usage:
> > s/Aspm/ASPM/
> > s/l0s/L0s/
> > s/l1/L1/
> > 
> > Other than the fact that qps615 needs the driver to configure these,
> > there's nothing qcom-specific here, so I suggest the names should omit
> > "qcom" and include "aspm".
> > 
> > > +    pcie {
> > > +        #address-cells = <3>;
> > > +        #size-cells = <2>;
> > > +
> > > +        pcie@0 {
> > > +            device_type = "pci";
> > > +            reg = <0x0 0x0 0x0 0x0 0x0>;
> > > +
> > > +            #address-cells = <3>;
> > > +            #size-cells = <2>;
> > > +            ranges;
> > > +            bus-range = <0x01 0xff>;
> > > +
> > > +            pcie@0,0 {
> > > +                compatible = "pci1179,0623";
> > > +                reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > +                device_type = "pci";
> > > +                #address-cells = <3>;
> > > +                #size-cells = <2>;
> > > +                ranges;
> > > +                bus-range = <0x02 0xff>;
> > 
> > This binding describes a switch.  I don't think bus-range should
> > appear here at all because it is not a feature of the hardware (unless
> > the switch ports are broken and their Secondary/Subordinate Bus
> > Numbers are hard-wired).
> > 
> > The Primary/Secondary/Subordinate Bus Numbers of all switch ports
> > should be writable and the PCI core knows how to manage them.
> > 
> Bjorn,
> 
> The dt binding check is throwing an error if we don't keep bus-range
> property for that reason we added it, from dt binding perspective i think it
> is mandatory to add this property.

Could you please provide an error message? I don't see any of the PCIe
bindingins declaring bus-range as mandatory. I might be missing it
though.

> 
> - Krishna Chaitanya.
> > Bjorn

-- 
With best wishes
Dmitry

