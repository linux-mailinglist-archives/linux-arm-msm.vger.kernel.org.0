Return-Path: <linux-arm-msm+bounces-115649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eTU6LA7uRGqk3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:38:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5166EC3C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:38:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DABVRlaG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gWJvWfqX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115649-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115649-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E19C73025155
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D60423170;
	Wed,  1 Jul 2026 10:37:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE80340960C
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:37:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902271; cv=none; b=bxVKJLkSGxS+QO1+3WPxvlReEvxrUbTgMXMupP/tEmY9kuQE/GHfSCF2ayfy6XQV7HjgOq+L6PI7FJ818iR2oWNy73oqBavdCpaejV5VYEROr3Nqym1I3Fo1SC6FUbccDJEWjBtdPfpsMgMBQmEkYQa3bDKRq9TmXFdDS+TFyGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902271; c=relaxed/simple;
	bh=vy+N8rR/U3qscov4uu/VMgbY2M3N108yYGXpT3iP1dI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DEAUJf32MYtOczHrEf+iZUhAMLiSioza89gJ5v+zt1RoqOmrDwM9HfmFHQHm7WZK/HfmRRdJXYJxbi9jsypxJJr0LWWBIFyzdeKDd+IipOB8+1/I5U2ONUs1V3YiN4m/9pN39dU21pD3nbGy6gCkotQwF06dw75c97l/6i2Ezec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DABVRlaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWJvWfqX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8RqO761288
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qoHqC950ogxUMx6e6GrPOq
	aJXyx0r3zT5fgO4h24QqQ=; b=DABVRlaG3BOKP2ZjtYjL9MvR+gJMBxCrF8BUr/
	c9VH/lQ0+xT6XPrvo8VgEC8AbDRBAhoMY9u1ua43Q0XNmrJSZ2XAGQFcwtmBSZMn
	K+ZvQ94yMuY4HYFL5OTWuzD2KsTsFMFd6a/7uGO7EbU/N8AtF5QaPZItb+AFCfT3
	/8+huTQfYuH6406Mlzc5Rvpsw4mUI5STGT/03CVPotLPWQsY0xdfVS2tMuRDYNHH
	4Hi/cH9klZ/phkoRxEfs/hvHQS6DOPYlqJn+qYzNEArHZaVg+F+d0m3OweG5MtV+
	JZ4hXF9POXSyfW1zX0EpMXGW7gnS0/9m45QFvNc3m6Tcsadg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw3k9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:37:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37d125687b6so605681a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902268; x=1783507068; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qoHqC950ogxUMx6e6GrPOqaJXyx0r3zT5fgO4h24QqQ=;
        b=gWJvWfqX0t8z9u7s6twcnCBWnwC8IG3Ma+9ouqkVJvfSLjDRN2OSQB/GgTiwf8267N
         x5o6+lud9wL/itxU/NiniMz4FIwf4MynF29SY9I1ExOCWhegfdja/Aqa+hsUxSsPbfwW
         i/gEQGTX69iT+OReS6lbYHkNogwzy5Cy9Ua56gLgSsPgzcJ/hbetjvqPsETt46PnLSU5
         7Dv7vq3dNTdmAbtaTmJq9ubN/46wRZbT9tEeTsGpllM5C9y1Grdn0jKMfiANoLIbHedi
         fLjlwAyR0hFZjN3vM9UGdUfUu0zHkOiOZQnq5PUx2kg6Tesby/DGI/h+ufAaHJFiYFOK
         bQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902268; x=1783507068;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoHqC950ogxUMx6e6GrPOqaJXyx0r3zT5fgO4h24QqQ=;
        b=cqzg60Y3Q6CniExOvJVoUdQSUIkn/MySGWf54ga1fawatmQ0Ga5C/FJOC7WOHAfUv3
         d+IN/Cfo+DQ/SBmjXBsznuhHTcC70bqTv2NK8mqyIm4omuc7ufVPwuJ3i4OZjGHuNDxx
         B25f8eE9mWhjHQdYNYUEPJq9nbaSu64HGWGIgS7OIZF6QZo8pxWOLm9LPPzMg+e4VlrA
         A3IJMjX5PFp5CzxdGGcSY9/z5URqMywZDhwIjbUiVBGSw9m+MfUfHkF0LTY/K3R+Ncrc
         Xk+4TxD+Gc1FUjx6DsxBvzZSPJIyJ8/gHmL/AtNZ7rQgoTBGxCjABwkGbk87KIVuSh3A
         IuVg==
