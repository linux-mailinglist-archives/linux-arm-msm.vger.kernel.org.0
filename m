Return-Path: <linux-arm-msm+bounces-35000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD19A45BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 317971C20E68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E69C210C3D;
	Fri, 18 Oct 2024 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STNi5ZJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5524A210180;
	Fri, 18 Oct 2024 18:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275635; cv=none; b=rv307dCgHpdWDm/HpL4OUJAmU7NkHTzV/6FKaVSMGtdN/5b+RPQbzlhBNoR/U7BFqOTOV015i+Vz7XWznLZ7rGC73nxrlM4EzmbgG+4s0XRThgyHaUOSl1t4bwobm/Shsp4ayD3TKN0839wMcbL6E4M9wZtWhfWqo04grbhsNHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275635; c=relaxed/simple;
	bh=gpysWTwbaT7QYLy965q+HAh2HOEdzqhi1zgnC19uOuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pg9+OKi6Wij7yUdi9yFznzKTxWyunxVctuHjfzi72AbvwCqQ1/0gh/Yzah+APCoccJs/vl0IxdICHlpcNIHrzzGLfi5UPxmqIq64tnfZqJaF/HXiGArgsJqhVjvJvBDTs9IJUfNJsw269oR5RgTYlIfzK5/VOH0SOputV2JcvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STNi5ZJu; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5eb858c4d20so1046772eaf.1;
        Fri, 18 Oct 2024 11:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729275632; x=1729880432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBGm+6GLpMz9H37HwD/cw/vMAFvsf+gx6krj/k7dSxY=;
        b=STNi5ZJu/IeZezukLhs7WJUyjcq7ZrSMqfjJU1P91gSiiUEM4UE1PmzAPiJDWXAuRF
         DNwdOg9dKX6CfCJ6iBUUVWylRPrvbjkJx1V51XIWEy3B2ZMXp1krFZeCSoPlt8zeUshL
         NhNK2v9t9F41RnuGagz0jxC1so8ony0d8HDkjQn7BOfSBkwWC8P5fPta1D3d435hj7oQ
         9ZZU7QlePYyQsg0nh6u9EB1ksE+gzSK8SAq0FacyQQg0IlCvouecsBxLFMZPEQD8UuaM
         r6V1xMbQfVGye2rGHU27rgN+WqkI2iPCIva+O46fzz+LjMTpzT7S/tZIRLrBYy2n/29D
         LY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275632; x=1729880432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBGm+6GLpMz9H37HwD/cw/vMAFvsf+gx6krj/k7dSxY=;
        b=DTGfQoEyCElJkmCACmCpvpp1cn/1wSkMd572CrM5xDX3fEKCr3VlT+56w2187Xkl2p
         LNLxgvHp9ie/3W2rzDeOwR+Bmx20P7NouPu3GtT5XxhOBO35f8xk0SBLaIxsdfgHAv0e
         pQribLo3z2Izd+upUzfNQd+DT2Ovc3JwjQ+fDNFgH5seG/g86BdcarIVp4BSq8VjZS5z
         AQtwDs2GDVnq17CQ/U2z3bweXKOrP6DsRHzdQ/CqBjVu4Du/wfv2j5iSLt7nPqewvdIa
         4UuZmHYQt5JIlFtxgLM/5WknXmKDTbgeraGT0QLsKneoNn4RnMSf49ExKyPqY7oojggx
         /5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVgEV5cMF4MomBBoIHKFa2muuEfOs4TQbgtGtWP+Gmv0HilhixsQVSpbGhFdddJDDVK+ObAaGW5H26ik/Iq@vger.kernel.org, AJvYcCXirWQ2yZzxjrdiGt9men50XmP7nL1eD3qHLS9miFadWG21IbEnJrsLhIBtob/ZUsC/wkfIAK1VhCaPWGNu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Ppy6k3YbMkeOmCeD4myTv25LxolrMerLk5G3MT9ZPnBzFuIk
	bCrHKIWQDM/FZ6JZAfHLaksqLr89ACUu1GEND5fx5srXsMCsxOC5/mDYhA==
X-Google-Smtp-Source: AGHT+IEigEsZoghbHPEIF1WQgJCl7+bgGhW7Sej1ZWgUeYTU8nx+mZ9xNyziTVCDCTe4s4Kbp4Qs/Q==
X-Received: by 2002:a05:6820:1846:b0:5e1:ea03:928f with SMTP id 006d021491bc7-5eb8b7b39e6mr2960787eaf.7.1729275632172;
        Fri, 18 Oct 2024 11:20:32 -0700 (PDT)
Received: from localhost.localdomain (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb8aa2f668sm340542eaf.44.2024.10.18.11.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:20:31 -0700 (PDT)
From: Denis Kenzior <denkenz@gmail.com>
To: netdev@vger.kernel.org
Cc: denkenz@gmail.com,
	Marcel Holtmann <marcel@holtmann.org>,
	Andy Gross <agross@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 10/10] net: qrtr: mhi: Report endpoint id in sysfs
Date: Fri, 18 Oct 2024 13:18:28 -0500
Message-ID: <20241018181842.1368394-11-denkenz@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018181842.1368394-1-denkenz@gmail.com>
References: <20241018181842.1368394-1-denkenz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a read-only 'endpoint' sysfs entry that contains the qrtr endpoint
identifier assigned to this mhi device.  Can be used to direct / receive
qrtr traffic only from a particular MHI device.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
---
 net/qrtr/mhi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 69f53625a049..a4696ed31fb1 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -72,6 +72,16 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
 	return rc;
 }
 
+static ssize_t endpoint_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", qdev->ep.id);
+}
+
+static DEVICE_ATTR_RO(endpoint);
+
 static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 			       const struct mhi_device_id *id)
 {
@@ -91,6 +101,9 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	if (rc)
 		return rc;
 
+	if (device_create_file(&mhi_dev->dev, &dev_attr_endpoint) < 0)
+		dev_err(qdev->dev, "Failed to create endpoint attribute\n");
+
 	/* start channels */
 	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
 	if (rc) {
@@ -107,6 +120,7 @@ static void qcom_mhi_qrtr_remove(struct mhi_device *mhi_dev)
 {
 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
 
+	device_remove_file(&mhi_dev->dev, &dev_attr_endpoint);
 	qrtr_endpoint_unregister(&qdev->ep);
 	mhi_unprepare_from_transfer(mhi_dev);
 	dev_set_drvdata(&mhi_dev->dev, NULL);
-- 
2.45.2


