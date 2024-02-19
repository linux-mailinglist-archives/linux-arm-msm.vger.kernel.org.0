Return-Path: <linux-arm-msm+bounces-11649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA3E85A0FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 11:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80DF9B217CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 10:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312FD288D7;
	Mon, 19 Feb 2024 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tr+cDZEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985572C1A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708338520; cv=none; b=sc2+XhUqJKnWp3Y/nrI91A5s+LQho7rrOv7l8fGGjf7clDtcjl+F/1CEmg8g6bd+wQ09J9/ViS8lbIeHYFVPJfKhr2CgD0i47BX5yjRKQXsK93SZIqZ/DSvpG3FV28DV9V+h5iaL7JoXnIXfu1zEhlbI3Mxkx0eEvzWHvP/aY5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708338520; c=relaxed/simple;
	bh=XJKGIOWh6TfmBXpxOXAK6XrApZ1idLrRq5SCoYlkEWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZQJDoTPLe/EeoCR26GxfugrSGoGYFYw+4YWgiVimi/pTOd2v5i3sa6FH3WP3zPVSh1FQB4yoqDZ5kGHmCdHlFDmVZNjtJId9Tpn5HMtVtB0KOJY2jFP+g6RPj5eCsfBhpaHAEfcc83seeXO0EJQnDN7fbWRNoQTTYCU8KVkuKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tr+cDZEA; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-595d24ad466so2383621eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 02:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708338517; x=1708943317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JnmZ+t+uAS5BZCpGcPGtYpaiyhTix1/Al+d1pqweSt0=;
        b=tr+cDZEA7QpJNP2hC3y6fo2tVybNtOL31qt5vAjbXMU9XDP+//MEkY6O8BNmMPdBIv
         YgCbUc7MSQlPlWMPhptanKgy+C6qg0EbNCC/Y/ipA99nTkE4YBPZKNf52UE+7qOniaUj
         782L5V0IwytQptRYA/n7MtWi4mdNP4PDp7SxaKSFJ+dIlKDEcJSuzZIhU25H/f5ZfzNd
         dXppJVtTmxP1tXn3rBEEvDM5+TMcPhWaMix5sQ5bv6KrM3J/YkSBo6fs4EULxOThewmH
         MMNBJ8r/FC2nm5hJ3OEY44T24o7Lxmj116sZuHPin8BBEUCqeTLOxrzPcQX/qzD+i1et
         a/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708338517; x=1708943317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnmZ+t+uAS5BZCpGcPGtYpaiyhTix1/Al+d1pqweSt0=;
        b=BweacE4E+s9Imp3MW50K4WipePqNe0GZbrqSj9l7b19bvWZUfBXIP0BhmiOTXg4d4V
         q+aSSXdpVKAYcMLrzvKinepXiHvNITejt+Yc9TLC981sCb8M9aisEIY7r+mCt/j4nrDZ
         SJ4xbb9+orsRutVKLV9tl0zt/e/d0njf+wGLBRtg/SNX1LagvuCwc+WPm2lYgK+GRI9e
         WZHtEiVbOT7nH9AVut5cUjXhf3MHJXDK8GYYknWc6XcTWb9/TmJNFWdPzLjeoN7Ry2ls
         SVRnjWUwt2Sk8OMyhPTw5fYcSdAoPD7J+pyVNQNhNNwja1nrCQMpyp+ojzRL5DVwU/zO
         2HLA==
X-Forwarded-Encrypted: i=1; AJvYcCUWa9aoZVx6R9XNetE5vsOHBGrUoEUUz5uzQeZ8Ujx1sq7QhonJsZHRFgDJvsB7LheqNUmGqcvY9jO5uNET8n5wwcao4Csu1cjwOK2dwg==
X-Gm-Message-State: AOJu0YzkDYxlEmz1aGzF11p/ladwt6gqG+Qv/I9mkpTTX/9ueZDnnP0A
	72kfHkEEIwuxpRbHZIGScAEfpSCEL7vvv48PFnz0lRhaixxE3eRieUWwhejWH7s=
X-Google-Smtp-Source: AGHT+IHrghrtOCzN3SBUX/RSI7ci2jafiK+zgQHl9otRnnbGtszwG3kAb3rV9eqhnnxOyvTqBspPoQ==
X-Received: by 2002:a05:6358:750c:b0:178:94bc:731e with SMTP id k12-20020a056358750c00b0017894bc731emr17026938rwg.8.1708338517352;
        Mon, 19 Feb 2024 02:28:37 -0800 (PST)
Received: from localhost ([122.172.83.95])
        by smtp.gmail.com with ESMTPSA id l15-20020a62be0f000000b006e13ce6f4dcsm4433719pff.87.2024.02.19.02.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 02:28:36 -0800 (PST)
Date: Mon, 19 Feb 2024 15:58:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
	vireshk@kernel.org, quic_vbadigan@quicinc.com,
	quic_skananth@quicinc.com, quic_nitegupt@quicinc.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: sm8450: Add opp table support
 to PCIe
Message-ID: <20240219102834.x22ggazkmzppsdxc@vireshk-i7>
References: <20240130061111.eeo2fzaltpbh35sj@vireshk-i7>
 <20240130071449.GG32821@thinkpad>
 <20240130083619.lqbj47fl7aa5j3k5@vireshk-i7>
 <20240130094804.GD83288@thinkpad>
 <20240130095508.zgufudflizrpxqhy@vireshk-i7>
 <20240130131625.GA2554@thinkpad>
 <20240131052335.6nqpmccgr64voque@vireshk-i7>
 <610d5d7c-ec8d-42f1-81a2-1376b8a1a43f@linaro.org>
 <20240202073334.mkabgezwxn3qe7iy@vireshk-i7>
 <8a7b63a8-0583-43cf-9876-8a964c8b77ee@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a7b63a8-0583-43cf-9876-8a964c8b77ee@linaro.org>

On 09-02-24, 22:14, Konrad Dybcio wrote:
> On 2.02.2024 08:33, Viresh Kumar wrote:
> > On 01-02-24, 15:45, Konrad Dybcio wrote:
> >> I'm lukewarm on this.
> >>
> >> A *lot* of hardware has more complex requirements than "x MBps at y MHz",
> >> especially when performance counters come into the picture for dynamic
> >> bw management.
> >>
> >> OPP tables can't really handle this properly.
> > 
> > There was a similar concern for voltages earlier on and we added the capability
> > of adjusting the voltage for OPPs in the OPP core. Maybe something similar can
> > be done here ?
> > 
> I really don't think it's fitting.. At any moment the device may require any
> bandwidth value between 0 and MAX_BW_PER_LINK_GEN * LINK_WIDTH..

Okay, I leave it up to you guys to decide on how you want to do it. I still
believe getting the information via DT is the right thing, but maybe I still
don't understand the problem fully.

Thanks.

-- 
viresh

