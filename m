Return-Path: <linux-arm-msm+bounces-97191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFVhJvGmsmnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:43:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A096D271336
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 55286301D483
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8E03AE6ED;
	Thu, 12 Mar 2026 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5phZrdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7RSODjH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6600D3B7769
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315733; cv=none; b=K3Rlx3CS9qvObFhhaZxaU/6EQbBMKtfKHmfpiGMyTRYRQ+L+OZs+qjYA1U1vTIuk8YcIFymKPsqMsbSUfzCqJ2QT0Mx7lA3hBQsDZPQnlmyurxFhH6UHXBhw78+RrWR9o8Fr0v9kVpZr6zN4qBMkIorQXTIBI4bg8AMMl+Rrlgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315733; c=relaxed/simple;
	bh=K+Lls85tI06zAStnQt2JpIDd94kGRPBAjQ4m5phRPV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmPHh51IRzwrg/ZKMKCuJWFMjfireNpHEX7poE/3X+sC1qgz3QAsEUvqQFmeHCGx9jVqXd8+Rzt1WMULAmvvCzHV6OQitk4HWRGReDpdKObPE3SB1sRSAolL6dv0NQ+3notWBiUH5iYilbHaseWfNEjxHmoiGe5dF5NyiCyApfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5phZrdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7RSODjH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9vLY43668464
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=; b=P5phZrdji2XNB1A7
	dTTi/RsItP2yc1RU394FYJtIegEYWxTNyrkQb0nAwMYAKmSD8GZ0IhcKP0iEn39T
	gPpRZjfwGbi1uO32Yfl3TFFBlGMioBr9HyrKxTKT8kBqhEkU2yEOd8CFcf6t9eyv
	CqE9kdZD7mCqzR8uNPVT4RBKJOpmu73ReHRA/EkhWeGpxE2vkNMzto6iDdQJgujY
	LOGl+LoKIbBfmjlUgTd3w3s3q1mw3x1d3hdxAvi6MWs7VO5s+YYappVus92gUf+M
	U2peZk8AIN/AUUgB+VjEDiVd6wpnW54pw9QdSIRCsBJQQnWWpQcwYQoQm+ZwhEgs
	wMOK5g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60hye6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:42:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae47b3adacso9836185ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315730; x=1773920530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=;
        b=J7RSODjHfWdCER63RtLjQWiaIahcMkD0FXqsS8JTXK52x7WELXSJBUFQLlWG2u4uXZ
         /e75MGX/mehM1TbAMQhnf5rTK4l0EBbWoaTDCHVYAXF14cNMa+AqIqQwwgVtHjyYuRd6
         2Bw453lcyzt/gfJ7vJGMQm99VTPfCyhrGFG3LEajJvBG6cfn8TkrlkD7vOrESinzFoIB
         kOKIt0+ML5yX/u6QbiWk7qckm6gw4BkIK4AAGMlSmDc+F1o1rMRtD7u6wD0yMKD8aX9o
         64/16qnc3Wmdqw45DiqAwAvFEfUJXDpwwzBQpAO3ks6vih02KrgmxgNTxZhxmEjQTBEo
         qZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315730; x=1773920530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=;
        b=AXkQKwMQdQejcmWqCoiasdXIfvOFgGM5d6SwCWiG+rOftSOhTNA7FJqjwtDAXiRIgS
         sfC5Y49sXWkfcXl/nLCCmc9iqPPIlcR5FwucbkcuN43o/HEyaRNWSl4Rp5KAdTYpDIr2
         2qkRbpVQXLxMO7X+Ks82e8uL0t+4yINrnNX/J8VsBEp2LhGvbvdVznJ3CmETiVb9HIsl
         sMSHz+fmR2A8bvs/i1GdPVtHaS9vsjqDgZuD8ALY7nNue2y7eX/de0pSr9Ry2Detvb1/
         KLZkVaP8t69LCwn/V0Dj5WkN4XTjEVud4hX/qDHW3Kq9xiBYpWDixHM+dvYqdF62QY0o
         ZFzA==
