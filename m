Return-Path: <linux-arm-msm+bounces-107631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CyYM5rXBWqacAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:09:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C714D542CAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F2E73007A64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CB43C4165;
	Thu, 14 May 2026 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVq4c02K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Obyr6l1A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DE33E3C57
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767552; cv=none; b=fhbNlgjY7Z30bxx/1QhCkx+aY7b4MKKni7g7uPxjWxt2V8ZdhStr5UGEJmcE7WkK3MTABJbExcz6Yp4SBIVH7KnDPV2/0WzTED8Eu0Bt0zuLAC+NOupZHhR+3adAOXDZQX8hMVr08CWaQLGdiFwZu3LZXsOPOqvkoQzfkaybqzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767552; c=relaxed/simple;
	bh=qPRFTDUweQw/Bg+8InHG5MGn1nxVYQBxlpc83Dm2Cfs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X/IsEP0GjMldzeJV6EJpVIMPdIHDCkZ/Y9UZe84JutaAGGUc+2bfoC+H+4okQj1zk4DBg+BCzjc7TqOwyeADAGYZY4B4FuXTxrDUBqJiNZStsNpoTutjADM02zSJX9GeuRRJy4A6pEPbo1ad3OBF6Sj1eAHMGDx4OFKfRDkTKDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVq4c02K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Obyr6l1A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeVux3061920
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BtIyNwC7xLcnaPOBk5SgDr
	thyH8HcI8jJbORo7uZcKc=; b=bVq4c02KdHmZXwc40ECJ/PINw9I7M9YzeZwFh3
	lb5tNXe9XkcF9+YqfiaT5Duqpqk3gzhqxRapENKLh2Hdr0W82egOKI55PQZkokUN
	iXLlxJK6y2MKJKrsE+/xSd4BegGvIU5PxCYuSzNeK8Uo0npSti6X4vAj2liXzrW8
	dsq30wcYphXaWzWu4Dr7/txK5WFJ4INFFvhIv5Cx4rIo+BvyGRBmFkndrQkWcOJg
	71AOSs6zCneYD9rqmW0YP6pzge8sDqPay8JKZpLd6EmP9oOc9lHukK5yKRu2Kkt8
	THayFlaPmqSU7PBgLqbi/XxeFofDnXu5UBhTVrEKWOmomRHQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554aa9ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:05:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366015bca9bso6353136a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778767549; x=1779372349; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtIyNwC7xLcnaPOBk5SgDrthyH8HcI8jJbORo7uZcKc=;
        b=Obyr6l1AXAKxDWD4XslUG1mcs8nRYCVju8O5rCnJXtr2F7fb2VEmqEtyCzrJoS+5BR
         aI88woVD61fkLdzQXWasSBYAGP/x9Fjx3894FegZ+13Affhg3krLQ0CkRvCyExhGen/b
         OFoVzJIkrF+7gsds2W8/IK3gZdoZSJhErRI7go6pmxCSEio0w4/u1RWw239PwliJ9AgZ
         JzC2EMcMVxSRyR3SrGAeCi3ScY1/xDbuP7080+THXJgpDkiH7GxGN6hW9RmB1C8Fr/T4
         gxFpWNX8i3FVOwotSt/guVWwJGUhxT72nDLPR924AJ3eWMBpvIT4cLyxVjgkJNOk6BQ8
         Jeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778767549; x=1779372349;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtIyNwC7xLcnaPOBk5SgDrthyH8HcI8jJbORo7uZcKc=;
        b=O8+YadLOXhELg/m9VD8knGxEhJKQqYBP1CyI5iLpHTagsmsLI0IR7PCa4nsjl/xyz7
         0LideVm4527kmO/NlsjrXH/iIRRE7MisxiPWfs821i/7B+ZQBOxmmk6St2BV5ofLZRbJ
         XqVYqQiw7+8YPqtgp1WEv0RCGhA4w19Oilly+6xRHm514W83A8dU4i6RMDx8HNb6u8XX
         GcEzMqakCD3HDmWCKnKLdeJ4BNC3y0GwUbLdT3ueLULDWzP4VMGzFYCVwC5UpHG/Yebe
         jOhPJ7NXvBPiLbZWUcYARX5xMpnAdA+NKaTEH2KVDslpd4mGtSujwn8fmfg5KxzA4H8r
         B58A==
X-Gm-Message-State: AOJu0YyBH0jGZRmIgzfnQBanakecrAIlbxnPTend4OiT4dYULlO/1JFP
	3/iVI0SQu21dsssDRn3rEDC+9S5dRu1KW2qfF+/3fbmZCgy+EWuqS0NZ8IttCcoRc+eePUXn7Iq
	smUyV2TtIa2a5xUz/WFG6O11xzACWACD4nn+YhHp6tp5e1VrAC/vy4uWczlv1fhzfMnh3VtZqKA
	s=
