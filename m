Return-Path: <linux-arm-msm+bounces-104369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDhjMZpY6mkhxgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:36:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D39945594F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E4BC1301D08B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 17:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8FD3A9DB2;
	Thu, 23 Apr 2026 17:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jezsDCGL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlNHekFC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F83D3A8745
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965761; cv=none; b=Coamxcsaa7IdBRzvNbLD636LrVNT+hApZvklx2rqcYgtIFnCF4hMK/IpHmuXxMHuYYwQO2xQLAphDffkvZcr0V5Fq3/939E7x7hJDEEiKVC6CIGxd4YQ/hjJW6SPF6HpvNOtUlcQS8qDI8tZGHDwkI4CLR7RMvqcGcvC4wJOyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965761; c=relaxed/simple;
	bh=rzBTGpFpXPu/D8syEj5N48jKz/WGXbCL+5Hqmh68jC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVI3N7zQ6iq3FzJXGnlAupPUsjx155moV+E3JCb4+uFHToaz7Pn4is5rOX6EMN4u+bUvP5GD1vyayE1MQclgLZVYq/FJ/6nf4Q0ulwUXlL/A1fasQKZWRMmEQ4Jp54BOCNbHoNYfNElj8wddvTdM213Yt8n+6amKFAhMy10jH1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jezsDCGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlNHekFC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NFdAY53769021
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=v01zgbIceFoQo2akt8oD72VOejP2Vjve3dK
	tP6YQe/I=; b=jezsDCGLTM9CeNhMdSKXCVBNjQi5UbkziBIh+Y/rOEUwmrHlB4+
	frLQIEhYe5dRKhpAh+ehaf2QUXBVm1Hii1ZZnudNmg8fGGCUO66BmSIahalG0Pa7
	YhX8mHnBYNAB+XWs2eJ1EjojvpLC7nvf2tVPgwFx9jIGRpfE4effrJOu5/rDkVyr
	vV16Z8GGiLDeTuMVTEZJ1UJPuSyDndz6Qz8ucBhNoId+4QY3SUyJZ6Kg10buOrLN
	IEEVzjaPFuXi5t0Wdj6q5U37GKUC8pfREyRJYVyxDnSJXSqZJZ3gpwjHgzWdCM9n
	HjDrDDM2xHHhH12l/cE8E+GS5G7OJaQnx8Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq5208-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:35:59 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-948476b92e8so3362200241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776965758; x=1777570558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v01zgbIceFoQo2akt8oD72VOejP2Vjve3dKtP6YQe/I=;
        b=HlNHekFCcPNFumF7sfB63v9zGsJXmPKrZh3WZMxXPynQj6SsE8JOLVA8hgyyXuaBI5
         CkMOBenx+1QBEN2ZLUgF16fGrQpJ0OkhcbChhKRUhLEYdPSszONEx0MpeJAKYeB/eb6R
         C1iC4UU6yLpkS5hCAEWqTVYHU/LsUdgY7pCr5/xsTUn7ovqAfDx/Xyj7mvRxxPaSObDo
         6p/tVtNszunoKqbEvbkm9MxSrl/DvrSR5UCOx2zWp1Jfv3jU7DbVc190dakeow3/lgxv
         +VwjmaTB5Y6Y+sGfY7nFCcLB02Ey2pEDOPpRUaqDleQ1j9rukWxvTeB2Dz6RAZw4gnR0
         xzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965758; x=1777570558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v01zgbIceFoQo2akt8oD72VOejP2Vjve3dKtP6YQe/I=;
        b=mRhA3wPoIELo3pfwzEj7W8FXX6qJGK1WCtP0PQDP0+el93yQbA+AqWYfhH43SBVFaw
         cAYiEDuzR1mVB7IsmqgpaFNam2IBYYFM6EFdfp/vqdw1q4/3jDeeBk0STfszKOzZJ4Uh
         vWUOMRZ+jnoHSxL+Pj+PU9WwG/tTe3TF8Rh1vr7nk3r1EKXBXLDppiwasoWcRmXCvlTj
         pPlAVMty3f/EDSRhyvc6zs1mryYxQqVcGOp0bwidd/NJlhuJHxvLAhDJIWJtvchUfJc6
         cuIMN6iPMKrhomgzJ6DpxZKGmpbuDU9pClHQ8eICKEq9VWKlqH9zStMpUIF/tnn4jjiO
         c8kw==
X-Forwarded-Encrypted: i=1; AFNElJ9kfAVQEf0xVrttEpIi3lKMBLn0CPKDyr7VxBeadsw+DYkMqbV3241Zs4X1+AMqzQJPyWa3c9dhFkGfcnDH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq6LPQXKkWHOQBBheK/pYtxoh9IguFXtbgNj6GE4qRGv1t6+CN
	xdr39OZMfoSK3H5Il+XCoQhworFqw1cSyOc3LB18jXPti/Od5BimVX4NPnaxuHc/Jfog/mxY+d4
	voIwIVkLELi1+LqpQY8j0kqYu6q9f/zTNccDr5o/TAMMZ0ICKTQk/8I+rdBsgN0QcUnqQ
