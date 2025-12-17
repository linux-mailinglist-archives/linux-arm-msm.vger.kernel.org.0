Return-Path: <linux-arm-msm+bounces-85499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D1DCC794D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C81630506BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D64324B09;
	Wed, 17 Dec 2025 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaxEUkm7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKR/TbPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0041D281370
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765973799; cv=none; b=bChfmP8gjw0z2b+bCYmrJhJDvTB3p6Eq75PYcZk9onGBbcAu5ikigdgg4rSiJDBsuXd0ciAZI+yoOa3jENeqrfTTLqXJ7ek/v0f8dOm+YezvCPUyEmidKjfGev+QdsgNe1KpzDWDpSrTh7xUSON0vnzC7NWnJeQJWYUKHTTPVtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765973799; c=relaxed/simple;
	bh=4UUbDKvfJnySqHMPn8srcX5wl+pBd5iFYc+gAGYdNuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsAGBsys4d476UTqzl2M2EfYiro/KXNFrqBFc+Fy9CGa5wjZ01C549IM0RL0oa+/0Ujp0PjooXAZvtp6dx8/FbtFw5C3Li/dsCPtSErUBUwqVUlCgapydrK+7i1xV3982Qg7uezZX/0fOhC2nKMIGMwE492zq6pVUqPI9sD1HPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaxEUkm7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKR/TbPT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCDONq2372745
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4UUbDKvfJnySqHMPn8srcX5wl+pBd5iFYc+gAGYdNuM=; b=NaxEUkm7JpyfreOy
	SGOcK8Qn//pAVifi528kz2lmMbR0aFu+8OkQ0NGNiE+cAK/aS5PgoZ3UCL0ou5BP
	YWBNCUfXdARzNfvCYE6bvlhwUMjxjxT/0tDPLozEzGgeVZkLjjd0/J3Qgb6i+J+e
	eBA8OEgR7eCyjBh6z7M9uV+68zZuaG6reyvcQ13QxFbl+MJ21ADw3XCNe3KycOsh
	Xi/ixuGJYwQBVegd4u5w2pFan5GrJ0N7lk/h+/SlgqCGchtAd8kc9WBB7EmeiQ0p
	ILgDmGlRGoMoMxnlkNKSegCDh7MHS2P/EP7DvSJI406GVNvna9ktka6dem2eEKUt
	WtrTUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g36dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:16:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso16880051cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765973796; x=1766578596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UUbDKvfJnySqHMPn8srcX5wl+pBd5iFYc+gAGYdNuM=;
        b=YKR/TbPT5g+b7qjCASJJXBzC6m7f0L8w9yZCqs6R10NJwe2s4mcV4NTYZb1LhVwqhy
         O4CVEF5ZQTZhVSTu0WAElTv1fd5Y0MxZsI8AIWWQuJwvv9HHRci/9VyEfLrI23nPF/4U
         zqKEbvQ84+ZQk1hVSz9X1UUplKaPSyClm8vtnpyiYCxCe1+zHUmGXnkuakCJ0b2OAR7G
         WakglWcc9UOB1zZoTDnAutGugBqpqBpXsCdOz9Wf/FER8ebzorSaszgirzNq990m0Na8
         SVw4d9x8qi0Z+/ygJTlhoN2k2UvrwyOKWLZLNvwuBdJFkFywAxQlFDfiprB1v/ny+sRe
         SG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973796; x=1766578596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UUbDKvfJnySqHMPn8srcX5wl+pBd5iFYc+gAGYdNuM=;
        b=Mtn0PPscPfD08XzxMCEWFww0400pmKdveoyQx9m1M1rMs8bWyf7pBU52fXu2pg2XPD
         Tsrpd0UXpuOwxQInulQnW5UewAS9knJ+gYPIY/RFcWxQmEQPIrHCz33hFurrhH/53G3t
         JnZ9Vf4qHT4wqhL3myz4jQbbrjYRu5J1GoPZwy/nYZGdIGeDb99m7+TbURCBe9PfMklB
         YpCUhBcFo/fpkL+7TEBaN3O7wbq51XiWnAEWjmbdKutm/GfN4bierqlpR+5IkHh+H5OS
         qN+DuSAq7J9a+ustOi+4sP3yQQDZSpDYIMThRsumGXhXqXbyAwebZba6D+FZocQA7UFR
         vjww==
