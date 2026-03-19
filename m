Return-Path: <linux-arm-msm+bounces-98654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNo2E4Kwu2k8mgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:14:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A62DB2C7B96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25906304522E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE7F3A7F58;
	Thu, 19 Mar 2026 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QxEVmRTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A913A5E8F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907975; cv=none; b=TW5eCqZxaYD16OdDugrpdtqnslvv6ptARb2w0/74bIIBOI8nmR6x6eYNtFM0gl8mWlOP/ohNBHaJPpBjm5sJjWzvHCfte+sxWWGIi43R7kKTjpGy7tSSzogwOna+yWmRDLJFrI3v99ALACbxFSERDXxFGZD43dKn0AdAMRMfsQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907975; c=relaxed/simple;
	bh=TUOoVZbjO+iFbYwjUmr6bbaQgTh+bqzs6sxID1OEThs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iD3Pem8DGMJLy+BnG8wQMm0x62H4nr5MlZNBTM9MoPWxHeE0o65iK/CyMSmaO4DS04eSeWZmts66vQHULaVhAbaO3goPfGsHHOLGewNLnqCXbY+c2+f9syBFacxVGi31o9Q7tRmVYdEI5W3WJRQzT8EvhqfjzRfftfrt88kwCo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QxEVmRTs; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9825ba7f9dso6008166b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773907972; x=1774512772; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rOKIKrnNG7thFoePiGqUSEd9q+P+T3Ql6ZAbLy3uYI=;
        b=QxEVmRTs3kfR+IpXccwtJ11PafJ51DBrAbSmxHJxZPCWPRM611/F7jTxiHhfg7Cqmg
         Ci8Q78A1RQO/1c1UWw0ILv9zbXC74nyFl3ieuieu6KprAOmaN0ubopZlsk1jWjSQV1FC
         zB+KeF2UuWUm5kiV6tPUuS3IEAbBHnd/cfJfVkUGa7qIcDc3/yfdAYwtQv3uDVXFL5T7
         nxKzWIB8R3m6PZTO6tRujQpbktEk3veGYl+EM8oBbB2O2fwyAI7tvU3p631dPBPPJzlF
         p4Uleg6TYRXQH2X0iUeRVd9EW72vNm0VWyuNKwPQLQt4IwbQih4ishFpOv9g5lWMM/S2
         Fb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773907972; x=1774512772;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rOKIKrnNG7thFoePiGqUSEd9q+P+T3Ql6ZAbLy3uYI=;
        b=c3T/iKD8ClxcY7NxScSsbKkyxdnM9AJz0h62AisfezGz38xNf6OSBGduqpU8D8Iq48
         JMzOBlAQjNF2GbQY2MpdFAAdPVmg+86rOFKVS+xsYEaz3L8095KL34nUIcXUTxSSovxT
         mDORsr0BFCHNpsO0xhCVQdPpneT3CtqsSKceNc4jFIJAF0oXsfvvvb1LQ6H/afb3vNtT
         wLGE7buCLy2BzlkQ7Az00CmV5KPRmv9ST27U5LxEXdBiZi2rE24/CokCd7UsbfAwoOJr
         m2stPToRYhg/OGXZFMYC7kQ8SBRwlEqJXGbdCN4G0V3IaESIB+IWSJC07Ja2hLhpb1V2
         QYHA==
X-Forwarded-Encrypted: i=1; AJvYcCUuBgrWnw2DjcWm33mG1djqIg47HOJW9hw0MveDcAwF+XOXm+vPjnPYDfpl2wI3pX3PPiigKj2vkpNTFQzL@vger.kernel.org
X-Gm-Message-State: AOJu0YyWO9u+XeJABc6o4D+2BHwGZvTMWJLjhexD2gzId2+5akhwF8wt
	xMK6gK86R9f7LGNjzDw4eGo5xyOwq69IJywAVnFCiXvcq6V0v2ujuwNatRxj8pG+hvc=
X-Gm-Gg: ATEYQzyp8iOPMtIgNTItbZ+Ub3LZX1setEFDGu17/ORum32j3C+JeiXHZvZb+VUTSHk
	8XkBFChiPAtb12aAH7RaPXZv/e9AHLY3qPsq+ZzejX6khDb0Qq361125yTeg/NvlmmyPz1+QXkR
	yOVUJ2it/iEmLwg1EgTuXOMPkXR1ioSugmcn4Jq00iqUH6UrGHID/J1EQQCen5dNdznRHAEQwT2
	l6fmvvuEWqBnEdGOhyAFS6t7JSuw1bIN6+HsJJ0a8v/XIcvrpgD924+PGzme0lGzVbiXiCbpihc
	dZDwzNxmjv2k3rqkZVkC/NAQIpHqekhmFbiOFe9szduFBoVvFq23N9JFPv6OYVM3F+xI2DAyIS7
	fbkSa+vzr7kR8iDht3HZMPpS3LHXCwcbr1ONvi2kd5h5e8QE6Wd0vM2RIpgFw7vPVRVdoInKiuH
	anUqHE7hyRq2BVBittO5OtaM9u+5WdQWNSGPad2u5XcrU7iWzIzSoRZk4H8Ho+iCyyWCsW3EsP9
	U9BjA==
X-Received: by 2002:a17:906:6a1e:b0:b98:65e:90a with SMTP id a640c23a62f3a-b980f925794mr144559566b.3.1773907971715;
        Thu, 19 Mar 2026 01:12:51 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1751cfesm399884566b.63.2026.03.19.01.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:12:51 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Front camera enablement on Fairphone 5
Date: Thu, 19 Mar 2026 09:12:48 +0100
Message-Id: <20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ7CIBBFr9LMWgxDLW1ceQ/TBamDjEaoUImm6
 d3FunDj8r3kvz9DosiUYF/NEClz4uALqE0FgzP+TIJPhUFJpWWNtbBjI1JzvXgUnTSd1oZIaYQ
 yGCNZfq6xY//lSPdHaU4/6ThNIb7Ww4wf+7edUUhhzc7i0Kq2xu5gDcfRBU/bIdygX5blDcEWQ
 pa9AAAA
X-Change-ID: 20260313-fp5-s5kjn1-80a866aee261
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773907970; l=911;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TUOoVZbjO+iFbYwjUmr6bbaQgTh+bqzs6sxID1OEThs=;
 b=3h9k1o1poytneYxAr1tewAZ2fG5Ti3jGJe1qat/BypAgCSIEzsNQjfT5dsJu13xmLuOK8uPlF
 nQ+gx93TGFWDVYaeUb+ZSNs6+S72R/X+EnPnHjdFFmLEFthpTTy/kTe
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98654-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: A62DB2C7B96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since the Samsung S5KJN1 driver was upstreamed recently, we can enable
the camera upstream by adding a few bits to dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Move cam-mclk3-default-state to kodiak.dtsi
- Pick up tags, drop applied patch
- Link to v1: https://lore.kernel.org/r/20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com

---
Luca Weiss (2):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl nodes by pins
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add front camera support

 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   7 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 121 ++++++++++++++-------
 2 files changed, 90 insertions(+), 38 deletions(-)
---
base-commit: 55154681052313ecee04ce301de6666575cc54e7
change-id: 20260313-fp5-s5kjn1-80a866aee261

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


