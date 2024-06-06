Return-Path: <linux-arm-msm+bounces-21923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 457C88FE73B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE7C728302D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A01F195F23;
	Thu,  6 Jun 2024 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O21b2Go/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA98195F06
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 13:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679480; cv=none; b=Whm9EzBnPMo/99WOJn+NFyEupdabOSpe99UKGax+ymH7DR2z+0349Nqc4/Q38xqZPC6qxaXHA5qj+jqh1K1Pcnl/rj8jBMI+MKMEY4ZJOv1WEeDIIY50Hg9L//wkIxLVr4M7+Nal6cNusE+C/U20GRHXMmu3r2FBqEEk+SmB36E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679480; c=relaxed/simple;
	bh=1Y3+cIqmVZ/V7Z1/OIiPeC1puRSpffYg9rUl21hS9Kw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l7BXzAsncs+ymyvcEmAOhfj3liGvwy7+bJORllotvFxYg0FsVKsC6eC2NM6mQOzgf55gYldPF0gulTO8DqhoS8SswMo6aYvcXdfW5n6joRic61fb7XantFrQZVJnG/3ylXegY6kkRrS9XJM/6OR7TzlLe6n0DtTtkojfZyTBzhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O21b2Go/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52b912198a6so1179665e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 06:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717679477; x=1718284277; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suChROXiHSFSlTvSV9WVyxzVnPvHS4KUTzz3cCHs5HA=;
        b=O21b2Go/hkErnx4Vw7Ugv17GUh02Yh3u3faOD+g5ZSxcbY4I+wwkM1pq3WzyPJ2XCQ
         7wSesbG6QZKZrTZIrmCQm9Cqk/X99D3H2ZMx9TXfO6hBeMqnw564zAHmP8tiwzVAR544
         WoGwZFs+zanbXaxFlDvBDbo0ZMh2xnpqL8NgtpgxvD1b5HezIrKq1LNgOkgW5Nfasv5R
         /fgJFnfySgk0/G1mm+kHZ/AZ6d/2esxopR1t8UxOgAaaVYWFFYI59Hh6cgq/x6n+bExe
         Wnina6jbzQDl0RL1aYJkSs+gJKEak+KS5Q/VpFBH+5z/E9s94wweTHzuXbue3lpF8i4Y
         mOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679477; x=1718284277;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suChROXiHSFSlTvSV9WVyxzVnPvHS4KUTzz3cCHs5HA=;
        b=YD0y0GX6IKYfDNoIqua/9yr5IY0VIZ3c7ww8v272UiNKAcn1+UYyeieJVq3JZJBF2d
         2fYkEfGp8pD72ZRQS9pktaJGYYXOVkjJ6xkHb9QVY9dQkUNA9Dedkm8CHt8MjeSk20Af
         AGNd3Z+gee31nzuxQImRkG1TXRo/TutZhvFN5NvN1+RqXAaaWt1yo7+FPpEVL717RojO
         S/ngqbS3HXiuELS2AX2jE4yLf8cJnHMTkYRmi/hL0hsrPebEHHOY7t6IV0HBn+P8C5ET
         KEV6g3mfsyoVAbSnAAhiukKXZN2XEN/XOmhUFGCHejvbB92HDjXogUbsPhi/x6mVp3jh
         VWyg==
X-Forwarded-Encrypted: i=1; AJvYcCWw4u+dWFtjDm0PalzfmKZOWJqLFHSGjfRWhh6gWSWBhoNa3Uoit9B/Eu7XHgPXsA9p52suU6djkIKn04iWf79Kge0OyHKaIo8xH2BUFg==
X-Gm-Message-State: AOJu0YxxkWjVb2VeR95s4R3sGXMn4Nn3vlGaPr81rH6rcyjUQ5FcHxQh
	LCZVhbtGqfosUX23jUf0K3mvka+yMSlzm0Lx+I6JXjiKqTnJ8w6xK/tZn1PuRhM=
X-Google-Smtp-Source: AGHT+IHoXXHPMMJrFAdKK6DPMpAkVQMsK3wUHRG5kRoM2DR9RfLGDQmEDkW8rqfr/sWwrNDfA4xQLw==
X-Received: by 2002:ac2:5227:0:b0:521:e967:4e77 with SMTP id 2adb3069b0e04-52bab4e8b99mr4017573e87.28.1717679476848;
        Thu, 06 Jun 2024 06:11:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5e96d8csm1536316f8f.68.2024.06.06.06.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:11:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/4] usb: typec-mux: broadcast typec state to next mux
 for ptn36502 & nb7vpq904m retimers
