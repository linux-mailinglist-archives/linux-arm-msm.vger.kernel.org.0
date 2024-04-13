Return-Path: <linux-arm-msm+bounces-17375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA7E8A3C26
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 12:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EECDF1C20F54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 10:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627F83E49D;
	Sat, 13 Apr 2024 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L13OnTJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB53B3D982
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Apr 2024 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713003079; cv=none; b=JWKolxchBb9KEC4sZtB0TeOwpChEAHM9rmiq9RUme7i2IZVtw9op+r6W31KfzOJwZYGP+gF/CEqY7Sj2kGL+UL+7QZJxCbFTuvYs0M0jA796gZTI7JI6adJvsYglsYR1qoCD606M2t9e9OAICpgd5BhrBZsvHUYNNVYXgvJOf+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713003079; c=relaxed/simple;
	bh=xcTftBjRZvwlkk8acKfxRbwFXnReE8SDXxuve6hq6xg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R6VULed550u2m8XAAifUSRwoxqKWInPCYKq8QGhk3ZsmwLY0pEX8tzvjHfrxESoQH000hyV84olK9JG7OrsP/dbpCEYjKS6VK4B5c7XFSnLp+GSXNm2QUq5tRHAw1ZO/3j/q/qfPLIMmEd6W1snC7tPUKK0iUzw1Nr3eRRdZbBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L13OnTJT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4181e85de8fso2622375e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Apr 2024 03:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713003076; x=1713607876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbKfGuYck1Dd0mERclSatwtewewkeFmLREd40MUNYkA=;
        b=L13OnTJTvBTzDIbl20wO59bz8oZ/kGxW2/gd8EySHlOlWLmfx3eLAFeneJ4NrSO1eV
         WZH69S5f+AeUQnGbfwPSl2f2GpB3HPCAdh3D4Lw01gyGZLTgv3b0NuKvmkw1w0n5ndb+
         3ggNbDJBWQCYJGgDHMLTOnmoMJmZ605rQ07p7toBLUcbjfvql8OxqJLMKi3aibHY/AJY
         yxi/BaW8/JU8vlZxggN0OjAC6Ja0tVDvgKIe7VoMCkaf0uG5LhFTL4vCdz7M8xjJn5gO
         iRdXdJNsVE+uG3pej6+hrjESSS8TkNNN8Z9CQvquffQPQYoiZBiJk5dy5WhSGwgNVoe0
         jiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713003076; x=1713607876;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbKfGuYck1Dd0mERclSatwtewewkeFmLREd40MUNYkA=;
        b=lfoICjDAQMobl/DDblqbo2tdJN+Vr0VWCOQZJm0U6/iiruYyTFCk+xTUVH+OiXe0eW
         6lkK5SSDIxk8Q3i4Z4rCBHcliakKMIcUJk4oGEcPWIAaaFnZ6BiqHHfojNQ8soveJGVJ
         Art0nlOZbxz/HOdZwy5N9GK96hOYZYarGLcKI76iha4m4QvsO/FA/mufUfoW1Mn5Lo32
         00YSVQ0jv6zL7G+zClP2HPwtNHR3T3baCXSoFNqatUmmVGVP2e+hWROlUk5re0wSO8td
         Ln9CIAq+VH/Gj1C3FCrpDHGtHRCupy3dEi5cqskSnHVpVc1PoUuDJGJTOfTxkO/4beT+
         GlvA==
X-Forwarded-Encrypted: i=1; AJvYcCVOrvmRuXywm+LeDRmnT7gKpX+NlwojyxpUfxREJRGmbfT2fwUph0KdmqtW17Nbg7JRglEryE8WtnOBvUzXpFQ7tnV1PY8LwZ6QQpc9tA==
X-Gm-Message-State: AOJu0YyezOY0bFylz34FxKAOV8y1KRQqLcRomdYa9T1NB4ktTm6ks/X7
	Bm7vq+GqHdPhijpOW+9P6CFcpeg9xiK9uwB6AqYHIC9Kvrw804sCw7WHW2dqSo0=
X-Google-Smtp-Source: AGHT+IHhRdVLgzREwxCECb/fYsU548C+a1eRJL0NJIZN6+VsDOHADU/O5DcTROxt1Lrela8AVF6nXA==
X-Received: by 2002:a05:600c:4510:b0:418:ef3:6cfb with SMTP id t16-20020a05600c451000b004180ef36cfbmr2033253wmo.26.1713003075890;
        Sat, 13 Apr 2024 03:11:15 -0700 (PDT)
Received: from [172.20.10.4] (82-132-212-30.dab.02.net. [82.132.212.30])
        by smtp.gmail.com with ESMTPSA id gw7-20020a05600c850700b004146e58cc35sm11773696wmb.46.2024.04.13.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 03:11:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 David Collins <quic_collinsd@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
In-Reply-To: <20240223232955.1907552-1-quic_collinsd@quicinc.com>
References: <20240223232955.1907552-1-quic_collinsd@quicinc.com>
Subject: Re: [PATCH] dt-bindings: nvmem: qcom,spmi-sdam: update maintainer
Message-Id: <171300307446.22846.7815957106245497089.b4-ty@linaro.org>
Date: Sat, 13 Apr 2024 11:11:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Fri, 23 Feb 2024 15:29:55 -0800, David Collins wrote:
> Emails to Shyam bounce (reason: 585 5.1.1 <sthella@codeaurora.org>:
> Recipient address rejected: undeliverable address: No such user here.)
> so change the maintainer to be me.  I work on qcom,spmi-sdam as well
> as other PMIC peripheral devices.
> 
> 

Applied, thanks!

[1/1] dt-bindings: nvmem: qcom,spmi-sdam: update maintainer
      commit: af868167a7090ac3c065580cb1959fadac3cac87

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


