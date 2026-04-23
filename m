Return-Path: <linux-arm-msm+bounces-104370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO+UOdVY6mmgyQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:37:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BFD4559AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48ED730177A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 17:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D973A8732;
	Thu, 23 Apr 2026 17:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/HgLZKy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AF+sI8OW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCFE3A962D
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965765; cv=none; b=ZfBQPAf1cadMMSLQmDCVbR8Iw7QM7yRiA4y8MPltRwy/elmlhNp/AY/8oG1kxsW1Hg9H1nDnuRRpBR7COLvAbKdB2H5yI9ZjXaWI4EAj3bDSF+2apWsIbO/ZCaMjTPEozBX9WJpYrmrg9ueH7uBCfcSLakA8UTbEwqTD7yDea50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965765; c=relaxed/simple;
	bh=4NmOrZJlniH6y9393EzNNOkxXyo0Qf2X701waVhZ+rI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cfFwFZv2mDlopHBjbytwqXR3eIyakfDVNwt7vM0Kvfg54bbDuX7u0BKn0Fch6jPj1XP5OmCkyeTS0FkSypEBmhF5Ss+nzZP13IrkOgceip+qCTE3WdOqP9DFFpX5VD3iiYskTr5TXf6QBo6n7zRI80CuBTLrNH+ZX84kfCnbb80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/HgLZKy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AF+sI8OW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NFdSYE3769521
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=faD65WL6KmbnFRUZMWF8TSEEJ5NbnKbzrfW
	yF2hxDVM=; b=E/HgLZKykhtyh581yEijy6cKy7jLiW84msU85JU74GiDNAto38z
	2IIxIJ8t5FuxoYh6psrxsSNm7tHyLugQzbHiZrJbBu8TTluiScQupA3a3XuE68kZ
	J0J/0+bS9ta3szwJu4dqnbIm+w2xH0+L+u/dg6agXWxs5goN8pfbuZsHqWNnIwU2
	09WWY9+nsjcKxKkHoVe4d0J1x8WimItO7uWzBiAbPCsiE/qyYPTdFPK0brhBzExv
	bFTpZkwqq3Lo/CQ0JGhpDGRTSJcJE2fQaULkZ5SbwFmfvcdXI/VWN0vMmEKmedPP
	Cfja7IRoIXaR6jKNe8DoLK7W/FMVv/BasOQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq520e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:36:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95674175677so2471563241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776965762; x=1777570562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=faD65WL6KmbnFRUZMWF8TSEEJ5NbnKbzrfWyF2hxDVM=;
        b=AF+sI8OW1G60r/8wnYeNUOJxZJjrTVdgK864M2ZjJgxtnM3rN3eRhaZMntCQ77Tkjt
         HkWsKPbE7UbcoXbF08egSJlprsJ2+SRwUqDYLae/mkvwuXyR8d/uDcktjj12S/0p4eCt
         MAbuy9nmHKvfaE0HCVyMrF5G6e9z7X39LJZyERb0+F2VXq8NYD756Nhx6J6CXTdqT8KV
         Ld96KxAJiIoCD5hJ0nAZbNbfGyXnIiAtgEPNmDRmENHxWee6D+LgQ03/lfFo00HNlgcW
         dE72JOl0DmN/x88KachzEn65oHFXaf9EQWnIwz828LmSCnIfzqGddWRzbWbOsqxqPKt6
         d58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965762; x=1777570562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faD65WL6KmbnFRUZMWF8TSEEJ5NbnKbzrfWyF2hxDVM=;
        b=lei5MmjiyYbcBXS3Ay5+zELvVnrwwvGaQeOeae6I81dc80LBXyjW8U79PY00BhUd2w
         2zIsrtys3CLw0mJONkcyXKJ6TF4YrgiRBqIrRXlZzDe2NJsQ7CM8k05UXbV0yrfPq5+p
         Cli+pnfPCEjfVvEtwzWpG+eVUDXBUuG3L70tWvzRnIis0CK9bp6hDg3KkUibzzH9FPct
         HpgfYy+1NXO8Vg7N8Lsdb9PI5fXty5mzwNo0gStZ9X4VOMqh+/SEP408qsrUbtxN2UQG
         kz17h1t726XNDSVl+SM9OWyM0LxW2taW8rN+lhSsVknMUsXkdBJjjqsOXPdKhLnlYdgX
         b41w==
X-Forwarded-Encrypted: i=1; AFNElJ9X63VOKz81LOZR8DS59zQdXt7YW4p/oAcxOFyROABIbjSAmRGNHLSYlZdZCBLnZ4o7zfx7+uN3+5c7kk62@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8LOVzUpqUjzSg5GK56wrPNZZNpBrlOO7whovnbjVyC+YzVQBQ
	5fnCmZ6fCHMnbOT7aZiC87yaD9sSbhfgDHaOmG7DZ5awCSlkcYTFLWkVl/x/kJtuh4B5htyFwH9
	JR41xJ/EBclvL9DYetzosh5iZohquqcbMlHGmY7FrdhgQPN7UOF4c8p9gfxar/KwAL4bK
