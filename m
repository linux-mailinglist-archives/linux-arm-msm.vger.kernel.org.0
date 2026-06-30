Return-Path: <linux-arm-msm+bounces-115317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k9ePIDh2Q2pgYwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:54:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B306E16D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:54:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FuIH6k8Z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DDrZ8Q0b;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115317-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115317-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C27C3041214
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E45E3E6DDA;
	Tue, 30 Jun 2026 07:50:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F5B3E715C
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:50:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805834; cv=none; b=II9ZMPZOE0JBoDmk/wFXQ8perWO5oqR91sUfCpiO0OrHAk2NaOGUiMHOpP/k9pEpGcQ911cGvvwfwQhhpU/jpucwZ4P66r6IWme8RSF6kceWBy1WhQTCs4TNTcmvdz4OoTffkG/eVI+SfAU6G5+GrTfZ42xofgzh0B2HVwIXXi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805834; c=relaxed/simple;
	bh=fKMU1NeGGUQY41fhAOV7CeZ1kxRC2hDpCeMw00fNp+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=heNFWJ8h5feiloojfX7IIyQIB6JnL4UQX3Tm7DonytJrNj9jiwtuyfXrT7e04lh501vTfNaF+nASFNjYBamg+gQ/luXGihzmTLVRWcLkoCwrLnZvj0jzv3/S+28dbjgMp6HPFOmQDLHs0JvBHwkp+2gfYDf6y9VD20U4jd0QCpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuIH6k8Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDrZ8Q0b; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CIWW1073739
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cDcsvQ35yvivZlq3oSfzhB
	6wOm05GoaQYkiAbIzSDPE=; b=FuIH6k8Z+hjyc7wMKbqXG2UjcsqHoy01up5sND
	VDZaWzg1EomW3IJEsOr6ybWl6XDD+i83yfJYVHMsjEOl16DUjyipBLPyA9mHljK/
	2V2wgxE3xSuhMl6y0vg7jVrRxtKMYf4453V5DFEHDIUAgZ7uaHCaqgNNU8buLbtu
	qqEm2xRmMb5XOPJK+QCc5IqCnl9QHAjyUa5+HLO7o7mKmacbOzN1Hdltm6hwzi8L
	52iH6fP+hCm3pUS6kmIoG2oWwOosr/ALsBjD9ynQtGc4VykYGUmTw3BSe7f62mjn
	gbFock+yYcFTvmU0V7ZgbIPgKwv33pZw91RoGDyDHS9VfOFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k28kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:50:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92158791d14so558245485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 00:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782805831; x=1783410631; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cDcsvQ35yvivZlq3oSfzhB6wOm05GoaQYkiAbIzSDPE=;
        b=DDrZ8Q0bIPPCq5Pmi/mqYem0HsHXZaNzRJWLaOPRO8vzN9WLtzPZpKwX/FF8EhuF3Y
         2+/SV8TDfX2Xke2oiV7GfzRZn9/F0ZYJUh5brPYBT/wM8wfYXUhrZb4e/SAcTFIsZEYr
         A2WdjjejtIlPFviGGm8/V6DYHe/Ndkmfps+DKFc1jk9m/jPglEPTnngbQZLKLyt+IjEP
         GA9CZfrlUjfRex4BwUx82ji6/PeY4ShD1HcLGUtfaANZO5mFM9LDqMFSt3QgeYmzWAub
         ngFZ56axuGvO3apjYqaPoJdmVBcRiTvBao451yJ68FN2+O7Q7iAYMnX688N5KOsDDWJI
         BxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805831; x=1783410631;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDcsvQ35yvivZlq3oSfzhB6wOm05GoaQYkiAbIzSDPE=;
        b=YZt/vPRrIjlwQaidT3UFPQR6q9ByOdfZJIx/Vv5/oXx9SiubpmqqfUaoC2XE50YIBE
         1DhJ1pw12UkTpFqdEuLrBbB+ps15njHQ9slytyGnLgaUfQg/mLwyC2mFXPoIxRoNNSXR
         gA8XxVico8wFzQygfdInpk9rFKlGf8p2ece1lWpigJgmZOwO/W7CwvEhUqiHzKKoI1++
         GGxQGxixz1cG/90uhEFJMQ39MGSHbzpnjGis+OiUXL09DsT7NRNruszDAWZIoRINJwgc
         1hbXGSWNhgOv0TtlzNO9iyfJ5PuVA/xuWBnMxubzo6SJQMwO+BAO43FIVoUE0tO0XETB
         KA4A==
