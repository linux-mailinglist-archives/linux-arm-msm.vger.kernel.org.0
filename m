Return-Path: <linux-arm-msm+bounces-115878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W9cMDYkxRmoZLgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:38:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF26F55C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:38:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=TOdgXK8w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115878-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115878-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 008433064077
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA09D47DD77;
	Thu,  2 Jul 2026 09:32:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38D947DD5F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:31:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984720; cv=none; b=SEzfVtj64mlZSCKIcu3/NA3UDVDXr6Ag2eUSN9rJzZy2oa/dimH8k11O6WL0+KtJRv0Dk148ylB96oBaTmaXwcVYU1s5O5TKnUbIV7nSldabMK0KVmmP21CNJ9o9GrHCuBGG6o3xR71qKXFxWn68lhxQjiasR+iD+Z5zrgfRUno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984720; c=relaxed/simple;
	bh=+fANNshveHDBQS7nfrmMdFaYS0j37Tv9RT4C9/65hAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=otL37TWRHIirxCLL60b7cYAo5SXmDPghistFDs5Wb+xMxEf9Lb/FLpGDsb98f0/FIFbNkhF/0Vuj7fgqA0uprY/GsIAhma2FWOaWlKy9/Nep0Dn2+rGAN68qAlGnZPcW/v63iqmK5CI8jFCH3R4dK5cZmM/dbpmh56KWs6kRNhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOdgXK8w; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-475417f010dso1036490f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984714; x=1783589514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=080J4XQHWy2JRItkUs2O7FVFK7xVl4fc0pDCjHsxwTM=;
        b=TOdgXK8w/T1gYeaP5A+oV+yo6uFCwaLwj++al1Bce0d39fB48MG72VBdjjuEbEhDif
         lO+xmXGDZyzMtpV4v79PR5stecXKWhqbKQYtsHBvk7BWQARpfJ8CmQVSMD1JzzxhRF1K
         uPzxNEEfiNS+wM+l4e/ra7RYfizxZOr5juGkcZ9B+q8INNJR6uIhhY+baSYmz+kzcUXe
         Zme4312rx4VwCR715p+U1YU+DohBYLjF+IXUcyeWuUEAJCT1wbWzDZoChRBFWMwP/l8i
         rodR57IVSZE7+j5Bbqa763rIHq4k4UdF7JHpLxzYYSQ89Thv7LqxsdIGieudIuhzcVm9
         N1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984714; x=1783589514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=080J4XQHWy2JRItkUs2O7FVFK7xVl4fc0pDCjHsxwTM=;
        b=Cucopl9DfqcsdO9m/HoMJqIPRWzey/yaf9DMUMDRqsO4kzUMF33/zEhjth+r8gNa/e
         OBKBmPubg0IMGFHTnkmri3VFPOZ1hx88m/GlvMoaMZtWihwoq33L/qBuclLYvdxpp1IN
         KA45Hfigyys9Fu18KtTN91pJQ8sm9ms3uwSjhHFEiWzqdpHgpCnm57tQOcMRi0YSv9zJ
         J1G8pRrGStyyHJMsfFyUCHX8GzS2Bj+v3kmjdpuOulAhzUpijpUuFdz4dTeCH5QDFBTz
         733wYhtSDCrUM+t36oY0HcIFwf9ee1aP7eBxYIQgoI03cdgZFAqzGt0RsYZbb05HbdgL
         hNmA==
X-Forwarded-Encrypted: i=1; AHgh+Rrq3INhc5JIekNrR8pTwF3MPY1TkgOo0R2emFNTYam6E720pC0bCVyDVEJ1w9pAbvs9GER1zDdxIB/7DQZx@vger.kernel.org
X-Gm-Message-State: AOJu0YzDw255HkscIoj83ns3vX647B/hfSp6k9jGopNOyFTQKQNWnSi6
	qLbk56LVM9bPuOVGncsGSr80WhQf5cURlykTsg19pRFoeP+UxFD5cYRamcYFO18uzg0=
