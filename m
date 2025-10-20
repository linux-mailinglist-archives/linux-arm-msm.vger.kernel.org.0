Return-Path: <linux-arm-msm+bounces-78037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A95E5BF21EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 17:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F51B401229
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01BF26AA93;
	Mon, 20 Oct 2025 15:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="KoQE2Hva"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9C11ADC7E;
	Mon, 20 Oct 2025 15:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760974394; cv=none; b=u5en1bjq2DBEjKcH7zwVk5jls160SReQZvBkbcgvt0Sg3sErq2w+2vQ4Kv+TbcyVgfR1AgUkMqvgHM6Yy0SnKiv+XfvgGf58lGsPPldbCMYsqf5Zt1Dn8vfcAQ1OZ6lxtN7WiYhRwS94A23T6xa+H8Q26o/JxS7ocKcHB+5bAC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760974394; c=relaxed/simple;
	bh=7t3Amz8XHN/VWueUNjxo9IHhkSG/MCvbiH7Q33bTO6U=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=q2wGjx2cP7exHrcmk8sbMV4IBXblJWxIOIjXQEVRSkzlGNtLJwjVIwtjf9JnLtTrSPs68V6MS7V+Okx9m/WTyViKJmUesufzIcEr+nMhMaEwQ5WxMdpFLMbjvxgXLrfVpTRH1UljKuONbN3StQhHDXyiSDNjArYUk2AF/dpzhw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=KoQE2Hva; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760974390; x=1761579190; i=markus.elfring@web.de;
	bh=kEUPcwaKHqBtwTWASgCUaJqtzRBAzKT0FkmaCtjaiE0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KoQE2HvaZyNOsHt0RQcwIjmwbm+jJrNurWfwl01sv02ROaucYTbx+e0fB0kyNlps
	 QAJpG3mqXmxZQHNvDYcSHMlsFO/G7M+r1tV8LdBT1zJ4s8IyCnOTT9QXiAJKExaHg
	 CStK+VLcUY9hU2G6SyzyLs2tZKW5TgcF7QRiRVJxm/vTHe+V9MGYDqE6TsythsyX4
	 Og2uHgAaTSdVztyA9D1p9505yAPrXVQEw3Q4K1Bp4u+XvfT88Nxv0n2/cJWd6Zvcc
	 JBaw/5YOMMCYm+iJ9KmVdUlUZ78gbMpYycf/Hmv6OOBSc8/lB/t+Mr62kLC2QEIbc
	 ENa4cdP1dVBIkNOvpQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.235]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mv3Yg-1uK8nt3oKu-01246g; Mon, 20
 Oct 2025 17:33:09 +0200
Message-ID: <344709b3-2c86-402c-a2ee-5f88ac3e2397@web.de>
Date: Mon, 20 Oct 2025 17:33:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Content-Language: en-GB, de-DE
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Anand Moon <linux.amoon@gmail.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: dwc3: qcom: Omit a variable reassignment in
 dwc3_qcom_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8I1torVsLNhWVjZqw+NRdg8GJ66R/cs/h1JB1HwZ3BxSb2vSs2q
 n030E215CDOvbzo95I81TXQSjsNoTDdiYPHs7ndVMoCZUzCLyGyEL3RTHWJfOVCXAPYcc12
 Xd3GBN8JuopFtvNdwUHOJNcM+L4PVlygkSmrkYal4PVK+wDkLbMrcWIKg4CDOsgN/6hed27
 j9eNN60GnCbvFzbIpSJ7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2LV/xeHRzzU=;26mnjzjehh2KH9Pdf/26+9a9Tna
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 20 Oct 2025 17:17:18 +0200

An error code was assigned to a variable and checked accordingly.
This value was passed to a dev_err_probe() call in an if branch.
This function is documented in the way that the same value is returned.
Thus delete a redundant variable reassignment.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ded2ca86670c..e81011ef130e 100644
=2D-- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -707,6 +707,6 @@ static int dwc3_qcom_probe(struct platform_device *pde=
v)
 	ret =3D dwc3_core_probe(&probe_data);
 	if (ret)  {
-		ret =3D dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
+		dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
 		goto clk_disable;
 	}
=20
=2D-=20
2.51.1


