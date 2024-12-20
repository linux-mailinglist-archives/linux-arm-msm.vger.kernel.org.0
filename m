Return-Path: <linux-arm-msm+bounces-43001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61FE9F975D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 18:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E37D07A32A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C4D21C9FF;
	Fri, 20 Dec 2024 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mwwe/O2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406E2206BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 17:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714040; cv=none; b=eqgTrMdSgp2jVcKkUoJ1Ls94hU+IiPw1pgXd4A+Bm53mVJNlA9RViL8w6pamdXoN2myVutgq6w6peNtjqtoZYUMFrDnH4pLLjR/BsptOPzTddc/ozP1fSmxeT+Lf7FbtgUoQnkgAqxS/nkXBBvowXcmJN3drsvB8vhOrwO5sH3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714040; c=relaxed/simple;
	bh=IDIsEwpQxky8+42CT/WRnqpHWTdUYjOv/TDVr+kY0fw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JQErg/gSQVPKEcgnUoTvyyX6pOF44Dn88VkChpW8tM3DJ1C03TtEktT71gGbEo3ET+FiX/gHiVRmvpkIPRH+QvpzBFSDur3pNF1KJIh51waErBZcih22L3gTtYijrY6ijOBehKtGBKknpdYEsxnYtO/Cg9m2gYyMdNNnM0531Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mwwe/O2z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4363ae65100so23300345e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734714036; x=1735318836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK6y7RfwZKL78wz9SHO2m2rgbMAGzctH+wuLbcNhNAI=;
        b=Mwwe/O2zHcUi2MCxGNaNQL44tPelC80YalggECH6zpUd2ePUZAPZtih3juiZNXI8Hu
         DgjsJJ1T15nIXihEWCB2al+v1RNqY4slti+N7nQA6JYMnlZPZ1WAQzV9WrC4I7aJ6ubj
         YYW4LVyVNs3WZmJZuvLMbRnyHZsI5B5DxBUOx+zn49KlX6PJKInu9+LBYFBIVb9dDSCX
         5cg2zs0uLe17IS/dQzEeeSwj2sdvVyixsQ6WX9h5s4Cryh/4uoxqw4r6jeZ+B4H+r1Fm
         vCYdIZ+y6ETE8W0s/kqTY9G0xzCTELLU+GSRpMh4hFlUP9RD5uDUTY9A94jvy7dSpJlr
         fBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734714036; x=1735318836;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sK6y7RfwZKL78wz9SHO2m2rgbMAGzctH+wuLbcNhNAI=;
        b=tNxwYlXgMl75nC2L9CT0j8jcZdpQTTgwCGWYsgvudivCLQu30pqOXYkEnoU9ylbnvI
         9HvXv16QdP7naP63L2AdLEYEq83RAqdZCxW/L4heltBoAr0q2rl4SKi6i8nr/xseeplT
         Lt2Q3XvVACTHgJAvDuQs5b8pZ9Q09XbiygpuUGWB/9QJWoYL4BQC1BD9D3r3lk8xb6qu
         8jmNUevw+8y0f98p1r/GsXk40rPk8EySCucQN4Qxcc1oYmkDJsHdGrac+P3s61oMcsXZ
         5ZijdTX8gzlpyxcMh/evqNM4qsqs3aBGBJ6+Yqe0LopbpJli0YLpGn9ZYLGLA6tuNLuN
         bjzA==
X-Forwarded-Encrypted: i=1; AJvYcCUmT674X9iC0Qtv03K+7Oe0KQ/S35xQXX1ArBb+xt5sCbBrJwlxFbsd+pQjhmzJ1uKEZakgONTLQ49Q/00w@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc5XN6LDi91KfdKyNYJuOPChDR4hABy1mage2ngzi9peFYB1ZB
	FQY1DUDDwT1QmtfVTBvYQu9jb9Y+QNCJc4koUE6Q7fqoNaiZxT9MwsPMiyRpHgyto9uszlHT02m
	Q
X-Gm-Gg: ASbGnct9ZjJ0d0h8daYOJfI1X4653Kq/53YN/ommHtUhUZtRt/TWxwxVfPRp2GuPNp6
	c9rfG8jOfms71N9ZtgC2fGIsNXmDjFOhKmn0H7TzYdx7zdrTGti6eVhl580bGGn8NYw/MbeLjrs
	Rm4B/ihuMdiU2aW2IIPNRUCMuNpT6TR/mePXga6mjCLLx+Ijz4fxnSy57BEbdlH4+FbZIFNheBj
	DlIeD8Si6kYVCGGDIcCWYit7zaOL+FyelDAkyW0AQfraDWSqQ6VMvZcQzvTUJ3upQGqeBfFbig=
X-Google-Smtp-Source: AGHT+IEIow7W7jlzekjBM8yMzgTeUbMzT6YnQhflYonoeJCqHySWJS3rP+z9Y68z1AcuWg4pRLt9xA==
X-Received: by 2002:a05:600c:1d10:b0:434:ff45:cbbe with SMTP id 5b1f17b1804b1-4366864414amr38292285e9.18.1734714036167;
        Fri, 20 Dec 2024 09:00:36 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e31sm4437915f8f.33.2024.12.20.09.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:00:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org, 
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
 andersson@kernel.org, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
In-Reply-To: <20241219062839.747986-1-quic_mmanikan@quicinc.com>
References: <20241219062839.747986-1-quic_mmanikan@quicinc.com>
Subject: Re: (subset) [PATCH v10 0/7] Add TSENS support for IPQ5332,
 IPQ5424
Message-Id: <173471403487.224698.3739532865770865065.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 17:00:34 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Thu, 19 Dec 2024 11:58:32 +0530, Manikanta Mylavarapu wrote:
> IPQ5332 uses tsens v2.3.3 IP with combined interrupt for
> upper/lower and critical. IPQ5332 does not have RPM and
> kernel has to take care of TSENS enablement and calibration.
> 
> IPQ5424 also uses same tsens v2.3.3 IP and it's similar to IPQ5332
> (no RPM) hence add IPQ5424 support in this series itself.
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: nvmem: Add compatible for IPQ5424
      commit: e976eb4479e967cb6dc86b6e46554648a3b8f37b

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


