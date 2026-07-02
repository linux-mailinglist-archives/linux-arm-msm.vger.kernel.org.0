Return-Path: <linux-arm-msm+bounces-115970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VbkUAndORmqwQQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:41:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E956F6DAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:41:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B7ruyB3Q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ejJdBgJV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115970-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115970-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57664300909A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78043F4853;
	Thu,  2 Jul 2026 11:40:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF71639060B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:40:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782992431; cv=none; b=n0Si7pA6Sxt15DjpcAcztm9+OwmE2q4dBCnJHsJqUiKcPJ0ZKsNU+l0r1drnQKYNXQYelSn7RU/PRyV7EUkg9KK8x01Jt+WiKs9pnU7mAHvIPYUCRh3NZy09LUvbyRAte/lVmDYCteXEBJaHCjBre1j2NmzuluQP/h2p4B0XFFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782992431; c=relaxed/simple;
	bh=rxVj/vvwaxds35WEArKsMNNovFjxZLBmNDBIcqLcnFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZA4ILgWE5I9Fz3YgPvh6rFZF/2urMwYUp5JX0zMTluAACBivaht2AyXQbfVRguggjMSo6mkdTq0P96j8ICPAPUKrFzP7YFThMga5n+eLRxZDTDroS4AgciOnZo6pkJ5igJveEFHJXMDu4l3n1WUf+K7IrsiuiPG+aAKOMbnnEZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7ruyB3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejJdBgJV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628Q82Y3009480
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 11:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H3bu6ibEoY59IRv78b5wDQ
	5NOOSP9WSl7ibhdDRfAJQ=; b=B7ruyB3QnbJPwwy/h9HfuezV1cbidsC0jz0FOe
	qbj2aCE0952bVNrYqHZB94NF6yNMDIwVO0sq5j2G+sTAvRb4qmeqKSCc5KEDk5Xz
	x/3/4APNZMUn/1/AiZXW+Ae2VlhC0/kpsTBl8Xx0jCFENuVgwvJv7hTg8faZWtcW
	vvFC+85Bp6byD2elqzIX7zLEfmTJjiHQMzyeeYTa3C4cTx90jwDtrLU0UT0H+Sql
	Jac1m5Xu5Lk5cJLU4roX6WshC6xzRE0vmVznd8spwDE/jJZM0OeG5Q7JVdaQONpm
	U3E05qiIqg2+9dGgpHgqJIfyqhJpNn/HuPAbCfiMaI38RkAg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rusk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:40:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bdad49fe15so1280864e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782992428; x=1783597228; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H3bu6ibEoY59IRv78b5wDQ5NOOSP9WSl7ibhdDRfAJQ=;
        b=ejJdBgJV6fyv8KEsz0Rt4xQnkxgm/1CL+nxbwZQlnpAwJDymijr04YNiz1Nca2ZpB2
         WVls/w9r1YdQQVZxpm/D3XCBIvrjBYQXjd90VSoHd+TAumAISf5r2FCsxcpML4JKzEL9
         q8cCiQigGkambYGFTYmc8rMKwADELs9vp65UqIBrO6QkP3OkUr6GMN41fdyqEY67kZ52
         AKQuSs964Mdmg/x+WcdNf4jrUEfCPaCxsefSc+9bVaBgqjc98Zu1/r2IzpgGbdEY+wZS
         c+WZgaplVaeWOLZzOMo4jjKgA6kWgA8PTDmNKriE/ZeN+HN6uZYhrlSOHALW72EW2uEI
         bqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782992428; x=1783597228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3bu6ibEoY59IRv78b5wDQ5NOOSP9WSl7ibhdDRfAJQ=;
        b=HiEmlBkfye7CYcD+JVwONzPYn1qaTLYo5yo5bWaPUb5OYb4j/9XprnJukFh30fSX40
         CFSAfgrFr/LupNyalCAwkAFhx9IkzE/RK/0YauALN9kY8dXF+2EsrtdtbghCylTlWt4q
         6mAzRahWxvUOO6JQTn/DtyeBvccoSGIp4Tgy/PjdqEZXtPOzghcBPLNbi7KSxjWBn4VT
         U5bbfWLaehvjtyK6rWaX6H5WQ1v7VliWaNV7OgszxLACceo9UrtQkX8xmrLGjmWW5puQ
         C0Oe3BQpa5OZHtj24FoRWi5aTHO7Gaxy91FEVNGwRDXb2BfrX1grQYl5Ao55TFYF69qS
         PPeg==
X-Gm-Message-State: AOJu0YyLE26lnCPKVCoPIJZxWzkAC0m3hJdg8dZW7JG2o0cHpPmcnIOj
	EwYCHclcvAQMEdxbaYRH0tg9cpvqmQ3zuQAK/TLcHBep5HIlkvCMgvbStgbnZFQxsUk1CUK9l+1
	Wc6fqbm+b1SeGDJE6YrmGvrxoeYmmN8u0V6rkbvQaabK6vuE8JydR17+ivxJtwiiDioGi
