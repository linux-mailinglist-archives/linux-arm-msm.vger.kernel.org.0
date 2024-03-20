Return-Path: <linux-arm-msm+bounces-14683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F71881A18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 00:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8090A1F21E5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 23:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD05886128;
	Wed, 20 Mar 2024 23:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wtnlTsix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EBB85C7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710976140; cv=none; b=Mz+yJQYzBb32df3Kha12lBwVMRMpFuZJKifDuasGVtZnfY4gq5qiBLm/Pc+ZjVHF1EXOXOdeEuMhQtpOxuQuksHdnqCk+EwhwptJx1BGQY1pfCXYCuY+R90yuXsrrqf/eVRtWQduSyW6uKT4OZunydKQHZB/O9FOAotpRRNiHac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710976140; c=relaxed/simple;
	bh=wEitcMtU69ELTQ6HFUAJtJm8A18kUQS1wB/GUBQBwI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRbdih2nxkoXhc991LJb6Ck3P4nqQE+FPHFkyDZ45dZHJA6w8nqnLUKrHyIQKvzPWBX4ky+JQ6C94ICW9drdIN4YZtgzT/kNjdBIXcSW4rpQIs21nS/DJa0PCaEcTrfpEvv0CtOxRi8YNXmQ3DRNSD2KnS1WYNX6ocWsTSFGbdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wtnlTsix; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d4801ea689so1028491fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 16:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710976137; x=1711580937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkXn2l9aQZGCQHALJx17Ml36xPwVxX2TSWrjLHWJzFk=;
        b=wtnlTsixQ64fAnB5ADKJxhH89+rsYZIPpYp9XtwjJ6FRckH39iNaShQD9RbsqAvcbX
         +qAMDGacbSSriXNZ1zT0XFptmilwmlhpn37OX8ZUU57+een8eqBu943FFmczZaw45Iub
         sqSvQFgs98JrLma8+UCiZzOvwTnG9Dug1qh8tNT8e1MSptv+AMrUMZwyyGCXO6xPJ2tG
         QL5AvWqX3oKaFKw7Z3ARA+Z9H94d4L/lgH8802OBhl87piOIu8XF+K/n1lTXUutBPzYg
         f7W00tD3icjlCjwyGsmbaImqU35yuXbriuspn+i+QgsclTzhabB18cv01Xq8AqEfWpYK
         SrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710976137; x=1711580937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkXn2l9aQZGCQHALJx17Ml36xPwVxX2TSWrjLHWJzFk=;
        b=D3DejEJaeEoQ0u6Pfu1vQWE5qC+noouer51D4mNeithrsLhSheJB3ShNX5DJP5tV3D
         zX3+aNyZJ8AVhCJZKwYtdA4Mao1ACBEg46T7/tJxaO+Ie1HoTi9DDQ21zDl6Ct3W0C1L
         6nU6p7eSus3KmmukuImViMEcQTyNiRCMc/1LA4E4wnjDBAIKqQi1eYxHj1bdZF30qCwo
         w79Zdl6kkv7sgvuMbmMvHuNRiHFtzGYDDzi6Jy4FcCF8uBCoMkKhUrdAqMjROIXc09OE
         yrOGeksUb0w1m7XrlnPQy22XF6o3WsOhcrEzTcQyTzIq//hnxHANtzkMfPjOP7TBYlOu
         JTjQ==
X-Gm-Message-State: AOJu0YxZgnI12e5s6DQbRkYZcLLo1iwXnTrXobMwEsTPSZLy1kiiNlYu
	yCqJCUReeyjIXdQfwbiI8hzjaa9e7DcXvp9ifcYUZ3NVsmgic/TDYmaNE80eWik=
X-Google-Smtp-Source: AGHT+IH4oiswGEj49f2wWDyVtL3HMN3AVR4jZcyvrpnyiJp+ismyJGeVgL2Opz5yeSH2QEe/aSfmeQ==
X-Received: by 2002:a05:651c:1068:b0:2d6:93fa:ce20 with SMTP id y8-20020a05651c106800b002d693face20mr1646812ljm.0.1710976136987;
        Wed, 20 Mar 2024 16:08:56 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id e7-20020a05651c038700b002d4aa0bcf15sm1181328ljp.71.2024.03.20.16.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 16:08:55 -0700 (PDT)
Message-ID: <65c8614e-d54a-42bb-923c-1c2bfc1d3bc1@linaro.org>
Date: Thu, 21 Mar 2024 01:08:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arch: arm64: dts: sm8650-hdk: add support for the
 Display Card overlay
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240318-topic-sm8650-upstream-hdk-v2-0-b63a5d45a784@linaro.org>
 <20240318-topic-sm8650-upstream-hdk-v2-3-b63a5d45a784@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240318-topic-sm8650-upstream-hdk-v2-3-b63a5d45a784@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Neil,

On 3/18/24 11:51, Neil Armstrong wrote:
> With the SM8650-HDK, a Display Card kit can be connected to provide
> a VTDR6130 display with Goodix Berlin Touch controller.
> 
> In order to route the DSI lanes to the connector for the Display
> Card kit, a switch must be changed on the board.
> 
> The HDMI nodes are disabled since the DSI lanes are shared with
> the DSI to HDMI transceiver.
> 
> Add support for this card as an overlay and apply it it at
> build-time to the sm8650-hdk dtb.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Now I've successfully tested the change on v6.8 with commit 0581bcc48048
("drm/panel: visionox-vtdr6130: Set prepare_prev_first flag") applied.

Please feel free to add my tag:

Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

