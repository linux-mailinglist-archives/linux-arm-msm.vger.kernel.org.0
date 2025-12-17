Return-Path: <linux-arm-msm+bounces-85425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69657CC5B76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 02:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C52F0300EA24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 01:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B329242D8B;
	Wed, 17 Dec 2025 01:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zzx3BBPs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C07623A9B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 01:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765935692; cv=none; b=Qmsdzlj+5rNr32TnuHjcarwxqxWKoxvaWXPzUM6nZClEg+HI4y6l3Sa7tmOJQ7RfXUP8OdPZ8gFU2rDq00/nhzNQbW1IB2AdAMpG/0nswby9qADvkV8f76G0bpJ2kZ6/fgguifkEpRkrIr8rbUzisxRW+lIXkdJUHKP+vdTb21Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765935692; c=relaxed/simple;
	bh=2/zw0Nqll5k0O24hyg2cPPxtuqyfOWLeA94KYYj4AnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6pzcYXALWQDRyu8ZqFTuS1IW2bpp2BHkwQBzFqzVKGnesGrE0Xm8o9eL4fAo4D/hEPPcn4r0svZtyU/Bl2CY/AqVDnJZCfmymTgt8teg4RWBjQEy+vBK/k2kLwiBc+FucPBb7f3vcYHGGLCNvfP+OnVrr/vP2iEgJFg7gtSNOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zzx3BBPs; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b25ed53fcbso758250385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 17:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765935689; x=1766540489; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZcO4USqsNQIN1GpP+KDtX+lrVNXqODY1Yk6T5TPE2sc=;
        b=Zzx3BBPsghCIk9/UIRi/Mrvpxk6o3bICTu6zoRzeOU6na3GNMz4pSvFBa6KJTShEQx
         bq7wgUqSb+zT7RIvcYlnH9C5dSkWo5V7jgFxv09dEUlm4RqW1NzIYA0UkTs9xTr0qE62
         BusGWWvhONN6rJncqxfGy1SBYY8MH05YfbPKZE373GaFVprS6+A44QyQ29Sv/Tfn3m6o
         qJ1B/TLyxbxkJ3JxZ1NoOaTlmTWVo1PBDEp2QALRlWSCWErrOiU8bU0YYvF+1cUlv5yJ
         OcgLEafjs46023PTZbvK8VJu9W2jfroTBa5rRJej3GqL4K1+AysL18kdP2ifBKRfT1sR
         HZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765935689; x=1766540489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcO4USqsNQIN1GpP+KDtX+lrVNXqODY1Yk6T5TPE2sc=;
        b=kDTVaO9S1CUnd6Y7Y6eUHkcd1YcxKflIsDxflffcn3vI+pdF5A8YjHZm3B4Xt5oyY5
         5KyoPO5WdJzcBiTBkZ+MBlYM3r4WXFtUhIBKEvRepY/fK1yrCRmL+1FrEKsxcGjE+eh3
         ST09ULDNT39PtJkRXOJ+yOFzdlL67/ekfUpzk6i3X5tCTeWVzGx2eG15Gioa01okVyK3
         tZolCff9A047oWnNuC/Lv6w8nt9IiSEMd2TruzBXBtA8f1Tj13hfTprdPwbk3yuFsSTk
         ykEmote0UE036GsFEWQ1oDVRiRi7Udi7ViOqsGvUyueqIXVEx6jU0JS7qIU3TPxxNpXX
         NqCA==
X-Forwarded-Encrypted: i=1; AJvYcCU/5xafml9XvOcutOba1A+3CcEQFyt+zEI8W0Ah9tqOc6XZB7VDljzo+VbiaweUSsZss/wdLdMB258CwY4o@vger.kernel.org
X-Gm-Message-State: AOJu0YxNVkACs7KC2xAGOyf5Qt5epO2vQvWcndOZe0BezwDrmNLyHc+u
	FYmS5OeRjCpsmiPxsBgoegLsmlI2x/m1KSCsekk9NX6pNmIPZXiz9Fgp
