Return-Path: <linux-arm-msm+bounces-62437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFC9AE81B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D52D1168D03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C6825CC7B;
	Wed, 25 Jun 2025 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dr1Y25Xh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52CA25CC44
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851630; cv=none; b=YQwWah3fBFyeWxB8FnRq2ow57gnaL1x6fpMClwiNpiaSGBZ0bAh8ZpDvS15q3ep/RO3Va0NPNC8Q3gHRBNVxCZgM9a4RU/jtVrHdj2oUco/IiKoh/sxwaAReHW6wWVj+UdpYJiuZJ9Brb6BgdJDN0d481ZqqJfTZ1IGo8u8s+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851630; c=relaxed/simple;
	bh=DDsaWEyFeHz75TetdwbTXXC5BNl+pjLGrj08BQxMqQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHmt9rXqNYHcYuAJdqP2ViRJDleFaohuSFzLD4qzSEve1R2uCgXpKSvtdJ5/v5lW4DM8pdqQ3gzQowrFNNWQemNdD5MnwajlwHZAfSyVQPOSjdPPdp/Y8jXmW5UhIcL4f36okpxZ3anun7FYVUJY+iiyhRaIUzUn0dc0ev8XK8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dr1Y25Xh; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so14345366b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750851626; x=1751456426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ta2U+QcnogTft9XpE1aWdMlfFtTXMxtf8HD/ZE2i+8=;
        b=Dr1Y25Xh4kLGK9GU252HU3sBWF0eoR3UAXOGdTVYkh8TW/Wa358NEui8zxYj6wheqO
         j2coi9sUpACavpZe8+/uiwLo/fcKhrQ4rqO1UGuuWjgbBCFRphPRHXnQHA/+IsiAUhBt
         XNZe1LgqGjqxUP7Klt8iX3hk0vanKnRTx9C+aGF4LeOpmNHBpSfNIR1oAW6JRrytomUW
         xPyd8GdOiu0wW/03891BW6rvMy9b+wTKooK1xXvcO8uSru02IrAYlsZ+fedjlPubixK6
         75r/hx39rvcP7bSPy3lPu3GINvcB3m1EZni7hOMm7JsMXAdChAkiDKeIdibfZNHVzHtE
         3tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851626; x=1751456426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ta2U+QcnogTft9XpE1aWdMlfFtTXMxtf8HD/ZE2i+8=;
        b=bCDtIAKjBF0eOeL5OO/sAf1/ojXZQBqKWxHLGj11Wl+kT4OPvex0EsILNO/Zr2C3WJ
         gfcrJb3ZA9SZj+x9knBn7+br1Hz7jqF0iXv/indxZCmX3fo85EfRpGSHUWESk4cl2eG/
         SlXb7wZVzRPfonSI1c+TTw88QKallUo7BrTUOZldyZOhhC9OALr4eOXYGbe/VJXem6DA
         w41uV0a73mTfEIcTOn8Di1Nl2Qre8z5NnhF3WTo44gC000oGhyQEP/zPE8hpEqUkgXZu
         no6k+ueGLELNEYyyNTiQ/z513fN1GYLib8b4dacvF4xnHE7bjYIeaC5B6I+YccCNgcPW
         qXPw==
X-Forwarded-Encrypted: i=1; AJvYcCWVUbXtpzSMAgQgpG4OqnP2FqijdlDNjv8hIVaVexPqe07Wt7TAA4DoAFjdSZAdmZkUaYOEYEVXL5Jn36fA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn89HzmuskDbkCAUgbNtPoZP5/fDD9hGqDO1ohi8er4vxQZ3G5
	yospS/LVeX27/MJgoLTBTu0wX8cd5Q1MryuJW+isOLwjAXZK1NFG5WAnZWpZLD/1aZA=
X-Gm-Gg: ASbGncsOC3jblli433RdnLZvDoAmRMc5SUc4bEcySU1XsXdh3VBrCjHQ07ntnHMQVhV
	RLSfmDOUXVMoCrQgfU+4Piwwso/gkpfFzE6OpqxnvgThkVRMWm7MT3RJfGE9JUuC778fYfKga3K
	EMji2Kz59IYBRvXktrzCBizC1ZdFYauIzl7dxBYlPyl0GnClUZVKpAR+K2vBoT4X7LYn2coMzW4
	TbjFl3DXbGxbh5mXU1JBQRRFC0k3oAT0PzpQSRI5YSYGI+fRCJNqh2Klja2dBDw5u8LWesAAwRI
	Y+C2kfrHyMWMZgX8+K8YZ6N3btb1HtUZBzMbl8Wg6HoseOpWVTyLz7GdQsTL8ephHaUiBA==
X-Google-Smtp-Source: AGHT+IGymkDJa2PepqWKYweFBWWgXgdsKbBJ6SsAwFL8JIz/ma8KQ3iqRebiC+IPQmWTbUJCcGFyWA==
X-Received: by 2002:a17:907:9482:b0:ada:4b3c:ea81 with SMTP id a640c23a62f3a-ae0bef1b3f1mr265885666b.39.1750851625821;
        Wed, 25 Jun 2025 04:40:25 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b1b1ba3bsm235787566b.93.2025.06.25.04.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:40:25 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:40:23 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] phy: qualcomm: phy-qcom-eusb2-repeater: Add support
 for PMIV0104
Message-ID: <aFvgJ9euu1RwHXl+@linaro.org>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-4-19d85541eb4c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-4-19d85541eb4c@fairphone.com>

On 25-06-25 11:14:59, Luca Weiss wrote:
> Add support for the eUSB2 repeater found on the PMIV0104. There is no
> default init table for this PMIC, just the board-specific tuning
> parameters are used on top of the default tuning values.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

