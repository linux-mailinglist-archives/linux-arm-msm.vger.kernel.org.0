Return-Path: <linux-arm-msm+bounces-110281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wElWDlegGWq7xwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:19:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9797F6036BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFFE4314A555
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA853E3167;
	Fri, 29 May 2026 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diMl44L8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EzBf/Iu0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4F83E7BA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063777; cv=none; b=LscvDd8kvWvqewlrKlMCrN9khF8L+OvLDaUCEb1w0nIEyAiRnqStnmt+4MGJJHi0W6+kGYsAvLcTbXXuyzaNOGMN57IBo+kHQKGslXlJF3fDGURDjtdNnwz/6cOoa9a+raJgQdWK1ZNrSRH94HAOrSy0JiBvxW7p+YUubslKk0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063777; c=relaxed/simple;
	bh=NuPUJapUqz3JREo1bH6C6ywL8UN7NzGYySYr7r6IGfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kYKfBu1M7FAuURanGrUC9yRBdfPl5ATzLNoSN+qqyO5qZAqZNaGusYWVpGU+I5a64qShBB+polvNL5SoEb0olc3/++g7wV1gg1WlE18auG9OcqbM/dEnFxARlvV+oT5QXMDnlrhPdFiSYDZRvDgc25nv6iHFBZ687QWKZ9KTTS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diMl44L8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EzBf/Iu0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLC7l3656506
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c4U/qD3jmzaxRy1VdQtVpb
	oJpungzw2My8BG7IMbxCY=; b=diMl44L8HrC89mIA+WBgJviq4VQf2l8gsg61UR
	z0ZvnoEbA3ifpD9ho5lRUlMKWxs8CoS3S8NSMYMzpNj5m5/xOgjTQ01BW/RDIlQM
	cM1tw0/d7l2h5844q0XJKUEHKvshE/xdAUe1TPAkAKTvsyXCNR9XPMevbnWTCpoq
	owwzGxrd82DLCLs42d2ZWcHw2yDLoTPeYzMtCHbQhC3kTy4MECZUgpvxqHLZKNKJ
	x4hBfbl61JjM6/Yxm7uS1QtpIYiZuNTvgXxK/dlnZFFeH+ikbe+WQI4Qh+88VilL
	pUp15f0NI85oBQHyzYAqQr/PkVCAMBwsDELEc2TWOCMDx10Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5vhm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:09:29 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f73835016so10024924e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780063769; x=1780668569; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4U/qD3jmzaxRy1VdQtVpboJpungzw2My8BG7IMbxCY=;
        b=EzBf/Iu0FmCqkwJwv9qsDhFQNccqtx0Qj6D9tU1K3aTkltvCSi3A7LRd5FTGbSG+rw
         /xk6VXjQEXZhc8qxBhpnQvaPKISoPIuCx7Dg/5mruclIbnogIQAtVZWy0TUYkd7KNnQn
         Z5Ik1WcZYLWXxA9gyKWcfdorDEH066/MQlE5k9+I6nrry4JVFKw08sfyudk2h97Z0k9i
         HjKGWlhjj0bJSpdjwlYQA7lHVNZMtjUfaJMRLhRhR91zRSMIWynFTsc4qt1q+IJs3HS4
         TXx1eQNRUtLGl3dlI/y8i4Y09ytOKr57NLTIC2vGDoOVW6r2cZfAwsxNd9KOotcghTj6
         2m6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063769; x=1780668569;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4U/qD3jmzaxRy1VdQtVpboJpungzw2My8BG7IMbxCY=;
        b=ZKegOBwoKZK9f9By3/3L8ZD2w6ipw1xquB1h+Z6sSp+xvqxc0T0Jgv+KZjq+UHMgGg
         Gircn7QKDVKUNjizeNZkcikY1VIRD50tN53VDfLsMnr5IWODuQZk4tA6x+aiZdasEwKt
         znWxF035bZUXUdhqtpK9TINzl+iY2yCUzNoleHDXdnC8OZbDVg4kNp75NnnndqnnnD40
         s8C+GxgIvqOkNhF70SFfwfT2e+Ee/m8jBOn6TNxakcrnZ+H76HYKNxXB6bgnDY3hB0Gz
         NVVRpU/qEg9nUoI2kqAGZN69ABHnfEKiM7W4G/Nq9j9Yn8Vn2wfBPo2G8GfwjFBmGvV+
         aZmg==
