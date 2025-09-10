Return-Path: <linux-arm-msm+bounces-72927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDFFB5118F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB83D3A895C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739652DD5F6;
	Wed, 10 Sep 2025 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5AYeBDd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC852652B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493475; cv=none; b=Nh6/x/WwfBek5DE3wgSjpRpQfSpHQxbfGgYvnTGgVZrel2JED+KRIMoZxt5OorEGHgP85WveXcPCw91SmQxgOA772Z4e7VNUSG6wxYazJkfat4pKSXIEYb+UJQXILwRARJt7hdmdOGhDJb+9try8zysK9FAErKFA3xytoK9DVSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493475; c=relaxed/simple;
	bh=BWGBbMRYr4HuFrGx46ITqeu+2gtKn3PhByFqYcAPrI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRSuWVM0MxdWfQ65faqNC5AE4Oibbyu6UUbabyurOXfJMXtvjM3DLYishztEqUfwMcsOIcxnKmwB2cy2g+QrGrVC72J9z4j004S4CIpnNpK0w/o3wvERj7tVeAJz3CSQtw7NvuXpPY8aZ4l80SXNiAxjvTP25CGQ/uWNFkwQdtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5AYeBDd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A7crJk025320
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21u6bcbJ3lyG6GKemCvFCPvqIQDuRSBmxwYo3F4Ym6U=; b=H5AYeBDdly3YmeFV
	gUAaGRENvp2RaT1yVoP/1ZNPxsOKEvvp2J3jl5zRRx36ACltVspq+xfxB0LFgf+v
	Q8sC6venfb2CBx/A70z5QM2D51dvqpubES/pT+bWoZh7HtC+NOOCG8hk1ImPLXcr
	LJ3pj6j2hZ27qGoq5Cc96U3eshrr6ID2ZIC2RsiXDCs3KRkqatTJl+NFo4lG6EKO
	85HRLzdXSh+fLXMrMkL6GIpz2Fj2znY+sPETu35MASLEpI8wAOS/R8omobVVk5yL
	WSWuINft94u0/qQWvu9K7x0cCPuUYRc1Pu+NZ0IJRVwXbLjaLLyPXMZAzNetfzXP
	XbL9oQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsbamy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:37:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-71ce3c952c1so10538526d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 01:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493472; x=1758098272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=21u6bcbJ3lyG6GKemCvFCPvqIQDuRSBmxwYo3F4Ym6U=;
        b=rhVDfUPeNHh3gb1Ig1634F8JBBCt6kabOnmyx910xYM52wgqPIvJatO2C5qSdl02hC
         LqCczqDpArfxx98grhuJ2kj4qgyHwT+pCyygo6jGPcse6qhYtLsU031OCJDT/28Ug81A
         RBQzNOJRpSfUqdaB4cV888pyjbYzPp6xeJlesMfVrJD8hoCh5vunEkB3LLEiV40GgSAh
         Iosrc/K3+RKMB7S/sEswCkXJYrR4I+MhOcF+Xv1OBCeNqXAR2LzYbd4TmwtVHgg38T1C
         2tVsDf+FIkFzzDSCbytbK3O6kBFTAaTRrzr0R3b7YQUPFRE0Y7zk1HbeIAj3URGrc1n2
         KHYw==
X-Forwarded-Encrypted: i=1; AJvYcCVOJ1AIC/29SVva98aUFqjtqvqX6ME9Znv/DEEogyb9R9wq1G/QrxNjGEU0GyxUw9W+N+GbTlatUEPM0Q8U@vger.kernel.org
X-Gm-Message-State: AOJu0YzGOPMoL62fI6oZVjp+aZSFo6MlfZzHDeP0+jC1/gg92Kl4xhRH
	S00OgbMB72xgYGP6C5uFeoYmdQhEAas8i3/wXgFQpJG8z6fp08hMiVOGzT3fgl/qWeJ7ITwfain
	8linDoZO+EHPKJ3BN2EHrAH2K0x+08U0jolp6tK+FmrEMMw935pY0lA8NuR9gpwSOCIOM
