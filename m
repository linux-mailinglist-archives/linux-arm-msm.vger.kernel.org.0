Return-Path: <linux-arm-msm+bounces-118640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HbIADd+GVGqumwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:34:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4A97478A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:34:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j0BbZymI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NmaRTDO4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118640-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118640-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DF1230179D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB5F380FF5;
	Mon, 13 Jul 2026 06:33:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D983624AB
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924428; cv=none; b=pdcnjvWWTvKZiEbc6F9zqUPdKbp8P++/Iol1AWJjo+3wywsGm1Qv6NFnMFtBTF63XoMwNxhT2ae3yLKmv/sXUkd83Nqf4p0dVkYGwy1cwkwR0zQ2L82tAGZ/fIWuszad99Q3LLV1R5fXKey+hto8AQO5av7wYdVch3gSLuhQWac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924428; c=relaxed/simple;
	bh=8W3aRKMz/WfFuq0LNeeJbhR9b/9qOM7hdVACENKrwX8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gu5r4lFub0dEV6Nz1XxI84GoiVCOP1t8ifMMenWFN8DLNwRk2Eheq2DtBP30kQBc1JDBEuacvpDUZq5Kiz3sf1wdIzaO26r10ig41RLG3Uk3hEiGHAa5hLBHUSNIvcVuBdjVJlstUn2nJJDpuAv05h0PizUpruAgBWTKlj25kS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0BbZymI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmaRTDO4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nt0f507388
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U4CGdOHbwaPSoD8wXR/JIf
	z6yS9K0FaSV+nsWe19NoE=; b=j0BbZymI6u5ZaPIznBk8WjN+GFnKCEGuiecXZg
	Q/jiahLRmT9vxT03OoqE+FwGSwgHIFxJ6FUZr6s7cuhembZTdtax0QxNrQP9iCC7
	EqePeET98qJp57IyO77a2r29YwoDPQszBHHrirM0xFUccJ9KCcykHj+wp4LO0QSw
	Aq0MW31hXu5h1Su99+F0aMIQxdJUtfVpMy9ns2BabpfK6v/KAT8zsX2JtHm99s1+
	8ei8tPT0UvAgSRF09QJUz7tKriWSNTJ2GeND64ieNSQLvUDKqQpTVfvNg4YyfgIk
	1Dqiib78pmzGywIDv8Jda1cUiQ3qUzJS5bnp0IPI4GL+3rBw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8g4f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so4210408a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924359; x=1784529159; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U4CGdOHbwaPSoD8wXR/JIfz6yS9K0FaSV+nsWe19NoE=;
        b=NmaRTDO4ixExDzNYORui4iha2Nc4pCU4A++kMc4/oFu7d0T/AT0cnuCNjmZaMgMSc4
         4+DZbeVep4FFCNp9AutUzDDuNBdxStyWzZx8SI2zg7eWJTLd+68zwmjv+0PDdEisV6bA
         gCzgDHcRQVpGcNyrZ9j2UeN+NT2iVVxcdJ8672lw4LicH2n9iaY/06IMA9rKM/nkpFmE
         Ts0cM4rCX4o4PHLZOmprVLqB7n5PBUWSpOELWsYJv7shXVGAVcVwolOlOhNprYOheeSX
         fUI1m2UpiJmX2irUCekLDwnrUWqX7mdd+U1tcbxorcsDHawvRWCeS4E/SjhffsLK8+99
         hIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924359; x=1784529159;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U4CGdOHbwaPSoD8wXR/JIfz6yS9K0FaSV+nsWe19NoE=;
        b=PIe8fsCbaGdcDyv54ROSfoYF4/faaGIziQEaCn9VOfKGUb/PAG7Lv6mXqAxP+uuVLZ
         3wCbE5D84GpPw7jMeK479d95xRMFk/QjVkr/rD8c/oMTdxV/JPommpr+qHPe5ryYG95x
         1TkXF31+zR7cwFgyydTXTo19EoQ6F+PMqWt78g1Knf1vMnzxO6dXrAeK2b1dI3NSMAqK
         7YsrcOAb5qe4+HlLyHzL9bgxAoGmC/wLEbuaTsdPax3edMopU//c51FKG+LCr+ctAVIk
         RXxVDJJnDOweEQ7JoCNm8q9EAkw3GoVl5LcyAf9D0YOjouP/bJRsXeZlm9WIIPxO4mhh
         DDdw==
X-Gm-Message-State: AOJu0YymJBIeQGXD5tylIQ9iL0F9GxTPPLf7LH6pnlEMLO/s/Xvb4EaH
	UmG+B4gI7fKjCqefsYhzo1uhASouMupRUFQZmD8GiB1u/0E9MLGjKXB8sj7hHz/B1/Tl4cZqzSC
	hFGoqFJ5GC5PddPh3sb7bXfuEqCC+y0EbtDKbFoj0e/1blxMliEmIW0d4AXQZGlNlZEya
