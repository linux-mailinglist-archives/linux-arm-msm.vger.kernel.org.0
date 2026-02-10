Return-Path: <linux-arm-msm+bounces-92435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCM5FDPximmwOwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:49:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C510011861F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA7BE30439CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 08:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90633375AA;
	Tue, 10 Feb 2026 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDu+ErNc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVJvrpDu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ADB3370EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 08:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713204; cv=none; b=sNOEUvYd1vn+7jMIfwV4TrayGWUMgbitgfkjTdEqFKBcuTrEA3m1rzbc3N8hzj60/WtxNk0tORte0ozsD6uGpl1248V15qLTq6yraZiZ1Fx9XnYzeotQshU8ssGS5ParNHxCH9nxdqDt6B5O8KClLMGT6rUz2EQf/epRkrKOHBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713204; c=relaxed/simple;
	bh=mRrbxsJx4joDnrv5YO/Bm8gu0a9QN2R0uAOjLbW0CmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5l7lCGU+w2fonVQNTgV6At80SYGo7Ma7dvyCQjBtGEamZ54qdU2PeWv6G2kiCrpvdJHsYfny1l9C/yJBKxMskk3kDk3zTnMbEdHq8W1HhSaQM9f+3iNsNqw2+GV8SG+E0+DuoHGujU8o1QADVlvNlpsAIjqDisg0x9KKU/EFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDu+ErNc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVJvrpDu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7bkOT4003532
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 08:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MCA548aZOEjk9RLhcL+S9JxvCDc8BiZUiRUlicYNcw=; b=iDu+ErNcqqOI79hR
	Sr/fR36cQ/fvy7uD1zZ7lNDuFXr/78EVqfSFrq7bY0buACijELVj5EmiHVLvtWGw
	YmTY1hBccTptXq+TntlYFosa1rm6TBq4StzdPUdA1JBFQW84ZcaNMqCUbeDsysP5
	PydYLXmv48+XZVmU4mOaqBHJAphf/d0zZyNUYL6MakZhzmMdphkuqpgc+ruc22J4
	Xy9FaMQuc8UuHq/D3x9QfZzBb/XzAft0JUjFW1rSFL5yRVGmnkNGSVYj3FjE6O1F
	tuYzQmaZ9H4AWUIxWDJkKJ1NGH4Ko1n6/HNQNpFyP+qQO3tSVfu4Hza77ur6G76D
	UzTvdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7r23htw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 08:46:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb054b2f9eso190114885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 00:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770713202; x=1771318002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9MCA548aZOEjk9RLhcL+S9JxvCDc8BiZUiRUlicYNcw=;
        b=SVJvrpDulRrEOUgYW201cJGiSd0o7YUthP4VvcnhGHhIE3xR60sfQZxNmtTnUtJnzC
         sWboEVrDLDBthPKeTVBnkYHI7FsiQMzUE5UvwYpaiIl5GWKRsJ/3l4nitqd93q/RgU3c
         h0oWSdyxEVot7gpivsloayeqxgu1ab88fjWT3CM42E3q79bINnSWIWc7k1zxNS9EOv3o
         FSWOArG3FthrhFwAOQLGr4n3lFAip/cbJbjR0MdRjZ+TXWm3po4lQ45a5zU9XUEo8+Xj
         iGeFq2+3hY/Pt3tjhcOVg08St8NIh8zzukJUsz1rAgAcLYSZ1cxzT9R6/Q/dGmF/4gE5
         jvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770713202; x=1771318002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MCA548aZOEjk9RLhcL+S9JxvCDc8BiZUiRUlicYNcw=;
        b=j+qoHzGZzBy+58izbWFORfPXf0x6YP6Fdo1l6cZbmDT3mUsFYtyMX0oyNZNf5On8/u
         tzaqVy/4W4mF0DGxNua2nqVcJhKDJDQwDT42bWCmJKm0ApBBkWbZ61CbpGJg7dI1v9n/
         0v+cdb8eL3XWVzudidHytNVn9EhuK7TYhMuWS0UCkILKUrfhfVRIA9y3853XLWhYZJQ2
         5OrTu+07MaHneGKERozb8FFd0AokRDEVMD+Oiqfg0y4GZpC7Twu3knWJixgZ9RZdD2aa
         /8+0+6XW4XF2uybYogTtvoMzhoJasj9y/ftU8qHKp5akOCZVeHs9CKorAzOYnpYqELJQ
         oW2g==
