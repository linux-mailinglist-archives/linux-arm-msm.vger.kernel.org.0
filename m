Return-Path: <linux-arm-msm+bounces-117926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g9/LNHhmT2oGgAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:14:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB072EC5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:14:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R1QgMuDd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ePio/xTe";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117926-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117926-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EFCB305A48F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 09:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE2F402B87;
	Thu,  9 Jul 2026 09:12:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175B03FF8BE
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 09:12:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588345; cv=none; b=VlCpT4IKiH7A5OcZAprK5HWT/UWl/W71QjZFkeBZh/lqpudzpLX/zdPPmj01wi9ywFB0KAHb94cPXoB9ysA7gqpePRnY5mgGtYQBMuKWtz5w3LwHdBLK+/xwR6Gc+A05mnPoG3a5ocnDHyCgQGkOaMWP/QrhKTpo6TYtzXWSQ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588345; c=relaxed/simple;
	bh=r0iXaQT/3Ce8ilcGsWZbADm/m41wg6HDX7QrVE7Zhac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Tqv9TRXt6/5vqItnJSXkKn+Z1N+jtvKN02ZCCMIgzlVqAoEEkd58fy/fY27LoZUJ1XTTi8Ci2vs1OkLPInGyRMy5n8wRMV2p6U8UEN92ZdHHo9NFnK66z5SiOtDBvyd1cDRQU30HNTm1zUJrpRc9ZeecvkqAS7LkIhAK3VPoxoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1QgMuDd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePio/xTe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6695xv0i710658
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 09:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UO+aIIshUmbb+08s6VrlY4
	7iK0/DlpQNt2mFjVN0azI=; b=R1QgMuDdUz/tZirFCd1wytMVrf+/kwpqti+vq1
	RO82/Gv2olT2BuAaDveZM8bHi/s+Grjy7E/LIqHpQ400ZwiKJUIwgoVrqKfrddSb
	B9qZaxji2QDxS6brliVZY9Iscb/k7O0Rkg3t68ScoICXOelkGjH9jjJ8om45EDfB
	wrTZMvz8n8zXzSLtRjn4Kce5y4DecJ3uBVfMa5Yuyl1LRtW5QonQCfwNNTVXiQ0y
	FvfISkE5u6ZTsU4ECeQ1Z47aqEJeeqs74dU/PZkqOs4MBA6YJ6ia+i0DZXyc/N53
	uxdn3gwvUPhkclPSOmqlHNVASs/TXooZv8bEEDgCQpdqaRmw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vh0th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 09:12:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f45dde7595so20239016d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783588340; x=1784193140; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UO+aIIshUmbb+08s6VrlY47iK0/DlpQNt2mFjVN0azI=;
        b=ePio/xTe8eiJkLZdy/1UGqek8hZb+UPZ5uU9mO4mcXZu0ZBGoMd1lZaYQXQysUZRE8
         pEDKAQXsXdUbJUEi0TMEZG8fMm2fQTickkGVsKD+7JYBezhNdnWy2lW6W5oxVoGFgzoG
         pRGACI0GqjFOtLjRh8hcnJEv5Gx32NFjnq3Lf+/2g5IXxDZHiwb/xYtY3ZxL4fRKSdcv
         NRzT34HXsCh+shMeB9CQrttxruVqUk5zOpWZ8rcXEeno3bXd4PPwR5qv4gusRoiHP4QV
         0EvcgkeYHjiKnPKhpww3YWuUwrJ/Ibex8mGGy1jHo1m2AJ/zKs2D48oRlZBlbDXfbEJx
         aOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783588340; x=1784193140;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UO+aIIshUmbb+08s6VrlY47iK0/DlpQNt2mFjVN0azI=;
        b=cxLMFk3t48H8bdB85WDCruBCoKkpXBR4pnLboug3UeRFE+Qqvda/jvEMqj1fhUiwxP
         MR/OXPXBSFQlQBZEAcUi28BdNHVBuIXyyh4hS9+GFeqc/faKFkWUbbkoUN/OJywcnqaW
         BcqFCBjFP0q3R+bMfpFitmyW/B3J5BCBVXBhkJGOzlFVd7InzgZzTDGElarui0TQxzkg
         NpiC8NXh6sKfE09ZI1qbtPeCszwYtpXwQgYxqQ86AYTgVtejrwxo0ZUHMDlG9b1vdTK7
         f1osP4TX/oRdHNTxd+12zgYQAJ1pRbJsiVsX9IbBDidlbw2ssWzUZ++/OIxenCrX7U6O
         6gbw==