X-Gm-Gg: AfdE7cmWJJktLTmVFKiXnV9glx5bOX5nHXyslnyMA4GwDaAi7x4dudyTluiS84EI5wQ
	VmmMoo6dIdCYu9lCqK9MEu8fQnXnHlh0ICITz4wV2uf/Tn45OOOdOrCROYDy0/97O6EOAIEt5KD
	dOcFucmdYO/jPoRFY9/5H3rm52p8Er4zKQ9aMp0KfMWUrp20iC5FZhwP+O+mBfzu0XYr8IZGhoI
	yTifxqc/IWkaX17HGhjnzyr+E/8h+qpENPj8bPy8B5G5VJ25Wfwo70HZP7AhatB8V52aEfQnSvb
	6OUso/L5aimPOg7D8BrKhJIXpyNzbkFHivg4LRboy84ldxXnFmSBL46RWl8f4QovJLUwKOUHgKV
	q56L+Utm07eTpROmMqjRP/lcpsomG3hRfup0TCxa+7gyz5VzqCTzwocH5pg4+KRyyAqkGIAU8zM
	jgEywn9SDZ1CkmmjbR1CHBJA5OdH/kwBk9KvYWVIKV
X-Received: by 2002:a05:6300:2290:b0:3b5:4fff:fa0f with SMTP id adf61e73a8af0-3c1109ecda0mr7442748637.14.1783924358927;
        Sun, 12 Jul 2026 23:32:38 -0700 (PDT)
X-Received: by 2002:a05:6300:2290:b0:3b5:4fff:fa0f with SMTP id adf61e73a8af0-3c1109ecda0mr7442728637.14.1783924358423;
        Sun, 12 Jul 2026 23:32:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:32:37 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v13 0/6] Add new driver for WCSS secure PIL loading
Date: Mon, 13 Jul 2026 12:02:16 +0530
Message-Id: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCGVGoC/zWMQQqDMBAAvxL23IVE0xb8SvFg1027BxO7iUUQ/
 26o9DjDMBtkVuEMndlA+StZUqzg2osBeg/xxShjFdDY5mbvzqLOmgjJBz9acsFfCWo7KwdZf6N
 Hf7LyZ6m/ckp4DpmR0jRJ6UzkteB/Cf2+H6e0hpaJAAAA
X-Change-ID: 20260710-rproc-c4f4d0c1f45c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: l3WRZDoTf36KRuhKGVPEL1e9ZKZ9geBf
X-Proofpoint-ORIG-GUID: l3WRZDoTf36KRuhKGVPEL1e9ZKZ9geBf
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a5486c7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8 a=XZO-Djk479NXzMOXMbwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX2dBVtY1jpxsb
 zfL/NtVDmxrNK4jJFQ70QdU4BsfArhC6uDjbyG1ilb+7HAhEJeABofewtwMvD74gNGTzOFM56l5
 71UwWu5sEq9vFOl8AmRfrflli/M5+Ns=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX4615dv3qL8Nl
 m4tezsAO+08beD+KEeFBFDqbVl0UgrvRPyDlzRvXNp1gVqCozJZ+xAwOBKd6rUNXA7MPVMHhyQA
 DX+q5KGFZdqf+Ck07GvasHmaxpIHTDpGI/t1V0mANTKY3xwFloditpkGds2HyKcDCtD7CIxRwlq
 CFd97ODf2Zi1TJxOkhfW//ee82+TkixUX1IWpqUoqu8aGX5JYCt5zSsgFfuSb98kTSkKNHTecJa
 N0IwD6xIaKKfJ7bcSgUQmB8o5ZvMw7jjVTFaFoPtUWAetykPp0KU+M3FeIc11klYd49YZIXTsrA
 mIMD1wYC/4i6opClK6AwkJspqg13pxTVAc4YxC0ffgWgkP+VYDx9A2ve5AM9XTFYZ2gz9BG4Box
 jI9N4O/hefG+8072pfG0cxIpYrpUeyxlJtajOm0fDT6XSCrN+Fo+JCX3xaJ+ymPtuA/B6FtaUcF
 VpHsvCoX3ogRU2yE0gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-118640-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:manikanta.mylavarapu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:gokul.sriram.p@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:george.moussalem@outlook.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F4A97478A5

As discussed in [4] posting this series after dropping IPQ5424 support
to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].

Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.

Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
I've resumed Gokul's work as the last submission dates back April 2025.

- Secure PIL is signed, firmware images which only TrustZone (TZ)
  can authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
  This series adds a new secure PIL driver for the same.

- Also adds changes to scm to pass metadata size as required for IPQ5332,
  reposted from [3].

[1]
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/

[2]
https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

[3]
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/

[4]
https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/

