Return-Path: <linux-arm-msm+bounces-99377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BQOL26ZwWlNUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:50:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED652FC9F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D20263215CB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5996D359A94;
	Mon, 23 Mar 2026 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+ZpvIpQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N599YpSJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E314235AC3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293816; cv=none; b=B6EpfVjt6bMOy2b/gjbAkMFeSFhnodzlHhWgzqSJBC6VzFKgkoLQbsyITXlrbmSFGe1qcb2AkjE35JgE8xqNF/xWvu6zwL8Yg9t8vxQ/u2Q3WPMxXFXleybSi7ywiNfKmZwplzeJTVyYAcQqlX3qb0vbdZ6kW4rjOzZUmRtrVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293816; c=relaxed/simple;
	bh=guPYou0GHQCfyONXvBvRBR/VhsDUO246QcAdqWLTHC0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cA7C0LuIJXxhrgjWw87A5Xv6k8CCHlBL629T/686i74lrP0EBLCNVR4sOiWwOT+A5BjpqnCtaKHvYR02aJ+s6znYfThi0Du68NMUnd8GsuhVlM1JyNzUY8lCqcnhChrPaVdA8SM8Ls+ozwEj/L784UGulVYl9H1ogTzhFd6g/yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+ZpvIpQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N599YpSJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXV23817467
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0z0Z4a8AqRmkbpCrWFHHut
	ybxh1dNIaJRE0pn3lU8jE=; b=Z+ZpvIpQAFlM1ovmf92JoZQ3FIoMhbtVkNo7d2
	9mf7yVI0fWDP/7V4gsWd2lHAkS+WK1tvgeZ2njYid+toh5iNF2Z8Vjy9SWBa/hnz
	Ykhw6UH/+HBGtoL3BOvNTAM9/2ifte4eOWXzd4bWzxvoHjXJNusxBW5mf2EZK+NW
	k+G5H3tc8FyUz0AiizUr4UKE2YgLR981piEgKzCGDUPyIIaVnC8G5UuL8ESjin/E
	EJ5+UNi+eCdxWV5WdQDYnOIYmevwLfuTD4CLoqrEB3tzo5s9z5eeuLWBxs7LvqUq
	kBmHRGOVAcFQAHrfpmmO6ibCE3q6ETXWZi4htvM7BViGqKaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w1hdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso7919581cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293813; x=1774898613; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0z0Z4a8AqRmkbpCrWFHHutybxh1dNIaJRE0pn3lU8jE=;
        b=N599YpSJG5QloJrgWCJOYCDCCFYaQNsdvhhDdqygFbZSZ80eGCfksFAi+SuvBmb5MW
         NoAtsOLaxwbbyjzr9VHMi/bMlMucdVKDqG/dwr9Xl1WeD8csTDOlsrRao9MTP2N5vQu1
         naE3gknkB4lVeHYrHhv1Nz8EOEqt3165u3e3pOuux/5y8gUWKIbYoWIjfHBTfi9BE6NE
         UQfdwVPg/240AYYT9nV41hVs3joDL1AO9OFDuJK1497L65VnjAe3pkLeW/7AX6jGfRkL
         GF/l0EFHMlK7HI8h3H30Ea35CqVZIgN9CSkg3A/9KevfGLBi7CeASqNs/Ywx/fJue/mF
         cmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293813; x=1774898613;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z0Z4a8AqRmkbpCrWFHHutybxh1dNIaJRE0pn3lU8jE=;
        b=oCfx80qpHzbDrQk9Y9imumTLmncdgYeSakvjp5M75XbyQTBuUe34cI7ytTbcgi7PjS
         R7IFVMFM+RfCvlgm966V+lyvfSZhNu11aKQkgo78QcPdCt17lmMym/I7nAi2idPioMm4
         h6kzXEw28iYGXVDH5VU+04HYsNivqo/4vVqtOERIHIp7ZHpkVVXIfBXzgDPIagpYf5tX
         ZyVbHvloLPK203XGr1uHVld4vCmbcoKE25iB9wWSceXlIpTWQrPJjJpkh8jeZxyVTK4G
         NU+scJughDTqkd3anb5C16UvWNTHcq8UCE+zpnsX2stv9JbAObqbPr9Ufns21F39tKa5
         GeHA==
