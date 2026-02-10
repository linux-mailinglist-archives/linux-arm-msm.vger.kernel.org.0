Return-Path: <linux-arm-msm+bounces-92384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC6WO7yVimmuMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:19:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9661163F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBC03302DF7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628982D3EE5;
	Tue, 10 Feb 2026 02:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHgg4Q69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB582D1907
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689976; cv=none; b=tByxCLg8IIv9lDTFN+X0xPOKuMvwifLlKXUP/jFlXK+hsuSjlkJsmsc75aGS0qpya7SNJE17D/WtStvY7ZjTK8yqPR0Wur8cTLoYEsUyR1WPnGL8OznakZb5h35f+YHzcEAN27aqu+dRN7zKzFZ9cuRcZubJ+5iuwiEWmgUAAbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689976; c=relaxed/simple;
	bh=5sdnml06i2vfNbmnySkEQevUFy+mYjvbxMF9LN/YHXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCMPAyK1jYUKiFzpPSFO/B6oBosq//7zwG2YfvKbaQzbPkX7yaSWb+5Y0hZUZUy2JyfZLrIOYW4q7kvhsQmM7e6uz0CQMrTCZoMITJwiXHIcQYDHHHKZv//zz8sZoIjFUsT4SE1yuFQZqtZCz29nfsMFkCp9EC7lCcdjjIwDGI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHgg4Q69; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-896f6d4b6c1so27056456d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689974; x=1771294774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9gz1RSVJLy6gAcQFZXv7+6clW+DqqvonPSOlkDmC1Y=;
        b=mHgg4Q69mWy/MKHMyGgsCYEE5YfQN2fPQs2tAz5BBW/Ei1Y3W9JYyBy41hOuwyj+h4
         M8r3xVh1/kg740ManU/6cqdJ+yAEhDFh8RayV0ebyGG8A2ACJvRwD7blIXWZ5IApbgOD
         Yuxf7uVuRUgGa91jhoh9yfE0JUP+NTtHLqXsh6BNpFauHFed9W2ijuD00No5cQB6mubO
         GXzz4TkzuvvyPwGu7P+t8YfmgAG3Ac/MYGQMz/uOG0ByO2HuvgtMontWR3ZbQyjffcTQ
         fBskntmU4nDyDh7fV3NRgXowB8AE+N5ziPl0gwJJE3fLj4FTPE5hwt9zslnz91+SLH57
         YaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689974; x=1771294774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9gz1RSVJLy6gAcQFZXv7+6clW+DqqvonPSOlkDmC1Y=;
        b=UUifo/j4vStg8oHH2b+AgqSeTaQiInaneKBL0SbtgcN3KHODuA//9vLmeebZu242oQ
         zxLAacExAQu9kSbMCUbpgtB2QSdYMaGKtH+dKZ1FvusFZRCGAXsQqnIjKL5UWRjsyzGx
         WderNc0wkEgpmw4Y4J8vUsrhcPhcFItAq5qhAHNw5mo9z+cSo8+BSQlkUr3q+IuimBxw
         RU5MdjtXyH4R6+qKKD9pBT4Vcnga7BZYW15Po/x2iiMIz8lzDqURfkQkvGvgKc4tiRso
         E9p/Yt5hK8CEz5NDqmSWUCMYfsaBcHyGBBMZUwSoxunFuc5zmrZxbkAB1IjWJ4kAfIUK
         UW7w==
X-Forwarded-Encrypted: i=1; AJvYcCVKsA8ClQUeaR2ZXolafuZTd6PvmSwKl/cEsnFCwoFYcxrjDGKLxk0Bhzv5hvVKkO03Ilt4R08WWk+y/ajS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsy0zGA7C3BfdILA1r5aiq3hVStP5OZXFsA8ZImn9n7BcwX2Vf
	+68e07I3JravkQdWMRBXIEKpzve9lo0nm10wJvZ+U4+Ic6c1ZzenA0hy
X-Gm-Gg: AZuq6aLhvraFrlPHs/3LWaY6TNltM200ay4ZDqzboxuwoQAw6Yufzg09c3Qg0ecWlE6
	x0VpfyoJEjJtMc9GhaD7TyavKrkwY/C7GpfcMolnTPPiBAnZ0sCH1NfuNE8pCxEseT/VjvQ0PJZ
	oyB6WXEZUkwEpK6VTNYqgcrAnA1NNM+xMEOb5v+k0En8EZkCtbE1ONhrE19/a2feylBDXGD6jzF
	/EOf3dEd1D/CJWJ9DJzQ9IIly1spbKR8S6+wko4mtM1fDA5WOCUNycwKTr+J6lxA1wNHYWo5SqM
	J21xPjPoNXIcY5hbuj4ozXCvslaLQGMrf5VcgJdyukN4ZfyOBrg6NIzQRP5hBJR4glTF1fv1nnA
	3rq5a+0xGXfCY21ztCbALX7m1slGGrun+NlSITI2w0ikJP+kzZ1YgaKfa3NyqJi72ksotLG6duX
	RSJMxBxpykH7+Oo1Q4/xX4HwTn/5LgO9ORJIUZiSp1eWQh35u5Mi5prGK1ve6PkVrquTuYUFF68
	EsLn/Dolovq34E=
X-Received: by 2002:ad4:5dea:0:b0:894:6667:7005 with SMTP id 6a1803df08f44-8970e51600cmr8801726d6.35.1770689974141;
        Mon, 09 Feb 2026 18:19:34 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a16240sm948396585a.35.2026.02.09.18.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:19:32 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/3] dt-bindings: cache: qcom,llcc: Add SDM670 compatible
Date: Mon,  9 Feb 2026 21:19:55 -0500
Message-ID: <20260210021957.13357-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021957.13357-1-mailingradian@gmail.com>
References: <20260210021957.13357-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92384-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D9661163F4
X-Rspamd-Action: no action

Document the Last Level Cache Controller on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index a620a2ff5c56..0de39b7b3f48 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -32,6 +32,7 @@ properties:
       - qcom,sc7280-llcc
       - qcom,sc8180x-llcc
       - qcom,sc8280xp-llcc
+      - qcom,sdm670-llcc
       - qcom,sdm845-llcc
       - qcom,sm6350-llcc
       - qcom,sm7150-llcc
@@ -162,6 +163,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7280-llcc
+              - qcom,sdm670-llcc
     then:
       properties:
         reg:
-- 
2.53.0


