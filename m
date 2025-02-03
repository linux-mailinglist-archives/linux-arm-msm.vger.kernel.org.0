Return-Path: <linux-arm-msm+bounces-46722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B51A255FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 10:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8724D1887D1E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 09:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C8C1FF5F7;
	Mon,  3 Feb 2025 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTJX6E2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD8713B787;
	Mon,  3 Feb 2025 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575483; cv=none; b=Ne5qfpwcd4ESamyLrGmspVwq8sitXlwVGqBNTfYh/9dDyH+3WmRUVGJM1MuljVg41mLvReTcGeNsfhkOB46a+K7xhWmtKwmQWxf1jf/N1MHJtepLuHyFGv9bxS26fqcmKoglz9bk60DC77O61eIaTpQRPL74Mo0Y7M2mrkyE4dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575483; c=relaxed/simple;
	bh=7peDE4226gPyH9UcLU1dQdA0OBGIDudGsx9OB9dUlfk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V5RET/GjG1us7DzmdBe7e1WgMCj0EoaWQNSv08vS4QKkrrGkKsVTwmLNM1GR0G+TvSK5AtSsX94DERY867XnuVAjs4OOZLW6gwnAePMRvql8Er0THsRu6FSEmkWHbGAEzct3QjdF2OtsmX/QwvSsSoSp5okGmk6+A9FyWUfzi0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTJX6E2N; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so2469417f8f.0;
        Mon, 03 Feb 2025 01:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738575480; x=1739180280; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7peDE4226gPyH9UcLU1dQdA0OBGIDudGsx9OB9dUlfk=;
        b=JTJX6E2NtwsXRpWVykURiWx+WAucikPB9V5oviRUpwr45xF35rADEhvUY/jYWQ9xtX
         catoN1vh24w84E0TM4tmIzV/H63N/GPWraYfqnJc44c3uOakCgOdLxSRNBY8l3+uad+H
         uJsI8U1aH6+gzkrIjRhel8eRSbNjaa2368PZegA/9yH0Y4mkwltRjlllGNTmkaJxPAkB
         whixNKPdSp49uPpxl4vHjxCTvHiDcZuyqHx4GkyHYYf9PlgOzDCIIZwPV762s3Xwm3PK
         xFMVXUiOfJz4X7wm+5yi5jux0sdEriAHCIYimNk0eGrs8+nIVpfJgs3ceLPXE5OdECwg
         objg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575480; x=1739180280;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7peDE4226gPyH9UcLU1dQdA0OBGIDudGsx9OB9dUlfk=;
        b=YhI6poojmBnsEHkqKVEY27TS5YkAd6OlMcbCSMR9O2Bkghvy5mJGArFqbxc1j2II+E
         IEQodU2MsMDFBpPMMOMCFTRNmsL0E8fWfUxZz7P6meI28ELKhplGk5SNvKBpLs+RNFUj
         v7RT2wIZxbPzyksvezR0UGUJYNtRrzDiHkg+L+fkqvR8b2vow0xU5RCy/slaRq8IzHDO
         Go+We/iZIBJbxgml4cyM21oN5ZBpbVL/J/cm/0+ZtJL8Hq72KGjPjthYl8jmz3VBk0zW
         gMvzgcslXy8HhV3GG6CBLpyH2LirKaQgYkLnf99UliPmaEjceE/mumBB0uWHRcsS/6Xd
         pBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2zETWf84QaD21Px4Z+z867li0hhwlcM/3Jn+fd0uwi0Pv2Lzx8VQGTd/GKaBZ/OWqgwESiYIDoLBiJO4=@vger.kernel.org, AJvYcCXatx/20huKatImHrb6nkkrW+yxsRkRCwIn6Rbp1OyMt+1e7svgJQDjDBCh2HAxXN9XokSPcbvTcCwKtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJkxiRtDsr+oAwot4Oz0W80MTmbbFmxmqZv0v9rL4ur3ccNdfk
	rujAFzpceKAvZhpfHp9NJBUhOZwYHfKvHVrcai0BacKm1qWyxkw5
X-Gm-Gg: ASbGncsHKLZlY9OJeivmzuXhQzHg5ANb21A7kccRZNq+BqwSs+PDSeVVif1984X/ipw
	w3ckWk2ralo7rOJULrzdW3QywOMF7Aygkm6DmGE+HzlDDDX9+82Jz/IaJcpZ5mJbkVz011ykLMV
	Emwzo3PJUtgLQIyso/IHsFZLJDo8kW1U6vdttWE+4kS6TlP0122qQELEB23IsIPqTLj8ZRNxgih
	0bGYozx9TGE1Ao04eArGJvbvjguGl8ym4e8+O//hfXEZGN/x+GrrclotA9d7+fYxfM/A3ZU09M2
	gGLsuF4lyBFDEsLekw==
X-Google-Smtp-Source: AGHT+IHdEwQPMp/IYjrBUKP9SI3ANoh6a27II8NCdtsAqFDvpkqpssdT12J2jM47RJ7YS6f0++FlHA==
X-Received: by 2002:a05:6000:188d:b0:38a:88bc:a8e3 with SMTP id ffacd0b85a97d-38c519699demr17237624f8f.33.1738575479649;
        Mon, 03 Feb 2025 01:37:59 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c121951sm12114646f8f.45.2025.02.03.01.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:37:59 -0800 (PST)
Message-ID: <ceeee4f93b22ab53c4243eec85449a95b0305c70.camel@gmail.com>
Subject: Re: [PATCH v3 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vop
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Alim Akhtar
 <alim.akhtar@samsung.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Peter Wang
 <peter.wang@mediatek.com>,  Stanley Jhu <chu.stanley@gmail.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Andrew Halaney
 <ahalaney@redhat.com>, Eric Biggers <ebiggers@google.com>, Minwoo Im
 <minwoo.im@samsung.com>,  open list <linux-kernel@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>
Date: Mon, 03 Feb 2025 10:37:56 +0100
In-Reply-To: <20250203081109.1614395-2-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
	 <20250203081109.1614395-2-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-03 at 16:11 +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>=20
> Instead of only two frequencies, if OPP V2 is used, the UFS devfreq
> clock
> scaling may scale the clock among multiple frequencies, so just
> passing
> up/down to vop clk_scale_notify() is not enough to cover the
> intermediate
> clock freqs between the min and max freqs. Hence pass the target_freq
> ,
> which will be used in successive commits, to clk_scale_notify() to
> allow
> the vop to perform corresponding configurations with regard to the
> clock
> freqs.
>=20
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>

I have reviewed patches [1/8], [2/8], [3/8], [4/8] in the v2, since you
just changed coding types, and typos , but no logic change in v3. Add
my review tag agaion:

Reviewed-by: Bean Huo <beanhuo@micron.com>=20