X-Forwarded-Encrypted: i=1; AFNElJ/FHEfoSwWh54U2YIDGflmKynkJXo8zaGfmO3T6ILQCeYEsLnEaRnqPv0cZ7XhneKsnnjG5IymoLeqbBvEv@vger.kernel.org
X-Gm-Message-State: AOJu0YwMFv6u7b9uomT5GlEhPGELKeVRY7m1nzF8uG6ZxP+JXWJY5GY3
	2v41SPpbFBefEVRc78RsQWWdHk1KG+nu985GHta/+1Z+JiN2myPU6vXDzYYPhtWc2cWBqzppjh8
	zFF9XqCp978Uu+wnDgFTrePZamarLFB41o+VqnC3QXKDXn3N0MpwqirMtqHOnhX3ylCODACfGjb
	l9PD2YDg==
X-Gm-Gg: Acq92OHzwkZ66GlfB0lDY+7STJLFoJ5w2sG1Tv+1DQ/I+8r0fRyO4iJqCGPZx6+6AKP
	AI0ZgNjmiM/LXbbIj8BngrglyPU/OtKPVQQb9/6GZAfgGTLAvp9mDGW0encG7xJNoXlW8plZZAi
	jKWiAJqIDArgfZJ+IdSAtu30qN6yygRdwUWkhN5oy60/LFTBHxJLdciq1mPoTZmXG8klnNZE0nR
	7TFPtfY4MEHen1KngRFP3cTOuHA1ULPCZWiDNDdGSPy+5cd38ny4cXuBKqZBh1zuq5YrLBexfGq
	vTfDWXizd3Iqiud/788ODHlbtg88k791/r6PGn8W7s0SPGa/XFZRWF0Lt6aA32jBywl8SlO/lV4
	Lh8DroWRvlSLN1xNDelSWNLybHzvr+iJ9FpjekiYpFZYd+7nfhMLZxjuMko67S+1U+kNgd9txub
	ulS3EMhhnfC0wxh6zn3pG9mE6Et6i9W9WfTBWtE78FgP5jYg==
X-Received: by 2002:a05:6122:e18c:b0:56f:31e3:9445 with SMTP id 71dfb90a1353d-599eaa9a2c1mr1185379e0c.0.1780063768398;
        Fri, 29 May 2026 07:09:28 -0700 (PDT)
X-Received: by 2002:a05:6122:e18c:b0:56f:31e3:9445 with SMTP id 71dfb90a1353d-599eaa9a2c1mr1185295e0c.0.1780063767772;
        Fri, 29 May 2026 07:09:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b78d848sm291663e87.67.2026.05.29.07.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:09:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 May 2026 17:09:23 +0300
Subject: [PATCH v6] media: iris: drop struct iris_fmt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-iris-remote-fmts-v6-1-4aa3f004ab3d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABKeGWoC/33RTW7DIBAF4KtYrEsKw49DVr1H1QXY4wapNglgK
 1WUuxc7UuuF3Q3SQ8zHSO9OEkaPiZyqO4k4+eTDUIJ+qUhztsMnUt+WTICBZoJz6qNPNGIfMtK
 uz4kqIYRuwB2NZaSMXSJ2/raQ7x8ln33KIX4vP0x8vv0HmzjltEXGpJRKOH18CykdrqP9akLfH
 8pBZnOCtSM2HCgOto7z2gjHjd5xxMoRbMMRxbGgrTNoGGd8x5F/jmL1hiOLU0NnDYLtwLAdR60
 c2NpHzftIw5WsdcNq2HAezxIiXsdSZ342QZxNSOdHPp+qxR3wll8nHMZEf3OZfvwAI3nOFhQCA
 AA=
