Return-Path: <linux-arm-msm+bounces-32523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1512A98685B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 23:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7712B2841A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 21:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274F4156872;
	Wed, 25 Sep 2024 21:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vpHxw83B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E61465A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 21:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727299906; cv=none; b=EPfCYtrQTI14V12UjgXHdEGUUzMH6lRwsn/AZnhqLlDJIAciFY4EOVkL5jVDnTyABFR7MULfX7ySZgsd7owLBKrIPXysi5WddbZelQH8C4q2uVo9csy7DOrLJgoGfIksi1hHfUqKxZRVI5puQyUrWvAhqQfuutxZIHITUBo3i4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727299906; c=relaxed/simple;
	bh=q1hnfW/UYENj/VV96bgSolK/g/2vdQSz2wVyhQteCPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anAIo20GOPcIHSdNlfjUw7yB7AGy9YgEbwcU1/hcr58sKCXf43tmtRIiWbK43A1unpXE2KqLIuXbUxMu28M+/slSsYt8oHoVMMnLxyxgL2veUnPIlv5Y5oo7DYbypllaWAOHxe2Zk/GosGV4jAueZ0pTXtXEh3S4N+MNe4oFuf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vpHxw83B; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5365c060f47so366975e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 14:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727299902; x=1727904702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2gRWXk6um8ssZG0dTYz3h8O6sPux+vtNyTeziNQM+4=;
        b=vpHxw83BEcxXUiXAHcwannMowZ5Cp/Zm0//e9txywTNF+VvbYNu8F1jTKNov+mH/Ns
         5hHQflIjhKUl5G/IPTQ1QlYBoyLU+pl1Qt4Mx572kqq6ImpdtT9nvn7R1iEEZdIHMOxB
         SzftUfPVRDvh/dh4iGooNg+6fQdfSwKqC2XOKsnIbMuGDmC0MWWgUrNTgHl0q+YB/QjH
         E6TDD2eqeFktH3aKA7aTMaEBEEEm2Bnp4OTeVI5cdWgWqIyT1MrP4YYAq9UO8Q2phjMl
         Cl+YWdmPf1FQZtaE2nhr2VGc1ZXKepGxtu0tMXMKlhUgIh3yLSandXdoVQjX1kgBeB6r
         TSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727299902; x=1727904702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2gRWXk6um8ssZG0dTYz3h8O6sPux+vtNyTeziNQM+4=;
        b=bIDl29wltzUUvWFuoE3pnr4Wz98BHuYffbkeAhnW+SJuJeDw90o6gBHTl0omoj8od2
         nmkFr7Fd0u2bSAaXP1MG4xE9Ejztau1+S1GlSUHY0rSNkASMroKujZLAuyku491juErE
         kIHgykRGM6A1H4MvtH8f0pCKbMTryG6KqC/t9lhyb3d5LAA+1n8h+xFnPgU822bkIVuY
         dN2rktYJZroSC8HPsFZVlB/C1G/cR0pNPgLQMXCrzBCNs2sERzDqOyjXO3Nzk2no4ZrX
         pDVx14CwAECupInTRLjf6fNvpVKeeo810YuknE+7pKX6MUUjGqhSUJSzbV9HVJRQ+VT+
         Ku9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW40samZT6IlfUXqejEcXilldLgdkvzkcrhuZNWo9JZhwdwXSO2xMOz2U2Ygcu16W9JOEpFKeRuCVlKcDvI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywikfcj6aFnMCzoy8Y/pkkRCGIOv6JVwJ+n24y/feCbBe1Z+nHz
	sdBM00MByCLl43I+BG9j/01IAj0Cn2+ANExGI6wuKXs9CPMbuujpTi/ywczxsqc=
X-Google-Smtp-Source: AGHT+IGRtxkMp3x13jBkNmqIgOxnVIpZ0WovylKJsjpSzFGlmQuJwR6WMxOTZoa6v7kxp+tzwKvB6Q==
X-Received: by 2002:a05:6512:3a8f:b0:536:536f:c663 with SMTP id 2adb3069b0e04-538704986fcmr2778800e87.22.1727299902152;
        Wed, 25 Sep 2024 14:31:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a86408dasm623111e87.144.2024.09.25.14.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:31:41 -0700 (PDT)
Date: Thu, 26 Sep 2024 00:31:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, neil.armstrong@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH 8/8] arm64: defconfig: Enable IPQ5424 SoC base configs
Message-ID: <h6ajhgv5rqabxupove4ge4253ywzbjyxoqq75c7ojmauudd3z5@hhhkbbzfmved>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-9-quic_srichara@quicinc.com>
 <4dxqbm4uuuuht5db7kt6faz2pdeodn224hd34np322divs22ba@dzmjveze3b4f>
 <2a16d5a2-17a5-4988-8a25-34ac10ff3d08@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a16d5a2-17a5-4988-8a25-34ac10ff3d08@quicinc.com>

On Thu, Sep 26, 2024 at 12:34:56AM GMT, Sricharan Ramabadhran wrote:
> 
> 
> On 9/13/2024 6:23 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 13, 2024 at 05:42:50PM GMT, Sricharan R wrote:
> > > From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > > 
> > > Enable the clock and pinctrl configs for Qualcomm IPQ5332 SoC
> > 
> > Please name the device rather than the platform. The defconfig affects
> > all users, so it should be justified.
> > 
> Sorry, to understand correctly, you mean to use the board name here ?

Yes, the board which is generally accessible, if possible. You are
increasing kernel size for everybody using defconfig, so at least it
should be obvious, who is benefiting from that.

> 
> > > 
> > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > 
> > Usual comment.
> ok, will fix.
> 
> Regards,
>  Sricharan

-- 
With best wishes
Dmitry

