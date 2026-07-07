Return-Path: <linux-arm-msm+bounces-117427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zH0/IoR+TWpu1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:32:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1891E72018C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:32:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ME1QU8q4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HanCJcmt;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117427-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117427-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 226933028361
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615F0480DCB;
	Tue,  7 Jul 2026 22:30:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021E34C956C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:30:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463425; cv=none; b=tXn7yNAag3FivMgyF1ZJsRyf/+ZZaPfqv5rsbiL3T7hMju09npgaX3p7ICbdHvvPxYA15/7U7D9eYF1ZPq0DOB2ln89BImfl2CbPABDKovO2IeUtw06da3gBhEvAZT79aMboooadEOjwp96Q91cY1AA0mar6rDkbTFYs7auH8RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463425; c=relaxed/simple;
	bh=p/LOewU4HM57xRHatWVxjBN/11NXUxDntkVtHhHnu9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jPppG5UuJqQVWjTqxpsoIk25L94P/TKhZGalxySO1TrPqKquNo68y91KqHc+mV+x8y20uTxsv6RjpJoVYUvsCM0ByPBUCCgnRR1aN7vPU7EzwFV22ot46WwyqcuZa6ycp5I2CYUkqpvJPhC2ioz38f01nsobv2IWH7SOXDsOfI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ME1QU8q4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HanCJcmt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5MGm341629
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSFYY1NUdhh/cah7gXpWItwODtYkskUZKQCjJtgwtIU=; b=ME1QU8q4eLcaessS
	Az0OOXu96wbWYa4PGt6RBRb6sOQca7wtsZCzOqCABvWcr3oQpjAeecaKGXFp/QHo
	QgVszdtSKWuQMFLLtunUQKGRFfFIjSsvNkDL0BAltY4Eeq3f7lWak1p1n2Cu7TcC
	62BoJKGgXIiQYUuuvscuwcr/9J1fBSCH4Zhhe/skPgBbfdb9uidHB417DOFHhY/c
	9DMU8M336/znVwbNWEBN/7x4Ku2pu5zJGvnbG2/sBwoITnv1gUBnN7A+D+/KxJPX
	fHQ2gyVk93sTXxRGWdNUsGtEkBfQGi4lNC5QLyiyF2fMqLp02d34z6ZGbXJ3FK45
	+6XRgA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2ubvc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:30:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7390c789e4cso43077137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463421; x=1784068221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSFYY1NUdhh/cah7gXpWItwODtYkskUZKQCjJtgwtIU=;
        b=HanCJcmtye0/2sXDg3GITi8siZJyVXAqP7Q3l0WGZNVaxwZBYDZUpvelJ/ZSgdB4N2
         wE45ZL6QPSB9dnN6NioxTtb3ZKhzNIHQAbcW92QanqT6avQkNeby/57dxDFs3ICjrHZn
         DkcqNrRkT+H4SZe2vR3YiZBSWHoJuPx/IrZ90saqxvoVtaEG8a84TL7npwcVrWwaC8Em
         P7d1GUcM5ZC1u5ZAMWldDfAfCYMiZtfprM7+lsWL0DDKVDAri6e87aBFpgxkkrhXLGbl
         FTSbXCMX0/BxYgxHT75Py0NtDYCYOpdfrbG/s8TT6tZmflFiD8ffkE7GVak3d69bV698
         TeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463421; x=1784068221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSFYY1NUdhh/cah7gXpWItwODtYkskUZKQCjJtgwtIU=;
        b=Omo56nixWX7839pEof1CNbPjNQgXam9P6mDtBnqBZLPXKxHOAvX1BnywsIovunfD3i
         oPUFzuMqB7ePScODyeh/P6gZlgcEI8RmS9CQ8O+gxKTU7uqAeJgxi+AjS6qb229l0Cw7
         Fl7XQSZ1OJ+QKn6Tiuettb//ATrisVlABpd3Re4bMifVE0EC8WoVmFM7N+EPJjYWr9z0
         dEn9ivjG2CQ9Nys/Bgow+PO0TJd4l0FLh++35dqpimiVR2L68ZbBpdpOVGEoHJz39XkV
         Se8Ecd6l1JojE4M1zvuM/y82Z+wwyM6tkGJt9LKs8YuGICYpAciTTYJonkJVOi6cH0Xc
         XOVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod/02UBA0onDbp2DuC9JLW5Apg1djvIh56lhvouJzUGTjOIc8Im9VhXki/SvpcfjN8S/JHJu+bbIg5lj7F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7sX4fJtH0JMjAff7CdLlFm80YbuOKm3rXRPJbtMhZBrAaTE11
	nTKzxKqmK+nZeQ9mz9E2jEWRKAcfZUICuXjfAzhmErh2VP/o8tXXZO/k5iX9w+TELj6CFqqBnB7
	7CHwOWBRfzVuBsKNAWGsFgkOavb7tq1dI+zkWntkoagG3TS9ZeJKNtJAEOsgxt+GnlkAL
