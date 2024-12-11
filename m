Return-Path: <linux-arm-msm+bounces-41401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 180769EC48B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 07:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E34A2167B63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 06:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37DE1C07F7;
	Wed, 11 Dec 2024 06:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xipfkh1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA778635C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 06:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733896815; cv=none; b=JINmmkpIjzei6hyhtbDnLitgmVWWn/ff8FAviJUwWQ23kWpEgxvnR1x6qY0WCFjM3km7li70nHTx1JyriRPQMpIS6ubp0222xH25SxqfcoTb7A4uBmU5PnVn+2LWkONP0C27kiOaH0qwHO8NLAdA27Ds6gy8hQu96VHpDSKWOpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733896815; c=relaxed/simple;
	bh=O/HUgr1J4WfobxzE8q+ngELR/opzNqY/jg3OvkCE2s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flFbG7WQjztyJ2J8/h+x2AK5R6k0wRBJtVzhmbjhAVyoj0ADOQyNmrN+dtlcwg5qJyHgugagADbyVTxvLF4mCMnmGG/Up5yXiGwePIewu4xLzEZdd0mdEG3EzN6hwMaCJ162qjVkjV3N4E1l0aPdc2yrvVj9GXcuLnnoHbLZmgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xipfkh1P; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-725f2f79ed9so2263092b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 22:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733896813; x=1734501613; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o6D+5UJWf2Pb6ZMQTYtdZG9lwxLVemgiQeSinsEy4PM=;
        b=Xipfkh1PvJuKvPJZA7QDTVaH9AbL+BKKgPGprps+M/GhJuYzBDbulJXXzCdi2MfGAw
         2QP5+r9UJ9YFXPrMs/qaLI8pumzLBFksbTdfYGxePxMDZzaPx7WvTpRXDPn2dVxBNVLZ
         fQqKlhOrMHW3awuIyJ2lmVEFILvo/FrxlR6Zi2iZF+5CGA0SOVjlg89FHcQETRyMgvrx
         gpIlldISzDi0I3f96jFAd66i/W6ozkMBgNW5gEvmCqn1ERQ4D3iyp56ZJv7ISLre7DQB
         K1TZxAfJtShua6RfpDKhNj/uv5KK2u9UXVcg5lj4jMQMZnPJA40Mkk2WL0HYgm/gReUH
         RgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733896813; x=1734501613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6D+5UJWf2Pb6ZMQTYtdZG9lwxLVemgiQeSinsEy4PM=;
        b=oVuQnm5wmzFaQ8r7meTbKGxRIBqLNzus6kJg3GAI2fJ/dSyVq4U+j8Hxn/hsClVpPP
         Z42BVfbMOuzE9ZwcSDLDbWkcRjsX86PgS1LwI/YTFV651KEZWUBa5ISrTAbyC6Vlrw59
         irsjDC0OvDppC1wJVJah+MyRZtaZJD12WK8VT00e8F1lp4ZL94G9eZi67h6z+19UnWaK
         /OhsUdWBvfo34W6hch1vqizwg2ZamMASmV4UZxpI5JOqe4mh0PkWnaW3xNKa6OFL9L6u
         U0STC4odzLdxo66XGTCNrsqeGSjdqJHVT/D0mH34VpPiMxSi128rtAkeOm5kN72GUk+V
         JUxg==
X-Forwarded-Encrypted: i=1; AJvYcCUdRrUlK0+U16WV44CXKfToATHPdWoTu8AXno22sRnFHEu3l0TwPxSDnaeq2hKQxOXSjtWXeKLLpsVyeY6X@vger.kernel.org
X-Gm-Message-State: AOJu0YwUnQYmggI3GR8jfdqL855K17gCPfVJOdIFekAr5D1JynNkbGvX
	bCcSmoBQgnJCmK9+WzGZ0o3EPHzWbpMrV3COj6622rBQrX+Srv3/prQXXX82vg==
X-Gm-Gg: ASbGnctkINbiL7Q5D1tyMW/FALVAcgsWaQ9HEVYHGueMeOuxj0nWjmN3IvNovZizSvc
	C6+4CX9L7TirEZapUfQL6bXKv9Sm3+T+kZzgr0jZX+LOdtNsyfGDdf1638eLtihqTrLoU65/y4q
	4o8JWuPKKisyISu8A44GldURf9imzHRvGSKkuKqAjZ2Bt54A8KDXkm6U3VI7K3bzven5i5XVzET
	y2gaNwpg8eBdn37YufbbFXCyY/6EHdPLVqmxVQ8IYlp+0AFLZKu5gYD0rbl+Yc=
X-Google-Smtp-Source: AGHT+IETlOHgTkLxhqU/G3R9N0fR+q6nWJP5t1CaevYyD+oehCnYRHb6VBsIy/3q5g8vtc8rjNY1ow==
X-Received: by 2002:a05:6a20:d50c:b0:1e0:d5f3:f3ed with SMTP id adf61e73a8af0-1e1c129622amr3306101637.19.1733896813626;
        Tue, 10 Dec 2024 22:00:13 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e6e024e4sm5434850b3a.153.2024.12.10.22.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 22:00:13 -0800 (PST)
Date: Wed, 11 Dec 2024 11:30:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	andersson@kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: PCI: Add binding for qps615
Message-ID: <20241211060000.3vn3iumouggjcbva@thinkpad>
References: <20241112-qps615_pwr-v3-1-29a1e98aa2b0@quicinc.com>
 <20241204212559.GA3007963@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241204212559.GA3007963@bhelgaas>

On Wed, Dec 04, 2024 at 03:25:59PM -0600, Bjorn Helgaas wrote:
> On Tue, Nov 12, 2024 at 08:31:33PM +0530, Krishna chaitanya chundru wrote:
> > Add binding describing the Qualcomm PCIe switch, QPS615,
> > which provides Ethernet MAC integrated to the 3rd downstream port
> > and two downstream PCIe ports.
> 
> > +$defs:
> > +  qps615-node:
> > +    type: object
> > +
> > +    properties:
> > +      qcom,l0s-entry-delay-ns:
> > +        description: Aspm l0s entry delay.
> > +
> > +      qcom,l1-entry-delay-ns:
> > +        description: Aspm l1 entry delay.
> 
> To match spec usage:
> s/Aspm/ASPM/
> s/l0s/L0s/
> s/l1/L1/
> 
> Other than the fact that qps615 needs the driver to configure these,
> there's nothing qcom-specific here, so I suggest the names should omit
> "qcom" and include "aspm".
> 

In that case, these properties should be documented in dt-schema:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-bus-common.yaml

- Mani

-- 
மணிவண்ணன் சதாசிவம்

