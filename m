Return-Path: <linux-arm-msm+bounces-109740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DMnDWVOFWpMUQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:40:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCB75D1CAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 422B0300DEF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5DF3CC306;
	Tue, 26 May 2026 07:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSY3cwxg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQBJXfo/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848133CBE74
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781191; cv=none; b=LbAfX5xDn+/R3TxOxU96SJd9+Rw9k5cVhs5yh5T4yrfpEXasvy+iLjsfniO3tawxSLtXopyaWRmBV6xZ5xo6/9AvvfAl9kHk485go+5+FJ80CmIELKsibytTShwoR49mSQTsWNcGdq/HKVRnVgrh/g3qH0Oqr8tpylcBrz9qQVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781191; c=relaxed/simple;
	bh=FdvFLx56c7j4Q1bvSn2/18ZU9bHg+n/VpOvn/RXofA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezwpBIGbSLuTHvNTbXvnmU8WHDRkHClL7APXTtTWGQ8s3pQXs+DtXIIxeF+jluXZrLGdL7ECXltD7tGwy9XC6q2Ued5lsTvDgZeJTrLREgLNytb2t/tbq4eesJLKMXUWQ6i/njgXotmpGohqR463+lBX3feQ9AsukC/r8jLcU8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSY3cwxg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQBJXfo/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2mgpd4117645
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66VnBCRfaV3S13YsfnYItuFJ43CHbHOZn64Dn/ru2GA=; b=QSY3cwxgSSGJTRXt
	j/6bxp+r29VpDDBrpRD+5yf1c1k2pLT/RPzuJttQCH8Fvw+j4cs2//QG5C55m40O
	LxufqYC2pQVing60Vc8Jq/3CWEZnzNZEiBInZlsYW7WIGWjHLkETeLh4rUBby0d/
	dyzmaZWXtHwux5uU65uuhoxu4EoloNfq1p1NXqkOiuBTW4QyWwZmV+qr7TruZl4z
	CPm5bBiZ+77fqHsf2hQGFAZfVrjjGdNif4CsAogc7h3I57AadI0d65+SOGii2xcU
	D9q0XEBq3JSiWQbYXOzemWjX2FMDvAQg0VaMVfZbGCivfn3zYlAnd8lkppCy5ods
	8p60YA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudaq3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828b1b7fddso5830358a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781188; x=1780385988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66VnBCRfaV3S13YsfnYItuFJ43CHbHOZn64Dn/ru2GA=;
        b=FQBJXfo/ClwcFVq31bBUw7Y6UXAN/A6P1fbnnp00WzNXT6g8vMF1T4c9GPpo2u4Kug
         aHlgelcHcjpagPMmLc6cH5mtxNGygU/Z/g48ykkX4yB0+PubpqDtz4iXzCtdFqfi40PA
         BhSJpQOV4r1z18CmXy2ZXnfGJs23nc1bb9wcsUTYLYeZbchsX4FYJdBc8Xxt2yJ+drZZ
         MH8J8jrHiwkyplObFGdHLsUPEUCIgQEZqlx521IP5MIu+FAQPEVv9il3fC1mJ687Bgk4
         1Ju3sx/lOLXohOZIABF6wXUHHFgn444NIDN6R5KvL/o+McN4YLFDewpC7GRGKRINGr4S
         kkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781188; x=1780385988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66VnBCRfaV3S13YsfnYItuFJ43CHbHOZn64Dn/ru2GA=;
        b=dIrGY2FBDfDwlPkosA+eFeXuMsZ2AA893eDvBdWMGJbIGwO8NUH2vRGat0psbB58d6
         cePnmTAGEJAilm9RzbXZ5cGU4r8s5jO2Cb4TfmEVv/eFndHZIINKznvzKkLgoRhFzO2f
         1ua521kfbN8zP2/4vEU0mS1YVW91jYTBTaaNtwUMuAWKf2If0O2I9ZGIGXy9tCDWF56Y
         gjcAmeUJj4L2uLp9B+0jLaWJWgaAwjZxxz/LFDkbR4/wqF9eb1AMLvYQMBmvq4uqqfaW
         ZaTZvQ8FDjYjiPyD3bN4gpevwEMPRu3WEBo6qYI3xfGS2MFtlxhl9qV3zU7+T0M8U92X
         Lcmw==