Date: Thu, 06 Jun 2024 15:11:12 +0200
Message-Id: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHC1YWYC/53NQQ6CMBCF4auQrh3TFqHgynsYFqUMMIlQMq0EQ
 7i7lSO4/N/ifbsIyIRB3LNdMK4UyM8p9CUTbrTzgEBdaqGlvslCG4h+IQdhqrZCwnsJkdFOwBh
 pQoaWve2cDREm3yGYstDSlJV1eS/S5cLY03Zyzyb1SCF6/pz6qn7rn9CqQIKp0dUqr5Rt7eNFs
 2V/9TyI5jiOL/usShvpAAAA
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1Y3+cIqmVZ/V7Z1/OIiPeC1puRSpffYg9rUl21hS9Kw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYbVxP7ZktoBbvV62tuIEDtfPx2Le9HEvPDe1vCD7
 usIoVt2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmG1cQAKCRB33NvayMhJ0fGJEA
 CDRTh6JdMBS5tKmKbSwhCclfJ4eQ+Ytfp7n3omwtFG88/v1cWf44pfDXEfH/L+cLy8Nt6SSLXbjAsX
 OsUjRERFK1kmkBOZwFNZdFG4+BmFVQfooljyeVAfgogypSfEAEYRrT0MFansQnpuW+uchoHOypFwbE
 LbW1rFpwiH02gaA4NDTKMA3bZTA5lWWt1Ydu5sk3pqZkIFRD/I1Xo7Uq88gNaGHo+IxgNkslAyxtMX
 2n1ZsN2TlI5OawWj+lK/aYWrSIOAeOUpNPHx7wA5zjsmtJFVZu9ZKp6hb5mvKE3MKEs6vkEmlWHyGf
 IK1oxu8hrXi1ibDWNYSABU1A+5R3ZVa+65m3cBzTKuQZy1FoBoZNLIMb7m2GPsY+frXKnw+ohtNhSY
 xOXjhUWiUD8dMsT+/wyXMQx2UrgGcipVqF31hpxV9n0dGQ2f4O+om1y8ip2mzgDGiE7mW0rZQ312QI
 Gy6v6pLdjhb+KmBNZ/lzBd7FrI0ThvQDgE/bqRJ2GHCYQYSZigRfSvmgBf0H96uA6dGCmBnA/DcjEO
 COuXIAujLZ/OoN/q+S6MOWCGbm3x44GN/LdRayWt9+6mN/9M3hyTQPVndOmFr9DyaFsrWWsmTwMkJR
 1oJlHh50i24b+9a5mtJUWDvV8f0VRKBATUk3vDMqHztT6uJzWhMRIi5nvT3Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In the Type-C graph, a retimer is usually in between the USB-C
connector and the USB3/DP combo PHY, and this PHY also requires the
USB-C mode events to properly set-up the SuperSpeed Lanes functions
to setup USB3-only, USB3 + DP Altmode or DP Altmode only on the 4 lanes.

Update the nb7vpq904m & ptn36502 retimers to get an optional type-c mux
on the next endpoint, and broadcast the received mode to it.

This makes it possible to support 4-lanes DP altmode on Qualcomm platforms.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Split out the typec_switch_put() fixes in separates fixes patches
- Link to v1: https://lore.kernel.org/r/20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-0-79ec91381aba@linaro.org

---
Neil Armstrong (4):
      usb: typec-mux: ptn36502: unregister typec switch on probe error and remove
      usb: typec-mux: nb7vpq904m: unregister typec switch on probe error and remove
      usb: typec-mux: ptn36502: broadcast typec state to next mux
      usb: typec-mux: nb7vpq904m: broadcast typec state to next mux

 drivers/usb/typec/mux/nb7vpq904m.c | 29 +++++++++++++++++++++++++++--
 drivers/usb/typec/mux/ptn36502.c   | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 57 insertions(+), 5 deletions(-)
---
base-commit: ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
change-id: 20240527-topic-sm8x50-upstream-retimer-broadcast-mode-76520768ac3f

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


