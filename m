Return-Path: <linux-arm-msm+bounces-108537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDTsL918DGoSiQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:08:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24C5811D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F0B232330AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3423546FF;
	Tue, 19 May 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SInB7I2F";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CWwRF55o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746473546F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202064; cv=none; b=Xm1DpNqP6UrotqCrMzoe3Z13qOIMLcnZoPJUuj816uEsd+aXR55O/LGGtEFObcExIgy2siAxx9KVU08YJvo+NiTkMRP4jVMJ0C9IOLM1t2IvAEdQoNftKJRIuNPOMOpe6kbLIfvON4iL2o5KQFiCUXnke/ge+Z7C+ZxAiv5cXII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202064; c=relaxed/simple;
	bh=njSaqEb/RrHFAOptgN0I9HenaXw24PAsx9xYCcorRn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ti/XnVzU5CFObaqoxcu45N6GKmDiFLsFi3QNPIuLLJepHej0vWxAtSXZ4dGszsjRlWgE4kh63g7IsSeY8hCHnDvjZwsYYoc81SFJy9IAxdSzQqH8KZaZzdzsGa17Jkl/FFgojSVEOswnaPcqXf+4E85lbd+gghwGonxx9YWlG9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SInB7I2F; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CWwRF55o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779202061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePBiuXBOAJ8Za5EC9PfbU980/aL/8IJLEdhXnj55n9g=;
	b=SInB7I2FanX+OI08wpNbiAqY8GJFLDL4Ido7VRnVhPWU4OnvbBo1n5P/MW/Xxrv889pmMq
	H16Np35lyheF2h2h9FDCCj22FRa77qzCI1DEGGOYyYjB21mDYABfDZDSbvDTa8VYbqXIJb
	vNQsJt7DAnksabvXWHtIvOuj/EGGEV8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-ecBGecm6O1eLQelFcgq3zQ-1; Tue, 19 May 2026 10:47:40 -0400
X-MC-Unique: ecBGecm6O1eLQelFcgq3zQ-1
X-Mimecast-MFC-AGG-ID: ecBGecm6O1eLQelFcgq3zQ_1779202059
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48ff0eb77b5so38153905e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779202059; x=1779806859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePBiuXBOAJ8Za5EC9PfbU980/aL/8IJLEdhXnj55n9g=;
        b=CWwRF55ouBUDlmJupNTIMqKPLjfv3xb/XFveywHnxrP4aa2VpBIGIusah87JsrUbhN
         k5Jj1IwxEXu9VS6AwYlb9bZK3Efnj8IOU3uhSer6l9kDSxSF+Bm/hRRQX/OS7q+DNhhe
         dg62X2L+F+1carMWmexsVwQmsmesdlFlbtetOrEh/M6AufqU9ml3T/dUZbNsDKkd2hG8
         GjdZxwXpIAaD9k8T12LgigzBQcQmru76xGQcaxC3ng8SN0RL4huPXoiLsO4MxLhMCwh8
         AFGZhg0uNenQgnmtUYrlObM8MQRDxonSEq8XL68OlCxCZMrHZz86zWyqG6/sUmIPlNCW
         EgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202059; x=1779806859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePBiuXBOAJ8Za5EC9PfbU980/aL/8IJLEdhXnj55n9g=;
        b=XTsFvmCVvKIomUXhPWvdaI0PN3v2GQ6ip8o8OW2U8nnafm021m+RFMSZAJXWbDRQL/
         nUIsoDE0qqXXOxvC5TTbPdssQRzCx1BL8FPZDxz52a+Iqww+UI+OJ4VlIbl+cmNdDPZg
         YE85mDez5I+2P3k/ytErMNOmXJ7N6aP/1oDkmq59cvy4clgqmY1L6O+2kG842XKWcVg1
         S1Ag1eDG9Yvb0MYtritce3l+oLpKhS6I6Qxm6fh64/UvTKjGvZwfJtZqoJ8mkCI2+9fP
         gv5PCXQ9m8wDpH1LjTglpTer3eBvE4PqHX5hZsj+mpbcTyihRai+45uQwngqgnPZl4F3
         CCNg==
