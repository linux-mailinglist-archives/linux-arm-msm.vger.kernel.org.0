Return-Path: <linux-arm-msm+bounces-104625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCqsEm0L72n14QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:08:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A353C46E196
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4192D3088F7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509D8392C2C;
	Mon, 27 Apr 2026 07:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYFeg/GY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnRhyHC8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A40392829
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273268; cv=none; b=RO0vnS4Qf6n35QRaxGXjVwHWrE1I3oH45tssLVOHO+0IYWLwwwDh3rqmMxDKu8kSKkZ4A/JNxq3KsxTfRPyQMYpG0eCufnf1q96mneXlnXQLwf6xTBiN0f4JdBn23Z72h2nER31j0aTbQBDZRJWq8tG7q8prpcddLKV0bs6fgCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273268; c=relaxed/simple;
	bh=7zp4HV0TbvQ6Pul23tpXeZBlJnXcEzJAnmdaMsCh6Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DZnMKXrV2yqWZddeb98exIo3ZbUVKF8FZ+FAmyWm2A2dN/SCRNSZPjgV2h3UvK9TMKxoUXAsy4Jb6Z3YnI9RMrRnMykLZRhbs44a5P9tTXzFLqfK1fBytUKIpcjyIRFtSQb2KDH9qmTyNlbg5Mym9aVjJmgskuUvRBhNLRloelw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EYFeg/GY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnRhyHC8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R64HON2582961
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Zf3LTuREWwngTk1EKrm0qd5Eh1R8tVYqmRQ
	PluxOAjE=; b=EYFeg/GY57jkjDZVA97EE/lNYzastKYslf20cbBWI8D+8LGpNO8
	Lju5TXqnszH9jhYF8qzzYhCLqZo6g6TlJuH6c28fNx+BiVtVPw+Yqno05p149MDD
	dGSpwuaLNO2wnuxmI5gD3+sN/M7rm6IneXLJxruCdQMhJZHa/kd18WcuSeddzKmp
	cKTMul81q/FIVT7viWe9kZ7wd4TnGmtmTagj+Ejs237jmFpvmen1leL6j9kPAI/1
	w+btCej4ftn72utx/woxZ+6ZWIWR71iGt00jeaCj2Qva/XmfO+BOOOlfo98m1msP
	Ct5NzVgWBbcd8yo9vDarnVC58j7GgEa16WQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xg6k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:05 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56db02d3ecbso7715461e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273265; x=1777878065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf3LTuREWwngTk1EKrm0qd5Eh1R8tVYqmRQPluxOAjE=;
        b=VnRhyHC8UyH/zYpWXW72VbBkEu/UCes0vgboMMnoAoBSwQERL/rpzp0/g60Tf6RCi1
         qAAZs7n21mO8CN27wl96F1Ia8gQQRPwX+AIYajMPuoaJa91+9EHZAxd3lXwUdOPSVoWf
         TWy2eRERtsbtYzHnSoncQuIQGj1bF9SGPkdHC91/q9cExU5lA1QF5Kr+fRcv37KMecWf
         3NVNF6be0408M41McZz4aGYubIBcII2Oh5Pgqaslw3atulInMrW79byvs0imeG8fjCeE
         3MJlTx+vVg4q9wA10lkQZ3mDgltV5Rq5/jFFi/cy1b4nE3UVc/0QVvC+aJs+qU4+qwuA
         sPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273265; x=1777878065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zf3LTuREWwngTk1EKrm0qd5Eh1R8tVYqmRQPluxOAjE=;
        b=q0rPZeELsHrGmzKu6l6Unr5Dwlun0A8F5kyjksEOTG5y5XX6JkTJCU00OBcdOLyMEF
         lr+YeND/W0OeCt766l8b8Ga3z+Eq2mAAPh+nfQon7ETlWgzdmCuIv+VElAZcSTGCw0HW
         lvmIQMqYUCEvepmMI8i8tIhUGNa60qU7+xFqRF+x+5lIHYsC6X/HWxBPLsr4MBX+s251
         f4YXSKA8abUR+80OfVH5WOPDJuhMZoN+GyYgbtmOgWTx2/5rBwmHf1+X2cxekHplSKzx
         rmJvEgrcbMEL9bcwf84/eNXFmwJdenuFaq5pYVhr3Ue4de3jy6dP6r7Esd/e0dfZEWxL
         jzlA==
X-Forwarded-Encrypted: i=1; AFNElJ9UKMPvFEDRhT7DtKkVGNJnpuVSlUDtQ5VK2IWvuIkA/ghf8+Lo9pkGmLmrlq2OmRA6Yt+V+ncsjUyVMvXp@vger.kernel.org
X-Gm-Message-State: AOJu0YyBrzMpyuCxvGRlZU2llofZ1x8w19KwPkwjYMO+2Gz3NzlrYqbG
	1yJmvY0PQRHZP3XJd6PGjT+Rb7erezcLSxnO+sG0MXzEWaKe0aKDgKRefq+vqccr0TgMbuRIY7c
	DGKI5SUQRLnWVZsJWQmdrwiH+VpWR+W/n7QggInj1/BfdM5YY/eOvEajmKp47hXCWUKMg