X-Forwarded-Encrypted: i=1; AFNElJ8US4af9pHkjV3IA5sbZeu1U3bve8kPgPHDadphJgid/TJxx/wxma+ztX/k/Uy7IckmsMWpLc1EpBJBp2Dy@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7WokEF3YgWgqVPcvB+L4iZw0sn+4O2/mNce529dZjLk3mX9Y
	Ibr1C+OAWwGS3vhtyjC02rePSq3GLHTS3YppgsePXPrMPZx+4fkCOOGK8Zu4/L4J9rj85vM1EkC
	dUfNfuRlLMYDR+9olT3ZYxQ9JNrX3WfCKvhS7g1DLxwOCqidwUc6tYhxU5dwCggXDrk38
X-Gm-Gg: Acq92OGco3D0DoSY3vPW+krhrElf2fc0pGDrMnCQovlHHIk+VXMRvYZYtZiYPeg04xg
	kEcIvKKtqXBcRISDVdWHFLT5Oumz6Km/KWXXkIlQBN0ZgWiLl08qYTR3w+1uOBdEE6clZW3TFlO
	T6C7D3vUqfYZCcsYslglXPeEd6BziOSZmY68kKO4yZFSF918/Y0YVncjuVXTeixLJMIviwkQNau
	ThdnZ1cpC20l5mbfQCz3+LfAO32+Cr7O0uJWJ6amPs0Z0t5YjhDLNP4vPu19kakgn3W205VFnSU
	6pNBobcNbWiSriw0Mdbd0Q2j9lSyc2BHLDviZcIlfTsu48rs5eGtW1QQNv90IuZWI1X5tnDn/TM
	6/FILi0DQZ+rGvNAGmtvgv7F0lJ0BPBFS1hrPUtVMcne8ziq759VjVUZadpQ=
X-Received: by 2002:a05:6a00:3498:b0:837:eaa9:381f with SMTP id d2e1a72fcca58-8415f0387a6mr15970038b3a.0.1779781188481;
        Tue, 26 May 2026 00:39:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:3498:b0:837:eaa9:381f with SMTP id d2e1a72fcca58-8415f0387a6mr15970019b3a.0.1779781188017;
        Tue, 26 May 2026 00:39:48 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fc6e8esm11131575b3a.47.2026.05.26.00.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:39:47 -0700 (PDT)
Message-ID: <a00286c4-3caa-465c-b174-928cae3ca3b8@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:09:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mps,mp8899: Add binding for
 MP8899 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
 <20260519-mp8899-regulator-driver-v1-1-30d14421b7f1@oss.qualcomm.com>
 <20260520-calculating-ruby-pudu-1b6ac6@quoll>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260520-calculating-ruby-pudu-1b6ac6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D_DUO6qfdppWVwbanSBxODYm8HoFUBr_
X-Proofpoint-GUID: D_DUO6qfdppWVwbanSBxODYm8HoFUBr_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfX9KBToSd+l2nP
 TvSHhX47joFDgLl/RiMP/gt5Sx2mF5E2NMMUNnCpHcQPDoTCLfflpbUszUkrODI7pwBTIoKkewx
 DQOAisNFaWzfZxXXt2Pe9KeDNINNQPqJ9zZhS4BhfeGqdQdtDRvsulrVPrCVWDv2xYa5p3qu735
 I1BkMIjhMoOASF70bxqBhb/Xd6JCCf3oa8qCQKDhWUg/FT46vWaJyKWsPRQ8DZvNMBk54e0Hvbk
 NSCKa7W2rf+n3LJAbgN1BQKkzAjJKrX2AjDBZn59RHF2ronKcsNO5Gg4XY6IPK4XwlJJfmlsHd1
 hfOiIl38LHljCdpcY58sD5M4BkfeEY+8xWBOJVoi0cmU1KlODQURfuybbjJonUl1AxdmmhFwYMI
 +mG6YabU+VoGpLJ4WI6Pl94kcC22/ZUf+dP2qapiHdLRp+yrNnFBidcysJmeSe8B8THp3acMGc5
 IATHrxQ6ssb0M4RLeHg==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a154e45 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=2VFAxQgqWxs9CGHwOvwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,bootlin.com:url];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109740-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCCB75D1CAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 3:58 PM, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 11:51:05PM +0530, Vignesh Viswanathan wrote:
>> Add devicetree binding documentation for the Monolithic Power Systems
>> MP8899 PMIC, which provides four synchronous buck converters controlled
>> over I2C.
> 
> Ah, and one more, standard comment (so you could have avoided that
> easily):
> 
> Drop second/last, redundant "binding for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Sure, will drop the redundant text.

Thanks,
Vignesh
> 
> Best regards,
> Krzysztof
> 


