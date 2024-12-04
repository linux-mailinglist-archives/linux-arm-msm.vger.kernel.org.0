Return-Path: <linux-arm-msm+bounces-40264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E3A9E3BE5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CE74280CBD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCF41F759F;
	Wed,  4 Dec 2024 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LSoRvJYR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341711F7088
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320834; cv=none; b=NrMYRp+SStEYRby7v3pQegLH4/XBL3H5epJkXiPZBhbDf9MrgCEBrs3MRQtOgj6ZPbWTQRinNrpC9M3+5dA7T6NkYWLOP7+eLgFeHHntU1ECH4wzpPgzh8JEpoQAUMYfZsrT9dRxXxHoeFxnSLKJ+fo6VFVk5w+2z32KoRbrDpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320834; c=relaxed/simple;
	bh=H95Tmerwf6ocgqV3ped1L/uCM+XW/SsZT8LrQqWk1rY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wq4U1AH8/QzpgvL6AtfY5rHBrTWP1w4LiZLgSHnzgIa1KEUn8VRwNIQpPFGNdeRnsYj6NjA8X/ZrdFaRCKmJ1RU2wX3anjUto1dDFRUcNECRDQTtNxSvE9rCenjCxf2UvJVW7OjbWQwP8tnktBQthvkizImR77OD+pfWntSnAfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LSoRvJYR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e06af753so2871156f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 06:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733320830; x=1733925630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bV8QY5eukfrq2lN4tsY/+E6/ZMZn3nftpYsTU/xeZxU=;
        b=LSoRvJYRJF7PbC41IAugr2/Gf7cP7HRCzm+NU50/NBjASwzsPie0Jl5LCQ8Z5m70mY
         wwL3tvjqOZ+TBp99Fb0vM51g9trrRALSnYrl3xxmiHNxZeryWgJb6384KaxM8VBIgRrh
         BG4UIBXb7T7s/jI4r/cUGqQFcRr/pWybnmtIj+FsHcfloLPqgyI9OXL2UOrAtYjMdfiS
         XiDc8FGUlW7hJoOSuIQN/lqThl4xpnfT9u+v0GNQPVukHAxllwsa9gkO7Z/elCaDj6Tt
         ahyRQDK3dPf6aF+gWyLZap6G//iRD2OZdWioCRXrsM7+zxKaEBIsyXDWcX3CXSpYeUzs
         OZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320830; x=1733925630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV8QY5eukfrq2lN4tsY/+E6/ZMZn3nftpYsTU/xeZxU=;
        b=b1UyaimzUK4QRCoK0yx57paYSD/0cLaeVKRFy50uG0DcA+QxrFxn/4doAgevfuoOUc
         5gLnKmZwNyuS52jCidF5L4HtLMNmmaFr728aNnXI2zw7ZyCnYe7rQFs2mO8XtNypn/l3
         GPNw0WtR0c8A6c4cOKolt6VYY9tx/DcLxN3WfCxjoovh5CHaxrUPW9KLUZ8N0YihJqe0
         oE3kZiFyz0l+H+yIE5E60Zco30yo/d5A+/zTkXgajxKQQWklSc565+3Z9/yIr9KSfY4p
         qmZDXo/cfFwkZ0fDZQP+aqQTXGbqmSOcf2jbZKsjtseBmbN+ec+kBPYUlANRVx3FcnGI
         ccvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRaEnElP/QV9hN1ts1sLNzPxMZ8KKvKRQO211tdbfOvig96M3IR4QNogM5Hq8l8jtKX2GPMmrosZRtF2UJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwmTNR54prwScLNLtaUIkyO0mSbq6ZBB/GwPMTEDou+JR9V5a1v
	ZhxGuP6qL/OEfv5LnThKfWKCzOFg6XEdbUUA5fKZuWowOtcws3pPAcN9YJJ02KM=
