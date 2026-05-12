Return-Path: <linux-arm-msm+bounces-107082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FJ2OjgYA2p10QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:08:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9D951FCCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 416E4303103B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 12:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5804C0421;
	Tue, 12 May 2026 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZvoiO5aK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJgvy0CC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FB83A6F0E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587662; cv=none; b=jdoAIFetfkFrnO1HEmho+Ko1BayvVCxc0RCTtdEcxImps5heDIPYXCxTR9eZMFNafwVeRAstk3TAJJUEtU9+JUyXLNmW1+tZ7vlkAjZANWFi92Joe/V/mmSxJ3IolbKC8wKjCP4JGsGx9mnVPeV4O23rNackeQXeq+McTlXo/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587662; c=relaxed/simple;
	bh=K0hlM0lN30Bc68DtvvfoVqrg+eMKbU1QUkPAArNR96o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nIBhIIg9jmLX7XLTvCe+luVdqG+F/3vJEAUEEvfKUSeVpSoCjN2l3unA/tmSWuxLbcPGc6rnDs9rEgOFaeUU7rrMnKrq9SGgceJvGBPN94ZJGVxuLIK1mlg9w8IiXTuw46eTdFmfpUvP2MWhJSIfqUn2qGADZ7dtiy9aAuLNLks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvoiO5aK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJgvy0CC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBxIMd128828
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	euXmck1ELzC/OgIo6WW7EsF+WFVXfWU0hYGpGH6Jnlg=; b=ZvoiO5aKQTfe8/J8
	6fLvirWkWOFT/yzkXH1Fteey3X/qgO8vTUfz4/oKPFSZcZIyWXErDwkALjM4AVah
	RYp5ResAk71U04zrfqNf8s3UkRDQ36WCyu4qGXH+Zim4YxwcQ5KyU3ytqcJ4URiM
	zpIM3cZWPKD6lsLPv/gxgw26oOeZNV4ouJdY69qKRronIBvKPRezqUdN1XyqeaDy
	HNzJaKtKu76EV7HhcM2FEJ55xpLhDAJf8MXmk9AXmGC5YrJroBQmMnQnPmNpJ2Fw
	XSZm4keSRDbrPT17ey+8pB64TalWouYPdWqQo73X14ojEAM5mZZhjcKjKxTTQdgg
	FmLEHA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn0152-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:07:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82894155ceso2771132a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 05:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587660; x=1779192460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euXmck1ELzC/OgIo6WW7EsF+WFVXfWU0hYGpGH6Jnlg=;
        b=NJgvy0CChAKt1cAN7MGWPrZtokGZAQjLeh6JYWBYBBmjN6X8YwKahl6AQfzpBJkrle
         0auvK0QNedxWoNeVBto0O5Z+grgxUanYifTuW1TSA1D3DneGOelTyeebxXWCjSlEmx4a
         MUa6GGoeNzmCILH36Xx+hTTXCqAqRA9LVlzK3+snjJb++HMbAKZ8w+e6UtXzqw+mQJlk
         AQLMrdzAIGVKE54TvE3eIBwnXUn+llUo/CFY0twbQ7jhoQRvatMnIaZopfG+uHpuQpjA
         MQvgiCykA7U1HaSwbJGTke/oOIYnLsQiUxFj6WIgufPPnjuDiNV7gKlUYRQHgUKlZJIj
         gnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587660; x=1779192460;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=euXmck1ELzC/OgIo6WW7EsF+WFVXfWU0hYGpGH6Jnlg=;
        b=hUTCuinaNroldYxaG0H5wsGh30H9C9Z+HuCIkrzjoszLomAaeIH1WR1LsOIJue+h7h
         NDbtHK0X23R/wzjv/Dw3lo33L5+N36Az9+MvG8GfnQDT2ka2/4B5N/ewu1+MRddDb3kb
         3bxRZwkgYEVEWDhhGHgymLGirbY6jeudaxg/YoHFzv5NmTfIVwc3EDp1FY4/7DzbW3LT
         ESmef50twVc553uLpRkJHeXkj40PB7siTB14Uo/ufwhfzfqJW4q9wlpa2wUVJhAxr/qP
         BgVyTUATkBCSYjc6Xnhqez5SENSP4wMFP+KF+PFIoM2MQ1X4US4Sb39EPEkQnvAgnTxU
         7eUw==
