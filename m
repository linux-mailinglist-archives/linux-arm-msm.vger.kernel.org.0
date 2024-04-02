Return-Path: <linux-arm-msm+bounces-16128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A5B895906
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 17:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5281028E809
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 15:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4154134CE8;
	Tue,  2 Apr 2024 15:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ju3OhhWV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFAB134759
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712073541; cv=none; b=i1NxGV5PFgDsIMmtlfrMBR8JfR2dHcEHRsAS7BecpnQ0xAwnxipjaF3zMmUOUTx34PWtX7wGQSgSjImRkBuzMLXblb7FVBEPtSaeFiBpAD/OIeCwndHM4Coijv8mvwGoY4R7NrOunXWaaI6xMsE3oaUqYV6ak3GeTyl9L3PvesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712073541; c=relaxed/simple;
	bh=8NAIgXsfazcwXjwK5f4+owrNYeHcAdGOOqJqfK2TAl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4+b22WZ0lZ1UQLrg//tz2HZ2VrzEeVPmuZF+dr/5QsqplV5EZbssT4seSxU+pxdA2obfDZVQBOIXsQMkdtaIlcaOM8G6QNxSlC9P3Zh95oNX2KL/vKTS+gfzl5TYr/S5sV/Ab/MR7MLgVYWkSb9QpWyabb/YqTah+2IrCSN2cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ju3OhhWV; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6eaf9565e6bso1824476b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712073539; x=1712678339; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+o7XM/+4QFL4NFpVeras/FA7hCjajIU2dOFHOBIo+B4=;
        b=Ju3OhhWV/JgKLb/LsBqgqqhApdXynk6XID0duRJ5dletGGjZw0vAGFaEKDqlc26PRI
         CTfrt2IJJZQcS3yfA3C9W7zFJnP4lnUtQzfZYBZX1C4Q9i7YIj297ri5yo89jgfG1LHJ
         IrXA8sQMS0603egAkZUZBCv4Ioxb5QjTzi7Zz3HdDXaNJ5xIRXF3r1C0F79xJUmGl3lf
         Lme/p/Ehwhv0x6mLx9Erx1lsvYfNTw1eq5OjSgaWmDhxR+dpMTygEB9DMgsTZ/H3Ejij
         H9EkYkLzfFeujf+h8b1DJtDOO7/nvOdwGRL23PGEAUmZ0eYeY/tqrPkd9Q9uVes7RsO5
         a/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712073539; x=1712678339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+o7XM/+4QFL4NFpVeras/FA7hCjajIU2dOFHOBIo+B4=;
        b=n0EKfdOk6zLxU6G/GgtlszVtOVnf3s5SlWASQe32nmvpFRmASrtLTtg21TzxBfKy26
         BQSi09XMhJPmEHK0wpYMG3eOK6c8lBXla3XubLj89xvVm7GzyrguWAXluXUuWXNw7HnN
         7YqUpwvEJgmk91eZccm2XqGKW0ROMt8NIMMF+jICgBeX3XCmoA345NHqc7/vhoyiR2/w
         16td5B0yjnEj7H6e0a+pbQJFjoVZprVQbrGievma894SkHwofF+l9loU8QZnB5kfPAif
         yQFQ7Iqjgx/ocsmNfTm2zQ/KGfOrD9jD+hG8nwdd8zgt2jljpvZGHQxSNKkXludUk8ZN
         YyTw==
X-Forwarded-Encrypted: i=1; AJvYcCVKM+Uvbyq53xsOo6tf6atOhTLZQJnewPTojOtdm1mvdWjksMlaMNoPHuHzP30/wz4cDp59K7PwAFqPe6chBjU5iO/U9D3Jzi8JrEm8LA==
X-Gm-Message-State: AOJu0Yziwx7lnm49zc0/wyScvov3SQ0gp3ZNFi3GlUK/0aOLrxAnqW4t
	UwN55L4SBiwecHKuy5pdAYSbllTg6rwl/2IzXX9pRHwlgx1cAsiDIP3djNEqGIGTv5XhhpFBAjS
	RJ4NBGXYfGpLqP9rud4/F6UvSG1OGq7TfoKs2bg==