X-Forwarded-Encrypted: i=1; AJvYcCWFIb15Gnxqj9pYTNEBViSGuWTKIoiIXEPO9NqBPG+R3Ejn+LFrYuawHELyzGt+v6sZw/R5n0zTqTjWwG0J@vger.kernel.org
X-Gm-Message-State: AOJu0YwG6EOqdYAwPRriswFRPgzimKRKsgiioSiweyK5PuUJPcqkIerE
	QSf8b3CfmdJriMOA+cizDlluSME/x00ecdIj7U1eTMaI1bPgNkSYpcO4rsSBp2Or39jV+2gU6kO
	J+R/CFMwEEgsucAqC8Y97R1CywM4ttOlbUOxOTmfNqbGmh6ZI5LagoVq2608lD56O7Cym
X-Gm-Gg: AZuq6aKVpwMo3TJmyRsNmkJMGocwNxeijeqqipI98sMZaTtWveZpVORiy+MuC6+W75c
	CsxdxtAkG+mRrmn0NT3NJWGvxIIH+6Yn6yHGZU3qCEKCGzEC+5drP0KqQhd9wY3edQFsseWrmUk
	qZTLbimn2wnWJ+BexC0KnGX8qFAjQTtcndxj5SODqv1NpqedSJyNjHtxkmO68quIeZrTirksRhx
	uScnqgMgdNUP1UO954CbaMjWC7H6UCfj9L7CnQlljVcWx1Lh3VBldfnB7A0uE122IwCG064LKCS
	GgJ5YYvDoy2r3QdVoyo4wPanWt3P/pbZvZY8TMjehKGqfe7Z85vZjuPpICLiqQBLzd103V0A14k
	EaAwMc6Ob/YEqOuYHUyafqvV4zZ8lgAKFQjfTHdMKUep3opFKShmWyGaqoX/Ob2+npl3gmogMUr
	MW150=
X-Received: by 2002:a05:620a:29d0:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8cb1fec7026mr99048085a.2.1770713201877;
        Tue, 10 Feb 2026 00:46:41 -0800 (PST)
X-Received: by 2002:a05:620a:29d0:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8cb1fec7026mr99046485a.2.1770713201429;
        Tue, 10 Feb 2026 00:46:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a5a31sm498059866b.24.2026.02.10.00.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 00:46:40 -0800 (PST)
Message-ID: <e90ff54c-0c4c-4097-af4f-7821e6c6dc2e@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 09:46:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Add '#cooling-cells' for
 CPU nodes
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mani@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gaurav.kohli@oss.qualcomm.com
References: <20260210070321.17033-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210070321.17033-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3MyBTYWx0ZWRfXy5ItiAEWncFt
 sgr0RLn8KnqxXgCraLD7Smm8qTsgwUzGJDEQG/t5ml8d7hfZb6MHouJPOvQlNZG0I56ZliI6xEI
 n1HEMpk+Rq47JLhVwg4Jt5sJ/uWgPwndEUpMF/UYQpZV2TPMCKXhrwY0T6o1AW4R8jTPxLT+zbh
 rOyIW+j6skI2HNVoALBC2v3E9cRI/M0GMh6K+25w2ySVsAYqj6DNnsMWrmxtJVJ4GFtqXpxLlLA
 9NUe27Hd4ivj+eR6Ixlo/XEK3By+RnpxwkvSJAcx+jq5st/5J++7Lzv/8IfEDJYSlM5qz9nCYVZ
 2ojHHz5F0mTHaVAPBpQEwaOqDLiIgps2ythBkM13ZiI2HnAEmh/QTSBTYy3yHCTExoc2cq2COi7
 NifLSWXHRkS4aaxTsG2JYvmulVbFvyaeLjd9IX+Xc+IRB+icZisiWZSB3FqHivuOG2JAzTBpz8S
 tjWfQ4iFyEmxt1B8kXg==
X-Authority-Analysis: v=2.4 cv=MLRtWcZl c=1 sm=1 tr=0 ts=698af072 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=zY26IrS8xTdtxJwmCuEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ot4Rv8VthGxLe_iPDIvKO27gyACeBnpQ
X-Proofpoint-GUID: ot4Rv8VthGxLe_iPDIvKO27gyACeBnpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92435-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C510011861F
X-Rspamd-Action: no action

On 2/10/26 8:03 AM, Manivannan Sadhasivam wrote:
> Enable passive cooling for CPUs in the X1E80100 SoC by adding the
> '#cooling-cells' property. This will allow the OS to mitigate the CPU
> power dissipation with the help of SCMI DVFS.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

