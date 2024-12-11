Return-Path: <linux-arm-msm+bounces-41415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D229EC664
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05AEE281C4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D758B1CBE95;
	Wed, 11 Dec 2024 08:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BczuDJ7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E4C1C5F21
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733904202; cv=none; b=Myuh0sPolu56laSZ8kDMxeKkhFyewa4/KAxlnuy4RDWRBMB2YvmjwRzYEXNSgmE1VtO6f9YBClRyly3Aqe+CC9WQhy1/N+FfSt+SJvLVXClD45RhZ9ySoBiqx2zwPLlgYdWVo/27SKNo6+uRqdPyDotNaipUeKJkC2w6Oq7Kiz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733904202; c=relaxed/simple;
	bh=18dfAsJlCKKxYu008KH/doncLm3ahMbb5fWFgsTqfyw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n6dy06vsAL9pOQwhoc8M1YrTO1DiCrcaytth4RDkOgv03KyVd/EJXP43gYtZJoX15PvmIwkO3NdThJyKSQKGUMZhIO/Wik+UV0UNutn98EXO9I8UJKkjluHX6Ayg0jWoYDFOgOs/KB/VNcRXaHzBSookK45MPfeVBqeF1oOJhkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BczuDJ7+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361ecebc4dso1356665e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733904199; x=1734508999; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uUTjWCfFK25O0mEpKlAILv7lGyjXAlPoRvwgz9GDlh0=;
        b=BczuDJ7+3N11cKwhBuxUnXrzd/nZkPLV55/7dU6sbZ+EZuy0t3uR70VgwS3Tcxm1Pb
         fJdnEvLumVmbjClp6MyXmNFBUBvvBU7wIV6sihYHhhre4fp9hdYuwj3eZxKcc8Mdw2sJ
         vKNzOE9csyCpZaTWgKflgBCHKFeCPbd4018dBw5Z1IU+Y+3DuUAkQe2S7rEwH0ZsGmw1
         wpYA0KR2cvHw7y2yAc7tZCrldd0FfI4GakKKXl8qK7sghTOiZ6G2GZFAFLRKu6OXU4Gs
         HQ8saTuEMEzFFKQL4cv76Z7qjd1Pg8fezhcG7+RgcbXjvW3fxOEApBz9K6rcWZzph1WG
         MQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733904199; x=1734508999;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUTjWCfFK25O0mEpKlAILv7lGyjXAlPoRvwgz9GDlh0=;
        b=RMJn2uo9jpNsTWALSwcKVdW26xzHuFDzOqkzqpTeqY04HDXwqC2d6oWeOD8+ZbBfks
         VyAdnYGVEsjMeoZZ6Aq+sva+ZFBle0dPAkyurIKwK2+iybDYfKLUvvDc4lywZNjNH5+K
         C92eszxGeLc07Yy0nDU54R0tEFHYKOYgUE7aHH4u/GNMrWnJgLDv/0KyNaTtOWktVogc
         jD+AXrrAb20x+cUOcqj086zlE31PhMIXtI1Ah5NP3QJcunpq/cP/83r+Y7wVN0FM733K
         OGD07Lsfkfboqs8RGFHyCSbFNAbre0wXULGYobp61Fh+kJxbdl9atU/GZgqAt+T5qQvw
         S6mg==
X-Gm-Message-State: AOJu0Yw0iyP+U0deUKZGgqa4hdtLjV0hVwoPr2IYwAZL/cDuqv6Je9rs
	kouCqjJ1iyzD7ZN9Hxs3tWUrG1VSVXP5ILzAfAQeE/Z7/YuHQdfXD45kym61Tv5tHgvK1JrOZHj
	8v+Y=
X-Gm-Gg: ASbGnctFuREoeeyGq5oNKpmEJJUQTHF/ntWOb2Jv59dDzV/7UI4KUD4CsH68nJJb8uG
	rpYQQSS6s+QF1pmx0X4AMKeq9emYSENPuVB8Zko6lsdfxgwaz388CC8D/hNe2AC4eYve9gTyJx1
	o/TAWDvBXvlt1To5DjLmKRMTkK5f3+UbX5jo2hisQzUnKmB0gHCT4hwJZYRTZZ/doVv04hKRcwb
	+uYirwLCRO7BT7N1NmgukFK0rWm0F1O0fgcZApn4jEMxoqTDBKR33c3D62Bxhc74ZMHiONv/4w=