X-Gm-Gg: AfdE7cnY2NYxeIVV/Ww9nlanUtSmUxmaLs/kybDb+huV3EE4SQTM4LvXItWyDWrC5Wd
	3JUxgct73KDBkKHmkriFu91jWsYwKQfNfPi1InibE62jcMiPxU+Mof1CLoSglRcHMgKJs1lZgze
	H7yi/8kfi4QdC4HDeGr74hrV4ANpUrS7csMaWHI1mWKPkYl9mfnJH5LnI0ihuutG0iuG4HOjCDN
	iKfHHC3X4SE3sbl0/0Qek7jNWBUV/o+rqiP1WUAWmidSuRghFO2ZEvQd+Dj2gWwqytIwe6wJYXf
	gb5Fog11Ebek0qL1M8OD/D9AMrLpLM6G7/j4baucRfg1KlDxFwgvagYb2JRDU9vqWkDcRoDuyd+
	3WaODuWoDZvzgZW/PUQdJGgEF9roiuEIyzhPe4YVk7OupnsCaIgAg5fzBRvp4kdlSPf+uYbqbPP
	ilzuxjH9tHoomc/8kjdf+f+nsB
X-Received: by 2002:a05:6122:1309:b0:5bd:73b5:6d2b with SMTP id 71dfb90a1353d-5bddf5b6d8amr2563800e0c.8.1782992427909;
        Thu, 02 Jul 2026 04:40:27 -0700 (PDT)
X-Received: by 2002:a05:6122:1309:b0:5bd:73b5:6d2b with SMTP id 71dfb90a1353d-5bddf5b6d8amr2563794e0c.8.1782992427435;
        Thu, 02 Jul 2026 04:40:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec8991affsm626240e87.13.2026.07.02.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:40:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] phy: qcom-qusb2: sort out register layouts
Date: Thu, 02 Jul 2026 14:40:24 +0300
Message-Id: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChORmoC/yXMyw5AMBCF4VeRWWsyKirxKmLR1mAsXDqIRLy7Y
 vnlnPwXCAUmgSq5INDBwvMUkaUJ+MFOPSluo0GjNliiVh2fat3FaZUbRGsK13lLEP9LoDh+rbr
 5LbsbyW9vAO77AZW5HzdtAAAA
X-Change-ID: 20260702-fix-qusb2-3600a65bfcae
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rxVj/vvwaxds35WEArKsMNNovFjxZLBmNDBIcqLcnFs=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGpGTinIF1Qw9izBuGbEvkWm51dtSBA8RnzoByrsga8TnWL3D
 4kBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqRk4pAAoJEIs8ij4CKSjVDHcH/RN8
 4Tun6Rh92Cl6FkNNzqXwnTCrD7IYsLaac9g6udPy0Pigp1xHYCGG1o5Dh/SwFGr3b6fWVfnk6Ha
 SX83sqcNHxubyEBE5swqsYXVzwWk1DX2dbE/5bfmDXn8YmZWt0ulVSCG+57pZV7menw7cYZrUpK
 Dmt+iCjP30UrHJQTcjNFuVNC7pjmqSluOPTDHvmWveD+BglqeLRw8UB7kAAUl6QrD+FdG03gCc2
 uC/tCVqg9mpwWo8p8nAOWgQ8jkYg25BlzDPyQoxwwH+rf8mjtMptgXdeINk8EitavchDR7Fgswa
 dzbfMQsrdIGESnoV6JTwldwuQFgXQ7gUyI8tY1w=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfX9WLAhXxXRmrv
 4i3aYvYY7Oq2nbOiEVbqSVPamyD3HPiZbl67kLclPq27xOaWIOAN/Q8ZHfsm2HRKQn0ZE11K17F
 Lodwt+H1wy1OJAZoLgVDm2CsUWrPcpNrzyG1WjiKYZIVdlBEeUsd5UvrI6nC2XpJCdU3w8rFFSL
 W0DLmeyXahFmHcOOn0s537NsxjwgrgE/X4i4DAPzBhaH6Oq3ANpM06bcPlFk/y2DTsHzlJKZTqC
 ILJjp/ptUd+vLtSSs6NEiq/VXpDPWINf6c1MGiXRAdRBNGjl+lhYVuEhiPULtU9HCVUYnkp9T6c
 051mTiQkYkKdaa6JswLJt3ardbbrtUn1v6wXwxgVHCowdQnd9ZQ3wBWacpuClHfenVCaShaX5Om
 ChIM6626y7M2Ab5v8cbkcbmt90At2fl+EyXeuIJNPwIMp1zjfV+gBmtzplv+8XJXQMj+N9TaJuy
 KyZyOXWIQps5n4+isMg==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a464e2c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6aVneB7_WHSjWlUXUrYA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: PXNAiJRP7jYpZZjFGKE8PyZKRiAT7F4y
X-Proofpoint-ORIG-GUID: PXNAiJRP7jYpZZjFGKE8PyZKRiAT7F4y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfXxlZRdmg0RBTd
 FgwZ+dUq8gTix2jNm1TVeWgCM2hv8dU3J/lqJi2f5/Bp7K2GOLpeJaabUTt4aRiGg0LsdtW7/i+
 yk/d3povACKK/tngZdsxL+pekPIIsaM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115970-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4E956F6DAB

IPQ6018 and MSM8996 use the same register layout, however for historical
reasons ipq6018_regs_layout ended up correctly definig TEST1 register at
0x98 (because platforms using that layout didn't use autoresume), while
msm8996_regs_layout used TEST_CTRL offset (0xb8) for the TEST1 layout
entry. Fix handling of the autoresume register and definitions of those
regs layouts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      phy: qcom-qusb2: don't unrelated bits if autoresume is not used
      phy: qcom-qusb2: fix autoresume handling

 drivers/phy/qualcomm/phy-qcom-qusb2.c | 44 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 23 deletions(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260702-fix-qusb2-3600a65bfcae

Best regards,
--  
With best wishes
Dmitry


