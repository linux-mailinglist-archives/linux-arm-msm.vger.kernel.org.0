Return-Path: <linux-arm-msm+bounces-109509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGIAIIQ9E2rm9QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 20:03:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A783A5C3553
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 20:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30868300734F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 18:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80478306744;
	Sun, 24 May 2026 18:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gb0yeSzU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyNUSiWd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE0B25B0B1
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 18:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779645824; cv=none; b=UjMEwUw6HYEd4zkLznZAW9cibXu+9Z1d3r2eh0mwdAUy6ZIS0y9zjO0P1WL8PK5DME+bk4SeZcgDmSM7nCYAoVYRrhTVfj53ENTPQqLExoQHoXg+P6Qp2lo1fhTN/q8oz1TgmTf+31k6ApoR7DzMwh1y7KNU/LNHNy5QqnPqvEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779645824; c=relaxed/simple;
	bh=skCGxOgaz7scnCaEUfPg3Bw6m/3s2NMMlyoC1wxppBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=crSM3aef9+Bw8bWDhnjVeFns/9EMsfEmO4/sFeU/efLEd+E9PPWk5GV/z9cQebcpExnWRIPnCluSRwjjAdiaeGJPK7iUEAN0slg5XxAr5XWYsNgPdQVG78yC3kIMfdv0qD/9E7M0hQndZwFJigyEAgcQkXIeQzHjWLk7140mLbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gb0yeSzU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyNUSiWd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OFnGiK2075515
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 18:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=reEe2mjqmOyuqKZeF/4uc0
	HbKJY/S/Q3G/fnmXlp3uI=; b=gb0yeSzUeOZJDL9TQiiEWCJpgd95YzZVtyoir6
	gAbiaS32KpH6yVzYNUQmQJTtOLiP2oWRoN7CqkjKCGEdL4ELfXCm8Mz6pDi6N3MR
	47v6/0Fwf33q1o4KGe2s02oj5VtONsbDjRPdHtngBkm/qF5Tm7s10WHIv4C6B0Lw
	Zn1St00YX/4dVzYTOdnxZoFtheH80czy+PHghN2BnhpJIe10wzmIHZ0OMy+n8tUw
	+Co4wZAJZXXKBa4Fi3CznFBW7mGYov+6gxPGjlJRgReoK+0THTKO99M4OYkHLDLH
	GipEgIizdIo3KxmbpJBWfGHgvjYvo3yDJZgXpAsaqQyc/bWw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb50fumwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 18:03:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368ac44b26dso7710232a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 11:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779645822; x=1780250622; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=reEe2mjqmOyuqKZeF/4uc0HbKJY/S/Q3G/fnmXlp3uI=;
        b=MyNUSiWdrDOTeV1aQinOhBgxIXi8JMibhwzTMnY/w6Q1+1bf89zXNO1+p3u+yUSUsK
         7ep/FvcuA70h2zbxmoWuxJ6l7bn8QTdV9ZRpZCKlL0UBteIB6hA2oi9PrydH3XKV5ben
         8szSkrdaJ2ZA/EddMI9+ZMMco8M15+tmKpRs7mFxyFsALoWLdq/iTKzIFqMe6sjaf3Ob
         p8Q3MLSdtVPME3AcXeQRBlanDJjFzqQm5+3eOxdBd0wYEP/mMKdMaVtRCszeO69GA3UC
         xhCQmfQMfYa+FC5069clakkhAiljk1FAUUjz/nkKVQsz6eAP5KodlRAiunCiGXXU2KoN
         /AKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779645822; x=1780250622;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reEe2mjqmOyuqKZeF/4uc0HbKJY/S/Q3G/fnmXlp3uI=;
        b=PYyE3ntdHVmc/WKeAV88ZTZbq4mk9LoBBejBbo9yOdLh2gbTGd6lzdQ7RbV+q6kw6i
         W9dNPMmjtggfeH7A26IXROYHwu1AS8pxYVFg8Up7goPdPV6j5FaZCpRMPALcOVXHQXja
         VBiMCjSIpAcPppG1GzgoNBTzsj2+7svsY8M6k81H4yntxC+riUG4f5v0+v5CKKfdWMfm
         K7vdoHJC6FzwEaRfhNBjLBkYSD2EvLlyXqynGIcCOGoJIO4zDbF+dHneXBM91XgGpOWq
         b84LTH4HLTOJ/78NKqEW8X8sOsIMyryfXdAc3cFhbxGcDPFnpYnA6bF3bR9MwN83RR55
         coYg==
X-Gm-Message-State: AOJu0YwzZk/4CnxnQhU+lxLB9+8wsZd6iBPY/XMr33TQpREZ0lAG6tRa
	WpWXrqVks2iZZ96uDxFKeHCdvHnk2mOAARoDzJIwHgELVnPqDC5JKCbAPqlxKGPpap4h19rE74b
	egDYSUEEzIBPJ3U8/ve4yu8I9lYSolc6bNBSNNVFrAlxmYl1tHFhlp1WLZaXUEHjTWrk9
