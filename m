Return-Path: <linux-arm-msm+bounces-105680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJASHjtu+GnPuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:00:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0277E4BB578
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 008923006479
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A9335F5E3;
	Mon,  4 May 2026 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WwMENYRh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCY8P1SR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6694E37EFE0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888823; cv=none; b=nKKAfv00mCiSqfxEOU6VMfHO02YxZ8criyxGS5MHDfn1NBh1Bl3BrwuFMJ87CLMPFyOWs/aSzuFCkiIwEXgAsffERotDHJjSSpSe0sAOX2XZPbV2kZh2lDeO4ahMvgz91KrwvH2ThXrX+TJ2guQJ2dfP8m7voedSRPlkj4omiOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888823; c=relaxed/simple;
	bh=6XsOW6xgktCxmo428N5f8+9AEw+zHR/Tzz8edUczcx4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lKyP714mWBCV1Ccgx03niEeNe7lMXxpJyrNnWpHvGImTjite8pe4SJnvKbqK3OoREX3Mqi9zDijJSFlTACWUNYIMP+8awzcruWzJ0aqp3lJidv5r/3laAV46x/4wAuFjT63wb5wY/DNSd7Gr81SqrfsTiYqMFehEtuNdU3k1dJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwMENYRh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCY8P1SR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fTau3894174
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dCGQExVcxWHLSWb0uhrmkR
	JffcrkofUoETdXWXrqn98=; b=WwMENYRhVAxS0IfMJALsi6G9UrhRS1c8vmRJJl
	TacJC0B+LhWbDrXXdas8FJ0Sjmcv1bvXs8QfihTdZdnOg+V7vMkHgeKRuoRh1MN1
	Jl+NxP06Ux2mGF33Of2FYHo5Kg4IbQ7Hzy2pgTH8rJESLhrJzsEnzDDxGO80WAWg
	QClxkUuBkpyo37sLaXsnZomRr/yA02KtSJ4ACoNeUzHPFcrzxHxlhFSgw5tz8tew
	7BXE3XRXIsXegyIg9NrNM8/ncU6QBYD4kIU6eTa/Y6SrKFLXDZ9Snae6mkE0lfFm
	oaghNJSYacwt3+PCk5rsH6/5NLqvgQYjQFcEppYucCt6hIbQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6mpdf54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:00:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50eb8bad331so120455431cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777888821; x=1778493621; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCGQExVcxWHLSWb0uhrmkRJffcrkofUoETdXWXrqn98=;
        b=DCY8P1SRShGkq0HRAfRDCVptVq/dQnj24YHbN7LN1ZqO/X8yBcA/97Y9jLgGD7MrJd
         2+oGDcbaWX6XzbqRgYA/pzOpbMCmaVcD//gVmIlS3wHIFY/rjXZHUwhKvLin7AUApC3r
         A/MBFAemesZ7ynvKsFpkc1eYMewG3P1UuMDJ1ddcjKpP5GPhx16ZbJZ9kIvYH3RXyYHm
         RDeX5SU78aq+kF8+QknxXos29PIb4IgWo/iblXWMCelfFc9/ZjRXulEP/J/JHtOxLNEk
         2VYyjZSjfQ+KH+zALfJv4vatJ4RmNH9QolxSd/VVFzHyrIB7TA1GPd7nyh6xLDL55P36
         RdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777888821; x=1778493621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCGQExVcxWHLSWb0uhrmkRJffcrkofUoETdXWXrqn98=;
        b=kKmiMURDTYHJ0jzF1SO8SN8um/eFjApyPSgM+raAnYJYt3v/iOnCvezz8rVR+93K+T
         t0XY1ieHmAG1OI2yYDd+Iqn8YjZ0Hc3o6LtVncLxZLKcugT52IRWMvOqFAbl2Q51QtlV
         /EtaMG6C0PwhqQoKA2AuidYSSO6q5ULoQZPDCKN9CRg6BVuWqBzgXwj1bVL5YHrYYdS+
         wYbAVbc5J2ok0YyO0SKLRLMMAhf9TXELtWxAFPo8eR7jt2McUwLQUa6kkOC3ueBGG1nb
         RT9i00rb9uexqCh61sUHbdjKR5xj8VJY7OC48F3A/BWL4qMIegI1zXOGMmcNbNPKBQkF
         xwqw==
X-Gm-Message-State: AOJu0YxwlHGjlNEc2NBoeVZzmm3vhlHz8j+D2glCgYyEsmmnuIZhu7Pz
	STyxkk9R8aEJ3yyb7NvWU2/nAO2chKNNmhXsgj+Ms+jhbGNyTQcoCksDOJ4AmwrX2peoqHcXRDL
	EHNo1DnWbzV86GTcgSIMXEqlOo/d+2A318dCjUfVUEOahPRGKBxR3fkQgL+6Kjk3Wzvk3
X-Gm-Gg: AeBDiev56jpeA6AzrUw4xI8uzqO/ZoQJXdsv0rzCWVlAOpDaWVbnaKleqEHXwXh9pUX
	rKyKeyg4MPQT6ArKG/18/7qFqNJ4wertxkV/ll7G8vNhwNH5MSHIjTCXRF5bAgmknTH9j5mQI7g
	P+7haZQUYY1dJNDLN7XMpzjNL0pzxMj654hjXgmWURTxNmo/Ll2WkAIAD9G7DZLpGvG4QuiUjti
	lwyi/4LzNZ6Zb9jLaJ6EYKFNjuc/P5hCOOl8uXHZE7H00CEx4OZaMxjyqz+lCNSdzG7XuSEi/mo
	NZ4v4C4Ect0JrIKNzHhb+rVHSF8VozHHAdlufC8fo23f54T6FziE/K/2E+wxGncKDsUKhYyiFkj
	4f5BJewT0djfsq0lEW6jUz5T25CIBKOz1+i16LJVL
