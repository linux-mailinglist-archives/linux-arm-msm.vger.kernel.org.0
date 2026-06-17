Return-Path: <linux-arm-msm+bounces-113603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LTziH6CEMmqR1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:27:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D2569910B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:27:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d+V1j1BU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HZnHxP6E;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113603-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113603-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C735E30A2882
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E2939F162;
	Wed, 17 Jun 2026 10:52:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D976C3803CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:52:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693574; cv=none; b=f3KXe8WTH4AXhbgRbDUzxLmlZ4FiFNIpQlWdm2cSAMYbuJ4m4Q/nkfvWG0ERc5SRaiMMm7AN1COHvf1atlzvnbdlQT+Q1ysXuxSbY3eLNXNyn1Bm4fD1ljrPC2ddSdtRVOvE/Hr2oGuNB1EwvjedAD+C3eYqvX9HWRdJULq6RKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693574; c=relaxed/simple;
	bh=6oGwG69D/CCtMzi0dvDRGP2E//XKlyAVbpCD10zKo5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8sWndUJJgkvBtSk1qQGxRRLH0bee0CRzwkpp4iUbGdWwdByAGsL3K9vnaLSpBGYF8tC/TOYkfQTSb0y3iRn5hnVfpZzQU6Ae+WLy8ndLguVKryo649xjuCSplbXrE34XoDXs2j6iVHUshPMigy6Bqt5y6DKv2XZNlNyzWboWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+V1j1BU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZnHxP6E; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V6RM2291358
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6331SK8DnPFLpPsoLFIuHxT8r9zEhN9nEg40mzmDcaQ=; b=d+V1j1BUmibFlL70
	d+lvtsXpMhcZgK5Y4TicmUR2zIhxnqlymOtW4o7aZDxyxFy2+I4XHRzQ6UJBXDWL
	7uASQSD5pNQGxxlcv/vV1R74vSUMwt+0VzQyDQBBsdH7pYzD2fP+PSKc0S83TGil
	ENZtpwnPal6TlH2PmuW1kPXoX9Nl+STG6HR0Mywxz6DBc+tKu+VzuQShNlyOhXuP
	Zy7xaPgDQnobnP7Lyk4B5HAzBzgfi0RnSXcHzerXn7aap3Vk3JzGIVM4eOtmmkSh
	6J3vbToCld7kcpVtOaB85XS6i4hHFz6KIE+V04xjeNhlIL/jWaEPuZGEs+pk/aCL
	+Pm4wQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevjt1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:52:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915732517cdso25769485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781693571; x=1782298371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6331SK8DnPFLpPsoLFIuHxT8r9zEhN9nEg40mzmDcaQ=;
        b=HZnHxP6EzvrwvrwrtanCqasWR45jrlNRgys5/U6rO4Jkvgvoxf5o/IEiEic6cbiWU+
         rnnQ35hM0f9XsH7hvAGSH2rJFMr66RTfTEf5OUhWC+OUi9eKyfU35n+AqxZoXYFjqso6
         32Oc1OfjJNT5FcYdqAqADSsdealcVE/NA5kStlSqZNj334sSWK5CoVCd6TMeBKCELqx8
         cD7u25XJI79DNj0HL33oigaerNvBLo6budIYHCcUhxpTXhLXocoQvNArf5zZqJxEHJbO
         3Wld3Zj8JIZKRk77Ku70jnjYjWzMtQ4qmkGzEtAhLKYArv45HSqbjR4+mnJBoeqDKAJ+
         PaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693571; x=1782298371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6331SK8DnPFLpPsoLFIuHxT8r9zEhN9nEg40mzmDcaQ=;
        b=LUgqkj/DqGz43srAYF/2hksmKWAP1Su+Lo8eW6QhPovY5p1439p5vxejYXI69njJdl
         CMApaOx/ulYqhHPfl9H2KIvwMADxrDc4XB/BFIZ7TKu9ua/pxEe0V3r3wMGrYuWdpFAC
         oAC8HTMdmkZNUV6VZdxPDBYFA2TCgmsMtiHHPD9cAFvR3T9ru+F5mABJBgS238tSjxz9
         WkdXgzPD2nDwlbc2/Zd6iCDphwU29saaimPde4hrUNPrxmnQhC7HyUI/DyWgs9ohYYGG
         tyzi6VIoBwwU5CB3PEqHz/uL2Ov86rUYu5Pg3K+wtH4BYow1J8YsJ4f3TWqmpUsSUjTx
         A8Mw==
