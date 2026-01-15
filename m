Return-Path: <linux-arm-msm+bounces-89099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D336D22619
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 05:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 206D73028473
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 04:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33B02D2491;
	Thu, 15 Jan 2026 04:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAqV74t/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F292C028F
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 04:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768452646; cv=none; b=m+hlX3pGxx5ubPbkuKUpLsAMT5QRr57Wpis1UiSdxI2tSqNa0VFMnUc9ll1bU23MkCUR7DdHO1AnQplo1NQcfW5UymtAmgBk6SCV8Av/zxVnDW95NSNE4oz6G/DcdNkRjSnSv86WQfdTqysLpc0uPUvBbopJf1ZShVFws639qVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768452646; c=relaxed/simple;
	bh=bwH7TKQitdKzloCZTOTMKs7FMvbuDSsPsScuXO2XnSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DYSU/evCCIqzkXKJnAHRgLQRFeX/zYRnA+rDv1fuYPuhEXfpHWsidBJgjpFzQKDyUoxVXgLbS9TiBro/dYepiWf2nQ+9C9FbAEfQ3v7WEmDb9DDd5qVF2L6rNPtBa7GhHE5bMfcXmKHoUVy/tLKn92S+5DsXKFLcwg502HT7NKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAqV74t/; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3f551ad50d1so172045fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 20:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768452644; x=1769057444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaxkG3FjcBbVuAmcMeHgDVclONwI7K7qJ4Bb/eS73xU=;
        b=VAqV74t/w3hqcpKjdurhyCLdERsArrjqT4Nh7ItvYgIORi1xyGz6fnccOymsJYnO4V
         HUAAdkaLwnEOoDYkapMZEsrDOruvgYHBj8I0lDbmAAG+ddByUstdzjnmnLn1ycivhusD
         sTKkUZ2N2+pDlinagoD5mNzDjZS2MVofA4Em1tE+0LY/PnV84xn7DDfZwqy2tM0RKue6
         TOOTvICAZfFAnJm3hbjS+apTERfDw7KcFFJe/NxnamvrY1whsXqHLx0MucFIdKF2vX7O
         QwLCuSRxYtRIoBhHxFjMyJy91QEtxTiVGUwEfVSnDeHodnz/YkAKeIg+oE0dTXmgEAPD
         Z/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768452644; x=1769057444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gaxkG3FjcBbVuAmcMeHgDVclONwI7K7qJ4Bb/eS73xU=;
        b=g1dLpf10RC5c/6tLlNqyay/fNkHMveb+pI27KRmWi8ddiQoGNap1pGdPBkjWsFbYmO
         mOl9eGhvQOeSk1mJwrrqRgTkhplu/eym32uLBTB/q4/7ATztS9GWDpYoCokEAalcv1mg
         byq8kMgGupk0X4GYRm13p/AQKB7c8BKoZxns4c84PdNcDd0A81Tn3arQ1JW0Z+DvhmDS
         PskkrNVEqzIP91I9HlsolvJhEJneZzl7RqqanBxdOdsao6/FAtxghonmjiC2XnusL0z9
         CAnYybIki5nnh5pzIi8IDdRWGEgyux+IsVezg2087wgRZHwM8/9QXmdNz61c3gWtFODn
         98Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVsr6AahS4vrhQDxG6K8zQY90tPAfWVSu3WKJcrjQjQF0L223rwzsi8Bd1i2GV0Rd9aU9wAos2QkOr9Ld9d@vger.kernel.org
X-Gm-Message-State: AOJu0YxFhLo9PvdxMVaCWNjexFBRDpIdBRUiOgTVY0r38zcDZrmy3Stz
	RGyjAyiv3ywWx/Q5+DyPXTXlVgRveRTvzomgKaZuAqmojileRzsnA0iY
