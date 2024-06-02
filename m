Return-Path: <linux-arm-msm+bounces-21400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B98D73EF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 07:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37EAE281AE3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660921CD2F;
	Sun,  2 Jun 2024 05:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dEEdMbWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F151CD16
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 05:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717307371; cv=none; b=pnUMrUYDg92HeL/sLBDh2WxQ7B1KkwH7ePktAuuRBVfTRe+v3kLVlkW/TkHPQW8r6Ovui5OSxIZHXl7xmiYQcicTpuIu3HkMgqHZdpYrQNJiekhqxYHQijzlIJp05j8fTAX+Xq6CMT1jbBZpDdL47CWRv5IwMgU/Y3X+2gvu7rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717307371; c=relaxed/simple;
	bh=S5zfxGoD0u3tBX7WTi3pbIcGb/gN6RB7VM+Jl3fS25I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEVKlScuOSoh1uf7KIMKx4yo5XCLYOudSmBwCpHZhBclC2Yef3k+3m7y+QiO8XXynnrhpGld64TkRXfmknhi8JjjniA9kDCBdP2LiEQGsmNoD2VscpssihV21g0UNxf08SklZgeEFfnY+39eQHhnktNoIT4vHb573PCtosRHKfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dEEdMbWH; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a683868f463so238381366b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Jun 2024 22:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717307368; x=1717912168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MavawcbK/TMPV5EqBDmNojVHFfhCMUbwiSiZcjCdMBQ=;
        b=dEEdMbWHS+2xmxBJq1iCKsZL5ym0dBkkGPP3rMDfiJzHbZc0oxkh4Irl7EPJ5brIeh
         XPaoya6KEp0abSP5ZjTilqeEjDASXUUt0VVL/ptQiJXqrzboi6X7NVmT+itW6/mVtZHG
         05HlaszGSgUKrfhCS3DCA86v+StMwXbqreZuUWafT8YZQMXQRlGs0r3eoJny8ycri0AB
         +9NxBsWLxVTyn+6fetRFeTKxYqc5gW9+IklMz23cts+EcQYEzEpuHLQsA1A8xHdYRb9o
         WsYReFcih2r63lju5c5YzobZZTl/ON4PjMRCV1UY7wynspedlQc19RQ43AffdGhEJJHS
         FFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717307368; x=1717912168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MavawcbK/TMPV5EqBDmNojVHFfhCMUbwiSiZcjCdMBQ=;
        b=e0gZMVcgBjQ77HmJCm7457uEnfA9/PPpsus62BlS5o72dAQAb2XILw4AgUUKa3Gf8U
         ih9UQmEnSSVcYDXvSny0VmPt4Rmv+35K6R/IluqIX4QDs4f3imoTPmfaDZ4BqZ4TBCJp
         TigF8lRuz3jmI5LzC8mTTXhhhWAlaFX+WUyhpBiFFX0NSBA6AgBFpMl+45mlG0/Qg0T0
         p/nVsUH2aNHXxgTP8wjp9Jy+oE0Wbx0gB8G0BxnaEAYNNgAok7+I8LrhwUAaro1vskNW
         6sp+PiPPPnxmkDGqMwGHUf4+4l+m50wNWyYQ1hZjEmORincclQHcBkOX4Kr348WRmfED
         MzUA==
X-Forwarded-Encrypted: i=1; AJvYcCVYP0DqYIHffvuPOMV1ZIfyXNiHhTxKzzp0GfxGws1koHOeIOYzyuknGkWf3LLW4Tcszx1ACchYR9DAY+K/M/WCWIT5IkyAGI+KgMriRw==
X-Gm-Message-State: AOJu0YwVsE4iYoQ5Ma/ao2ZRQO7ymPzmTdnboc1Nn8zgBIdHwGuDvU+E
	IslkP45uOk+YDxf+/1Wz2OsHhT4wvyi3/9XcW6aEaaoR9w0py4r9p0ARz8Isvh3tFThYqIv6Td2
	N
X-Google-Smtp-Source: AGHT+IH9FF9p3WS/bkS5Rwx2qGx7t+VkpS8ZMjcquQyTyU410/RKXSXcsKTTlfJmJ9PVRV8OGp4U7Q==
X-Received: by 2002:a17:907:119d:b0:a68:6c51:f571 with SMTP id a640c23a62f3a-a686c6138b0mr374437366b.74.1717307367772;
        Sat, 01 Jun 2024 22:49:27 -0700 (PDT)
Received: from linaro.org ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b4b09cb9sm156347066b.178.2024.06.01.22.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 22:49:27 -0700 (PDT)
Date: Sun, 2 Jun 2024 08:49:25 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-qcp: Fix USB PHYs
 regulators
Message-ID: <ZlwH5aZ1CwDnB90S@linaro.org>
References: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-0-6eb72a546227@linaro.org>
 <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-2-6eb72a546227@linaro.org>
 <fjawzjf5squniqse43r3xwshguwhcg5ofqzcjvmrn5v2ji3e7x@eve4fhsftnhw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fjawzjf5squniqse43r3xwshguwhcg5ofqzcjvmrn5v2ji3e7x@eve4fhsftnhw>

On 24-06-01 17:58:19, Bjorn Andersson wrote:
> On Thu, May 30, 2024 at 07:35:46PM GMT, Abel Vesa wrote:
> > The 1.2v HS PHY shared regulator is actually LDO2 from PM8550ve id J.
> > Also add the missing supplies to QMP PHYs.
> > 
> > Fixes: 22b82135c02d ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
> 
> This isn't the right hash. I'm fixing this one up, but please check make
> sure your fixes are based on merged commits.
> 

Sorry about that. Will double check next time.

Thanks for fixing it.

> Regards,
> Bjorn