X-Gm-Gg: AY/fxX6e5Dca619762P/TbVC3DpMfoqTSQsDzxWbxJaY6tiqcb9FkDSR30r3dtOBNOy
	/YvLel53cpanyadO7f8R2aARs05PWso5WbiTTzFyd/PH9K1fjnuxXilv1n8TesLnfYulYj5rNTz
	0qGI4eNDlrlrhmBKoxiSLq0cRNYvleN/yzHFnsckaqUbUpOUY3VZQ0Ow4zfqdk3LDKici566AO2
	ljUbx8KrZrYMB0paxX5LfH9tSltf+48d8s82GIW+57+gPwiyir2/jpKfwlOFHedT8T+aamf6p09
	6oPwN5ERFHIjumoFFD1oyvUW9QrUXOG3BaudZzXrm2c90yWtwaYV5bdPFTRFRu/4jNCaEStWTJr
	pWJp0NO+5vPa3wNs1brGy388AXQuM0GH7DYBatTQAMFNw49JrUw8FuWtIXz60VBwraTfe84mLfP
	GK6q66h2KltpAGFldSfMA4ZqbQ
X-Google-Smtp-Source: AGHT+IGD1+xr9e42ytKFlInllPLK8W19NJ5qwHqCkO38bsDi/F1/I+STZYAPgoo7L7NASYoo+8u9ZQ==
X-Received: by 2002:a05:620a:370f:b0:8b2:dd7b:cc98 with SMTP id af79cd13be357-8bb3a37b12cmr2300528885a.70.1765935688985;
        Tue, 16 Dec 2025 17:41:28 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be31b669d1sm298209985a.46.2025.12.16.17.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 17:41:28 -0800 (PST)
Date: Tue, 16 Dec 2025 20:41:44 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <aUIKWMQMAIzjybHO@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
 <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot>
 <aTtkwQb2gOeWAFuv@rdacayan>
 <d7jcawzugobqern6zlo5jwcnximtsroxywix53v2yp2isvzo5r@ymxicmgfjmzq>
 <341012f3-18bd-4f96-98c1-f964d1fedb8f@oss.qualcomm.com>
 <1d830282-a778-44aa-918b-5ab3e1516c0d@linaro.org>
 <4c4e8e5b-66b1-4227-86ee-756eca945972@oss.qualcomm.com>
 <fa131841-ae9e-49ee-a7c6-728b4a6a4b60@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa131841-ae9e-49ee-a7c6-728b4a6a4b60@linaro.org>

