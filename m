Return-Path: <linux-arm-msm+bounces-40307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B07799E3EFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66467285694
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5EF2139DC;
	Wed,  4 Dec 2024 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr9aq7G9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB512139B1;
	Wed,  4 Dec 2024 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327895; cv=none; b=awlEkfHCf/er4qBJ4VV/vW4o4zCMTE8gDcBjbIiqhXSW9RqxdFOhlXH/Lfov2VCclRlpM+5/9unGucDpnn4XW2HPQ3lZxoYjT9XpSMO/69p2L/BGjkjr0jbS9RcI8rCvsLqdkQnqsI1G5DTfvcERX+PR/SZdmtgJaPypgvLPFQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327895; c=relaxed/simple;
	bh=S6Rb/mVurB3CrznT++E7Ya5mPE957VSJz8lp4pr8HDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vs91q6KgMGp/7PGawxBDCgYyRyLD/Fhk0NV5hkqiugDUSz6TC2OisqtKzHLTa4jSYBcu3DbeC67xAqgGugIhTWemIbVhahz7bx8kpVQ9BLNN4BY+J25kUOfH7olxTQsLfvq6urpH1pW9vFP9aYR3SnQA40GzmHQtApwHUbF4dVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr9aq7G9; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53de7321675so7510724e87.2;
        Wed, 04 Dec 2024 07:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327892; x=1733932692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERqtwU8OA/8boolNfifBHtI3svqy087oNlMJx9UxCto=;
        b=Qr9aq7G9yGYjTLwnxIpMbbeFofzfQbuEz0kTeTOBe6VW2krY5uo/R0LLxJbVgFd9C1
         OSdVY6axhJZOd4cezxrpMO/w8fHQE3zMyeLo3ULhbth3tvmBSAVu3CnA3jh+QexTKSZr
         i5KAKIh7KP1wSMfJIDlofVcoWmZV2BsMCPN9oU1bdYv3Zz484YOjxXJHkoTNLWEzQA4a
         qP3Xey11MzqRGib/qqe+U36EhyHkMxYjmTB8s6SYIs6i+RIzFxXen6+HnTXtb9JZqla3
         9wxr77lZ/839pTyZpHuy+nGHLrD81nfwJEhR487v/pdHN5ZMYMaV/dYS3Ifcg4H6GwlD
         6PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327892; x=1733932692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERqtwU8OA/8boolNfifBHtI3svqy087oNlMJx9UxCto=;
        b=cZqBi/SXfHb4wVUqitu7LJzN9Um1VhS9DuuC0SWSwiVVRFgn98K4CumVEVjSjEudq2
         mTttx4RSJjlmRJVAcq7k7uL+EFjMhAKrAb0tj3rJk2Pu4KRJYNlNNLt8BHi1fdVxPYv8
         3PC0PMKKU4RnWjTqQwID/qCYFb+B8yWWggvzhy3FxfodnZ1cfmDb9GntHw67pxHLbCzM
         NQSSd5ekZdTaez8P2QWLbShz11oVd5rF9AOzBLNryziWc9UdNUbsdeVTUf9XsWv4ivSt
         TfmawnUxZGBgS4i813DvaVZh1MxCGMW2M8Ikz3TvdzZw6HL8ibpAlHSh1NS5zSYF3R35
         BMGw==
X-Forwarded-Encrypted: i=1; AJvYcCWOUrEddr6p50uhdM+VSlhQCXuM+GlqGH8u9NnUf8spjIo0j0cYXk1gZGsF+RbjiDjpLhAPvR2/ksy3s6rF@vger.kernel.org, AJvYcCXfNg3CxljdeRjvjyFIdZFqUjOveyoko6Qtrfb/jTE71SNUrUGDetYMx7roITweBcrQbEN82KLaKttm9hWm@vger.kernel.org
X-Gm-Message-State: AOJu0YyjU3Da4oRn8cUfBvq+B/22+WTsoBIkI9Uu7ose/sJUciBzrM1U
	XzmWIoj6hoOB+dQILoftjnVqOeuG46lsv9E99URBVmSNmFByKwK5Wf8IJXgg
