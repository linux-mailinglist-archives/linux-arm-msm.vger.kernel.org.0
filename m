Return-Path: <linux-arm-msm+bounces-17624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DE68A785D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 01:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CC3E282B9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 23:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D16D13A86E;
	Tue, 16 Apr 2024 23:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sVPSgJ+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AFC139D04
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 23:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713309033; cv=none; b=HSgnObPvSrlsOUoSLLCXy2Bc8y2oi0AwndeB9w+5r+wLmdhyIECm2P8sQQsAhSncogH6j1aDRnJW+it9euPAj5+fLtzzmwKwPG4jF9vxXWBjzXaAlK8rzm4sHckczqccLObqoQwivoTRWc0R3LdI1uIoP2mwNFWg4itsRxpV0Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713309033; c=relaxed/simple;
	bh=ymDm8FNebz/mOiDajTJYRMBuXxCLleV3KCeiOkFjjXA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S67c05VU9qzyZ0Os9hIiD6woRw3o7c8PJArpKQn0C0l9nRBdHM00VWJJdv9FprjaFLut77uq06+tllYQV5qqs3gUzWOfBeqBFYpZ1zNDh8A5oK9sEDl7V0K3bgbPCZPv2PcOAtJxFfwrRDu9GM2k1iRP+g/9/VO1qIgjlFEy/TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sVPSgJ+E; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7d6c6ed6b39so11616339f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 16:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713309030; x=1713913830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wWdyAt9+nQw8Qr1h0NChEuvDVEscavXKBcKHv+jkRUk=;
        b=sVPSgJ+EOb1X64uDWh1BKOW0kGRR6xqi7xKzBeI/IGTEk5KhgS3r85VbwLD0CzllFF
         PN3566xc/AfbNPE1Bc+A2Kq7iO/It3Jr7fxF8UxOOiE7GHfO9hwmEnD3rPeXBOsjr6Oo
         MivCLRbmppZBIzWhw1IpgARqFiwVjLLFAG2b7TlYwGgF3UwbRBr2TDGwH5uibPZNxvJS
         okiSWKUic5rx3r9+xf4pOIPOou6nILtan2N6MrUscjjIQFqOLAiAWhFnZE5kmBdEwjsZ
         EEfbaL+6X0w8dyyulCaZjBAACUlOwwhz9LQEIVHdYUnUcvSS7CJtGMvIK0NsCrKlkejB
         XKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713309030; x=1713913830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWdyAt9+nQw8Qr1h0NChEuvDVEscavXKBcKHv+jkRUk=;
        b=o+9icAO/RwKyNrO8dXOpGWdISTjqb7j216PH1UNARm41WiasiUAnXNtAi9/zGC6KE4
         BikqrvtbDf4zTPpDV2FEDofq2GJL1VJk+WKm/cc9XODGxCk/WkkJ7qtWp88/iugJXw9l
         WLZ8sDhX2xN4xxCaNbLywyzzbqHjtPZputzFezxwwC3KuOAgqeq7ITyeBmuuwaJDVLbe
         K2jXe/u1J/WsKsEsSA7+wOA0nz/u/lak1qvplriyhf7mhUMm5/Cdgt7wleeXbrXykncW
         P0g1dwHQunFkJRPisLQntZ30qNgmth+9GddZ4ASJrGg3sLEFdMpdmV8yBew+Vu0+Y2PR
         AoxA==
X-Forwarded-Encrypted: i=1; AJvYcCV5yGq8byGlKUtpWfWfBwzKTs0wkePvzjekB/0+0PsGyxqXDZ6VLhIPhaTydjLq8m6/6cn5imsGgfwAiKhx4xVo8HyTvBdAN5+5SKPiEA==
X-Gm-Message-State: AOJu0Yz0iRpQQpAnKz0JbhtcjlXzJRWTKd8AdJFmMQElKxj5TOPTdVAw
	2DxEFBePZ0ivW+m3Fm1nPJ+ZN3A72V5iCQQY4F/Uq3tu77iHLMZ30ViyCmACffE=
X-Google-Smtp-Source: AGHT+IFBzqHKauKE431Ap7rruqxL8m+evB+FBiojGzEmkAMuz2sLkBpLbgNVXueReWbxd96Fq/JIug==
X-Received: by 2002:a05:6602:1206:b0:7d6:12d1:5879 with SMTP id y6-20020a056602120600b007d612d15879mr3165187iot.1.1713309029684;
        Tue, 16 Apr 2024 16:10:29 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id le9-20020a056638960900b004846ed9fcb1sm372170jab.101.2024.04.16.16.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 16:10:21 -0700 (PDT)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/7] net: ipa: header hygiene
Date: Tue, 16 Apr 2024 18:10:11 -0500
Message-Id: <20240416231018.389520-1-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The end result of this series is that the list of files included in
every IPA source file will be maintained in sorted order.  This
imposes some consistency that was previously not possible.

If an IPA header file requires a symbol or type declared in another
header, that other header must be included.  E.g., if bool or u32
type is used in a function declaration in an IPA header file, the
IPA header must include <linux/types.h>.

If a type used is just a struct or union *pointer* or enum type (and
no members within these types are needed), then these types only need
to be *declared* within the header that uses it.

This is sufficient, but in addition, this series removes includes of
files that aren't necessary, as well as unneeded type declarations.

					-Alex