X-Change-ID: 20260311-iris-remote-fmts-53336c2b89a0
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NuPUJapUqz3JREo1bH6C6ywL8UN7NzGYySYr7r6IGfc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqGZ4V5aVgg72YrK4MKEHlwDVxRTJHHr6jnBuG8
 IfzREDMIT2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahmeFQAKCRCLPIo+Aiko
 1SJaCACQHt2fyu9ql3c6lkoysnOGkKsWyjm1REPqRhRnvjNH/acwhjdcS73aPEf+NVZoqsi8YNB
 JPq8J9nq3lf2MQnij5b4nuBIupDkztm/c4CR9W3WeTc0en6fIR5CECH5saHPDxXWt/DT3mB8y5b
 nYdyfKZs8HItIPqiQrJy8m8bvbeFTrdAYdUtVxLUeNw6Ocx9UexmDo7z4+/6scCjjfPJ7QJ6Jy+
 dsmZ5YiSv1l2cP6m/WbIda9EPTjYKbgcj/jEvxCoK+fgEOz97Ia759S0YdqO/uptqh6Xlj027v0
 vWrhTja0/nJQ2/qMovRGwGZS8lEBuqRec8TriPuYTm4JwnUe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: PedQAeezN3DMEuZn21Bw85ZjScBA6cs2
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a199e19 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5MaIgx6z3_532Kf81nQA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: PedQAeezN3DMEuZn21Bw85ZjScBA6cs2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0MSBTYWx0ZWRfXxBe3k6vH6rrx
 JSm1mlL/N7qiTaooJiCIF04pWNFuscKWzLgpjNlFRrBcfp6mzpkKSqEosdbwZ0edXMAvHiT99Tt
 tThZHQgZ8j3GkspSWFD+aeTDfQuRBc4ZlyNC8cg2hdue9UuAiQ54QJ4/aRROq4cxUqEYJygXv5M
 yCw8b647FCUXBhah+WA5LMPaqDQ4mR09kedJYZVEBVnypOkrMnakvHy4iWTEyyK6YNVeEYkBN+y
 M0iYcSwWZ44mDNGAj3w6/R6jXB1Nj8kgMOAA8IrCEcEhuqbv4Uv55Sy7KJ9wTfwGWvaH7Dp3QZM
 mMuQuaLpLoJ0mj8nXRUAr8gLkrP0JYnxBjSgf8WEn3cRherSu6kkg0MC2Dm/EeUemYU/RTd/wLe
 OyLCMpsl8s3cWlKjn/rlyF+NQjdfqTxaMA6ww9eGNeW2dpJNnKX8QGWbABpgKxDXjnUsv8l+vea
 86J5EddGRbZVUFITGpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290141
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,msgid.link:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110281-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9797F6036BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The struct iris_fmt unites pixfmt with the plane type, however the type
from the struct is not actually used. Drop the struct completely and use
u32 pixfmt in all the callsites.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v6:
- Another rebase, now on Bryan's -next tree, again
- Link to v5: https://patch.msgid.link/20260520-iris-remote-fmts-v5-1-a4915476c072@oss.qualcomm.com

Changes in v5:
- Rebased on linux-next tree, dropping the dependencies.
- Link to v4: https://patch.msgid.link/20260507-iris-remote-fmts-v4-1-72fa9e2af290@oss.qualcomm.com

Changes in v4:
- Rebased on top of Bryan's -next tree, fixing the conflicts.
- Link to v3: https://patch.msgid.link/20260330-iris-remote-fmts-v3-1-a26ab9e90101@oss.qualcomm.com

Changes in v3:
- Rebased on top of the 20260227-iris-platform-data-c5c80e84d1a7:v11
  (Dikshita)
- Link to v2: https://lore.kernel.org/r/20260313-iris-remote-fmts-v2-1-edb11793b196@oss.qualcomm.com