X-Forwarded-Encrypted: i=1; AFNElJ8ueZe+RKzxdHHFhiMu0H7G0TKX9wfaUU4DoRa5Hm5VxCR9RJEkhwc/xCoTCEuh0Pfwouw+uVrLTqCJjFBL@vger.kernel.org
X-Gm-Message-State: AOJu0YwRy3z0gnpCBYkqNKz+P2Z0gBzAqv1Mw4HLiCHVKjhMLuXzZoIc
	u6EuDS8QE4BQdY5VT0aO441MY1gbTSt7VEoXigTQsjc2iffw9RivNusxamm9CG1Oa2qHrS4Wndr
	g6r7b04pRzDdWQtt+gwa/aa0qLb6wMacJEDr7eCZjNNSzIXx6IXK8eLqMdF0RB6IcA2c=
X-Gm-Gg: Acq92OGNnQZ9lMZjXaGYvrZlG2XVeHLcTCZNWT9fo6wzfq6dFlO8XywZLE2avpP9i5r
	dZl6lUC5W044RtJ5kNSayw4SpG3Za9H4BSNrOryozNS72NLeJpoR+9FIv2i9HDRIWbLC6BD4Off
	TsQPCAoU0EDmx8w47ohczWu6sCPjDIyN49rIv9Jk0KY/cS/akUl80nZokHzJA1FSJyJwhFC4GxK
	04+L42a2YMEwl/7p7a5Fe2VPRCjpnqB0jXOdTtqVB3ww0c5v/VC0P8jswfOEdKxtO0iBgpN+ACY
	BwhwuLSL3nd8reBlKrZ/lUssLJMfCcScLbip9CG0IEg6VLOsQHEa+jzZSp9Y6pcKdN38bpc43GM
	y1QQPER8XCSl0qDhYZtkcnHtJvdze5d29wQyDyXgW8OuPN6U=
X-Received: by 2002:a05:600c:c087:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-48fe60e1444mr223519625e9.2.1779202058880;
        Tue, 19 May 2026 07:47:38 -0700 (PDT)
X-Received: by 2002:a05:600c:c087:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-48fe60e1444mr223519425e9.2.1779202058487;
        Tue, 19 May 2026 07:47:38 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ffed68baesm99701235e9.0.2026.05.19.07.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:47:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Brian Masney <bmasney@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 7/8] drm/msm/hdmi: Use the common TMDS char rate constants in 8996 PHY
Date: Tue, 19 May 2026 16:47:03 +0200
Message-ID: <20260519144712.1418302-8-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519144712.1418302-1-javierm@redhat.com>
References: <20260519144712.1418302-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,linux.dev,gmail.com,oss.qualcomm.com,somainline.org,poorly.run,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-108537-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1E24C5811D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the driver local defines, for the minimum and maximum TMDS char
rates, with shared constants defined in <drm/display/drm_hdmi_helper.h>.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index 36e928b0fd5a..a2eb84358b01 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -6,14 +6,13 @@
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 
+#include <drm/display/drm_hdmi_helper.h>
+
 #include "hdmi.h"
 
 #define HDMI_VCO_MAX_FREQ			12000000000UL
 #define HDMI_VCO_MIN_FREQ			8000000000UL
 
-#define HDMI_PCLK_MAX_FREQ			600000000
-#define HDMI_PCLK_MIN_FREQ			25000000
-
 #define HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD	3400000000UL
 #define HDMI_DIG_FREQ_BIT_CLK_THRESHOLD		1500000000UL
 #define HDMI_MID_FREQ_BIT_CLK_THRESHOLD		750000000UL
@@ -632,7 +631,9 @@ static int hdmi_8996_pll_prepare(struct clk_hw *hw)
 static int hdmi_8996_pll_determine_rate(struct clk_hw *hw,
 					struct clk_rate_request *req)
 {
-	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+	req->rate = clamp_t(unsigned long, req->rate,
+			    DRM_HDMI_TMDS_CHAR_RATE_MIN,
+			    DRM_HDMI_TMDS_CHAR_RATE_MAX_2_0);
 
 	return 0;
 }
-- 
2.54.0