On Tue, Dec 16, 2025 at 05:23:53PM +0200, Vladimir Zapolskiy wrote:
> On 12/16/25 16:41, Konrad Dybcio wrote:
> > On 12/16/25 3:31 PM, Vladimir Zapolskiy wrote:
> > > On 12/16/25 15:56, Konrad Dybcio wrote:
> > > > On 12/12/25 8:22 PM, Dmitry Baryshkov wrote:
> > > > > On Thu, Dec 11, 2025 at 07:41:37PM -0500, Richard Acayan wrote:
> > > > > > On Thu, Dec 11, 2025 at 07:16:30AM +0200, Dmitry Baryshkov wrote:
> > > > > > > On Wed, Dec 10, 2025 at 08:48:46PM -0500, Richard Acayan wrote:
> > > > > > > > The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> > > > > > > > mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> > > > > > > > support for it.
> > > > > > > > 
> > > > > > > > Co-developed-by: Robert Mader <robert.mader@collabora.com>
> > > > > > > > Signed-off-by: Robert Mader <robert.mader@collabora.com>
> > > > > > > > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > > > > > > > ---
> > > > > > > >    .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
> > > > > > > >    1 file changed, 107 insertions(+)
> > > > > > > > 
> > > > > > > > @@ -392,6 +420,64 @@ vreg_bob: bob {
> > > > > > > >        };
> > > > > > > >    };
> > > > > > > >    +&camss {
> > > > > > > > +    vdda-phy-supply = <&vreg_l1a_1p225>;
> > > > > > > > +    vdda-pll-supply = <&vreg_s6a_0p87>;
> > > > > > > > +
> > > > > > > > +    status = "okay";
> > > > > > > > +
> > > > > > > > +    ports {
> > > > > > > > +        port@1 {
> > > > > > > > +            camss_endpoint1: endpoint {
> > > > > > > > +                clock-lanes = <7>;
> > > > > > > > +                data-lanes = <0 1 2 3>;
> > > > > > > > +                remote-endpoint = <&cam_front_endpoint>;
> > > > > > > > +            };
> > > > > > > > +        };
> > > > > > > > +    };
> > > > > > > 
> > > > > > > This would be much better:
> > > > > > > 
> > > > > > >     &camss_endpoint1: {
> > > > > > >         clock-lanes, data-lanes, remote-endpoint here
> > > > > > >     };
> > > > > > 
> > > > > > I'm not sure what you mean, there might be some typo.
> > > > > 
> > > > > My point is that you are duplicating `ports { port@1 {.... }; };` from
> > > > > the base DTSI here.  We usually try to avoid this kind of path
> > > > > duplication. If you can't have an empty endpoint in the base DTSI, I
> > > > > suggest adding necessary labels to port@N nodes and then extending those
> > > > > nodes in the board DTSI.
> > > > > 
> > > > > > If this is about using the commonly-defined endpoints, Vladimir broke it
> > > > > > in commit dcf6fb89e6f7 ("media: qcom: camss: remove a check for
> > > > > > unavailable CAMSS endpoint"). If I do this again and go full circle, I'm
> > > > > > afraid this could break a second time before even making it to
> > > > > > linux-next.
> > > > 
> > > > Quite frankly I don't think that commit was valid, given it's conceivable
> > > > that an endpoint could be unconnected..
> > > > 
> > > 
> > > Endpoint is not a device, status property is the property of devices and
> > > not a property of anything else as the Devicetree Specification v0.4 and
> > > earlier ones define. Dangling endpoints are fine, there is no need to
> > > add another property to determine, if an endpoint is connected or not.
> > > 
> > > There should be no status properties inside endpoint device tree nodes.
> > 
> > The spec doesn't actually define what a "device" is. Funnily enough, it refers
> > to "endpoint" as a device:
> > 
> > 2.2.2 Generic Names Recommendation
> > The name of a node should be somewhat generic, reflecting the function of the
> > _device_ and not its precise programming model. If appropriate, the name should
> > be one of the following choices:
> > 
> > [...]
> > 
> > * endpoint
> > 
> > 
> > Plus an OF node is opaque in its purpose.. The top node, a firmware node, a
> > node representing a physical IP block and a config.ini-style blurb are all
> > "device nodes"
> 
> It sounds like somebody of DT maintainers should clarify the matter and update
> the spec to be less ambiguous, if it happens that "device" term is undefined.
> 
> > 
> > But coming back to the real world, the ports/endpoints represent the physical
> > connections to CAMSS and it makes sense to have them defined in one place,
> > especially since there's a predictable number of them that should not be left
> > up to each board to define.. That quite obviously implies that not all boards
> > are going to utilize all interfaces and the commit of yours that was mentioned
> > above seems to only be valid on the basis of semantics, which I above mentioned
> > are not *really* a valid point..
> 
> For whatever reason CAMSS on SDM670 is very special, because IIRC there is no
> other platform with preset status poperties of endpoints. This exclusive SDM670
> specifics shall be analysed and eliminated, since it hasn't been done during
> patch review time, it's time to do it right now then.

An SoC-common endpoint node is how panels are hooked up to DSI. This
seems to be the case for SDM670, SDM845, SM8[123456]50, etc.
It's not special or unpopular for DSI, but CAMSS seems to be the
subsystem where an endpoint node pre-defined by the SoC is only in
SDM670.

At least from the context retained in this reply and my memory, the most
compelling argument I've seen from you so far about removing the
pre-defined endpoints is (in multiple steps):

	1. Suggesting common endpoint nodes instead of common port nodes
	https://lore.kernel.org/all/e9dc1a6f-156b-40aa-9209-2010464d54ed@linaro.org/

	2. Breaking common endpoint nodes in CAMSS
	https://lore.kernel.org/all/20250903002255.346026-4-vladimir.zapolskiy@linaro.org/

This is why I try to remove the common endpoint nodes now.

