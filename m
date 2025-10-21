Return-Path: <linux-arm-msm+bounces-78150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 297A0BF6058
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 13:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2E41188F665
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E7832B994;
	Tue, 21 Oct 2025 11:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dRNc9TcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664962F4A1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761046075; cv=none; b=UGIZz5ABonpHE+dx8IUIKAQBujNqQxl4Sqh74MdFC4KzmKEXnYF7WZOOT8ifps5yZqE6+xlWYTBqO0VNLtMBYFI9wtIiPSn4weOeb5sPEYxkk4/RakPXVD+eQUdTdtPjb0v4aaF3FCMGTHZ0WE5u7FLej2DqjdxripoaVVx0/5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761046075; c=relaxed/simple;
	bh=XwK3B4eFqi6bqCPYWqhOCbr8BhBcCJQPVuxdp+E6HLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6h8FirrnplT+kpEsy3Q4m15ggTnLjWobbY4olutbcSXNBqTu4wmLqRRaBCrXOhtk+PCM4PHFvqy1rpDrn2C5jb5MZ5Ig9RjB9GhKiyjBplsAR/PhmJ9rCUsZLBEj/DoLBEHj4+qIFzQ36A4x4rqS3b4XwVACdrkK75OXEFNEZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dRNc9TcY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso5449354f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 04:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761046071; x=1761650871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4sFpzlVevSmJgUzGev8ONEttz1Yf2GX70+x9wdfvUro=;
        b=dRNc9TcYSN8QzpABLT503/Wn3fgyLWxoIX/Lx0HzWXV6cLmvM08qk1us94Qr3gatuO
         l6lJQJsrmEtfmVRJYryYAJqdXa0gS0lTip0UfJw7//Tcf/A9ykBQyySakyDSZ7XH1qfR
         duu1tNMLzTbqY9zEGLI662ZuFlX/s9fPnE+KJbOG5Gx7T6NKW5wiyNxBXtZWil50V9Qn
         RtwsneBImVBWt0FBYWUbrset6K33+RFlvlJAFzcgRpVDH7zQdFZwd0D7slg8wAL+Klng
         s+KI/0bH2ERsz1awpgOs52b5Wvz8dLSmzPzwNYSBbaxSHxqIm1rP6bMNT+U3xtjYVNXg
         WCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761046071; x=1761650871;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sFpzlVevSmJgUzGev8ONEttz1Yf2GX70+x9wdfvUro=;
        b=KHzY/fIyA7NslOVmE2z5XU6rtIsgyuevBTlJn7G52es2tHRA9gtw0ARn7qZzN2TmWV
         iWjkRHbCx5RhgUf3eOf9BOdqGqCX1uMXUsZc9/99wUeCHI6/kQOwW3wVPjuVB5e+zqXC
         cFF9BbOWKcLk0CrVe6RIzMvGOxbAiseLihls3PAy/v6hid7yb1aX2DKk2rHFHGoTFvch
         1zCD3PmTA41D8swodWROM7AZWhjWuHY8sSyzGqYzVae6fA3GcXiy5rXopPMh8UA3lMPy
         hGK2bKMT2lKgVZf1XhY+txIaiynTeFhWKdqm428ElrioGGA6vuXIGAzD8kGIf9ilptvD
         asbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs85lSdjQydYkSvMMiaSzrC5TUq9435kQJTUDQzMmrGl39/1khQzhkjd8kZMVCIEvJogggRisVMS7+4CjN@vger.kernel.org
X-Gm-Message-State: AOJu0YwHz3aBcxwAdYbuBmHT49z1kJFwsRDDSO9JxfkagfMn2fu/ERZ9
	1qxwMXe0oM4PHNdgJLrvA0Gq6Wfo/49h1gXvviHx7RZqgtjXbzf7ek8f+O9Xa03NNIk=
X-Gm-Gg: ASbGncs1hdj+j8MSyyuRKI54Ljj21W7cA5biRjuJNTu6kKI6dAesx8SNIqzFRV4fUNO
	YXqLo9+UHQhIqDeI7ImCYzBLXIkPeELWMdzthFUecjymtQ2GkqbKbB4CGK++fHRqcTFStDtS6ro
	jDuHZeUTeWdyREcMAbTDIgD9MoPehuFgxXwLgpAdlHRi1D0Ha2xD24o1SXC9GHllxWfyzQILiu8
	umNaBwsk+3l4tuKaAVg8pKCGKXrYEVEtQVrqAX2HrLhS1g/tbgI03LhsMH7CC+SriBDxtM92yvr
	yhvlqLv4MzX/0TJoT+Zp/Dx2D0PT2Wje6F1Q1D9Ja7pEBUaPWmbqOCGDAYpmFUboMurYZGrWDMG
	GwTLJAHkCq+0kp228vlpDEUgXS5zI93nbQaB3q41OYopEwtsiMVEHNxDB8Ejgqi2M6lalbNvsrG
	skewNF29ADcPM0TsoEcZNA+4SQbGPRiuipfMl99lh9dMbLS/I91nw361mxIZc41Yy0
X-Google-Smtp-Source: AGHT+IGV/ABVqWV8MsAww0waMr7MTa0bjI7NdLpLREyhUO0GVPuR0EgaD4ahBwL15tOIyvx1SltTMA==
X-Received: by 2002:a05:6000:400e:b0:427:9d7:8720 with SMTP id ffacd0b85a97d-42709d78893mr9365897f8f.24.1761046070736;
        Tue, 21 Oct 2025 04:27:50 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce178sm19861570f8f.46.2025.10.21.04.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 04:27:50 -0700 (PDT)
Message-ID: <c80e6d85-e1a7-4b04-9e84-7f0cf1a983b8@linaro.org>
Date: Tue, 21 Oct 2025 12:27:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: iris: Add sanity check for stop streaming
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
 quic_renjiang@quicinc.com
References: <akmAGosBEsOFS3HpzbJdYH2z103MndEu9B6T4EBnkbPiuBpzCzjn8LtnVr-lJ0PHOqR0jYiIXbnPTwJR0B3L0g==@protonmail.internalid>
 <20251021-iris_add_sanity_check-v2-1-476b3107a8ef@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251021-iris_add_sanity_check-v2-1-476b3107a8ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/2025 09:15, Wangao Wang wrote:
> Add sanity check in iris_vb2_stop_streaming. If inst->state is
> already IRIS_INST_ERROR, we should skip the stream_off operation
> because it would still send packets to the firmware.
> 
> In iris_vdec_kill_session, inst->state is set to IRIS_INST_ERROR
> and session_close is executed, which will kfree(inst_hfi_gen2->packet).
> If stop_streaming is called afterward, it will cause a crash.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Requires a Fixes: tag

Then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

