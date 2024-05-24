Return-Path: <linux-arm-msm+bounces-20415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4E8CE8D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 18:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBE161C20D6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 16:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F43C12837E;
	Fri, 24 May 2024 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dylanvanassche.be header.i=@dylanvanassche.be header.b="TlR6TeFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from www316.your-server.de (www316.your-server.de [88.198.220.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E625E12F363;
	Fri, 24 May 2024 16:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.220.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716568981; cv=none; b=G7c3d9SH8AcvVg+fgYIklhT6iYEw9Z23Mn+Cj1cuqWK41sUvPYZmeCmCBCWItwdE9ZTan8egl8/cFcqsGIauOhG8840ukyGhdNM0ZTvPlxFTpadu5Wptn657i1GWfVVsQRpwhHr3reD9K1ewJZSbeg8TJmrM4MxauYVIzGpqp8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716568981; c=relaxed/simple;
	bh=dtbYC5HHphLVUvfeXkdxQcn0lt59NyLvdwoqXy0rgnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4S8IUesldr0APt1vXPWNo8jUNRmwWbGJWhyf9l0x7POh2//HATq4Bx/gpfDWIq6iPWw/6udscpfjYsvEa3C7jd/Rf6S9q/HZhdSgmZYe7Au0SxJ9GbwgOKoUTQohhYh6pYXvvD3eec3GLAmAGcRF6Eaf4DLu+ODWwsoNNCxSuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dylanvanassche.be; spf=pass smtp.mailfrom=dylanvanassche.be; dkim=pass (2048-bit key) header.d=dylanvanassche.be header.i=@dylanvanassche.be header.b=TlR6TeFi; arc=none smtp.client-ip=88.198.220.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dylanvanassche.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dylanvanassche.be
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=dylanvanassche.be; s=default2306; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=28uW/QO7kF1141euKPJB0QF0y7vWqj8GEzu4drjKWkU=; b=TlR6TeFitxLmM2UVmwwiuQFLQV
	M5YHHzUmS8yJ3eULdTe70zqyBIRnm01b41SpdNBPGGPztGZJvHd5BOcRSB1Caqqw/kVTt75C0xXLJ
	10XxVUVMqpySAQlXiWDUoqJCd0JwIaMU3uqwr1ti+rCYhe/QYL5ZmDZMjHARQulSIYQyXaVLH6Y/C
	R5mdUXjHXTl8hKuuZq0jCSW4YzZWv0Ak8Tz53bnGTe4UatgPl4K58JwN957bpr5nScNIlzbCMcgaH
	NnKAC4TzaCd6dMSVomJZuX9NgG1qDOhtuyveSC9raohm4l4A4AY8q+NFU4rMY/Vc2NpfXXYrKnZLt
	JlMe4xgw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www316.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <me@dylanvanassche.be>)
	id 1sAXYq-000K0R-Ep; Fri, 24 May 2024 18:14:28 +0200
Received: from [169.150.196.25] (helo=desktop.telenet.be)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <me@dylanvanassche.be>)
	id 1sAXYp-0000gS-1g;
	Fri, 24 May 2024 18:14:27 +0200
From: Dylan Van Assche <me@dylanvanassche.be>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH v5 1/2] misc: fastrpc: support complete DMA pool access to the DSP
Date: Fri, 24 May 2024 18:14:02 +0200
Message-ID: <20240524161423.15392-2-me@dylanvanassche.be>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524161423.15392-1-me@dylanvanassche.be>
References: <20240524161423.15392-1-me@dylanvanassche.be>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: me@dylanvanassche.be
X-Virus-Scanned: Clear (ClamAV 0.103.10/27285/Fri May 24 10:30:55 2024)

To support FastRPC Context Banks which aren't mapped via the SMMU,
make the whole reserved memory region available to the DSP to allow
access to coherent buffers.

This is performed by assigning the memory to the DSP via a hypervisor
call to set the correct permissions for the Virtual Machines on the DSP.
This is only necessary when a memory region is provided for SLPI DSPs
so guard this with a domain ID check.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/misc/fastrpc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4c67e2c5a82e..c06667b29055 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2255,6 +2255,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	int i, err, domain_id = -1, vmcount;
 	const char *domain;
 	bool secure_dsp;
+	struct device_node *rmem_node;
+	struct reserved_mem *rmem;
 	unsigned int vmids[FASTRPC_MAX_VMIDS];
 
 	err = of_property_read_string(rdev->of_node, "label", &domain);
@@ -2297,6 +2299,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
+	rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
+	if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
+		u64 src_perms;
+
+		rmem = of_reserved_mem_lookup(rmem_node);
+		if (!rmem) {
+			err = -EINVAL;
+			goto fdev_error;
+		}
+
+		src_perms = BIT(QCOM_SCM_VMID_HLOS);
+
+		qcom_scm_assign_mem(rmem->base, rmem->size, &src_perms,
+				    data->vmperms, data->vmcount);
+
+	}
+
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
 
-- 
2.45.1


