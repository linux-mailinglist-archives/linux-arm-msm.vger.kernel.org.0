Return-Path: <linux-arm-msm+bounces-84611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6828CABCEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 03:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D04D3002621
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 02:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6859823B607;
	Mon,  8 Dec 2025 02:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhcxJQcQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJ/4sMoi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C548721858D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 02:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159697; cv=none; b=OF7OC2pyZWMdHZM3G8X2tqG4Bult6apAZf9evEzkc+BJf4KJ7/7iYQ/LxcZ8uE8bGIRUIAiAYznVdpH8o512INQnO+sGuWgOwY0IoGAxydcZrfkBTo6x6cCGbNtRx5O4vuprW9FpASsrhrnO1kCyAwKcILQArvUQgZSKeI/xJ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159697; c=relaxed/simple;
	bh=9KrkAmm7MnqomImFw8vEd7rSzuG7x9txbxdzzCDnJN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3zzJxfNfDW3PCOkX+58ZhTQ8T1FxZtiDXagqaNJkYJqEOtyQEWj+jErM5d1pThFo8UEKDj99AYRxgMNvluwigWXQZdvqBXqUBmnaJ80bgaRqIknRPW6WliJQQPl1TcAJYMZtQm+taYdF7aj2Li65623bT0TRbTLKghs8409JC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhcxJQcQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJ/4sMoi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MtrlM3768811
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 02:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F3JilCaP9S+osKl/XDqS/9GF8yI2ZMjEEyd
	JRPLBsMM=; b=VhcxJQcQSIH+/skkPTLxAxhnXVvl2aOf4Vh5qf0bQgl6QNR0wUy
	oPuP5Vv57hQ3KLaQxosFE9vjLFF+dSYpOGz0XZNcPSx48sl779SEEnUVRSEaNuf9
	LmJVnhzas/eHFxowy1BSytVsBRXP1dmIsxRvJv0dgei1CtOroEapkQAzCr60dp9i
	qIKDi/z588TUXCYK1hK6lodTGB0xQYrkuCh52OWMZT/Z/N41Lcdnuzlaybh1CHVC
	v2Kl1Gf5kozmS9xsaL6BbF2o1vLBlWmlI6VopvyU9cMohcJrICzO0PidY2lheex/
	WJHLfOXOA/VEf8rnKz2e/2Kt4HjwmSIRw1g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avbga3ccq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 02:08:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c240728e2aso7209343b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 18:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159694; x=1765764494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F3JilCaP9S+osKl/XDqS/9GF8yI2ZMjEEydJRPLBsMM=;
        b=XJ/4sMoiqaGhhhzp+mLHRvGWEC6OXCv2fRFcUG6J3yfQ/r/6dKjWZh4S4d3OfHXUVA
         ZtmIylCPxwgNTeTtuENw2NRWNanOb3Mq2y1D0NCCyM5FVZTNNoH0LearZMAuPFf4HgMR
         751nYI5TyG+iISd+OB3g+ouufxfm0pXiAoMxfyu8byozPmHvfmyPkXRUJVtVhusaNaMz
         uRHrhd4P2fUN1ifSRWNY51uFZ0jLc2lzdXFY/QReCy50U6d/4/71xcP4LjxqLdEh/y6t
         7sv6VpgPWMyjjQIHwhMIIZ6Op8IPfozesWpcXFf4zr2J1GddoCs8uHEkMkvh7ZPvcEdg
         cq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159694; x=1765764494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3JilCaP9S+osKl/XDqS/9GF8yI2ZMjEEydJRPLBsMM=;
        b=kzR6XQNvg1Gur5BKW/aBBimiD6k0rkcM0rg5x9oUzzp48iyxfKKKZWDlW8ytnIRBh1
         oCXpg2/xnz+NNZs2UjKW1m5UZrXUKqRSi0YBvD2XejR9snOlFsgsdyPnJN+u4s6Tz2Bf
         i69lIdBjqHztshlLNsDhc46w9nINSbAjF8KjC4P7MLMKZE/qu7Zee2aJ2KoOmV8GCoU1
         TA1pVCvbVAUlK7DMgasiC3k+R8nWX9jmADCUE7Vg0unPo/2/h/W81gFaD6BStQ4Zaa+u
         +LFyOSVX5vd92aJXVfwg6F0rbmjMGBZkVO//bmXfmEHmhhkSFDEWxbtgX1tBXl2iAJM0
         Geow==
