Return-Path: <linux-arm-msm+bounces-46608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D89F4A240CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 17:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 654477A1D2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 16:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A647E1EF097;
	Fri, 31 Jan 2025 16:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pb4H5z1+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96491E1C3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341411; cv=none; b=U2lKZGi/nfAIs5AGGV1J2IOBQyy5MzB4QP/MUj0sK5jXjGIIAt3uko+I54nt/kDrzH7XNluwrU53XvB4v6zewb6cUezWtx73k7taMcirB0U0OtJUe8ncqAeIHMcGvvmb3xo7qOH8kHTUpgVoLorRnAITlN4pRql2Y9W94a5miPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341411; c=relaxed/simple;
	bh=p0VPgA+jkv871ikjZhyvSRtdccIWBvWj2uD+8piZL4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CVJa8myqcUPuY7PckkIIAq+X9mjJzkjbHEMVbXjG+ueHBfSviLh6aYeWS4s2CX0q+KJM8V+N76kxZkJO/PryoIyjPg3yooiEkrWjIrYMyeEcvZ8xUW76XkxzZ8ZMTeRDnOUapsuRN/yOqpXuPVWEFi4H2OvvSl30646bmT2gLJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pb4H5z1+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38637614567so1053656f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 08:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738341408; x=1738946208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtFQ9J65cFd3o5+YuJiRQk+pzjY2xY2gR0s0VLRS55E=;
        b=Pb4H5z1+Uu1LC8ZqRqt/P5NWQsurbhn7JcySfZX6An198Q2IsO9PhH23acJmjw4Zau
         W3XZrvsjczpr5olBdeyCdVUhkLlOptsiwxF3BDl1ZS29KcVUN4cK630K+cruTKbbrYp3
         c7vd+tLuv+7N0shWqkB2n2p1pXoAf+c2yvvAaTB2RuTubC9S2qQnjVu4sGPkdkiCjhzf
         Cuf2uqhlD6HkMi9W6WwaXphSti3XL28YMPgpngbvjfLb5ONeuen7Fimgfb6g+3FPOmYN
         h4dS+RYMZC1rljFPJfTDqC9RxtQVLHOf0rS5xtPUK/+ca5NGziTU5rkxJNBglDZ9hm88
         4sPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341408; x=1738946208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtFQ9J65cFd3o5+YuJiRQk+pzjY2xY2gR0s0VLRS55E=;
        b=M/fBIM8RLeW66V3QibWHlo295wdhznVOFQhAW9OXq+O9M4scLAQKrJ3Bs5ouNTG+IT
         94VDlOJnMDX2R+63xMeqUEyVHPu2OPGc1Te/n6f80/LcJZlF1BjO4vs0B7SvNXl9s+fK
         7Oi4hN1J07fPD6Ba59vO+BukFuqrBEQds6riPT3nhH8QiTs5DUNGMl7PBzxvPN6xJHdx
         yqISx0eVi/9n5IAUhNdAmK9rbEoSlpOnETCFo+oQTegK8gvvPnkUFX81Sx5tjrk8ufkW
         A8QQON+/AeTGDNi0AKvhrWeJFXKSDkDwNdTSJtN5+WZf5betGr71t10o/0EXDEOt4nK0
         Yufg==
X-Forwarded-Encrypted: i=1; AJvYcCWgCspd1KmW7IAU2liJ8GCQpgUHwTD2pSuTKIWEXKF23hpnzNeZqPmwHh9vYSkZ3LEpk/U1tiVc2QwW7oWN@vger.kernel.org
X-Gm-Message-State: AOJu0YzcM29ZJDETZ8AK8VPSqcGj2pTi2KzjW249SQmlQTybHYuquuR3
	i6kAGtK5ejmWWFWY/LLdQYjnqiq0IKRkD4tXOBzlkUsllvU0yu45zcpcN4OwvQs=
X-Gm-Gg: ASbGnctQJoQyH/45u1KJeHUgScput0FEMsTO5q80Nbiu9oHQL5vyHQuhKsjEEWL4AQo
	xL69E5xlWPesrmoySy+fBNafPFWc9k5pgH0we+qbDJBwKnPD0Gc8+H4R4Atba/RUVlg1wt+VEBZ
	S4bJfs9qQyORI9N5dYeTkt+Xs2yeK0OsacYGV07Kt3x/m68NxMuNIhN9aAKP50XNlRNNHDAJQY4
	jBFLUvy4vWmGDYF4+D08MbFxhWqChDAEOPhY5W7Gd49fDmDDSaYdMI46/uCBggECxDLVrJDqX4j
	U2NmHRFyduCSbo0=
X-Google-Smtp-Source: AGHT+IF5Phsc9N8X46dajNfJWnr4UVEjpzVbx4Mq2WI4DCkq1bHDvZhiQxOuFhDTImar5RTr5xSPFA==
X-Received: by 2002:a05:6000:4008:b0:386:459e:655d with SMTP id ffacd0b85a97d-38c51952173mr9891268f8f.20.1738341407991;
        Fri, 31 Jan 2025 08:36:47 -0800 (PST)
Received: from pop-os.. ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1e8f53sm4975118f8f.100.2025.01.31.08.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:36:39 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: quic_jiegan@quicinc.com
Cc: quic_tingweiz@quicinc.com,
	quic_jinlmao@quicinc.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	James Clark <james.clark@linaro.org>
Subject: [PATCH 0/3] coresight: Alloc trace ID after building the path
Date: Fri, 31 Jan 2025 16:36:12 +0000
Message-Id: <20250131163617.1730505-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Proof of concept to support CTCU device. Applies to Jie's patchset in
the parent email. I think this would be a good simplification, it
removes some code and makes things a bit clearer, and works for both the
old and new CTCU requirements. It will require merging into the parent
patchset somehow as it undoes some of those changes.

James Clark (3):
  coresight: Don't save handle in path
  coresight: Export coresight_get_sink()
  coresight: Alloc trace ID after building the path

 drivers/hwtracing/coresight/coresight-core.c  | 107 +++++++++++++-----
 drivers/hwtracing/coresight/coresight-dummy.c |   9 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   8 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |  20 ++--
 drivers/hwtracing/coresight/coresight-etm.h   |   1 -
 .../coresight/coresight-etm3x-core.c          |  84 ++------------
 .../coresight/coresight-etm3x-sysfs.c         |   3 +-
 .../coresight/coresight-etm4x-core.c          |  83 ++------------
 .../coresight/coresight-etm4x-sysfs.c         |   4 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
 drivers/hwtracing/coresight/coresight-priv.h  |  17 +--
 drivers/hwtracing/coresight/coresight-stm.c   |   5 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |   6 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |   9 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |  13 +--
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
 drivers/hwtracing/coresight/coresight-tpda.c  |   3 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
 drivers/hwtracing/coresight/coresight-tpiu.c  |   2 +-
 drivers/hwtracing/coresight/coresight-trbe.c  |   4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |   8 +-
 include/linux/coresight.h                     |  25 +++-
 22 files changed, 159 insertions(+), 258 deletions(-)

-- 
2.34.1


