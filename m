Return-Path: <linux-arm-msm+bounces-105234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FovI2MT8mningEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:19:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F5A4958C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E872300954F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538EC31352A;
	Wed, 29 Apr 2026 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BgMYJjnH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6542C0303
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472347; cv=none; b=QGk450hJ5JGVf6tGUvYZJKgF+rBjOXvJf6VjarSAwzxdzAzYS+EzrspPYaqO3EuZJNwBEV3e7G4SBnxKnsY7RlN+upqYFdVda+1rlMNEjuIAvzTp0YS9AsnVgB85/lMSL/TzCwCEWUbGpWZh418QyDzmv20JvqiFb+htqPpNXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472347; c=relaxed/simple;
	bh=l2VwwdY0f8fP42No1Lq6QNkjHif6XCCH1yOub02MhsU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=N9VTyCaxBpZvAGx2IskHyIoQiKOFIyYEeRoUbLfSa9FNsTIB+uVprwt7mLzWkrwUjOz8gL5P4iShLfDp5gXWq6gIL9irk04GfePi+4bL3poiQOdHCB94CU93uo5P706eUgPuT0cqafMldXxuuf3P0znjdY7XvaHaWYldfuFGkkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BgMYJjnH; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b9c1d1f7e5dso1262836766b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777472343; x=1778077143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2VwwdY0f8fP42No1Lq6QNkjHif6XCCH1yOub02MhsU=;
        b=BgMYJjnHhACZTFQq6a0keIEJ/Rp1m0mim0Oh4+/vFLOfxASvU/F3jea4EbQ0UpEtym
         j4VoOJfWGmy85TWQnBdC0oW8Po06bkLA2gN9XdmCnmb7vmyD5LklMv4b2WsnpFj4AaBT
         tLHszQXucta/KlKcL/Mcoj1JspzdgGXYunVRzGA/InxZbNqv6QLkyX5cJd84WKLGlowP
         56gIy3+CKzV5RTkrPdx/rGCigoNXHQMJYVKfd/TiVt9GnqgZv6QJSnwKUYeDoRY6wSlW
         7fnJAJ2K82u+Ph3FUm2N51ycoHlXXQ9LGx8DnMaX3og3tAWG1sV8bIGt3hAk9b8K+6eu
         H42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472343; x=1778077143;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2VwwdY0f8fP42No1Lq6QNkjHif6XCCH1yOub02MhsU=;
        b=k334QphsYc2FfSQ/+JfOVdJlxMBrY8BfrTj51Lwn2qOn9wrxsNG5QLZXm+otuOVWkQ
         cFydluGhTTKpaA4hCg11IVQpifyInzHx892gmaXRPZVlznvYTxlab7H10STq3+mQplf9
         LUa8dGZy4BOOXuM1WmP8krfZHrlfr6Uwn0Zi5d6XG1voJvLtRGFxkPwGefNJMcak7CRK
         y0M1HasMOyUI0EVXxiefZA/eGHJ/eXCHNxqV5D0rpjrCT9/dAosO9v6o3JKkKsoNacrc
         T8NISBU3ZmNmPpwpGzY+HpqIfUej00QMnVvUqsC2V6O9zQNnR1+WbQKIDSBbAwRWt2dm
         8fHg==
X-Forwarded-Encrypted: i=1; AFNElJ91IbJ9vqfnfjFojeHUrNK4TJuLXj+E6sWRlwvYaUWsQDHBu6sHvDdzfU5PrsmfNyFXemvXIh/Y7hsxrGWu@vger.kernel.org
X-Gm-Message-State: AOJu0YzeRS3kdoydKfcY2SeKMh4RLZu9wIe/dK2OWCNnNzdHUft2bqFP
	3jj/CbWuHwFBfCbQteYBnMKfN0KF3J2Cx2ALhRpg72EqGULxNn4KNxicGyKt+VGVQKJ7uMSSYF3
	pJKb85+K7c6/fYA==
X-Received: from ejchj1.prod.google.com ([2002:a17:906:9fc1:b0:ba2:62ad:29f7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e1e:b0:ba0:d58b:6045 with SMTP id a640c23a62f3a-bb803778202mr518587266b.27.1777472342464;
 Wed, 29 Apr 2026 07:19:02 -0700 (PDT)
Date: Wed, 29 Apr 2026 14:18:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260429141815.827157-1-smostafa@google.com>
Subject: Support for Lenovo IdeaCentre Mini X (Purwa)
From: Mostafa Saleh <smostafa@google.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 30F5A4958C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_FROM(0.00)[bounces-105234-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smostafa@google.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+]

Hi,

I see that recently the support for =E2=80=9CLenovo IdeaCentre Mini X=E2=80=
=9D was
added [1]
However, unfortunately that doesn=E2=80=99t work for my device, the board
resets once I try to boot the kernel from UEFI.

I believe that=E2=80=99s because it is another variant, as I have been usin=
g
my device tree for some time[2] which is hacked based on the crd
device tree with some trial and error. With that I can boot with
PCI/NVME/Ethernet and USB (there are also some other errors in the
log related PMIC), this device tree is based on purwa.dtsi unlike
the upstream one which use hamoa.dtsi.

Are there any plans to support the Purwa based variant? I am happy to
help with testing, but I can=E2=80=99t confidently send patches as my devic=
e
tree is based on trial and error rather than a data sheet.

[1] https://lore.kernel.org/all/20260401-ideacentre-v2-0-5745fe2c764e@oss.q=
ualcomm.com/
[2] https://github.com/misaleh/linux/blob/lenovo/arch/arm64/boot/dts/qcom/x=
1p42100-lenovo-ideacentre-x-gen10.dts

Thanks,
Mostafa


