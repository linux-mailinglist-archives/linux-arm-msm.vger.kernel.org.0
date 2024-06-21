Return-Path: <linux-arm-msm+bounces-23595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5845B9127AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12663285B42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 14:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFCD25605;
	Fri, 21 Jun 2024 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDpCQ82C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CDD23765;
	Fri, 21 Jun 2024 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718979991; cv=none; b=XeOwbm1gQ/voBpWlw1JpWA5CwdBi5reDuhM5bRju++QmcYka2f4ziqTF+pNpCp69mT8WdM33tHPMM8gsnJbq0dn1loxwnyXsRYRfdvjXir9tv4r8NtJHQI6f85Ijnyw18qUD81WPjZSam7WuCDF4CXsUCTaWpO2KHxizYSki7pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718979991; c=relaxed/simple;
	bh=POLKPgb2ibF2bcxOwu0QuvrBlFOOaUpz7AkF1IGkqmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhDYYW3Y27zweECVrSZPw/1lBjfhd/5cz/3lG91EI9FV0UuQv7KLA7IClDYtjVm88GwDQwL21Hd7INzd0tvPd9wivJlWwYlH2BKT+3SJHwUNNAujUg7m4B3JNMX2WJWXJpUwiWw3akF2YAlVEdjeBy8ncNQ4AE/D8O7UuS9YWvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDpCQ82C; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c8c0d73d3so2309240e87.1;
        Fri, 21 Jun 2024 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718979988; x=1719584788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UVA7OA4NKaaldsZtLrfYLn5A6RGbo0jYJk+0JeFk3M=;
        b=nDpCQ82CnQsoZadIizDypY6rwY4SmHyOtGzNiOGyYxV0Eb8r8HG4pQ2OxHgYxMuPim
         mDcdUYwEao97G7N8MW8NO8g/dI6pYwY3Rl8Unm8dwCWrz0vl0Nl9XSZS1J4U/FOQWAvR
         VEAT43oXdmp5D6pIWmqshOOBw+2gGBcBNE9xndKfe/bpWkVb5GP4MGS++eueNB67y9lw
         PdSScEXy03jzTB8pcMo0Vq7c+e7c8lyKEPXeWAB66Uano/2frfbKNRmGBnN6Jue97D8L
         MRFFtef0eLLuMIg++XN500YisP29TZS3eCfl4lQOB009gUPV9FC2iTy3U3ZEDvWgZxNV
         pCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718979988; x=1719584788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UVA7OA4NKaaldsZtLrfYLn5A6RGbo0jYJk+0JeFk3M=;
        b=aPNrxh3WeMpqlaodFElUCm3q+vSU/TLm1cPXsSYdXn+6hQKOd540DW054B9f/Ju+gU
         njyN5gYzSZEaApNnrJFKc5IndJVYuxMG8yD7bpfLLwS5BxbIdkZRZR6v3ABgljkzGrVM
         CXCxLV96fKVzUj5X5y+JcIkxOoZQPGg9TuniqYpPhtZ3TdTTNgF7Cd5zX0noHPZQ1DXq
         Bqe8lmy43Rrs6eQNLlCNgOsSs2Ao3GrjSW40ee4e6g8ikYdFI0W/n3hwiboOF8u+LF+0
         Y0ap3tX0y/OnhOienicHng5/jC+T733sJqdBe1xdkTBP69ESlJ81ckpMDsItYk59Z1L3
         qgEg==
X-Forwarded-Encrypted: i=1; AJvYcCVCBGs0rrbBY74IOOyvkHX9bRf/wV3JBSax9tQfSVvu4CgjC71+wYiBdpysuKxuZMU7VirLJRp0pPsODpvQwT0cWun1s51tyigTi4hu+KFSIh38747kWQk/sLuanR5GTnCU1Wde2e3kCBSTKqRfMo29r5o8JwfMzBRT4DWxu80R534yJDf+
X-Gm-Message-State: AOJu0YxaWvXH6aMG29eCgTntylwWsLnZ3MnvdFQ0FPK/klwSG9cl+Bh/
	P20DBXb5wfMfZObYsFp6OG3mEklMlbaWVo99sfL5Az/nRbSNSl+d
