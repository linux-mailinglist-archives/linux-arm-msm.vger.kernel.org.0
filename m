Return-Path: <linux-arm-msm+bounces-64075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A229AFD233
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 856FA54049D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432992DC34C;
	Tue,  8 Jul 2025 16:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wo5L3PDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD618F9E8
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 16:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992867; cv=none; b=kK8fX7MBl2T2rumK9JCTLSv7Z/7EByrFbCPJJ/TAL0Xlll73t70/ePiVcv5XwvsLy4pmSv4EI9jtSW0S+lt3cWdqhsgKho5h9lk0iiJutbbKyji5BQRrRhzKycF3FeydI1u0H9N76fVGdsiMSGWOJ49BNDnOiCoJnj2V0Hhx40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992867; c=relaxed/simple;
	bh=oUwfhuQJI3rCG3DAr+iSLjbJAl+uDXbsV+D/ZN31zks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJ/F/6L/rSfxp7zb6fxHGS+NF8sKEssRDhw/L/QQ5u7QywpOdtNHIP0hmQQOhxIo+xix0v8Jdd1FMUOJiyhrqn1ZwY2CDaIq1HJpOhzqzc0N+5+zsZm4+jh4/0mhAC4aEwO8rkqCqvg5bFutstCQj4GECqKbQlgdRyReUslpv3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wo5L3PDA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAbUA017098
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 16:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKf7w5qtpfoZKrAvtc6t6RnK95VeeAC8USeqACfTOu4=; b=Wo5L3PDAPgTieNfr
	qjMi8imoAi591T9GRi3Tv2MnsSdFFDe8v2DII0Ca6WfNPfCZ/o56cKKyG1HEr/75
	Yk9TPiE+ZmVmMu3WVRyIiDxZjBk5HHYUEajN4YaFfTX58qGJ2iutnBCIEbKj7ykh
	qEAF5YJUadFBGvaveMYhQ2NkHNLaQQo0jFzkkcxJ4B4iBExzAm8t0gFCWsDpznEz
	h7ckJrIhP/W4EySvyNwuxOimlBlLgTTRdskzPGXJSXt/uOYdpYKkD4Ro8ki0tRWz
	0yX/JdwkSFJOlGx1B7Jx4btfJJwURtMiVLVdxw76Liz/R0kxCH+JTKIAU3WS+qvZ
	+Aaz5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkqhv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 16:41:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0979e6263so28924485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 09:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992863; x=1752597663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKf7w5qtpfoZKrAvtc6t6RnK95VeeAC8USeqACfTOu4=;
        b=N5TV/tsbQ3pURaM3deLJgXMeeofeSMKti0L0swtvx2pkXTsfIfwEy/CjPOwgIoHf2V
         3Kn5+mSPxZa8VYstnxS8utclwLbbRuEkFl/H6qVYn9YrBiMSVbErsDtbeYz56KA/0gKD
         za+VIPgIVmFowvZyjETzqOKbqcig51dGT7VAy7EHQcaZE1iVchDhBSoqk7VvEE+eytMA
         2yA+BpuRJDd2T0oaoEZNwCJAyNlFsNWDxVGSPJnDRPZWS+MizUZzf8TvN3t+vXPcOMBZ
         +Du/QyLIu0tUQJwd5OUS4zcsSs8Wa6BnCJ5yRhu+yt8j++p4OrvC7K1dSxjCdYujtOms
         QdLg==
X-Gm-Message-State: AOJu0YxYZ992v5s3n73zPOuxXDkx2oE70LVlIvhPjc1qZFtM1UxRldxa
	QAlQVq2TjX0IUE1uAtIF6xaU9ms/qjR97cVywidzXnbs0pz6UAmBShH3uackE/n+YT/ZNBb2ZHO
	5XQxD0R1WM8iTwpjh0Z1+jkkzjgC+MrpIwZuy6sPH9RQaC6WEBpJD7NdD5pTlaVjEAaZioHdnh9
	if