Changes in v2:
- Made platform_fmts_sm8250_dec const (Dikshita)
- Sorted entries in find_format_by_index (Dikshita)
- Link to v1: https://lore.kernel.org/r/20260311-iris-remote-fmts-v1-1-de0044453b68@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_instance.h   |   5 -
 .../platform/qcom/iris/iris_platform_common.h      |   2 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  17 +---
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  22 +----
 drivers/media/platform/qcom/iris/iris_vdec.c       |  84 +++++++----------
 drivers/media/platform/qcom/iris/iris_venc.c       | 102 ++++++++-------------
 6 files changed, 80 insertions(+), 152 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 1d8a22ea4809..c54d8ec8562a 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -29,11 +29,6 @@ enum iris_fmt_type_cap {
 	IRIS_FMT_QC08C,
 };
 
-struct iris_fmt {
-	u32 pixfmt;
-	u32 type;
-};
-
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 982767faa51c..6d69a1e3dcd3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -311,7 +311,7 @@ struct iris_platform_data {
 	const char * const *controller_rst_tbl;
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
-	struct iris_fmt *inst_iris_fmts;
+	const u32 *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	const struct tz_cp_config *tz_cp_config_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 41986af8313b..6e06a32822bb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -28,19 +28,10 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p4.mbn",
 };
 
-static struct iris_fmt iris_fmts_vpu2_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 iris_fmts_vpu2_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
 };
 
 static struct platform_inst_caps platform_inst_cap_vpu2 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 541ddc40e3ae..2c63adbc5579 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -48,23 +48,11 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
-static struct iris_fmt iris_fmts_vpu3x_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_AV1] = {
-		.pixfmt = V4L2_PIX_FMT_AV1,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 iris_fmts_vpu3x_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
 };
 
 static const struct icc_info iris_icc_info_vpu3x[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index dc7b051f2d01..75736c67b23a 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -62,29 +62,16 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	return iris_ctrls_init(inst);
 }
 
-void iris_vdec_inst_deinit(struct iris_inst *inst)
-{
-	kfree(inst->fmt_dst);
-	kfree(inst->fmt_src);
-}
-
-static const struct iris_fmt iris_vdec_formats_cap[] = {
-	[IRIS_FMT_NV12] = {
-		.pixfmt = V4L2_PIX_FMT_NV12,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
-	[IRIS_FMT_QC08C] = {
-		.pixfmt = V4L2_PIX_FMT_QC08C,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
+static const u32 iris_vdec_formats_cap[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
 };
 
-static const struct iris_fmt *
-find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
-	unsigned int i;
+	unsigned int size, i;
+	const u32 *fmt;
+
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = inst->core->iris_platform_data->inst_iris_fmts;
@@ -95,25 +82,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
 	for (i = 0; i < size; i++) {
-		if (fmt[i].pixfmt == pixfmt)
-			break;
+		if (fmt[i] == pixfmt)
+			return true;
 	}
 
-	if (i == size || fmt[i].type != type)
-		return NULL;
-
-	return &fmt[i];
+	return false;
 }
 
-static const struct iris_fmt *
-find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
+static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
+	unsigned int size;
+	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -125,18 +108,18 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
 		break;
 	default:
-		return NULL;
+		return 0;
 	}
 
-	if (index >= size || fmt[index].type != type)
-		return NULL;
+	if (index >= size)
+		return 0;
 
-	return &fmt[index];
+	return fmt[index];
 }
 
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 {
-	const struct iris_fmt *fmt;
+	u32 fmt;
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -144,14 +127,14 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = find_format_by_index(inst, f->index, f->type);
 		if (!fmt)
 			return -EINVAL;
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		break;
 	default:
 		return -EINVAL;
@@ -164,15 +147,15 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
-	const struct iris_fmt *fmt;
 	struct v4l2_format *f_inst;
 	struct vb2_queue *src_q;
+	bool supported;
 
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
-	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	supported = check_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -180,7 +163,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
@@ -229,7 +212,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+		if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 			return -EINVAL;
 
 		fmt = inst->fmt_src;
@@ -268,7 +251,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		inst->crop.height = f->fmt.pix_mp.height;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+		if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 			return -EINVAL;
 
 		fmt = inst->fmt_dst;
@@ -297,16 +280,13 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
-	const struct iris_fmt *fmt = NULL;
+	bool supported;
 
-	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (!fmt) {
-		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		if (!fmt)
-			return -EINVAL;
-	}
+	supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (!supported)
+		supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
-	return 0;
+	return supported ? 0 : -EINVAL;
 }
 
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index aeed756ee9ca..a945992f63aa 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -79,40 +79,21 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	return iris_ctrls_init(inst);
 }
 
