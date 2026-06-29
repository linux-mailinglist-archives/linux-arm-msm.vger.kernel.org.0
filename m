Return-Path: <linux-arm-msm+bounces-115174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XOh/KMaHQmry9AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:57:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F96DC59E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:57:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KGAbQePV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SrhxDJGb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115174-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115174-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 360CB31FE1D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8213BE64C;
	Mon, 29 Jun 2026 14:43:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE63B83F0
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:43:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744237; cv=none; b=pdMe1Pvygx2X2jqAdpK5zIhtliceUCbNIBnLldkXmptFOEl6nRDQKc0D9APwwRTKgYPOVOFgfLxiYJPZv7UWflAdvQwe6/YNUTaVmJOuLdjULEkXFi1hwJZyZ9O6OQrK84eAqZobP19BYqpDSf5q49SPBPcxUUcPH5hh695wO3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744237; c=relaxed/simple;
	bh=Uvh42LppJ1Epa0CUMtEmloHLr+G5459XIkzs9MlNxd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efVcvdyEgDctdjQ9jc7ogxgrXBYiYBtwTfnTopLSpHdZEGxypsCEk3y24/f5dAYMk4OnOVWUooHYJZrsIJEUcRyEdq7a779MQMkRBihgd78wHNXrTiXZOYW2JTV6oKDQTm9fiwFv7Uc3nwEn8Pmfcyhh/NLCyHG5P5lPT9dMYew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGAbQePV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrhxDJGb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATeuY2648345
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxrp3fuMsso2g4/1vO5uXuJ0y7FJ8lxgYK95RmV3DxY=; b=KGAbQePV4UDikDyI
	YaYXzsdCPzD+LrFcLUa+YssKYpZtxeUTDdN4o+AkjMLwxZejE4N6XuChkB8IGXCU
	fl6VHHChGD0TyO0XPJ9sp6oz/UIBlTrr2LBJ9kLHmOugCk794XrxaUH9gOzZBuzl
	9bPqaN+wCXO5O3mIVyz9lk/r1tL2kZ85CaLoNoT2JlX/6F7GWs+8p+o916w1zRvy
	etIB4yR++yHNCkfJSJ4thvOrDb/sFR9vdMxwejXKec+Mz/7maoxadpB/nFaQHMtM
	IYlOA+Q260uU29ixNXNBWBoL8TMbL7W6vG3gx0/4GhCpvxum5aCygvA51wUoZ3o3
	DC/DlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjhtmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:43:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92aea0d801dso506940085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744235; x=1783349035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sxrp3fuMsso2g4/1vO5uXuJ0y7FJ8lxgYK95RmV3DxY=;
        b=SrhxDJGb4YmTXwYOOZMKF0OzJK03mr7PZ0Ywg64COYsxGeDknNSTxQqoI6rqCqiyya
         IZokhwI4pD1lAWQNoM7phzzMYuJnkMjzsKboY/DA1tzcUvzC1pnAC2ayYnSWT4MxdSKJ
         AW6il1zEWXWXJ5w7b0kdyl+x6ty6RCUZLt3DkFPLHT5C+r9ENByDeUWAqK5S4rC74lsF
         lYKcSO34We92Hu8UUFTu8cxUNAhsl9GVJ/nPiCpMPz04vMuXdAumSGhHJe6NlL38887u
         UpvH2IBSD/DSrzyBSmOLWYN0QI+1m6CvOy6HxhxTmziZQQkEz2Iue73UhIhGTWKPeKQt
         c+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744235; x=1783349035;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxrp3fuMsso2g4/1vO5uXuJ0y7FJ8lxgYK95RmV3DxY=;
        b=NewUiXojwjj0uM6YB2M8uaJBmcTg+knjNXTF9QRQMJu5YzgkTrbo7ZN3DUBCU+I+gK
         ENG/MpQbBqgSgXICfzh1648L7ZKav7gXLFlJCejkhQYZ1F4Sfou9CtxXdchSyVl7rxdh
         7P3N8iEyNuTSfb43IhMU7Z1il2iPZWQkdgCilSXfDfFBsba+8jBUtXnm10CqjRdSWWFd
         2eRgryZtMyJ74EausUPITd3PTr3KirPSrjbQGxjI2PBzdmQ1RbcebQ4IzBZClO0wG1Gh
         tzuQI7vSZVfmL69wWjXQtMEMYOHivzQJOFnt2QW9wUSfI7kSF4CZvst1LrMwAzPMuYmW
         ikkg==
