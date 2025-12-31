Return-Path: <linux-arm-msm+bounces-87031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 37968CEB08E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92C83300925E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 02:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6999A222599;
	Wed, 31 Dec 2025 02:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnsauaT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53331A0BF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 02:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767147590; cv=none; b=b2gv33pcYb2ZnxRr+vLBNo5OgtH6HM79EEP9b2uelmCD+4Ad9EqYTgXrkslMQrdOMXJcGJm2eRhwqaq1/72XNw4RS2wsBZu1Co6mR9Fp/Oc0kvHSwe+1JCTjT4yRHqK+iMcXbfAiMwdvWat71p59NWzELAr5Lec3KfMSMRnZo9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767147590; c=relaxed/simple;
	bh=IHEnzGZQFu2XY1gud4jw/rHZMO4chA7VKbL2h44E930=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUcGE3vSikFbkq+Foa4HBbsZ2e9zGgf8AkF4kHAkPYxwngKud85rjfIArsBBbFT0JwD31GijN2GqBUJZo1l0PcUyTmJuXIPj/pjPLocFM1wVuHGb6xmr1YlYKXcZW/ZxS+hyfCzugftrUdOeF/brR2sxg1JIPt12+dnPWbIYX9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnsauaT3; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4f1b147eaa9so83221851cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 18:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767147588; x=1767752388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D0kfkuwpnrgAV1ePd0vpthp8gNZsEbHuzyj1n/s8Aq8=;
        b=BnsauaT3LcB6qSDbqVFDLxBkyxmSp/tlL/iHVaCiQiB2Hzx3UOKViFGX/3aQz2bRvj
         6E3UsUhB6dqklXjUTWahkmqh7I2cO/ZOAug249Db+Mvjw9EmVaUjdmLLwFefVyey62P3
         n5qqu1bLHSd074R3Aq664ovJaKVrWnj135XIbwLyz0fi/b86bhQ0LfwGaktgnA3H7jv8
         GrVTbWfEVsdLz5exxmh5/kreph5aoxa5/WCVyUo/uXxJ5rrQpWGPynfMRrXkO0pr2Pn1
         b0zklJL+OJYvsFta+u3XTbjnkcwchITee6pUwZcO/u0ksCDGTlAs6Mtbi3PqqrAuiEmH
         82VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767147588; x=1767752388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0kfkuwpnrgAV1ePd0vpthp8gNZsEbHuzyj1n/s8Aq8=;
        b=hN5CcbAvqApJFnUC10UWjr0H47K6X9uiYDc4aLzKgG++gWBMbI2Ti2QK/RrV235jeb
         pH0AM7KV1CS19z3XVtMzqPMrjb99yK1RoeDeQ6KVO1XlsPi1HgIM5mKfW8ZelpEX5J49
         5AK/LQuKiW2yrUrnfk8xye23mkP9IEgICsxBkKA7iP4IUnVPuHtDQMCmNiP2gux20RBu
         WlgdmWbxwpg0YQigSufrsgCKnf7DbuBzqxjixqFOkdtL3vjrOQ7Zv2GmRgPoG7BO6MC0
         KzpkmQxm/CNB96w8lnZydVPCVx8kEj7s00ZRJ9KQFHh/fQr5AUNiYRXZvR6lMJBpQsAr
         3aRA==
X-Forwarded-Encrypted: i=1; AJvYcCWg0WeYf1TpbaLIGz5u/OzpzlBQzp2faXuGOQ6lOqYx4gWQKEWhd+3CP7/R+JM6hkNUL9OO8uptk2sE+Erw@vger.kernel.org
X-Gm-Message-State: AOJu0YwqW6jkFiYkojHwh5bWV9VhO8Z9OEzROdjIf0gSp3YhwqjbPUF6
	WdOWVQkXF05C6uQY2/bXgyf6dCU2iznMQ4E3FsNItUN3eXyQQbVVIjlF
X-Gm-Gg: AY/fxX720EQJePx8Ssf6YyP9Lw54/0APytZUfE0BtebI4W5bA1vHuEY/Vqp6lvKPQYl
	CpaPOi/78BZhZTFmYwhtss6bRvr6jpS503KmDYICopE+7N6WDegs6vpPFRvARdmQ7zLwh2uTwie
	9CWgKhBwJqZD97wrbhGHQo/cZuBKAF0WgpqW7mKRxyrrmEWKPMgcFDjKW1x3TN/M/Dx+flP3fY9
	XP1aKshXunLdPamb8E+B0QuZfSsSa6L/75Co71J3+bcLj5xZo4OudDCtK0dATLhkwZ87V8NhWmg
	LpLln/dPt9BF1CIMono4hYT+FWsvFQUdx3qp32zuZ//tWF9RmNAnU9DxQFfdaUkpSciU9QVEoOO
	yfXPfe38j1X6gWJ35TS6UnxNMhU/3sDs4Hx+FQjJnyhhchXaAVriNpeJWRQ/4zrVF2gxr3r9kdI
	YUXouzCjZemlqN2OjNboISv53X/rYyXyEgVAsMQIGnRZ9RF88ufqpSIvvgqFLokgXXgwsLWCXlw
	hi5V4BZ/qynlw==
X-Google-Smtp-Source: AGHT+IFXTMpDXyFdEmEGQVX2R+AnY9cpX7S8SyoKdnFEwTMNIZQs9zv+GdpjMX2DjoIlXn0g3yozlg==
X-Received: by 2002:a05:622a:1c11:b0:4f1:e0fc:343e with SMTP id d75a77b69052e-4f4abd4c1b5mr608331051cf.37.1767147587668;
        Tue, 30 Dec 2025 18:19:47 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac65344bsm252694831cf.28.2025.12.30.18.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 18:19:47 -0800 (PST)
Date: Tue, 30 Dec 2025 21:20:16 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
Message-ID: <aVSIYAC3DTD3dneW@rdacayan>
References: <20251230022759.9449-1-mailingradian@gmail.com>
 <7b1b0259-90d4-4e7c-8bc5-01e22c371e24@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b1b0259-90d4-4e7c-8bc5-01e22c371e24@linaro.org>

On Tue, Dec 30, 2025 at 09:40:14AM +0000, Bryan O'Donoghue wrote:
> On 30/12/2025 02:27, Richard Acayan wrote:
> > This series adds support for empty endpoint nodes. It is currently RFC
> > because it continues an ongoing discussion on how to selectively connect
> > some CAMSS ports to cameras and leave others disconnected.
> > 
> > The SDM670 patches are for a full example. If agreed on, this should
> > expand to SoCs that have CAMSS.
(snip)
> 
> I don't think I am 100% understanding what the intent of this series is,
> i.e. at a high level the problem you're aiming to solve.
> 
> Can you elaborate a bit ?

The point is to move the graph nodes entirely to the SoC devicetree so
the board doesn't have to redefine it. There is an explanation in patch 2,
but the next revision can try to cut some of the rambling and also
briefly explain in this cover.