X-Forwarded-Encrypted: i=1; AHgh+RplUSOUaQHju7C8lGxQIDWfrMxjNTmLUMkAbfKBeaXVu1J++Cv/RmfASV416OEHMVCYa4FMAPnLiNOpE2+k@vger.kernel.org
X-Gm-Message-State: AOJu0YyJR2/gOvanYpAdotMlmnfDDm0C9hHvXXHvdqa9DqmasJqQnK3K
	iKUtZROz2wSvRdmROb/gmRgN5gjC1I4YgnHDbeKNflBpN53FEU5wnB+KkqfDu3gar25fHsEVfSL
	FGYVkmcKetPvsi1nCvrQwR/yCS1A+Q6rwConBtI6Qdrq2f/zmefEYZI41+aG8KXSi5T4U
X-Gm-Gg: AfdE7cnfvnNr8gRH1zFoJkfpk01/pRmxmyyRZTheeR3fjKDHZJm1WqzWA0gNUth2O3M
	jbLWhEdI6YtrQtfY41St3bXe4yv42Ue1onLV2nCPeaA+w6nOb/OKrAL3Mvro6jKXnv1ljDh/+h2
	64zRKPPOIxdq2+5t/Qp1BkPkqm/+J0l4TMVXzSdgqf9oMCeEpxbscBTShjQpC4wSiqoy3P2aKXq
	fgBCCSZEjZFiDhl6W9ok9RojF9AGUGU6/x0byzSSBz6695Hk5m7iugXMDVqLNxJM95TRTd7/aJ7
	oZSTweaCom0HNZ+Na8NRFddM5QMY2WsMIJOdj8M21q6OIV466L05iKsP6UEUNHbnDFoqhF6VtAr
	Ab5eA7wwjk9/KPdw=
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:1201 with SMTP id d75a77b69052e-51c8b44bed0mr65106371cf.79.1783588339638;
        Thu, 09 Jul 2026 02:12:19 -0700 (PDT)
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:1201 with SMTP id d75a77b69052e-51c8b44bed0mr65106091cf.79.1783588339011;
        Thu, 09 Jul 2026 02:12:19 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb70a372sm46624575e9.7.2026.07.09.02.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:12:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 12:12:11 +0300
Subject: [PATCH] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by
 default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOplT2oC/yXNQQ6CMBBA0auQWTtJKYkEr2JcdNoBx2CBTiFGw
 t2tunyb/3dQTsIKl2qHxJuoTLGgPlXg7y4OjBKKwRp7Nq3pMGTFxU9P5FHeDjk6GhmXdd4arDV
 jT43xgclRZ6FU5sS9vH6H6+1vXenBPn+zcBwfATL3fIMAAAA=
