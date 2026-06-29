Return-Path: <linux-arm-msm+bounces-115157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +2PpHruBQmof8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:31:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 817586DC118
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:31:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DKlZFSQp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fWk3KTpy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115157-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115157-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 38658304CC1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B5640F8C4;
	Mon, 29 Jun 2026 14:18:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EABF40DFAF
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742681; cv=none; b=ri79jYCkUdisi87qVCo5CBLaj0cjKo1F1qCEw2EDnl+ZpQbSZAnYgFFicGhjnAaOGesuIIo120YTdmXOnRh2qVb9hJqtCOssy7oxTvjtj7K5b3SfwAXt/+0KvNwt2Ki9+x0HaLM0slNkNxxaD+QSxrt2cEtFdNhzgJz/05FM59U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742681; c=relaxed/simple;
	bh=RwX+K8C46oKT48+bKwY9V8SLx5EwQufrMDk4Ou+dU90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/L12aZYLmlMFALAGuiLN0OXr3yhdJpbgQAJzlPI2TMuKgXl2I4hYwHhhy0EopcZ/cegNfL2rTioHH7vjSaUDxVSR3ywfYSV3Mw+yHELY/o/vyPL0zCBBiJ8ZjjZIIqrxY/93kog+OPhN8nrP23HS6exuB81JM/1YRcC3DOGqVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKlZFSQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fWk3KTpy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASwb22603482
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xwo+H0V3F377c3YnxLS1addMMj32jwG2R6r
	HtO4OZNw=; b=DKlZFSQpIdYwCi+hWfyj310PmbfKLlKEz+YBVm5W7Vd/4jv3FUY
	oeyxQ122wrpezPUTbQ2bS6sXd54AAU1YGQsBWumpe+6GbGpv2lR1Nq3JRGSTCRIR
	WFrxmdvZNSDVYFszNJo8aMleUowCudlz+WiBxnOt6RweHf+nj7HEo5OsQ7xY9aH+
	j/Wiqtc1/FGD3eJ6hWBcT9Nr0MXVnfTpwTH7K0axqtKDsJzyCRApDga6j+ve59c7
	te1IrjyoBvCbAEdwQdjPanLmOuEGm+gbvK+cOPjJrjox/CsrdJ/3gNEIF3sNURS6
	ghO5ynR3Q5NPfAvVr9SHARMgw8qS9/rgayA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq897ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:59 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9c8c8e5cfso1339843a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742679; x=1783347479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xwo+H0V3F377c3YnxLS1addMMj32jwG2R6rHtO4OZNw=;
        b=fWk3KTpy3iSOaoyoCrTqbRpVkKEo1aJLehnUmhow9BnCqTPuf22LY64UdUOG+FTc/E
         1kc7StVaUiAQJFrT+bxaQclatXITlTLGk8GKrDQf8mJVnMPXtUUUbvh5v0b8of3t+zTx
         3CJX5gbTBNq+NruWzvknmyvww450+65bf9Y4o+sphrbArmHtEPx4qOnwh3iWLrPIEuuq
         bvFdFY7DQsS0XeZHtaCEH/g2c9z4qpn+pw2qhSY4/ZToQL8DLPxWafbqdTjUSCoKyPed
         X7HJVQ+lY7FBPCHGLTJ/h5w2+3kl+yIWcjoMo6CenTWvTYitsm1RppMvbU1TkrMLnTb1
         PcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742679; x=1783347479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xwo+H0V3F377c3YnxLS1addMMj32jwG2R6rHtO4OZNw=;
        b=nCOELOGRvisgSqT2UF91Sd5AWGr5SbDHT2D3vvmOrxrNaKTwEPdjcns+fLXU5gMz8l
         fP2iJ0bHhlTWP1z0g72rFt3lPfhCVLrwx/3jPDnO2jVFcQnj+CdJczxzJR3j+VNX5phW
         HVSvJJGXn8xo2lMolSaoMYMIXRt0TIpCs0bL0HdhdKMAV6oaOpRYZysCKH15WjUe+iNs
         QKAwrHei5BZpsFMpd+0j2IdwI/kvGXhmjMMPmvCM8+V9ZQeUs1u7K3gJVn/kxvaV35+E
         L7KCKl92QHKS4H40IHt4MMG7fMT/98X5o1fNmqV1vn0Hlw72lOUniW1zZwrMmgd2rklu
         o0Gg==
X-Gm-Message-State: AOJu0YzPueC1CAXIq/DLHG2C2R9811PUxmIzuqeh8CfXnG0DB1BXCpMs
	0g3iJGEyR1NWFFTzwwhvFdbAkPZ+tmeMloRmsfGIp5VjjYPzP+sn9hwLsyHQPKKALq9Pv4pQssw
	aOYx94XAeWapzsPhzBrYEaTeD/kiaQ2r5Cm6lIWqrn5bjliy+gSRDAqMemETXOx+nURKw
