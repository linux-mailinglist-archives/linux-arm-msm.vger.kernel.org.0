Return-Path: <linux-arm-msm+bounces-113494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VEIrLfQnMmpjvwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:52:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0D69682C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:52:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M5dUP+8t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dOsMK26w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113494-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113494-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8729301B909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 04:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAD533A702;
	Wed, 17 Jun 2026 04:50:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F1C33A032
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671846; cv=none; b=by/Qebn9GJ/RHp1jooXeTVOCOogPzVE6QetMK1N4aVo+eyeXFsa+1iQ59HFvUpSa3jLx7bw6K5PvNb6hXd22+9r98H7XOrIjtgbByojiM0RnHAzaXmVcple5eHrOfGPQzD0/Oja9c5gRDmaWYS3QZllnIRsPRlyM7dmTJEriKRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671846; c=relaxed/simple;
	bh=1U79tpuM4ZCInjzjfpqkfXwFv1yu+UyNvhAWxEVHcg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iiEYsNnZysE5254jOyDMVmeSZgNCCgvZ3Q1r8gEANWsnjWFY+h2Vtn1n53F4nVHpNXE2v6kSh1moIn1gzAAqAzZdYOcot1Xa8pl72TxQfCCacVrZzrK1cFryxztRtZMAxUKS4Poi5NY3Qm7KIGcf5+Ir+VIeLd8P31n8gBhm6AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5dUP+8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOsMK26w; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLT9qF198204
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Q3orq+Pmz/vzt6D2bgZpv8WUE6yDRouML55RTJqYNk=; b=M5dUP+8tyG7lphOB
	YqCQRrayp4Yav9sRLoiRRsocpeb/ivDZjRoN4JGVmJ0CeFDPNZNIhT7G3DcmhfVg
	LlrUDUdq2rPQzU+6xEg2fFc9S9W7NTGpEgiVdsNfA/f/tka4MNldQuy1GcYuN1+v
	eIcqTuT0X7rB8qPPUbS+lOtxqVx4xrM842WnaI64+bpR0VrkeXGl/pP1fxLMIJvb
	DxFI+wOeYtLyWgve5dFU3K5GW7vQnBTWY8QIYg+hrEhloOvLcG8xDzySzyv3XUXq
	/RtonqlQbiXtWwoKurepHpThUH2h+yoGQdLtyI/CrEu+YUC91p+KQM7KHj7mKBpn
	FLrTwQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer1agc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422b1354edso6538201b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781671841; x=1782276641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Q3orq+Pmz/vzt6D2bgZpv8WUE6yDRouML55RTJqYNk=;
        b=dOsMK26wTcPqJN2nR3J+hAMS08IUSVaAx3ScNAQZ8HncUrkUxaVpjzDwEiPegEVEYx
         4EpEHDF8QJnSIYUHY0M866I+8/w4Cw3I+eJDgUvQUWDYRmD8Agdw/K18euK6GN+mVlwK
         0S+fHJ5URXjQQbcNWT71Soh0ybErWZrpMLDp6+rKMsYehHlUhAzSmdaEdiqHtU6LCpOG
         gtmW9vdY7yvFstz6vPWaBIhIL83ws/tkccjICJPABSnsxMEIICLfvQUt/dxwtNVW9VQd
         goh1EGjCgLny/vJZeCD0Ld7TFjxw5EtcNk8b9Hw+xWmF2/lvUBtGDRgcGpOoNkWrOK0a
         J0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781671841; x=1782276641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Q3orq+Pmz/vzt6D2bgZpv8WUE6yDRouML55RTJqYNk=;
        b=GpWI25Yw2KPcCuEjYzKpQpzK/q9WoTphMf3mkjaOBHZ4ESc2wmeXU/tcrulgOuR/er
         LMh5dRciyf+4x2ZGRhwrGSmAt3kpj9RzQriQWyGLPDtwFViJkqEJjMGoCDclmixbRJyb
         i6uMkHkThJINyMare8AfcY/RxBRq9rG3uUp1tkcr/NI3bkOFj2IdekxRX5qs4LeSM/fK
         ZJycLJ4RH4sNhnycc6aeZM1nRjqXZ4pXDEuRwdxWgdKjt5ZBM5x59GOoR+hCBiFTj9Es
         DlnByopIkVrruQWqpE14jpvf0swEq2KRdzSM1l8ByIFIMrDAch+DRNCfnQyZ4pUI/h1n
         vgbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8P7jxQwwqRo6pf5T+FWC5ur2xkn5Qj6HgMcXH3gIBz3RN2Mz0+C6iWYbumIX/V3UkVCgtxag3R6J0tz5Ea@vger.kernel.org
X-Gm-Message-State: AOJu0YyDItN2y3wGw0kL8sF2cxRj+NCSZDXlLwGx1G8ydV2ZIn/h0OvD
	HK9bFR5DVxwyrht8okcvpvrFx9bb0bwZwkMbL2Ox/sR293eHvIvr6CFa8F+/VbRQhiv+QwCaRe+
	LtenXkovfIZ3JZNdTMfcsiMSdcP2H30wWwgYMIi96Nrtagkoz6WBhV3Q/nom9m4r7iisW
