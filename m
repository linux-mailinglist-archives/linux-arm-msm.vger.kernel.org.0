Return-Path: <linux-arm-msm+bounces-33194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FD099197F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 20:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18CFA282A8B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 18:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD6215AAB8;
	Sat,  5 Oct 2024 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="seYOJHbq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE24115A851;
	Sat,  5 Oct 2024 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728153025; cv=none; b=WtAJYQyzJqR3oNevVH0cUk/ArT05sYRbqp07xZHdSmpV4HHE9WIbJXwIzEGJG2q5GRsT9wExN3TH16QlL9zsI1pYCSQcol4UUr4GXeRRoqE6jxGH+Trr4/Cub3b6rSMIAEzc8XpT97p8JTgvNjUoV11ko0q7kW1DSX061JsRiY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728153025; c=relaxed/simple;
	bh=C/3NzZqOTorLtRkgrjsjoBs+OeubveVBpbXcNsYIa/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4AyyERF1ybCLsILkxHj849UrfEpeTp8KQl06vATHOj7eCp/gYSFJsuTwsxQfdYZP6LkfitmHr/spWsc7YJ8/7M2zZcL4ql4schxd+i5QZRmEUQxigekKLXYGqrpMLT5uBfE6WJ3ywNnO/9dN86OCHQIG7mVSTDfd7qH6+7zBXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=seYOJHbq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5788EC4CECC;
	Sat,  5 Oct 2024 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728153025;
	bh=C/3NzZqOTorLtRkgrjsjoBs+OeubveVBpbXcNsYIa/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=seYOJHbqiQO2n9QALzYbR2pYgc/1Z0XG4+JXADF8U5CPNjhy+ZCZClLfRADlrqH5i
	 kygu0PIV31eDkvF/LwpXZ6s1eI6jHZketkDowriQPQcCBiVArQ4Di60xCJcv6fBjSp
	 L69qdh7mw1wgnyPnT0emLsiV6ToEMFSwqQ0cZWVXHI7wENNw2JBFkvc23ZiwATHUHf
	 e82Yu4iKmx2CcFlnBr1zOOYYZT8/Xye/pSrEFBt2gqcXAuZvcaIt97n4NBSAo3XtmS
	 07XJXiEIem5HGp4lMSAP8GBti4CjcewZcJ1lYKt8cv88ZRUaYN+bTZgUsmFFgNaE64
	 gGh90994kAmvQ==
Date: Sat, 5 Oct 2024 13:30:21 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Jacob Keller <jacob.e.keller@intel.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vsmuthu@qti.qualcomm.com, arastogi@qti.qualcomm.com, linchen@qti.qualcomm.com, 
	john@phrozen.org, Luo Jie <quic_luoj@quicinc.com>, 
	Pavithra R <quic_pavir@quicinc.com>, "Suruchi Agarwal (QUIC)" <quic_suruchia@quicinc.com>, 
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
Message-ID: <zz7m5v5bqx76fk5pfjppnkl6toui6cz6vxavctqztcyyjb645l@67joksb6rfcz>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <Zv7ubCFWz2ykztcR@hu-bjorande-lv.qualcomm.com>
 <7f413748-905d-4250-ad57-fc83969aad28@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f413748-905d-4250-ad57-fc83969aad28@quicinc.com>

On Fri, Oct 04, 2024 at 07:47:15PM GMT, Kiran Kumar C.S.K wrote:
> 
> 
> On 10/4/2024 12:50 AM, Bjorn Andersson wrote:
> > On Thu, Oct 03, 2024 at 11:20:03PM +0530, Kiran Kumar C.S.K wrote:
> >> On 10/3/2024 2:58 AM, Andrew Lunn wrote:
> >>> On Thu, Oct 03, 2024 at 02:07:10AM +0530, Kiran Kumar C.S.K wrote:
[..]
> > The only remaining dependency I was expecting is the qcom tree depending
> > on the clock and netdev trees to have picked up the bindings, and for
> > new bindings I do accept dts changes in the same cycle (I validate dts
> > against bindings in linux-next).
> > 
> 
> The only compile-time dependency from PCS driver to NSS CC driver is
> with the example section in PCS driver's dtbindings file. The PCS DTS
> node example definitions include a header file exported by the NSS CC
> driver, to access certain macros for referring to the MII Rx/Tx clocks.
> So, although there is no dependency in the driver code, a successful
> dtbindings check will require the NSS CC driver to be available. Could
> you suggest how such dependencies can be worked around? Would it be
> acceptable to defer enabling the example node for dtbindings compilation
> using its 'status' property, until the NSS CC driver is merged?
> 

You can avoid this dependency by making the example...an example.

By using just descriptive phandles you can present an example of the
client device without creating a dependency on the specific provider.

Regards,
Bjorn

