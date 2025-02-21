Return-Path: <linux-arm-msm+bounces-48793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79201A3EB82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 04:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2422F19C128E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 03:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07ACD1F9AAB;
	Fri, 21 Feb 2025 03:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MdoQ+p/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59691D63F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740109744; cv=none; b=iDM+7P9VCclttHkRJo/hqOJ4Ob9Ry3lq9SKeNin1RmrUMvcc5NeFIJDLkMWnJ9JYASOy2ki5uGG5B53PUHCzQFOwcTKzPF+Ywza3YNvCNSiITkVxsQr5PJ6XINxg7q7EFvOf8si2Z1fi5xhJJvYvwyAM6gIQ4PTIX1ktbJheHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740109744; c=relaxed/simple;
	bh=xhkT06minOaTkf8wZ6rirZdUYd9gm7Mgu2p44K15dwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0UzN8P3R1tXnHh5RmtTDX5K4iv6fwSnXmEYv0FHMPp5WMCLtJSXDgaFj4CxNaENL9kPaWj8EyWWvkNd/wHYIcZlYKw6iXe8p4nsERFeg2XAVejIRKOz7I5aL+eKRtiu3iPFU5m7rbxiIf+B3kh2fd17kQPQC3waBDt28Vu9twA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MdoQ+p/i; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30613802a59so16906541fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 19:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740109740; x=1740714540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d1AVackadfhPpCMLLKH7Bg03NDXVVtj9z1+w6CdVYcg=;
        b=MdoQ+p/iQ9vKLQkrdK9sFWKd4/s2MOutj1kVIEmpH1cv2D5+Atd8uSChsczYHcHPXg
         eqRsEHgXyrBurIi/ykiG53e/BkkKmWk6qgiB3/CQpwaemfJkOMvvWBeHzTyuiAhrj7j6
         QDGucE/XgdwBYMuGKHcd9mp7W6MyAnmjwqzYuljutIIVLqogTLEtsU3eryC6Ut7NlUU5
         4Pozun0i7yqCNny32k8wZ+WjnEt1NIR8u6kh0GoD4yF5K5F9HTBgEmiFWq2TDlhtRPLF
         eCNvMJoQkasQlkHyZgZBcimeUutfPOhfprp9Qsq4GqVhmKZs89pMBlVXhJ1MsszaTra2
         nPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740109740; x=1740714540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1AVackadfhPpCMLLKH7Bg03NDXVVtj9z1+w6CdVYcg=;
        b=HXK9n5IFsTXBn14xkSJde/sZL/zQS1/38VicREr9isseM5ONNTVKygIxGiaIHWQYwf
         yXe2z8EhoQh0ruvPTQ3prNk8GCZ/TZcv+KgnZ7EtYWsUsP6rTgnBAx+hyJy3HcLucvds
         Zu1RUJCPPPz/Ppj7gn+2Z0iUDF+lvmxGykA2Bn5ipAEqfJ5bF4KD6PVDjbBaFmShaCj8
         0QQ39VnfuxchaHzOOKxhplM/VXMyO5twuTL9D9aRnaIaPSekJJCIHC3BPlpfmfEzVqjr
         Ri5OTxC0JIckWS2Ek9AqVz7BqrWDqt/84tyqeFua5lN8KXBXEpWhUjpNtmDgSlvmarjA
         nuKA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Z5pXCuxhOt2b6xc2K91OTY861bKORfJZu8wRp5/I1ZCV2i5TbFzat45cIDSqI4Jq1tR+U4z14MwQxIh8@vger.kernel.org
X-Gm-Message-State: AOJu0YyKwq0AZapSOfYQXrB+LbUi/kUk48P2IsAXH59hzV4ywQeYGmrD
	ZHhDBg6WZx7RRKzC4Ql6fKK6r+CuRfjNGnTxZefRdSKl1VfLEA4wv2nrasVfOLc=