Changes in v13:
	- Rebase to ToT (First patch alone had conflicts)
	- Add 'Tested-by: Vignesh'
	- Link to v12: https://lore.kernel.org/linux-arm-msm/20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v12:
	- No code change
	- Rebase to ToT
	- Change quicinc mail ids to oss.qualcomm.com mail ids
	- Link to v11: https://lore.kernel.org/linux-arm-msm/20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v11:
	- Add R-b tags
	- Rebase the first patch ("firmware: qcom_scm: ipq5332: add support to pass metadata size") to top of tree
	- No change in other patches
	- Link to v10: https://lore.kernel.org/linux-arm-msm/20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v10:
	- Add R-b tags
	- Remove unused fields from 'struct wcss_sec'
	- Remove glink and ssr subdev if wcss_sec_probe() fails
	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v9:
	- Add R-b from Konrad for dts patches
	- Renamed qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
	- Restore clocks & clock-names in above yaml
	- Fix DCO on two patches
	- Link to v8: https://lore.kernel.org/linux-arm-msm/20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v8:
	- Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
		* IPQ5018 support added in v6
		* IPQ5424 support dropped in v8
		* Updated to use IPQ9574 as example
	- dt-bindings-check and dtbs-check passed
	- Dropped IPQ5424 support from drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Updated copyrights of drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Change 'qcom,smem-state-names' order to resolve dt-bindings-check error in ipq5018.dtsi
	- Dropped changes to ipq5424.dtsi
	- Link to v7: https://lore.kernel.org/linux-arm-msm/20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com/

Changes in v7:
	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
	- correctly sorted smp2p-wcss nodes in dtsi files
	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com

Changes in v6:
	- added patch to fix IPC register offset for ipq5424
	- changed phandle description for mboxes property in dt-bindings
	- updated bindings to define the right clocks per SoC based on
	  compatible. Ran make dt_binding_check for validation of all
	  SoCs
	- use of more descriptive match data property (use_tmelcom) and
	  added a condition in wcss_start to not error out if tmelcom
	  isn't used
	- mitigated potential off-by-one
	- adopted use of of_reserved_mem_region_to_resource to acquire
	  memory-region resource
	- added driver support for ipq5018 SoC
	- corrected size of reg properties as per Konrad's comments
	- added patch to bring up Q6 in ipq5018 dtsi
	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com

Changes in v5:
	- retained all the patches as in v3 and addressed comments in
	  v3.
	- reverted changes to dt-bindings done in v4 and retained as in
	  v3 and fixed firmware format from .mdt to .mbn and retained
	  reviewed-by.
	- dropped 2 patches in v4 that adds support for q6 dtb loading.
	  Will post them as a new series.

	Following tests were done:
	- checkpatch
	- dt_binding_check and dtbs_check
	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com

Changes in v4:
        - changed q6 firmware image format from .mdt to .mbn
        - corrected arrangement of variable assignemnts as per comments
          in qcom_scm.c
        - added scm call to get board machid
        - added support for q6 dtb loading with support for additional
          reserved memory for q6 dtb in .mbn format
        - updated dt-bindings to include new dts entry qcom,q6-dtb-info
          and additional item in memory-region for q6 dtb region.
        - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
          Kconfig
        - removed unwanted header files in qcom_q6v5_wcss_sec.c
        - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
        - added required check for using tmelcom, if available. Enabled
          fallback to scm based authentication, if tmelcom is unavailable.
        - added necessary padding for 8digt hex address in dts
	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com

	Following tests were done:
	- checkpatch
	- kernel-doc
	- dt_binding_check and dtbs_check

Changes in v3:
        - fixed copyright years and markings based on Jeff's comments.
        - replaced devm_ioremap_wc() with ioremap_wc() in
          wcss_sec_copy_segment().
        - replaced rproc_alloc() and rproc_add() with their devres
          counterparts.
        - added mailbox call to tmelcom for secure image authentication
          as required for IPQ5424. Added ipq5424 APCS comatible required.
        - added changes to scm call to pass metadata size as required for
          IPQ5332.
	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com

Changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof
	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com

George Moussalem (1):
  arm64: dts: qcom: ipq5018: add nodes to bring up q6

Manikanta Mylavarapu (4):
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bring up q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  64 ++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 +++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 +++-
 drivers/firmware/qcom/qcom_scm.c              |  14 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 325 ++++++++++++++++++
 include/linux/remoteproc.h                    |   2 +
 10 files changed, 723 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
base-commit: next-20260710
-- 
2.34.1

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
George Moussalem (1):
      arm64: dts: qcom: ipq5018: add nodes to bring up q6

Manikanta Mylavarapu (4):
      firmware: qcom_scm: ipq5332: add support to pass metadata size
      dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
      arm64: dts: qcom: ipq5332: add nodes to bring up q6
      arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
      remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml      | 178 +++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  64 ++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  62 ++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  60 +++-
 drivers/firmware/qcom/qcom_scm.c                   |  14 +-
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/remoteproc/Kconfig                         |  19 ++
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c            | 325 +++++++++++++++++++++
 include/linux/remoteproc.h                         |   2 +
 10 files changed, 722 insertions(+), 4 deletions(-)
---
base-commit: 44d18d44c5999ca30c3328a146b308c385eeee5c
change-id: 20260710-rproc-c4f4d0c1f45c

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


