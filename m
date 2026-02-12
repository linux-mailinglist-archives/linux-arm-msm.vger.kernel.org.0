Return-Path: <linux-arm-msm+bounces-92686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NUBTCgq+jWkZ6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:48:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5417D12D282
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF7CC30074ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FFB34D903;
	Thu, 12 Feb 2026 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzDyKRVs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FbcQNZvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5687430BF6A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896901; cv=none; b=iUCWPSPk+KFDd831wfnYASAhJRJhWNGliVV7WSo3dQX3x8iwix/p3Z80Ug2F+uvfkZvrYwy/qOJpDVBQsNGFwNRfSV46ZUXN89aPC9/RYx19Qbpplm/5WnmWtFRlTB7eLLk64PZAbCiALP0JkdiyozIC3itA2Xj8wJwykr+54Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896901; c=relaxed/simple;
	bh=hIh3oSyVMQQt7qw+8sircxXE8uP/SPAf5YkX5rhX1is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAvsptzvUNEPP9QWS2Zgi9heYHg2yNS8mtj1hHQC0MwLVyyOq81Wcri+KBV/66p54ALyQ9rsrB465eUtqD2X5t4C2tJcbIus2ENhH7PQdhEsB+PWbxI4VQgb+C1eO9TlcyNGrN2Rdq/fuSoVQfptW3wEF1QwEkhsRSxXWumWi24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzDyKRVs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FbcQNZvm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C9o64a3562074
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58fQgaFCLcM82KGrE+raK/eX/NXaaod58IGSbttniHw=; b=TzDyKRVs960eF3bg
	opjXA1gMScMRs2OHKBzhJXg7Q02mJuCCwXfIJR2+zwreDwR4Ux2YZdEVOrSbR+5g
	wdBd9xM0v2QfkKN3Q9aPXGyCEdCZUVCrBLOHvRHoWt32ULWlh+Ewpc2K8I876nZy
	KLZ+6U79/ZK27GFvUtn5d17zWCgVa+EVMsjtYl8bSccizPk/6meOpX7/dukZc4o/
	GWrWlerIr7cfF8Avwzh3RxGatrB4YUGINIVgCtT346o3cDqSNrOtS0t1WzN4IOEl
	vTWvayEhnyPt1kx+SWdVzs2dR6vUwxauPTUurQs2DIV6cJD+ubm6BTM9lEILXp+W
	BIRvuw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ck2gbw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:48:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946c23cf90so28455666d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770896898; x=1771501698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58fQgaFCLcM82KGrE+raK/eX/NXaaod58IGSbttniHw=;
        b=FbcQNZvmBRF5mInBVRrpGF+4qj7FeEIrr6HcD9JlA3lFU0flymop7AmKwXBjGTds6N
         LnTrh8m8cYFjlqN0tFTEwfTavwwdXAFgwN0lHjCjEWhoYterHrGVeKMb+LWoydAP9H3a
         0bSgPI+vm8wjed7XycgDHCXieCsScKwRz4l4Gbg4Yi76gezl6EE3Np2a+/5SXSJ1f+7E
         QypAXGjUCRZYBF/Gqny+6GA7DYrZvH+f8vq7XdptGznoYGtBZxrJSrtm84U73YZ1Weu9
         zxWJq9Cg28JDZLn/UiCJVS9JCNwwObhbR2nIxswkKsM/W8z9hTEioVZh09FvEVipBYdv
         v8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896898; x=1771501698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58fQgaFCLcM82KGrE+raK/eX/NXaaod58IGSbttniHw=;
        b=S64vH9JL/fPA6WtO+gh4QZsnA19wyiWh5tW+7KjDQIzTo1riZuHCRJzouZZvPJFpI6
         azF/ldmCk7ciURU06JwR0qyhWMFWoTL09Br+lIkHGZkGgGQW0KXowUKM6U+8cUM8yLhF
         8hRlIK5rmmOX+VLJ+WDtnmLqHNZtO2ETsLhMydavlaec40Dg8IB76DMfXq3HJA1wAwfS
         p1wDVVh6MD84YAHbwSoG4q05+yfWeSICBw3Lt1DOpRYUpbDoXcAsPZ+9/CUsDAQ7b6LP
         i30tUldnGPeqmYI8W4P5a87XsK7EuC7Am/JVcs53iMIO+ExkUEKOxVYwr7DG2vbFtx6D
         iXDg==
