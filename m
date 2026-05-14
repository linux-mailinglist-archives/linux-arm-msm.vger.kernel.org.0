Return-Path: <linux-arm-msm+bounces-107686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CLJFKAhBmodfgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 21:25:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6F4546574
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 21:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09DCC3086F62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 19:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371013B19C2;
	Thu, 14 May 2026 19:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANQTRXlN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVEUprMA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6B23AB48C
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778786642; cv=none; b=Nxu2XnQdEnmrFuCEXwN+Z1sHX2GU28SJCZmgzLnAi5D05tU0an/i8C/DnUUUXx9mKytIs8BmjR+A20v5YYL70glAttR1i6W/Kfm3pUidvD8w0N/UJiaSLRwfznYuukhRYMQkhBFTJkU2bVsLc0VTo1WPSErkD0I0Xya53sUYLqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778786642; c=relaxed/simple;
	bh=9LHKkuPjIGbAag0Gr5ZhBlMR4hP04+zuByF059wsxsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6jm3RqHXPPq4eKjfc/m7d1lA0KAVlsxKY/Yqw/+qhB/imbiGkUOYXfVSfIqydirSO1uAPwi4ZUqWHmAG/uYC0aKUgS+tT2jYuJ0JkgusRn1Ecqnko54LtqT4ekaeV6jQGHBbCj0lN2NJBdMFaGGbRyGdhkvDZpdNi7ayxjQuB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANQTRXlN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVEUprMA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpf4j2676235
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 19:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CiWOrn7rZILw07irq93/F/Sq8L4fIVklfmaSat301H8=; b=ANQTRXlNQPKI06co
	3TQ6L9DvfJdCIOgUBTILk02Dg7xCJPB/Z7MVWMNSW/POZZN+lX3X+/JnEzMX6mzE
	nNxRISl8zk6CPM3RkT6bM8vHgcfGkKCbUG6yh42gCufZLj7wljU44iaCVZZDZ10d
	OvH+xsnINc6gbzzMf3vuVRnZD4NnA8eV7FaONG6CtGaqmLnnCYWaHx0s3JNR1gyR
	kF0Q1iohqbcDBa9qMt2IpfeZoUpQCvD8ZOXr4ppbd6sN5jZmzAnMYuBS42JmxKZc
	UgVmdO4LBAE/P6c9jLaiNqF7ldozNz9+UBEFqCzJ/AiKJm3QpDLr9lSZ3v08Shnn
	Xcm07g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vr3jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 19:24:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd6aeb3637so16006585ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778786639; x=1779391439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CiWOrn7rZILw07irq93/F/Sq8L4fIVklfmaSat301H8=;
        b=KVEUprMA//syhepRuidKQGOEZcUaA9m0EUl5VZwT0wucBqBIAd4QfqYhnet6Fcvv+p
         waAXbNdpcJ2hl2494XFFbKnnMQgi1MkRuZ7ZsnYIjcvdIa8CVgFpRLOn0bgN1+s8nXo2
         5XXISwR29qPUxWoqS3BCQKiooi8YKhbU2wgciY7suoFCgRgPzRNbWFxdj1l2vnYzMfoz
         Vq7oY+6c27VuSYKrbVqNaA0wkyOlumWrP2C8XH9HxBqVSlqdAxtRJvZcOexW83yRkwcu
         zgUk5gOwS+ZwanS1/i7lgHyGQHCF8tlffELQAwTVwfk8pBL6DGWntF99dJ4Fpcf0a5Yz
         sRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778786639; x=1779391439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CiWOrn7rZILw07irq93/F/Sq8L4fIVklfmaSat301H8=;
        b=KsniLzDQJEjR05/BnVrh6eKxDl3EWLQb3a4YEputC20bz3mHSDDYrzRgiMYXVnTRr3
         tCmGOkPfkbeJq9Doj3oJMSutyIsPonNSS0+j2ckBRI4OV+LrTt9ANUorNFW9uTh3FfKk
         c/rv1CL6yCy3d3fk3U2X9ktg4acMPMv63UZePEEwTULMoGFKH50RGcnxdWhY9dvXad7r
         c+3MLaG5uKLs6Ahs3QcuxP0o6xFb98Tz1ZogHiz857SGmGk6lL6FeT2fesl0IiIdG7BA
         wG8TPjEBzqSSLpt/3VWQ0AoSZNW/6Y0jJuSOlWeSoCMFcYL5c6nadiRZ0zhMiOztjwiI
         ik2w==
