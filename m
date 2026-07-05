Return-Path: <linux-arm-msm+bounces-116545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6j3wK+pKSmpLBAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 14:15:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FDA709ED6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 14:15:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=QhbOoXoM;
	dmarc=pass (policy=quarantine) header.from=qq.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116545-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116545-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7200F300BDB1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 12:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1469337E2FC;
	Sun,  5 Jul 2026 12:15:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F8E1DA57;
	Sun,  5 Jul 2026 12:15:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783253735; cv=none; b=rq3jwyfpKyFHvFWM7EQHWLGrWV/F2Wt5T48OmdgxOsL0UucFXi/9z6RRwnh3GY3FbITLlViDbUZPimUYNJmGWcx1L3Jjn4cav+LHhRZzOk8VbkWX/94wYXi20vBFXwGLps88ombqqNBimybl3b3NvmydyorPyqLT8quIWGKYVhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783253735; c=relaxed/simple;
	bh=k0d3xsTqQgpBEbGb1/SAc0rmOZUjpKMaQ5Y6H2hy7Rk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jftwWEQtZQPCefbbeaBeLaFJV7c4JMEfW+CfxAzQEwG3iCaL8lsk7Oi2Gq2mXVRe/AmoeTytxyn+sj6EgxBcjkEq5Dg8k4wM5QRXueh2BqbXDTU+ZWTbYjmj9wVUjKcfTuYGu2N8IoG9ECeg7wnM7ePGxG0E+HJFuscnoxLKlE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QhbOoXoM; arc=none smtp.client-ip=162.62.57.49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783253726; bh=k0d3xsTqQgpBEbGb1/SAc0rmOZUjpKMaQ5Y6H2hy7Rk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QhbOoXoMn1i3yg/5+1IusWWnec3H4zMvgSOZdPpfRmh5OPGDX1XzaA+4wWIzD0wEJ
	 ithCVKBM0setSfwUUQUzrv+CKKixeOCzYHGM7c9mCy/1JUyO9FZONxv+EZzYWfcSUP
	 i22iVPsGl8dKiZfpQPmjBXwv6r7W8JM5ACwVOx+Q=
Received: from 8qyomHQF3vPjMe ([27.38.234.213])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 3D50FEDF; Sun, 05 Jul 2026 20:15:21 +0800
X-QQ-mid: xmsmtpt1783253721tkuvf61be
Message-ID: <tencent_5AA494D13F238A86D327D25C7CD1652C3A08@qq.com>
X-QQ-XMAILINFO: ND6GQ3wPDKrSKxZ0//0mEyKq2UV4BqqU6lpwEEZ3mLJK0vVNT60iNxnDdbN8VO
	 9b7fRbwIpB1gyoxzUgscmJGPKiyUuSYBGeCWKmIYF8LrHM5ZdwNZb40LQNYc/UOpPTmhW02LSO7N
	 vIgqZCcos99fg6+vU+crB5S7GuGvw7k0HQkoY49gnzhrAdLAqq4rAZPeHZks3BDVTZsbf5ZGEx80
	 PHCxG3RdGnItXu7jDaYR5YLycJsPGEuPG3nozm8eAOaYPbpWlFiBJwtz/uKdHS0/dfEHY/nsYqwc
	 J6tTJcDuIKicPPXXuCtxjzxbXVS5A67iUkyJf0lUtpZCF3QqZdS1pKvzlQYHf+rHt49MN9OIVb50
	 NFKB34lByxUaIgd/8pCawEMIVwslFgEwJEnvHO0FZv1XXK5wZh36klufniptDqQsMI34+fT5rJtw
	 eHi7Nqr1QWMm24GWfDSi2zR9ee1ciaAVPoJvDxIi4pLUHDU3x4wyjvk+QpWMXF2NtIX6gryhVG5w
	 woB9ZY9cUDAfq2lBFqoJaBq4cKDEmoKgwM449QXzJLB6JUXwS5Lt9vMghEqMYPx/FMYTcuGqVNkl
	 A+S/YUL+JwM2akTVLf8VYrFgj7VVckDgJklX7Q7gimsDby5Xdt9Xni5xFsWmlEjvPlHRaWamF+LE
	 OK2VdKUETilbUNJ+HyecJ2lcS1dMxdfw+bBeiVbhNm4ks0sTAsDnSuSfZS6+U6089GKMVpuLV+pe
	 Olxa6dJiNhJYsckT9rx6LtVm1zi7JCIZBkcGEy0YFwXdGnNizvNdtp8QgS8wjWzjIKnpq/xZgjmw
	 Auw5cvReQ7mTkKQrdecopUPgO7kAimMPAhuwoGbR/5W7CS/lSp6Ep4u22t4raFh1dmr710xtIq1v
	 4U1pWUw0G5mloBhoapdZlgRHPZ2lc8ROAITfgg+s1+x4W3Cs2IjMkzZsvTWegYz7bzPD2OAbPZKE
	 q9JVwHcsyreH0CGVmoYnTK5aMFAN/xI6KQr/IjZVPoF4Xu0YZXvuXlm8BzOdSeViKALBvEad2hOP
	 3y4HtJTwe+tDzGWMAvczea1HQr6cd/zCQgnOpjPTwHlrGsAjV7z0MpdJPeHtNW4q8KoXDl9Q==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Xin Xu <xxsemail@qq.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add ov8856 front camera
Date: Sun,  5 Jul 2026 20:15:19 +0800
X-OQ-MSGID: <20260705121521.6397-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_A89D858754397A68C4C830EA0487CB255A05@qq.com>
References: <tencent_A89D858754397A68C4C830EA0487CB255A05@qq.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:devicetree@vger.kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116545-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qq.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:from_mime,qq.com:dkim,qq.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3FDA709ED6

Hi Konrad,

Apologies – patch 3/3 was mistakenly sent as a reply to patch 2/3.
Here is the direct lore link to the patch in the series:
https://lore.kernel.org/all/tencent_A89D858754397A68C4C830EA0487CB255A05@qq.com/

Patches 1/3 and 2/3 already carry your Reviewed-by.
Please let me know if anything still needs to be adjusted.

Thanks,
Xin Xu