X-Gm-Gg: AfdE7cnwRIoCAYc+IuNqofZdyogkV/wM2yP1nRQkdQmPvm1atF9r7vtgv58lYtXKxct
	cisYWODRN/2dswfSw44DyeuAtJYLGXtUGyFHMdH+jkHlwdZ/8pTM6p8c5RFdq69Db0UjAJYOIh6
	zf8dJqBeldvj236yaeZttX0ilqrslnKQQk4Iykwpd6vXKcGyCaEI13da8SEv8EaIFZQ9dClilug
	LxVhhhKNHHPVch8c+dKPGVe99kdq573MvtIfO2XvP3KtBdToQNcTuTtRj9J8BilngMfSmN21wwh
	vjWRwwjXdzLo2rJNRI3FCgeOITqPQjt4oaRltL+aEQjn/kQm1v0R4Sx42rJj80LEICbNFxr/C2x
	ci0vFmgJC7nN/PfAZ0kruE/ejvD7AVid87aunww==
X-Received: by 2002:a05:6830:3499:b0:7e9:e860:6f3 with SMTP id 46e09a7af769-7e9e8600884mr663408a34.32.1782742678634;
        Mon, 29 Jun 2026 07:17:58 -0700 (PDT)
X-Received: by 2002:a05:6830:3499:b0:7e9:e860:6f3 with SMTP id 46e09a7af769-7e9e8600884mr663386a34.32.1782742678093;
        Mon, 29 Jun 2026 07:17:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9e8228746sm647612a34.20.2026.06.29.07.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:17:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Misc. SCM driver fixes
Date: Mon, 29 Jun 2026 19:47:47 +0530
Message-ID: <20260629141750.996853-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sYR9vPX9npFKM3YA87izMzYy8RyvYQJZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX4enKWQ7eMosy
 Ra2rkp5wFULWTN9WwbrC13ZzlMwCimuwijKjMSA37kKETukiFxg2MNObq3VN1ao4YOrpuowj4oq
 jNfsVdM++V63KmNKYLz6mJqCfpdZUt8=
X-Proofpoint-ORIG-GUID: sYR9vPX9npFKM3YA87izMzYy8RyvYQJZ
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a427e97 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zsaj220iB9cvvxWylpsA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX0atka73oepjm
 PL7JWSs72ZFxO+0Udg4HEXFov0F/IIezBu7BIHTtzvaj1BGMQDPQO4g2ybcqtcXrBR/L7sfimKC
 SNjgjyg25EaajYvr6yo0hK3rphGKbkGJEjT/Ghd9uXKl5SKz7Mi+iaTMXCx7kziWEht5s8bpkse
 /Rqud8bzmLpcDouMeFJLglJDRjPT8Z1sfivISdsIXJ0/93t/aY4uCBd73ZjVMSTMs7OGAr8xj9w
 QSwL982oyKpZqDRq4eAPmo9I6G+U3sr+ddao5eintKrxRZj7vLr336eEw4yawiMSlDymBTzlY/W
 gTAR5LOjchbU180lldnptnenY36dXY6UK3tHTg9PjbkdLzNoMsnpr9Rbx9VxkURzZReMeUSY4EG
 AT5tEDzSZGHIj+kwbnJEAvsXbC/X/Q65fHNMhbZGx2gvxBsX1A13O2vHXUqAsdcLQESY4c0BS8+
 HzxueyUjuJJ5rwdLEjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115157-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux@gurudas.dev,m:sibi.sankar@oss.qualcomm.com,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 817586DC118

Some of the existing issue reported by Sasiko mentioned here

https://lore.kernel.org/all/20260624192213.C82691F000E9@smtp.kernel.org/

https://lore.kernel.org/all/20260624192418.92B761F000E9@smtp.kernel.org/

and the series is about addressing them.


Changes in v2: https://lore.kernel.org/lkml/20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com/
 - Separated the fixes(2/3, 3/3) as per review.
 - Added 1/3 as new patch.

Mukesh Ojha (3):
  firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm
    is published
  firmware: qcom: scm: Fix reserved memory cleanup on probe failure
  firmware: qcom: scm: Fix tzmem state on probe retry

 drivers/firmware/qcom/qcom_scm-smc.c |  2 +-
 drivers/firmware/qcom/qcom_scm.c     | 43 ++++++++++++++++------------
 drivers/firmware/qcom/qcom_scm.h     |  2 +-
 drivers/firmware/qcom/qcom_tzmem.c   | 13 ++++++---
 4 files changed, 36 insertions(+), 24 deletions(-)

-- 
2.53.0