X-Gm-Message-State: AOJu0Yy/zMu/Gg6iA9MUcRWqxKIPXeymqcYVtgXVfzutw0t1hW0VdyBY
	Ttn2IaWYA0QdX2/qB2owyioUnpWdVSNoa1/6KsnxqtoQt74g7ZeuTyjp4Oc5STXMWlvisMh2Nr/
	DTfNrT05rW592y/5LgNt1V/enTZXklho11KZGiEA+Ibsh6jQT78usaPTL10EOSJtqJIsn
X-Gm-Gg: Acq92OGzxiUyLufLMdIOoynB/0+xIGtoNxGRRIIKguwMCwDtJFV7buqumbTYE+CVjYm
	eCnLmKcFTRORwazgRge6pca1iXBOF6N94ffR3jRGqHUZy1d8dvX0Xaz4FrBXbN1pkLa6TVWgC4p
	FTzsUts3J8Kvf9DxTUktjKKLpZuFU+kkHb5AGULp5anPNQwKlwVpxLRP0U9sTU9nDPp19tW0Ipq
	DZHNlfwn7B6Ff0ksz4tsef7s8lY1YZ+GOxxtFFigTE/Gn0rN0sMf6+QcKzPCA3cGLWG+iep6lsv
	WS9MrhOyDnDDPETPvUGqZyOl1ZOBA53RcFx853bbmFQ/ZnsAwIFjEezCBnKFwmUoLsnba2w/3Bs
	chr3w5YO26YLjlzNQnVJAQ7VkJXH7yHSt6Pgu7bIswhGl9cv24suCL8I=
X-Received: by 2002:a17:902:f38e:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd7e8cbc80mr7251625ad.35.1778786639404;
        Thu, 14 May 2026 12:23:59 -0700 (PDT)
X-Received: by 2002:a17:902:f38e:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd7e8cbc80mr7251275ad.35.1778786638895;
        Thu, 14 May 2026 12:23:58 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f291sm35506535ad.15.2026.05.14.12.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:23:58 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 15 May 2026 00:53:36 +0530
Subject: [PATCH 1/3] dt-bindings: crypto: qcom-qce: Document the Shikra
 crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-shikra_qcrypto-v1-1-80f07b345c29@oss.qualcomm.com>
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a062150 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pQ6rRVY8thx0fpBeU8cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE5MyBTYWx0ZWRfXyhCCZJnlAjsN
 yOW2yMkEPTePsHekB2iRNAaMgeTcR9WwoFETCAdj8HJbBeLtRxGg97sKKLmS/OWW500+AFUntDs
 cO/iFCYeZomaXYZcU8TlAzn2UDMEjC+7FqmDb1+Yx2iz5lvEECgEtb0l5fShRbwraLjxaKvqJRI
 7DjF3/s5So8ssG6KhDdZSkqoxMK4KXh5qstX4y6WClZ2XwUENpgSZlmov87yz9ivUKKS7aT4sd2
 Q+hFKnScaFvF9vHWXGJyDHzr4t1gOOkSk1NhgxCNW71fnKeOYJCB90dVscdu2bty+e4AIPF2UB3
 XwOna1vS7/3ulIpsfbsvz0URvhg3mbO2hqoVmAMoTY9McJ2z6ZBgjlLnypyGb3MtJJgkf4mZiud
 HAP5ORqdj9zm8dbB/TXsO6uRwNLgiWS2nBnFp6urZTNV/1YpZpqPCRYKQup2MD8991aLsmlZjHu
 Bzd2aZXIdG+5XSjIrHQ==
X-Proofpoint-ORIG-GUID: iFAz6nx-ND2crN6lTnlM23HQnm_qWL5c
X-Proofpoint-GUID: iFAz6nx-ND2crN6lTnlM23HQnm_qWL5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140193
X-Rspamd-Queue-Id: AB6F4546574
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107686-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the crypto engine on the Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 69101cead3bc..ad0e1cd3a76a 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -53,6 +53,7 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
+              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce

-- 
2.34.1