X-Gm-Gg: AeBDievRk1ZX4VfWNwWHAye1GNIRDnWHAQTKdbfkxw0qBe6Rai3H33vAtKyVEibEOnD
	IidBDLpWua4J2XOnDHlAXqWURoZkwpEbPihIrOJauxR2SMMYMslLZtIrAizZhwjvjZIhtYpgHFC
	+UL2Rjp4SoGaaLraFpH5z0NYt7c7DhXOkeSMD2961y/9dhpbHoO1a91UYxQHRz1YH8pO/Q7yRFD
	51Xiu6zSIFa7tAsjFOq1os0GKBHwle2X4lsyWUVs3p6sWml5I8PPQ+3rYqmXRkbbiwJViwPvZgf
	i8q8yooImsYkLtSFAx5wQu3sCcV49Xqy4GeehHpHfI4IA6MGljyz9CRI4oDNVof+bHZUAGD0U9b
	MsQAVAyb2Tk6I4SMapK6QnbkfGoPJ1BOCMgpqY4XysxF+c8Q=
X-Received: by 2002:a05:6122:d25:b0:56f:6d27:cadc with SMTP id 71dfb90a1353d-56fa589b2f6mr15057316e0c.7.1776965758366;
        Thu, 23 Apr 2026 10:35:58 -0700 (PDT)
X-Received: by 2002:a05:6122:d25:b0:56f:6d27:cadc with SMTP id 71dfb90a1353d-56fa589b2f6mr15057300e0c.7.1776965757975;
        Thu, 23 Apr 2026 10:35:57 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a557412eesm99064025e9.9.2026.04.23.10.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:35:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] gpio: qcom: Unify user-visible "Qualcomm" name
Date: Thu, 23 Apr 2026 19:35:54 +0200
Message-ID: <20260423173553.92364-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rzBTGpFpXPu/D8syEj5N48jKz/WGXbCL+5Hqmh68jC0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6lh5OCnPvJp6iYecZeFENund0W1fmpQMgl5Oq
 fj9au/xwSKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaepYeQAKCRDBN2bmhouD
 18AYD/0Qpd8Zvadzare6t/o/enMGE0slS8tCLBceQ3cNRHQfphviVASTcVLhhI7acSc9b93/uva
 vP2LDkgvbFpHutfzRPk9f6bRttx8jSHBGnuzXgEg7jwhGcnVlfvb/er3U74EDLPTsS66y7VM8vp
 alxc1tLFh3sAttxKnjuBl4C+Wxs6dn+XlBeHA1SXsUfYa+o7qfYwgD9R85JXwsIdvFysbwqISCM
 cZ7dsk85D/Jvf2ytSsPAIVSXyDfmwVLZWEhZEeMjqtMdaDzj71/ADPB5n84JLBsOHIYcVy/bAeJ
 N8N9Rg3ZIUDY9khb58fihlSLaRocpFVUt3vx0b+v0tM24p/raPbHIOWzmZcbzOihs2qWeXXh2DZ
 xB6M9rFdbCvVRIBIkVS6OUUngjj34krsLpbm1bpbLzrpQJo2H0Va47xeoASBivDXA++ueenVUwm
 jVgTE0xto1a5pBtruUJhcwjWMA291V9moWunjyCUyalMFfxbLdHHYZRXgUfc3+j4s5lGp9h2TGf
 dgwHv0tXtwJEVGgCeGl9itB+ll8SaTmOH0B6wk2B2EWmxBZ89RuJMWumELlT/Bd/B6YppauG2sI
 cEuL//qBxEPlAFKaaZzpfLplK8pUy01q8Ty7QNGc59WCtp5Uj3ecMv7RM1U2ECl6ie1Vu8oe7r2 1lChpXhmNi0bzRA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE3MSBTYWx0ZWRfX07b3e5Cb8jXV
 Yrd+58T9Kr6ggW72IYawfkXYFTWHDlzup6AV86mKOC3c5ZsCwOJyob3rr8roGwvnCrg0ke1RgGo
 pNXjtiB71z3m1x/8hGrNhJjFp2ifsBlHpa1Kxn/4T7bnFTzDm7oifVWQ2Nr6ufTZdZwLYxEwijC
 Xo48lPrr/++xNKXcetaPUBQQXgdnZEsLp6SWNGc8nJVcxrIKeKLYmrPcnbCaWOpEsNEtk/SxXAT
 8m/VD7h0GgF11XD3DhiWpH8Sa66yfSrDkJdE4t+KhYo/RvtewcgQuhtWBtbc2rqI/F6gaT6pjzB
 1XXin85PzJqb0o3DTMqV8ChI28Yu9KP88dablVRbXdhtfA+SozK0a5iVsaoUlz+31sj4Hhz8ndi
 8yf00c022bDW/9N5FW3sOkFOp9g4r9qlpw+dA9R6SitGvcVH12p3sbOrGsgITOv0qH28LxKmjmm
 QAqUpi8AB7/LAGZs6gg==
X-Proofpoint-ORIG-GUID: fSdw08uaACYZ1sRL9_nA49yfSXt-NKqL
X-Proofpoint-GUID: fSdw08uaACYZ1sRL9_nA49yfSXt-NKqL
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69ea587f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qLWlyxIRwKzE2EnybWcA:9 a=TD8TdBvy0hsOASGTdmB-:22
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104369-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D39945594F
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
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 020e51e30317..f86e25da964b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -806,7 +806,7 @@ config GPIO_VISCONTI
 	  Say yes here to support GPIO on Tohisba Visconti.
 
 config GPIO_WCD934X
-	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
+	tristate "Qualcomm WCD9340/WCD9341 GPIO controller driver"
 	depends on MFD_WCD934X
 	help
          This driver is to support GPIO block found on the Qualcomm Technologies
-- 
2.51.0


