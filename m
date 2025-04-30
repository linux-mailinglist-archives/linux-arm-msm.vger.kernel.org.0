Return-Path: <linux-arm-msm+bounces-56280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C54D4AA4CCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660A79E345F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24784265CD6;
	Wed, 30 Apr 2025 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xg1VumJq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4A527057C
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018099; cv=none; b=RGtlvXYsFJq6H+NtpeMMQkXbbxzZtcH6r81PCCSHc4xk4vJnpxcckqIGe5LLPqWeYf/s45wrChSuYUlJicC/SIbqw59cVUhHJxCKa1jEHIRSiOb3yEqYA4kCS2N5k6vnwmzM8qHV0I7NfZ3n3Q0EdflCPEKuei/j+Y7mso5tl0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018099; c=relaxed/simple;
	bh=HJ0MNpBmrQRCw9sK9HdpK5tunBDYYQ7B8hA9RLdeWJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NFrO5wODVDD44jiGujWKMmePwP+QVf5RQS3CZYu4iWJ87J6kU11Fjvht0P3E5ItnDWZChbAHo67qxpXz3t/gRFvF/r0yRqAQdUI3ZQ8vNsYC9qXCXjnI2RzbizBTs4xv8s2+6UGQEccgAJvQfF6QzDB0PjO5weig1+0f3RF6neE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xg1VumJq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3912622c9c0so678882f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018096; x=1746622896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SH3I77O1MdTEfL3MdKWLnHOYaZ8YnV2M8EzH5AVzyR4=;
        b=xg1VumJqYcA1GK9IblH6FBVmP77OjJaB5Q7I6Ee2Vf6wfEjf7dRzX/IGact/O5eg6v
         KhKhaAhoqi8AiAkLcCS/gqGsKly8dU23eFH1RZyMu8g3eLuzdcvPLgEFfdz3t6qu5rdE
         2tZWLPrMF8+/Gn2f3cUoKo6+YTfwWLIoWVOWOMRYoR2SdJK7VqDblWkQcTV7gKmU06br
         ParO321eAXHlc8bKJpxvAkwkcewsGRtyCbnEVaWaH5B58sGvcCllWK3dPQiBl3YCC4db
         EEiTGYYii+3C+dpWc+EL4/IHW70HmjteHoQ/Fq2sYI3htTQPproACIEIz48JwofdmV2F
         aEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018096; x=1746622896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SH3I77O1MdTEfL3MdKWLnHOYaZ8YnV2M8EzH5AVzyR4=;
        b=MJdbdILRy4DVaVRgGxhTQn1yXDM8jQ0hjjaRT5SB0hhFlWpSIJqgSZH53ZiM85Qt9B
         iaSXptIIPbCqJBcKxFPaPoHSRqM6tPtDoT+WHgs6bC6Zr3CrV6/3b93oiueqcZiU6bDN
         d/hb66O5Nw4lYRsCi0uoKMWyArHyF5hDTnvoIsyr/gtztA4d3z9gFeTU+zRdpY7e+QKC
         ZY/APqZoGtqqboy5olrXb+3kRUedzk0JTwYd0cQErcVF2P361Dy0pSXHSVGzQgroNj2+
         C7IWX4rI9Z8kdnevC1URMfYp+2Z5UNGm7Mo7Q/jRTqX/ALrcU34ynRyg678O1Z4FXAX5
         TMDA==
X-Gm-Message-State: AOJu0YwxnVG+UVclWm+pcA5MrN4/GrnHFtLN3p+BiO/scg57/74I5Pvp
	vXKr3xmT/72c1yfu4s5qv5O3GDZiB2vL5ZHhONhV5zRDRMBKjxrdYgtVgbN62ro=