X-Forwarded-Encrypted: i=1; AJvYcCVc1IklJ8RJXQdt03uqH58IQ6QSMYK9pUDZyZsiMmVGiVRIuU4ArL4lEXUMd8vbLknJBXrvjYJDmy+Rdx6+@vger.kernel.org
X-Gm-Message-State: AOJu0YzhADNtyl9qQwtphZ4s1R9D8u58uQZULIs2rInvBhF+NMboVuAZ
	I1yAjFUUuzjtRFAAnqd9uas9r9BmksNfGR/zkuRkphJZJkxxfajIAV/a3GEFQHu5JU7bZE5gx1w
	YbWbS0Xc7BtHJNF7tEBw2StJ+jbYFD8NAOMyW6a7h0Ae3hN1AhuiVUE8af9eaFGg1I3AC
X-Gm-Gg: ASbGncs1eFx7v7A80Ne5TohNFY3J+2GxE4GtWYqwIl0hTzv2Tl6qkwC7LOGKAW3vcsA
	WV6z/0ztbMe7ZvEbjVNmypNWz+iqtBAhB0Q1F+j0gTcvAt33Lk/uhwbWQHuLYLcLisyI7qi21zI
	406MUyGtte6dWhyG18dEFgXf17FYNETO9Tq+oGM5+aOltYmQ71tpC04ucXmVrSKygTyP56uSazJ
	odn4Tx9cMqHH8l+RuaUR1IHgv0sdaTPRIYP8UCt1dPXdM/T6mWTmibajeq2XaLg9olrD+aja/ZX
	q3vBoea3MmHjFyOpWfzfK/ZsPBIAZ6vDlA+NUv1e1FlHiS47HAg0nyrV3i/X00FNVZaeBfNTlPg
	zDG4jHjowERj1ox+pSeAFzkEmrGOMNB4YyacNQcudvu03P4/+1ovt9phA
X-Received: by 2002:a05:6a00:847:b0:7ac:3529:afbb with SMTP id d2e1a72fcca58-7e8c184a40dmr5886547b3a.20.1765159693603;
        Sun, 07 Dec 2025 18:08:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmqKGrOVJWYEKlVFzoRvfTjukrWw7Zf9dWoIHH4kt9YUpmPBQbF/hCNWi/GGPVmqsfKZVr+A==
X-Received: by 2002:a05:6a00:847:b0:7ac:3529:afbb with SMTP id d2e1a72fcca58-7e8c184a40dmr5886519b3a.20.1765159693064;
        Sun, 07 Dec 2025 18:08:13 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ee0b3sm11364990b3a.7.2025.12.07.18.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:08:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ufs: qcom: Fix confusing cleanup.h syntax
