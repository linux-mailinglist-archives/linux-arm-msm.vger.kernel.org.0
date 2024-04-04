Return-Path: <linux-arm-msm+bounces-16388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B887898385
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 10:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 356BF281DBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 08:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626C273177;
	Thu,  4 Apr 2024 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mv5oojXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B24597A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Apr 2024 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712220840; cv=none; b=lpfvDeKyg8FZOE1w1t18VMoDpYiI7y9YaV1KtqigI8B5JWMaYdWflnSzvFmGzL/83vbICT1+7PIIOgk2Z1HqfOqReYcM6oP9brBRLJvTo4xTCYtv8jMG2Agp+oWDd9VkwFEnws+0lmChjuBm3Y5H+Vb9cLzF+bwBILfAQvQefnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712220840; c=relaxed/simple;
	bh=oN6L5F4339c8x9zBSAaPAAYbUmNj5mF92X0nhCMXYT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L43D50pauQ2gqwMtyOAoFXa7TKQBIgQQnAtxoO1ixx1Z8vTYa4Z/4CCyOEOLVLrXfbJ5+X1LQfgJoorSXJXLqg9h/VwgTp6QgaNZanOJRV2P2VY/ocrwTnzBkbPL68mq06DHPRlHeFP8XREOOEysDB6HZcWFdCSFvFkBLWw7oro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mv5oojXJ; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso762373276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Apr 2024 01:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712220838; x=1712825638; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b0saMo4QGYVfrGZY3BfXYJ+wYYPXK1vgxsVH3LduLhE=;
        b=mv5oojXJQs/dZqQOhmlv9SMhqb2lHABRfOuVOazj+KbLtq6vLKnVn6KWdbZIHz9vqp
         udi60YvI2iiiD/lI4W4tUhUD4NitfrqWYRPxlDPRCVJo0SHxpBLQ1Q2Of1WfrkEDz2Lr
         dKH+ykmhgxoYfvS53r4hipq4zP7LxCgHkVCZlRg3R6aN+LeBCgrtn2+d/MaN2s/XU7od
         9epamVS6V6fic0lsr+gpvKRxmCNHcx63REOVqjyXxknlcFGqP/orKTG7hb5u75aq7UTO
         0ymfs5VFMt9nhk7zlwNKfweK2SXA5fHFZBg2jPaEtABerz5P+bWK7+hgSqw/nqRhI74x
         2ClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712220838; x=1712825638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0saMo4QGYVfrGZY3BfXYJ+wYYPXK1vgxsVH3LduLhE=;
        b=vVbd45ihl4wTB53w2oPEkvcg482YmzwCxjQyOkbCeuz+FCVx2TaAWx4mNbgu/RPs0g
         VxdW4HzORwVNDBWgKNSixdGZ3C7ITBG43p2D4quu/ebVKzFWw22QsaJ58Behuc9CEiUc
         WCvA+lYUH8jGS7//F5dOM1KO3F2URC2QJAVXRJKeq7qmo6y/t+xtpT6/npgF/6MpmHRA
         UQclxl+pbOsGInVsrGD+B2Zf6Cn/ip8n6qi+qFJo2q74r8su60rd7pXvfyo4yMTUE7qD
         3HvaXD4bSL02eyXe2+CpHgN93y9CvElG7DMpHULmhbLZpnlY45/wcosS4SBIR3eYLoAY
         Jxqg==
X-Forwarded-Encrypted: i=1; AJvYcCV5oKI2AHlGlsXvKxICII4MDeUWlK48YhORHUUPY0mo1qR5D4ISNbUy5irvvwAmWSTlataY1yBYD/qe11088KrE/sXuMs6HSNVMkuq1Qg==
X-Gm-Message-State: AOJu0Yw73Xwj3TOko+BPKGe/epf8e2FTjIXbKegeaZmAxMSIlx5nxIMd
	NcCEpBbXHwgRgUsKfRqFt+OoEZu5ebk3FGLH5OO/yic8o2mNWk5v6J17oeK3ARnf1Ou/KHY4OIz
	gsd2WzEuCHg94ciGfZNJ4HJsEBkHKkD6++r+uVQ==
X-Google-Smtp-Source: AGHT+IH7f3/xIqdGulCRGC9S2/T1fajzZP/pOTgqSEEM7kR4WSRQcksdbB122eHZa/2SpUYAsKQ5FgKEuYfHL4yMoGw=
X-Received: by 2002:a25:5f51:0:b0:dc6:9d35:f9aa with SMTP id
 h17-20020a255f51000000b00dc69d35f9aamr2068959ybm.19.1712220837771; Thu, 04
 Apr 2024 01:53:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404084631.417779-1-quic_mohs@quicinc.com> <20240404084631.417779-2-quic_mohs@quicinc.com>
In-Reply-To: <20240404084631.417779-2-quic_mohs@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Apr 2024 11:53:46 +0300
Message-ID: <CAA8EJpqWaYhzPKgTREtJnfdNZ4oSFZaRFM7Jhg+qd3AqadGOkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd
 QCS6490 sound card
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_rohkumar@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Apr 2024 at 11:48, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
> Document the bindings for the Qualcomm QCM6490 IDP and QCS6490 RB3Gen2
> soc platforms sound card.
>
> The bindings are the same as for other newer Qualcomm ADSP sound cards,
> thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
> is separate.
>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 2ab6871e89e5..ff1a27f26bc2 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -29,6 +29,8 @@ properties:
>        - enum:
>            - qcom,apq8016-sbc-sndcard
>            - qcom,msm8916-qdsp6-sndcard
> +          - qcom,qcm6490-sndcard
> +          - qcom,qcs6490-rb3gen2-sndcard

My 2c: you are adding one soundcard for the SoC family (qcm6490) and
another one for the particular board kind (qcs6490-rb3gen2). That
doesn't seem logical.

>            - qcom,qrb5165-rb5-sndcard
>            - qcom,sc7180-qdsp6-sndcard
>            - qcom,sc8280xp-sndcard
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