X-Gm-Message-State: AOJu0Yyxi+UnR+8heN9j4zyBrz/JIOk7FHxLMiLk6KXdg5bNTy88myka
	5gkWOYu3F+1tDInYoiU1nSPbdDVx1VSVT5gNOTxc3rntCsTg0YbI90YYwxnrEEz8BTOcAEHK3KB
	RV4WE8hz/ceYocNEoUQ9YB9ciOQFm1526QXFvqqNGXMK+h9ZZEUTSyaUAdXaoq6gQ0Bkh
X-Gm-Gg: AfdE7clNy/gGk2IQLmz6ooGatilnijteSpx/xw+FrTmZ989DVpVId80bTE3Ws2iDW/W
	WWJFRacy3/ai+M4DiL5tPCASbn+a6MPJPTLsmzA6IJ+wUQcxsaymEuCFTdpOwXHxauV5sURZc8y
	/4RG19PqsB8Y73XfjVeWGxNwAMQwlbKgOlJ6x5yllIgxHxpqcuV2R01JGIIpvq0DiHQCi1rOjBT
	AaP6MBd1WD8oWw0kRiLLsZaXmVIDyycGTbx0Weuom3LvpPDv7qyL3/HYsM9PgRjpC5uXTcLWTA8
	FK+k1PbeUUYvwiMhV7cVMCHMhw9GU7JF8hLSlpOtpr9mSNw84Q+WyNBsGiJ3QK+JEs0xfe7SKeD
	PwMVgoDK5iYO5Vqk=
X-Received: by 2002:a05:620a:444a:b0:918:532f:9693 with SMTP id af79cd13be357-92e624e5a2amr412657785a.28.1782805830465;
        Tue, 30 Jun 2026 00:50:30 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:918:532f:9693 with SMTP id af79cd13be357-92e624e5a2amr412654785a.28.1782805829771;
        Tue, 30 Jun 2026 00:50:29 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bb1bf712sm18766245e9.2.2026.06.30.00.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:50:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 10:50:20 +0300
Subject: [PATCH] arm64: dts: qcom: eliza: Add PMIC nodes for CQS SoM and
 MTP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADt1Q2oC/02O2Q6CMBREf4XcZ29CWcryK4aH0l60KltbCJHw7
 1bAxMeZTOacFSwZTRbKYAVDs7a673xglwDkXXQ3Qq18hiiMeMijApWzOMq+RXrpt8DWDUjzE4V
 SOLRaWsziWGSMq5xCBf5mMNToZUdcqyPbqX6QdN/fc2FonDzbHTOohSX0kFa7Muhocfjjw79YG
 ex1ypLT5pCzu1HWsIQVOYt4WpRzAtW2fQBMwFoq7gAAAA==