X-Change-ID: 20260709-dts-qcom-eliza-enable-qupv3-1st-fb30cdebab92
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=r0iXaQT/3Ce8ilcGsWZbADm/m41wg6HDX7QrVE7Zhac=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqT2XtXXBLjsU/4gqxqg3mqkCZjw8uxPYYO3eKE
 Xj5szOIL+SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCak9l7QAKCRAbX0TJAJUV
 VrzmEACL5hWuVzFfxqXz9oqyWdnErWtC22Ox/B0LJ9xQQHR1Op4gmgp3q5X1Mrcb5ym8UlVH1J5
 nJhI0H1Q+LC6NJ22LY65I39n5Sl6nlWkyJFJwYfMeyrp84o2uO0uriQqmolQK/atwfv8vNl+CEV
 2a78GUcOHQ90GZaRsT/bPTIab6aAga1+iDv4vYKk0GP9KOer7ncjAPhqIzuJdqvIi0+Ow9EktBB
 pObvZ1OGAEBzRJ1NJwJE5Rr4rY0pueUudV5IdtzUxCrmFxXpZR4KycsHmXo1DeP+OwAWYqNcNMO
 M+Wn7k7YL1c9lqm8Fm92MpFK9i0J4yPN9wNkN1UEHMSeX8AZ805A0EK0UV/FyYF6MbFjjo6ij+a
 EYq0jDRmvhfqJjM91ayXxCveHo6xhFNvlIyQicsNfuqNDwW96BrrLB9He4c9rQah7ukMhLy7NAp
 PdcN7QW7VzTLaRo6sAKb/6yZTkSWwTa4WeWkOglnRtVK7EOofO7C6u5MPkzxCD7Z0lCtGgHf6US
 hS+TGUH0UPwEJJRgkjSP/yLzPjdxSDmOjCcJobrmaxqHPPbGVWSWSFZ044xFFWFByeuJE1Ag2tb
 53IyOKUUpDWo0ylanShuF9w9VB8+AeSAteR90ACU3lkRa2JlxUGPHk94VjHM5hKQhjysysnAN11
 cECXJCSLKxloi9w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4NyBTYWx0ZWRfX80APo4posN0D
 oUgfVFSabMPjHUKziZmOmvgBH9V+dFH5jCRf4roUvafMn3B6+ekxD1o5kASR/jdraE52he30NBf
 xCN0oD/4C8c5BpYoTEoyHQdxFKjfW+RZmHOxhnVB7nRKotOkl3iqm5i2wmR+tXYtx+53U9xr8GE
 uYPosjSz03d1wQOUSJbaHOqaK28/pwBvF7qIjEih6cSnjfiqv7rKOqIoNCHClMXg5e8SVQysPN3
 xgb6eooOoHhkHbhhQlZmQo4FaC+GPsj2S0xsiZLBssYRc7oroUjkBDSISS/OtwNzuasW6Zc4Bv6
 XmRJmA0Xsf4rB/G9Qeskgiu/ZWIFAaI2GYyYArMrtD/czdtFFs6aLGae22QhhRhtWb7c71ekxIc
 CF+Z55iWVdQhPq7oqG/bCS8qsU9nBm4iqO/UMfP9nP6UOJoCbPXx03qsSMTf3wFCQqIS82JYS1J
 GwFJW9oDYRINC9sM/TQ==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f65f4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rsU_kau4JR0LAa4guoIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4NyBTYWx0ZWRfX0V1/jdalZKGF
 UbrwEu+nzw+YY2urZEjGPIY/ZTy3mltQaz85xPkL1jzk903FSqjt0olt8XM1oH9v/Cw0T8A2vDE
 Bc06H3YRrYScZJ8UcEmAf2zrtdg3enM=
X-Proofpoint-ORIG-GUID: E0fAGlxMBLaZ2qYaNSzRyKgVg_5EyNKI
X-Proofpoint-GUID: E0fAGlxMBLaZ2qYaNSzRyKgVg_5EyNKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117926-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BCB072EC5E

Since each serial engine will be enabled as needed in each board dts,
there is no point of disabling the first QUPv3 wrapper in SoC dtsi.

So enable it by default. This is also now in line with the other SoCs, and
also with the second QUPv3 wrapper.

Fixes: 844807e1f89d ("arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e..8821d224a213 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1232,8 +1232,6 @@ qupv3_1: geniqup@ac0000 {
 			#size-cells = <2>;
 			ranges;
 
-			status = "disabled";
-
 			i2c0: i2c@a80000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00a80000 0x0 0x4000>;

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260709-dts-qcom-eliza-enable-qupv3-1st-fb30cdebab92

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