X-Gm-Gg: ASbGnctwghQ++m81cVq19zpDbwKgUMgflOLJPovngjuH8hJUZ2FgDeQFWNDamcBZHqz
	OA14E4i0kgFFii6COaM5w9WkT9nmIEdEyvhAs1+ib4XOJFMRMmqoPJsa4QlxaGGI6pLVr/nQSSd
	6Z8C/S8UNrDmSgAjgIeiAf0rYrneodGibVn3VYPHE45RcJg3uDFXM/jv9+Di4Hk7HMGiZLZxhfL
	AJJjLdPlJu45u8+3v8uZQOrmfIGqWPdIepDMW6dUdOYIBEffSsjfSeQHQ8scWVl0n5TH1y5h43B
	rbBrqtjjHmlXFTX4n35fLF9aDG6QwLdoO/Q2UdTjmpN9P3m8udiMbq4Hf03BGOKMBxEWVqpUXau
	frRq4iN8MIe5zOr6eVP+Cpw==
X-Received: by 2002:ad4:5b8b:0:b0:728:dd23:2e34 with SMTP id 6a1803df08f44-7393e935346mr98937436d6.4.1757493471921;
        Wed, 10 Sep 2025 01:37:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErFxd7DKjim5PFA227aBvfe9SUcXcSw3gbPmvfu53+B5+yp3Nrd8csJWabn4UO+eJIZ+tr1A==
X-Received: by 2002:ad4:5b8b:0:b0:728:dd23:2e34 with SMTP id 6a1803df08f44-7393e935346mr98937376d6.4.1757493471490;
        Wed, 10 Sep 2025 01:37:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c018f660esm2794149a12.38.2025.09.10.01.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:37:51 -0700 (PDT)
Message-ID: <66f67ddc-93c6-4871-acdc-01623468f7d4@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 10:37:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink: Add support for SOCCP remoteproc
 channels
To: Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250902214544.543038-1-anjelique.melendez@oss.qualcomm.com>
 <y3jxi3xmm4lkvgud5keuu4qv7enqfe3z2y76gho6eal32k7cnk@zv2lat4mjqhi>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <y3jxi3xmm4lkvgud5keuu4qv7enqfe3z2y76gho6eal32k7cnk@zv2lat4mjqhi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ijR6rp6RG-nMeBy7DOJUnRPC0OWi0Y6T
X-Proofpoint-GUID: ijR6rp6RG-nMeBy7DOJUnRPC0OWi0Y6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX8WioH7oRbz+R
 7JYRZ2hWQUcSoppz7xFUpCxsITkRWr+KkNL7yXsbJSj2KODuSzecAPsGn30z8JAkTpjrxQDOMO2
 VjXRIHU/OdyHIzaoU7IRcTx5oP5mRVwsHWU2W4eue0/p4qUqHunBxgs1Zrq4i9eObQU/fIxw3Sa
 p03QCzLNLXXI4wuBVvvu2wbO7xwYhN6IkiCxauri7SXjNoUfUA4siPvLxNRUuOZJ9AiKj1Cykxa
 i9NtuU9YksCezLV5LRMZ0QAZgo2GvUPmODNkUWmrb3EyxQkxbC1LomgHRZ2awVwu1WBzzVxpvW0
 yzrBnhSOkDDMIB8ag4fRZOdSAVXYoeAann6L0zySoSAPeCVJSepCMQ/IddG3Oxh86xF7tctKD0D
 AnNH0z8s
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c138e1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=3t3APiGufTZyVCF1T34A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/9/25 5:26 PM, Bjorn Andersson wrote:
> On Tue, Sep 02, 2025 at 02:45:44PM -0700, Anjelique Melendez wrote:
>> Add support for charger FW running on SOCCP by adding the
>> "PMIC_RTR_SOCCP_APPS" channel name to the rpmsg_match list and
>> updating notify_clients logic.
>>
>> SOCCP does not have multiple PDs and hence PDR is not supported. So, if
>> the subsystem comes up/down, rpmsg driver would be probed or removed.
>> Use that for notifiying clients of pmic_glink for PDR events.
> 
> Swap these two paragraphs, so that your commit message starts with a
> problem description and then you talk about the solution to the problem.

It would also make sense to briefly mention what SoCCP is.

Konrad