X-Gm-Gg: ASbGncsaOA4N3IBEhUx6hTHE6F/OYkQlnfi+GA1sr2JkBFGsrWjRVg5um6zlzqxeFXQ
	crphDHj+HDXFSKEgak8yjbFFlcyVK+tT19oFQdpSY7t93qNUTq0n7T4z1xcpKh3cHYp+fZ2jkZs
	8lWjbym/7NmEVj1WHPeUcGusNDTCLfncb5UIDZcSc2jn6TYYcKYj+OGQG8i86qjxuYiBtgz7eAi
	OLblMUEGEiKmg6wE/TaQYmK9WsmE4jimW/NAQ/It4DgQgEt5t8YDz1pAR9kSnJRSKtR1EmtSiKr
	Y3b+FoCcoihvvbd6UBCTOz7LfbBkfLfR1Tet71n5cTYF++YcVYiMPf+Xl54=
X-Google-Smtp-Source: AGHT+IEBqMxYQSfRQbTltyFeNLAcJBYzuhFGFWWjAJdPvr+J/sinK/COHmsEoCreQ/Xji9bQuXY9Pg==
X-Received: by 2002:a05:6000:1866:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a09007e244mr807533f8f.12.1746018095608;
        Wed, 30 Apr 2025 06:01:35 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:43 +0200
Subject: [PATCH v5 13/24] drm/msm/dpu: Add handling of LM_6 and LM_7 bits
 in pending flush mask
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-13-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HJ0MNpBmrQRCw9sK9HdpK5tunBDYYQ7B8hA9RLdeWJU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8BU1FyXvyJubnZWWpHhlyoSM3xTDbUd9SPV
 SvPM6R3NkSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfAQAKCRDBN2bmhouD
 10psD/9Nl/I/ReW4K7IMQtk7o5ANVYUTBL85xn5Tru5onHKZC8S2COPO62MOh683IPy6z//4zK7
 BSmb5qO1u0NaRS3wwET/MLK1ieZyMiBYic03mZtr3I7YZ0pMn5JAKQom2h9WkOt6Bx9tapsz5Ir
 zAREj5dgm9LgUL0M+9UHP4oal4NOdTCUwHpeJZ07Y7M8Nfy3ZJgplEVntIxRwMRTv6VZbTocv2S
 hxsaWKfHVXkwWKy7A+6SkxuoOVBwOJnZZwfKlEHDgEo6ow0EW0g9uNCpRP3Zj1+oUUIDe9FKhLs
 8/y0QM5JECZry2ZEVdQufdFMbp2OEPSxzwVMPVacEdpa7f3QT1hwpYa8iSXGjOWrsGotaPw8n+T
 HE08jEI7sdx2f/HXX1O6L9/aKQKioq5WHSQsTsjLKswx3a6U4JQkIK/Qk6/OY8Uhdi4H4P2EmOo
 WpAzr5NvqDbbK0jjRv6Vm3FpovLtNoxT5RIn9TZQLuEeZSDkZzuZwPABJQ+O9m4TVoucb0PmxlY
 d2c6Z73juebij/Zp/7t6ROdddEY+qAlg0aVZpYt6ou2LMY6TqOMSeMv57NiBzJkUC3kbaX1nun6
 9MoAfcvAzjThXuqYBH0RnqDqMJ3rLmmV4XwC5BASN7bwKZI937wsgRo1IjTg2wKokIbNzCIE4Ez
 gyWQDPSon2agTVA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

MDSS/MDP v12 comes with new bits in flush registers (e.g.
MDP_CTL_0_FLUSH) for Layer Mixer 6 and 7.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 2ce59ba50ffa0d14eaa07e993fadf0f218390ef1..3e5e1e09e9d00ade74371489b2b4e50e648e2d16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -261,6 +261,12 @@ static void dpu_hw_ctl_update_pending_flush_mixer(struct dpu_hw_ctl *ctx,
 	case LM_5:
 		ctx->pending_flush_mask |= BIT(20);
 		break;
+	case LM_6:
+		ctx->pending_flush_mask |= BIT(21);
+		break;
+	case LM_7:
+		ctx->pending_flush_mask |= BIT(27);
+		break;
 	default:
 		break;
 	}

-- 
2.45.2


