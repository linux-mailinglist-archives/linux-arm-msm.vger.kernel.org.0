Return-Path: <linux-arm-msm+bounces-95115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCO7GpjCpmkbTgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:14:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F0E1ED90E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A4DB307E4AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1B2390CBA;
	Tue,  3 Mar 2026 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sxdc5oyz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ip2uQHJz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C8C390CAC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772535893; cv=none; b=fI2/H0qM9v6EEmAnOm/1reM+gMlYN8Pg0cmAA6AkFGhDpW8Au5wu3zhg2dLELOomj8KRbB7/29PPqJirkClEORgRA0Wi5kwfk1eFESRiwRd0GiwueZ5xPJ//7Us72anmABrGF7brsQn+BHJEJUsrcTZ/Rr4c9sk3nKEEMjQkQgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772535893; c=relaxed/simple;
	bh=kGFX0c9NvBbS7FD14wCNvsYKnXRh5ARIVKK9I2wUHMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3PFAHg2LDsRlFFbxSagCvRSiEMh9v5PmB4HvpoTP8CFC/gRjF0Yk58QwFqnHWwsWulZqtnUBYl4uMYO0LwSwUlBVqIk9D59rjS/bO+eOrAU4ZT+lFqQ/2SIL0b49ypi3BVubpDJxm/sARwcmTFNDKbnmMTes8F76FZNuXRCN68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sxdc5oyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ip2uQHJz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mnNc2773371
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 11:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3jaWevgGgGX4lMgum+7fK49ppZt3sZwsblL3mMRUlTM=; b=Sxdc5oyzYyEJdiz2
	p8WpHChWLpTT0Mo2sDZo9KT7p2FBfNBQMasKPhgSDoLGimXSgnZRVa7F/o1ZdldH
	QpSaY2Xuoz/Za5z0OIBGCD32M6wjR2UMiYZYbPi/37v71YcH3xatkUREbycs+rLG
	sawAAp6THz6Rr+tfBX+w4DxM52UiV/SRR4SrTXNIn7AS9OXZXoyngWZsaTuWaKKF
	eKiJiN9tlwhlwcbVTr0Qx/o0Sj5nMt7zhdt32ASrqqzgaIyjF43gL0EmaZ6CHV4C
	FPqxhy3Alu9R8IeEIjG3myhyMSOD8tD5PQMKWrz+OdqTU6iufJ0FM7wRdXUcfBV2
	V0X3zw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm158t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 11:04:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-895375da74bso49423266d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 03:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772535890; x=1773140690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jaWevgGgGX4lMgum+7fK49ppZt3sZwsblL3mMRUlTM=;
        b=ip2uQHJz/nRo1R0mX9fsgBYH7BwQ/HziWDMIF90yyHs7xpZAmuS0e3TTXsGzZFLR52
         ZCkc4gAdCXIG6Wsxrh0kDZWfaSKvfZNMpb9XwV0XmdclBF1hJQ4fYBREZI7eHf99YsW8
         GnaRXJCDfEFFpdJNr8x19z5ai+cx74I8frTqx1DHN/Hb0Ncsd8kYene1FdBUyFWpO981
         Hy3j7OSWqJuYVQEYzJaTQd5H6b1Q0V6woqOOwmwIIRCHm4XR32ttrTk7e1WHz1OhA/dU
         wKjIWrY7QqlnLVIftwIM1fQ2wcdhckCGDNumh4KiplcbvtQFTmjfqixJZdgrVgpJv5dC
         uxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772535890; x=1773140690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jaWevgGgGX4lMgum+7fK49ppZt3sZwsblL3mMRUlTM=;
        b=ZywN8mHky7nznwy+KTo5gtsg82A+xrM3P6OJ2pbcDUHD7CnTn+rCAseyd4ctZVri4R
         c/k2ETa+g3RuoI/XYjqHW9hsxCeo9HxQ3OFpRL2oGYLR5J/bqdcaeTQ6BvIqrVOftovJ
         9WiOE0rf6k90uk3ar5LHHE3DD0uui2UZUKFFQcrJC8sQ+L/vSHmjKU0uBBPSn1O4G6t9
         t7eCqIDPiIwXAGishYU5VZCDAO1dgo9W9Hop/ghMn0CD/tn77BTUWfo7Dpa3bYwKFH+1
         h0aEaPq3XnvoUrmpml0DlLKjV5pgGbEB+LIZKfudi2vhunoKsB2PSCQciE60qBTqYCaS
         tkdg==
X-Gm-Message-State: AOJu0Yz4nLyVieNL+ALvfPyqHvhs77UuYNio5128TjJsPP0ggqQsYknN
	AU/PhZmg5x4Vu9uzpF57gxGBnVzbRWU2sDoHS/mJhbkw73O0MHmObDDBvrAsGajnYbepDKojs35
	jV/F0gT3prA0R9yHM6uKucR0elt24btyYk7F6A04kwqn03qGJzLa1XXgkkxbqrD9oKMxn
