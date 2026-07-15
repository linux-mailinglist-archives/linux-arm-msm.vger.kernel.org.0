Return-Path: <linux-arm-msm+bounces-119211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z5I1Ov5fV2qkKgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:25:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40375CF43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:25:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BdG1WxD2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MKXYnoGV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119211-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119211-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 087BC300F750
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF66043FD2A;
	Wed, 15 Jul 2026 10:24:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0F643FD31
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:24:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111098; cv=none; b=bFxFdJ05KIzdKQBPa2KcTrjp5pZDOpMENPSGW7tw7dWgbXgp6acZmS4Gbd7lSkI+8lv4oQX1cxvreZGBzrc9Rgmniuj3YwIa04AN6MWd8N24aKufKUGL/MUL+GD0awAL2WuU0ChcZZOiUH42RB3Sg4z5HF+GdCr2whkBNQp8nnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111098; c=relaxed/simple;
	bh=APZK3QW7cpGioqai+n5uy+Bx7CdiksF05hrnwX8+Kx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTkFb2RA9Q1ATfazlIkAIQVTn1FzidD7kLy/eWCRf9NGaQo8bbiH3OzSC2/acsjHtjAWeHdIOuGjc/8gKNmoyyLXhLy0um2OZFyIRr4FCxUlT+gmMC2M3AsBXI+ijoG5+0owPbGm7mPpVFyN56H00YE87OhuMlMcXYJ6+df0IMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdG1WxD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKXYnoGV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FA5Hdk3547541
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXD8XeEklW/BA2SpXPmFYJa2FPVm4Auqtf+sNXE6kgs=; b=BdG1WxD2JeHqB6id
	JHjHVvtiE2LTnOZ02nWxkCe9O0lhPRnMQCsJ5cJl1peP7DbvQGTHVGwbZnnVHx99
	orAGLIe39HYQx8iVG3SYeLX/0pLzKH0RESUWO2RBNXTA048ADDqNDaK5z6gL6D6E
	dczFacj5uLpOd+c13FB26TXYEjjjx52xrmIkE8vxDfLCSznVxEIg/djUbf+dn18L
	bLHaZn6QY//XyQQXR6cKST0gPNBsjYO9dFctmSDvItMgGalYezhYTfilYKAk8UcP
	e2ZDAoNAOdcxyd0egsqChyJpF3etXCOouwLcKwne2yHSjs5ywmZGdHjnxU3fjKv+
	fIwm4A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe85582c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:24:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so13360941cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784111096; x=1784715896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXD8XeEklW/BA2SpXPmFYJa2FPVm4Auqtf+sNXE6kgs=;
        b=MKXYnoGV8rYBLTANHXTGd3YMpKlWdhaaXB60sQCCRNLWW43ticRDTb8yVWZ+oFQnQH
         Mry4P4oM5LK0EXA3todJ8Z3UkIjZESijkL7zlbjoICjpxmX4dSkUGzJnG9ruxtw/rBEO
         wu1XXLT4E2xBPdYP//uJDy/Nm17fLcGaYqPl8xLl2VMKSLo1nGqjDVv7NIEF84gxZjRt
         17WXhNY6nDAYg/qzqfNYF8zTiwopz4U2XSCeSjej4xSDwSC9CES1I08bKUiRtkugAh0A
         VgIrFqpzKypbT1QPpbXGKwzLAysGPA0mCEkdd39PW9sa29iJn8zhLKlRDRurFKJ0lrfG
         pZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111096; x=1784715896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXD8XeEklW/BA2SpXPmFYJa2FPVm4Auqtf+sNXE6kgs=;
        b=gQPslovLlq0m9cicLACCmcqSO7WaEm+Qh30Jhxx5S6NnEbY2weHOVq6CAE+3eYio78
         Maz2varDzvnyZQQIaph3vMqW5RX3ar0Z7Okcm6k0OR1QicSpaVRqaDkq1uNuG/Sx4D9P
         T4tXOybJdTbWPi3rBFv4WdR+GQkM6mWbu0Qsuzlq/3Pa6I5eeiwqlgimsJcNv6nqru/G
         USP7lT7yJmIy8/1PyAIVDCPiSHVyMxQaH3UCipyxWMXa8m9Uev+tGMkNbPULRdhh5jj1
         7EdVF7NDb2TZGsb3y1mdC7FBofLsWaZxBmC9Gs1ha26GnuC6TomIHigfa36tr1gaRFjK
         +f0w==
