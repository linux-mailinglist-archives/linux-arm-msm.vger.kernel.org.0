Return-Path: <linux-arm-msm+bounces-392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EBC7E7654
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 02:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1753281556
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 01:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8723EA9;
	Fri, 10 Nov 2023 01:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YOSW+L+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6A7A51
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 01:04:55 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A773ABA
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 17:04:54 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso10294285e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 17:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699578293; x=1700183093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBeLT8khJaQLixVgfl4LSRyi0x5wnZw3atoglLJt33I=;
        b=YOSW+L+fMiXOUL3vaWFzjaTOzh+9TE64dV1xxBbmCgfMNLNpqduSOoYq11RwlmkC2I
         g2W5F9q154NZzKAHvow+ukRKo/+WzcIhjlWMqJjksZ8AglK9IjrJWeGhvlENJrMzYtEF
         TuwTDUxC8kKI0PVdnCiapVUzP834OR5RHWn9uDbjHtqHrOhr6HBRwjNh0k23WtgoWqQ6
         gnGw6vMS7euftbObreSw88hQ6IuOe42pfQv5s5bx9m6l+8HPcWnHhOiL3cHLR6+Y31LX
         GkV+M2E5OMgKKt/uxnu8b/SnDm8KrjUPJkJ+lvAcu7VTayZqZ/Ncv1o8ZW3NwQngDviB
         RClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699578293; x=1700183093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBeLT8khJaQLixVgfl4LSRyi0x5wnZw3atoglLJt33I=;
        b=Lah6ZQ46JiEmg2UTioqd4k53TI9zWXduCTlSvm3+1kciekUiWxGavoGN3QdXQq9Uls
         704w/DoumgMcVwAJVmrR9CRIS88O+uFPAw3TgpRQvrYHWXfx3MdeMKjVyMe5ifiSqdPS
         GM6dbf/bOEt4XkO6VtUbzS/NYB/6ZroXu8JVADGZO4EBAuvwkaI5hDQ+aly9q4OeHXKr
         HYFtlNv17Hs3QhRlcI13oCD2ngdh9ernYqrIQwSaZVDdvMLCj04nQWZ18vzUJt+wfo3o
         llTQId3UEdtjmtn8qkIE7SO4z1aWLoYijND+cdPnVs+bOfo8ad0t4hJCMbi/vCzicha0
         6ETQ==
X-Gm-Message-State: AOJu0YwB0K7e3mashfzSZpWJGap9V+KlYvdgkk60/CszrjjuKTduwELK
	/TFRYLZsgna6kZC5WlxTHXKIKQ==
X-Google-Smtp-Source: AGHT+IGSsehKg1MV6Gko9IAhZKt363sva3uyfgouhqLdN6o31S/mQFPVZ+Q5YqSbangHdJ1GwPJIog==
X-Received: by 2002:a05:6000:70b:b0:32d:a13e:acce with SMTP id bs11-20020a056000070b00b0032da13eaccemr7013527wrb.13.1699578292887;
        Thu, 09 Nov 2023 17:04:52 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id d1-20020a056000114100b00326f0ca3566sm820562wrx.50.2023.11.09.17.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 17:04:52 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 10 Nov 2023 01:04:47 +0000
Subject: [PATCH v5 2/6] media: qcom: camss: Add CAMSS_SC8280XP enum
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231110-b4-camss-sc8280xp-v5-2-7f4947cc59c8@linaro.org>
References: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
In-Reply-To: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org, 
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.3

Adds a CAMSS SoC identifier for the SC8280XP.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a0c2dcc779f05..ac15fe23a702e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -77,6 +77,7 @@ enum camss_version {
 	CAMSS_660,
 	CAMSS_845,
 	CAMSS_8250,
+	CAMSS_8280XP,
 };
 
 enum icc_count {

-- 
2.42.0


