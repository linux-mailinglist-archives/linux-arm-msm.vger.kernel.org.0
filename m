Return-Path: <linux-arm-msm+bounces-91039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id C4gGBO4Yemly2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:10:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3602CA2874
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 389AF300E5CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7732522BA;
	Wed, 28 Jan 2026 14:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZ2H7aXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlCnOtcQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3875257854
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609407; cv=none; b=I55+ySwl84a11bsKm93XYJ009QW5Je6IMOJ1kKpwWUoZtemvtY2VRD9acWLZshkEf2n73oDWoePSTlonxvDIRJ2NqZv3ukzjHv6SgyE/5n8YSShvYIRmHMgmjKvSgndOYFr6oStLb/ilI2rOhtje2TUwPqjfWTMh+BD2bJhvgDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609407; c=relaxed/simple;
	bh=nPO22Pk9oEOy6P/AoehUa+28euijor3hUcDgnvgMSJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=el298xZhXZ2qmQkSJx5Dq8TkYQKXIdz4gwcSwZue6jJNk5T2jqfprX961TzLbMeKlkrTXiKPBXAgJITXSs6gKzAZ3hORC3aVbWsAmlDwsW7uj2b7JW8riVhK4bOzGbOVPlBBRm8PFtx/2B2o28yMmk9QQY/kbZ842FK8j5j2PK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZ2H7aXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlCnOtcQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S9276q811587
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AA5/Lo70A2JiDpn+2PpdCMbf
	BH7wa9FOwafkTgtB60w=; b=cZ2H7aXlV4/x/RXaBDlt7JLRZP452S4r0gkwfDdu
	Hcb3rnCDEtXkYVMdXHxXlxb2lOVz4TEcHk8tRoMTy3I0lbLQFg0IsFBgDZANPexn
	xRDKqIe+/xcWnavTx9Iz8qX8ILR3KfhtZuEEm/sbX8M5UHjybOmY6zdhu+RfFLEd
	m7LuoMuY1NpNxv1kNFnqQOgd5XPPyLXJ3tFBiUqaBWPEvirhNXHA5uFl6UuM2WIo
	qh+XUUzidn/ShOiP0L1rkQmuRBIViHam3Y7A4mxcRN+wU65Lgtw8bifqnDuODk7h
	lg+rZQQe+m7DWjFdITr/FCh0Ph8aPT0oLVWGxZA0FqiJFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbjsnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:10:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so2980651685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 06:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769609404; x=1770214204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AA5/Lo70A2JiDpn+2PpdCMbfBH7wa9FOwafkTgtB60w=;
        b=DlCnOtcQ8tesQNbOqd6JDNYjxMMmbUNlQ42W/yoQlvJ5ZuEGd8o+LqoTxCTA0EGky6
         PX4c3RD9EJioX15c5IaXVcawuLej2O/WIZ1nFbEFieEmInI/kbc3VJH+OjSv4Vs34E6X
         CO+DaoMG092Sl4pyMRmORdrApH2NFfZuH7ZLSO5hDIir4ICSK2cmGLb18hNTgGy4iuZ0
         9QqioGq2FJlJI79kZlWykPV/qq8ufE3ZJGhvkymvnspxksSqmS0PKMQi1oU7V4RWVuGx
         R4HF7GgoqvvAgdqFSgpa78EdenamPhkhDdJH/YnXclcjwHKWJ3T/Pa/9yFn+UQSQ++9O
         R7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769609404; x=1770214204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA5/Lo70A2JiDpn+2PpdCMbfBH7wa9FOwafkTgtB60w=;
        b=koGZDrXCkVOmuP6FsiAof3eDICKjKUUDsrvPvViab5EanmQba50OnNKcUKi9PE8BUu
         GqVJ+zlMb97pn5mgyFTLGHI4c+fDE1kxySJh+Y/82N0CG5ReMOCNjOp9gOjpYj7tBcdv
         emnlnklDXs4QTiq0sPOKBitNTNGoLzVY2CzHUFPcIzQdFU3t5+NmFb8ATRWx4YdBoGnK
         p06nu0283bJapPf6M+RYgG2EHpxqQcuf/KLw0Emc4Xkzuc77DLG16eLE6s78cML7b2+J
         DCJg5VNmkUMrob66yjVkeOYIEbAjOnF5E5KaTYKjE+7xGuDpAaQOBsvuQQoNxvT/u1p4
         Sgvg==
X-Forwarded-Encrypted: i=1; AJvYcCW2JBn//WYoDof+m7vZoWT3SjnmgxspFqJrBxDdBj6H6bZEQCpPD4707U6LUfY/FlG+u2R7TANo6SJZ9EY6@vger.kernel.org
X-Gm-Message-State: AOJu0YxTzsNIUmbPY2kAhtEPuLA9Q+V718t3mGDTBeNOPhs8HVUvDezk
	QSIlqD5P98NkNxtHJ/D5Q6WT7muIqpuQipAAk9dDR8ltpt+KipSMQ1cox5k709CgN7UPYpFz5y7
	wpSuI3GJVSii+uCemuo/YDK67eNSN6GK8HfEmumq9fvidINab5B+FGgma3pPKvrq001rd/hSp6w
	Vm
