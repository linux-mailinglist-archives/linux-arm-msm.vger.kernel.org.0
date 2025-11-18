Return-Path: <linux-arm-msm+bounces-82269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDC0C691E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 839944F43D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541193570B1;
	Tue, 18 Nov 2025 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQtEyOqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDC63570A6;
	Tue, 18 Nov 2025 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465445; cv=none; b=jxghxs9dNZ/UzNJPHkPNrSVIWl30/AC75rMryd9Bt55mpVK6dF0/8hSeYaMjCTDYBtKfiT9eAtXkKgafRmcKGkbftk2arLj1HMfWuRHAEglwbrJd1uUQ/agR5aqKk2oOdi227RYcqUCHTme/i9xxwX07+/8j5BIq7WVCun+SERw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465445; c=relaxed/simple;
	bh=DDBO7+KdukYd/NsmpQ7boItE2ES+qGOY69eXGFen37g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EHeYiVR50wmID3Xq/cg86xc5GEHg5Jf2ncmK+09b65pQX/6yid0dU36BJSK82fQDRvdScMYLwXJTVoDt/qXbOg5myWG+DcTIOl4YWfle/i4TT0S+Nij3czq6b4Wp2SNj8w3IsFO1vzFSJe5IlGRSuaeoblhGA8Z9ZVbbkIprtqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQtEyOqp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65E36C19425;
	Tue, 18 Nov 2025 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763465444;
	bh=DDBO7+KdukYd/NsmpQ7boItE2ES+qGOY69eXGFen37g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EQtEyOqpGDKEfPtr6icfTXc28WSYRgwn0DCQTBCWFOCxmMV8YSqDHdY+rn4bIEZNx
	 PXle9GbKKP4pHHuAcwGKOZ0tDeLpd9e5iY1NuTgVHJH7ooHMFhPxE0i1ZubakD4v01
	 blpSPypNPMVz4eme24AQWSZ4g+UhpQYZ6dmsMZlGMlWdZDGEKfGdidc8B0mdCZXPGe
	 hq4AppAJu7KkoPQzo+uTZYPfhRSVSLYY3CteeIA41njsSy/76UKLTnl/QcRmFNUJ/p
	 1K5Fvq+QR6Jv6UUPC/nA2+fCll0v1cPPbjSbOkBRrr5tpQkqIv0iGdsljvAD+meVZq
	 GjVVHj2Oa77/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A1ECED624;
	Tue, 18 Nov 2025 11:30:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 12:30:37 +0100
Subject: [PATCH v3 2/8] dt-bindings: panel: sw43408: adjust to reflect the
 DDIC and panel used
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-pixel-3-v3-2-317a2b400d8a@ixit.cz>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
In-Reply-To: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=rtFg229e6XLKb3HRj7KZLISBROfCdBSLoe51Y4DeXU4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHFjgXde2YPgCteVu+xuiR0bTzTZi44wHE/G+T
 TmtOdgJbVmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRxY4AAKCRBgAj/E00kg
 coVGD/48ND8fm7+63DnZhZkBaRJP80bZWosvdXkjNGgE7xG2gFtWYdrNfujStsizIpp4spuIYc9
 NQZKWJWnOszF1jyKSki0nTDH7DpigT5Y9wL2M9zWwIOwSpZsud2gr6d6fvf5jlyxfas62KdKD4c
 czS/4tF1kvo0/lNOUAK4eUVSjEcZ/1Wx9SHhJeKeb0NxaWxZ6iXX7tAZPQhqgUui3pN7fZ8I8DF
 CokdETV/6P2z0kyd5Ei5AqVswOs/h3x9S2jd3GiXASmvjjfj46aJdUANf1lJ75mjgWYLzFDTd+Y
 zXEZZGe/jIZA4ETTaCgvimkDa+dl+1Rz3rwcuz0b1qDs55fXARBugmsLFtS2OsiRnouDos4jcg3
 lDZNBCJhRNz0bH33g06cysNWPECKZmvTX0NdRwkFPnpHGbRERGDE5H5FFtLnS4ZF0fbLetRBI9y
 XSnFaonEpo5Gs4qOrDxjAjo5MIyBtpjqAVcs5svqGDEvQk7D/UM2Q/kBkcrRu2Ua0Aal5L9RXna
 7mSUOUj/7OhLODFdtNLA8BgLdxoEeOjuSs3Y3r0ThnxW9+CrUeLH0q7JsVbFXy2YaS2bilVPi0R
 mycCqCcaG9jCUzxkvvQZnEsN3QliKbA4fBv43wVGs9JIPonDWtjDrKpof1apTjQH5ajTs245E7l
 2U7Cv2K2XRIH5TA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Add compatible for used LG panel.
SW43408 is not panel, but DDIC. The panel itself is the
LG LH546WF1-ED01, so introduce combined compatible for it.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/display/panel/lg,sw43408.yaml         | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
index 2219d3d4ac43b..bcf5efac6902c 100644
--- a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
@@ -4,14 +4,16 @@
 $id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LG SW43408 1080x2160 DSI panel
+title: LG SW43408 AMOLED DDIC
 
 maintainers:
   - Casey Connolly <casey.connolly@linaro.org>
 
 description:
-  This panel is used on the Pixel 3, it is a 60hz OLED panel which
-  required DSC (Display Stream Compression) and has rounded corners.
+  The SW43408 is display driver IC with connected panel.
+
+  LG LH546WF1-ED01 panel is used on the Pixel 3, it is a 60hz OLED panel
+  which required DSC (Display Stream Compression) and has rounded corners.
 
 allOf:
   - $ref: panel-common.yaml#
@@ -19,6 +21,9 @@ allOf:
 properties:
   compatible:
     items:
+      - enum:
+            # LG 5.46 inch, 1080x2160 pixels, 18:9 ratio
+          - lg,sw43408-lh546wf1-ed01
       - const: lg,sw43408
 
   reg:

-- 
2.51.0