Date: Mon,  8 Dec 2025 03:08:08 +0100
Message-ID: <20251208020807.5043-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9KrkAmm7MnqomImFw8vEd7rSzuG7x9txbxdzzCDnJN4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjMHgfQXVHIDl21ct4d5A2Eocm71jsbahvR6V
 wE9LmOJD+uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYzBwAKCRDBN2bmhouD
 14R1D/9gtEdRMpR1H6yLvTE1LBP8Kqzy/efwIkXl4C2vlLOcNUEBp797Isig0yMsVYtyV2NtA7c
 7Kb7RsuRaW58ocjMKhc9X5OPgO8VdGGL5cEIoHgA+4hsU+GAtDaxbf96GUjL3Fc+KJbh5MM2e4O
 MnF0ZYYbSEO++x1IDm8RiqOmsvvgEWkeUaQWL6NIZ9yEVfT4mJyYzQ5U7Fxcz2TOEuBeWpqmAY5
 y8Tqv6USqOJF9mgUTJVubYgJWwmccF9f4YjtR+THB9fCPxTvN6wR0MbUeptL1rRlrTTX87Ej+uH
 CCxUqwesxj2TICQrpPNJq0Op8+h0PfLdvATSmpDmZrhCE5YA+Yy2KTSK7r+MuWG7mrsOw6fET45
 xHgzvsYIbaUqDlA+vEEPcP6OwzjcuDuBranXrtHWu/kbG21k1A95g2vHnR/T9ELepv3vvD8YRlL
 lb/CFrOttZg5Kj7nt2yIIoV0TNFLQ0osI3w4GTo95xfbI3sDMpzgcA3DGd4L+40onBVt8pWmuBQ
 pcuISKyGGJwBb+oIDtgq8fCosy/ZSVfbx+9VjPIF5AKyBnV8sBxpU8RNU7POTE31SxKZZ8gnEfC
 mOaQvFVeyNSRezM9PwKAX+aBfV5ftNgrXlA0QkBjG5c9xx9tAKjVNmnaO/P8BpSBowdxHB5yLDc DVSc/HXBPPse6Yw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d4z4CBjE c=1 sm=1 tr=0 ts=6936330e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PuYmaTqjycMhXPiJH-UA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ibchhS6VyynAVbUHcgvy8gOV_NUzcZlD
X-Proofpoint-ORIG-GUID: ibchhS6VyynAVbUHcgvy8gOV_NUzcZlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfX1xZ4dkJi3Azh
 TxSZhrRT3Fhw5KfIb5LiVI3GG/rc84J2K77dEjqTwAWeVa8K1YfYyIl1eJx1wmxeJk3oeJM057T
 hVwv7gJIlWsuCwUck2yAVdC3W6rXFQeA4A9p46Z1FY1dJbVxzqt5pb16aAsLFgigDJS+3z4D2ZV
 M0FEMCmBK/J+V133x7K6euoi7vTKga55OPEbXP/TZD4oQ/h3DpWugJoow2XAw3O7oy0JG+LYdU2
 kVvhSGxcPGxN4vDD1vzreG+7c6k0CBLTNaRLLTSzDTUqPMowhOYckamzODycETVanOmzvG5k5qK
 3tmBZ7y/jAOc7/Md2eDqJcBlkWnhIH+7IiUqvvAta1oxB99dV+cWzQaaAswWNgWFlqnHKRKY3rg
 rIvCNJv+tfJFLHJ5ed+BeLN8OsPDyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080016

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8d119b3223cb..8ebee0cc5313 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1769,10 +1769,9 @@ static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	int i, j, nminor = 0, testbus_len = 0;
-	u32 *testbus __free(kfree) = NULL;
 	char *prefix;
 
-	testbus = kmalloc_array(256, sizeof(u32), GFP_KERNEL);
+	u32 *testbus __free(kfree) = kmalloc_array(256, sizeof(u32), GFP_KERNEL);
 	if (!testbus)
 		return;
 
@@ -1794,13 +1793,12 @@ static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
 static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
 			      const char *prefix, void __iomem *base)
 {
-	u32 *regs __free(kfree) = NULL;
 	size_t pos;
 
 	if (offset % 4 != 0 || len % 4 != 0)
 		return -EINVAL;
 
-	regs = kzalloc(len, GFP_ATOMIC);
+	u32 *regs __free(kfree) = kzalloc(len, GFP_ATOMIC);
 	if (!regs)
 		return -ENOMEM;
 
-- 
2.51.0