X-Gm-Gg: Acq92OHOQO8VBiwt3oM8e32tpdde1/f8qxBjfH2bL+9KSy2T1t7Tivu6nI/3ivm+ftA
	D1LqBunvRXhf5RyE1GUgxYZH+ABXTu+K/lNhzRhZigpfa5lIMUBL5n1inpv4Tw1H3/YRYX6BjNn
	35fBUATcAvrs9qo9SLU891p1FlesBiCBYly3lns2enL9/g8V8YAwb0BJJA0kdCFNBJUTE+jybsT
	Lnowm9kAZgaKAF61wgo/P4wZIY35tRmLMfLRlXm/gr9WTk7Rj2coUK4lxu6XxnulQ1awC/BFzzl
	rbu46w1mj8EZChNkcO9eCTMswzWpqFgaPE2k7kkMaVyuGSIAZbF7Huaxedw4OkcHLYTE4K7Yorx
	eZZNgTKDD17zkRaDyvQmyzSqtTXU3d3R1cRpqR9BqlEq/
X-Received: by 2002:a17:90b:238e:b0:36a:7127:d9a7 with SMTP id 98e67ed59e1d1-36a7127e0c5mr6982261a91.14.1779645821862;
        Sun, 24 May 2026 11:03:41 -0700 (PDT)
X-Received: by 2002:a17:90b:238e:b0:36a:7127:d9a7 with SMTP id 98e67ed59e1d1-36a7127e0c5mr6982250a91.14.1779645821350;
        Sun, 24 May 2026 11:03:41 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a726348e2sm7252659a91.2.2026.05.24.11.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 11:03:40 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH 0/2] Add EPSS L3 provider support on Qualcomm Shikra SoC
Date: Sun, 24 May 2026 18:03:34 +0000
Message-Id: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHY9E2oC/yXMQQrCMBBA0auUWTcQx0TEq0gJSZzYqVJLphUh5
 O6NunyL/wsIZSaBS1cg05uFX3PDoe8gjn6+k+JbM6DGk7ZolIz8yN7RIuKeR2URfSKTwjlZaNG
 SKfHnN7wOf8sWJorr9wK17hyJRKtyAAAA
X-Change-ID: 20260524-shikra_epss_l3-522afe4fb8f5
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE4MSBTYWx0ZWRfXxmh94DH8oT7K
 +N2AvVQ9fkXLtCLR3/kCpzDKleVjnb8fQ0/1bCxQBYAD//6UlDj6Zc+wl7fsA7nx63TCrZq2SvF
 +zFhMSKIFHxtxzY/NVhcCIVXj3sC0Zy9fygeTWBCRxDxrh3QG2Wqi+DlxlyzOqO4IL7/f2d6NyT
 B8HGpWJjZ4zA4V6Ro0Dvx5iElzrOjCPLq8MqBHaGetfS8oVflmfkUNGK0VW0UxzFgR5XZpvd2hq
 Y0iJd2tx7UErhcBo5ZA5TFzm45+jl1EmY6h7xpskw+zGxSx/A6hEG8AlcRoiW25RWViF4QSZiUg
 NyKwUs0cJEkzld1M3W4mmina9fu2fY8OWqUDIK1/jBPOUzhQoZ/KK9XmygbehyuTOGFmhK4aDlq
 cYUJvUAez1hccSXH1OsGCYnmu2Svz0JRSiT4XKESd0yIZ/kuJjKHkVyhCmdNLLx57zWgiydJUj+
 8ulFErOLG3SD4yHjzlQ==
X-Proofpoint-ORIG-GUID: b8HNB2VTM9w1dEwhpf4BlCecK5EgQgy9
X-Authority-Analysis: v=2.4 cv=UdBhjqSN c=1 sm=1 tr=0 ts=6a133d7e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pzfQcldl9xs5PnSv4NYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: b8HNB2VTM9w1dEwhpf4BlCecK5EgQgy9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109509-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A783A5C3553
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Epoch Subsystem (EPSS) L3 scaling support on Qualcomm Shikra SoC.
EPSS hardware on Shikra is similar to other SoCs but supports only twelve
L3 frequency entries (LUT). Reading the LUT beyond supported frequencies
can expose incorrect frequencies.
Introduce new dt-bindings and compatible to represent this constrained
variant of EPSS.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: qcom,shikra-epss-l3: Add EPSS L3 DT binding
      interconnect: qcom: Add EPSS L3 scaling support for Shikra SoC

 .../bindings/interconnect/qcom,shikra-epss-l3.yaml | 60 ++++++++++++++++++++++
 drivers/interconnect/qcom/osm-l3.c                 | 16 +++++-
 2 files changed, 75 insertions(+), 1 deletion(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260524-shikra_epss_l3-522afe4fb8f5

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