-void iris_venc_inst_deinit(struct iris_inst *inst)
-{
-	kfree(inst->fmt_dst);
-	kfree(inst->fmt_src);
-}
-
-static const struct iris_fmt iris_venc_formats_cap[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
+static const u32 iris_venc_formats_cap[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
 };
 
-static const struct iris_fmt iris_venc_formats_out[] = {
-	[IRIS_FMT_NV12] = {
-		.pixfmt = V4L2_PIX_FMT_NV12,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_QC08C] = {
-		.pixfmt = V4L2_PIX_FMT_QC08C,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 iris_venc_formats_out[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
 };
 
-static const struct iris_fmt *
-find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
-	unsigned int i;
+	unsigned int size, i;
+	const u32 *fmt;
+
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
@@ -123,25 +104,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = ARRAY_SIZE(iris_venc_formats_cap);
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
 	for (i = 0; i < size; i++) {
-		if (fmt[i].pixfmt == pixfmt)
-			break;
+		if (fmt[i] == pixfmt)
+			return true;
 	}
 
-	if (i == size || fmt[i].type != type)
-		return NULL;
-
-	return &fmt[i];
+	return false;
 }
 
-static const struct iris_fmt *
-find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
+static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
+	unsigned int size;
+	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -153,18 +130,18 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = ARRAY_SIZE(iris_venc_formats_cap);
 		break;
 	default:
-		return NULL;
+		return 0;
 	}
 
-	if (index >= size || fmt[index].type != type)
-		return NULL;
+	if (index >= size)
+		return 0;
 
-	return &fmt[index];
+	return fmt[index];
 }
 
 int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 {
-	const struct iris_fmt *fmt;
+	u32 fmt;
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -172,14 +149,14 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = find_format_by_index(inst, f->index, f->type);
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL;
 		break;
 	default:
@@ -192,14 +169,14 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
-	const struct iris_fmt *fmt;
 	struct v4l2_format *f_inst;
+	bool supported;
 
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
-	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	supported = check_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -207,7 +184,7 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -228,17 +205,17 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 {
-	const struct iris_fmt *venc_fmt;
 	struct v4l2_format *fmt;
 	u32 codec_align;
+	bool supported;
 
 	iris_venc_try_fmt(inst, f);
 
-	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
-	if (!venc_fmt)
+	supported = check_format(inst, f->fmt.pix_mp.pixelformat, f->type);
+	if (!supported)
 		return -EINVAL;
 
-	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
+	codec_align = (f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
 	fmt = inst->fmt_dst;
 	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
@@ -281,7 +258,7 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 
 	iris_venc_try_fmt(inst, f);
 
-	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+	if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 		return -EINVAL;
 
 	fmt = inst->fmt_src;
@@ -350,16 +327,13 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
-	const struct iris_fmt *fmt = NULL;
+	bool supported;
 
-	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	if (!fmt) {
-		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-		if (!fmt)
-			return -EINVAL;
-	}
+	supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (!supported)
+		supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 
-	return 0;
+	return supported ? 0 : -EINVAL;
 }
 
 int iris_venc_subscribe_event(struct iris_inst *inst,

---
base-commit: c92057a181e8df8fd47426bb904c3253693cfced
change-id: 20260311-iris-remote-fmts-53336c2b89a0

Best regards,
--  
With best wishes
Dmitry