X-Gm-Message-State: AOJu0Yw+f+y438DxAfAQoPQNx5PIdJzwLl0f2nk0pwn+XNXhLAHVEkx/
	BmXjl0WLTzXYVyvbrjBXCT7KIhsQ+AW2h4aA4WC5C2OTk/OUt1Ww2SXUsTXkqe/DCU0ZKPSb1W7
	03lH196Y3N4iVh4fCmzOdXs43kFoFkA42gsh1mQhfd4S6XPT/5cVqvvlABJq6j6ZFgw6f
X-Gm-Gg: Acq92OGIfTtHTlV1jtQQtUdiMawewDZIlOhh7ctx7EUL5Gr0mr6oZrKf9L1/b5t773x
	RQt4Fs0bWRN7603zl1YqSMr2jFoOIoIOMbaQfSa8p2dah4WQKNIJ+B1YRbVMA0FIE5toJEY27uT
	CVJ46i87VX5A3QBXUl21r4fEgm9SWXug7/jUxCa+Zf0mak79Nfkkgc0HMaav+UyFf4Z8Xbr1BX+
	QjUDchOVw7ogCQ0rSUc0WGfHcT79JFWO/T4GvFxl9m3c6fT5x2TajfFWnOwb8WTa4X0wq/uWOky
	YSvA4Z9GW62QUXh4x1nNvUlY1ZTHZixADjwAVgPrO3H+5FyIHmXDPHTkjBdZfmLus82lmOp4mvA
	pbOirVAm24Ttb3iS6n4XAd+Eu1DjXiXQE/71ygSpT5GkBGq5T3R0=
X-Received: by 2002:a05:6a20:9149:b0:3a1:f82e:b009 with SMTP id adf61e73a8af0-3aad42e2dc0mr14670217637.18.1778587660275;
        Tue, 12 May 2026 05:07:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:9149:b0:3a1:f82e:b009 with SMTP id adf61e73a8af0-3aad42e2dc0mr14670162637.18.1778587659759;
        Tue, 12 May 2026 05:07:39 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.206.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711513sm11822554a12.16.2026.05.12.05.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:07:39 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260416-setmaxopp-v1-1-6a74e2d945a0@oss.qualcomm.com>
References: <20260416-setmaxopp-v1-1-6a74e2d945a0@oss.qualcomm.com>
Subject: Re: [PATCH] PCI: qcom: Set max OPP before DBI access during resume
Message-Id: <177858765602.22216.18380104786326008908.b4-ty@b4>
Date: Tue, 12 May 2026 17:37:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: GsfEdZQdYTh6WhQ4U11cSKcvQdpKj-3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNSBTYWx0ZWRfXxVSWJHfVFxoy
 XXnsfxgOHtoGIDItxDSJ60zIbeEf5IMTXODLTa4GMofP9ZDHAdiLhymMTNDbZh5pE8ZDEuztZ2+
 ydkWqiIbNmMkbi8XwpDhDEXwpPEkAAPPdQILUgq1HZXnMR6x8GUqxdBlrIuiUrWW6WKXcrsrs82
 VGWnOuBYtsSvjAhvphP95FzqxZ1k2eMgq6OvmvkL+dmFfqNrbYBAJH8u4DfwQrJ8ad6+BIJJQaM
 qP9/YDZeufnFpq+id/4iEx7Uzvx1VQctdMeyETXHkFyrZSVeqHSa3nlASjxCmYb+WQpzJyjZEkc
 dm6Dc4dlvBTjmF8WqS6IyNkHp+GJPYg9QOFDYHHbNqGqp5vCnHGHydZSgDf+8AXqnw75iJC77SE
 VeM1mPyX9pCaG5WDjO9Xzm0mJwr0IDxdyacXIfgtssB2EzMJgS2gJW8EmSkdmq5AklWh0no+Z1B
 5ee8x0aLuyRZoGRuH2g==
X-Proofpoint-GUID: GsfEdZQdYTh6WhQ4U11cSKcvQdpKj-3W
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a03180d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=QuRtzvr4xB5J0le8HPcEzQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0YoNalqRbkP_kE0cSA0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120125
X-Rspamd-Queue-Id: 4C9D951FCCB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107082-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Thu, 16 Apr 2026 21:16:25 -0700, Qiang Yu wrote:
> During resume, qcom_pcie_icc_opp_update() may access DBI registers before
> the OPP votes are restored, which can trigger NoC errors.
> 
> Set the PCIe controller to the maximum OPP first in resume_noirq(), then
> proceed with link/DBI accesses. The OPP is later updated again based on
> the actual link bandwidth requirements.
> 
> [...]

Applied, thanks!

[1/1] PCI: qcom: Set max OPP before DBI access during resume
      commit: 44ec2e81ab3758718105b62cb8623060c0aca7bb

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