X-Gm-Gg: ASbGncsrJG6chi0B8w/SAk6kLkXq2g1wqy7v21+7+ZmWRJTsHaSovI506Skm3isaNvV
	A2JLcOEG2Q2/SNb+oJDZSqHdCJ84OY1eFdtT/6bbh/SBSVb99iMoHGCEw4B/kAZ1pjrral4rYY+
	XXufGukUm5B7npvZeUn3xXMotQsgnaDNjctbnN+AH0+MLQu6QKZdI/gnq9I4g5wLjECagyT/RK0
	wIbhilnaF90NmdYs2ZLN6kbIHaFNpsACIQ58DgYjerCczZY7W09MNmZPnGsaHERsoGahuJnn8It
	om1Zd/KteD8OLvnEL4XKSynPkZRnJnFAGyp2Ql1MPySeodfh5bDtVkLfdAX3DocJ5xeQ4AWuaEl
	dXU1Rsw==
X-Google-Smtp-Source: AGHT+IGHQWaI+wsylt7S3+XMOx8A5/5l6dC9pJ61ZYifwIoKtpegMA7wiwgbweb1ZJRIrUmonpuh9w==
X-Received: by 2002:a2e:2c11:0:b0:308:fedf:8c12 with SMTP id 38308e7fff4ca-30a59858cc9mr4238971fa.5.1740109739700;
        Thu, 20 Feb 2025 19:48:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a29ab47adsm16752891fa.97.2025.02.20.19.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 19:48:58 -0800 (PST)
Date: Fri, 21 Feb 2025 05:48:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Message-ID: <p6ytfgzhcyqzmc3elxkpi5m2sdp3aweladrhzvtwpjpot5jh4w@nbjsg6jumc3s>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
 <a42wtus7y72mt5adklbwg2hjbuayxkeucs7t4xuzmxyag2mx7b@6wlsomzj4gha>
 <a1dbb65a-d437-46e1-80ac-8dff3c97b81c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1dbb65a-d437-46e1-80ac-8dff3c97b81c@quicinc.com>

On Thu, Feb 20, 2025 at 07:16:44PM -0800, Wesley Cheng wrote:
> Hi Dmitry,
> 
> On 1/14/2025 2:12 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 01:52:08PM -0800, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
> >> binding definition for the PHY driver.
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >> ---
> >>  .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 84 ++++++++++++++++++++++
> >>  1 file changed, 84 insertions(+)
> >>
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> >> +    #include <dt-bindings/clock/qcom,rpmh.h>
> >> +    #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> > 
> > This a typical comment, please actually update your internal
> > documentation: don't use GCC's and other clock controller's bindings in
> > examples for other blocks.
> > 
> 
> I can see that other examples also reference bindings from external
> drivers, otherwise I think it would throw an error for not being able to
> find the parents in properties such as, resets and clocks.  I tried to
> update my dtschema to ensure that this failure was not missed.

Just use ephemeral nodes. Instead of <&tcsrcc TCSR_USB2_CLKREF_EN> you
can write <&tcsrcc_usb2_clkref_en>. It is an example, nothing more.

> 
> I checked and made sure that no errors were not seen, so I started to
> wonder if maybe when this series was submitted the qcom,sm8750-gcc.h wasn't
> yet present on the kernel tree.  To confirm this, I removed the
> aforementioned header file, and got the same error/issue.  Now that the
> sm8750 gcc header has landed upstream, I believe that this error should be
> resolved.
> 
> Thanks
> Wesley Cheng
> 
> >> +
> >> +    usb_1_hsphy: phy@88e3000 {
> >> +        compatible = "qcom,sm8750-m31-eusb2-phy";
> >> +        reg = <0x88e3000 0x29c>;
> >> +
> >> +        clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> >> +        clock-names = "ref";
> >> +
> >> +        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> >> +
> >> +        #phy-cells = <0>;
> >> +
> >> +        vdd-supply = <&vreg_l2d_0p88>;
> >> +        vdda12-supply = <&vreg_l3g_1p2>;
> >> +
> >> +    };
> >>
> >> -- 
> >> 2.46.1
> >>
> > 

-- 
With best wishes
Dmitry