X-Gm-Gg: AZuq6aLGnms9FESyA58As2Fpm41+I618i8fNDpKcOY3J+4hQVKAcsgaKkr7K4jXx+QB
	9OO+b4sCD7iaCov+f3ykyr+aB5tvYfEQyiDLD0ZCt7Wwx0ycQJM9sXwRZC5x9YJPI/2prFk4HmZ
	KY5ySlI+Y3i+SCCttYxe2Jzb+iolCXGBQislhX7y2nJaPsHtpUB/3jXiXuZviw2vvFZeMDJ0wiW
	4xD+x9TlabBS8pJukyCoXqI0m4TjNX+vpBBxt2u69dDh6W2WAduwAzXdhi3cxcIMTFggyQ5sEu2
	MUe/czK2Tc1WJBz8n2xGORB1+7gKOEAT5L17aBpa8obeIDSHpEXzy1dwpGSJqPGNX3ErgzgXOFf
	xbPR3jRDC1NhVw9QIRIEziKue
X-Received: by 2002:a05:620a:38c4:b0:8c7:eb5:8545 with SMTP id af79cd13be357-8c70eb588damr388867985a.16.1769609403764;
        Wed, 28 Jan 2026 06:10:03 -0800 (PST)
X-Received: by 2002:a05:620a:38c4:b0:8c7:eb5:8545 with SMTP id af79cd13be357-8c70eb588damr388861385a.16.1769609402986;
        Wed, 28 Jan 2026 06:10:02 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm7465247f8f.41.2026.01.28.06.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 06:10:02 -0800 (PST)
Date: Wed, 28 Jan 2026 16:10:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <44k56h4yjjknc5xnwlrmlpgj2hpf6rvdsv7fhrhb4qnzsz7goi@o6qz7im62kg3>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-6-ccee9438b5c8@oss.qualcomm.com>
 <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb7bd7de-61ee-46f7-826a-2c9c32aa9c2d@oss.qualcomm.com>
X-Proofpoint-GUID: H9dhi8wL1ey3pqqFa773Q68zrNDk_Gp5
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=697a18bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rJ1U_4G_ZJY64H9EBe4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: H9dhi8wL1ey3pqqFa773Q68zrNDk_Gp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExNyBTYWx0ZWRfX+9puUq8+3r/a
 /+IooygHevZhUTjN8+9siTPAHzncxZn5PO/vTLZeUJgI010mqIsPAp1vItoGC9xQwEULzclEw9Y
 6WRmKDWBJfWQdMdhVVc85LO4one0l7Ur5GRF76ALYPV7kIlGg41Dy8VQtVodVzajx7ZRBF4Ssgx
 kNMNPbR9wsXEAhUL9kDc88vqtCqJMUxmZSMQFrrOiKJJZArvZGojFeuWNuYm10Dkg8waQiSl7ZS
 QzHofvFmbpaLgAkR4BH8SFXdz1gysKsU6P8qXJV44sEkSfG0xBsMUINtvesq7arT0dosJeg7oy3
 sWqywW1fwBfatpdQJP9T8gzqVuYSz2Cl8Gxw9dDy542uFWiII+bMALg+qHNoES62nigVvMmFktc
 bMCh2v6ZHql1htxDwbplqv9+JCGaTvp0pxqDf2M5kX+2fcxWTf4PLF72uhwAnJ4rfXS0utceGl0
 bFTg4NosGcCt7KJCTZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-91039-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3602CA2874
X-Rspamd-Action: no action

On 26-01-28 11:34:49, Konrad Dybcio wrote:
> On 1/27/26 4:03 PM, Abel Vesa wrote:
> > Add the TCSR clock controller that provides the refclks on Eliza
> > platform for PCIe, USB and UFS subsystems.
> > 
> > Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +++ b/drivers/clk/qcom/tcsrcc-eliza.c
> > @@ -0,0 +1,144 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <dt-bindings/clock/qcom,eliza-tcsr.h>
> > +
> > +#include "clk-branch.h"
> > +#include "clk-regmap.h"
> > +#include "common.h"
> > +
> > +enum {
> > +	DT_BI_TCXO_PAD,
> > +};
> > +
> > +static struct clk_branch tcsr_pcie_0_clkref_en = {
> > +	.halt_reg = 0x0,
> 
> These regs certainly aren't at +0x0 to what we normally expect to
> be the start of the TCSR node

They are if we add the TCSR node with reg range starting at 0x1fbf000.

> 
> [...]
> 
> > +static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
> > +	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
> > +	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
> > +	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
> > +	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
> 
> I don't think this list is complete

Yep, missing the pcie_0 and hdmi. Will add.

