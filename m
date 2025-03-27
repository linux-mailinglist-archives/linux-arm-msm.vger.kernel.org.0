Return-Path: <linux-arm-msm+bounces-52589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 026FBA72AF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E718118974DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 08:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9971A3A1BA;
	Thu, 27 Mar 2025 08:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCYdEoUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1862E3361
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062486; cv=none; b=I4TG7aSY95zTFlmc8pS9YCpFvLq9CdWFwZtYqL85VjLl3U2iGQYwYSZZQvYVb6JYCgs+vjz6n4Klj+Ex9tJYJr/I78a4jGqsF6YDIVIpak9Y+dJNx950CnAK9mPe14qxmGK0LY0TO9Q50uNrELimvr970m9UpIDOgFXsq09yUh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062486; c=relaxed/simple;
	bh=kvCsp4ajSClfM+PQkPZ6FRU3m9/CysSi8g5CRuV/xIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmLQNpHV0E2rn7sE+YkZ+NpH76UwX/dmDxP+VNuwTj+o6rjE7GADVdSoIqi8nCNKykAOPLR63SqAyD0L/KMyFIngmdjY5AuR5GkjFGSwGr9o8TcqLhcZZRll99HVvGJrc1NY2HVwQy2YWftkNeYTzrom2X0GmhSb5ZLv0ocBiDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DCYdEoUU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac345bd8e13so114968966b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 01:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743062483; x=1743667283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a531H04jtlfrLiToQk74ZzGWSJg2ofCUbRy747MJx2A=;
        b=DCYdEoUU/CmihWg/3l9WLPe+h32NAXC+N6tNlT1YzsXCBaDsLGeAr9G0opCSqIyOba
         qqXuLlAm4y7v7wv+Aa4PpuwXjVeKCV9FRPX0UtYRJFwLrVbUpsuoo13LI+KdRAdgVXgm
         erkTZMGrAGkcpHzkUxNb+PZcWBm71HgbXOm4jG5PCRMRdwBWyx0cc0EF49irttV4b0Di
         7DndTh2f9N7+f7J9U0O02UA6GtN9o3oUs7vjsPqxPlRH4z0hYXUcqF+2YrhBANR49CvS
         1HFrkh4zKns7MqFUBZ+RgWZuDJ9STrJI/VdEEyJz6hMo+xGxfJNJWmqVbpDo2diTO1wa
         C7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062483; x=1743667283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a531H04jtlfrLiToQk74ZzGWSJg2ofCUbRy747MJx2A=;
        b=K9bhRpzGYTxTfGpq8FSef45yYzEUzmXEp0C2s8cjU5LoHJLCod60+FDsJH5aX0PWS0
         2xye1Njs+wXRDI3Lrd49TgDJNy9i4jsNtclQAduqzEtEu21NJqu0bcNlrXcr2is9xFPb
         Kw1pmyVxnjQFaLvFDm1LUTw/A9uAn+KOi6WkNM/hJjdLq9EK8kzPGoB6+vg+So2QbVxH
         +FDxYk7aK4F6f5z8OFrFixAys/XRip7jnmIlG059wmdnQ/nbW7XjGYfsY+0l/yx0BC1i
         gbDO7qEGFESGD513vBH+uQLw8xRiYDOD5kwDOT+I0y1Q/eVDMv3OudVhUmtQMcOXhfT5
         sIpw==
X-Forwarded-Encrypted: i=1; AJvYcCVfJT0z5rYijue0+9J7DZOg4IRrJziPGMdTmqe5Bof//550qbvv/W894phcQTmCBI18WuH4F/kw17WBsdQA@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfRiN+2C7Hw7u5zAs5/Ri4/ch8ajwepXO2WvNzPeqaMKh7x54
	MH2FX+wTjOEtkASSPMfhA/qRbhe7soboAGskeFMG03TpbEQz2x5lvKNpoda6JSM=
X-Gm-Gg: ASbGncszFFZvtmIX6g53Sy+B+9nmR9JxcGmzrPvxs4C2MxVPedBvAnYHA14DG1pL2tM
	A0cNku5qpQXOaKimOuaYZwGgjg3GxPLYQXOdFY0alraJtOHoClknko+lI5GEzUMfYLXoBiVKtMH
	KDFMwzVBkrwO0ULMfDNcSkn8GMTtknlslYIJET9c3yrtZ5o4OjeR9oDkE474EImVru2wkATJTtw
	88TBEfXHpSpwaS9nH9LBA4NBmaFF5+Ci6fojrhdnKQ8pjNPBFnJAHzw6FfBKpgQ5zX1m9vnNXgj
	TWYgrGTmaP3MLnG3IzgFtyU+9/kxDR9+ltj54Tki4w==
X-Google-Smtp-Source: AGHT+IHlAyv/3p/10wHnvPzRB7knGR5QL1WFb/pxotTJbUre9F01yQVEOy4S9yoXSBNRVr+2aItjgA==
X-Received: by 2002:a17:907:da4:b0:ac1:fa31:78cf with SMTP id a640c23a62f3a-ac6fb10c230mr234152366b.35.1743062482933;
        Thu, 27 Mar 2025 01:01:22 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac70c6828fcsm58131266b.93.2025.03.27.01.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:01:22 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:01:20 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink: enable UCSI on sc8280xp
Message-ID: <Z+UF0P5HHzqwejYc@linaro.org>
References: <20250326124944.6338-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326124944.6338-1-johan+linaro@kernel.org>

On 25-03-26 13:49:44, Johan Hovold wrote:
> Commit ad3dd9592b2a ("soc: qcom: pmic_glink: disable UCSI on sc8280xp")
> disabled UCSI shortly after it had been enabled to fix a regression that
> was observed on the Lenovo ThinkPad X13s.
> 
> Specifically, disconnecting an external display would trigger a system
> error and hypervisor reset but no one cared enough to track down the bug
> at the time.
> 
> The same issue was recently observed on X Elite machines, and commit
> f47eba045e6c ("usb: typec: ucsi: Set orientation as none when connector
> is unplugged") worked around the underlying issue by setting the
> connector orientation to 'none' on disconnect events to avoid having the
> PHY driver crash the machine in one orientation.
> 
> Enable UCSI support also on sc8280xp now that the DisplayPort disconnect
> crashes are gone.
> 
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

