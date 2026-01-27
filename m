Return-Path: <linux-arm-msm+bounces-90691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKSYIp2MeGmqqwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:59:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9039248A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EACC23011F45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9BC33C197;
	Tue, 27 Jan 2026 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DVJ4L/G9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD87933ADB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507872; cv=none; b=dw0owFV+LntLACEHFLg3hRgdEITGC4tS44nRKhT2TsbbYujM0oEI8V49VZ0+5h/nBXhN8LJ9r840OJL4zmmWXjYHfLH1yNsWsrNaX2Xe6v5meCrotGMUYhYSMTGnIrDGbek+resWg7eu7U6arptw5r+bwJxMopDnospbqu25/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507872; c=relaxed/simple;
	bh=pirzvUMS8i50SX74B9DHasjEK/A+JFKmccu8rvH6JXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCM9gryzyXVPmltYbhleznodWYLUsbSlGu+ImAT+aE00NYZKRr9MLLgkc7w9B89dKNFZ3MP+DE1MmIhE5UJhw9ew6e2kAucf48gyoNCVXPDxtlJSP5HG14AAIXDI9UcqcBW5Vxuib6Hh/+yjCCwoqiP6tMbUBO4iw6fJl7stJmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DVJ4L/G9; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so42138455e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769507868; x=1770112668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
        b=DVJ4L/G9jNhAiDu8bQG12PnQqDrAVD7z2J0rEBczEt+Ax1Miyo2b8Y2Pl3imp9MsiH
         6AUdJVd23Syw1UxP4Amrnghve4056g8QKM75MyUor3WFQX0Diof06Quksi110n4/Kxls
         qxAuGmhvhCqR/DUU9mBYtVeu4XwEJo6wuOw0gnTssNleLPnB0mOkRFEuIQsJ8duTLf5O
         XhwBEu5uZmiuJj57YTPows1Wko3vrHDgsXMt1yPBwPO1TYOuOTlu2TA4dgfiCQ1PPOUh
         46iYQ5Pr0gHAbHjUFoggBkS6i64B8I0O8FbNSGfsOR8oHDq2Az6CUq3Ij4IDbsNYL1Jy
         ELsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507868; x=1770112668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
        b=RSsnQ9ThWmuyh9igbAdxGbmQI8yCuj3xnUyIj/afx4KCkGNzGOTyqzhlLPmKoVDU12
         b5stfRq+kymNtTJcMoQLpdWxeT/0hHS8MzrSLFhKUtYao/IX2Zf2mDagUcqNPph3xXmW
         85iM/W8Ul9Z/Gv5mLYtWl8i42yulYyUCphIoYb4FDcXx2jF7fMtmxGLsDhvA6YqMItgN
         0DDeFcpTe5/WFXtEIytGMU374kZtwbCK0PeMk2zCGyjgL1UNgTvbPqh+vrbX4QfwXi89
         pbTzK7ksOoCEGpBcaqTEvkMmGVV0fuuLBgcG4iRH71cARnDNUDnFprf3wUI9F7eS9Bri
         W9lw==
X-Forwarded-Encrypted: i=1; AJvYcCVmvCsE7rwSdM3nJeykb/weWFi+nEpYh0UF0DKqiw3vFFFqe+mFgk22Ry5gdNpa1fHezqAz5lSR2lJHnb5Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwvPicgbLMa8I+iSupXOyy2niDkm4YWTnUapYVLgdWiFTGj0y2M
	wbC5BHATqwGHfZWmZAELIgEiKcRqVe+WA3ZbmD/sqAL08q8AAAlR1KkPhLo+ew5xvRk=
X-Gm-Gg: AZuq6aJLgEqRNXwro3p088RHU0ev0hVMXwiw+dltgIrsvwP8m0bp4AxhcUOI6Nv0Jd5
	DgpfNkqoLAZ3sycMDXZ/6EM3pKrFmUObNOmY0BNsMvbNRMw75Lu6LYm7PfV9Rq4uQVMaGAp7u8S
	rJtr36Pp8YGDum8bd7wGcnpsfDG+N4c9HF11BRKlQkwQGJbdiLnh5ytQH2+Za6DKFIQINdnNajt
	6Y487HplssalNL/tcLnLV7h0nLyoy6SpFlkBi7k62ylbFduFlRvzjAy2COggKdyqb9P0Mh+dcI1
	KMYVJF1UCWylpliaDOCo7NvjOFpbdwFfjVvqUve0SRGRX7a0E/5u7wbdVXV0mrcaSmjHVnO/9hR
	ww8ACmULz/qvx6dGt2VIRtcdde42wVEoSjRSlxHt1P3Uj2DeqzTF3/hDCh2wEDxcXq78yQ4znxY
	cn4bGc7lRM6zffVkxsfmmb8AO0CEQjGh+Xj5DSecqe/A==
X-Received: by 2002:a05:600c:34d0:b0:480:683f:76e8 with SMTP id 5b1f17b1804b1-48069c7c265mr12611895e9.26.1769507867692;
        Tue, 27 Jan 2026 01:57:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:57:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:32 +0100
Subject: [PATCH v2 5/7] dt-bindings: arm: qcom: document the Ayaneo Pocket
 S2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-5-c55ec1b5d8bf@linaro.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=716;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pirzvUMS8i50SX74B9DHasjEK/A+JFKmccu8rvH6JXg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwTWMafMrwJi/UrUblmDswBaoYuUWQ2fwrzpDVA
 O9HMxsmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEwAKCRB33NvayMhJ0UFBEA
 DPXxue632XoOKUO20a+YCsKF2UAhWuEgIA/+CWcQ8AAkzX0mKU7Ada7O5tgYC+2C6JOx2B2DQX43te
 +5aBc/dnZY90jLZ3DsrXJS2l5r3LPEBqFYiU8u0M+pLDYuDucZBdExoCYmTVshHoXtkJ9LSKSo6nnD
 gqQ0rEjVHTYrjcLYTIxxrgyNitSAFvzcgsm572Gu4urrwcWKJPKHg+PGxRimxRLB53vR1LXsM4m9Eq
 3I/aPsGIlOU4qsl+NSziBRL0bQrh8FLncxI33/Yq+ApgJtf9GIFw5omCPOdmxRT2H87qAV5D4sbJYO
 iw7Ewf9u7IoCJgr9dhpmee043Nnnj9HipdhsM83tbrjn2mJPoSIgufB9qjTvP46AlXiEYtz+rDvilE
 iXYM+wcORtdDgiJgLxqX9LkYxY2s8syHgTWBQBm25ZuTUDuXoW1Ze5IVTFbnJzOY2klsyaFf+2V0Y4
 Ipxpetfml5c9XHYicXC1Kc31vpoAToQckxTjybcua6AmKRLOqqQiRbb0RoQgLEqWbw0QUeEXu97Do1
 fUEazfXdUSif4MYm7YFXrQuMnegrrN039OGFUJXegyNxbBjUSgsvyDGO4woBlxzYT6LmqCIThzJrIF
 gQq3gUt21+BhhuVP8g6tOCoqo602mIWnf7znRDzCQeo3vM7RmUPLTXT1z3jQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90691-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: DF9039248A
X-Rspamd-Action: no action

Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..351cc2eff14a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1042,6 +1042,7 @@ properties:
 
       - items:
           - enum:
+              - ayaneo,pocket-s2
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd

-- 
2.34.1