X-Forwarded-Encrypted: i=1; AHgh+RpkDKHZr80OeUV/IdmtX5I+CRBSuvvCC9FYFw7SizOAl9kxGfvEfgugnIO0xIxtDJOhLVzrld8jWweIIpWt@vger.kernel.org
X-Gm-Message-State: AOJu0YwNCq6pKnSasAPfbT79vRxDi04l00HmsnUy+gKX6rtoplbdJEKg
	25YHD/KPsQpMyHnJIhoo2dJhIbOe3OlUHyV6r8GGqXjAIvMVXcpsLi/1LCmGMk78/e24uqS1MGL
	U4h9QvFLQ35ufGcVjcvo+Mvl3eHkS98oJ0wxExlgIFdIrJGzXBfnKSUgUr5OsIeeALADj
X-Gm-Gg: AfdE7ckrspYTIoqCfuHL0+5ESAG9ES/xyCd9vfw9ykXdNjxR3w9H/dmUgqe02j0S7FQ
	zAmU1AQJC8n4ipQ9cBc885X+N9WVc2IzNipT24516uE6XeL4K35KQ3KFz1w5eFJ3v8GV8Ko702z
	7QF71qKL7B+inyti5z+M/VlFGNzKziY8cTMbZN9bqE/TXCfY0LbPlEBIper0vTWOhgoPEkAALuZ
	6n/P9idz/UT2xMRxh5XVyr1JNO75FSReuKnPXK8pwGmXhs7pXsjXavvGEAaTd2nR+6YiS5PeMEA
	Th7XTaWwA6uYpGMdY88o5tfoD2v4QtRPZrxcA0m6tuR+eUkfGx3qmd64BFQCVtQ1knaPpb51yEB
	ZdEs9qQVZSTdEIUI/6prpXsEu0DL6Hag8ocmqZn2w
X-Received: by 2002:a17:90b:35d1:b0:37f:ce2e:32ea with SMTP id 98e67ed59e1d1-380aa184bcfmr1270479a91.19.1782902268253;
        Wed, 01 Jul 2026 03:37:48 -0700 (PDT)
X-Received: by 2002:a17:90b:35d1:b0:37f:ce2e:32ea with SMTP id 98e67ed59e1d1-380aa184bcfmr1270450a91.19.1782902267757;
        Wed, 01 Jul 2026 03:37:47 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095bc8a2asm765251a91.0.2026.07.01.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:47 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v6 0/7] Qualcomm Sahara protocol enhancements
Date: Wed, 01 Jul 2026 16:07:34 +0530
Message-Id: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7tRGoC/33Q22rEIBAG4FdZvK5hNB7iXvU9SgkTNY10N241T
 VuWvHvNQule1IIM/APzzeCVZJ+Cz+R4uJLk15BDnEtQDwdiJ5xfPA2uZMKBK2hB04wTJuwvKS7
 RxlM/+49+5VQp3kmhdWtHTcrwJfkxfN7gp+eSp5CXmL5ue1a2d3dSQsclA2a4ajhTIKWgjL6GP
 MXkmwGXBR9jzs3bO55sPJ+bUsjOrfyH+Peq8oBy46wW3SC9sRWtvdMYVLW2aMYIj2IAJ9FVNHG
 vmaomiiY0Om1a6LTiFU3+aoKpqiaLptAPI4D0Yvjr37Zt+wZo4bhx8AEAAA==