X-Forwarded-Encrypted: i=1; AFNElJ8a2plBd7dh4ITs6D0R4wVz4T6BUVXS+HjyCsOt53u0HnxZ8cdW2d3+X8TVxVX2sBLJYT5v6d8r4ZP6NDdw@vger.kernel.org
X-Gm-Message-State: AOJu0YwOytNvPjvMS3KY0EdRcFh2eS5cVm5tj6wbeTBXTD/908ksmNa0
	mPZ8BlenUnISuQ0yRUmPcwl6ledyn7pcu22rNXs3+AIx3i5pDlTXm/HAlZLhNqmPDRvM64gRoOR
	wZs6a+uiJzWUPLpqxVjW8XT8Gfo1+OSZkj5fcjQWPZoVO9PS7XUvtp1SeQRLiviSkWbUI
X-Gm-Gg: AfdE7cmvT2Hn054PEg9D5Cq/0dyYAwOpfgIaY3gd6ogjrrLQazo5bdwKH19EgYwdHJE
	k9tci3r/VTDgGjUSf/hEo+VIhqYZi2FUV5Wy7YxbZ6Q2Zs1RYstU3qWOFPjoX7E4l7PmTxkI3ik
	GG1t6M38eOO9WUM/d2INCVYr37ImNCyt47VDGQGYvALYVhRs+MWKBxlJLb4dgL0wtsJ2F8qv7AK
	BfZaAE5pZUn8tS1jBIoahVDeioTKg7MwtSAWeUcdb3/zdlU+4K1n5JnriuY7fJSrJBilqnCWqkh
	8MYt+wWJvPonbNd//vSZK7XQozxbYayYNHg/8XjTbh2Mp3VZUVhzhuqDmCaaxCgUEonVV7qN4nq
	fRcVY90IG+nJGnrCRquSzBG6v5/f4CVux/mXJ/AtX
X-Received: by 2002:a05:620a:25c9:b0:92b:6805:9193 with SMTP id af79cd13be357-92b68059487mr1542932785a.59.1782744234546;
        Mon, 29 Jun 2026 07:43:54 -0700 (PDT)
X-Received: by 2002:a05:620a:25c9:b0:92b:6805:9193 with SMTP id af79cd13be357-92b68059487mr1542925485a.59.1782744233945;
        Mon, 29 Jun 2026 07:43:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4702eac30f1sm24427644f8f.8.2026.06.29.07.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:43:52 -0700 (PDT)
Message-ID: <df248123-b8a7-46a4-9f0b-1cfdb50306e6@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Add Qualcomm PMK7750
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260610124119.253456-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260610124119.253456-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vZusuTfj7m3kPOIkxXqg8G2YXDTQkpwf
X-Proofpoint-ORIG-GUID: vZusuTfj7m3kPOIkxXqg8G2YXDTQkpwf
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4284ab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=stQqkvZHqmwFSV_nB7EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX7G7aEaHELxrX
 odfqxVt1LY0etaJYrvglFLNn6UC0nqehB/7v1TwSJeV4SerCcDX0QBYDTiKGaLhWMcrX2CCugyD
 iS+MwtJ8GX2VN7tosehLifvzpip5Mjc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX0LjNNdnewid1
 DDXC1FhuuESPM8p+wZ5VT+dUJ3HB5AsLyjPygXzSzfSqHLqe67s21N7z7eZT7A1eRM0IBjlIF77
 h1xO3qs8Pt1HM8FNsX+n8I8n7OZgUULKtIXv2dhh1W6sOXc9Aj7aqWhGVkbId4Q/IIr66viqSY2
 soExLzMPY8pWyhr5sME0eZcrPR8BqVovTOObpJMlqdDtyzeaTHurJXHWLfR368fPx/mgymxBmAg
 /Jyh2MJzUGVhSkuEpgO266wqyYiIhM8g73+KCdczK+dopSoGCj4fwyN87A0l9c8bFY9YrNv8QTl
 pYdB20jTZiynC5oVf/SWjxOOiLj3syOFFnxgwr1Kk2uh4g3xztwZYo9Ccn0DbuI/n4b+d+l38yw
 Ds8QcfE/88MIB1nMvk4OSkFB70rLSezPf088DLb/vJmZm0zWubAiqEA1Zd1jd92B4QZwG3J+s7s
 z/igjsCLtXfyMnXaXrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115174-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED2F96DC59E

On 10/06/2026 14:41, Krzysztof Kozlowski wrote:
> Document Qualcomm PMK7750 used with Eliza SoC.  PMIC is almost the same
> as (and compatible with) PMK8550.
> 
> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +


After some internal discussions, we concluded that it probably is the
same die as pmk8550, just fused differently, thus does not deserve
dedicated compatible and patch can be dropped.

Best regards,
Krzysztof

