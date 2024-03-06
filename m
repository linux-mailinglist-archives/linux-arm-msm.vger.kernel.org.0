Return-Path: <linux-arm-msm+bounces-13400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B99F5872E40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 06:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2367528ADB3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 05:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98BB18AF8;
	Wed,  6 Mar 2024 05:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjwCZWNu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3614B17742
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 05:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709702294; cv=none; b=ulRhNMy4+buDofB9CGhrU+YkNNJ2yTNKYp03+GLID0dCRlbUXZLUJsvg7IauaTHkXDdQdBYkR/SA2TEUSw3woel6qYRF95Tuv0OfsEK7B5uY/yvnT6c+/lZENOhFlz0otkF41mvhSy9MjOv7VzGp8H/fxhlbMG7g2GchLsh2qQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709702294; c=relaxed/simple;
	bh=W9xcAnBJ5x0edv4L8/LlSaUoUncPmyKmnbp0d6UuMDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGfJsyTFIW0u/UX5LLTRlcKHTwpPXJ1ZagLz5uTI1WsAk5dTVcfwDxD4b7U4RnhYX+QUmxO5lu5k+lBTOlmhNg3ABBTQvsl6veaRzf5OEfBAQOhF8Jf38Bskff+j/lngxgo+kyPRjiF344Ri9HIwGdwf16YlvvrD/aIIzZtjU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vjwCZWNu; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e5c0be115aso3361513b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Mar 2024 21:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709702292; x=1710307092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ/WgqvK1Ci/ne6ulin8lmOr2tFPfPFW34owF2nS4yI=;
        b=vjwCZWNuPH/KlBmRjXU540yj8bycPHypzGLSZPNziqvU+8g8ccZ1/xUgIKK3sCW3pS
         jH3IaBtARPRRgIWveztFAXoib36/gSBPcItPgsftPv9i+bptTMhgH/syHfWHIfxN9OAo
         5zzodEWIe1lE8fp5ps4b9cw9Ep95er9YbpuQJS67jtIZIJuG6Rg/9ywNqNYSbe/zFuKy
         hPw0k4fvLQriwdmNdQ7uT56RbpMroP6tmo+avwmypXy8TzSl/q9XMlAsGl9TFfwcKOh1
         al9eCzLPghF6kwfcO66Tz9RwdW1C3Mu64o+B6NfnxKrBfRra7ZEr+za7/EmiQX/xd6Uq
         mLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709702292; x=1710307092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ/WgqvK1Ci/ne6ulin8lmOr2tFPfPFW34owF2nS4yI=;
        b=oDSZQ2yaztrwJQB0DYZVyClMJ5Xx6xNbPAYYpZPOfzmNKglO7DQ9he6NM2eX/EjWhk
         Fz3IpLzoib8m0oaQtP5wq8nBeV7pHLwZi0bllUx9CsIGl+eGDL7x/fNUYInc0rAZJI8N
         51L8c+gI20SWDZAqtp89d2Sudf6Q8wzpsivn6mHLFx+qPHVjmfp4vxM2eJDgF62hud4V
         iW0PY92oY/pCO+b6b0dpUVCzSJhjoFFJ+bxn/QBXHT3StDXPZ13EI7u74VVCoE8JpMik
         Xqgg+O8hezAX01rK181HuBAM5eHpRTgnc+H53zmAEE3AtIxU4ywCeQIXLSDr4qAA+nSj
         4nyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxexu+hEoKp0Gnxf/8JrgM46w8G1/A9/GQc/d76MJ7DJk/GCYNmSb4uAmGyz8TpBr0o4Dvph7flo2j+B/NroGRqrq8H5kPAPHyR95nHQ==
X-Gm-Message-State: AOJu0YwO5050zOeTEAs3eKqaUglaFduPt+46+HLaoqhOXRUFVA5Mg5av
	rOIBa3RvAXyynIjpNymlS0mnSschFWjA/nDICJbh/sVtnKMjvZtwmEjWNtA9jh4=
X-Google-Smtp-Source: AGHT+IEC0Jim+2WiKJtC/woXkiOJB/InsQ4y2/FAI9UWOw6q1UH+5rkyx5WoD5BFD7VIQiYPl9LlSQ==
X-Received: by 2002:a05:6a00:2183:b0:6e4:d201:a39a with SMTP id h3-20020a056a00218300b006e4d201a39amr13664121pfi.22.1709702292297;
        Tue, 05 Mar 2024 21:18:12 -0800 (PST)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id z1-20020a62d101000000b006e5db93342asm7199839pfg.208.2024.03.05.21.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 21:18:11 -0800 (PST)
Date: Wed, 6 Mar 2024 10:48:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/3] cpufreq: qcom-nvmem: add support for IPQ5321
Message-ID: <20240306051809.rk4xhl47zai7um3n@vireshk-i7>
References: <20240228-ipq5321-sku-support-v1-0-14e4d4715f4b@quicinc.com>
 <20240228-ipq5321-sku-support-v1-3-14e4d4715f4b@quicinc.com>
 <20240304071222.cx3s37mphddk23bv@vireshk-i7>
 <20240305043503.tgy5ahl243or7lm5@vireshk-i7>
 <c82e4053-4cef-4010-a734-4dc537574201@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c82e4053-4cef-4010-a734-4dc537574201@quicinc.com>

Bjorn,

On 06-03-24, 10:10, Kathiravan Thirumoorthy wrote:
> patch 1/3 and 2/3 are already has the R-b and A-b tags. But typically those
> patches will go via qcom tree. Do you want to pick it via your tree? Sorry,
> I'm not sure on this...

Should I pick all the patches ?

-- 
viresh

