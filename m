Return-Path: <linux-arm-msm+bounces-99022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABkDJcK4vmksYgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:26:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F422E6129
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4F30302333E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 15:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C3C391E6A;
	Sat, 21 Mar 2026 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KbPQGk5q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF903921D1
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106814; cv=none; b=p2ySxn0DbXThPADEkGFI4ii97bXHbtnfxU09eMmfipMttkyCnbINGa+3wx3ut7zQhYd/u8rXp0nTC5S3Vvdfratblfznp5+Q3mPrQ95qLmfNlxaTK4HgHGe23Pueyxi5JkJ7gZRtDTb9slXj1Shx5VUCdYkfB1vuFR1w7WwWxu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106814; c=relaxed/simple;
	bh=OPe//ygJpUEg4EAt82rAUPohtW9y5kYGjdkCTA9bQOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exiFKreGmL9+243G0xX4UTp8h7VRog+C+WMnr5bb/9QPLP2epPDzRFViDQfneyS87dKf1luWvn5lb/QVni8BCIJUxFkJ+OAY2vOxyMA7gYl8+A8tNti3OCzADdyzz0tNmL7+CZwvJYsctK8uluHoAq7UDmsG/QeTgDT/TsAs40k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KbPQGk5q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774106812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hq37koiQiFuoxFk59QcXCaiCMINRwsI36H+6oPKr9Vk=;
	b=KbPQGk5q1fErBZOPrx6KSjGqbXqJW7brsYcAPbqT0aV9RaqFEopfOSkWUsm2ftLWH/WVCy
	DWOGIPVqUyG8PzZSViX9yldR8OaPVkTHUtyBlnYKuxldzA3B+QLjBNtYSEFhK3OjI9bKXG
	7o3Z8meSnobvrEbRrbihI83mnUg6f7M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-kD6GmNyOOyO_ldzICMmoYA-1; Sat,
 21 Mar 2026 11:26:50 -0400
X-MC-Unique: kD6GmNyOOyO_ldzICMmoYA-1
X-Mimecast-MFC-AGG-ID: kD6GmNyOOyO_ldzICMmoYA_1774106809
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 147BE180034E;
	Sat, 21 Mar 2026 15:26:49 +0000 (UTC)
Received: from thinkpad-p1.localdomain.com (unknown [10.22.64.6])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 84D7C1955F21;
	Sat, 21 Mar 2026 15:26:47 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lei wang <quic_leiwan@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
Date: Sat, 21 Mar 2026 11:23:06 -0400
Message-ID: <20260321152307.9131-2-rrendec@redhat.com>
In-Reply-To: <20260321152307.9131-1-rrendec@redhat.com>
References: <20260321152307.9131-1-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99022-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rrendec@redhat.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:email]
X-Rspamd-Queue-Id: D8F422E6129
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lei wang <quic_leiwan@quicinc.com>

Add unique ID for Qualcomm SA8650P SoC.

Signed-off-by: Lei wang <quic_leiwan@quicinc.com>
Signed-off-by: Radu Rendec <rrendec@redhat.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8776844e0eeb3..85282029d80cf 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -260,6 +260,7 @@
 #define QCOM_ID_SM8475			530
 #define QCOM_ID_SM8475P			531
 #define QCOM_ID_SA8255P			532
+#define QCOM_ID_SA8650P			533
 #define QCOM_ID_SA8775P			534
 #define QCOM_ID_QRU1000			539
 #define QCOM_ID_SM8475_2		540
-- 
2.53.0