X-Gm-Gg: ASbGncv2y1NhgAy5eaUdVEYdKgrnMozl0V56wsPsP9cHqMmwcggg6OdfHj32WjDVA3y
	4tre/kPW4TDRlIe4RG7KJ0DVn0trwnw7FWmeFfBxWp+eejL579wO5pv/+NZTNQRo5UHHFX1KMgt
	SIyfd5kTyOZJ9IoKBnCZEXHnRmPPC01ezMcILagFhe3dPGT2FScj1EVtY0gAYL6YpRQqowfkXdg
	YlfWc5uqaXxQeZYz3MlOYDYOir98Sz/cdztsIxfuhZuG2xlmRLh6htVQXlwg7L4xO/g5nh6kbZP
	/MZu0pA0fZcfVvVGRPfndMs8nNh2cAzQejoNsOs/0RZyx+8hoic8pYW789MkZFzEnYdnsB2fTz8
	8U4E=
X-Received: by 2002:a05:620a:40ca:b0:7d3:cec3:3ff with SMTP id af79cd13be357-7d5dda100eamr831389685a.0.1751992862877;
        Tue, 08 Jul 2025 09:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQxRkEb/Wae9gi4E7WPavVxS7JCL4cmOBv4z6rnMmST8IxGjfLZDNtY9CT/To3psedF6/+Nw==
X-Received: by 2002:a05:620a:40ca:b0:7d3:cec3:3ff with SMTP id af79cd13be357-7d5dda100eamr831387785a.0.1751992862462;
        Tue, 08 Jul 2025 09:41:02 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6640absm7510130a12.12.2025.07.08.09.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 09:41:01 -0700 (PDT)
Message-ID: <c8626ba1-33aa-4fe9-926c-704f0d7910d3@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 18:41:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/28] interconnect: qcom: rpmh: make nodes a
 NULL_terminated array
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
 <20250704-rework-icc-v2-3-875fac996ef5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-rework-icc-v2-3-875fac996ef5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE0MSBTYWx0ZWRfXzQgqvjYp8G85
 cv9J8lkPiOuMrPPLDxUnaTbAlj1PACQSBwfqGZjy9IGUT7rQpUJK01wyQkQKgZ3ZmPyaNDzyaYN
 07PhGi/WunFSHK0c82eqwGIrxI8qbPRZ3BCeBCh0jv58yMiCpmXO6+2j08xgEiyOb84Wnz5y2Ok
 /xLzvO05ebQL+q2rxt+3e0cabHv3L96FFUhZPcMt7NvE3IKKIbmBUqkv+a2SaEF1aZKo00qMOMd
 NXYxk1gdzyWD1HJb7UriC8oZ6fJKjVzER6/N71SwZA2KX9olOF/dYRksc79URSwuXr4og5RW9qz
 2RppqiFGxFuQU8vErKW/qpam28f61raJPOkSpyoSauDZn2P+gaqAMgK82ks6MsqfxbBCVKK4fr1
 YuG5IG50mJG8bPntHSY0Y2PtG0VkDY+K0nEpLiZoU/fP2Dj4fTqUAF281kcr1dupXiazxGI4
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686d4a20 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=NIC3D40qKzNtBD7CQNsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RswNs7h8pWEo7tuol7FpQAjr5JgrMB3c
X-Proofpoint-GUID: RswNs7h8pWEo7tuol7FpQAjr5JgrMB3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=926 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080141

On 7/4/25 6:35 PM, Dmitry Baryshkov wrote:
> Having the .num_nodes as a separate struct field can provoke errors as
> it is easy to omit it or to put an incorrect value into that field. Turn
> .nodes into a NULL-terminated array, removing a need for a separate
> .num_nodes field.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I'm not totally sure.. failing to NULL-terminate is as easy to overlook
as failing to add .num_nodes

At the end of the day, potayto/potato, even the memory footprint doesn't
change.. But if you insist, please make sure that the mass-update didn't
miss anything, so someone in 2 years doesn't decide that actually counting
the items is a better idea instead.

Konrad

