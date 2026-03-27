Return-Path: <linux-arm-msm+bounces-100367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDrDGgitxmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:15:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AD062347476
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D146301EBC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37EF347501;
	Fri, 27 Mar 2026 16:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tA6PcHQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBE033F8C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627955; cv=none; b=iKUepQ27hI59srIWr/J71sVcnEx7Um89awgqESHeg8UE/DNpv0fhjaOTuB6Q851YA7dQ/nffIAnfIhwUMZcAmz8Yeg9lQ1DF+eow0FDdWUiTHoKdWe2uFWPSyzHkALa4ZAuKM9sTZ6B0RHmEtehdMZPrzPgv3IYQ1qWiP15Y/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627955; c=relaxed/simple;
	bh=EVldcqfPHPh1FF7QDMATcvXChGeMKnSCWknhWuq45Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RuA2CW6mDD4tJMbr1MjRl9odFicsBzVb4ByExZhfJdyJhdaEn2K7hQfifOoFK01wNJg9SDtx+AmC0ZeTx0h+WYAJjlRYop2Iv7IEJiGKmiXtGA3MnwOq//+x/BQdGXptgLlxEiyn/x2TNxbru+7+ntfwqyl7zwts8AuNVIV+2vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tA6PcHQS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66b0684f98eso3376298a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627952; x=1775232752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14WR76NKv1FwsEs5HwWnn4/wFMyJv3sPwC6I4w0TIdQ=;
        b=tA6PcHQSbC/RMSxXLjam9E7mpvXP3D9b25yixemJAXB4nvsCKv74vE7TjGLujl6On7
         57tzAbQUyLFWqACgxCM+Ccs0DyXbbLm7k6WJafDaPWWHkahi5zisj1qxNswgsHknmt6t
         fDn/bw0wXxIg+/6tibOB5A8NHZaY+9WKsTww41xrZnbwwcip9LpUmgKzQg/k4UjFWo7d
         ZAK41GM6qXHVl1nNQ2kPDL3MkQPrgsA4rCK3C31GnfbZ3zbS9uMpLKFIYuvWxLeobGv8
         qlpFscXk4tvubEOsHhHSn7NQmiTRIWtTIQr8tK49fIv5re4vjIbr1DEMnjDZ2SD6TvJx
         8Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627952; x=1775232752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=14WR76NKv1FwsEs5HwWnn4/wFMyJv3sPwC6I4w0TIdQ=;
        b=XYyBXop4AxzNm7Zuv4DaHu/rupr+yKbrQhpuYTY8A9aijoWzD/yB4oVyx8c/Rn6vZp
         +nyGppbc1Z3PcxzTHnPbV4Y23/bcYUJDrPO9uP2KLa+AWtt42snX3dCt8gNPKHdRcOVk
         EV+tQKqODhXDpbcJONZ8OqqIqSXgmr3gJRhB1QlND9slNzwhSDcMHPoIM+lxjPBRbNYC
         /JplMtRBcwLEf7x8dUnhLpn1K88+7Z1DZdTCrwyYkB+6SVC9XDGQCy9lGNuM2ZmPOEMG
         HBUBa//NZafqlBZdMWxjKoHYyWhwGlx10VnoTY6F8SbryPco+r3JO1ikZnFHAg/bzrl3
         63aw==
X-Forwarded-Encrypted: i=1; AJvYcCWP6/OPoVYRBjda+GL8qFWEqMq5BiXlGZ1vrBgm2IfP+hLA7FlrGJJ8iWvE2G1R33GlLp1erEXwx8QHCYvk@vger.kernel.org
X-Gm-Message-State: AOJu0YytFqwpzvwVSBF99Ivz67Jrm1W+MDGck+FTwF/F26oUNZZdSpJy
	cyQ03t2KgrY8EaplMIeR40JhxPHdyqfiAGO2M8RjGSPvygR/XLsH+l0ihtzOjIQxhnQ=
X-Gm-Gg: ATEYQzzzjY0VfmZa1XZPfnnhoI8UrO6g3pYAKiVF2L0ZeNGo5/JOA4ZlwoQ1B+Vt7gb
	JcPjXhpX8riQmbU/xq4gMJj1cg+NxadSJ2mAODpDCz2OKsEND3kPENvVn6BZ76B4KyDab30o45f
	PJfyN0YVPL5Lp1cAfSgPcqhyzuVgVqCdoSO/3XAeT6k0RZzlqgHN6CkQgDvSGx/GDVylz1uu2aU
	hqpqhpJPk+MfUtXR/JVtPiusIL370x0adGMaGnBwOgX+SdWUUR5JuIRttUPXJgRE8oNEGrl6T3O
	aTm3JHSKhxiX6PUg1T183I5rUL7t6rSgC2Jb6xoDaw9SIdqVUdw4MMqo0y6hLjhSeJR2Rj7Gl8P
	iXFGO3jiGzWDT5eWtew2NqHvAVnTaB+wYYxNyerbBvxtIDeu7nC4azpFEr8/BM6cpKeO1AgBDcN
	PdesGJD5lOklfmlcZl/XtDyP4enODT9RwpKPDFCcnvdOg1TIUjx1i3O+6uQQMbdfd1LatVaP2mn
	lqtTQ==
X-Received: by 2002:a17:907:3e97:b0:b98:b51:6f51 with SMTP id a640c23a62f3a-b9b507a58c4mr241007366b.35.1774627952065;
        Fri, 27 Mar 2026 09:12:32 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:20 +0100
Subject: [PATCH v2 1/9] dt-bindings: display: msm-dsi-phy-7nm: document the
 Milos DSI PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-1-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=871;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=EVldcqfPHPh1FF7QDMATcvXChGeMKnSCWknhWuq45Jg=;
 b=7Xs0w2eewxL5CZRI6DTsd3patfJnGDWajpneO0Gb7M04cO2ebwe9xVRUTwB/8n4ryA6yQf4XM
 Wst+Ph1T2SSBnUcinUWrXd3lqAzF+0vVz4Pe5oq0O1dNKX+diUB1slP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100367-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD062347476
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the DSI PHY on the Milos Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index b5a0c1461250..4bdec236734c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -20,6 +20,7 @@ properties:
               - qcom,dsi-phy-7nm
               - qcom,dsi-phy-7nm-8150
               - qcom,kaanapali-dsi-phy-3nm
+              - qcom,milos-dsi-phy-4nm
               - qcom,sa8775p-dsi-phy-5nm
               - qcom,sar2130p-dsi-phy-5nm
               - qcom,sc7280-dsi-phy-7nm

-- 
2.53.0