Alex Elder (7):
  net: ipa: include some standard header files
  net: ipa: remove unneeded standard includes
  net: ipa: include "ipa_interrupt.h" where needed
  net: ipa: add some needed struct declarations
  net: ipa: eliminate unneeded struct declarations
  net: ipa: more include file cleanup
  net: ipa: sort all includes

 drivers/net/ipa/data/ipa_data-v3.1.c   |  5 +++--
 drivers/net/ipa/data/ipa_data-v3.5.1.c |  5 +++--
 drivers/net/ipa/data/ipa_data-v4.11.c  |  5 +++--
 drivers/net/ipa/data/ipa_data-v4.2.c   |  5 +++--
 drivers/net/ipa/data/ipa_data-v4.5.c   |  5 +++--
 drivers/net/ipa/data/ipa_data-v4.7.c   |  5 +++--
 drivers/net/ipa/data/ipa_data-v4.9.c   |  5 +++--
 drivers/net/ipa/data/ipa_data-v5.0.c   |  5 +++--
 drivers/net/ipa/data/ipa_data-v5.5.c   |  5 +++--
 drivers/net/ipa/gsi.c                  | 18 ++++++++---------
 drivers/net/ipa/gsi.h                  | 10 +++-------
 drivers/net/ipa/gsi_private.h          |  7 ++++---
 drivers/net/ipa/gsi_reg.c              |  6 +++---
 drivers/net/ipa/gsi_trans.c            | 12 ++++++------
 drivers/net/ipa/gsi_trans.h            |  9 ++++-----
 drivers/net/ipa/ipa.h                  | 15 +++++---------
 drivers/net/ipa/ipa_cmd.c              | 13 +++++++------
 drivers/net/ipa/ipa_cmd.h              | 10 +++-------
 drivers/net/ipa/ipa_data.h             |  4 ++--
 drivers/net/ipa/ipa_endpoint.c         | 19 ++++++++++--------
 drivers/net/ipa/ipa_endpoint.h         |  4 ++--
 drivers/net/ipa/ipa_gsi.c              |  7 ++++---
 drivers/net/ipa/ipa_interrupt.c        | 10 +++++-----
 drivers/net/ipa/ipa_interrupt.h        |  6 ++++--
 drivers/net/ipa/ipa_main.c             | 27 +++++++++++++-------------
 drivers/net/ipa/ipa_mem.c              | 15 +++++++-------
 drivers/net/ipa/ipa_mem.h              |  4 +++-
 drivers/net/ipa/ipa_modem.c            | 14 ++++++-------
 drivers/net/ipa/ipa_modem.h            |  5 +++--
 drivers/net/ipa/ipa_power.c            |  8 ++++----
 drivers/net/ipa/ipa_power.h            |  5 +++--
 drivers/net/ipa/ipa_qmi.c              | 10 +++-------
 drivers/net/ipa/ipa_qmi.h              |  4 +++-
 drivers/net/ipa/ipa_qmi_msg.c          |  3 ++-
 drivers/net/ipa/ipa_qmi_msg.h          |  3 ++-
 drivers/net/ipa/ipa_reg.c              |  4 ++--
 drivers/net/ipa/ipa_reg.h              |  6 +-----
 drivers/net/ipa/ipa_resource.c         |  3 +--
 drivers/net/ipa/ipa_smp2p.c            | 10 +++++-----
 drivers/net/ipa/ipa_sysfs.c            |  7 +++----
 drivers/net/ipa/ipa_sysfs.h            |  4 +---
 drivers/net/ipa/ipa_table.c            | 19 ++++++++----------
 drivers/net/ipa/ipa_uc.c               | 10 ++++++----
 drivers/net/ipa/ipa_uc.h               |  3 +--
 drivers/net/ipa/ipa_version.h          |  4 +++-
 drivers/net/ipa/reg.h                  |  8 +++++---
 drivers/net/ipa/reg/gsi_reg-v3.1.c     |  8 +++++---
 drivers/net/ipa/reg/gsi_reg-v3.5.1.c   |  8 +++++---
 drivers/net/ipa/reg/gsi_reg-v4.0.c     |  8 +++++---
 drivers/net/ipa/reg/gsi_reg-v4.11.c    |  8 +++++---
 drivers/net/ipa/reg/gsi_reg-v4.5.c     |  8 +++++---
 drivers/net/ipa/reg/gsi_reg-v4.9.c     |  8 +++++---
 drivers/net/ipa/reg/gsi_reg-v5.0.c     |  8 +++++---
 drivers/net/ipa/reg/ipa_reg-v3.1.c     |  6 ++++--
 drivers/net/ipa/reg/ipa_reg-v3.5.1.c   |  6 ++++--
 drivers/net/ipa/reg/ipa_reg-v4.11.c    |  6 ++++--
 drivers/net/ipa/reg/ipa_reg-v4.2.c     |  6 ++++--
 drivers/net/ipa/reg/ipa_reg-v4.5.c     |  6 ++++--
 drivers/net/ipa/reg/ipa_reg-v4.7.c     |  6 ++++--
 drivers/net/ipa/reg/ipa_reg-v4.9.c     |  6 ++++--
 drivers/net/ipa/reg/ipa_reg-v5.0.c     |  6 ++++--
 drivers/net/ipa/reg/ipa_reg-v5.5.c     |  6 +++---
 62 files changed, 253 insertions(+), 228 deletions(-)

-- 
2.40.1