X-Gm-Gg: AY/fxX4SstRHTL6jJjtrj59TUXXY3bkUlfIjicNVI6zyrURevxS5bxGge2S5uY0Kc4y
	qgkRI7j7xJ2Z1TxgfjH5GtK8nQSruX3bWIY+C/8nYvERDlNvfNkaX7uMIbbZpolpR7B326xztH3
	r0nT8P6Wsq4fJepDAhBigjnYVFTcP/Lkw/n9Qu69lI5sqqVvMMQs3xRz2W3MqscQpyc1EED5IUy
	MbxWS8RE3jYM4Zkfw36BHfrHrefFL37hyyqMdexi6YcrEiRTYCt/n90V4kGayLNTjIuvxz8MK14
	cFeElS8svH4IlsdzqSrzEJfcTsMGS9MuPrdwXjA6F6JD2342o3i2i24hMMSHtgIl5Kl2ix7k1Ob
	aJnPai+o1b4g1oswMET8QEkf2YkNNLHYrkH5PXAaW/IPMnelHxOaCSrbPFL8hnRt8MVO2ZJIVCA
	c9HwuwWkKHCynyq3irRCNgJTmcDaPTgkqULfv4xX7s7yQgJchPlpddg0rZNhuiNGISh1uW5CgDy
	TxgRx87MMkA1BHUL3XszVgXpyODowc=
X-Received: by 2002:a05:6870:c0c3:b0:3ec:4266:13f7 with SMTP id 586e51a60fabf-40407197688mr3586919fac.29.1768452644055;
        Wed, 14 Jan 2026 20:50:44 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4de8cbfsm17750746fac.3.2026.01.14.20.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 20:50:42 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574 support
Date: Wed, 14 Jan 2026 22:50:40 -0600
Message-ID: <5206383.iZASKD2KPV@nukework.gtech>
In-Reply-To: <cfa31127-2208-4c65-b8ef-3b5d534e050b@oss.qualcomm.com>
References:
 <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <4814455.tdWV9SEqCh@nukework.gtech>
 <cfa31127-2208-4c65-b8ef-3b5d534e050b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, January 13, 2026 11:42:45 PM CST Vignesh Viswanathan wrote:
> On 1/14/2026 9:24 AM, Alex G. wrote:
> > On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
> >> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> >>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> >>> driver. This firmware is usually used to run ath11k firmware and enable
> >>> wifi with chips such as QCN5024.
> >>> 
> >>> When submitting v1, I learned that the firmware can also be loaded by
> >>> the trustzone firmware. Since TZ is not shipped with the kernel, it
> >>> makes sense to have the option of a native init sequence, as not all
> >>> devices come with the latest TZ firmware.
> >>> 
> >>> Qualcomm tries to assure us that the TZ firmware will always do the
> >>> right thing (TM), but I am not fully convinced
> >> 
> >> Why else do you think it's there in the firmware? :(
> > 
> > A more relevant question is, why do some contributors sincerely believe
> > that the TZ initialization of Q6 firmware is not a good idea for their
> > use case?
> > 
> > To answer your question, I think the TZ initialization is an afterthought
> > of the SoC design. I think it was only after ther the design stage that
> > it was brought up that a remoteproc on AHB has out-of-band access to
> > system memory, which poses security concerns to some customers. I think
> > authentication was implemented in TZ to address that. I also think that
> > in order to prevent clock glitching from bypassing such verification,
> > they had to move the initialization sequence in TZ as well.
> 
> Exactly, the TZ interface is present to address the security concerns.
> Also, as I mentioned in [1], on some platforms, TZ might access protect the
> clocks and registers which might prevent the remoteproc bringup and throw
> an access violation.
> 
> We can keep this support added for IPQ9574, as it is good to have, but can
> we keep the default compatible in ipq9574 DTSI to use the TZ interface,
> which has already picked up an R-b in this series [2].

I think that's an acceptable plan. For the TZ case, we'd have to keep the 
clock framework from disabling the "unused" remoteproc clocks. Do you think 
"protected-clocks" property is the right way to do it? Which series should add 
it?

Alex

> 
> [1]
> https://lore.kernel.org/linux-remoteproc/21468f66-56df-43ea-99c2-7257d8d6bb
> 7c@oss.qualcomm.com/T/#m688033ab79c63a8953e38f5575d1c0ff6b37b13a [2]
> https://lore.kernel.org/linux-remoteproc/20260113092021.1887980-1-varadaraj
> an.narayanan@oss.qualcomm.com/T/#t
> > Alex





