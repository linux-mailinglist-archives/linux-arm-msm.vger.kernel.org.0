Return-Path: <linux-arm-msm+bounces-22920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B72690B81E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 19:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDFFA1F21CB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 17:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4946185E47;
	Mon, 17 Jun 2024 17:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eemRY1f9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F66D185E42
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718645608; cv=none; b=dSPVkC+G4mfG0MxxWVRkAjQ4H7laEqlf6HqF38rGadIGPbBHaXLkvX/jVYq+5eTjVFtN7DL9e8ytIf5W+rrf1i+nF3Lvv8ezz+TvQDK/MTIovvMSUp0TEcyBQijwRUDECaUq7DowG64fg7nZS9sMK4gaNYbpiRqEgYwgWdhvQoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718645608; c=relaxed/simple;
	bh=PG3BCj9R30OdLhZZyfrDaoTTRFm41wylvyZJx2O0h7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UvtTCl0IzXZ+Spu6LXmHWMdjDUSaeCKPtwZsT9h4eEUMAYCd/NiEctIVBgrlovsl5a2v2yuwd1BltKI76aSEu0Kcy2MXo4U1CIy0KjAr5tT/NMZz0WbSl82F+BDL8yrb/5r2vMMLS8zuz1P1MuJbYU8dei3LCKg3YT/f8fNV2W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eemRY1f9; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52c94cf4c9bso5524963e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 10:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718645605; x=1719250405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QFQCWRaqmBJq8+m4mF5hIPHwI1FBZDEXFQrG/Y1yGWA=;
        b=eemRY1f91RGS4plsryR4G48mZYcM/u3ovmFRhDeqyKlDEZ9eRJ1eePQgRqck8D5XK7
         O3alz5IWKZJ2dSECt2gC4BuTCIpldwv9sv2IJlgCHHj5Y3x3DomKE/0vOq9XpOKmby1/
         OcqBhff9ysPeG0kz+93LThbz6FnjSpsTw0BySAflJ14pvYArOzBP19X7/nTKAWgboOBr
         Ja7vUY4xWmP8rQYWshuD2r7gCJRnnoGwnJBZb1x++JIvZV0tFaqnh+ki4w1VUBbYEBmf
         8lop1fy27a/x66K2rRbp9WAGkQUuoJbrVmnboY3U7QhYTIuGt5qfFZvmB+sl6JoiFNiq
         j5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645605; x=1719250405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFQCWRaqmBJq8+m4mF5hIPHwI1FBZDEXFQrG/Y1yGWA=;
        b=uv/loEuyJpSMKmyMPkXOrOczWclgPfBEEC4O6QTlQcC3KCRaHZNLK5HflL6+mBzbgZ
         QnZyrJLTb6l6XHxD8yGi/qmGCOU+ECUhjZn8kBhQ15Xq1IQS/yF6B/H0PAwKiRI2yZIT
         GmRJ/XCIVqs1T6lDBhxAowENYsrf/vls5dRHEpUuF0UhPPjivvRtxqrCHTm923on1n42
         2MxRkChEnjWSxXY53Q+uqE6nSk8cpfIz45dLuGuSSpw8PQY3L6T06lZYvTqTZ7UUnVUQ
         KEGaxWkwi9kBuR09pKkDrb1x1eFtzMvfYpNuYSNOpkwcQ+2flHux2w0GxVLXp5YcrngP
         +1Lw==
X-Gm-Message-State: AOJu0Ywft856ivkxmhYNVRCYINwscfF4u5+afQiknCzN0oqzVGY/9ks0
	gFz2K8roxOsTBbEfa3vsu9i0lLG+1eqmvAE0X0HpXtx8rE5UH0NWdk9Hd9jq4WU=
X-Google-Smtp-Source: AGHT+IGZ0XGwW8+FJ9oSqx6R/jJKEbazLowEP92ZnnjcgIC15UcSwHMBJpzMR4oEGE/iPCzK3fqrvA==
X-Received: by 2002:a19:f60d:0:b0:52c:82bd:bc6f with SMTP id 2adb3069b0e04-52ca6e563ebmr6789043e87.11.1718645605467;
        Mon, 17 Jun 2024 10:33:25 -0700 (PDT)
Received: from ?IPV6:2a00:f41:cb2:a9df:20fa:cfbe:9ea6:1fe8? ([2a00:f41:cb2:a9df:20fa:cfbe:9ea6:1fe8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825863sm1283308e87.55.2024.06.17.10.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 10:33:25 -0700 (PDT)
Message-ID: <a31a2f94-d125-48fa-8e57-7aedee98063e@linaro.org>
Date: Mon, 17 Jun 2024 19:33:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sdx75: add missing qlink_logging
 reserved memory for mpss
To: Naina Mehta <quic_nainmeht@quicinc.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
 <20240617093428.3616194-4-quic_nainmeht@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617093428.3616194-4-quic_nainmeht@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/17/24 11:34, Naina Mehta wrote:
> The qlink_logging memory region is also used by the modem firmware,
> add it to reserved memory regions.
> Also split MPSS DSM region into 2 separate regions.
> 
> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
> ---

The commit message is very misleading.. You're not adding
qlink_logging, you're renaming qdss@8800000 to qlink_logging.

Then, you add qdss_mem @ 88500000 and split the dsmharq_mem into two
and shrink mpssadsp_mem.

Please rewrite the commit message.

Konrad

