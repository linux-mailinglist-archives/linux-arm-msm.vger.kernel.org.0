Return-Path: <linux-arm-msm+bounces-79893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44840C25363
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 14:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D63A4F2E02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E7034A77F;
	Fri, 31 Oct 2025 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMahgjMA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFB833FE0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761916127; cv=none; b=g1u+a71YIeU1qLIkLZyDMrvPEe7L/QVSkl2197/XG1JdnNemh2epJld5AUoT1t3TCAvBW/V3je0o6N+aZkApfHmhaFJglHW4Lt6L47fSCOrx4QF7xWCSlr3lbF/A/eKoaS2V/BTf37I5NaROQp/rcrC3MMeQUCjGaW1JHakXi4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761916127; c=relaxed/simple;
	bh=VKF4CjxT3D21EN3VSlqJfkySRW64w1cVy7ISImqnQBU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=OzG62bNsjC6/7OsgWOR/jHSVgmpcG9nedRs4AjYs7VRrhu0QYh4TIIEfN/YRhe+OSTpgj9st4Dcu9/kipv1LZR2T/UgNgSRa1m+w87DHdwZixI3czZ9Ru7CLNPGzC+pZKUoHn+z0TQwvpSxKv2EO1kDrAvwWzgSFFDUQdv3z8Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMahgjMA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so1480707f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 06:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761916124; x=1762520924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OPUu5NpdCJ07IrysgoLFXtCrzD3ygpbZMzDguuvidnA=;
        b=BMahgjMAuroEMeLCcHA5eXhCB26spjmGosG9khKhQiOElaSD4eNT8qeC8Wb0XzHSfs
         E/14p3NKM4F2vL64dPh2QLFCFVztqrPGV+uXKIlP1IugBl4Dkoj0DyKXRcaL/1NXOdBa
         4h+YJNj85BnzrrZ+mb0uw7PaqSRb0qusqWuvYgtaZvmjqkawjPTDlZex417sSXww5gxf
         CKKfJFHPP3UyekqqOH1fMz2XdHIqCPFIeFLUdQAvolYwvlu4tPebmnl9KcwvDj6cv96E
         DVEl2m6z7qYiRBq0ZAXVUb8+rJ3Omu+ik17lIDU4LQvJQpgiTt/b5cIe4JZG6/DpND+d
         Kpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761916124; x=1762520924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPUu5NpdCJ07IrysgoLFXtCrzD3ygpbZMzDguuvidnA=;
        b=Ru+u8YlxUVFryVlVCSZe8Jch/rOg9CnBJ1MZJbFIcRK9GgsFvDPNzfrqO6hIBSO8ds
         k7Pa7QV7SqIMAQkZHJ5psMVYSPcdM8cA8LNdgVHNohaxsgOloAL/jJKoakzei0vpiQas
         j1ciJYN2zxDJd5nSOl7HKJzdHXbPz7+mI6PULbi4NOYDZefaq1NAqB1v8V0RJ7wD/dbK
         fafoLMWnqHGFaQrhA0EfxRDwe7IoqKLmdJ5xJ0Ec/xmgCKPcGMfW/ChtBBNQwoqx5I4k
         aMUOhfhUWkF01oFBWRMEpxqwPBiVGnK4b/Q3M+zXNvTRH8Rmx2q9nBLMFwChe1Qq5FPv
         5pqw==
X-Forwarded-Encrypted: i=1; AJvYcCWPdLo01Njv0/Zcakqddt6kbuFAivrjPfKuGwOcgtRhBjsopLtsixHSST+C9D3YkwDKsNiui8rcqoA2Jx+z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9YKWvcSapKFb3E6nZnmsaoJBegsj/po8zDoBsiAUG1GTPbEIM
	gKKmco8625EMGPxD8zJ47pq13MMBL/y3N8YBs0KgT+UtuaOTI1pJt6/W
X-Gm-Gg: ASbGncsFhSpolRPEeMWOgxmlSLEOslaMXot4yogSWuHv1+1Z+2Dh1w3l+7DYJMlFtWj
	0u8hlrrtLZ4OB6ApI9s2S3hZmdf3WtSDul7JqZ8H6Xn2U907EhtBHZbP/gD4c6sR/i31cDpPh6p
	H0+8IvWRn2dQT7LlvH3Vo2zXlpH+Rc05PCQjSPCKS1qdgc4p2UzhbMx7Pev6ZfSBSYgTcXhLD2r
	E/6ymT+JBfr3s00PI52WJzIb0GvTTJUFqEg062piJ2UmBwfkg2rTURIhVwQlPf52FxatNsVUEGi
	Fa+n/5nKj5Wlxvv9dctxIhyXfcQ0xWdA7bTrptNeyWGsMpFyFjh7oERFccQxEwyWVpX6E/0mBgx
	oQil8pL6AxRfwETaQwGgcAq90BGkwLvHHrB8xQMr8FhD/ujRszvoLfpVXPwAFXwGGfoDYx2w6Ht
	NH0eLaCq/vla5Fc48IekNFqb/CM9eXlQ==
X-Google-Smtp-Source: AGHT+IGkGev1IicHjK1ZUoYz2sTIloWKiWF3+MyirZCbZtLOurgaln1xWR/FBmE2aNtFKjbB1J9+jA==
X-Received: by 2002:a5d:5d0d:0:b0:3f2:1cd:3d00 with SMTP id ffacd0b85a97d-429bd5f50f4mr2736107f8f.0.1761916124018;
        Fri, 31 Oct 2025 06:08:44 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477289adc18sm98339815e9.6.2025.10.31.06.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:08:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ilia Lin <ilia.lin@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] cpufreq: qcom: handle ipq806x with no SMEM
Date: Fri, 31 Oct 2025 14:08:31 +0100
Message-ID: <20251031130835.7953-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series handle a small device family of ipq806x
devices (Google OnHub) that doesn't have SMEM init.

We improve the SMEM driver and apply a workaround in
the cpufreq driver.

Changes v2:
- Rename error macro to INIT_ERR_PTR
- Return -ENODEV from smem probe
- Restructure if condition in cpufreq driver

Christian Marangi (3):
  err.h: add INIT_ERR_PTR macro
  soc: qcom: smem: better track SMEM uninitialized state
  cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM

 drivers/cpufreq/qcom-cpufreq-nvmem.c | 17 +++++++++++++++--
 drivers/soc/qcom/smem.c              | 26 +++++++++++++++-----------
 include/linux/err.h                  |  8 ++++++++
 3 files changed, 38 insertions(+), 13 deletions(-)

-- 
2.51.0


