Return-Path: <linux-arm-msm+bounces-83664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C971EC90033
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 20:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F7D03AA231
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5123043DB;
	Thu, 27 Nov 2025 19:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PydTTUpJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEEA304BBA
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 19:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271685; cv=none; b=Fshn8kXPRI2nAHCyyA+u3r1uHGH3+x/eqGfAf1AdQw3sp5ZEKlLdqXEelN6jCUV0Togu8N/NcSOEuzE3jofq39yIxnBPneNaqe5tlCDiTEDFL4m3hYD/1J2gDwTIDrg24YOVk7+T0MLRW6z7I6kslxy7jySZ7plX7ZFvskgFZfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271685; c=relaxed/simple;
	bh=UZAwFoanMv4ojyrr/Eavmil7E7Xl3JU5cDcURXwl0Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8Umi+UOLQsPDdILY21mLFCVIqTBZ1NSUEuUrMPRqKVu8PM8if9AmIB54e7mOAe3pp06tjXSS8/GoUnelU1WUc6K5cwZlIAAd6bHAo+iadbqpCrImQ+ihVMRomMPcP1hCirM6bLrwLHjOozlcM71uOLcBVPWZeNo8X6L0LnJFek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PydTTUpJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b657f6e24so1712561fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764271681; x=1764876481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek8p6A463hv8Si4HXmKmI7aW/9WAgbYM2EL8RGiyZ+8=;
        b=PydTTUpJ5kxt/5yCsTiXKZ8r/UtQ/nNe1I7Yq3+FICCupJSy7X5kruxNvX3Y4RctST
         u7Egx7UzEr7Ym3jpFVMur0YPH9oUtLv8bbaGNIKwF0XJl6FFZw39zfUclCJEPjgf97mh
         bL7NNOF3Cf5YfoP9b59/DTxPZfqKyNtclhhhvxnT1qmXyl/X4fEPn0bDZ2uSzwxdW1aw
         l0kxq9/O1ZfQjuAQx5YrzVYZUcDqq5bWE+PaIh2gJv4ocHUfYk5ag4dQuVfYgix9ZVRK
         kxqNcX3Kgz0HbEVxfpwSH3T/n6WDGFsHmSdA4C/hT5t6cFP7XunMp0XA+MJSbFR77pa5
         pJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764271681; x=1764876481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ek8p6A463hv8Si4HXmKmI7aW/9WAgbYM2EL8RGiyZ+8=;
        b=PNMAjZ4eXs5UroyMjzAxWbO3PHBoiHeZx8ytQVWwAfS/CzL7/tlJKEIZxHeAJpKtYj
         8I1aLJ8uLUjL3sZ/KvMcfX4/tcJSNNpTYu8d5bNKFQ5CVlBle9imw5/1sq41O7p5tFmd
         drnfXC6DOt0Le3of85BZOANdxm8b0eLTKnlhBvGCOnSWQRQMnYDXFzGKusICD8/EalJe
         cmK338WhaiRDs/rFhBze92uof3lgjYIG2UmWS/fJVY5ZimptWY1E9fFvufawohSdMJ64
         QIJAlaqXQk1M3dSagd0HKn0w/AiNx+lXWLWW/8CNd05da05q91qUetEuA9WPnBGqZ4qG
         /Raw==
X-Forwarded-Encrypted: i=1; AJvYcCVxXa888gTdIErCA6BAIxTMJgMprGi8BXib5N9+BwJJqbEdY+7v9eWdK6xWQQADvma5VF7/yRkE3OFmalf1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt0zXNPq4iSW7RU4jqkcfnon1REta1fFSi2W0w1IuJ1NH2+Bno
	xP4J/SbtBPi8WLINFHrnriw2uNTgrtJFihBPAZFumMsrRq3ReV2G8mCHfqzZivPNTu4=
X-Gm-Gg: ASbGncs0w56GbtCTwvZPxUnkgpRJTZE4/56poACnR1veGY3QDw3FgkIXgZ9j7CNGyd2
	Yt1+4g3HlJkm2kFi+aZP8fIinm+oZZGZEa+rU7RmndpBYSfsOmtshg0IHdBSoAJ8DZ/QVmbN6O8
	N1/OnA9uxaNCDRCCskuVUJ6H1P3M5LS+jNO1XT7yefTbHtGj5pFuH9pPr8zk6r7wIxAkl1Pz4ZU
	fYf7DTsqMsTvDIAKEIu3hnpCzZzNinkLJv2KxdAe0YmvmrZdKb3BVHVF2Jv5nztG9wLD9IDh0dg
	7AEyOKQDTI1S+sOCBFN3V79ilxce+NAJXZv7xoTlT3JN9xy2k32Ibd7GjfSSOn4qB+alXjptufP
	eWNVWdlOJT9/yxnTSO354JprY9lZ/HOB9rl4JI0j6rxfyMRpv+HpX5//TKhs007hZ38emEVZjhE
	G2Rp+GI53vbcORNAwG2zzJMD1UvpaU7SOpbQne2KE3Lql2gSsCW/wQpfi2sM7DuOt2bA==
X-Google-Smtp-Source: AGHT+IGFumLAM3mMcRCHGRJUMc9x3tdPoRtxoU0CKQ+nP522dxxTt8NUxY/84RLdyRbRJSje7zoHQw==
X-Received: by 2002:a05:6512:3182:b0:594:3a08:162f with SMTP id 2adb3069b0e04-596a528b52cmr4878262e87.1.1764271680595;
        Thu, 27 Nov 2025 11:28:00 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48d67sm606630e87.74.2025.11.27.11.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 11:28:00 -0800 (PST)
Message-ID: <ec5b3a20-f28a-47d2-9b71-ef5d2af8b41c@linaro.org>
Date: Thu, 27 Nov 2025 21:27:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] clk: qcom: gcc-x1e80100: Update the SDCC RCGs to
 use shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Melody Olvera
 <quic_molvera@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
 <20251127-sdcc_shared_floor_ops-v2-6-473afc86589c@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-6-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/25 19:57, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