X-Gm-Gg: Acq92OGLTVEelYVXQZDKsSwAFeoOFWuIZzutq5DZfK+L38TccA+ua2tC/ieIKNP6DF3
	hV/wOWYD7htpQQqwCifOF+q6YJfLibPKp9XdNNOfM35F9Xi1m+e2EQ6NIQ2S/YlSJJkktQHj1DV
	9TQuhYbF6o3/jxLlm9UJ911C7LsViSi3a3B5uqMar3pb2aVh4fDVGGb0yigICijJR/RHyGY5zCo
	BVEauvhVbpbULvaW41Q3zBvH67pTyP/1u2bxpWXkc1I4L3wb4yLoYYrUtDa8MWuoQ62K0tWSpFD
	00tDg6zPp9HhmX5gvohBpX1z/tk6oLzWE/igep2xtbYcLmRz3C7ioh24Jxd9SNrZv8H8zSAKBwM
	/CLrVbSpPVct9bUEUrr6jegvRQH8rF/4Flyv25wa8GAU6
X-Received: by 2002:a05:6a00:3d4b:b0:842:80c5:c425 with SMTP id d2e1a72fcca58-84524569afemr2216764b3a.35.1781671841077;
        Tue, 16 Jun 2026 21:50:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4b:b0:842:80c5:c425 with SMTP id d2e1a72fcca58-84524569afemr2216713b3a.35.1781671840558;
        Tue, 16 Jun 2026 21:50:40 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm14721127b3a.8.2026.06.16.21.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:50:40 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:20:15 +0530
Subject: [PATCH v7 1/6] dt-bindings: i2c: Describe SA8255p
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781671828; l=2715;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=1U79tpuM4ZCInjzjfpqkfXwFv1yu+UyNvhAWxEVHcg4=;
 b=HLl7kNKNz6/ItrAtFz7MOBiAdXKbbVW/7jPVsy66FAMZ+wWyPHvHg1c7/VlT87BZQNfwAL/0Q
 c3mg+oSzMyMAgrUMFY7HjTGbn8TV+TLeK4+nAdX75T2E3VMV+bmPCHk
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: LPY0XK52t3h-J02Iy3I9ylpjVOB4yRqB
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a3227a1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=apMzWF-kzHp83YoYYzAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LPY0XK52t3h-J02Iy3I9ylpjVOB4yRqB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX6S3hC1oxDeMW
 xi+nKj+dHJ7Tsa9PjkesVvk7p3DQKLOERYrp0WGBYsLh2JExvVcsZmh860FmBNE3K4ziTQt3E/4
 yuCZIdiKPXaLKMh+geZQ1q7wFe3V5wM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfXzknU+fP5FihT
 Yi8kU9MG+1eJagKLUP7e4rabJeaqKc6QTm6gfh2iIuplIE2vTmx6liaKuHA8wkzKCFVkGsZ7lRE
 poXNwIir0Iqunfg/LGhzzwpZ4DOJyMt/B1fVI3prbq3Hgaq5Cpd4fZpuZyG8dJFp5l2pBSCTVgs
 rXbtE/O2mh0vhbzBgcxYaWB4ofjxRkRmHhrVvCvZ1VQmp5VxnQrn11Wi3mMuutxIk4m67aIptM4
 vhy4VhIR2PuqmGhn/PlhubPZG6h1ZbqMza1gtmTiFb6tMrhgieMkFkUyIyY6nfIZ8EywCsR7PBb
 4vvHTwBs/DwSVpx7W8KyXaCA9bXg+RPr++TBAop+BnhViwJE1GuM30MYVuT8GzBtMAsHVP8TvlN
 GrzUDVvSQnk9tNBVfwhPTr5qRgW2PbP2Mt9rQqDdMWXxvlmzARKwGDKy7gVLYXR3nnJMpH4L7SK
 eBOuGMsVkNH5+JRADcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113494-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:mkorpershoek@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:prasad.sodagudi@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:quic_nkela@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06A0D69682C

Add DT bindings for the QUP GENI I2C controller on sa8255p platforms.

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocol
are utilized to request resource configurations.

SA8255p platform does not require the Serial Engine (SE) common properties
as the SE firmware is loaded and managed by the TrustZone (TZ) secure
environment.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2->v3:
- Added Reviewed-by tag

v1->v2:
Krzysztof:
- Added dma properties in example node
- Removed minItems from power-domains property
- Added in commit text about common property
---
 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml        | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
new file mode 100644
index 000000000000..a61e40b5cbc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255p QUP GENI I2C Controller
+
+maintainers:
+  - Praveen Talari <praveen.talari@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-geni-i2c
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/dma/qcom-gpi.h>
+
+    i2c@a90000 {
+        compatible = "qcom,sa8255p-geni-i2c";
+        reg = <0xa90000 0x4000>;
+        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+               <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+        dma-names = "tx", "rx";
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };
+...

-- 
2.34.1


