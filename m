Return-Path: <linux-arm-msm+bounces-99204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC4RDlIbwWlKQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:52:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCEE2F08A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47C2E3012E60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7995A39182C;
	Mon, 23 Mar 2026 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbUmdzrh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfKjmKBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA8390995
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263043; cv=none; b=f3h4DXIOhEyaKYgmOrcbxRF6vIP0uIwRlwBsXiPYxxAsvxxlNslR/NUBFXrnSMmNIn6FsDCwkoTN3wuEF4sP1Xckm15L2I4kZ7kHrJmpidKgrOx4bYfQv0yyBpqo2Z/TQWdXOSceYwwEUpDKfhF0WgqqrmAES4JO4JafrQ6Kyg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263043; c=relaxed/simple;
	bh=H4f1g7x9WLlykAGnkdHjbQrwHAulDPV46N58BcB3kVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ucPmZ1ExAYXuATcvYiV6gxHR2f66vs72992BEV66VesbNEj3Kdv3FV9q+pXosqyATdCeegw17873KDEtUexsOdKl/2QEsW4sYLQ3XlzIQHmKumT1iFmq7Md2BBRuc0ionVwPbglhw86bIjPyt15yc8TMfFBK3swhWFMJxtYZEr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbUmdzrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfKjmKBA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tAZD2291137
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ZF+B/X9w8PUPC3jlK5RcllzRl78L6xUORvkSP6XNgg=; b=nbUmdzrh2s0+QhYz
	aDto5/oIrG5TY+M9E/8AxO3IkTOQztdBTulRnW2tCbo2gu/4f3ooSyKjyMbfi/NU
	5dxlnlI7pDqLpH9IWMutt3nvmAs6ZJj7xQL20GoBWtOqXD3zH4S7DFvWV8G2/pdg
	8oMafCVyFhk5k3gkLx/b1Mc2rdhaLvxtmAPFyC971S9hxi23JlnsQWs8nj6/gelE
	s5e+hJSeOTN3Yu603r00hzNMEE00DbRWMc1QovdvvwSu1bqVPUCuj+auOqo6duJR
	kQaSkBI4fd274BpZuUx+6GvID24S6FhYsjK8wCqKLYyXCJbda1L1wqF3ZvQODfzd
	WmWfMQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j70m0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:50:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2d15c360so31972081cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263040; x=1774867840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ZF+B/X9w8PUPC3jlK5RcllzRl78L6xUORvkSP6XNgg=;
        b=ZfKjmKBA2sAoW3MBizUVWIZxEsB+O9t3ud8EBjtRza4Gd9wPEoDw+EQZP7m9LGXdt9
         GuMJW5oR37ea3h0Eft0qOXKSV6IYl0fS4JyztzPxqsLYDVMAkNLzwpdaQUaT94hLNR7O
         KDTgCeLGFmV2rmNW1Iq4ZAT4w+iSvjYmjgD+r7hozy/thmBT9LYCwd3JtNgGfaKTs0/i
         NSQuOhpBu0FrLka8n8neOJH7+hmdiWGGghEJ+Sfm8ymRdQyW4kCafSUh8yAhRsJoyJSs
         5nINQF7qRvSGmqN5izKbwV/D8rh6Nz01JwcNHaYYF8LY00dCbBrPiZh/LIwMIh6po5fY
         3Ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263040; x=1774867840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZF+B/X9w8PUPC3jlK5RcllzRl78L6xUORvkSP6XNgg=;
        b=GalO66tEH/93v49jo3Kc4LaF/58/jK/PwjUcai0h3X7Z2ctiFrXDuqc5KLJHCcQdsE
         +3UpaLFSNOovZAjCI3L/TF9bTRptJeYqY9HAsbtLfwl6dLkrkL3BS3SWP5Y+5O3YMkdi
         0raWhcN8a/phB4uBziZdR0EeBxw+xh7kJsig0Bp3IyvY3oblSap96Swhe48RtjJ1EtVN
         NYnUU77hLGk243o92kcpiA9ItiFoy72DsppPawBybkTWBWzlsyR2JP29FBNhhLK8C+o1
         uIxKW8pBJHDI3UUP4vAvpmWw0jnJ/pJkIqbGa56vSIPSoP4viTr7k/v83AEoDDz3ecCq
         6nOg==
