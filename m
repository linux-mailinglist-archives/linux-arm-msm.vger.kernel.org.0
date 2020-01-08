Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B343E133892
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 02:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgAHBjK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 20:39:10 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33473 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgAHBjJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 20:39:09 -0500
Received: by mail-pf1-f194.google.com with SMTP id z16so779646pfk.0;
        Tue, 07 Jan 2020 17:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MpMZKtCVP5H19ia/f+a2yLDX2x/btP4p2EtO5S2C8R0=;
        b=PTNrkiZCCRqh7q4+WlA2u3gZ0CPVfLsmHAxEQSzh7KJpFGQvQCJEOjFoc361J5ReoM
         bDbAX+Gn8kdD9vGVY9Tz9bhALuubM4ufM+ZDpoWs4tKqRQGPKBGt3JLM5zD1RB1viNwx
         eMD4wP7x49zztbHZ1fry4eCEv6Xh0Vp9Kak+KoDFwt3TMzgjy6ya+gBPi1hepZNQcxyW
         P7j2t6GX7Qa8W6+ykndCqK8fwWfNpQU2KJJzFiwkpr6aqWuLKZW8j3zJkPBfWyDn9sff
         vsZ+WglNwLEYTRMpJFibloTFCBYrI23anV5Ar8R1GUouTTCpjYXvmEvx6xpbwz2A+TzT
         c+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MpMZKtCVP5H19ia/f+a2yLDX2x/btP4p2EtO5S2C8R0=;
        b=Wdqv4mTw3ZNIwMZRGDFZbbnackol3DbzEJQraZkDdYbcwMVVsplwM6+8v8iR1z+YBT
         FI+L9kihfgg/4+jGmxa02V0OorPshfqkT7FBziVaSU/oKch8obMDdjJc5Zwz/qdvMurB
         ixk00O+PaBrd7ExCRMxWRgwWyQ+mVF1Yghjv5atuT3M+Q6JQr6aeh3yRag/qMA2Qd6/J
         JMnQrV2tVIQF09jzq5vMlA0OK3RAJpwp0M7JgNuPQzuZDTdCShhaRbiIfNHlMWtt+/ko
         TknQCIGIOXpM9VsDCaG/qdF3/QJ7GwzKVxaowpu5f6Bc2fSwHQe/KKirOee7Ru/whMyv
         faSA==
X-Gm-Message-State: APjAAAV9NwUfw+Zphma0PPNn646NZt+7M6mLsRXhEMGjo7kFI1Wceo8d
        yTYBsWL2w2G6nvY2Fetv9ds=
X-Google-Smtp-Source: APXvYqyAgXNYwKw4Qv5zmp1K0i3BPG+Boxcg0LDC+VNeJrhMhkOhY8m0e5wcPQOFGhwdWiZ4i4RQVg==
X-Received: by 2002:aa7:982d:: with SMTP id q13mr2477164pfl.152.1578447548749;
        Tue, 07 Jan 2020 17:39:08 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id b42sm814584pjc.27.2020.01.07.17.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 17:39:08 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] dt-bindings: drm/msm/gpu: Document firmware-name
Date:   Tue,  7 Jan 2020 17:38:43 -0800
Message-Id: <20200108013847.899170-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108013847.899170-1-robdclark@gmail.com>
References: <20200108013847.899170-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The firmware-name property in the zap node can be used to specify a
device specific zap firmware.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index 3e6cd3f64a78..7edc298a15f2 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -33,6 +33,8 @@ Required properties:
 - zap-shader: For a5xx and a6xx devices this node contains a memory-region that
   points to reserved memory to store the zap shader that can be used to help
   bring the GPU out of secure mode.
+- firmware-name: optional property of the 'zap-shader' node, listing the
+  relative path of the device specific zap firmware.
 
 Example 3xx/4xx/a5xx:
 
@@ -85,6 +87,7 @@ Example a6xx (with GMU):
 
 		zap-shader {
 			memory-region = <&zap_shader_region>;
+			firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn"
 		};
 	};
 };
-- 
2.24.1