X-Received: by 2002:a05:622a:588a:b0:50d:7f4d:93cf with SMTP id d75a77b69052e-5104be06ee3mr152162601cf.8.1777888820716;
        Mon, 04 May 2026 03:00:20 -0700 (PDT)
X-Received: by 2002:a05:622a:588a:b0:50d:7f4d:93cf with SMTP id d75a77b69052e-5104be06ee3mr152161591cf.8.1777888820129;
        Mon, 04 May 2026 03:00:20 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f7csm324355955e9.12.2026.05.04.03.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:00:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] soc: qcom: llcc-qcom: Add support for Eliza and
 document bindings
Date: Mon, 04 May 2026 13:00:06 +0300
Message-Id: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACZu+GkC/yXMQQ5AMBBA0avIrDVpSxBXEQvGlJEGaREh7q5Yv
 sX/F3hyTB7K6AJHO3uepwAVR4BDM/UkuAsGLXUmU10Isnw2wlpEkSjdytyQQSUhBIsjw8c3q+r
 ffmtHwvU9wH0/INFXvG4AAAA=
X-Change-ID: 20260428-eliza-llcc-312b07fefc10
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=875;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6XsOW6xgktCxmo428N5f8+9AEw+zHR/Tzz8edUczcx4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+G4pr/Tk6SOz0Fiz3WFiKw52rDwKJoSFDHjE7
 Dbu6j/4QyuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafhuKQAKCRAbX0TJAJUV
 VsuREACQwaUY0+HOoNCuQ9Q+JesxiBC+sioF1kjfEPmibB05RzlnIsq10nOYzttTghXdGvPqVyR
 roN5FIrnYpjIT6RM/n5BZ3jMEbVPQ9+uJ5TrcAQuTzGJVwi8ogITnL+xR2RYs9Luem0HhMqkbq8
 ZCq0wy/YQCch58LZYMCfENji0+MLcQEYeGZrpLVKwOtLGxu1mllNxSn8fIC4DA01kH5x6OJosAT
 X2r9JFmln4sWLXSt7LTnBBjdU1LRjCT2cIJixBXpnlzT8DdSYGay7qtOhB8mab51StIHkDTrHBd
 xKwFWCnUowDdN9uzpiMCCh4F+P8VO9w2TEZdsYQlnT/pohnwapxUy6tZFzG3TXk7Rq2TWJ5w48n
 pLrPz/mxXRvni3aIhhhxvMHY25SLW8IOstLFhPwRulzk3qGtMozOK6LrpNeoFz/QJjhlKGK34E+
 58OiwozQdo1mIpOAgRTMV7qWpekKMclH/omAzkkzpSFd+ALw8FHFVb6rgCml/xTYbyMN6ZzYbkM
 LxcxKVOKcBPhvSyKM+jlfz8jDJt83FAYecdajkf49qCNmyT4J+j1lb4Tlwz4qsp8XdbpBHZ53uO
 LA+Ax4LWxra7T+PF0KFvtLlnnl7M4/Oe3kJo24nIjO7t/fhm7UwjPByXJELdhQwAnrWy08XyJDq
 nJ77o21U0DPODGQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=H6rrBeYi c=1 sm=1 tr=0 ts=69f86e35 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=r00G0U3fHvqhUe7YmHIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNSBTYWx0ZWRfX2ILGOD9d8//h
 9G9KigGr5w2qGgXk80jfG4St3zLSDZ/TG/E15SjEyFQ7rvOI2ugE5ACLG6wMn8RHxBPhYRx5A+u
 B5qfKdkDmn7nnJ9qGXoGAiJMsjvHaUj7cX054z15hLBljmQ1jBojb8IWuIim1/eWp60xonlAF2d
 2ph1jDhWvnWJFQmkB2udbNKCZuUVZzZTEUJp2P6TKtg9xwzzn/cJToPe9rSqpT411qxuXjjkqE7
 TylbC+ANXAqftTRZ/tExI+fFbhKHAkZvVgSw4VeUeav3p0BYNDB4vyL0MJ1ManrNyzw8LrG91NI
 TS55JlFDA5ke0iKRbFKsLEzVh5optEMh1I0Ag3ikxOnxRcLg2CoNOeU0V1OW0uEbpRL7nttUdoD
 +xAs1s7I1wd0FaRLqEYR9VpuFOSSYPlgHdO9B6PwOwiUnB4/rUYQDXD3tVi1Og2FSsEvMjyt9tT
 WEuCTJaNyH/WQw4+r2g==
X-Proofpoint-GUID: bcM20BiAbm_S9fdEktv6n0FszSs4MHGd
X-Proofpoint-ORIG-GUID: bcM20BiAbm_S9fdEktv6n0FszSs4MHGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040105
X-Rspamd-Queue-Id: 0277E4BB578
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105680-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for the Last Level Cache Controller found on the Qualcomm
Eliza SoC.

Eliza's LLCC uses a 4-region register layout, with two per-bank base
regions plus the broadcast OR and AND windows.

Describe that layout in the devicetree bindings and add the corresponding
slice configuration and driver data in llcc-qcom.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: cache: qcom,llcc: Document Eliza LLCC block
      soc: qcom: llcc-qcom: Add support for Eliza

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  22 +++
 drivers/soc/qcom/llcc-qcom.c                       | 180 +++++++++++++++++++++
 2 files changed, 202 insertions(+)
---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260428-eliza-llcc-312b07fefc10

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


