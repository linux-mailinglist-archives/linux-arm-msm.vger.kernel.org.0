Return-Path: <linux-arm-msm+bounces-23100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE69E90D622
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21E4E2834A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6186F132494;
	Tue, 18 Jun 2024 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UvV8/M2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF050297
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721986; cv=none; b=ccvC4dn9ADFYvIxpjo5v9jrdP8REpK4V9Nf0nacqyA77u2+c3Bd/433yF2vIChdHt31GNtOvcAXfKcIOpWGZRw53kjo8SVJQ8QyRFrwKu5Yj7gtEGcv4j5j9u6/JfonQ0vWTRY6Gesldwn1J6LZtSsX3FRad5PCzVvKMRhKVTyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721986; c=relaxed/simple;
	bh=Og14w/kafuTyurc5NrEOw3F6k/R6K57h2C+os0REkxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8JDOEIxp1e0zmOyl/NvHI2of2bHLwTh4HYVDqUobcONespHmTXlSK95AVVRDDETBy0rHdttDUhEjafW91PZnkItNH1NJE/G0d7Syb1P5szOy/LwgNVBsbiTmdL9EqKYsMeDvM7blI3BMjNJZJlOHAVwhKpsQIP2BfdV0rNSkoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UvV8/M2X; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35dc1d8867eso4346896f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 07:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718721983; x=1719326783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EhzA6ITR/mtp+5gOoKdG8vAq1UwKiuZGvALGcvS3hfQ=;
        b=UvV8/M2XfRgJIWwlp/w6myfk3p5VGObsJvfU3F2DH9UJN99ArLctvwtBedyRe6pP93
         Yjk8DzyafR8QqAK+v4f6Hc9TPv8RNBWcNmPP6RN7/MpRHThuIRMCjefaE52B+/QL8FRI
         u54bTeD9nPCvbhqmfh5cTvoWQf246cj623U2m7cwVSwZyi9Vv+0GS/XeBBgGwroW2gmk
         vy30PpEllq4356Deh8b4M2K57ASTV++fGwULv5NKfWfiLTGGw4m8azsBWrtlQDzwvc5z
         eALd6RarOengff4dfC5fVbIM8uXhPBgQxZUnuLlyR6h20PzCkiqO4iagDgnEZwNf+faU
         UX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718721983; x=1719326783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EhzA6ITR/mtp+5gOoKdG8vAq1UwKiuZGvALGcvS3hfQ=;
        b=puD0TTC4BT+i6V4whOqarbXaOAqoBPB4RcKPvYc+CWikEzOLCS9V29/6IAbovNBzxR
         j8Kfzy/qRQO7VVwIPqnujAv+5BaU50CiPTaLrt20+RYoZOTg4d/Mr+9+3vCZnfJll5UH
         pyIMKo77uDQ1NiunYCbNrQKJbvPXT3EIQSYF18uEDodPMLLQ68I8Rw7ieCKlp6KZ40Pr
         r/G5uQtCofmGkLp6NzohK7Am2oLGwVlhOwKKkhihHCb2JwtEe+R45es92x8gI6XEcfgy
         bd0UF6xW5NUB8jZpGHsZBPsb6MF6gJFH0DbIi3AuIgCAWPs9OkyCFIL1q7osbW/Jevnv
         bVSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFdwF7s9q+42c2FQ6lnPd9VDkOOpSHKgY5GBjggtgtQxUXi73W7gtPbmIHmrAgVtNO5D9x5Zp8Yqx7svvtx0z+AbBYYSiS5s8J/APaDA==
X-Gm-Message-State: AOJu0YzvvhlRr5X628MFRoNe3EEp8HypxcfmSjLWllqvLpyHbXrkFVLh
	e/O1llN+aoIxQzFgEEr48S7pISTjk6IF4TbT7q5Jv3YoPzPIzo1WQScspjEszzM=
X-Google-Smtp-Source: AGHT+IEKa0UB/epbhJn0UELns0QzTpX+72cNV+oeKhKhYZdsy/bAJfnvItOp3AeIO5nUZeTo7XkEpw==
X-Received: by 2002:a5d:4f8a:0:b0:360:9519:6102 with SMTP id ffacd0b85a97d-36095196123mr4353123f8f.55.1718721982800;
        Tue, 18 Jun 2024 07:46:22 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm14246603f8f.13.2024.06.18.07.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:46:22 -0700 (PDT)
Message-ID: <910af90e-affb-45f2-a2f7-875ca8362c0f@linaro.org>
Date: Tue, 18 Jun 2024 16:46:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] interconnect: qcom: sc7280: enable QoS
 configuration
To: Odelu Kukatla <quic_okukatla@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, cros-qcom-dts-watchers@chromium.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, quic_rlaggysh@quicinc.com,
 quic_mdtipton@quicinc.com
References: <20240607173927.26321-1-quic_okukatla@quicinc.com>
 <20240607173927.26321-3-quic_okukatla@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240607173927.26321-3-quic_okukatla@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/7/24 19:39, Odelu Kukatla wrote:
> Enable QoS configuration for master ports with predefined values
> for priority and urgency forawrding.
> 
> Signed-off-by: Odelu Kukatla <quic_okukatla@quicinc.com>
> ---

msm-5.4 also has a qhm_gic node with QoS offset 0x9000, is that of any
importance, or can we forget it exists?

LGTM otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

