Return-Path: <linux-arm-msm+bounces-3168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9C802A15
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 03:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40AC71C20984
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 02:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C10B15A4;
	Mon,  4 Dec 2023 02:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M56yn2aT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB660F2
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 18:03:08 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bf82f4409so362501e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 18:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701655387; x=1702260187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nU+isl/cmvOumBeEJVaIP24Ow/f7bjobvPWRPynQaf8=;
        b=M56yn2aTw7h/zSNqrgKdfY7GEi7xsJoYZnVw79rEcs2p292xNgDpx7WosbEGZdbJVL
         eFi0fk+5kHsFcOhoOvqnYrD3gJ+oHuEUoU1JgUQRRdSxtskBPpsGQS3j/ojeMulZgbiw
         zhI6A829rMUYxAdTfuaPZEvyOIIkF24i4JVYTmMgjJlKtwxmUgquVBsYUJmeTL/Ei+E8
         DlSoQbxQHxuw6Q5BHztsPVjLSVAe0wIDCLFcmunTV8dd6yGQd4fI4n0XLIJ9zaoJ5J2x
         3WC29yS2N/DSbAeaZSdddKA1/+fn3ywdooUW06SnjJGpUelZKY62X60OKTzXFiiXpvO3
         X3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701655387; x=1702260187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nU+isl/cmvOumBeEJVaIP24Ow/f7bjobvPWRPynQaf8=;
        b=B2FqZFI1OiNDA87Mus/dWauu/KqCQldVaNg1NHOHmlJHO9QzurCFm1ZHIAGw6QUF8c
         u15jwKXRQ+67/vhWPsfofjmEG0Oy2ikUqUD+LF17H0N4IHphz1EdHeSqNdw3h3pc17vc
         N5KxrDHwPxFJqFRvAdFQKkS3mbQMcBppPUjKIvwqn7UYgoOsTAhSALdxkDHOL2vicUQs
         n52ARP5V/HLvHezGmVqd6UCJEEGwKYRnxW4574g9Wa0bCw0RHnlox6iahJv4Dj9GAj8J
         gn6DYTk6pQgLjjOqbLAab8BrEWlpQiqndDEfwQ0BlzZbbUl9hFDM1Hr3NUBQNWeF2UYB
         SQCw==
X-Gm-Message-State: AOJu0YyBkb421PrsDkNYMOrPpYG7qAz+2uepWuc/n3p7EcKxrEw+GEw2
	8/ZNdvY0rKLJD+eo5OLZMKpz0A==
X-Google-Smtp-Source: AGHT+IF2BaKSfbGgOJcuur4nyNBw+zmrxBa85rY71yvqdk6sw/yYSlw4/eaFyeU/Nq5IFQWNX3P35w==
X-Received: by 2002:a05:6512:3d1d:b0:50b:c36e:a70e with SMTP id d29-20020a0565123d1d00b0050bc36ea70emr2917074lfv.34.1701655386300;
        Sun, 03 Dec 2023 18:03:06 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v12-20020a056512348c00b0050bea5c2850sm525381lfr.39.2023.12.03.18.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 18:03:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Rob Herring" <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Andy Gross" <agross@kernel.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	"Konrad Dybcio" <konrad.dybcio@linaro.org>,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Mark Gross" <markgross@kernel.org>,
	"Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 2/3] usb: typec: change altmode SVID to u16 entry
Date: Mon,  4 Dec 2023 04:03:01 +0200
Message-ID: <20231204020303.2287338-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204020303.2287338-1-dmitry.baryshkov@linaro.org>
References: <20231204020303.2287338-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As stated in the changelog for the commit 7b458a4c5d73 ("usb: typec: Add
typec_port_register_altmodes()"), the code should be adjusted according
to the AltMode bindings. As the SVID is 16 bits wide (according to the
USB PD Spec), use fwnode_property_read_u16() to read it.

Acked-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/platform/x86/intel/chtwc_int33fe.c | 2 +-
 drivers/usb/typec/class.c                  | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/chtwc_int33fe.c b/drivers/platform/x86/intel/chtwc_int33fe.c
index 848baecc1bb0..93f75ba1dafd 100644
--- a/drivers/platform/x86/intel/chtwc_int33fe.c
+++ b/drivers/platform/x86/intel/chtwc_int33fe.c
@@ -136,7 +136,7 @@ static const struct software_node altmodes_node = {
 };
 
 static const struct property_entry dp_altmode_properties[] = {
-	PROPERTY_ENTRY_U32("svid", 0xff01),
+	PROPERTY_ENTRY_U16("svid", 0xff01),
 	PROPERTY_ENTRY_U32("vdo", 0x0c0086),
 	{ }
 };
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 2e0451bd336e..a959dcc3374a 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2230,7 +2230,8 @@ void typec_port_register_altmodes(struct typec_port *port,
 	struct typec_altmode_desc desc;
 	struct typec_altmode *alt;
 	size_t index = 0;
-	u32 svid, vdo;
+	u16 svid;
+	u32 vdo;
 	int ret;
 
 	altmodes_node = device_get_named_child_node(&port->dev, "altmodes");
@@ -2238,7 +2239,7 @@ void typec_port_register_altmodes(struct typec_port *port,
 		return; /* No altmodes specified */
 
 	fwnode_for_each_child_node(altmodes_node, child) {
-		ret = fwnode_property_read_u32(child, "svid", &svid);
+		ret = fwnode_property_read_u16(child, "svid", &svid);
 		if (ret) {
 			dev_err(&port->dev, "Error reading svid for altmode %s\n",
 				fwnode_get_name(child));
-- 
2.42.0


