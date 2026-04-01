Return-Path: <linux-arm-msm+bounces-101355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPQGIUkjzWlkaQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:53:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8913C37B9ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C79143052A75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 13:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AF343DA29;
	Wed,  1 Apr 2026 13:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/eyAEf2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7VYNze7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF4543DA28
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050736; cv=none; b=EkEqIiAOTbV76e+krQuHg8v8O4zP8YaAcI/h79p+ghUmMhNtGKXfyuiQPC/EL0ZnB2OUAwzDuDwrXRuAHve6LCiI6IC2SQHy0fXIGyufYSAIkv08o0FZ6pM9g8XkWy6Zo/4GD5Ft5vYj3ALKFUJVDnk1NEr+4xJixi96NvSUtvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050736; c=relaxed/simple;
	bh=GVvuJ8D8cdv65MxF/fHzqOyxfS9fjOVlKkEZE7zPtgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7CSkUO8Im2G59mTWUfdItTlm3Se47HT9WcMTbnCzde5tapTMjdpt4MpmyTx53qotP2hwAn6qcsb09as60sYRsI4wFhI/P3vv5x6C54LC8Wg5vNHUxWBFumlu+GMk/MWJJr5O4c8Sa3mRuh9T5jDBsH7ROrcfqj7CQaeNOpJYqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/eyAEf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7VYNze7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319WOth1579405
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 13:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wPt1hNiW7BQlXFb7+CgzAvyh
	KKCTqI6HWxOYNynNjaA=; b=S/eyAEf2LS6sMOhuXPzKfzAJDuCaV9Yj3bDQ60QE
	qM1WQq+y3uVLZcEMmcqWHkSL+RjyHhLXBkvzixdqMPhB3H4lsrXPow2zE77uh9K1
	gdMdb/ePJPJqOw1uzf1XCmG+KnOpI7Gho6QTVh7xjViRsAJuvwLp9OxjMxW/rbIr
	FqXerEsT+o27IzDct2BICqxOMAjbVONBJyx2V1pTKq0c4CCMHzsc7zYpnDDNoy/v
	3webJe+YP8YUrZSE5CJOPRYwmj8r7/LcAuTtn2uXuvJH8nrnbxqKFgBiCydwe0su
	4UaPFVqSfOQhR3vsneO+kdT4eB14KaiabBN8IHYV3hi83g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2utue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 13:38:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-605566f8846so3355779137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050733; x=1775655533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wPt1hNiW7BQlXFb7+CgzAvyhKKCTqI6HWxOYNynNjaA=;
        b=S7VYNze7USisDXvuRix75dav6U75ev44ciDMJDXqfYE/Hox2H37ZbnptS73HknN5Xh
         ainC92TulXnbba5AiGimRV0T3DBYEF8NLSrWvoQfyiGQvx+RTRM4jvbu3OYNlBNhgnvT
         lRn7OTaTYHE9k50PYdovx0zebkdF+B38M1cuYp7bax+C0rN0NJiAzDfUl3XnOp6huLd1
         hAB3CrWl1qSzxZKFsEpHKBEXn1SUC19ombh8LSOMFkufg0ChJJkaq+w+cDERYFoCl453
         xfuZwJvV5O/9yef9GkCKVdEn1G6Yp7pioJxOTJpvCShRndM6CO2qVlPwMuUcJN9mEt7P
         8WLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050733; x=1775655533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPt1hNiW7BQlXFb7+CgzAvyhKKCTqI6HWxOYNynNjaA=;
        b=S7j8lZJptHmcR4Bv37H+IJtiQo2XUKIjGttchvFEEos9w6OQWdBifbaexzTx9LXn4J
         rVdUiKqlJ+smFchPpQOfRBakgndKHV62E+67mA55qDlvVxnnwFwJOt/jNFbBuOptQbVg
         e0di7gXWVZSbpROuwpIEw5715NOwoxDe7K/H9FW6IcwqA4oKgueYhk+PasDm/dZjeAby
         pECTPPF5t0Tsiil/CyMNLTQW7qi9oLyQJ+vMlnQobbeqdRjOMe8x/gbQ9o2eB8PXFgHu
         H+RgHRrwSlrBL4yNHJTicJxl9ClSI0W9iKKADZZ6/E/oLZK1vPIwS/oPgJz2iZkgpMST
         kSjA==