X-Forwarded-Encrypted: i=1; AJvYcCVTYu4VZ0kaJlUR2yiRoUYx/W8xh4+BB1sSh4mu8lu2rlCCo6lUuy4CfhANxqfd3m4pWLDL96iBSeuV4Ec3@vger.kernel.org
X-Gm-Message-State: AOJu0YwyaeWlOF/ZgwYdDtsYdzpywOKkDFsRYdlynl8a7MtCSJ4kbXe0
	XpYP9dDSXavL3NpIoNmd+Lw87DVSyoeyt03zyK0bJxIv5aW6pQNURSGoOMd7PFx3piQEKZyBe9r
	ZEZbP7c4+EDhwVXy5gxz8SGkZLxcY/IDx3e+PZnHDksSiQ7Wf1rC0wv4urlbtm4OPK7lW
X-Gm-Gg: ATEYQzzdprgLCcmX/dkeHFN0LABv3cNLjml6igbYDdHXqsSnUgwk3GduiDYTEanu7J1
	/+ZXB8bvAKKD35PVBbZ3qR70WGwiLD5obo7FKUDWDK5wuMDna/awT8Kcj8q8CcJjITDf0pa57p7
	qr8cAXkUPV+iLD7BRL/J8d5uKp6UD2kWdhes5ZzWmfkdEqJqQl/S4v412URLhPYLkYZ1/jBbV2b
	S8Oby2MZrpATo0Iuz8qmcdlDVl7THy1td+VaZqrDJFDgp2kNdmLFko2yASnI6G+SuFpL6FgslT+
	LMU/H2qoq24CmYoPK+daQsN2iDIO0RRjtQ+nA+0Pjkl2Rxgtospcr/4cf0Bxl2++xPRUftp51fn
	0qIjnNSslWUy8QZ7VXckN1zOg83w=
X-Received: by 2002:a05:622a:4294:b0:50b:34f1:6309 with SMTP id d75a77b69052e-50b3753e998mr199286021cf.49.1774293812981;
        Mon, 23 Mar 2026 12:23:32 -0700 (PDT)
X-Received: by 2002:a05:622a:4294:b0:50b:34f1:6309 with SMTP id d75a77b69052e-50b3753e998mr199285611cf.49.1774293812310;
        Mon, 23 Mar 2026 12:23:32 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644acb52sm33388113f8f.7.2026.03.23.12.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:23:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: eliza: Left-over review fixes
Date: Mon, 23 Mar 2026 21:23:23 +0200
Message-Id: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuTwWkC/32NTQ6CMBCFr0Jm7ZDSkhpceQ/DorSj1ADVDhCVc
 HcL7t285Mv7W4ApemI4ZQtEmj37MCSQhwxsa4YboXeJQQqphZISqfMfg41hQjfi1b+IUTeVck5
 qq6sjpOYj0m6k4qX+MU/Nney4TW2J1vMY4nu/nYst9/9hLlCg1UoZLXRpZHkOzPlzMp0NfZ8ng
 Xpd1y8u2HUWzwAAAA==
