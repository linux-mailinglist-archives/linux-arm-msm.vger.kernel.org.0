Return-Path: <linux-arm-msm+bounces-19283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1168BD981
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 04:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B296280FAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 02:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5737282ED;
	Tue,  7 May 2024 02:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+xdr+IS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3661CF90;
	Tue,  7 May 2024 02:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715050084; cv=none; b=in9MKmQy3fwbmYuSFpfXZkOLHevUI/FL443KgHZtxFHe+jLGCJgKzU6VqkS1Z3h9CQpfxTcleGkEHE0oUgUhZ4eVAAenkuFzSqkGfztz7ysT8TyruUgZZKvRs5jKWASP5BgXmYKf3ue0WcCOKlMJFbYiR30HRFkZ5RrVCIr20sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715050084; c=relaxed/simple;
	bh=rxm2MmkuxlHeoH5nPu+hOLhIOkAqIZWGbrgFnaDcwUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lYl7ujbH1qf2Pi8iRJIGZszsLNnfDu1Xy9xHhYByOgn29xwwDitr2mDV5QRXAFk9Pv23J+tLchvQMssoWEXI32MlUaYep9nsSnmfN7Ia7A6BTs2haREc3I5+FCpiEujfWFfmLSVyWRbiBiDCcwfDG+4rY95jfY4mh59J63rgu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+xdr+IS; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6f08ce51e02so320802a34.3;
        Mon, 06 May 2024 19:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715050082; x=1715654882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndnxOFRoXj3oUkXyDSS39Ct1jmOQ4iAHrSPKaAlJ/7g=;
        b=H+xdr+IS1qHAJWqGAJMxa/lU3OvzQ/8sesLbBNAwS7qVITiinUPJlwehC48AphdDBf
         w7Y1VA8eQ4seotaLmO7xWrFoYHZsAxLkT7JqZSX9D5scXNvuVKyaRIvXsfinh0DPBSvz
         buhCGYebKirM7XZxCZuhww1UT46iIe4gQLTXsW0qSFT+9D2Fc83+atxZp4kHoeRRaVnZ
         MW9lvE5RZlfriZdEEoqjmoFSYd2mgzqnWAd40EFudDwrPJmZYhoX7HLwXgBEcuPlBkoP
         Wy2hvPAvjTn/4nTk8bD/UcYJh3UOwBKioWkyLb0dgm/oQ/Whbz7AT/35TKoeWL07GLij
         ppQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715050082; x=1715654882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndnxOFRoXj3oUkXyDSS39Ct1jmOQ4iAHrSPKaAlJ/7g=;
        b=n+RB9h0mEGH2HTo5C3H16rJV52z6IF/vmeDj0kl05IjKCcrpoFiODZV9URHJKd4Ipf
         5Ve9GkXXVVPK8sHpH8avDMi7lFmRm82GFAai1dUFuWP4CCkkAsHCwuehaCTZCo2Z0IIZ
         AXwvi3amX+P6jE1QInAYM+ay8bHlr5Jiyff07NENgFeTMI6TbJ2dqI39/Jb1R+iz0r3W
         Bjok6TW/P+PgtWkTjC4m32yKkw3ijOwUPQ09gMIkN6EyzGSPcW5Yj4EhG+ejtvNzYeOk
         gcZCUZtPQEt93BE1QZCfoidzn9seN1g+QZeqFs2lGniMIVplq1jjpMOE0Um7WUIXg8OI
         hNRg==
X-Forwarded-Encrypted: i=1; AJvYcCU9iHAGzamA7YyTHlTSi/w/9laQk/sX6guS5kAdkmuXPzyF2zCh0b2n8PBmlRAk0MbcPsbVAxxVPrnEVtZtgrYwEtUkOXBUealmH61ZcjKMdyq76+jLTyRt+dGGLKvTe7b38T1puiPuKAnl+Ffw7zHqeau/x6vp5zDlMpKYHLf+Uj5Nntk5lU5L+/jImyXGWr3S2NXmCRWgklskAHAb+9Q=
X-Gm-Message-State: AOJu0YxIck/wz/VVuMBTJ+yt6ImnTiaDOEWo/3rpgjvUZ2psnK8UbbZT
	wewiU+F7pRv6VdpfUhMGnW7jHgB/EavHkj5ydF8/eYCAAYZTAIBh
X-Google-Smtp-Source: AGHT+IEMOxXvv/6uHhAD4yBPsU4dJtYqQlcnWY4Dz6l8BIxyBYJx7zxm+qXR9vCOWB8OwClPLnSzpA==
X-Received: by 2002:a05:6870:164c:b0:22e:a3f8:38bc with SMTP id c12-20020a056870164c00b0022ea3f838bcmr14285168oae.22.1715050082334;
        Mon, 06 May 2024 19:48:02 -0700 (PDT)
Received: from nukework.lan (c-98-197-58-203.hsd1.tx.comcast.net. [98.197.58.203])
        by smtp.gmail.com with ESMTPSA id hg13-20020a056870790d00b002396fd308basm2333895oab.35.2024.05.06.19.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 19:48:01 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: net: ipq4019-mdio: add IPQ9574 compatible
Date: Mon,  6 May 2024 21:47:57 -0500
Message-Id: <20240507024758.2810514-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible property specific to IPQ9574. This should be used
along with the IPQ4019 compatible. This second compatible serves the
same purpose as the ipq{5,6,8} compatibles. This is to indicate that
the clocks properties are required.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
index 0029e197a825..a94480e819ac 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
@@ -20,6 +20,7 @@ properties:
           - enum:
               - qcom,ipq6018-mdio
               - qcom,ipq8074-mdio
+              - qcom,ipq9574-mdio
           - const: qcom,ipq4019-mdio
 
   "#address-cells":
@@ -76,6 +77,7 @@ allOf:
               - qcom,ipq5018-mdio
               - qcom,ipq6018-mdio
               - qcom,ipq8074-mdio
+              - qcom,ipq9574-mdio
     then:
       required:
         - clocks
-- 
2.40.1