X-Forwarded-Encrypted: i=1; AJvYcCUKKa8ZDmU+haT2oB6UUiN5nBHg2quutCv4hCcshYG8i4lQ0JLn1oPq8LETn8Mg9U5FudZt2OFZdWCrt8CB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/rqowXthzpCDLp038w5DTpiNncmXDyVc/v3uTcLY9V1Nu/ZTh
	pFfvPmz2G/7TYdgfRpTH4W7Jfqo9O33tC8/CN9MJAEOzEuGhenqk7TnOHXZyXc+c0eyTqyh5mW0
	c+DoigGOYYTiL9wrk7EPcjjPqgJ96h3K8Ze/3fKMw80VppOfslFxV4wtaaqrJceVdJaNJ
X-Gm-Gg: ATEYQzwv0ClD+1SkbxKDZ+kJMhcJ4yWzFJH6e88ANn+F/ZAQOK1GO+3IDKifj0xEnkA
	o0FRl31p+pNm3mBKh+9alDOd8mPJ4mcSGT4O/uD19reDz/zzyIOOv8m9KHcQ+yxpwE24ROpGzio
	HdLwoztWxcCedN6yYeGwc2VTj/5NmyHE/m28vtl50DO1P3f3g/izGNpzzXdVp7rJLvqBVvOupJU
	94TGCYzTJpiarcWUcmc3xf3TVQ0uj8JLbqCQlbTVI7iBuuwYL9dBQnydHwOVFtbwzhOsv4YZUZ7
	IlI6G5gIEhEn+CbG+T887h64ossSloehtlGVtianRvxYSSgf5Bg6KmgeqIWWfDBcNd2wVorGpW5
	150FxlSs5TezrSy1i/5niN7AsWMw0iegZT1Q2oNdrPusw9dbPsG//+UWmDtNUJc6m8IDmk3KZY8
	fMrzk=
X-Received: by 2002:ac8:57c3:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50b37505109mr142823781cf.6.1774263040560;
        Mon, 23 Mar 2026 03:50:40 -0700 (PDT)
X-Received: by 2002:ac8:57c3:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50b37505109mr142823551cf.6.1774263039979;
        Mon, 23 Mar 2026 03:50:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8ef74sm469525166b.25.2026.03.23.03.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:50:39 -0700 (PDT)
Message-ID: <79ae9efc-7f99-4916-996f-52ff5061261b@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:50:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
 <hacarw76ftbkirg2ko4t4idpcyqouekodiqb7o2jf2ciscwfi7@egg33tcpahzp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <hacarw76ftbkirg2ko4t4idpcyqouekodiqb7o2jf2ciscwfi7@egg33tcpahzp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c11b01 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UfbPLg0nH72B0dWOu2EA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ijoAnbsXdKe0tgsTqsKXtHPnPIyjUFQc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfX3ZxFrUNgqGnS
 kjbw4on37rMgF3NxQz+mWPfiJztwgjVTTUgrXYflbyjuOSq9uSYs70p9t0e/MKAwETbw1kBIHsK
 s0aoLHkuWvy6md2DjBIr3VK4lRRK7W48uoW8OkSy8fWd8jQ6MQWMexXNt0EppeAxKH9gtym/SJW
 HXLKE1ZG7M2MnHrh/k5EWCwLzWxlqixJNgo8RlQy6JbsNOpCKL/JAD5ouyt08MLV4M0vJRYYlXF
 ePlel8pqPQX+5OzxmaXvmecWZqAz0OLbbnxPwNjWIoqDzKfDrouyBZH5gPVDV98jTbyuXprxJMc
 eYLVzJeiMxrvKqgFKxHpbJB4wQRVnRvuuDNbyOv0RIjTrq25jLkiK6qrjq4RJ/5NSWLIevn01FU
 67NErJXhp3oYMLeu3dUPkAGZ9hS9HS088VC0SdftE8Pgfx1eYl96pn/xZJWmQ3e5uw32j7Z+8+J
 UXP/ei8iUnRmBtIjlaA==
X-Proofpoint-GUID: ijoAnbsXdKe0tgsTqsKXtHPnPIyjUFQc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230083
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99204-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFCEE2F08A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/22/26 6:51 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
>> Recent discussions off-list highlighted that the GCC should vote for the
>> RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
>> aggregate the correct load for the CX rail, potentially leading to voltage
>> drops and system instability.
> 
> Should we add it on other platforms too?

Things generally work better when powered on

Konrad