X-Gm-Message-State: AOJu0YzbvldWfhGnLthIhGjFzpvj9zsmEA51LYYyPToQjqbwic7xiDN2
	WRfdpbmp10uo9Dx4hf8cOSa5J5xF9s4pVkU1nkDKnD3piXK8PwaQXyJ9TAmFVS0hw+i8auV3dAP
	qmC6r50wue2NTnMRFEUSa+/+6at0mWOKpNan4Ck4NQEfa0sBjH6IQXPmJDeCTftEHUaRX
X-Gm-Gg: Acq92OHHI7oBBwf4j925D+GlUXDHbluhUrfwIEKTBtn5ln2jk1O7D6OYAj//hNEywSt
	j3iMdnsY5QRgGaU5T6kBd1YF8ZvqR3js3TlLaCLVmw+oQSgojLaZjws5ASgtlOSgZZvn9UqdUjf
	hVN1T0fZ/MN63WoeQRHSjtskIBrBEUcu0KCebAse0yHLlhfX/RVi9X7URoH8qyYWsvEzPJnf2ZD
	9Xe15zYNkAtMu1+wrbm6aCSVgg6lEUO3QhsVl565449t0HcKg7O6MBKb3hUuBOTEGq7h7/zTo44
	vDlS6qXMaZDlji8MuMfT0gi21whV+6YdTDIrlRiXeMNPlAPqxVszBWvuAqUIdMaLlcwAAiYRt+N
	HDz0y6DU0zQEPkQKX2H+i9e4ZIuZepRRtHLs=
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr250370485a.5.1781693571183;
        Wed, 17 Jun 2026 03:52:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr250368485a.5.1781693570751;
        Wed, 17 Jun 2026 03:52:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44209f0sm781932166b.6.2026.06.17.03.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:52:49 -0700 (PDT)
Message-ID: <8ec0ac42-b9cb-4da7-b71d-c3f972ef0ace@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:52:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
 <20260503-ayn-qcs8550-v8-3-d733f5e57446@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503-ayn-qcs8550-v8-3-d733f5e57446@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMiBTYWx0ZWRfX18YABAKOcAQU
 dpV05OCf2rmGWyM2nOFnpDqS26ebtX5Wfmsgs9zVIbHyO77kpaz6pP0HluB0QZu7uo4yfgVpUpV
 vEF0jYhSqnD1leqtwveG7w/uZrRT/evcGPOwLJ+n6tgFPXi6qcXP5ISXGX+ufxBgvJuitwvzHYJ
 FLgTgLOGs0cDBF8SCd1Md8ijzSonKOS0m/OcMQmSLcGApKY93KEObbXNbcNzSer+QJxRpMmAUOh
 3W4kJDk9nN0sOy/6NVL/mrx2bYixrD98vbykkI6u88HDMnLnRNKSK0gXctbjGM5LznCxf3b3n4B
 9+P7tGttoQGNxw0723Y34sB15hFijInt3NO8oLyl1j0DgmtkwUpy1nN53HQBW+iJfvn1szfwA/n
 rhB3VFEDKV80RxwgyqE+kUbyFBWkcydBlYtSpnHpjKOGswvB0TKjFcmVUaKqdrswXzstECvAZi/
 f4WV1gOkLAqAN1wtXxA==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a327c84 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ePn0xV2wtYfU2OeEI88A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: iYFgi6NYZfb5hio7NwSjYV8iavKLaxqH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMiBTYWx0ZWRfX0qbQUQdPCrdW
 tUzLqCD5Ep172yyV4uY7Ta8Psq1bB9pMUEhIhdjCmUVOXTlj+PTiW5LQJTZcz+FdtT7pWcVHdDG
 E8peooq+35NuPWJZDVpULj2O7ECR/m4=
X-Proofpoint-ORIG-GUID: iYFgi6NYZfb5hio7NwSjYV8iavKLaxqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113603-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sobir.in:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:webgeek1234@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75D2569910B

On 5/3/26 11:48 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> This contains everything common between the AYN QCS8550 devices. It will
> be included by device specific dts'.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