X-Change-ID: 20260307-sahara_protocol_new_v2-662854773cf7
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782902263; l=6830;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vy+N8rR/U3qscov4uu/VMgbY2M3N108yYGXpT3iP1dI=;
 b=ikt7MflyMLirUid2ofbzcKYtIKTCIMEFBHlq8QGgBLAIzEvneHdRYEHTDka40K5f1qslKFZIi
 5Aae5ntG34tB7ttQ2xfesFlbOyFmO08H/35HV/LmzUepNkrPKBLvDr4
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44edfd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LaHGMCMnodEAC_t7lLYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ugWGWDhyymrDsKtqaxHJSN3v-A9x0QQy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX51K1P9hRfxSa
 xT89R14uRT0GyZYJhT8+OHAjB4PjUzP8OauQFzuhqhufI1paxuFnueOwKDTR24kp1lveH7TpqdU
 Jel23DPq4Q0giQH+XjPzaYI/Xd1bM6k=
X-Proofpoint-GUID: ugWGWDhyymrDsKtqaxHJSN3v-A9x0QQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXxJuKT9AeeJih
 FES8NRh1SNF37mJj3hCRxNRqHLSir2ihsStXPAZL3pwhP+VcKMOxlJd9h890AgBhmYYttkGt/0p
 ZVjxmGhRdlylsGcN7cGJQ/5qvzFCx4m8Pjh/EgCYMSvq+dWW26dN4Z7VQzltCfKvEjta/gheYIi
 KsPhR/dkDxMxnMSk33TiT8UE42q++utQfiv1RKmv+nJtZQGJzvx0V24IP5UAj78fHPHMEAmcYoB
 Gv9zUFmp+I/uTNGP61HhWs2Bc2MXf5Mkp3tuacsWu5D1hB7K9Xd4bUJC3Qv8u/Pu3VarCMNKgnl
 WE3WOxKmpYkspbVrzzFM37uBd8PkcCOYQ1589G3YQlCVoyvxPDHNe2FGVyH2BPuVp3WK3HpzaF4
 cNQwzIi1M/xmJphd7PaTPRwWIFfUVN6zwbEzVo5Ushrd/TXgDWCgSXXRa/5flix/x/SKL3MoTi5
 AMaQkZJ17yPOsiIJuhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115649-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,m:kishore.batta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D5166EC3C1

Hi All,

This series reworks the Sahara protocol driver to make it reusable for
multiple MHI based devices and adds support for capturing, restoring and
exposing DDR training data using the Sahara command mode.

The Sahara protocol is transported over the MHI bus and is used by multiple
flashless devices to transfer firmware images, retrieve memory dumps and
exchange command mode data during early boot. However, the current
implementation lives under the QAIC accelerator driver and contains
device-specific assumptions that limit reuse.

Some MHI devices (for example, QDU100) expose the sahara protocol directly
on a "SAHARA" MHI channel and rely on command mode to exchange DDR training
data with the host. The existing driver does not bind to such devices and
ignores Sahara command mode packets, causing training data to be dropped.

This series addresses these issues by relocating the Sahara driver to the
MHI subsystem, centralizing device specific configuration and adding command
mode handling for DDR training data.

Overview of the changes in this series -
1. Move Sahara under the MHI subsystem:
   a. Relocate the sahara protocol driver from QAIC accelerator tree to
      drivers/bus/mhi/host/clients directory.
   b. Register Sahara as an independent MHI protocol driver.

2. Generalize device matching and configuration
   a. Allow the driver to bind to devices exposing the protocol on a
      SAHARA MHI channel.
   b. Centralize firmware image table selection at probe time using a variant
      table, instead of scattered conditionals.
   c. Preserve existing behavior on AIC devices.

3. Add QDU100 firmware image table support
   a. Add a QDU100 image table and select it based on the matched MHI channel.
   b. No separate client driver or registration mechanism is required.

4. Add Sahara command mode support for DDR training.
   a. Handle command mode packets(CMD_READY, EXECUTE, EXECUTE_DATA).
   b. Query supported commands and retrieve DDR training data from the device.
   c. Allocate receive buffers based on the reported payload size and copy
      raw data from the MHI DL.
   d. Store training data in controller-scoped memory using devres so it
      survives sahara channel teardown.

