Return-Path: <linux-arm-msm+bounces-100514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FdKKWYxx2mNUAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:39:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B50734CEF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F050305F1A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 01:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C02D33D4E4;
	Sat, 28 Mar 2026 01:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjONHI1Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661BC33D6F8
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 01:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774661976; cv=none; b=GPCGWwlaXFnk6RjMD6INb9Lux4dF5/tVTE0pUuS+D9jBAA8G3IZiXzlfEupdlexgvkbjJCqP6pbAapUXfG63/6IRgPr0L5rt8pddsmUQoWagL2S0mRgXFjeCUU6BBnCr93NwQxNzxpRdjfBe0+nFZ486dEmTVNCnTH6BsiNO4ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774661976; c=relaxed/simple;
	bh=MESqiG8F4DXapkfQrWlrnD1nJ4Qm9J/wC/DX80zcaqE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MVQMM492IwEIgis56zCMiBvwPj2SkaiuT8a/kl33qMMYxK7dkTL6qakul0sxCuie6nsVbjNyirnbvvoBn6mx7kMvioWA5DtaxxF1cjL6LREe8+8Pyrx86JBm3zE2algANIXEwN5sZvhpVlp1QQh4Q9OZxxe9a6vlK3Vyvfo6hms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xjONHI1Q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so62122f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 18:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774661974; x=1775266774; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MESqiG8F4DXapkfQrWlrnD1nJ4Qm9J/wC/DX80zcaqE=;
        b=xjONHI1QRwhrbADwP5zhFJEXRYDuM8m7sP1q976m8/yCDpUrKLdc39H4Z9AlRuUAYQ
         Me5oiacd/9/YfUvPt/2Ulf4RuGlhmoSNTLWuYYE0c4AcEkwNPuHVSHueet/6S2OPQsZU
         YGFSXsjBRa2yLCWqq4DNiKmMmqGcD+bMYmveIPmapASDmONjcDC+T0plXmn9C/2bgqZZ
         jWTQ4tuZxY8dqKaRDWSkx0hEk9lQIUoc5OoRTsQwcVJvrHYARx6cPqXa4QGNguGfMN6w
         bF5htgm8WsIVWZmAIi6bjWuY33i2JoAcvUqhOXIX3yyZuhz50zDKSyDqvrTfNLPsz1yh
         Qs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774661974; x=1775266774;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MESqiG8F4DXapkfQrWlrnD1nJ4Qm9J/wC/DX80zcaqE=;
        b=DVMb3ivzaz5aJV4rc+ErJTPkiJMzwFzdfJyi35DDytmr/hTQx0zq8Wq28IqZaYsC1C
         WeRUvfU9CzU1lCaBKLF7+ILKx4/Cd7WspXeSLOARMawqyHF+QCo/D7PJQYv47R8Hss1V
         RAJpWsOQyxcwge8MQdIbtugkUvKhpwGXyfX9SfEv+WwCIX18htHkIWaZsarXnC7a69kk
         AlrPbpN2lIzVhq49fzCxUTflZ1HoECoes+N3ejWgWusKY6kZrROfIZyOIvGi5WIEOkf4
         3R9nvHNV19/QstdBSPxLP7PSzwOdbuBUHjTPy84KxPY5z2hCyUJks9Khe6xE+7s2DCL9
         hdfA==
X-Gm-Message-State: AOJu0YzS6HDKBb6jBJxJeML7QHdrCKeTHgGbyeBMX49J1Ii2H969Ftgu
	efPX+w8XzNhIq1zjYFZEjQ2y2zy29K0syn5C0D3H4VwylZkCMvGvsuFby/TPDqLOTbY8mr0MInj
	yglQi
X-Gm-Gg: ATEYQzwvWaiI48hMl5l87ASqkVxSUT12phtyCxaw8gumWlbGl1Q/maLfN3BpiRw+U6A
	ny0z7h1B8FDaXpKoB7XHgwzcH7ZZuF88MWG5Ydj84CTphF1dncNUzA9EQHzJu+i04IgSXNRvHES
	mbNFOKf9U4xIAfUJydRDlSJTGS5MOCcN8MQEofw0OZmP8RuF6UREicQAs03uq1mNpLmgiDzpc6C
	stmibno0a9dKIazrLcZkalA6FDxP5ioLFtybj7FIP5l6fCluNB1WfbeR0sKh/BsJgFsoikBhkyh
	K2corwaOUtyUyABl510gnmXsFk6yjowoKXAHlGSkD76dlKwCBd5b/x+MW1W1lfeAojXydjrKvry
	rwmLF3bHyU/b9OlJxQKwplGp9CAErbj5T9Dsn7pm/5bU1dxfB4Dm/83aZ0lo31GdB8D3eED5rOC
	8morbtJInpf1nb/7VmDIdxdyxseYQwR+pgDYi02zbOhb/7UxGXO4MMQwhTbi5z22Y5GDVqsB19R
	x+LoMu79i/072Wv8EqPNmLd7Yp/ZUuv
X-Received: by 2002:a05:6000:208a:b0:439:c153:ae3d with SMTP id ffacd0b85a97d-43b979fbc99mr13706733f8f.6.1774661973830;
        Fri, 27 Mar 2026 18:39:33 -0700 (PDT)
Received: from [192.168.16.142] (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm1286953f8f.17.2026.03.27.18.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:39:33 -0700 (PDT)
Message-ID: <928f6ea130e6a0b5cc430cf204622ea68e8e514d.camel@linaro.org>
Subject: Re: [PATCH v3 06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 28 Mar 2026 01:39:32 +0000
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-6-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
	 <20260326-x1e-camss-csi2-phy-dtsi-v3-6-1d5a9306116a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100514-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3B50734CEF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Thu, 2026-03-26 at 10:27 +0000, Bryan O'Donoghue wrote:
> Add the PM8010 PMIC providing the following voltage rails:
>=20
> vreg_l1m_r @ 1v2 IR sensor
> vreg_l2m_r @ 1v2 RGB sensor
> vreg_l3m_r @ 1v8 IR sensor
> vreg_l4m_r @ 1v8 RGB sensor
> vreg_l5m_r @ 2v8 IR sensor
> vreg_l7m_r @ 2v8 RGB sensor
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>


Cheers!

Chris