X-Gm-Gg: ASbGncvcvQDwWF5wCV7pq7Jc30C+L2Yu4V/Gm/JZOXcG6P7dsdAUDdlbWhJNiFJTa9b
	k4B6imLp+c8XYqSTGDewLOiBAQNb04alib5eMmg8gQGNlRwjTXYynTaSSZ7f2OS5/ODYSHUo6wT
	hF/JunWq0Q1m+ahBkSSVdYkiHhu7rWKR6XJLZh9bMvawC/ovvb/pAV1bgTXOXG+0N5p9l0WtUpI
	Va8Ay5ul07McGkh/ixsAkTyx3uiXpaFx90rwxa+WnjU6qQg7fTVxzFtzCfJhBcTc1l2XOeiOgBD
	q6Cppzp+i71+9M8=
X-Google-Smtp-Source: AGHT+IE+kEoBbCoYkLKnifs9gNrwDg0/EoXrecLwl97llJBHT7iNVuPl6X8ay9kKQ5BBUQOvWv6xFA==
X-Received: by 2002:a05:6512:39c9:b0:53e:1ca7:e0e1 with SMTP id 2adb3069b0e04-53e1ca7e2fbmr1940269e87.48.1733327891633;
        Wed, 04 Dec 2024 07:58:11 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:09 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:51 +0100
Subject: [PATCH 9/9] ARM: socfpga_defconfig: rebuild default configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-9-86587652d37a@gmail.com>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
In-Reply-To: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=S6Rb/mVurB3CrznT++E7Ya5mPE957VSJz8lp4pr8HDM=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvwJ+cCx0uF/fqpIJmM21EDZ3lt1UiVigNGK
 eef3S37RnSJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B78AAKCRCIgE5vWV1S
 Mj9hD/wN77SL824IT6g7JyBPkgmErbp6/Y/OZrf3FgD9B7F4lBl+X2LT//GB3+iyNul+3BikBgh
 BwuGyUwhSct+C5Sq+oVQCu2HG8ms+1kNGl/EHILWDYvYGYJcXr0u7e1IF5jmv7gCiM3myCusPKY
 AETbDZahjYdnWnfNf1U+sOeBw81AhQq2eNxx+sT5bQ7qF1t0BUTXuHVB0XH3CQlkmXrX3tfYpTG
 D4FIckCRadFZ34NkWtRHme1m6kRkUXaYInAtxRL3reZ9V7LNclpuLbNp1l6ryNEmWyVfgyGMPha
 nbIuOSTjG+OCXYwEiGoJdEpK+GO2rDApr8tfYLqavol6pwye5QNFAJPjd41L0eUxJ84AyNFNE7i
 ePhUDoGUkbf9gnsCKRx4z3dWbN3NyR0djL6D3j/40L7iNcbmfZv7RtC0ZutCwE9VI1un+SjRcjf
 /9u+A3lFRcqtrDjZUf6ulSidwizc+8ZjOTJBLx+BNUkZMxnTJ5CuBcauNCepHMiV7pgsxCHuBqR
 hhHia77aFKgwF1appiYa/LFd/MfDakiHpmjE/7y10fpmiiah0Rdg0g1dzJtresgvc1q8riy4C5L
 Wm4ibA1iN85GnHXL79CCODH3PHBM4K6lmvx5t62IOj3aJdnAERjh99RQ6Gtj3w0FY3iveMIqIwr
 1j9SS25nE8HzMcQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm socfpga_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/socfpga_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index 294906c8f16e8f4f5f6a4af5770d79a68528fb34..90c3aca7f8afde7db0062e46261ad6def7e8c146 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -41,7 +41,6 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_DENALI_DT=y
 CONFIG_MTD_SPI_NOR=y
@@ -84,7 +83,6 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=y
 CONFIG_SPI_DESIGNWARE=y
@@ -140,7 +138,6 @@ CONFIG_EXT3_FS=y
 CONFIG_AUTOFS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_NTFS_FS=y
-CONFIG_NTFS_RW=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 CONFIG_NFS_FS=y

-- 
2.47.0


