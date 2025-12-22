Return-Path: <linux-arm-msm+bounces-86247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF9CD69BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 16:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA61A3062E13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 15:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC1431AAA3;
	Mon, 22 Dec 2025 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ko3Kyb5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7765F2D12F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418420; cv=none; b=axlBBOTGVASdKWSXuq1DsBJJhpf5W+Ca/1g5J5MADUaCLyy9vzuNFfsQjkytNDuL//6CTseuthUQeEuQ10Jnc+M75FBq5sLTrZGG4zHopzgKh589aDUj+VLesZDSNZ6ho3ESApZf7EvBdMq4SjL23YsAuJAjxN0QaZfHTuxdrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418420; c=relaxed/simple;
	bh=GGjaLoQhCp+2no7ekK/HLa/7i2pLriK1t4fSCLCjjzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nj1oW9b9plE0KdQC2H7MXEO6lh5YGwYJIJBR8owhr8uYu0CJgoUmW/p5x+Sk0HnSxu9kmOol4A3pG2EkG9hzP2TwZYyj4jqdhw7u8JcWYw/lQ6l4UUT6ujAjAXN4hAcV7GYHTABWkmwtiHPIG1NYWh3mtt/cv8z6BUQSGEPM01Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ko3Kyb5m; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37fda2853c0so3965131fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 07:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766418416; x=1767023216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQA+t0BLvG8fOA4teeYPO1i6EIFLXHkisNI387Ij+Uo=;
        b=ko3Kyb5m0Ss76GDJyfVKtsUmcbNMT8ItM0jKcunFuyqjbaGugONCnKTIkS70OyPigE
         K4Jnao9v0TQJ5S+eSrxn8kExEaiONiaZXXenXkpS88QHZU5bxVCC+NOp4T31DQ7RB9A/
         eoGn/yfK4czxjDphq9NblT4luj3je2OZqIKbZ9B5LgdAu2y1xRh+aoJ00AjHWxWe9+uq
         ncDjZyKDber9PLqtj1JFexJ55b9QST1z8ja4rFwA05vH5qNod/yPUpMKOfLsyUO34lnv
         S+sY8jn1Ss/ZTrMVvD1sJxgWStytw7ax29V+UZZ/IuBsfsajoIkNS+DtYtRzEiBfQuwK
         plig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766418416; x=1767023216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQA+t0BLvG8fOA4teeYPO1i6EIFLXHkisNI387Ij+Uo=;
        b=gfFh29RdL9xkS1pEzqx4PNm3k4ihPayHnloWrgvFXP/6EfdcEDcZI/FjOeyw7JvodD
         Xw+6/tvdaNUOY/K30eqtjhHN2sMWET1qajZ+FX8x2LOn+YRtnA0+eEu8RiN/8cIXv8Mh
         lm0uz4ihRtSAus4EPlamWZw1FsGp5UOIZl+V9GSjhsoC4InnGeMje9OhpTD2I14ykV33
         akr8lMaa9pPP05XkBzZkXVNYZ5l6lTH5UmsLc9S2ZI6c4el8/Y21HRopfG+Gj0MNMz6R
         gD+AAh1qs4E5MZrp/OGJHYYBRaiJQt3Yum1nVz5xb1KpxXlwTciTjBmZSkAMzCXqARpR
         99SA==
X-Forwarded-Encrypted: i=1; AJvYcCW9oIK3/dpWmMLIt/wBEfTf9tvoS/nJ2C0sRgFwk10+jhnP82Mc00smAzGqPWYdhJMcG8uWDtRhECyFdto2@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQulPekxq9yjlYSVyFqX8L1nipCIWKkOkRAOjb3he/KxF4+Co
	pHgmhunZ8g+yk9hIPClOrhjt3DJlzuaoa2b8zP4BYSj03+hWJmf+ISu+KODO/SZJgx4=
X-Gm-Gg: AY/fxX7ar1sTfQERj8kejGNfgYl2jn4RRnPIJ3eJy8r8kZ5378Mul7rnw0b3Q/Xw/t8
	JHWog4ARSmzi1oMa7BF4uzZ4cVOn0sBXYsKYuQofsCGsqYzeGjiVVWsbsq2+TPZ64AOGbzycqxs
	k/hN8UZnTeHDPhQQ0cKVN68eqtXUuvI0YDpZmI6Z5zuM6ajSq6CQnDngMUM6ky30TAX+RwGkO5F
	gqt98jWIQ3y49fkke4L0f3eDQr2md37xANokWWSGJNKfb+dgwDzoQsw5DqLZKfuvC4U67fqbWEK
	GhKCjlM+2ct/RNbTM+f5wE8YkFSxykYEHCAYte13bgGEXtUmC69d8+1fBd/7x72dL+iGvzayUS9
	TA8xl4uMCfUfhj4m/eRgXWGaHKAwAtcls/SRnglNKs0h7ortAL3JRomc/x/K2P3zszwIS7kjTdy
	OwfZf23Dm8U/PTVkWR/24IXQSjNDL4mslVVCJzaMBiESDytEuJEiccGyjB56dt/bXRmg==
X-Google-Smtp-Source: AGHT+IFQx5aNaZttip8OpGBoWMCmObEm/k41TzjlVuJvY0HKmyBGQ4yTX7ngXbHyytCtqPSY3zkLCQ==
X-Received: by 2002:a05:6512:61a1:b0:59a:11b8:88a7 with SMTP id 2adb3069b0e04-59a17d073c6mr2364604e87.1.1766418416446;
        Mon, 22 Dec 2025 07:46:56 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5cbesm3367729e87.13.2025.12.22.07.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:46:55 -0800 (PST)
Message-ID: <d135e715-8949-4348-bf3f-cff01911c988@linaro.org>
Date: Mon, 22 Dec 2025 17:46:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: dt-bindings: Correct camss supply description
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251222-docs-camss-fixes-v4-1-914a4e5f7822@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251222-docs-camss-fixes-v4-1-914a4e5f7822@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/25 16:16, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Usually, the supply is around 1.2 V, not 1.8 V, and also correct wording.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Eventually, if more changes would be requested, would make sense someone
> from Qualcomm to follow-up on these, as I don't have schematics,
> documentation or also no access to the internal resources.
> 
> Thank you

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

