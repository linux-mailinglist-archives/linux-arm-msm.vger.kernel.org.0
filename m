Return-Path: <linux-arm-msm+bounces-82983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8BC7D704
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 21:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3DFDA34D2CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 20:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5F62C1788;
	Sat, 22 Nov 2025 20:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HAcox4cV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBCB286419
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 20:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763842023; cv=none; b=q0pD8JX2iN7Vyp+csedCJwLZQIfI+iXvrOWC0ncXMUYZ2JE70Q7Rfi1bMkErcH6fUxIQoG98hs17m6e4h4WvrsRYDxSgAvoPONzuc91naOwPx4NZ9AvY4FSeuQjjUw5tkKyRNT2alY+xI5/Z8yJMId370ZuMPpX6sdYbNEoACrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763842023; c=relaxed/simple;
	bh=BfOGTFe2RDdikzJaB8b7S+Xxbnvnlg0I6+3xBKNkkJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qrey3I5DJ0mgBzrhJE1HqDaVCjiuc0mRsqqyajqWMQHvqTmA1rjFCCfQGeoGaq05Z1AU0MytStAN8wemx9b3qHKGvat4rCPPc0iYEejz1v4jxbp2vTXH/e/hboaMxql+dMmXOjFp4obCvbJ8xZwXF0Eh83jrp2GW8S/4kMldMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HAcox4cV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47755de027eso16781895e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 12:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763842020; x=1764446820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=scbiovI1ofyVHzq2gs5GMumOlOFIE2l40+/m1mFDagg=;
        b=HAcox4cVzUyMEVfRm2JF8HPXyufZRNhwaGoZXGRk6CPfUX8hVT3uYeipPRrUiyjM+Q
         VFREQLw0b0d7XCt2CThqNG3/TqqNRhstGeXjc85jo8Opy/el66Ljy0G9NmG72VBbtXas
         +NAM09MLZoT9NhXhPPIUnWm+02WNJxvExd6yQIEx6+g9RMVsHOZYdA4afLBTjEfxaUTK
         JjCfuUt+G/Z7yIL9sDJidnu0pYiBPl5eGt/Dl4Db5nVL06IaE2ny1tEPa5Q390WQF63n
         X8+aK/NZbA6CJUMaCVj5C6U05UePteD4i09XXO/pzYaFU1icNagBxG0HtfUuUWLbBTVK
         ntFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763842020; x=1764446820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scbiovI1ofyVHzq2gs5GMumOlOFIE2l40+/m1mFDagg=;
        b=nF66AfD0nxg4KvyyrpUPioUA0mpPLO6VmwkxH7BLNppaMcb86t31UYXie8RFhqSWqK
         DJbuH+kBNb7hyn5cx/19Sbc2fYLkZ2sdIIt9TG2V23iqGRk6gwrAnyeThu1mqABwFjvg
         zu0sFOrt5MxLDO94Ih72AeYInVKmJw3djkKVu5Vm2FQmnkkIjFpULw8K8EiedvyDryBN
         CNLDVioHOmkRUn1kWrBL/HaiSVfbCOu4sxET8sza5fGh1b+E64TR7+SgaYI3FZ/JyILV
         m2z7Q6cDxPfZZBJNBEdkS8lAps942ax05aREwbiNv2YJ5cvAn67r58yuIZxnULaZ90sA
         z6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVRDBmq8XpqD/u0KCw82L0P9kO2FSziWntWwMevDMzWnysCiv7URW4hNXWEe63nwfJIiX3NkAT5j4USRMoo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2AnRASXV82q07HyGg6cUE/tjd7PV/iE6u8V56+I/xr2Gz3aZz
	JCqze7AduxaaZ360LV3nF+UQawZgub3SH9d+evj17Tw+74t60vzIYLhDdRzNHK/IKO0=
X-Gm-Gg: ASbGncsKZKfjLyq8MyZGYTJomVmervo79YS59Gv+u2TKeeeJAu30V/AqzPQbhif1NCs
	UYEy7abIzr5aXm3w4V5/Z63wsK04yG0d7zz0KATGtECZWINDesdKjRu/UXzLz1J1en9Wx5eQSaF
	MJTfgp8+sxEvCESUptgjLsrfD5IT1su7n92k1N7/AzvARFJsFVm8c80VaKdgz7fmos6ewrWCRhh
	NcRSVBrxdY0jbCvYJ+UJ5xvIxuywTYx+P0/ocy1oj60RZIWQHw5A4ozoMp6p2Xj7Gtko7onXhH6
	iM80a/uxAKejMOCgvE9G6RorYUCTk/jaxfMBqkPKfJORtMhlw3Kc/5jCK/K6EsARBIE4ol3apNR
	VwaHlt+YakmkqWwzScD+LV1dMV4Hlym/UPHypBGTtD2721Y/TVKGv9i928DcO5m7kq3Zf5jezNf
	abEXECCdM=
X-Google-Smtp-Source: AGHT+IEkdNyBisXIocC7/wQzw62k7sUipLUjv7aKHG865BoRXs3aebU7fEY/rhvatBXJb770s/EvTw==
X-Received: by 2002:a05:600c:a01:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-477c01f5980mr57357315e9.33.1763842020168;
        Sat, 22 Nov 2025 12:07:00 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18445335f8f.32.2025.11.22.12.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 12:06:59 -0800 (PST)
Date: Sat, 22 Nov 2025 22:06:57 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: qcom: Add TCSR clock driver for Kaanapali
Message-ID: <sskqfkm2ui4a44w2y7nra5vpdml6tqsxsyrahwvbi3f3tovfad@kql6fm3mwyqq>
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>

On 25-11-21 23:26:28, Taniya Das wrote:
> Add the TCSR clock controller that provides the refclks on Kaanapali
> platform for PCIe, USB and UFS subsystems.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

