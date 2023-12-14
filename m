Return-Path: <linux-arm-msm+bounces-4814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A968139C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 19:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02D6DB20AB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251D267E99;
	Thu, 14 Dec 2023 18:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5Qz66p/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868DECF
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:17:47 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50c05ea5805so9962470e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702577866; x=1703182666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V996eBYA2jf5xw2cGVFX9AAMXUTvaenYf6TgfjPDZHc=;
        b=D5Qz66p/qqsRZPOsFw5UkY/mtHxmFRkVAcB+RsCc7wfq1Kn2EIOsd/mQc8Lk/Ns8AF
         0T9YjZ3ISDtcmGhMPfIKWwqYElH9fxSP5m5SL6+EKUorMqkwrPWkt2Vpt06N6uv8pUEr
         OLVxmgo7P+L399VALEBXfFLJbwqGHGrbAAOS8fCgGeg1mozIlNPZ9/zKb8n6k+WO/9ye
         yXGu+o4QSNkPorCAlpz34pErCT97Lpo/Jjs8IdKCEWVa+w0bfXniYTmaZUnChPZrg/y+
         0qCY4Q/+DnmINnA/Yjmci1WMaw1dx0Gn1kHu0+HpPIsB/NRJcFM+45j4XUQDJg3+6o0g
         Q52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702577866; x=1703182666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V996eBYA2jf5xw2cGVFX9AAMXUTvaenYf6TgfjPDZHc=;
        b=deckDbVhUDIvMlCaKGiKHBWXFhuhCMEXXc1WHihh2Kr3Fmq9OaH8gcrTX+twm9TwUf
         35cCkOvFUjfXwfPzenD5yRurgybwExO+pr+PtQmjQXjmK+BWdNCVEbjR+mfAeAJa5cG2
         u+usW45s/pJOPyeSWaTq9SwfaEJpncBi9eMuSyxs4M/7+3b8BF83UqjwzNiMjN5VnnTC
         mOEGVfV+QzGz4Qc+qGO0pmdq4dkZE5dT4NG4boe7nd2TSYnxxtBG5tPYUqgyLUOPulZc
         VGTVHKyMqPEqkxULssWfc8bF/CQaEFBp/sFm1Y+hy8Aub0MQf4qBzdV/glvQ9PqpSUBA
         ktVQ==
X-Gm-Message-State: AOJu0YzJH5+EfJp+Calq+7vpT4kJHQIHDDofHIkho0xmA5RevOiKfVv5
	1SxAcnjzAp3cP2tVzjikDS/qig==
X-Google-Smtp-Source: AGHT+IF2DbL11C4WswCDCL18BClKmLGUaGi2aE5JR5xUyvvipdw8GT/iJuHXV8rRDu2pezFGZS6/hg==
X-Received: by 2002:a05:6512:b89:b0:50b:f351:6fb7 with SMTP id b9-20020a0565120b8900b0050bf3516fb7mr6979265lfv.0.1702577865694;
        Thu, 14 Dec 2023 10:17:45 -0800 (PST)
Received: from [172.30.205.72] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c16-20020a056512105000b0050d1a0e7129sm1659686lfb.291.2023.12.14.10.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 10:17:45 -0800 (PST)
Message-ID: <6f3c4692-ac87-4852-9a60-6df64ad8a803@linaro.org>
Date: Thu, 14 Dec 2023 19:17:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: sm8150: make dispcc cast minimal
 vote on MMCX
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
 <20231211154445.3666732-3-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231211154445.3666732-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/11/23 16:44, Dmitry Baryshkov wrote:
> Add required-opps property to the display clock controller. This makes
> it cast minimal vote on the MMCX lane and prevents further 'clock stuck'
> errors when enabling the display.
> 
> Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Only patches 2 and 4 made it to me..

Konrad

