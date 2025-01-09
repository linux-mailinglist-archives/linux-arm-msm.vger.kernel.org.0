Return-Path: <linux-arm-msm+bounces-44565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B6CA0769B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A1D93A4793
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11AB2165FD;
	Thu,  9 Jan 2025 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwDXQykx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC70321883C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428131; cv=none; b=f245kpk+wzNuQ6W6uC6NJ2J4b22lThfgZqO9krwBUWkfTfVTJ16PROd93+wv0pIW1YK7q0Ub6TlnH5omReSvTgnQvNLlUTIxCNl7EB2xZvUAt821uKyjgZDlWgrtALDrFsSgYQ28eK85xIIEGIOlIHmU5aUUNPapoDW7IevVQME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428131; c=relaxed/simple;
	bh=i7JO0HLgrEMWKiq5PNL/75diUS6xnQPlGhn/+YyG9Mo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=szIsczUcqbUc4GseuwEu2jdOEuZ/BBVfHn+iRXSE3SZkdFdtJrSKT931E3zzYOQ3Ic0oTIgsUeSPQSOAUAPAv2ne2haByzXTvdNDICTUUycv6mD2f5nXxrM2hXqqsdPC5S4NQiJxxIsSTRSWiia8lYVNm3UZLaybJputyhxKB7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vwDXQykx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385d7fe2732so68849f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736428128; x=1737032928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDA/EjpsNR921BuCko+v9yYrWjX+qufTJa1GXOf3ODM=;
        b=vwDXQykx8M/afsxpfc1urFl535xJIz++yOHQLgtF7gYpqJt+4roNebTtHD5Bco+Sib
         CMMnOqFtuLK31iGIeiUlyGa1Aw5sQGhP1XcV44RKzIae8XguqDCXbn6V2iSOno3gjRKI
         U+hLtpe0xWL6oPvTtvZeYbLzR2tIDFt/HDDMP/+4LZA6fIiy0ykLy8uA4hczZntK8dY5
         k2O8lSpKgPwVVp4adJWnV8RkcxFMHZvNhvsU2nfCq3k8rnIXqvShmg2XHKsOrZaK1uqs
         srsGsHx0gxkaLW6o88+JsE/mO9KIm2RI/9/R+Qz0o8rxvQ13dLM/Ta8ZrFrG5Wh6rdPX
         BkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428128; x=1737032928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDA/EjpsNR921BuCko+v9yYrWjX+qufTJa1GXOf3ODM=;
        b=LXr/uEaBZaYLsc5IyBHoZt1spxsJLLlcadDKSZfTLYeyTmJBIkhDG+3w0emrae/Prl
         EgvdUk/Ztop+tdkZcUyjZKQCH5CMG6YEcIVXoGRXB8IygPiRzistLz53m6YlFeRnXWL+
         WyNYH3w3ygsCJu2soXgX6pXDDspnnr82ixthF1Van3bd/sAnled3VgfamasAqiUMXxsC
         z9yX4j9o3VCDzbyQLaaUu+uutcngHtNQVyhteqVpyFBULGh/kO+Q+qas5d7WNpwYOAA5
         HHxaE1/QfHJ6A+VdCkftwSyR4K59nvlMZ01NS8+dwS+HAT+bw3DukC1+e604kcBYlQuC
         gGig==
X-Gm-Message-State: AOJu0Yy/wFHcLz+4OWleaylL8r9zmVeLGxwp/RCtkPQCoDq0/GHgc0Ff
	PlUlyvf3dLk19jYKiSziSnEACWW9MU7qNOncm/vP406kznaLtmqoqb3gUrrkB5Q=
X-Gm-Gg: ASbGnctFTbVU2gIMR1dlmM6e472ymkAn85O1DprwAG0lep12fllbfxJsPi5FbjK7iwI
	O8eYCPY41bun8urfLjgobZD01CmqIOhdCJ+4GK3Xh6roeFB+LFFWEm0Nuavh/QrJEKUUIhskccl
	GHyXHtnU8b7KFv+fH7YpuCLv2BtgDUhniXDs7KCMnAV9MA58A+CN/a3CyNkntawwjc146oHxocm
	onxudfNjrBynWz/uTzXlq0UOPanuh8cyNk2tfnGMFawXt/MLo56fDm/ZLDtjE+unRTQzb78
X-Google-Smtp-Source: AGHT+IGwhh9Gyj/S9PPeSwXhzIIHOS2Ah5yuSO55RJB6RLTEM/fZhzJet2ouU+u0iq2mUUa4OAqo3Q==
X-Received: by 2002:a5d:64e7:0:b0:385:e374:bee with SMTP id ffacd0b85a97d-38a872da449mr2215547f8f.4.1736428128006;
        Thu, 09 Jan 2025 05:08:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:08:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:29 +0100
Subject: [PATCH RFC 02/11] dt-bindings: display/msm: dsi-controller-main:
 Add missing minItems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-2-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=i7JO0HLgrEMWKiq5PNL/75diUS6xnQPlGhn/+YyG9Mo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pRzcIp+IUHHJRFMtcZowylNchxE/O2Aqzon
 ujXHw/r652JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KUQAKCRDBN2bmhouD
 1/ffD/4/t+xqGvvCzNNGaGTCWdyPtHFNxUjmYrJ+fRIbwPFO9XKXKALfOsWkxJEk2OFNq4w98jO
 uc6/c8x0mmoh8Jb8YrSfDm9Dy0B5owYFCJikik6CGvwd1QV/FAWrx71rcj8TuxKQ6P0/9u/0twy
 7XlnX3AdyT8rhBbF5hme7kIp5I7+nDuMzzxzed8F3SryZdSmvNEJiRLhsPbR7gx3qR7sGrVMa32
 gLFMUn2sEmq8KEkbiqldu5NINBvTby7Au3Hp0aRjDufFyUXhzu3EQvA/vqStJyKowNJlP/5ZaUJ
 QQjOtqJo/Uw+1nw8EyKeozYZBAficAS3JaiIiPQL4ewycsddqxcYqad49usrklatyfpeAbuxyfV
 fO4dkmR9rJjwKjCDBTTrsJtgcuCZyPXPt0FqLOuq9Opun0dt05gASnAOIl9ng3ZQplmAjrwsx84
 /EUSf2axXWa0S0DU0i1LeXye8VK1Q2SBu8S5shnUuLKFX6BJowLcbqDp9HUQzgCTj+TkC11L2rs
 YRjPn9hmBeers6k8otRgmhdOVUIqwVBBbU1eqoDGHDHdfVYo8uH5hDnNhy2VQaQlEpIOdYq3h6M
 3+K9Tam78jsOfumOmyGiH98cJBl1C9ajTD4wT7Bry+Y+U5TwBkT0oUZ8r6t+lVOOqdCEFv41T/d
 vMLIFKmmGrs0FXA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Specific constrain in if:then: blocks for variable lists, like clocks
and clock-names, should have a fixed upper and lower size.  Older
dtschema implied minItems, but that's not true since 2024 and missing
minItems means that lower bound is not set.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index a90255f60d9e31c9c7ed94816284fa8f0d71d392..c99dd06f2db9a7a77665ab057d05d87fd3ec2ec2 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -231,6 +231,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -253,6 +254,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -273,6 +275,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -293,6 +296,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -328,6 +332,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -347,6 +352,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 9
           maxItems: 9
         clock-names:
           items:

-- 
2.43.0