X-Gm-Gg: AfdE7ckFUmomgEdr+8BhKBQuanHNfTH6ueEp+XZ8Q6rCeGlnWToPcfA62XnGO+ALITB
	T0yhnMvOg68fDAHLSddwAI0TMnWZordnKiboXCwitX2Zsz5c31O04mVu117yGNH8ZnSBp0iDbLT
	c6HGl3uAbgbjCXNzgV8TQChEd4+iHBAMOI/EKrRn/mCO6LFABtmhbF9Zi39a0PY0OBRcs2g4oo1
	XNu8M5PJk36imOXaaabqvw7BWwZwUn8K/PCatR2LKfn7ppAMUi1rRNDJwzvJW8AuL973Y6oplZG
	qX+IHiI4PwTzmFRvo5uAWT+W0stJeNeddJRdXPzG4Snh8Q7TIQSgf3fD8FFoIdjv/BU5pYwEErs
	YHW7rR7/zv11/rBQDctrXqbpS35q83nTcibk1IBimooDqRawnlVimRRKtgKjHxR3SJIt1OjFjn5
	KRVi2xyN5qTsyspP7qP1argP227SC3zdxBiQ==
X-Received: by 2002:a05:6000:288e:b0:477:3986:9b54 with SMTP id ffacd0b85a97d-4775779805cmr7487313f8f.20.1782984714078;
        Thu, 02 Jul 2026 02:31:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd53fsm7102571f8f.37.2026.07.02.02.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:31:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:31:48 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-4-1ef8ceb8c9ec@linaro.org>
References: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
In-Reply-To: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+fANNshveHDBQS7nfrmMdFaYS0j37Tv9RT4C9/65hAA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjADFLzF5KZqGVPPEAOzPgOuI5gyIc4TuZxR/rFa
 cLeYhGuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYwAwAKCRB33NvayMhJ0WXtEA
 COv/10jY0WihPStJbOhVh/DFSXa+kbEeOhCCk7+X8EVDDILc0+9OglJMkv3/FdVITRjEDF1JSplESZ
 rGK3piyzyjz4oydec+VSLPvq1N7oglkCy7I1R5DqSA5/f0lxIyjEqQAte4YrY+31P6dPuSCx4fx24Q
 0z236PVgqEV+zJIXUNp5WRTOqhzP1Uq625zrZOCf+1uCwmlFVvvVqyLAOYoRD9kpohowg7qVbW6aw2
 6KPOG1/i5+cte4enlZiEtVEclhkStsARlJ2cho3lhPiRkJCgcPjNwQvhcwxwCFLCLMv6Jv30E/eP+L
 5FVUg7k8UIiw4GiawF8z5/P+UszJKC+9TH1jitz+8a4M6qEEm8hbaLbQm4cKf0c8M85irJFBaN0foi
 gNWc1FSwA3iFFRnNj1NF6ugp4gwzeGCdES69WU/H7Nwu7sBVf4D2YOjWfkom4i/zvuNkbPj4UFEsth
 e9g3SE6R3jtw7iO7nCxi6rL7V54Nw8tGWskQnMO+1aWSVQ9qabGC1/KrHbhEw5QUJcJggpV4iCUzuv
 hfV96ovrDxZJK3qZJTBCyOZcZp9Ox5e6Y2Zm4BiKMH0lxkcJe8Ep4xE1G5onbr+O4Mb6WyU/7rBElZ
 hUjMALdpMS5aem5Pqsfw4N7yocnsVzWLTDFVdnb6O8K+Iq0uUATArGes0sjw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115878-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98DF26F55C7

Switch to the ayaneo,pocket-s2-sndcard since the hardware connection
of the WSA speakers on the WSA2 port only makes it is incompatible
with the default SM8650 generic sound card.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..508d1445bf21 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -221,7 +221,7 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
 	};
 
 	sound {
-		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		compatible = "ayaneo,pocket-s2-sndcard";
 		model = "SM8650-APS2";
 		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA_SPK2 OUT",

-- 
2.34.1