X-Forwarded-Encrypted: i=1; AJvYcCXZNo9uyWKSNBDFO43JuRJr3I+tDZZT0KDUmEpGf1LOVWCfkbuO57FOhpl2Z0kGNmu88LUztsP68fBwKBsy@vger.kernel.org
X-Gm-Message-State: AOJu0YxRBUYlvaLTbVmE1q6IhK9ycOeusqc1LIkEajoPwpc2oNGwqxDG
	SGiG9Jcd74Ir6SKhom86bmlo6Ls6helwxZ8dvVEcLR4Tb/ix7q2sC7KWTjKlhP5bQYc9PKcpD7F
	tTOF4OgMxpcqHns6EC45JJ86V+w1Wb5EIKybywMwKkc8vAV1GZUYmcYo0G5bDJMQarbvK
X-Gm-Gg: ATEYQzz7HqML4NpRhR6Bm5yx6i+7QmZXGQxfcDZGNH3OzFTw+FrZQNPXYxax6Xp8+Tz
	BmUclquF2SjN0CSHDuATB8wtpcPYaw9CkvKe/BTcR6YIZtF3QkH7uZHybJ75Gz0rRAbSLewt023
	2YBepT77Cdhj61Dq3uY+5w9E4gJA26aAMYnwq5Vmz37Td75MDrq1tXv950M7ZuHuwJuGwwpmypM
	Aqe8WBdw+dkGDCTngSCI7VTFO1Jf8L+RfKZReSXMuTKzolQO8l2IewtCBY3DIrrKREkh0fSfQru
	dfgyf9xXvgvTdUOi24tDFeoS196J1iFVWEQ4tC5/A02itGUBDFiiaJ5jYtmvafNmHpN0tGiqyAx
	N3qBfbbxz95GEed40/ssuJ1bA3VDFd8YwmJ8IRCJNmeFYrQT7Sfztarak/Q==
X-Received: by 2002:a17:902:d4ce:b0:2ae:47af:3b29 with SMTP id d9443c01a7336-2aeae92124bmr54674225ad.57.1773315730439;
        Thu, 12 Mar 2026 04:42:10 -0700 (PDT)
X-Received: by 2002:a17:902:d4ce:b0:2ae:47af:3b29 with SMTP id d9443c01a7336-2aeae92124bmr54673835ad.57.1773315729939;
        Thu, 12 Mar 2026 04:42:09 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae22217dsm53886225ad.4.2026.03.12.04.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 04:42:09 -0700 (PDT)
Message-ID: <ce25b963-0e8e-4411-a406-7b466eadb1f9@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:11:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260309210506.GA589665@bhelgaas>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260309210506.GA589665@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u2_xVNdPOdaIqCO6pwmaOCLmuLprxRf7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfX2xnXrq6f1lfJ
 qgcRblB5b9BEexP1BBxw13PzKQ79YqSrMsLa7bN/WoQ5u4NVTDt/kdcIHGPSCF58PY8Exdy1Rbm
 /5d90GXOh/v2ZXdbkptYf0BDKUL+uJryy1IYdM2eYSjcOzUetyDc6AsAkdTXdMWrol+RTP2OT/W
 qKDaFju4jeWerktZFKMTxLuiVUxKZ8YMSZAg2yabALBL8Kx3keF9L/An+1NLKLSRWmHH9AT/ES1
 86U/uhx9Gdqp7iJFrl0/5nr1LCjBToDhIrDcf6zkj+x3NXj985uqVKtWVAv4ITxI+KDg4YmF+x0
 sKdaYofylbD0MUlS8q+xmP3savEP4CyWjMCCBcukSHkQ601lKWbNGCwwY3/13z8uTmlID/RwvTh
 iZkk90fifiAZh6aTjZ6plPil2Z40t6Y/5Wi2RpqZy2b64NrL9N2geq8MVjvbeSCDIq7UUa3rwNO
 d5xDF2BvEMdGBuc9ftw==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2a693 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Iq-Xo7JqGUrbNy38CdcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: u2_xVNdPOdaIqCO6pwmaOCLmuLprxRf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-97191-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A096D271336
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/10/2026 2:35 AM, Bjorn Helgaas wrote:
> On Mon, Mar 09, 2026 at 01:03:36AM +0530, Vijayanand Jitta wrote:
>> ...
> 
>> Charan Teja Kalla (1):
>>       of: factor arguments passed to of_map_id() into a struct
> 
> Please make this subject line match the capitalization of those below,
> i.e., "of: Factor arguments ..."
> 

Sure, I'll update it.

Thanks,
Vijay

>> Robin Murphy (2):
>>       of: Add convenience wrappers for of_map_id()
>>       of: Respect #{iommu,msi}-cells in maps


