Return-Path: <linux-arm-msm+bounces-43195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B54729FBA1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 08:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09EA518847DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 07:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B20186E2E;
	Tue, 24 Dec 2024 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tITeap0A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983D42049
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735024522; cv=none; b=fPf2cwOqC0TemooKdAdCy6JNqshaxLFo0FU8SWH2qp+qT3oGPnphjnArdQP/VcHgiH+vhBfmleQZkSRn56eIbhEULhIo6L5LlBe9sKEPyEa8xWMyfUL+ZUw5mDZcgvV4fFPrnrrcUh4dRsa/e9NEwobZBSCnxXSMXfybYPc5AwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735024522; c=relaxed/simple;
	bh=YHJSI4t/qgGEI2FEsSHGesZLQnLP+7ZOWpEdS9vfwdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mV+29de6dS+aFYUeHNl5MWvF2DP1xYhQ7Z/j/3LYcRGG3t+0Q/weaq0Pz/unvG1mzoBKbOkJFQ/rKtFnsUojqO3VBbaQAwl6NatO2/HK+0Oef8vpEKpcoYgH4jc4W74iJUYSPBRs1wTDdG2u2xhBJ1fC99o2RJj23XVLGf4zmw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tITeap0A; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54026562221so5170239e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 23:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735024518; x=1735629318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yWUlsCwdGlYVoLTTlNmK9JqyX+ELLJR/XrPbGHFiz4o=;
        b=tITeap0ANTmSnrBxgskwGtsZYTnzP4g3R+f0MD+PSSDYR5a9HBvNLHJ3RqhohaAiUF
         1p2mQdVqcKD+Eqhx98Cq9FY8gwY1q2G9d8cbH/sLRCs9MA8jdWpcSrsyYEU/pPDJi5ZN
         1Wc9xE0/vI9Jm3w/lfNWls9yrx99bzbNsB0aEFdmA5ISZhWnF7uQHgFgVQXzhg9qlQmy
         9AlVDjihFS2JAfprjmGKMekpthO744FKfZPrYqNMmhGeB51gXisSU18S0DpjLyqKbngZ
         D3+dvSIzAPj/X+tXgKN0Q4H63+2ZNN7PFdxEeZdcyc5bNnUwP9eE7cLJV+iFrRoxTjwe
         Q2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735024518; x=1735629318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWUlsCwdGlYVoLTTlNmK9JqyX+ELLJR/XrPbGHFiz4o=;
        b=oSdpehvGXwZFrl6jTxgeV0X9V5cMlGPrkhmsXSVu412QZtDjVeBAyc8La1kOj/ohVX
         nOELanETy0qVBk8aRgONUd+F5G03NAIHaEVI83e6cJADF88DslNrW6XwjTgSekE24STH
         nwm1/ZSNh+jXUlxRAbcPbJd/c4rlFfCwxJTlaI01lDZEyw/vlbCONWCrOKeCCS+Yd7Td
         8vz8jCewOVra+axgKXaDSOMqTDW6lNXBJofgYIV//+2u2v+ht94UJmefnTYVM/T9q54G
         uUClL8/WSba1fMqLJtYyP7t7MRrqvHAdJO1X0JfUDLHpseKhgk6gZN17oB4Cw791aiH0
         I9/g==
X-Forwarded-Encrypted: i=1; AJvYcCVt/mDIE2mzZNAMeeW4Xyv5U38y1OvWWL3Grt7EgCqJ/ta0G/dD1RBL/TvpZuZubQ6muzjrQb2idKP7VMsM@vger.kernel.org
X-Gm-Message-State: AOJu0YxLhSDZjUigfzy3ohwFVlt6sTA2KSSQMZwqojGKufD4IJ0uADea
	0c56HUmXuonWvov9oKEv9p63CQZwf4/W54X/jJCp0K63wb2LlY3Uf9GEDdlyMRA=
