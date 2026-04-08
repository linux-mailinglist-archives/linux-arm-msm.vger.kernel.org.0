Return-Path: <linux-arm-msm+bounces-102331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCexDrpX1mlJEAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:27:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B8D3BCD77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D13BE3051EAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 13:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB1B37F731;
	Wed,  8 Apr 2026 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHQ441be";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiCFG78F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1633F394
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654809; cv=none; b=etOce42GMjSnT/umCjcUxFTH+A+JhSPPZ7iPxyo/l3IKvJdeaBn3Zy8LJ/AaQls0odUBnPSCvmkVyhlP34rc+FnPsmR0LMx+zrBpbhPUdz5pJagnfbTsn6tWnRk3W7iC0yNMLnfX5azz++OZpc3v3gP/LrhlNqIpsB4LjvPg8Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654809; c=relaxed/simple;
	bh=31+Nn+H1zvkXMEJm7djV33Cf9S+18OFYs4CwkmVXFjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5cdUcQWIG2dUTcQHS4DOOjv4X98dVSxe/yMHA9Ukw6y5Qr7cfcWyI9d0Ti/cnu/l7sryc+Hv16DYqyWwGZAK71xtClRmoWL1S8nnVJ84tue7YqDFY2xi7NJ4GUex6GBwZ/aPDL84IXvWyW/hBS3pVWyLyIqNgVUCQI5OCkjTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHQ441be; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiCFG78F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6388rpo22412265
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 13:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUsI0vRt/h3JRrI0+01jviA1yqiyNxPW3ZUL83X8HrI=; b=AHQ441beUejrIpys
	SHlVQUTy4Y49IKQyqQaWNrdqhpAJi0Lxxr6xUhIGOj60a4oHca5+k2s1c78VV0v4
	1p02lw6jeWxmSBSj1jKXW6PujcomwaYCZQ7W81MAm+/eQ42Sd8pvnUYqeUM4//gu
	bXbCRnQCHGUNz4yJDXosi8iXKw+pP5rIi8jRclBE3++/Gw3tXECUiiiRe9usTq53
	UZ6k1g1HfffMpr1xUlXuMKOBtfW+B1oyEWTSPKkrMd8YU2Wnbyb1MavpqTg7OxSg
	mkJd3PzlrFZ3oDEV8k/MDGTzzsWqYaWwwWJ1d4s34rY0pBaUnx2BWvJOtkgFMS3G
	Jyyvag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vbxh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 13:26:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b32feb719so8907011cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775654806; x=1776259606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUsI0vRt/h3JRrI0+01jviA1yqiyNxPW3ZUL83X8HrI=;
        b=CiCFG78FtEa1+FVeWoThhvVu2r0qE9smTIn1+bNZYqUcXZ1pO7DumvEOIWDsUo/JWI
         8D9u5Q6fDtBQSa+uZ/S6TP5cDnkLYuJ5hHOtC+LTul2bK0W93gDSFFwY3UcjOnlAUFii
         EkD/JpskajK4zKvI+oOBiFjF+4ovx4zRm2sYzyFtktu+OzU79tYe6rkcj39xebsVExCx
         3o/KaGc3xoeI1rFdxKNxiSVAhv+s0wLm81j9UiVqKP07jwCJbg9dbwRHWS8rlZbLrSJd
         KAu0ugjupLXhUrzLaCDnP53zH8uoCLSKkESUmN74rXhjOqsdd2k/xcuFpXR453WB+WY5
         T+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654806; x=1776259606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUsI0vRt/h3JRrI0+01jviA1yqiyNxPW3ZUL83X8HrI=;
        b=Edos7rPst04t5nHPUW2vOcp9ABhbFHv3ZpxiULoD+stLlK1FuUaZ923kFoA1CEfx42
         Jq2GqwEDsoJjk5cu7qi6Vbo/Le7F/8KydFowGrVOWt/d8Skybcd/yTbSGGvM8VZI1iGH
         HkgePjlw7gtTFrhc8Tyg7yoXBnA8SujJ0h0kWuUg0eq4a5F77RDwbOsb155QGuGJnPkH
         +7VrwncEo8T6JLXxn7tAt8qFQSOQKW+sLaXi01p3r1UvYo7XiMg/fVB5CtcqIFr7pXko
         KLt1xy7kIrJeyaNgwHPmYA6AJpOkXlgXcPVMOXxX+exVgMh1VyI+GkZQ7LwHzr6azQk8
         E4IA==