X-Change-ID: 20260629-dts-qcom-eliza-mtp-evk-add-pmics-733a716d8e0d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=11340;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fKMU1NeGGUQY41fhAOV7CeZ1kxRC2hDpCeMw00fNp+M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqQ3U/8rucHFLXLLvT8eauRAQxk5cIsrWL9AV/q
 N/5v6KibXCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakN1PwAKCRAbX0TJAJUV
 VvpqD/4yGpUbboPlTLNQf5svZPpOcj74FrN4Efvr8WhFUC1VeV7soyDjvGxZEee2fYk2GVGa4Gi
 Z7ua8yq/vJK2EzqD3AtNAmgil/ezsNaEn31vucWUtnSljrJqo61X83JiVMGD/NG0Popn6uaQJ++
 4zh+qUvkn1Ki5Zlap7ziUAY8O90tinTj/jfC5xiMwvW7fNZFtDImHda+rc7K3TwNoy9gBgYdsuW
 xYidKhe7pk7OVvwnY6TghM5gzvNObbbk387oHXdD5+PVKkttcplhSskGZztsEuXRuGRlQaRRj1P
 oH2f6jIYXSjHNM/ECpSReOX4TNomJz5GJ1zE2lUyZBLBKbrjpLLgiemXPFMQNWFWBx9V+743KgS
 8NfpbEx8+IS7nvxCSKEG+7YpVyuK8oNE5myqKeK+1i/RcHxt2hC6o+1PengcalIlGf2iipDRSzs
 EeEOcRzwNOaRcPF5nq7ePu2rYEtCCj/cTUJ4QWc3fg6zswSOcfLByuhwlfkMUxJXEAHFc128wOw
 TtpJQNXFoMQAsrxisrqWzLYOPQ7AVH0uWHQuP298XXnkJzCyKeI1496ny6GP8jmqYLzSK8GWHgZ
 lLL4PezYLtNSjsWfTOAqUBQPk7rwB3K8rLsho2FahHTY8y57seIwrM0PrJx2aQe4HdJG2ks4mi7
 pv138VKEyoxfhRw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfX31yG0Gp1CNdh
 tOdbDf1WhN4DLE1QXtZVM+OWUCUad2sc1ym2vE4eZSb6AYDSGxvJKySdQO2IqWZjrQhioycfc79
 TnXm95XX1nn6JUVba4NvYILwiBr4VXw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfX2FQy6qMPYoRz
 aq/Y8XplIdlBd/xR2AYiMeug/A7gpmAQ+gzXZrxj9qeLeRV+62lcz2wEGWXV7yi8eUMn4kpe45u
 ZWQYG9mB9/YkxUWYxpSvpdbGhbe6WqUcGKsdKIcQ/nqzRttvYxE9oPXRD788Hsu3+c5aVt5JQ+U
 pC8M38pR6KENHoNFXqgSRZSItFZrfjxFEOp7fLfruN3CAUAniDuuQpgAp9hvFP6zYwbSsgCfu8l
 y28/4DvYYoMP0OWgInGqqwcxEK8XBAxIANLYgRxhE8vAwizDUp6B3Mp/Pge2AZaB2u90xGKysvN
 BbrXkwAjVDXMKM2zxlmIVvtVtqjMnXGBLRsKh5IFyPvU0JoFnqUvPbAJPWrboDsNR8omKCXdiR9
 iybjqN4EpiP87yJZQHfrJc3lOdWkOsLtXAJgyvBbuct0NtbWOQLSpKu+lxC94rjevgKvdbDY2/R
 GRXxy6XOIlilIwqYLYw==
X-Proofpoint-ORIG-GUID: mPAEqEaLOeoYzoV4faksmI3ZqRamIErR
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a437547 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uEpe_3vvm7urPFSnT1UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mPAEqEaLOeoYzoV4faksmI3ZqRamIErR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115317-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28B306E16D6

Both the CQS SoM and the MTP have the following array of PMICs:
PMK8550, PM7550, 2x PM8550VS, PMIV0102 and PMR735D.

Since on Eliza there is already support for SPMI multi-master,
it is necessary to duplicate the devicetree description for each
of these PMICs, due to the SPMI bus index and address.

So add a new Elize specific dtsi for each of these PMICs and include
all of them in both the CQS SoM and MTP board dts.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi    |  5 ++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts         |  5 ++
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi     | 61 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi | 63 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi | 63 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi    | 87 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi    | 63 +++++++++++++++++++
 7 files changed, 347 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 33f4cd282272..318ae3c22351 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -9,6 +9,11 @@
 
 #include "eliza.dtsi"
 #include "pm7550ba-eliza.dtsi"