X-Forwarded-Encrypted: i=1; AJvYcCXrvcMO2Hj2eKn+U+RmEx0+AonRSw7wWnCHFRImnSvWEZ/rswSqE0ZAKdhnXTRZX4wotZPzN6EnxKgFLqt/@vger.kernel.org
X-Gm-Message-State: AOJu0YyOg296zX3t61IUNKGxJKXAVyb2rp1/Vbjkgmo3QBaCTIhjoBDZ
	Lo2p447hUEztfTSbvv+v6H4SsC+FiCaVw9UKxysjdrspScJlr3QDbOeIHMhFAQL2+Ap8td/E1Q8
	rKBgmC4Ko23Owmbcvn1IXOrsECLqtkE48pmXYywD7T6QtrWdYpUuEwwBzek/bUxGzHUt3
X-Gm-Gg: AY/fxX5tP4FLV+VyYZPznSJH/w2QtRoEb5ZPE8JupsdErYxDmg0JsjpkZHGTVTVK7CW
	gb9oOkqEHWmxoxSwGFmm3PAm1Bh3yPeXXHl6s0bkqZe3cMi0Su0XTmrha6lPulFBLj5cIK5Dmko
	i9bZp9hFSUKTquW+mO5s25+WlqusVJ9TTvpIyXUV3qZM/NBV7RbAXNnyGMOC780I1KlN/oL/46J
	AAUewfPz0ifjFhaQqOdBhzRxragyk+if021CtjCnRN39aAMiAp9Bc4Ci1g6PnS1boeHuuVCMBHQ
	OljnVzbU0dNbpAhkZnVU7RUr1V9NniVF65t7rsfEr55LPSGW5HjXvAaeqhf3vnKSQjza94s2hCa
	GMVEk1u+O+I37xRFMZKL+TIQbGcx2IA5aCeT45Frvzq6JeUbz9Zx9t+3bCKUTljcxKg==
X-Received: by 2002:ac8:584a:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f1d05c4201mr187004101cf.7.1765973796320;
        Wed, 17 Dec 2025 04:16:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJN5acTOjObdEbmCvFz2ySx2Z/+Q93C7nsNct5e75/+BD6gdkMs45m+fLOQa4xV8/snhRMbg==
X-Received: by 2002:ac8:584a:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f1d05c4201mr187003851cf.7.1765973795908;
        Wed, 17 Dec 2025 04:16:35 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ebafcsm1954317166b.28.2025.12.17.04.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:16:35 -0800 (PST)
Message-ID: <038ef14e-addb-42db-8b15-b62ddb2c1a07@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:16:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] DT: add bindings for QCC2072 Add DT compatible string
 "qcom,qcc2072-bt" to yaml file.
To: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251217112850.520572-1-vivesahu@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217112850.520572-1-vivesahu@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9B1KvXhQk-fA-fYyA67BVh5lgR6buV-k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NSBTYWx0ZWRfX5UUXaMLP5094
 cJVirWZ3DOPfDHqxTT2vGXRJkUutnmxIJUELDRKwRg0etkr74PrWmXlUHCg8C+5lD8Nur68Y4/E
 mMcGt9Kaw+wNEH7oJYR+vACTyy6JU7LglMYJ7tLSTW3yCGw5vlzg3jhi4377uc1UhL7Unce8jsY
 Hc40b2x2FtXccFO8e7aM9CCdQhjxXADjptH/cPdiFw73jxiFj5hFC5zZwneSU3PUDPsH/G/xD0F
 6frpkK8tJgbviLXr6sItdVRUx9guTEy9PpGnJjezqwxBinFCgWSUhIgELzxnjp04NH2snYhIJ5O
 pgwTquRNpmhlYaqKQGQbxVjkVB7G2BeNTeyUp993eeyKuVe1BghKJIYRm/eSsxq9qTknE9boqjZ
 DKitx+fr2q7fbX9ibDlq6ZWcEzMPSQ==
X-Proofpoint-GUID: 9B1KvXhQk-fA-fYyA67BVh5lgR6buV-k
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=69429f24 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Gh5RWWm45Uqc4OsgibgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170095

On 12/17/25 12:28 PM, Vivek Kumar Sahu wrote:
> Signed-off-by: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
> ---

You made no effort to analyze the contents of the file, or what
a valid contribution would look like.

Please read go/upstream and check out the previous changes to
this file.

Konrad