X-Gm-Gg: Acq92OEUWrkFn9wFX7oYSZqcE6uCbaVgPQ41X6Ws5pxlGTGFebDrILuxhvlZ+R+BKyW
	ZtEBM5COI0cvRYmr5CHe/QGBp8BDmqNJgBDQGPcADLtWkxdqsINvR1Siw6CiooSYis3VpR2ZH97
	r9ASPQG4oBhbfo9SooEPmFzFY4aomPkJzzx79PenOw9H+ufCXj8e8XmXOYwD+PyM+7h1XeCtbff
	IA6WDefNaBQ+/C4g/55JuX/u6kckYhrzkzM+afXLSGnBNCP9SDWFYu+yuM9AvwnmVG2oO4iAQv9
	Ni3oo7AjgArdUBJGC+uSE8pI1LKS/u6rVPdMO1HXr8ngS9f1er77uHhKDW1ff7fNZKULwhz3QvL
	pOPByVsXjNyq81OREhOeog3SvxHgCjNcBW3c40CmYiII9A1wfnXM=
X-Received: by 2002:a17:90b:2e0d:b0:35f:c5b8:ef6d with SMTP id 98e67ed59e1d1-3692334308amr3271314a91.3.1778767549117;
        Thu, 14 May 2026 07:05:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0d:b0:35f:c5b8:ef6d with SMTP id 98e67ed59e1d1-3692334308amr3271290a91.3.1778767548611;
        Thu, 14 May 2026 07:05:48 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36928a8c1fbsm1502813a91.4.2026.05.14.07.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:05:47 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v2 0/2] power: qcom,rpmpd: Add support for Shikra
Date: Thu, 14 May 2026 19:35:28 +0530
Message-Id: <20260514-add_rpmpd_shikra-v2-0-20bbd37592b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKnWBWoC/32NWw6CMBREt0LutyWlPIp+uQ9DSOlDbrQUe5VoC
 Hu3sgB/JjmTzJkVyEa0BKdshWgXJAxTAnHIQI9qulqGJjEILhpeiSNTxvRx9rPpacRbVMzVspX
 lIJySGtJsjtbhe1deusQj0jPEz/6wFL/2j2wpGGfODEq0dVOVLT8HovzxUncdvM9TQLdt2xc4b
 IO9twAAAA==
X-Change-ID: 20260429-add_rpmpd_shikra-f57873b2fa7c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767543; l=849;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=qPRFTDUweQw/Bg+8InHG5MGn1nxVYQBxlpc83Dm2Cfs=;
 b=rg3xr0ohd2vem6pj2pDY+nv1sNQEh/qvsW54j1vfShDLO4HtwLzwGvldsCgQZR4I3WqyzPpfd
 3+fFo9+zIHeCTxJB7FRZXEoJJwZFykABujLnzUpzZYFrIcMUb+DaZCs
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: 1mW25vK5kFd5RviAaK9JCQcWrBjVH7xg
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a05d6be cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w8gYdMrFLoSuhkYnXDgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 1mW25vK5kFd5RviAaK9JCQcWrBjVH7xg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MiBTYWx0ZWRfX4L8N8f7DC7UL
 wJl4EpoKkZ8+oCUfYbxay8VZHjlhOiaHVDJ+CBukm5IERjt6AUKSQ8D2ZHJtMLh4xNIiVnaNWKP
 52wih7h+0sU1dVpVJreckoKwRe4APW/dSM3g+xv9LxCYoIgrLQwUcjJNmfXEu+y9NKKBsSi91G0
 8bEvIKKHEszPbm8XPPtXcYBxKqXlCZIjYj1CSO3mWWnfuvEJoVSeV88iSWpDxFreHdMCCwuoHbw
 oCcKY2+ume5jDmf1bRwzOqG5ZoaHFOG8M9Mf0q3CA/YXAxOd3gDOoEWkVSSWVih+SK1VkTEel+1
 f51tIkZaomm+g9i9GgM4z9Qa5/KUJzh2m6PfolkszzZq1ra7GVtp+EowESjlCFySZr4O2ER5ynJ
 RcdjYR7eijJ39bqCwzU1yCx0bsxjX9yyiBprqk4zJ7EjzAZh2YHrbKA7mmNIDpo9upZCZuPx6Hm
 RJ0YaZmXQxqhlesFISA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140142
X-Rspamd-Queue-Id: C714D542CAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-107631-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add rpmpd support for shikra Platform including RPM power domains.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
- Collected Reviewed-by tags.
- reused SM6125 power domains as suggested by Konrad Dybcio.
- Link to v1: https://lore.kernel.org/r/20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com

---
Rakesh Kota (2):
      dt-bindings: power: qcom,rpmpd: document the Shikra RPM Power Domains
      soc: qcom: rpmpd: Add Shikra RPM Power Domains

 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 drivers/pmdomain/qcom/rpmpd.c                           | 7 +++++++
 2 files changed, 8 insertions(+)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260429-add_rpmpd_shikra-f57873b2fa7c

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


