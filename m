Return-Path: <linux-arm-msm+bounces-47673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53CA31AF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 02:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98480188AAE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18F62D05E;
	Wed, 12 Feb 2025 01:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs0fMwkz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2606C27181B;
	Wed, 12 Feb 2025 01:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739322502; cv=none; b=L8ESuWFYAaTLJb9xJw66WMUvFFqzWhe/irxbGr9ahJHOZ1K5DJrn6nMxV/H1SAOAxzr9x5ubjLqjdxkd6Rs2AQWr375BirkWl0/JhF/C47OC+JUdwFr7qQHrH/grQ4cG5MVCYm4TsrpOOMdMwWS0PEAaXeO+KB4GYIG2zBhip4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739322502; c=relaxed/simple;
	bh=mmPSG2J0wFLbRJe/3wTyhzBmBYWMvj3Prn3iKXV5pPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRS29N7MGQMfH+bbK8VgFAWR9eh4na/9PtG4H7usDzPR/eN1UeKL/xOj+BY9HjgT9oIEefgbfH7/LQPrNk39mZRfEQYO4xJUY2GdC0emQxImuAYtpYji63GnnbyzTaI6rfEsTW4Ix9m5j00yo/ATHXQGcrUZ9Dj7+x/NA+p3Xb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs0fMwkz; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fa0f222530so11331602a91.0;
        Tue, 11 Feb 2025 17:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739322500; x=1739927300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuFtRlkVwzfsd0hbMOfTOhdeC+NVKWiRoYV+k56NFus=;
        b=bs0fMwkzZKgKBVn/klpJqEpFVNkda1CeiYPiuCy1YlNcI435KwsLpgoxaUt3RcGP2U
         4+HWa4BHS4tuM9Vyze+gSGgqXTkGHomk1NsQmiBT9i0mhpeyUEFw7ws96CQQ2EvFDtiS
         cY5H6mR/CN/9KzakXFuDSh2bhZ0EiuzC6HlC9FmcB8KpODrb4X/CLW98JbUcEvB3oqek
         E8Frr+oNS3yUMYTD9Wx0TRwh526OOpWpoM1RxwpD0w8L8RluN7HQo7X6PrWCwVxKLSgq
         Mm2ubT6dT+1fcu6BD7nGLh7LHO40qPvWEi5ICoxQpY3j199+tCSLKTSbAgImsd9OfHBF
         trcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739322500; x=1739927300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuFtRlkVwzfsd0hbMOfTOhdeC+NVKWiRoYV+k56NFus=;
        b=ucJt2DvVMiQg0U/DBJVLO+Prz7cKDpobKXtrwzBBzmk03ZQ0oWZajfeYgKwCtsWi57
         09gfqX9PDkZjAXEGORRrp9efmkqFh1Y28eKOVuJ6PKlkxigh9saoGaA2D+pY1UNOshak
         qpUeTqXA/qk9PWRIiXu0sriwb/akpWb4I9SX78XTdkFUmL0zek+CiPb047ouPssz+a5l
         JRu+rgYTXazaPwReSIN+J0qK8/dPLCq+0+JZAx51K3Pnd3PudgCAL+rl7y1LwSoWGIED
         ygdtKIlzWGjvhauKBsbIFcnP2IzeXCqKmIBgYAPqJu3D6n1kSJyBNdFfI+ok6RdKR2iF
         FTCg==
X-Forwarded-Encrypted: i=1; AJvYcCUqkYfSLzQlVmK9HJ3ZRYF/DH1oqTxXzu57ZKF58Nq4Q5r1kiv331P2QLDoSv4Y0p0eWQNzCVD4pR9R@vger.kernel.org
X-Gm-Message-State: AOJu0YxVI3YnQk1Zl48wgW9rEN2C0gO0pytyeHRDCmHQhzKb+CxcIloK
	SPMTcSA09PehZDsUnJHeGMVwmIO3l5ZxM6uDWocd7AlzKfRUyN9qEV7fI7na
X-Gm-Gg: ASbGncs41LzMM1aQhNCRGWkKu3qLMAffNbwWHRGiFIAShbKFEWIxnXqkPYtM8DvH0+v
	Ww4SoNrarr51CdoOzwN69phULORdfCNBnrp4FsxS4qxlh/qO5KVqTK3jkEe7PKs4F7iZttVLAxY
	aPf/mAFT34xo+VZaEXACLKOn5DiE2fLkI9QwYcDRm+raWybZn1iVdcEkiW9VXQpia1uSy0HZfBJ
	wx0a8J9UJ5XPrDUfavZzyJfqzB3GrVaxBviBauuYbp8w6f90V15cpbIYlu8DcgGfi7RE4MklfOA
	qqx4xGBAJgP8YIYj/fJ0lENd9Im8b1d/TQkkWg==
X-Google-Smtp-Source: AGHT+IETgEuwZJjqO3UZx0SzjlstZpkCiFzdvY/vm6/WjICg/cva4hg3J/CmQt+uPI8vn3sV2d6OtA==
X-Received: by 2002:a17:90b:2704:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-2fbf5bf81ffmr2429717a91.12.1739322500225;
        Tue, 11 Feb 2025 17:08:20 -0800 (PST)
Received: from localhost.localdomain ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98d3d16sm190408a91.13.2025.02.11.17.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 17:08:20 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	quic_wcheng@quicinc.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	"James A. MacInnes" <james.a.macinnes@gmail.com>
Subject: [PATCH 1/3] regulator: qcom_usb_vbus: Update DTS binding for PMI8998 support
Date: Tue, 11 Feb 2025 17:07:42 -0800
Message-ID: <20250212010744.2554574-2-james.a.macinnes@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
References: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the binding in
Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
to include the compatible string "qcom,pmi8998-vbus-reg".
This change adds PMI8998 support to the Qualcomm USB VBUS regulator
bindings.

With this patch, device trees that describe a PMI8998 USB VBUS regulator
using the "qcom,pmi8998-vbus-reg" compatible string will now validate
correctly. This is required to support hardware based on PMI8998, which
has different current limit tables and other regulator-specific
configurations.

Tested: The next patch contains the driver and has been tested with
Lantronix SOM.

Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index fcefc722ee2a..6092560e9048 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -22,6 +22,7 @@ properties:
     oneOf:
       - enum:
           - qcom,pm8150b-vbus-reg
+          - qcom,pmi8998-vbus-reg
       - items:
           - enum:
               - qcom,pm4125-vbus-reg
-- 
2.43.0