X-Gm-Message-State: AOJu0YyBIRlD2Ck8DqGtIwqzUO8x5fnGdFjV+AZatTwtysO+3v6NLtX6
	bu9emvu6IMSJaFsgNdDSHqYzUzWpikdvH4373b95vhZcO0MA/d+QiDhKRamHbruVpR80scVTamC
	Mv4uaSzHM/Y+aizbJ8OhAEqia/V5FgJ5RMKC2IJbxcOyrCNHjHfFs2sErM9R87l8l12eL
X-Gm-Gg: AfdE7clMrxks6wxeLd+4XT5ugFByMsDhMQUOMwIIiPcrS2hlYVvet/3jzGjRnSJNnrB
	zJC8Ne6nnmoIT6A5ELn4uHW8Sh6fVPLhnlRazRWJUMnwRxiekA6g3CJ2ZxODcyCwrrKS7+l8YSC
	KtjrLguIK6C5/xwkh1lDJe+cWs/P/DhZJRtlpbYNObwnikxpCIMWmAI1GKYP+qXcduT0qR2rQT6
	XZtBiszNZ6Q4heWUyjf8Qig0LlWoHXiwf6xVBrt2Bjte3PIyGPhkxuAxTz0zX31VL4dMcqPL3C2
	X3/ne7vl1wXOyDjfcL2pSXLa+JCA6B1vlMXCpg9qOalaq67O1sK1bBCSDcVkPO8JZv1OI/y2VVT
	STunOIm8EaqMh8A5WxQyhljbWthxWZc9MCcY=
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr138459691cf.9.1784111095805;
        Wed, 15 Jul 2026 03:24:55 -0700 (PDT)
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr138459521cf.9.1784111095344;
        Wed, 15 Jul 2026 03:24:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687166b94sm233266b.17.2026.07.15.03.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:24:54 -0700 (PDT)
Message-ID: <991fea96-8e70-4792-b8f3-c8dcfd527eca@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:24:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
 <20260714-dts-qcom-eliza-add-cdsp-v1-3-525e757a23b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-3-525e757a23b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hyJLklMJCTZ1DL9QiaSQAasC-SMDkCQE
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a575ff8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cb0s1mPa-qHyKy5o9EUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMSBTYWx0ZWRfX5uFwhkX0C+LZ
 sLv7Rnde/bwelDgvM6F7brPtic0X2pzJxAXahdscegYjF3BF5tPf2wQvtvZXszLCU/B+N5aKQZM
 KWrHiQHmF8K8E56qtDGIruHuvOvtnzEeJ+v0SgvfIIUt30Pvq2iAHv6H/zKZIn4VcDPlFJKufm+
 IQq+buK9RHU5RPKd09NEgCnhY1iyr199yV84Z2n3IRX5vHFgtdNxbubq4Oose5NYYya0Eo/FkwH
 xVSBxKwyDLyjYHjWcsBPbpbcRHvn2QR14Yi70s3YoOapo9FHWqPAxbNZBvXvoViBj/jpHxsSttw
 IeSUFPewZPzCCiiikHUe6kVVXkvnMHKZAuaxW5E2vTaecj0x8F8C+yw/t7i//psBH0DRF99FIWZ
 NLDqNASSoTNosA7ptbc+jw68LEkwqOZnjflX8toJo9w4HNywCeqjE1EXwG9+kK/WtCe5Nqn8fFY
 4n2OycIMCdWDKeZf5oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMSBTYWx0ZWRfX7A2eaDztJTfD
 HjpDsdRsNL2UVWMhFNq+qcuJWxqGERtVt7pIHZccHUTrTuqiT9fDO36s1SwiUmL9FUoHR1KV5eA
 /QEVn6pCofaQRNSA5wWegiQEPV3cTBU=
X-Proofpoint-ORIG-GUID: hyJLklMJCTZ1DL9QiaSQAasC-SMDkCQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150101
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
	TAGGED_FROM(0.00)[bounces-119211-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A40375CF43

On 7/14/26 3:06 PM, Abel Vesa wrote:
> Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
> firmware names and marking the node as available.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

