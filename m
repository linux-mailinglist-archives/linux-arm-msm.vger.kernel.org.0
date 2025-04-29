Return-Path: <linux-arm-msm+bounces-56051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70749AA051A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E9793A73AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC27219EB;
	Tue, 29 Apr 2025 08:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kvNPvlkv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3996321C19A
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913670; cv=none; b=Q4MVmBczS4tMZWpEp0io/IlU5Z3kXNb5c4Cv8TGcLkkj1MLRSyMEf3KGubxdKFozmq/mL/y5ROybhAZ+1OFJeDkNHvOTnSTqjSsj1Hg+4gLneuJert0Spwi7atsJh+OCnSD+ku7RpUs2SWysptN6Wb6QtbKf8otQltBsgvJqLoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913670; c=relaxed/simple;
	bh=QhY1KbOXcusObIDMYCPNe5p99wa3NrdvXzFtQ6z9khQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTO2sCzYT//HxxSHEmnubwttFCxTjY3ZG9cOQ4CszgO9T/p7xBt3FYMliV4kEXGlT6MQCht5/1N4tkTz1ewboR3BtJ04EOc//AUMIAEjrd4ZfbCmfsTQnIBXfvT7G/uMtvml93LCe58RQ/J16OQPXFDVyV1O4EujtuY+nL6sOVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kvNPvlkv; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso6950925a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 01:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745913666; x=1746518466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OcP8IwBZTp5ar0JzK1kHZA+Mjpbv/cp21xOcbsfTYso=;
        b=kvNPvlkvcsgQjlqYjDLdsWF9RbE7W4fEty0R71Qai01Pvy4uftfhpoe3H9B6Pmf/6H
         XeYmcpQD6lKJCAOWRHjIyXqnRuHn9R7RlE3DkfL90zg6tlrILJgk+KFS9zce59Ryl8b1
         gsPG+LpvC+FiYVsusU+W4HrjXrtvDO/Hc0cqC1l1i8jRR2qsjJ2Okc12mlevZ7RzGgVP
         RmJ1hJY8nA5dqt3BwmmIuyYhCiKd/0joFXPpX9BkMsxjcVV5Ku60I8C/wL1xOK72570K
         ZWQiUaj5atQqe18UQOb3eVRiqeQLJPlKnrtChZFRlDaeYKh9sKHoSvUBG+cdgNH87DUG
         SmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745913666; x=1746518466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcP8IwBZTp5ar0JzK1kHZA+Mjpbv/cp21xOcbsfTYso=;
        b=iF2blcRJIGI26RKPqC0J0wtkBAw8bId3II5Mmu1L+Fgxuvbb6BZE6XZpWh1kQboJV5
         ZvNNQEdK3i0wp/BVSvzEwF9HpC0jztJ1EbxhdhS15VXDpUm97bwejz+1ItgqQuyfNerL
         5KBXDCahn89X9LfzQvdzPIQVdKkJALzBRL3jGta/O5ljcR3pVaSa76du4/xZjP47tygL
         Kky9CO7ecd4E9NRUv4HzkM/82J5Adw8Qs+iEeqSUUkJEL0+bL+dC+6ZxLmypcFfIJGIY
         nFkWawnFatTRK+FGh/Sh1HLQ0RYG6aXAZlD0At5pFqnZN+9b/KKfzhUowkhETHkdRS2t
         1ljg==
X-Forwarded-Encrypted: i=1; AJvYcCWvN3TUVobgcXEDwAW7/5y+XTkhgj+aLqBFsVtho0OHKQ+Zys7YbIVYhtIbqMYWTC+FCiGkA08+hg5EhJfp@vger.kernel.org
X-Gm-Message-State: AOJu0YyTXcpmti/n9jdZsgMldnBX6yXyBMTPccN3nPDOPXgFhXKZsPoF
	LThMM9y///JUlCtxTqAnKdCfnpyOFp+RLUTrAG8PBiSi5JJsM9Pgu0S9OkIf6Fs=
X-Gm-Gg: ASbGncvDgdswSzwbTUcnjpHR8yXDg92ZQkciA38hQU4siTb4CexOgZbyVC+qodll777
	qBbQvyj7LHCv3j9mrQ0H1kLDhytRzICRAuZ51n6xyDTtoNIn4hTbtsgpgjGqyC8MKSJZab47MbN
	a5U9TA8iH07pm46RxOC1RbnivtdNZ1c81PrJmJinBwERTHGpHYQ1NDctQtyIEh3eEgWQf8Fv5CR
	quOeQLg3pK5PNL3BZ+tgEgWDostZolTbSjYWV63BnMhC3NLLNMqQ5oe9nP2oZzDzlxwt3kQHc9A
	keMOabzWhsxWiqkEf3H6wq7zxB5ONJ5VvmRLHQ==
X-Google-Smtp-Source: AGHT+IFm4kes/ECJKNYrt/xy90E8GMVdR2nV9n1atqpFxaZl68uKF3ym9CxshxQxaw2r6OwDCG0aWQ==
X-Received: by 2002:a05:6402:90d:b0:5f6:fab1:ad81 with SMTP id 4fb4d7f45d1cf-5f8392893bdmr1936597a12.10.1745913666492;
        Tue, 29 Apr 2025 01:01:06 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fc361sm7047370a12.16.2025.04.29.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:01:05 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:01:04 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Qiang Yu <quic_qianyu@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-pcie: drop bogus x1e80100 qref supply
Message-ID: <aBCHQMs8Ct8Ow8JR@linaro.org>
References: <20250429075440.19901-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429075440.19901-1-johan+linaro@kernel.org>

On 25-04-29 09:54:40, Johan Hovold wrote:
> The PCIe PHYs on x1e80100 do not a have a qref supply so stop requesting
> one. This also avoids the follow warning at boot:
> 
> 	qcom-qmp-pcie-phy 1be0000.phy: supply vdda-qref not found, using dummy regulator
> 
> Fixes: e961ec81a39b ("phy: qcom: qmp: Add phy register and clk setting for x1e80100 PCIe3")
> Cc: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

