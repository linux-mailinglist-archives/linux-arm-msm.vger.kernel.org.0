Return-Path: <linux-arm-msm+bounces-117417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6v9SNyd+TWpH1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:31:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5904E72013F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:31:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QYA+0R5+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ci18rjcn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117417-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117417-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 58EC13012C42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376AD480951;
	Tue,  7 Jul 2026 22:29:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8781148B374
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:29:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463383; cv=none; b=pU6QmjJwozXinE0UVbhyPKTvaVA9Y4FvTc6ktBuRIYou33p8CSp4ekTVJdTEzWHLTzk4n/Nt2vMjGSkOtclkMM12vj4tOwIeo99U1O/Nm9oFCL3JWa6v+GcVFgxRNOrdeBCdIUAllCz1jUgOLQ2whQTnyrOrDwAd52gzNBI6B0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463383; c=relaxed/simple;
	bh=cPTXXI3mknLotK+Tb+V1ad85mR3WKey4eZTl/ep3O08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbc1JE4t6hlPWWaUhN/i9NeW0rQE0aHb90qrrjbpkRavU5ij41ek74LfY5b/jXIEF6AelSZ25qVfU2AtUj6vCiunhakSvtdfgkMtpGhiALhCyesBCJDmS4tseMJVolNrVTCR8VeXpI6kn/P/Yl46bDMTXU5LrwDDZZjBfsNUR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYA+0R5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ci18rjcn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5EGk356867
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=; b=QYA+0R5+AZyM2zAu
	AeMCOgUoC/FzRKnxLrvU/u00jZvuY7EiXDYJWP11lfNNI0kyuS8GELIiI3zDfK7K
	OvQa/+j8gaoB93l3XAOdeQlXMX4/aCQvHBLDBPvVNB7nStA+C7c/8J/KbaELdyv9
	gI2fBwGv/v01u7QU6ywj42y1fcfvVsLw9Sa7gunNBHShnXfbd5umuLhCTF20nmZK
	Vk4tT8WqG/Jc+o5ApCcW3lM9OvIaaPterMuNtmaHphJ+ssJPmRNK5bVAmXBONK/z
	MwLVRYR79VPCAoNqeupB+9UVzY4ptGpOXyQDuKV1jesZqHa5WCLDL1kUUMZDPBPw
	jB161Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8me4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:29:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737f663b020so8457137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463380; x=1784068180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=ci18rjcnole5WjMtOogGWIHn4yUryWgqu8G49QZiaWwoWcojFuwBUua2wWsElUPxxi
         In98CBv3qZBnOpb0+ZKIIrG9zmi9ksYEuZbyFwPIo1DFRmrDQh/QZkiuy1bkdCoWjIqB
         GAxHNgXrSK7G90r1OT8yhlrb3S5iMa8NhfAiQICXU3HzPHBe7UDsfkd7dM6ekdQkcOb1
         7CBhhwlh4BVSIvdxkt3PdIq31i/3WnPiEvaiwb2LE2cdKBjPN1bGdGoUuHytF5k79Auo
         /wZpza8eo617T5+gP3ZQcUEqHPgBA8whuqInxNjWZyeks2DUyvU0cux+FRAVJdgLa44x
         Y/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463380; x=1784068180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=OjUpWGH+XulAP6u/L7bTus7rcGUPEMChHDailLpO9cdMCKxVo7z2sckzOpb9vu9ask
         84ny89Gk3dX4IELIwO7z7MdCxdzbzVkQGHeE5QVPs3XUKHvfZQ5wAdGUJc3lLmKrTZ8H
         2ZSSURPl8CPCUzLzsYtI5+Fbcv5D/LKUmcROTs9ZnbN0Wv0nvt9+qAtW57GgxDmUJT4t
         Tgye7RVHmeSuCmfNQ6mCSd/7NnhDKQ3BNOBs8bAYdwFnCBBjyr5kAib1GSWw6xPkpyz2
         DPKsNq0roNcezdwlE6+aiVpGZZKXkE/JbDuhaOnjXXRECi1Puj3QCnl7NQ+jfIgGGjFb
         MjVA==
X-Forwarded-Encrypted: i=1; AHgh+RoUaMzxvtRLS13hMoVVHX79cxqmJvqOXLomEVke6ea74/mq1bGPngSlz8DCuTP7vhJPCuOIg+5gKGU1UGhS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9iJ9PfokysUuNbeJtDCS8q6SJwNeMYFpwPFG6MkP12wyOPx8t
	gkSE6hXQ9YkjzBHmHSiA3n/xE498BuU0gPxxpU6Gv+Gs56ibWMFugs4lK57Mvg1xvQSHipzibiy
	nBvPl+sBRr1ith+asH0cXWgRne4JIn+65RAbYuNIjOP5Ip4IwZBBLsHV20v+LHHfa/XjS