X-Google-Smtp-Source: AGHT+IEhPxq1CXbfBQq9Tomh1sRdc9wzAN/pwi2e0P0GeIfjN7ZPwYHowh0WRUG5+ag2GvR5EscJ6A==
X-Received: by 2002:a05:6512:3088:b0:52b:84bd:345e with SMTP id 2adb3069b0e04-52ccaa9740amr6922401e87.43.1718979987917;
        Fri, 21 Jun 2024 07:26:27 -0700 (PDT)
Received: from deepthought.lan ([2a00:1e88:40c0:c300::729])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd6452602sm210890e87.298.2024.06.21.07.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:26:27 -0700 (PDT)
From: Valeriy Klimin <vdos63@gmail.com>
Date: Fri, 21 Jun 2024 17:26:42 +0300
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Sony Xperia Z3 Compact
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-sony-aries-v2-1-dddf10722522@gmail.com>
References: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>
In-Reply-To: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>
To: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>, 
 phone-devel <phone-devel@vger.kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Valeriy Klimin <vdos63@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=vdos63@gmail.com;
 h=from:subject:message-id; bh=POLKPgb2ibF2bcxOwu0QuvrBlFOOaUpz7AkF1IGkqmI=;
 b=owEBbQKS/ZANAwAIAQ4Juwrzgg1aAcsmYgBmdY20hUw8KyPCuf3Tmyt9qGCb5MAVTi/SlEAVT
 p4pu08mjU+JAjMEAAEIAB0WIQT/ENLr7ksLn/+UbhAOCbsK84INWgUCZnWNtAAKCRAOCbsK84IN
 WkOKD/9wyCqOLalQABcOO+ACjEmiefWqmkw2cqdAKx6huOBNYiGOa1NYwer7CTp9sewwUpL3XRE
 BnkMnpsFMKsTYMmpC31H6Ji7piBnsGre+JxNR3JWAGKsaRuqOb3eKSiFdrpB1WnxKH/UvA2Vpxb
 pKzOb6veBH93HsfVPXfhBXGgGxRy6lqDvEgXDq8RkQag07LsZJ7hxHW0zhDYC3sVpu8oZDibt5+
 uiSnPwAtv5ky3mrCqu4sCWkqdy7miwtHwoLxF7ypmDrMb/4HHhns9apTSdXdocuPAuHR2IyvWr1
 oHRAySqGjNJWE5BV1UYiSn0CQttbMJUya7QHP7+hqmBDdH9ZhlY9dxWpoSRNIJ91Qbop6hrYkEg
 BQ0rXHQjbawNn15T+VZlRLw4WRRQ4bnbPTGxwpBCBP9MHT981lEqvP92Nk1mNTBmqFGvAxG7TcO
 Pmnx+EuCB9hZFJrDr56vBMcJrrQAeZs7+hMksFuYRqu8F6HH4XRI3E3JXLOVJ8eu9uZdOnS9cye
 K5BBNceNcpAO+DZ4DLhfWoOC9TT/fwXPhuU88E3zKFmu/QcmZFKMf0ca2dcfsGFmKBWEIEzA8b7
 7lBjoKTAVCYEAXMiu+R5fCdLvX/4g5jnH0fccemnj32ddhR4Ndg3TwcmJMrPMDJ6TfO3jHyQ7zu
 jEADXI8bg+TdJqg==
X-Developer-Key: i=vdos63@gmail.com; a=openpgp;
 fpr=FF10D2EBEE4B0B9FFF946E100E09BB0AF3820D5A

Add the compatible for this device.

Signed-off-by: Valeriy Klimin <vdos63@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae885414b181..e53f061fc1cf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -184,6 +184,7 @@ properties:
               - fairphone,fp2
               - oneplus,bacon
               - samsung,klte
+              - sony,xperia-aries
               - sony,xperia-castor
               - sony,xperia-leo
           - const: qcom,msm8974pro

-- 
2.43.2