X-Gm-Message-State: AOJu0YyFTKA150pzotAXCeFZ1jXeqISgCxV1IGdQAEBTAJLC050F99ym
	17I0R4IicWtUI/CONZ5oyCF98qkSZfOsfHin8TiiG6n6v5Th4hjtk+9dwPciM2/aoHk6wTq2w5p
	6A1c+nWPUhNMJeZ3y4+XfLp0a5RuR7L08NQyppspk8HLvXIUI58k500UgY6B5B2K1IuwK
X-Gm-Gg: AZuq6aIimTbMP/EGqfEDQX+VU7fEcQtXgMF86OhmGkcqlz0Feb0j5AvEgE5nANLWWkm
	K7c0KEqCJpfmHBumePT05PSk9sAWTseMd0Dtdhagqjxiazm/9RxOFRzgZefrMkobWaHx3SXYhXw
	xbtOzyL4QgoZ3yCdrYsfPs4Ub8w8VFbarzt0N0Hxd80TyMb3Cp4cBf2B2m/4lYq+w9UH1MZA+yL
	/dauSrQt8wQmq5tysNCVDamY6BmiAZuZDj9VyCTXEWLezZgw/NA9B8n+fmWmh6+OupY42JCEi5b
	iHqJT0xpDIPrs08Vgla/9IsxYJzWfru/yVs3SIOY6b4Z+nXDMLxI7QqmoONPQAtVOZZVdCV+Vmo
	NF3qSun1AGNF9YO0oCLhNKaRyqsALkOVaSUEGzI9LlVPyaKR49YcYf/X/ZyqJ7+cdURzQy4MiXQ
	Ud07A=
X-Received: by 2002:a0c:e014:0:b0:897:41c:a766 with SMTP id 6a1803df08f44-89727af3e44mr26162356d6.5.1770896898620;
        Thu, 12 Feb 2026 03:48:18 -0800 (PST)
X-Received: by 2002:a0c:e014:0:b0:897:41c:a766 with SMTP id 6a1803df08f44-89727af3e44mr26162106d6.5.1770896898098;
        Thu, 12 Feb 2026 03:48:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf38c5dsm1691236a12.22.2026.02.12.03.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 03:48:17 -0800 (PST)
Message-ID: <3c06c3cd-cc10-4e2c-9001-9e0a4174d489@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 12:48:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch nodes
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260212-industrial-mezzanine-pcie-v3-0-1e152937a76a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212-industrial-mezzanine-pcie-v3-0-1e152937a76a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cd7fb3DM c=1 sm=1 tr=0 ts=698dbe03 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=tdYBvKbOvurciTX4EzIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4OCBTYWx0ZWRfX8iEEA3qlS7eY
 Fg3VRN7M0SjI1KlZwB3X4nmjSBd6pNvf6n5EpluxU/00RwWNgPak+a4FJOxLY9Fv6KM++Alt2V6
 fcb2YQAf8+J637MmtIYNQZ8b1sfvcb4iU/A33L5IT6V6wdP09RTfUKmoH4wQpzNWnIaCrA7O/JI
 L/qATy+4/KSRSmkfECJodL9IK4SSFzBV6a9jigNFzbeoKA19w0ozzesz/xrWqUgbA75EJe6T4e8
 ePSpEeMjfHkukC/678aVQ0wAmFhoKrL6x9zdkLS/kIRHPs/5Yjm9OjPu+FwYGa8X9aqNq0mjcOr
 H4gnvTpcnu44tr9SaF6Fk1Z3CkNbGAvL56Ui5FBpKPtzAyEE3x/TW90QmHK/v4MJhhK8t+00qqR
 rFHFFJXL4qOjAEaXcdyMa9GSOwDUbynuYjr2d9SfqODKhBsrMzNj2TdauVMnWKlCwWrkAph/h4g
 Q3LSjbi6k4jOr0SPPxg==
X-Proofpoint-GUID: ShBaYo2Pw_k2-n0-iNJoF8F6dHE-olrm
X-Proofpoint-ORIG-GUID: ShBaYo2Pw_k2-n0-iNJoF8F6dHE-olrm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92686-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5417D12D282
X-Rspamd-Action: no action

On 2/12/26 11:44 AM, Sushrut Shree Trivedi wrote:
> Add nodes for the two additional TC9563 PCIe switches present on the
> QCOM RB3Gen2 Industrial Mezzanine platform.
> 
> One of the TC9563 is connected directly to the PCIe0 root-port while
> the second TC9563 switch is connected in cascade fashion to another
> already available TC9563 switch on PCIe1 via the former's downstream
> port (DSP). The final PCIe hierarchy on the Industrial Mezz platform
	^ +Mani is that PCIe terminology, or is that a Toshiba-ism?

Konrad