X-Google-Smtp-Source: AGHT+IEzsVJjfQE5WZje+CSZh6uu8A/j82gSVdAZbljD1m2TlI5e1JTeeViL0IFd5ZW5fAGfo0XB97vETuhPUGuxvMQ=
X-Received: by 2002:a05:6a20:3946:b0:1a3:32e5:f38a with SMTP id
 r6-20020a056a20394600b001a332e5f38amr13336915pzg.45.1712073539439; Tue, 02
 Apr 2024 08:58:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401-msm8996-remoteproc-v1-0-f02ab47fc728@linaro.org>
 <20240401-msm8996-remoteproc-v1-3-f02ab47fc728@linaro.org> <d9ba1e11-44ea-4c1f-ab33-56a8bf57ab63@linaro.org>
In-Reply-To: <d9ba1e11-44ea-4c1f-ab33-56a8bf57ab63@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 18:58:48 +0300
Message-ID: <CAA8EJpqn-s=o2D0CcFg3ZMQUQWGW6UiAs+hZK2gM1A5YciS9MA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: msm8996: add fastrpc nodes
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 17:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 31.03.2024 11:10 PM, Dmitry Baryshkov wrote:
> > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >
> > The ADSP provides fastrpc/compute capabilities. Enable support for the
> > fastrpc on this DSP.
> >
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 57 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 7ae499fa7d91..cf7ab01f3af6 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -3545,6 +3545,63 @@ q6routing: routing {
> >                                               };
> >                                       };
> >                               };
> > +
> > +                             fastrpc {
> > +                                     compatible = "qcom,fastrpc";
> > +                                     qcom,smd-channels = "fastrpcsmd-apps-dsp";
> > +                                     label = "adsp";
> > +                                     qcom,non-secure-domain;
> > +                                     #address-cells = <1>;
> > +                                     #size-cells = <0>;
> > +
> > +                                     cb@8 {
> > +                                             compatible = "qcom,fastrpc-compute-cb";
> > +                                             reg = <8>;
> > +                                             iommus = <&lpass_q6_smmu 8>;
> > +                                     };
> > +
> > +                                     cb@9 {
> > +                                             compatible = "qcom,fastrpc-compute-cb";
> > +                                             reg = <9>;
> > +                                             iommus = <&lpass_q6_smmu 9>;
> > +                                     };
> > +
> > +                                     cb@10 {
> > +                                             compatible = "qcom,fastrpc-compute-cb";
> > +                                             reg = <10>;
> > +                                             iommus = <&lpass_q6_smmu 10>;
> > +                                     };
> > +
> > +                                     cb@11 {
> > +                                             compatible = "qcom,fastrpc-compute-cb";
> > +                                             reg = <11>;
> > +                                             iommus = <&lpass_q6_smmu 11>;
> > +                                     };
> > +
> > +                                     cb@12 {
> > +                                             compatible = "qcom,fastrpc-compute-cb";
> > +                                             reg = <12>;
> > +                                             iommus = <&lpass_q6_smmu 12>;
> > +                                     };
> > +
> > +                                     cb@5 {
> > +                                             compatible = "qcom,fastrpc-compute-cb";
> > +                                             reg = <5>;
>
> No need to copy downstream's creative alphabetical-but-not-numerical
> sorting..

Ack, I'll fix the order.

> The entries look OK though.. although, any reason we have
> such a weird binding including faux child nodes and not just an array
> of iommus? Is the only way to discover the fastrpc nodes' properties
> such as qcom,non-secure-domain or vmid belonging through hardcoding?

No idea here. This is how fastrpc nodes are defined on all existing
platforms. Maybe Srini knows the story and the reason behind the
bindings??



-- 
With best wishes
Dmitry

