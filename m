Return-Path: <linux-arm-msm+bounces-33718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71880996EB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3BB31C213AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7481A264C;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axuq5KSp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801D419E966;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485489; cv=none; b=jjEpfzt0+qVCTDvbZBPmbCzk7gtziHNisbuMujQd0NCN+ZGbR18Kehj+h5wfGNmt3O6AGwuUo7xNBsukfJFmGJm0QlE6zVWptcobE5nPGrNXw0pCY3AufgZ6ayJ9NQkDF4AGhtqFvy7eRNl4Xous72AyAouNo6jpq3d7QnDF1yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485489; c=relaxed/simple;
	bh=vXreO2sxHHJ6/5mcfDxH5Wpkqxv0IieD0btUKD95pYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oeMLDe/RxI43AxUJoPUDdSpK4k4JtMp7D2limXo/cO9ynIyxnp442wEeINgnVZOyW3rVnbKPzJIvD75I8zw9SxsWvJHRzFbJvt3VlObdEDaFCpJ3i3PaUlvdvsnEWPEVjVv8yVC3RDaOmqxoOnWR4L3PEm5dZrQKZOKWXUSH6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axuq5KSp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E084C4CEE0;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485489;
	bh=vXreO2sxHHJ6/5mcfDxH5Wpkqxv0IieD0btUKD95pYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=axuq5KSp1XA5xR4rHJvI8FXFKqXX7SSdI+xBfMsT9QGuZHKnbA19ngRVM8v8PVjuO
	 n0tOo10go6zeZoHu0Pi6HsJIhGy+EsBCO8jOswhJgcgPxufhCJt/P6wszKaNdZSmVS
	 wDaGwodyOvRLqO+OD8PbJLV8M2Q4f7YxshMGWQRexu0DMLJ1snUq7oILuaYP6kkXNS
	 vlt14HCILbWoR6SzeBxrglM+BRoAdGplUCNyHO6DmeMyhrTZLq1nID49QVF2EgKL5F
	 1t+gqlAzn9uFugC/WQcvHHpS52JoUQbiU1KUl52iM2o4+r764ma51YgZ6kkjaV1jIJ
	 fp2+KJ1osmI6w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1syY2H-000000004Op-1PO8;
	Wed, 09 Oct 2024 16:51:33 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 9/9] serial: qcom-geni: rename suspend functions
Date: Wed,  9 Oct 2024 16:51:10 +0200
Message-ID: <20241009145110.16847-10-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009145110.16847-1-johan+linaro@kernel.org>
References: <20241009145110.16847-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the unnecessary "_sys" infix from the suspend PM ops.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 9dd304cdcd86..5dfe4e599ad6 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1779,7 +1779,7 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	uart_remove_one_port(drv, &port->uport);
 }
 
-static int qcom_geni_serial_sys_suspend(struct device *dev)
+static int qcom_geni_serial_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
@@ -1796,7 +1796,7 @@ static int qcom_geni_serial_sys_suspend(struct device *dev)
 	return uart_suspend_port(private_data->drv, uport);
 }
 
-static int qcom_geni_serial_sys_resume(struct device *dev)
+static int qcom_geni_serial_resume(struct device *dev)
 {
 	int ret;
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
@@ -1822,8 +1822,7 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_sys_suspend,
-					qcom_geni_serial_sys_resume)
+	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
 };
 
 static const struct of_device_id qcom_geni_serial_match_table[] = {
-- 
2.45.2