X-Gm-Gg: AfdE7ckM5Cn/lQa90AKyZhBahhtddGeb1GROCv4jentjN9zRX+aC9fT7doRJRky9ziO
	xEr1PFr935jD93LwQbs5wI/1R2rzYlTugG5UV2igJCS6ORq+LChGl8aKpBodrCNvlKRdiDIXuTv
	dJpsgK3f68mBwdj67kwcxL4T9LMJ4HVMRkFOt9uNQjth7XOVsKRwJV7PFPqFxP8Vz1EY6ZeVA7B
	bv9t8EQrLjM367DQuNqOOiD9+MD0URzt0nBwqikVdmDFJoK6pUqRu0AZB0OvgZmdlZidBcYvNgS
	ouZpVj6XmS24F2xUCvxWm8/7BAIMKX46xWv+i98gDKaUy9rhiuBd0e8OvSvybGFDOUFvW9w12nK
	NsC8iAz5tVH5hmCuq+s6TodL+bawz9M1/LKDJmx6MBHiWkasKdeqxmG3WhZX4IfUjQzrK0Cvx96
	GRv6ZsTqn4GFwDZEWEtUHSs0Ww
X-Received: by 2002:a05:6102:5487:b0:738:ff1b:942 with SMTP id ada2fe7eead31-744b7e3e572mr3982544137.22.1783463379791;
        Tue, 07 Jul 2026 15:29:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5487:b0:738:ff1b:942 with SMTP id ada2fe7eead31-744b7e3e572mr3982523137.22.1783463379338;
        Tue, 07 Jul 2026 15:29:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:51 +0300
Subject: [PATCH v6 08/18] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-8-374f0a46c23b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KKYwQvV6HfPLmLckhIvkwX1DNxqvTV0Ag1veh8Tp1rA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5Zv7co/5WeM+BnP+jsklzWfXXH/nE6cV1RUtJfUk24WH
 V5NvvudjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiIlxoHw8J7q0ItDh1q4VdK
 PvxoHUeVYRmDmGH+Oie+G/rcKflv172asb3y43Lm7rliD5/utPFSv6y6ilVQOuVj2+PS5wkVr6Z
 4tzN9q6tm9djRYGwj/lxJSGP7Sa01f7/4ras5fvucT/r/dL0dChyt7bVZ3p4MTWWGTxdfDnNYv3
 rT1gq7eR1dH1+pXUivFclfzHSYrfNfNBtLhMwV9/Wdmx5Nb37Wr7pznanYyfAZVyxKTosorUy6+
 /fFd61qTpvS5KwPnzqUC2ILTHZsmBbbnO317pcF89kdZt5h0UdNrx6uz5W4/nDzNfnAh+kHLllZ
 finwE5OfdUdrX7Dr/A8p8/+7vXlXVq3IzDjJPyDr4qd9AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX8+uDlbM9O2gV
 8/z7swX/2oz6VlGK1ErsZxhxrkc9kvHylLaGdM4cb3U11R8Y/tbKhYXIwKZX/Fnyx5Jad/SG4A6
 HfbyNq/z+Hi/nlI0lb2Kr/yheznzj6MpsP9GXILaoMaJoLlPFNckbk0J/iukPjPhSKsRIkh5rIe
 DBt6cZENxnFPBVFBK/9H9w8U5KhgObL+gzCAawVPqsvDu2+h7VnoKn17getB51YK3meRAlrhaob
 BHDZRoHAqFmyAFzKhFWlmSP8TGwytXwGM+53L3IEXlCRrB/tiTYwwWMTkZLfUAIKrku2Luop9SQ
 LdAdkF7QSIj3AfmbM0dLWfeiFmHVrGYJULST/xrktGi8v3aWNP4bG1wJ2CBe2ybDYDT9rYqfvPh
 GMzXuYz5fCE/qwnK34dRyaHgjkRxu8ngQiZxMY+HQqwCZCzouv6Qlipd1+HcUhUKBaMOn+vBEvU
 arGv//4WVNrFOtaoGxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX53CRHXt0tPc9
 vk/1n7yE0sf70hiixATT4C2tiMs5WIFxibitQ6fRZMH+x12qBJeCbI33TOIoVHSJPoy7O1QOQ60
 ZKz0l9bXH+0mzBY1ZWONf+RtNlRbquc=
X-Proofpoint-GUID: 1U0HQvS5BBypZ1aUyMcSGUSwDS2mM5ul
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4d7dd4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 1U0HQvS5BBypZ1aUyMcSGUSwDS2mM5ul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117417-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5904E72013F

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 7 +++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 55a4fa356985..81fcb2854772 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -315,6 +315,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ba91672df1bb..940daddbafcf 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 7098b652c117..eeedde8fc9ce 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -18,6 +18,8 @@
 #include "iris_platform_sm8750.h"
 #include "iris_platform_x1p42100.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -113,6 +115,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -142,6 +145,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -179,6 +183,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -208,6 +213,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -243,6 +249,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 375bcd923476..41498f94480e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3


