Return-Path: <linux-arm-msm+bounces-69890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A8B2D6E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 10:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC6354E2A10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D692D879E;
	Wed, 20 Aug 2025 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofYFmVYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA30A2BE65C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755679190; cv=none; b=gOpGNCW44VPEJs8Kzev7pogrvuiHoUrz/5zDgNZuomQWZdXHQ7NczOgLQ1LmfL+GBJcu5w7qcOjet8O8kISZvUpVgniURjCbdBkOrAsVQyd+tA4GtlvcK5SXcktqqX5rCAEflrz6abIbFH5TydJKZi3p75SklXmN5f+nvEPi+sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755679190; c=relaxed/simple;
	bh=B5Odn0BpuqAx/zQPP5UfzrjrGTX8wxfSsyNahtVboZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmmv9CKCkWL5+r+6Td7c7GqeNgz/ICXGL9X68P1HucAugWZor3UFiMmt9iGry5ojlF/N77GOLAvpuugw++D/wyiigmzJcRRey4q6YeAxm2z+rg4P/CYceGAw7XoqEkkJZWjYZTtx9hlJqj4pzsTzzLdIDLZ6FgDVZNQA15yOxuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofYFmVYq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9e4148134so3096936f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 01:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755679187; x=1756283987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IfdcMs0PNyVozDxCFB7NWyoBaP2B6WgwAVLq6ldhhGE=;
        b=ofYFmVYqIz7TnLyqS3oui/I6FgAZ3uQL8D60Gd5HHy8UsCMuC6fgQZKfdFGQipUPDL
         RJ/L3lTuYfFEJ3oNwyW4bDZvzuuB/CJ2DsXizq8qb+V/UdNbBKrMzGF2CkvCN3am2NlZ
         riHGA+mO2rGW/ZXpZC3Yrt7SaPQAZo+EKu0n74OTJkcdxDHSpOM9p60b+9q6lQnbwm1M
         7Aj2mlJt69N9sdDqQRkKRoUgpIRkTWkDX3iqoZ6N/luck3SbwQ+O6DeuB6ll5hdBYpi9
         qNKNRkqDty5aQHU82EtlJcJN5w+0RsZKOdBID7Ha/b1dBzomum4e+Y9tmR8SHGlNkpV7
         6TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755679187; x=1756283987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfdcMs0PNyVozDxCFB7NWyoBaP2B6WgwAVLq6ldhhGE=;
        b=Z7HJjyqJlb1X+CyBTca0oU3hIQRnAAyt6ndwOgrCfW5EGdqCqtOI1pyrxnwZN0xmBS
         5jmyPqvH2ZR/LMdvjZkBehXh4IlLJ+XzzyrrXJOpRch0QK15pScQGJmlBgUE3JgXU4IH
         sbaHYnUMDAr02yS0h4NvQSqtOk7RhQH6zuYxom2VlOk+oFoZTJmt+/4qsg1VpKI1wylg
         MrqY0SauqHC/RN+Zur6RpjKVtyCsGh7UMbhwIRmXHXAfqmHIqzogi/+lqNT0BLUp5a8l
         XPiqscDxf+BW6o8z1zYKdyireUanm+az6t6+PT7Z/FHjo4zIdfb7wQNqmiMuaXIGDeaD
         0lEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFecF4bp3EvzaETBwBFZ4fkW5T5FdIxUcuVqdbNsHF9DekFpDsr77DlPWpIADiI5Ju3CKZzvJ5I10X5WRY@vger.kernel.org
X-Gm-Message-State: AOJu0YywGO47IVAD7bsjbtkedHFIjNQBI5z57PKmH1iRmgI+Hn/SmSSo
	LO73U60NTM6T6ff5LzbBAGPoYkuH8z31fqb1KhWyzAvQpCjpHXcpz6h3B3u6nIdPedo=
X-Gm-Gg: ASbGncvvHCgAJ2Tn3uJ5E40FxNuwdpg/1zoKhgREmealUv0ZvPIeRixgyBrIELVMgmT
	2xT1fLTMaldHdehr73LgzJesunZFfbVbJeVmIuudDVyvSlUv6sF8jtgGMNHf18HyKWvYDizn7bX
	JITCFftMWRRfWf13fRSEZWczL5zvGjibcX1tkmvG2oFvuE6YdTIGar01L5fmkmNV1RexCWF0S3i
	V26HMcHTFjWmIKsK6U3C5Fd5vpdyQTTjZaL/lcoZMPoDTjW3FcYwi6/RBORU57nLzQgn5FX1CzP
	6FaM7UX2NSrqPt1/Bs4DriYgMfN1h0kIwSvkbOEauxga5g9C9RBTR/q6dQmoTheVzx9Rxvq95B6
	WeGnvteupVMDO8ij1gtY=
X-Google-Smtp-Source: AGHT+IGJauwKyrl57epN9GYL9wKpPJYYPayxZn61Gui1IwqTxzG6ooIUmqPZFZG1hvz5cY1leyuB5g==
X-Received: by 2002:a5d:5d0e:0:b0:3b9:1684:e07 with SMTP id ffacd0b85a97d-3c3303dbf5dmr1187908f8f.55.1755679187055;
        Wed, 20 Aug 2025 01:39:47 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789106sm6850315f8f.51.2025.08.20.01.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:39:46 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:39:44 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/7] clk: qcom: Add TCSR clock driver for Glymur SoC
Message-ID: <aKWJ0AG4r6owg-O3@linaro.org>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-3-a408b390b22c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-3-a408b390b22c@oss.qualcomm.com>

On 25-08-13 13:25:19, Taniya Das wrote:
> Add a clock driver for the TCSR clock controller found on Glymur SoC,
> which provides refclks for PCIE, USB, and UFS subsystems.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

LGTM now.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