X-Google-Smtp-Source: AGHT+IGYzjF2GoMN/mzbTBQZ9HSt3+0BYcYYNQD1nS7FVlmWb2TbC/8TDIB4hAO+rR8sQxvunv+I/Q==
X-Received: by 2002:a05:600c:198c:b0:434:f3d8:62d0 with SMTP id 5b1f17b1804b1-4361c375f53mr13238575e9.3.1733904199425;
        Wed, 11 Dec 2024 00:03:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361b09fec0sm24205795e9.4.2024.12.11.00.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:03:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/6] arm64: dts: qcom: misc DT bindings check fixes
Date: Wed, 11 Dec 2024 09:03:08 +0100
Message-Id: <20241211-topic-misc-dt-fixes-v3-0-010ac10529b1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADxHWWcC/33NTQ6CMBAF4KuQrh1TSh2ElfcwLvoHTKKUtKTRE
 O5uYaWJcfne5H2zsOgCucjaYmHBJYrkxxyqQ8HMoMbeAdmcmeBCloJLmP1EBh4UDdgZOnq6CCj
 xbFVTK2k0y8spuP2Qh9dbzgPF2YfX/iSVW/vfSyVwQFsJrlGepMPLnUYV/NGHnm1gEp8I/kZER
 jqNujHKGll3X8i6rm/nug5Q/AAAAA==
X-Change-ID: 20241204-topic-misc-dt-fixes-6468da97a4cb
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Felipe Balbi <felipe.balbi@microsoft.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=18dfAsJlCKKxYu008KH/doncLm3ahMbb5fWFgsTqfyw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWUdAoAOYV7ddktvLNtwMgnWG4pTDqVf71cRha4C0
 m4EJO2yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lHQAAKCRB33NvayMhJ0UHgD/
 450PKIYFMPm+C9+o5gXBK79aUxibPFi7jkG/C7GnZ+VIxF+mJ/QAo5GXrQAN008wBTyDGMphlkonCw
 YPdQJpaNE9MabBLO+JQExLfXJEji+Cw2MICOyIQaEQGe+XiWyEsKFriq2wgAzp/PTe/4YyL32NHn1/
 idFWfZEu4boELbTYUGQYRnHJ+BkY90BqGzR6aFLTHidPVJQ4Qo1MH0gAphDjS7vv8MCOBr9dhuw1r5
 9ApHjWlyBXk2J6kuzq3Kq+yn5YtDxiwCQ0pH+mer0EEUHJeTJeokibhSCuJsvv9WMD4RWqixb++4Ie
 LQv36pR5/gjevwZzYgBqWHi3deL1WFTIpH+LKsoku3IbHbD374fGOYxq4J9xJFVczK6P7xTUSOIdsp
 NCo87Nqm01J8TCmy/FNw394ZY65Y5qQIoXQmUlCjj1DtkyqDM2rQ0ZYSj0l3XEKVhO4nqUatrEmgTF
 wbjXYuWOhm2VXdg1FRr0exXq2RJJqwDZ2l9lFXstOxjKYu3muO8od2BxmrHnMHyJ3XvGMfKuihO5Cx
 PlX0lJug3SE4nIYBS/yJE+5e+HDu6pQHgAvVfs/+LxEI8fBQ8hRN7XpZkYBMNcyNb0A6/thzb7e5/t
 3LbWapA8T+/po7Ap+HtR6W7hk0LLsolqNlHq5e+/lNiJk5ByC/gmhNQbg58g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Here's a set of DT bindings check fixes

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Added review tag and missing fixes tag on last patch
- Link to v2: https://lore.kernel.org/r/20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org

Changes in v2:
- Collected reviews from Dmitry & Doug
- Dropped camera support entirely in sdm845-db845c-navigation-mezzanine
- Added fixes for sm8150-microsoft-surface-duo
- Link to v1: https://lore.kernel.org/r/20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org

---
Neil Armstrong (6):
      arm64: dts: qcom: qcm6490-shift-otter: remove invalid orientation-switch
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: remove disabled ov7251 camera
      arm64: dts: qcom: sc7180-trogdor-quackingstick: add missing avee-supply
      arm64: dts: qcom: sc7180-trogdor-pompom: rename 5v-choke thermal zone
      arm64: dts: qcom: sc7180: fix psci power domain node names
      arm64: dts: qcom: sm8150-microsoft-surface-duo: fix typos in da7280 properties

 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |  2 --
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |  4 +--
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |  1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 18 +++++-----
 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   | 42 ----------------------
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |  4 +--
 6 files changed, 14 insertions(+), 57 deletions(-)
---
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241204-topic-misc-dt-fixes-6468da97a4cb

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