X-Gm-Gg: ASbGncvR2ZCn/qrd9TAf75KVrBaPpM2ryRvfaS+1Jj4EG6B6Bv3zEic6dT7AXyQp5ek
	/wz04mbqG/XeK4lvy+YAwviM14XnWuGZIZs+KaWt8SFXIftFeXhpich5uNwZz03/rKPExd3kx97
	E3KsuvOat5xySMV4PBxocTSIssz/MWKGs2ile1PcxVzbjlbFHeozRXy4CVFZ5DVQ5ngEzOHOBtW
	pQSDOAba+xa/uu39btI1V2kUeBBFQomZ44Dq5kN/xcetv+/J+h3p4JlWCEwxwTUpwBEj3E=
X-Google-Smtp-Source: AGHT+IEwNi9zQ3A7BISJyLzoaI8unrHh3ncETKsF78rBfn5vGpXEDRRpfEKjoscYnK+ZRjyytNSKlA==
X-Received: by 2002:a5d:598c:0:b0:382:4110:ecb with SMTP id ffacd0b85a97d-385fd3e905amr6274200f8f.26.1733320829865;
        Wed, 04 Dec 2024 06:00:29 -0800 (PST)
Received: from localhost.localdomain ([2a00:2381:fd67:101:8e2:966d:36c4:3579])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e2c84d52sm13689978f8f.49.2024.12.04.06.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:00:29 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] qrb4210-rb2: add HDMI/I2S audio playback support
Date: Wed,  4 Dec 2024 14:00:23 +0000
Message-ID: <20241204140027.2198763-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebased, re-tested.

Changes in v6:
-- updated tags;
-- corrected dai reg number in q6afedai;
-- changed dai link name to hdmi-i2s and updated commit message to reflect
that HDMI playback can be used as i2s playback;
-- removed excessive dai-link from sound node (it should be a part of
another patchset).

URL to previous series:
https://lore.kernel.org/linux-arm-msm/20241112025306.712122-1-alexey.klimov@linaro.org/

Changes in v5:
-- drop MI2S clock in sm8250 patch (seems to be merged);
-- fix gpio-ranges in lpass_tlmm (Dmitry);
-- added reviewed-by tags from Konrad and Dmitry.

Changes in v4 (or since v3):
-- cleaned doubled spaces in the last patch as suggested by Konrad;
-- added Reviewed-by tag to patch 4.

Changes since v2:
-- added tags, updated commit messages, added Cc;
-- updated LT9611 -> LT9611UXC comment in qrb4210-rb2.dts;
-- updated addresses in DT to 8 hex digits as requested by Dmitry;
-- added lpass pinctrl to sm6115.dtsi as suggested by Dmitry;
-- added lpass pinctrl override and pins description to sm4250.dtsi,
pins are the property of sm4250;
-- verified with make dtbs_check as suggested by Krzysztof and Rob's bot.
-- dropped two patches (they seem to be merged):
[PATCH v2 1/7] ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
[PATCH v2 2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
-- stopped Cc-ing out-of-date emails.

Changes since v1:
-- removed handling of MI2S clock in sm2450_snd_shutdown(): setting clock rate
   and disabling it causes audio delay on playback start;
-- removed empty sound { } node from sm6115.dtsi as suggested by Krzysztof;
-- moved lpi_i2s2_active pins description to qrb423310 board-specific file
   as suggested by Dmitry Baryshkov;
-- moved q6asmdai DAIs to apr soc node as suggested by Konrad Dybcio;
-- lpass_tlmm is not disabled;
-- lpass_tlmm node moved to sm4250.dtsi;
-- kept MultiMedia DAIs as is, without them the sound card driver doesn't initialise;
-- added some reviewed-by tags.

Alexey Klimov (4):
  arm64: dts: qcom: sm6115: add apr and its services
  arm64: dts: qcom: sm6115: add LPASS LPI pin controller
  arm64: dts: qcom: sm4250: add LPASS LPI pin controller
  arm64: dts: qcom: qrb4210-rb2: add HDMI/I2S audio playback support

 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 51 ++++++++++++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi     | 39 +++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 87 ++++++++++++++++++++++++
 3 files changed, 177 insertions(+)

-- 
2.45.2


