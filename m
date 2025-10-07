Return-Path: <linux-arm-msm+bounces-76134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC017BBFF40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 03:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 366D23BC192
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 01:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B2D1F4C84;
	Tue,  7 Oct 2025 01:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0dVm77e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937A61F7580
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 01:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800374; cv=none; b=frIG592gDXUiLigF72swV1rwvAv0RhDuYdt9wR8uDlzQ8najrptWZ8I49VQByIcMsLCHeM4UyeSwx7zg/PKn+Ph6+r6UoHbSYkd2Fc3kVBCFfsl/dC+nqdCrZj904scbF1+HYKucjl/WICTPacVkdIrcBPqnciRa5IbxMbK0C1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800374; c=relaxed/simple;
	bh=16DquKhHf4rKURRSNctoiZxsdCnEHoGlUqmScEx09GE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sc36hqcJbA18sVnWdhsoBEwKN9uOe1EGnK1hnHZTvOnMFRRkBVpkwlo4Uu9zxZcPWH8+Q1TGMrCQ5qi3RmnMBfwYOicLpAf4P9dVhkTCpAqiT418Diwtw0kEstEpbO451ydl0gtXhruMOg5V7zhEVk6nuo/l5VQ7SyAAqY+wToI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0dVm77e; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so54022065e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 18:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759800371; x=1760405171; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oSNduwIg7jI6jqDFPflXbxR6x1FoXK0RkqCfhQ+iHV4=;
        b=S0dVm77eoTZP1SINrrdGH3u9KkYmYstgGSLMvi6VbH5zztldflqG5ErMqizS6X4ocl
         ng8uWjJOBEtIyFCbXUHbRZdnYeBPzKYNZZKUvrmTZX5qHN2FeYYR27VxIGVk26uxdKKP
         YqjI8NS/AvSj2l3c3KDGsG677K3VF8tEMWIa9rk2LZwpMkp/CxquvCX6Ow4JbKWJjdox
         0ncGTFvkYT2e+AIdC/wzPE59GbijlVrJsyHamujulHk+tiGudrM/rfCRchrFF8U+JLts
         DSTHFIpIE/doTAauq7KLTcKYid+peWzYDid1D1uMY8+BQdvJAER9fyu9ArfiHjm9z1Pn
         hlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800371; x=1760405171;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSNduwIg7jI6jqDFPflXbxR6x1FoXK0RkqCfhQ+iHV4=;
        b=g4EqOkbwQLsiwSoZ5I52wIv2mdVcMLRrw8zhCn67DOUCizQypjdXZHmAivIXb/Vqmn
         gVIP5h6LkD7y0QEiyDxq7Rx9qvjStcNAcAM8IFebgpT24e/ExU14cmMOMPiYp2dguZxU
         yNJcR6IPFe701zRaPg9oN0PQu49KzXPxCBdfyFmwxGG+Hymfl3t6XVb2mtrqh7/dLU2a
         zD/H4QOniYtw1yvacc3DroGIZYfO6BFs9oqKipVFlTjSUWgpvhmUesd2QhhnPHppF4EG
         /IJLxFEn4afVOLsVZ1XVBIClRatWXF/1DQV+utVtq71lAEpNGnYG05N1Yo+Fdd2HTfTb
         XAUA==
X-Forwarded-Encrypted: i=1; AJvYcCXNyQ5k598W1sToFo4rd0Bn953ia9zUcmZoBTUuQ9sxZdIGiE0UZWmCn31w6nPsxTlAnGRt6v9g7BJ/uXQN@vger.kernel.org
X-Gm-Message-State: AOJu0YyDNBM4/PAX4UZHdroe6uEVuyBeS/MUqh5sbFXrG/h5vo/GqUYL
	0Y7VYJyNWQLjw1EXL0TMS5Q3tHfz05pWLp1HGkWX2pIL7/zF4bcDmvj81/tGEl913jE=
X-Gm-Gg: ASbGncs5fiZZ6PUdk2wgUQ56sJNxWrd+kOYy690hSRZfJ4tL0AgI3HrQCUs9pM31PQ6
	UJEqdLR47TYtWuLXp63XeLBG2E9vAYZxwL2C4p409F7U+AVmJcTd5nxC2tvHfph4B9BbmRBEJPq
	9GM5hFiybqJB7Qi4dqpBpFY2H8ib8nIZtq+HFPhQNf8pTLLD3h6Kx0qp7NHIURa7YAnB82/4h8A
	eqa/+pkWfUvEocsE+qMeggwpMAMhmLHEZtELtFZ6KTYr9e78iXT/EKTQIlJvc3z1ArsWNjG1JDK
	S04zuafH0htAbK6Bn7Hsb6QUgthSlVd2CvMwYqeOu8xpPIw7y9NM4UF1mO0wc+m4uimO4Y3LY6K
	Xjg6toFmyn/HYGt12byVDCkp2lgqYPXFAHtcrCI/cmDcdyjAvzrdzc26pv2vtIeU2BmM=
X-Google-Smtp-Source: AGHT+IEqCjJVNQ+4Qs4Y8SQUQR2vF3o2dNkE/MGT5wV1/bzYlB/WElOfwkhccFVlq2M0O2ZMoNgvfw==
X-Received: by 2002:a05:600c:350b:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-46e710fe3a0mr87258455e9.1.1759800370875;
        Mon, 06 Oct 2025 18:26:10 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa2d52a71sm7410915e9.1.2025.10.06.18.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 18:26:09 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] Sndcard compatible for qrb2210/qcm2290
Date: Tue, 07 Oct 2025 02:26:06 +0100
Message-Id: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9s5GgC/x3MwQqDMAyA4VeRnBdIM8twrzJ2iG10OdjNFEQQ3
 33F43f4/wOqummFZ3eA62bVvqUh3DpIHymzouVmYOIYiB64+sgcCNe0MA+EteQknjFL7LmPInq
 foNU/18n26/x6n+cfXO2mxmkAAAA=
X-Change-ID: 20251007-qrb2210-qcm2290-sndcard-da54245aae3f
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

This is a small patch series that serves as a preparation for
adding HDMI audio playback support on QRB2210 RB1 board.
The patches here are for sound subsystem. The other series
will focus on qcom DT files.

The previous series where one of the patches here were taken from is
https://lore.kernel.org/linux-sound/20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org/
and sndcard compable patch was added as new one. Both are basically
done as new ones.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      dt-bindings: sound: qcom,sm8250: add QRB2210 and RB1 soundcards
      ASoC: qcom: sm8250: add qrb2210-sndcard compatible string

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +++++
 sound/soc/qcom/sm8250.c                                  | 1 +
 2 files changed, 6 insertions(+)
---
base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
change-id: 20251007-qrb2210-qcm2290-sndcard-da54245aae3f

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