X-Gm-Gg: ASbGncvHdwRWg8Cx6rfTEUzYDPK4VyQ/XZfce+mLju+xBjQF6iUzd1nXcXhG1ZrGfF2
	McpkBwetBb1B0moMGp+xmySU3WZ4cUCUu1zLZnnTdzMZ6BxgqgtDTePckyZ7CvTno6ALeXOwGZu
	uDK8ShoJWRIw1whRLjyE3XwVcIPHFhVspdXNlOy/zNHW7uuRPbyb8qsFQKeX0JDlfTLOp9Vw80J
	v4hnUwUruYQkbxz2mwZk7g1v65t/KwqWR7p+25V+m7PcVA9avOJ4YYYZ/23rndyqZz9wUjJ9znR
	vwW9gN6xwLMBRfD4YvWRJzxyNxI8P3cPelxG
X-Google-Smtp-Source: AGHT+IEKTeNBvQTu9YRBoejIqf1EgZ3qzhUiijhRn6wPkG9McwpCWPDfTiwpc8nJ3zhgXTioKcIefA==
X-Received: by 2002:a05:6512:3e2a:b0:540:2311:28c5 with SMTP id 2adb3069b0e04-5422956c4c7mr4452369e87.57.1735024517908;
        Mon, 23 Dec 2024 23:15:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238138c3sm1507194e87.140.2024.12.23.23.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 23:15:16 -0800 (PST)
Date: Tue, 24 Dec 2024 09:15:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: Lei Wei <quic_leiwei@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com, 
	quic_linchen@quicinc.com, quic_luoj@quicinc.com, srinivas.kandagatla@linaro.org, 
	bartosz.golaszewski@linaro.org, vsmuthu@qti.qualcomm.com, john@phrozen.org
Subject: Re: [PATCH net-next v3 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
Message-ID: <yfh7kghxy5hjblnzlapcpzj54chep45pjkgpvelzbp4ijuq7ci@e6te6c36mkxc>
References: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
 <20241216-ipq_pcs_6-13_rc1-v3-3-3abefda0fc48@quicinc.com>
 <d278ad9a-5d23-4cb8-9de7-5a51d838ba5d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d278ad9a-5d23-4cb8-9de7-5a51d838ba5d@quicinc.com>

On Tue, Dec 24, 2024 at 12:29:56PM +0530, Manikanta Mylavarapu wrote:
> 
> 
> On 12/16/2024 7:10 PM, Lei Wei wrote:
> > This patch adds the following PCS functionality for the PCS driver
> > for IPQ9574 SoC:
> > 
> > a.) Parses PCS MII DT nodes and instantiate each MII PCS instance.
> > b.) Exports PCS instance get and put APIs. The network driver calls
> > the PCS get API to get and associate the PCS instance with the port
> > MAC.
> > c.) PCS phylink operations for SGMII/QSGMII interface modes.
> > 
> > Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
> > ---
> >  drivers/net/pcs/pcs-qcom-ipq9574.c   | 463 +++++++++++++++++++++++++++++++++++
> >  include/linux/pcs/pcs-qcom-ipq9574.h |  16 ++
> >  2 files changed, 479 insertions(+)
> > 

> > +
> > +/* Parse the PCS MII DT nodes which are child nodes of the PCS node,
> > + * and instantiate each MII PCS instance.
> > + */
> > +static int ipq_pcs_create_miis(struct ipq_pcs *qpcs)
> > +{
> > +	struct device *dev = qpcs->dev;
> > +	struct ipq_pcs_mii *qpcs_mii;
> > +	struct device_node *mii_np;
> > +	u32 index;
> > +	int ret;
> > +
> > +	for_each_available_child_of_node(dev->of_node, mii_np) {
> > +		ret = of_property_read_u32(mii_np, "reg", &index);
> > +		if (ret) {
> > +			dev_err(dev, "Failed to read MII index\n");
> > +			of_node_put(mii_np);
> 
> Assume, the second child node failed here.
> Returning without calling the first child node of_node_put().
> 
> Please clear the previous child nodes resources before return.

s/clear child nodes/put OF nodes/

Note, for_each_available_child_of_node() handles refcounting for
the nodes that we looped through. So, I don't think the comment is
valid. If I missed something, please expand your comment.

P.S. Please also trim your messages. There is no need to resend the
whole patch if you are commenting a single function.

> 
> Thanks & Regards,
> Manikanta.
> 
> > +			return ret;
> > +		}
> > +

-- 
With best wishes
Dmitry