X-Change-ID: 20260322-eliza-base-dt-fixes-6b93dd26c697
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=guPYou0GHQCfyONXvBvRBR/VhsDUO246QcAdqWLTHC0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwZMtGmECT8qD4sMYZ6fXCRUqwt/jna6ONVZLI
 ndVJuoI3giJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacGTLQAKCRAbX0TJAJUV
 VgZxD/9KnJ+8pTKIMJNz7CCXnoFsachQxNbgZa9sfSvnSE+W/xF7owKtHOMU3Qi/E0HtGET73Wp
 bkYl68NucagnSJmolsYc+9ye06ospd53/Y4/RHiDguFPrCldOh43Zw0cbDaQWhv8wgc+0/g5XV9
 MVrvbGpIJ5lvL8GOUA/XKiNiJ0OSJ+h5JVhKECzlxZI3Qg31MChaEYV+6g20UTuFvzC/dEzrVYp
 9DYrzPf/XIXDL7Cg3HcP8Bizd4CWss9OqU4e+Ms0g839hSW+UBi1ValaEA/THAfV/9o2Gq53fKC
 wS7erI3fd27+xwKYTwjhvpQ2/OKWPY5OKKprftajxPxejascBeSHhCiqzj3qNIhOn//T8Bp1aWB
 I5yU8e+nfHfRtP7Ix8m4m8nD+q1hnDsNDTHasTIlL2kobr53blu691QtUfdGUOeuUqP5ly9LTwY
 dFQzqMgC0eknM5B/RiWXvixOdbjIpi8PNEgzpIRl8obUKUAY1En+rRSI99BhiwK4aZEhHYANcKK
 JntjUXqUXwoNSuCMMWmLC+NiNBC1TnGrijQff7H/C6SSrAn+em9Cazw7uatRFakn4KUOPvpddvt
 XhoyENCCCbuZFWlhqGWBkylqe+Nv9g8Nz6V2THChAYbmIfWOI2XfT0LLXSaubI3pLc/TR1zUb1W
 wIXzR7hH5NxYlbw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c19335 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=6mNy2ig4jJ1XD91nwuYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 8dhNAgICP1NUcrEcqOxIXnUaHtVcEPMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MyBTYWx0ZWRfXxqruw45i/9Y0
 pjDSwwGVbmhA8yfCSKeE9KrEavaXikxwtG+nKub4E2xqRncUORvKqMep2EfNAcu2NuQM/5VnKrE
 jE57kfj8f1+KjORJrjhnGU2bO5gp6tWEK7OUjCOA3Zd5I7FdVfvvv/ijdTVwupw5wQ/afemYKQj
 1X9UTS9+gDDcDzRkNV70hhxL6Ll84EnQ6//M2z/IkNEf5vwzljyB87Aj8xCQdWKRAEdXme0J8Sj
 143tGs+VrXte4mINCoJzVKx7+9I2di55ZpNCvaU/92huiyezhGwt6uL3mHnFILRpros8XdnVu6G
 MbYCqvrhCYMejWTehYhOPvE0vx7jLH4JIS2/z6SoWnjayIwnlRMyDLj+zZwb94Znmgphb5EslGf
 FlWiov+6GkSMlDrZinvkjIJhZGg4t77mjrJD6XH6kMbzzDQlkEMQ4Y3GmnlrFAx02z2Y1MGFoSl
 r1Hfk/JHKoRHjOAMJXQ==
X-Proofpoint-GUID: 8dhNAgICP1NUcrEcqOxIXnUaHtVcEPMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230143
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-99377-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1ED652FC9F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some review comments were not addressed before the initial Eliza
devicetree support was merged. This series addresses the remaining
issues.

The changes are split into three patches:
- one patch with coding style cleanups
- one functional fix for GCC/CX power domain handling
- one functional fix that adds the msi-parent to the UFS node

The MCQ mode was enabled during review in anticipation of driver
support, which did not materialize in time.

Bjorn, feel free to squash as appropriate, since the original commit
is currently only in your tree.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260323.
- Replaced the third patch with one that adds the missing msi-parent
  property. It turned out that the MCQ issue was related to some GCC
  bit missing, but this msi-parent property is still needed by the MCQ
  mode.
- Picked up Dmitry's and Konrad's R-b tags for the first two patches.
- Link to v1: https://patch.msgid.link/20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Coding style clean-ups
      arm64: dts: qcom: eliza: Add CX power domain to GCC
      arm64: dts: qcom: eliza: Add missing msi-parent for UFS

 arch/arm64/boot/dts/qcom/eliza.dtsi | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)
---
base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
change-id: 20260322-eliza-base-dt-fixes-6b93dd26c697

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