X-Gm-Gg: AfdE7cliKwU9kDjeIEksqVoXJWAzc7yTj3cYcyvPu9uKwDF1IetD/Wxn5XVnf9R2Whq
	vyYX+XefGiZ9zQ7Uln9dEHD4ISTH2MrLrVlQw3i94AXF4rJM+yBoH9O4TnVgrapa21NuBH75uC8
	Rv6vDRPGspkBl28ZwmqE2QAqDMmV7GTYhV8B0/MrbSnxCQarj3Zgbzqy2cXhLyOteYuv5w2JlDo
	vuYAIkOzXY2tdEE8CzZThGMwb1ZVyttYb8s77DsOQkcGeqFgRYqJltL3X9V4M8K8QhrPM10Y0/0
	Q6M5kiHsINqYm9ntfi+2SZu0RUVperYEVnF7Htb22VZhRmLiC9a7fHDdgc96r13LSgvUFxgnmOL
	HCkePo3Gf/Islhs2ZdXwADe4bdFoxjC5nh3dbzqos0rXNfAIa95HjQ5+Q1aKl3SNo4SEdtj0Ulk
	pBc1DyRdXxJwGcw8lTFSll2oYZ
X-Received: by 2002:a05:6102:914:b0:633:d7ec:153c with SMTP id ada2fe7eead31-744b7b48488mr4747038137.3.1783463421501;
        Tue, 07 Jul 2026 15:30:21 -0700 (PDT)
X-Received: by 2002:a05:6102:914:b0:633:d7ec:153c with SMTP id ada2fe7eead31-744b7b48488mr4747009137.3.1783463421073;
        Tue, 07 Jul 2026 15:30:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:30:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:29:01 +0300
Subject: [PATCH v6 18/18] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-18-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p/LOewU4HM57xRHatWVxjBN/11NXUxDntkVtHhHnu9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2rTQpQBBYFFqiGAUi+BUKhPXN8E8Y1WviYU
 LLnI9gJoU2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qwAKCRCLPIo+Aiko
 1auHB/9i7uOFW7TTC4aUhG7RzrG9W44Uj4yNxgGCLPCnkES9ZoZ3lVwkwZ7aejvxWvJH0YCPxcg
 vR9nQW4dHF+QmBRh1H1PcrPO/zOoRe6Vx96X1KBdIcFCaR9lW+h3aLyVC4cI24diOkJRSfJ96ns
 Uiy8ZNo8TML5PsD/4bVhAkPFmLm+AzgH9ynDe8QiF3v5nWQ6tN0qMbTLnG+MjwNfeMhDx66WvRj
 xzdkxCyHqIGAaCCy7N6+8mrcim8mXC9r+Zo0ZmxmVpnHKSxaRUGMmw+OpCpfMH9pk/oXXOjgksL
 8OSz3FtRoYoWB+h7IaIEfQCmkQr/XsJRqhJD4D+Wxi3UD6s2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX1hfoXdaUg3bB
 4b01pUFmvTeURxUokxRx3Z6jgV7YRhE5hQtB2+U25btck5GOmpluNo8AzMZzmpIDTQh4uCrax/j
 GICghly1QQiLj2vJ50suQ1KaeFfSAC0=
X-Proofpoint-GUID: 5VRGAenYkDXTxM0ZuNLpO7PVSiq7XLej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX92uXdEQv2Ydl
 vnCmWZAinWw9mtsYBKQac8+ureYTTuVj53jRhU3RTRqg0W7ld0EqF3JIEIk0gfHBITtsKIYF3Aa
 qAy+EjmPkyADwiGUSG1kl5e3uqpexZk1ojL4OHqFEBngdGGKfA1CGjFewtzTGgsxo9eNRclMC8E
 Sj7KOyku5juo2ewaMl35UereM+kwnlnOBk4Wml15WLJTslrFNBCrgxTpqYGDbqtfOKI1/I/sqJ/
 KezSlK/M+wn/xJ6mUCCVG/zxryiV7Syw2pfKEa5ZyZjpDWpHwAp3MxYa7Q2+XseciNRiqms1do8
 iSAWs1/WkEaPNzhrMROypbJY+A5go3yo1N7hx2ifyRjRjhAWB7xp5Hc+K045vK1LOu0h62VI2Ou
 t4lFMOIe2n9gD5yGME109lqNuXroGqfOXLP9lYU8/Wv2Z30KuKyG302HViB/TsS3KmRpUw688om
 RTbxifeFe+ebtTcUksQ==
X-Proofpoint-ORIG-GUID: 5VRGAenYkDXTxM0ZuNLpO7PVSiq7XLej
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4d7dfe cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117427-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1891E72018C

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 4e2f1804ca66..ce73e0efed50 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3