5. Expose DDR training data to userspace
   a. Add a read-only binary sysfs attribute under the MHI controller device.
   b. The attribute reads directly from controller-scoped storage and remains
      available after the Sahara channel device is removed.
   c. Cleanup is handled automatically via device-managed resources.

6. Document the sysfs ABI
   a. Add ABI documentation describing the DDR training data sysfs node.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
Changes in v6:
- Used BIN_ATTR_RO() instead of struct bin_attribute.
- Link to v5: https://lore.kernel.org/r/20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com

Changes in v5:
- Sahara protocol documentation is moved to Documentation/mhi/ directory.
- Sahara driver is now moved to drivers/bus/mhi/host/clients/ directory.
- Squashed v4 patch 3 with v4 patch 5.
- Squashed v4 patch 9 with v4 patch 8.
- Firmware image tables are now moved to respective MHI controller files.
- Removed redundant if-else conditions when loading DDR training data image.
- Corrected commit subjects and messages.
- Removed Sahara variant structure and introduced mhi_sahara_fw_table structure.
- Link to v4: https://lore.kernel.org/r/20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com

Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://lore.kernel.org/r/20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com

Changes in v3:
- Dropped the explicit image table entry for the boot critical image ID and
  added a generic image ID based firmware lookup fallback.
- Link to v2: https://lore.kernel.org/r/20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com

Changes in v2:
- Rebased onto latest linux-next tip.
- Reworked commit messages to clearly start with the problem being solved and
  end with a technical description of the change.
- Moved the Sahara driver to drivers/bus/mhi instead of drivers/soc/qcom,
  reflecting that its an MHI protocol driver rather than a SoC specific driver.
- Removed client side image table registration and consolidated firmware
  selection directly in the sahara driver using a probe-time variant
  mechanism.
- Ensured each patch is self-contained and does not break the build or runtime
  behavior at any intermediate point.
- Simplified state handling and lifetime management to avoid duplicated state
  tracking and ad-hoc cleanup.
- Updated sysfs handling to use controller-scoped devres and avoid one-shot
  reads or manual teardown.
- Link to v1: https://lore.kernel.org/r/20250825101926.2160554-1-kishore.batta@oss.qualcomm.com

---
Kishore Batta (7):
      Add documentation for Sahara protocol
      bus: mhi: Move Sahara protocol driver under MHI host client drivers
      bus: mhi: Centralize Sahara firmware image table selection at probe time
      bus: mhi: Add QDU100 Sahara variant and firmware fallback
      bus: mhi: Load DDR training data using device serial number
      bus: mhi: Capture DDR training data via command mode
      bus: mhi: Expose DDR training data via controller sysfs

 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    |   19 +
 Documentation/mhi/index.rst                        |    1 +
 Documentation/mhi/sahara_protocol.rst              | 1241 ++++++++++++++++++++
 drivers/accel/qaic/Kconfig                         |    1 +
 drivers/accel/qaic/Makefile                        |    3 +-
 drivers/accel/qaic/mhi_controller.c                |   61 +
 drivers/accel/qaic/qaic_drv.c                      |    9 -
 drivers/accel/qaic/sahara.h                        |   10 -
 drivers/bus/mhi/Kconfig                            |    1 +
 drivers/bus/mhi/host/Makefile                      |    1 +
 drivers/bus/mhi/host/clients/Kconfig               |    5 +
 drivers/bus/mhi/host/clients/Makefile              |    1 +
 drivers/bus/mhi/host/clients/sahara/Kconfig        |   15 +
 drivers/bus/mhi/host/clients/sahara/Makefile       |    2 +
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c  |  516 ++++++--
 drivers/bus/mhi/host/pci_generic.c                 |   45 +
 include/linux/mhi.h                                |   17 +
 17 files changed, 1856 insertions(+), 92 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260307-sahara_protocol_new_v2-662854773cf7

Best regards,
-- 
Kishore Batta <kishore.batta@oss.qualcomm.com>