X-Gm-Gg: AeBDiesvEfK0PrzFZtO0iqtvLaVFeWwdrm3QBMUOpaaQowQ3mB2njhLbDBWmvM2fBDU
	WaTyxysW1bjWW/G0birJjy5PO412S1peJLBZOrKpJELTZwaQnHjBFNhkfHnCTxXLiNOyuD+tqtB
	Ttcr3ZsFi1Agvi9N9op2F1HI1C9bsFn7TXEbBo63ptMVkd/gT5i5wqvuUYYa4GKlwIBzHk73SRK
	8BoJvk2VcGl6FvFYXNRLOM6gMgHRSwdSllmbt3plU7hu8PKCdsCTFvJd9tBZqNQgzhZl4nc143d
	i/4BRlB3pKb7Ocojr6NvcS4O/hyfsFGiiyB80CI2Kst6FC6ui84nBrkyMv6AtQU+tuOq07Wydym
	sOVvxPUu1I5suchM43lfbTGs7m/gaHLjTDjBS+YudkJkKYnRP9yui4doOuUkW/dY+2VJMS0DGSL
	X8bQIxpPkx1Q==
X-Received: by 2002:a05:6102:6a92:b0:607:798d:8083 with SMTP id ada2fe7eead31-616f68d7558mr791436137.15.1777273265048;
        Mon, 27 Apr 2026 00:01:05 -0700 (PDT)
X-Received: by 2002:a05:6102:6a92:b0:607:798d:8083 with SMTP id ada2fe7eead31-616f68d7558mr791383137.15.1777273264551;
        Mon, 27 Apr 2026 00:01:04 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm89936653f8f.20.2026.04.27.00.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:01:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] nvmem: qcom: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:01:01 +0200
Message-ID: <20260427070100.18184-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7zp4HV0TbvQ6Pul23tpXeZBlJnXcEzJAnmdaMsCh6Bo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wmtxNBtzOx7WHprSiaK9qH7Wn+7+WtzD1m2m
 0bG+lZHXcSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JrQAKCRDBN2bmhouD
 1+whD/sFGl1pJV4Zga4Wfv1W7wj+cAjRLx7AdMUQvSqA+q+do9UAy0rMc4aVzdY5pv9p0ZHTuWU
 1kyTZ1sqykn9SUbwGEK93KaSN+6wmhLzDgZMoUWtjuti5T5debBKA91HQ6wk/YIEKUP59dLwhyK
 wytsKM30PXfgMDKlTRa9VmrvXnzER+B8GqwwcLFvAGH/IDND+LCHIi0pnrtDy3ABq/SLgxQe1yF
 XpcZlDbpne/UuWJoxexRJGxtNevN4br+jp2URtvOGq9nYOQW+lr8Q6Z0i2gNcaD03fnFuoTSEIK
 ncOSFcRLFMxsd5+TMBBaT9oHp3Gpk9E+LBJQRQdpdE4fZ1QFTqfaMRgTQ+w/a3eS1eqI7/bZWTO
 YjsR4pv1MdahveXVzsNRbkhiOLzA3OLRFzYH9FjvrqHl9nroxtH3KaFFDaRzKJ6cnhRdHS4eIrV
 y5JKBaUXtHF8f7Osy8nGZYIkxEolsLGV0o/rcoHmAaCzhgVFziGDl2iqvbgYgaBfu31Rgmu9rPE
 0C75oq4uTMOJNYIcpgZesdsI0z9zC1GvnHZFEapjC1NapAbdmS3uLERDkf1qWeAkQZhbsWY3A6C
 ztGbaRN2KSCM+V8MlCxIS21Nz6COkYhW7pseJCJKADXPZ2swl1zKAHeg/AQDID8QRhSYQAlvfzA Beltirxpz/yzmxg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ljepuI_9zCMUpO98ysZUqCIW_P5zIfnY
X-Proofpoint-ORIG-GUID: ljepuI_9zCMUpO98ysZUqCIW_P5zIfnY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfX7Tm7aphAIf4t
 7IwMQHW1g1fYNuQlQ2WNbzpGagFJdWT6iOIrteeiYGtIzCEW9uM1ruCCnlT7JgEpy+PAcxrd2CS
 a1LKyLn80Yw52FdNvHRZQgV/YWqach41OWxzr3IMQbrVfTSYgEe+Q/1VOU4KegkCxkLg4iS4YUY
 /APlzbYF2sDQooZTJR+qfQtq76iLNw1XJVGESK6kmanv0gALIUr8GGtvLn/XsMg7s06o3kDF8in
 oEMT/ghv7mXDJzHNEDWoUYLUQLlAOUnBNblpHvHcs9y+ro6ioRoUrcYmQILSYIWpyAW0EDMAV06
 VwldYsoXjV6VNQjzi+feBIklTJ6mb1Zz7KA+zPOoJ6Sogu/lBOa2m0Hu29duVYOBRnJWJ5dvi04
 ubXTLBOKAgWCv5ZpdZfccq23gJeBQfTU+SJKtUVFPdUwyzH4H4zLh3U7ff6JTe2PmK6iCMgCogB
 szUN3PCnhdK+Z5koODw==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef09b1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PwaDNkMI475Si8ni0UoA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270073
X-Rspamd-Queue-Id: A353C46E196
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104625-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/nvmem/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 74ddbd0f79b0..487df7073f27 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -262,7 +262,7 @@ config NVMEM_S32G_OCOTP
 	  Programmable memory pages.
 
 config NVMEM_QCOM_QFPROM
-	tristate "QCOM QFPROM Support"
+	tristate "Qualcomm QFPROM Support"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
@@ -273,7 +273,7 @@ config NVMEM_QCOM_QFPROM
 	  will be called nvmem_qfprom.
 
 config NVMEM_QCOM_SEC_QFPROM
-        tristate "QCOM SECURE QFPROM Support"
+        tristate "Qualcomm SECURE QFPROM Support"
         depends on ARCH_QCOM || COMPILE_TEST
         depends on HAS_IOMEM
         depends on OF
-- 
2.51.0


