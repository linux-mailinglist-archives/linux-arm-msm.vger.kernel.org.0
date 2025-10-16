Return-Path: <linux-arm-msm+bounces-77567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A74BE3188
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 13:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A30064E56F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 11:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE1931B116;
	Thu, 16 Oct 2025 11:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hjElTdis"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37DD2E1757
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 11:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760614541; cv=none; b=aam0tlHYghmy0aSnffT6FNhfTmorQQsn3VkQ2h7IM2fJdKPH2gCHeDg0ke65ki46wdjkSZJEQy4CGrYE9fughc1JUT6nwzrYgGg8yLr6E2mi7wL6JoEkpt5ACWeP5OkqEVIxDYTYx3zdcsg0itIFMyHX/pSpm6PrD1OtpEeGacE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760614541; c=relaxed/simple;
	bh=DC16tUoCJGqdCaZCKlPxmdAri6UTD51Yi97Na91Z5Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yp2eYO3zPkPIJ+z6MIax4RsXyyAKvt9Y+l5qhrRTW9P+oA/wM87VAVQqmGC6AZAIuNKG40H+7njm6ZcdUe5fcKFC1bzq6A810CzESV6xiJUk9fijv0P4ZKIxC0klxxpvRgXvC+uCat5SNZfGDuyz/TzqxrehHgPwFiFz6zanHjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hjElTdis; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so1181245a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 04:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760614538; x=1761219338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlfDjHrcdfKrGBvOyIQt5Lw/+fx5LVzeszJPP8D8ljg=;
        b=hjElTdishWAVozrMa4Qqu1zkvA4d8d6JAzOE4N9xkkCh51RjH7Nlm/7eSXmWQ4dKvb
         e2sb5AIAI7vUiJpIy5AYtAXlGvJDHNeFVXf7wWa8axF///63+qy4Bif6aHAJcG2lutRT
         qvfaSYq+BzFxHvCIc1QOHBqNDGdLt/No7mUyU2aG4b73CFfriopDIZlvhBEJ7BmQFgb9
         4XipoIdZbrCWFEY+y+FZKNzJ7ymorTA5TBdV9zjvIAAPY1dV6LyfZq+K6ejdI+sk7HGG
         CJWMojUAsgcsmKmjCU+BbRywbRz3/5dge9ByALS08Slyf7A5OzuX2mALmIFXtTTf20AE
         473w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760614538; x=1761219338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlfDjHrcdfKrGBvOyIQt5Lw/+fx5LVzeszJPP8D8ljg=;
        b=oXLJVUJuN6XBiilnqIQCls0GU0EvRJmYHPFeO32Zv3wQCFzgVtT06thv5fGde21AzW
         InBS6BApnWTCNX/hgzCLxN94GOX/cTZfu3z9YNYXfmRpDnwxT/h/2cchZzUA2YT6pDI5
         5zNx+ItLxZxIycj5vKI9vQr7t18U7FZqTFPvQsdEb4QJSeFmXhsje8puKcvzH6m1u+OB
         q00G1KloMvumnKwTpZIsZRoFtApnzCLX7T2w0iMCh8yrO051pxAYRW7NJeuCJ85wT2X2
         ttTquI8oxVjdGaqhmYLbj1+duNu2kSUFazf2yejnsizByRny1XPesUXwJOoLqxk41NOa
         7qMA==
X-Forwarded-Encrypted: i=1; AJvYcCXlD87CDA2VV2xGdaSyt1Iiu2gE2DDAFLPpdJ2ZZHvbPAqROCUubrylAAlNxk7fBesWWhhcuCz8NyPRFD5p@vger.kernel.org
X-Gm-Message-State: AOJu0YwFhLF9PFsJLvEo9llyTYNtjRGrJV+ElKX21uOuLmlNui3wAoMi
	lny3gFKBejPW9AmMr6ZqstK7pSzit8EJNFofHTsXJGibGyCOkVcfgymNA4VVdmnQzn8=
X-Gm-Gg: ASbGncvnNulfA/3MqieSl7hP/ILIUon9SatbsvQxag47yw1KeCrPMro617es4fOY13G
	NS2BA/E9jgEfUfgHOVxNrygG7zKRye48fUck7HVqdKdfBus8k3sdyeq+1CKnrHsDiwj9Q2qAmS7
	841U57bnBENlQXdpF3Cx0S6UugdEnUKZbbEqCENfRWjJaKDMYOQ9rAMkj5x8eNGVUWqifPk98RS
	2EiycI403doGrwIBdsjIenQtDuENv/D3bB+DUS7K/85rwYv8ieYobW6p9KS1X3Oj6FuvnCzIcmz
	TunYWAcC6KyMYszlrOB8IBIBXMxGTaSmj5lZ4Y5gx61MEfitFQnP4llIb11H2qLFOz73eSVvx67
	0rGxdDI4DNVUt9V+xlrp4dlOuSFdazPxIsB8PpHUig/FoURbSYueyxobkWkMiUBncDktsQuvred
	/II/dnCg5C/Xls5ZW5lPEVsUnopPEIvWCUNumB8O0DodSupo6VI8jyE5+2Ag==
X-Google-Smtp-Source: AGHT+IHJ/BAd/YZqX1JBpTnZFq0JCBUuUuBHCuxb8Ss+zVnUBV31V1Tin8ZI1NwrXSvqwfYqO72CDA==
X-Received: by 2002:a05:6402:358e:b0:63b:ee76:3f5c with SMTP id 4fb4d7f45d1cf-63bee764a26mr6128995a12.15.1760614538176;
        Thu, 16 Oct 2025 04:35:38 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b1e89csm15849397a12.19.2025.10.16.04.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 04:35:37 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 16 Oct 2025 13:35:22 +0200
Subject: [PATCH v3 1/4] dt-bindings: media: i2c: dw9719: Document DW9800K
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-dw9800-driver-v3-1-d7058f72ead4@fairphone.com>
References: <20251016-dw9800-driver-v3-0-d7058f72ead4@fairphone.com>
In-Reply-To: <20251016-dw9800-driver-v3-0-d7058f72ead4@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760614534; l=839;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=DC16tUoCJGqdCaZCKlPxmdAri6UTD51Yi97Na91Z5Ew=;
 b=f8/xkxRl7QiZRrstdSBVPFUpP2voe/77bGBdMjvQ37AZ7h39ZjJyHUPpa8Lipcvz1EMHgxG+w
 0Fu9lE4y61/DGbzympht0OaCB5KU4AmiRMFG6PeCNgDvyFcywXnCcZF
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Document the Dongwoon Anatech DW9800K.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 38db0764c0f70ad49295dcddc182b7e100a68b29..8e8d62436e0d0c4f9af9e52262b23881abd37cec 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -21,6 +21,7 @@ properties:
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
+      - dongwoon,dw9800k
 
   reg:
     maxItems: 1

-- 
2.43.0