X-Gm-Gg: ATEYQzymq854CylXFIId6PJ6csuev3R0DU0R6B/UxQoEanIMukEJMbyTY1zqWFe33LW
	+tS60/Y2Cum9jNZ1m8MJNQUP7qLYvQp9hK9sz/lkD4pNCg9TjmA5h5aLsPrxa0Ppz8d3bc2EEMl
	hdtK8+XlrCKVFLCULnNh7WEv2Wi3Ba60i5HUlUgIZBxtIfOiLEPDgVehYI+BcqR2OKUB754PMev
	EBpoQVrALn+2N2IPFsOlM4WpomQU3BDSE0DaDVrQwSGEVoDkI+Ozzt2ZNjjrLVDbWXhsi+raaAg
	HpV9PAweZ/WTtZHClQqQWNkkzI1JNOGJsMg7ajVX9CcuHuIUgQHsVMQtXYlTqV5oNoAYX+fil0q
	c+AKBNuZxAqxzmgV4D/lZAaJROrcE0CHK3+loL6rdl4ufeg2oBM+4VkuiKloDVLlkzllB7TN3H8
	xAdn0=
X-Received: by 2002:a05:620a:4004:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cbc8e7a050mr1608829985a.3.1772535890365;
        Tue, 03 Mar 2026 03:04:50 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cbc8e7a050mr1608826385a.3.1772535889804;
        Tue, 03 Mar 2026 03:04:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93c8e3d060sm113418366b.56.2026.03.03.03.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 03:04:49 -0800 (PST)
Message-ID: <a74affaa-5cad-46dd-be46-82c3b71dc512@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 12:04:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom_scm: page dumped because: nonzero _refcount
To: Tj <tj.iam.tj@proton.me>, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <cb59c06a-b0bb-4061-9db6-30b0b350661d@proton.me>
 <25c4608b-c447-42eb-a5b3-8d58bd93ebc7@oss.qualcomm.com>
 <94629352-595b-46bb-9c11-505aa9db0a1a@proton.me>
 <cc10cef2-f032-460c-bbc3-2ec9b5c922c0@oss.qualcomm.com>
 <8cf12905-8221-4f4c-9158-42984d26b0df@proton.me>
 <06ddefe3-2048-4e79-80a2-8d998b2c6a51@oss.qualcomm.com>
 <3e67a37a-3a51-40e6-9608-2641101b6ee5@proton.me>
 <cdb322ed-cb1b-4c7a-900e-31bf5b13cfa9@oss.qualcomm.com>
 <11bdc3aa-fd9a-44fc-b416-b3d6157aae37@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <11bdc3aa-fd9a-44fc-b416-b3d6157aae37@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tFNORcNRvog699B2QNLkEmuRL3kUgrJn
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a6c053 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=xNf9USuDAAAA:8 a=Ka5gcL60GaM7iWjmsQQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: tFNORcNRvog699B2QNLkEmuRL3kUgrJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4NSBTYWx0ZWRfX//CPD1z2tPxP
 GkhNsfizJb191duHHR2/hIhFjF45h2pTtsOU+PQpBT8a7Ug7kJX/9jU8mIUdMGR0oiZl6D8s4eq
 CMFfn0Pv7xaXHj0e93hRoUlH2uZ6TjXsb2R4Yni3C6RNQKsVoK2inG+B+dAf7OYudNJkiydgTkY
 JCSE2EQtiyP0HezP9u4nayCfnfRIky+wFhCc2K1eW2BN2TqqlhAu+uxnBcg+n3VeYy6jqGx6Nli
 5Cp/jJVcfHx2y71UDLYpTVY3YPpA9sm5TXGte7+KpPZ4bhn+dLm4dmOM4ZBzk47h7u4QNhB4hDY
 oMkmwgKflNmsIRlrMECkRJpb+mNOyhNDJx69/5kE0hp3AspJ3mog66xiToCgOk8T2nDVwSG5ERU
 EYwgt10+OKdkJoEJfXttbdL3V0qFj4Uy0mPGH4iBRygTEXsCdDVWLBuWw4I0QdO2te+nVnE7Io3
 EMdMIUFE3tN/chHKQUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030085
X-Rspamd-Queue-Id: 13F0E1ED90E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95115-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 6:52 PM, Tj wrote:
> I've shared all my results, configs, logs, screenshots/photos - and will 
> add further research notes - on Debian Salsa at:
> 
> https://salsa.debian.org/Iam_Tj/galaxybook2w737

Aaaah it's the slimbus driver crashing..

I believe someone is working on a fix for that

I see that the node isn't enabled in upstream, so perhaps you had
some additional delta

Please try to disable it for now

Konrad