+#include "pm7550-eliza.dtsi"
+#include "pm8550vs-d-eliza.dtsi"
+#include "pm8550vs-g-eliza.dtsi"
+#include "pmr735d-eliza.dtsi"
+#include "pmk8550-eliza.dtsi"
 
 / {
 	clocks {
diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 1374afd9d14e..a7d6f9d52ef3 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -11,6 +11,11 @@
 #include "eliza.dtsi"
 
 #include "pm7550ba-eliza.dtsi"
+#include "pm7550-eliza.dtsi"
+#include "pm8550vs-d-eliza.dtsi"
+#include "pm8550vs-g-eliza.dtsi"
+#include "pmr735d-eliza.dtsi"
+#include "pmk8550-eliza.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Eliza MTP";
diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
new file mode 100644
index 000000000000..9b907f69264b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm7550-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm7550_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					/*
+					 * Current Linux driver currently only supports up to
+					 * 125°C, should be updated to 145°C once available.
+					 */
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm7550: pmic@1 {
+		compatible = "qcom,pm7550", "qcom,spmi-pmic";
+		reg = <1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7550_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7550_gpios: gpio@8800 {
+			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm7550_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi
new file mode 100644
index 000000000000..548d2aa83962
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm8550vs-d-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8550vs_d_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm8550vs_d: pmic@3 {
+		compatible = "qcom,pm8550vs", "qcom,spmi-pmic";
+		reg = <3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550vs_d_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550vs_d_gpios: gpio@8800 {
+			compatible = "qcom,pm8550vs-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550vs_d_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi
new file mode 100644
index 000000000000..4ad2cd189a6c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm8550vs-g-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8550vs_g_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm8550vs_g: pmic@6 {
+		compatible = "qcom,pm8550vs", "qcom,spmi-pmic";
+		reg = <6 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550vs_g_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550vs_g_gpios: gpio@8800 {
+			compatible = "qcom,pm8550vs-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550vs_g_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi
new file mode 100644
index 000000000000..e0ff4ff9c469
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	reboot-mode {
+		compatible = "nvmem-reboot-mode";
+		nvmem-cells = <&reboot_reason>;
+		nvmem-cell-names = "reboot-mode";
+		mode-recovery = <0x01>;
+		mode-bootloader = <0x02>;
+	};
+};
+
+&spmi_bus0 {
+	pmk8550: pmic@0 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmk8550_pon: pon@1300 {
+			compatible = "qcom,pmk8350-pon";
+			reg = <0x1300>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pon_pwrkey: pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				status = "disabled";
+			};
+
+			pon_resin: resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
+				status = "disabled";
+			};
+		};
+
+		pmk8550_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pmk8550_sdam_2: nvram@7100 {
+			compatible = "qcom,spmi-sdam";
+			reg = <0x7100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x7100 0x100>;
+
+			reboot_reason: reboot-reason@48 {
+				reg = <0x48 0x1>;
+				bits = <1 7>;
+			};
+		};
+
+		pmk8550_gpios: gpio@b800 {
+			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
+			reg = <0xb800>;
+			gpio-controller;
+			gpio-ranges = <&pmk8550_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmk8550_pwm: pwm {
+			compatible = "qcom,pmk8550-pwm";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi b/arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi
new file mode 100644
index 000000000000..1c29d8ddea65
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmr735d-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmr735d_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pmr735d: pmic@a {
+		compatible = "qcom,pmr735d", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmr735d_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0xa 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmr735d_gpios: gpio@8800 {
+			compatible = "qcom,pmr735d-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmr735d_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};

---
base-commit: 758ee0279ff3463f564cbb36687f4faa035b7878
change-id: 20260629-dts-qcom-eliza-mtp-evk-add-pmics-733a716d8e0d
prerequisite-change-id: 20260514-eliza-dts-qcs-evk-7f1419812659:v4
prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