X-Gm-Gg: AeBDieuPkUm6hbugbBsUiZtpkbJ2ua2S2mhKFzX1P/aaoCNIV6/evKTA8p8vwg2vc1h
	Z6uxlwaTCN39AYUX8HcAPFoLEa78jhbzbqyoMWtg04sSkb2lE4kuqakctIQ9RXt8pBX+Rk4wxAL
	/GUmTGh9453tsAT+XelBnTpeAdXtfp2HKJ6Y5fnUMfZwxTAxo3qsaTbdKs+mj9bUteKWtvQri5b
	hfvZKNKp3S9mfK38uuPI2mocSaSMLVTfDemWeZoGAMEb5uba3SLpQtP8wK1+Kd433jrJBu0BM2q
	RB+R0UMbTKzhzM6SWic0erY2Qi5MwdhzLZfkVObqEnaqXGibElaQlnyvznAp5lAKjzJSzUfVFxz
	JWvKGSnkBWIeot01XegEE0lbKrdizFhOm9PGNuxc/f9zVk1M=
X-Received: by 2002:a67:e718:0:b0:611:6fef:90d with SMTP id ada2fe7eead31-616f85974e6mr14088933137.31.1776965762351;
        Thu, 23 Apr 2026 10:36:02 -0700 (PDT)
X-Received: by 2002:a67:e718:0:b0:611:6fef:90d with SMTP id ada2fe7eead31-616f85974e6mr14088901137.31.1776965761868;
        Thu, 23 Apr 2026 10:36:01 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm408295195e9.1.2026.04.23.10.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:36:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] EDAC/qcom: Unify user-visible "Qualcomm" name
Date: Thu, 23 Apr 2026 19:35:59 +0200
Message-ID: <20260423173558.92416-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4NmOrZJlniH6y9393EzNNOkxXyo0Qf2X701waVhZ+rI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6lh+he+ujNf9L3SYcj7Oovl48LT6CXMKHF7Al
 LR58sWtXjmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaepYfgAKCRDBN2bmhouD
 17vLD/0TARnTq3lZuS8eRujG55C+dqyE/6M1xJWk0rxVhAJh9oAFp9KClT0KnMPbLyrmerh1F1R
 1s0smGeLWSLDPYPeWfrKX/tqRVnwLLSq03ckOOuLVrG34koPyLABfrt6jPGesgvHMR1MJ+1WwmI
 N43ft+wU5QtgIUWOHdMQmYLFPNCXlZYLvtwGnASnobkEn4Qx9GnvLsSQyAAQr+zHJbffl1g6vHx
 bPfLO/mRutkwVfUbFwD2x45RPrPTVW6Fvp04XvLj0ZQWUhqtd0AzJ5utm8SoyrVcuDKT47uSeXC
 4cylukCu7PB0j0JOOxkEuxlfUzUBmZkJe9LjuE8j/jS43HhDIv+geWpjeOE24beOEspBBTVJ7eG
 QJEiBoSw5/vwZKNXJg7dgUH4/OoWrkB1KtuAgJntOAq9LsgU/o02g7zA3nim1RTaFy5pkZWiO5E
 1xpEnglCw7w36wRPbwfB90+ySiXEsK7OJwbmEZS+YTxelTZ87QJTo982RDJQUviRtVThgkwbHbj
 iHcjHYtNoIXVQJLZ/5DAlRzZLgU49/pFnI1LwNQwfl47I3q1+6sU/dCBBg/Ovn8WtgG6zIWQEKK
 XLWSNY+Eo4RqG+n4dYT5ACTdA7PpwQYvPpHqpj1LTRH4YFpnJumn0fJLifhqfKS2U84kcZklGaN 3vsaV3/i0BFxyCg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE3MSBTYWx0ZWRfX8Va///LhczHW
 BRRMho/qZNfunuv131/fGkqQBXgCKi+AoQY7TQAvWSxNR6zZ63zUE3tQjuYtJBM3s4UECQQR+UU
 TtHLMDq0bzdVP/aAwlJMSREniEJuzNOekE1fTS29qXOxuRjv5fG3DVROx4QN4c9TzDzFam8gr+A
 yrtW7A6PTWBz4nGQ4Ug0q2ZAmcQ1i5kLJN4hc+UaUPxrWTW8BWMYM9DdEkNFTGpmomqBu/YWKbo
 NqMYUOkgqTURX6pWdAzkxX8JDfJ/JXPC/ZG+VU3T/4DQTsoE3MY+jFxVjyltzTq08IoMp31jS9W
 qewVC5p5Imx/O/LLauBPbrNzhG0cNVWDp4Rjn6ndFJqRlVMHpyGEEJ2izd3IFlptf8xU9Rug8Bx
 Ty79bcj9zajifIBL0ylEaEEZHQyqxXmuzJsIeMPutb3nU9f4EeyI4uFFN2kC6TpM+RpoL3p6/wR
 LvycA8jIDfDAgA7VaGg==
X-Proofpoint-ORIG-GUID: dFOEwzCp7FC5_SkAmZ2XJoSxIJakiFKg
X-Proofpoint-GUID: dFOEwzCp7FC5_SkAmZ2XJoSxIJakiFKg
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69ea5882 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bx_bbYekIMeBqJIAM60A:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230171
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104370-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43BFD4559AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/edac/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index a44b85c440ca..a229bd3499c4 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -490,7 +490,7 @@ config EDAC_TI
 	  Support for error detection and correction on the TI SoCs.
 
 config EDAC_QCOM
-	tristate "QCOM EDAC Controller"
+	tristate "Qualcomm EDAC Controller"
 	depends on ARCH_QCOM && QCOM_LLCC
 	help
 	  Support for error detection and correction on the
-- 
2.51.0