X-Forwarded-Encrypted: i=1; AJvYcCWgr2yOpipVDy5ssY5o61y1lh9Iz1uJeo+7POqpy18CcfrsLlW/mJAfioYqwG+Mva8rtwoGzYY7fVmS50ag@vger.kernel.org
X-Gm-Message-State: AOJu0YyGwuHKBvHUCM2PdZRhEk6CfOPCGAQzP76Ww/3pJQkE1PehLGBp
	tAReWgUqNp+Hn1kGmOrKgQ+P4TseN0BDgftrfTI+k2h0LXd2y3G8Th+LPueeuRjxoZAxEB7rkCg
	eIVUqIvJw+3jYMaAvg8K6tdXBgHwpPek4sdoCgrwIddOXCEfV651paqWEkZnlSChvaCxy
X-Gm-Gg: AeBDies2oUTr73CmTPfyL2L5rv76cLiPBANs9DdztBz5YYMEQ6pXqAuXlXGpESkhNp4
	9uPdp2jN9zjQWOnfndmVpcAM3JvKDJRSYr7K+0buvLAgCdgBVg2V4eFhJTUtp6aHCfJTkVN7E3O
	L3PHjnF0ACtVypsOpnOcRF6fhfp7TpWU7N/ufh3WfwCIFpX45yOqchzv7ddC5O866Vll++7K9Gz
	JNjBp4p1dY0I4FR0tkPaI4m8W/xWvFcMEew5WmKumR/VajE7IF/p+C29NW4TMPD1rgnPyzC7inJ
	GHWj660Lv9YNB8OR0QJcJN65VNRTkSQB4q6mQGR6ow43DhVSgc5F+cwlw28l4TNwF4MWV1GfqU7
	A+tvhDs0x80HxXhk9h9eaOC0k4FEk9PRdDCTpzLSR1b8AujSEc8Sb54ZVs7f34mjd29RzTG2ZYa
	ca5yE=
X-Received: by 2002:a05:622a:11c4:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50d62d30eb2mr224219881cf.8.1775654806118;
        Wed, 08 Apr 2026 06:26:46 -0700 (PDT)
X-Received: by 2002:a05:622a:11c4:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50d62d30eb2mr224219471cf.8.1775654805544;
        Wed, 08 Apr 2026 06:26:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028995sm646292166b.57.2026.04.08.06.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:26:44 -0700 (PDT)
Message-ID: <1a6e1819-cce3-4e08-8cf6-2cc3a8abeb74@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 15:26:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: milos: Add IMEM node
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
 <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyNCBTYWx0ZWRfX5gEGrQRPDIT6
 L2QSGozg+d48D+o6Ka59jJpPKgM7mn138LHBc3cvrUKpfxFIGF51Ipur29XEQ2ipquJ+ffAJbqB
 oyHKlNUsx5loUXLwia60I+7dXIhOHT7CzdlVBS/PG1ARBzWf2orYhqEkA8v1mPCLXw+cll2JK0x
 bdSQyTMkcoawqF0VYx0u1bEgRmpIkN4MrgspefpQWBwDGTwcTW0pC0fY9NDt4VdCXvw9NM2v/IB
 FvXnd+kD+xnsdX8SIjkmxB4hXXTa4QyuwU/thQrH+16hVuJ0LxyWm1zM+4x6L9y/imtDrUtV6w6
 LXy2kyCeqQXqq7BKwbZn0Mz9Cc7voFC595YMpF7kfWAcGmsREQpF89OZEqlozjW+9tQapAwt09G
 nDVVPVHT7QzbN5UiaF1hs6uHY8HbMm8dh9Lg4MrmkJzdfEvl1f2KjbjJM3Ol59JevJydyyocxys
 dE0xPl/pkp4WJ0e4+iQ==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d65796 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=pLXVy_XSri54llwUxOQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: sxgYNyThwf_HmzEIgdHci-HE6lNbslx5
X-Proofpoint-GUID: sxgYNyThwf_HmzEIgdHci-HE6lNbslx5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080124
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email,94c:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102331-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5B8D3BCD77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 5:11 PM, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Not happy about the names of the subnodes. pil-reloc-sram is not allowed
> it seems. Glymur calls it "pil-sram@94c", not sure this is wanted?

Not really.. I had a patch for that, I'll send it rn

Konrad

