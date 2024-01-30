Return-Path: <linux-arm-msm+bounces-9033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52018842473
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 13:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2A2E2882BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 12:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB5B679EF;
	Tue, 30 Jan 2024 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lsJbeNMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E56A01A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706616429; cv=none; b=tX2Ub+nEo/X3XWCAMlOTujafkHocgV8lFJSD/cxSj6lpAJV3IFWM1Q1mj4pspGR0mHhZ7XBd+/kw/vOWSvwtuI7EKKNCe3amRBSriwfyK5SJtkT/Wh0EyQBM+tCVKcWlqaWVZjHko+fa19O3EYwplfHV9q7XDlFdCaugY5wAH7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706616429; c=relaxed/simple;
	bh=E49Rh7tkKY1c9bpiYttLQZVgGF+8sBP9Up1Nl8HCkQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avbGoJzpctTOCP7PXid8d56z/qtj2/Hk9P/2b0cJQxDl5tiT1LxTkKjU/MHjtx4nU17OVXBrBSfalEKSPCc/rUOmaii+mz/kaE/SEDs8l6igHYcTm/PP7dyv8/zieT8Ij11OI8x+xtWdn/lb+ri/LhPXdHzlthylVSlJNRLfYDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lsJbeNMa; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-429d7896d35so39037241cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 04:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706616427; x=1707221227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyBHy6pI3FKKoVKb9OTIKEEMGOtNOKqEi6iRWPGhH/c=;
        b=lsJbeNMaof3bmaWqD/r6lc1YSyptsdWZ1NpcSbtjS6m53V0Fx1aIxAxOfnIXlz+Sqt
         2GOza1IZgPeDPEahoQpFkByFhGhL3E3AjKL3/7UhW1opUVIvZJY22veJHKpSvf97IdWn
         taCmuRlYE/0/23PS0ETh1gB6DJa3tmmj6BSUDjQ9w+oC6nuSRDEwtMMnxtBinweU+SRD
         43gsUfIE8RlW2OioNsYxfnJPXzFKxyiaitQ9qCO4j4eRLpvp00Cf+gbHssu+/RM0scCj
         Ws4vSFr+mUB9sLHEP/nDHm7VZkDQJX6J5VbNELQdA5DQIqacwbGEFlVYRIe+2STQ24Cm
         dZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706616427; x=1707221227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyBHy6pI3FKKoVKb9OTIKEEMGOtNOKqEi6iRWPGhH/c=;
        b=dXqhDe7WYodwYd90v+PCRgyrB6a4ks9wdiEAg6YmqwaiyiIL5C7osDH3uvvPQHbb/R
         rdyPKrurP+6Yyz7t9fMxtQ60U7nqhr0xOsz15eZFbg72b6u1Kea1pktojs6LwLpNY/mj
         KFsjyzg1JR39tm7+BPDszAy1ji6CQCfpbQDAy79vip3y8LLBC6piHi84ykBmIwjgJo5x
         9H0W+0iJcwmZFQGGXqeemUuUyqQqR6G4EqDJ4DDM7V6Vw2UC67mx7lpyQrgef4jRPg/m
         WqYHe9zOoh1u4U4casCmD/Q89qBp7yihRK24FegXYIaWotHveGzc86pKfXlP1CbFuVtb
         grRA==
X-Gm-Message-State: AOJu0YyOD5XSv+xH++ANraQ5rMyMDHHvu2VMQ+oauETPq5gXG8j3eQ5V
	DWpX/tLtytz6vpb1A5NrUgphzurTUL3GyGcsv1i5XpV+3ygSY77xtwcBhEunD2c=
X-Google-Smtp-Source: AGHT+IERY9Zv2jVzCd4DvnU6wA6agETCSIskOYvzOQIUam41P+N4PPuEHCzoFn1GMey31SjNHSsVEg==
X-Received: by 2002:a05:622a:301:b0:42a:6e58:6746 with SMTP id q1-20020a05622a030100b0042a6e586746mr9743162qtw.81.1706616427104;
        Tue, 30 Jan 2024 04:07:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXUH9FEea4MA7CbUeiDaF1BqWKSWk4sK+zCApudPeKt/JpEUuB5eQ6iVRhv/uzJWHZ2JiqOmuf1cjCYY8Ee/idNV0RbW+nfZ8+fxJjeK44CmpwgPqJ4lyDgfXlZBP694HjrWQ67ihmEg8JsEbfMDcq5SgeUVvGbXd7z2OzXcMWxVXn6w5ntZZ6AhN3X4Sx7HCBsZnXaQjrFa7OSDGYBiOdrmUt1PFIK8bBmKP9RDxHQclVqcUeVUD1Ynzp4NxS8uRx7eHyrlJfJk5RtUNalx/Wmhpw3eoMjQkE9cKT0BUGAs8S6nKxdYa9rJD6LY1ltr7e3UXu3c2JzKlM4vTPa98SHCQNyd8WcdpszYTdHJLa41uS9yfm+cbL7IYiwVXl7yu5HCuv/zsjV49DY4G/u4EAnc9jlJ0DzTj6e/d7cYkohWKwK1Y64eIqaK7H+edx/IMIYPUWQYxEZBYcxfr9MwjZaw2yWBPdIuz2LcMDtxJ89SWCcYeJP6VcWWTB07waFuKxB3j9Yj10KNFnBqThmPB6lfdLePVQvZt7GyB+A6WFqNN/ySZ+nD6zTsl6mrWyeRdEFvhuCYZAX4yzakNv4rcSmKwi+G2nj2Ist+d5NM0ZcGCbzJMvJBTFJOWWMTF94l7LCCcfNDmV/nvilBfXym6SGH/432QbEj71DvuFigYvPo/7ivacKoy7cMFh5qmecd3Vs4+BA89dRSFdiY4A98huG0ikX7W33/Y2PTsX9Pf61arXohYfccvP7xgRFRLGxCWZ5b4y3RwMionN/MA==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id bz9-20020a05622a1e8900b00429d3257dd6sm3274367qtb.45.2024.01.30.04.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 04:07:06 -0800 (PST)
Message-ID: <84f63696-7e5e-4824-b80a-be12a32d90eb@linaro.org>
Date: Tue, 30 Jan 2024 13:07:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 0/3] Ethernet common fault IRQ support
Content-Language: en-US
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney
 <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>
Cc: kernel@quicinc.com
References: <20240130120306.4120632-1-quic_jsuraj@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130120306.4120632-1-quic_jsuraj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2024 13:03, Suraj Jaiswal wrote:
> Changes since v12:
> - Update correct sender email
> 
> Changes since v11:
> - Update debug message print

The limit is: one patchset per day.

You just ignored feedback you got...

Best regards,
Krzysztof