X-Forwarded-Encrypted: i=1; AJvYcCVWxoJtjYzS/kLAOsxTy8DCOvBujKHR0XHn/xoY4OHJKS8eYEW2gZQIFy/B6BBhNmjSx6/Y5vW1sf0KqMk2@vger.kernel.org
X-Gm-Message-State: AOJu0YyCgL37cdLMcXV4o/mcjqpH1qgCijbE70Jv1RRIioQsBUQTKrLq
	gjFhp4LXVmf478D6XIu4hKhi5p1r1ws4I/wGyxFeSxWU3IAExwXsj7i6MCQp9UqkQMj8gFLZ4z1
	VCemKArJObuqvY5b9v9MnKjWXJyjj2n2NL1qusZU0fK5/bezLQyJHeTaBg6oGrKM84Ko4
X-Gm-Gg: ATEYQzxDsMYMzcB8uLJUxpdRz5kHf207sYIk6P2Z97A86dorKRm/lZRDNKDyDaq5/Cz
	bGQ2qRgs9rcJV6/h1iJfNYn47AnzoGwQMsVb9z6zA5VQiSV28/pCQyTJrFGY3GXUHC0dqlgbkZG
	tqUs2RHSNEe0VWQoQzCEq96k1roqTteJQv1wYio1iC7CcdgoYXcC4V4VrMQ/SSVDavjV1LarXQ7
	Z/kzhoJOuJeoIC09bkLKsqBuMELNrrZcCqgAFm++az+k2gmAKnK9cAzNntM3VwHKnxzlQbXj2JB
	exunZZ1TRz+wY1TKhzbjEo0PTB1CBtEFL/25dNzzmSijx7h0u2EW2Vu8MN752LF3kmRm5Dyd37K
	CtTRiZx3ZXrl2MWC4jfW/ejvHbj5TR7Qz/7iqeD7OLceAST9xKWOvRVc8CPl7+05qSakSniM1aA
	qqBfTnRif4fN+etL9W24+BjeumUKbT+zT4pGA=
X-Received: by 2002:a05:6102:6897:b0:602:ac40:96ac with SMTP id ada2fe7eead31-605681ab78cmr1258677137.26.1775050733528;
        Wed, 01 Apr 2026 06:38:53 -0700 (PDT)
X-Received: by 2002:a05:6102:6897:b0:602:ac40:96ac with SMTP id ada2fe7eead31-605681ab78cmr1258668137.26.1775050733109;
        Wed, 01 Apr 2026 06:38:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389202asm29339891fa.24.2026.04.01.06.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:38:52 -0700 (PDT)
Date: Wed, 1 Apr 2026 16:38:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 13/15] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Message-ID: <itxk7g7azjbbj5o3gexf3ljnhgrvuh5ilwef2ur2lzu577nexc@fkzusg5k6pyb>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
 <20260331-judyln-dts-v7-13-fbbc4b7cc557@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-judyln-dts-v7-13-fbbc4b7cc557@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69cd1fee cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=R5WB9BNycgz1ABFPbbMA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: GApd2zh3zY6Decjfj4sT4RQHwiBv83zz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNiBTYWx0ZWRfX2Q+ePsa+5gnG
 C5fTr7R9EJT04fM3NfHQnccvUPEYiwCJZu4CZtDsF7Mu70btZyuXIHt9RCle2jCt5HEGAC4+FPc
 DYSQf0+0Dap/LmCDJ9yIGrE9++9XmphKCHt9ZHgXhiUZJgJAxLI0qC1rzdP3MUqtiSirirbL1zT
 KRMvib9P350/Q7sKeDtypOAxaQ1o177KlDEzHYkEDsd3iJB/YaQi6vdpAud0P9zOBGe6258nM2r
 m/SdRIjG0y31/DC5qbsy8TIDjPRHixCI2+OQqK4iLcU73nXt0ubT655LYevbUjpeN0hbaWLk29R
 uo1QVXobLn8ZWyaHaTDbA4Z9fIoarBcqw/jiVnsK0boFxDSX6lyY2RlCVavXIFhKmg9Qekd4h6W
 0qjdmAmubwSQXw6NDAU3IRYwK/DEQ2ahSrXXxSiduzb2KyD07Taw3+Cct84pY4lSBMAbYvsi96U
 fLl1QYU0T8FBYbkOhlg==
X-Proofpoint-GUID: GApd2zh3zY6Decjfj4sT4RQHwiBv83zz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010126
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-101355-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8913C37B9ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 08:22:18PM -0700, Paul Sajna wrote:
> Camera doesn't work yet (imx351), but we can use the flash as a flashlight.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

