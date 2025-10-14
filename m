Return-Path: <linux-arm-msm+bounces-77197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C0925BD9662
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3ADFC354330
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E443F3148C6;
	Tue, 14 Oct 2025 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNJ80/LI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B503148A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760445595; cv=none; b=tzLOffn8S3rA2UEgkHXcguVfgh4VigU/tU69EShmYFTOq5bIOw+5INyQAqmKjZcwEbULvZw1eSXwOvXp3ll5CGf2JehZwXzmK52nLXBsZVGOI2LR5pJIwSRO9kJnDQB+d6HsWolMrbH/2pkB6drIugZtfoNsJIKV2wiT7YWyIXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760445595; c=relaxed/simple;
	bh=MdFy/rEtddPgNfs1nNoPDNK3EzZtOK6/402QnuCksD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cSbYlxo5e8J80wyK/9luKyUeit/RXWNfLHouO/ZBucd2ibO+5EhRHxuXTeLQJZBUUeWQE3YNETSDBHu2gv2D3+d6I44qiUWbDVNO9C6/12pmFQkRJGnAH9Tp5jNK1//K70qlef7xFQaLQdq/F0nqka+hmXh6E929h914lzY6wd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNJ80/LI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e542196c7so32796665e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760445592; x=1761050392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qz/PnsLNKphGj4wu5t6w0DkX4PTYLFQZn42Nmg+SPjs=;
        b=FNJ80/LI5wdNSIel17Na7akokWn9IxQb9gxeEllyT7aSu+TLb5guXs9POJoODrt57N
         8SdKwUptxP2HcZEIGGKhrea03YStv9M9Hi4trXAtNItAqx/yB5cCjPcoLCG6yNO9gcOD
         ilDCY6wJU0VHG5IF79iKIuZXIztCQHoqDy6v3/FYevqn4IJnqbkW5JUrFchMv7SR+bip
         Omm+x1bHlyL9w6MeCMJxCXlGlgdnQpQH8XcKxzVFUVBB/1Ea6fanpIWIUoXcd04RYYFC
         Wyty6ndKmzHxBl2+mr9EQoOPlS6O+hoH1B5dGKQNgA3vnU4Q2IeF/Z4iNvhMnXBFBYlE
         tc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760445592; x=1761050392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qz/PnsLNKphGj4wu5t6w0DkX4PTYLFQZn42Nmg+SPjs=;
        b=BsY88HouGO/IFKhnVcxDcg52vWe3Lhu5KubLrGKb/Yk2npBPxCgEF2pHgLADcDM7Qu
         LiCwpuMLI5Ypc1xG7OewG9aoS7CJb63n/sL1HO4mjdA+V5o1GkK6tVSOJ0EGqskOXbBQ
         CbcG4MTH2uYXLBAwkkkUh5C89D/3pDpNGUmBAVTnQWIncpIz0LEjjthovEjhyo4ZEThC
         SMrUyLTem6tJPNOvAZfnvyvAuZuG/vPZTsk4MTZat3q813fsh5mjuL570yQOQKEviMMh
         wQtNARFGM78vr7EWSvJl2dKx0qh2MfByipvh0juosIdIkGKXIIuwJKfg75zr3ngysO84
         4JJA==
X-Gm-Message-State: AOJu0YwVwxcztSfPzvrYX4qcyeOsZ4jAkpZe5GFJuHUP+99H4B+OeRMR
	xCQ+CKznUlS5YymOT83VLxnkS60oqXeetYG1xNPIn057ck2+aSv39S01T+S5C4TxTtM=
X-Gm-Gg: ASbGncvfCJW5hMGUaJ7toWcCna5FzmbtpZnN0lf5hBt7X908MxPbdlMs9YQ6saJwsr+
	HkB5gKOlOXoXyrwouGz4eOJu9dbcd455aDmJOWYb8byS5tevHgUSx/NXusJUIyEx+XaGplcG+C1
	ZBNjhSrMnrMX/AgEerz9l/1kfDMbEva/7aEviP1BXf4+5Ep3T/BeDt+TEpyNNxj1BgZ524fpsz9
	3+C9KVKTYxhi9tOzFqTz/gnGjsBXgkrCh3LuUvrIT7bVzK6wdodqXQ6LeseLZmLPOJ16q+0Kzqz
	uFIUa8Q9WvWK1NLIktdeiLi/gonATudrM1lOSAKqY3cvGjbAGWYE823YAyvVffe97eTgylWl8eE
	7lPsaliSfQ8jeJCnqLgR7dnVivTv4Il3c4YSgu7v6Zhg3OB1kTgoHtw==
X-Google-Smtp-Source: AGHT+IHzYJeuQSSdvaVBjpsWcRolFjsrBPl+V+3N9Q0foLP2Jk9xC8lRLIlq37tnavPAFSq2mfhuYA==
X-Received: by 2002:a05:600c:8288:b0:45b:910c:adf with SMTP id 5b1f17b1804b1-46fa29e1c33mr195599705e9.12.1760445592221;
        Tue, 14 Oct 2025 05:39:52 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:39:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 15:38:28 +0300
Subject: [PATCH v2 3/7] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-glymur-display-v2-3-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=MdFy/rEtddPgNfs1nNoPDNK3EzZtOK6/402QnuCksD4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kR/MpIlema7vtLO10UuZNhTbFIUHH3e8z84D
 RD9ZYXA9NmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EfwAKCRAbX0TJAJUV
 VotJD/4pqgqFjwMjWLdSHRE8WR5WgFHxPv7BKsET1/cjItFQcfJdEmvTVQM2JhaeXBC3ID8e4r8
 ZUFwza4CdlWeAu2e9AOADQaj75EC+ESZYnO5xKA66sPTWOgqqVqLBtiIYLChP+amJNT4h4asBnc
 /TbZAn3sKR9AIV/DnPYO4jd8G5ixRVlIXMdiEmO8BGtsIkZ8IfsyLR6ETj2k/qZ9MRPW6fCE+o+
 efAXMnFFUZmq5DtPsJhH3lY00BWyKSjU/yO+xdSLBqQWD3uuRJgawppPogzmvuCS9leP/+vnROX
 lEl2LQrx72CvkyZcCYnjlNHr9L1CCa0k94m6FTZZ4nDBa1DSNaX6LK6AzZBbdfoMo4UlAYzx6nw
 cGviSA5kYeFFXTVB/E2WfCGsTovozMhbZ9fbbHw4XAFgyPm1mrFlWd/7zA/1TQ4Q+Fk1xGYvVjH
 hP0ozzif5id5Yy+cs55bW+tGQ+9gJTne0IYwFEbf+7FMtxp6kOfG1v25f2QijXVxASNLFmm6Xir
 o6APPe5LfGH9KGadmGs5vjsr5UEiZNqAKMHYvwzW1QbDSeuNwdCrpXaAjAaCHGUeZR3ghxrVa7B
 zjX/ZZj2ES5hGZZ6HJD5+vA7t1o6te/0HIpJbR9n8XxjWa2xWpEpYBXedbvALc//XypGakqKz/E
 tfk3cRnRS/t4WUw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the DisplayPort controller found in the Qualcomm Glymur SoC.
There are 4 controllers and their new core revision is different when
compared to all previous platforms, therefore being incompatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..26f5043748c166aa44be4e62445a63106edf9578 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -195,6 +196,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,glymur-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -239,6 +241,7 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
+              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:

-- 
2.48.1


