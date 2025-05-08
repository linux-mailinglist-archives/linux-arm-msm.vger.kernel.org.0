Return-Path: <linux-arm-msm+bounces-57258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E680AAFB6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 001724E62D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 13:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D7E227B88;
	Thu,  8 May 2025 13:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CfECkK+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C4E2045B1
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711210; cv=none; b=K/blNDY1K82yHb6gsqxFzkVRcuUhqPk31Ha/hvgYX2JoKoBs/zl4KfjrgMgs7jstG17ySCwH3Wcnq2BOhQH6Caj35WLfjL/XIVYTdL9tddOcijiUCVnrpB52XOay5IMs/o3+sc1drP7PM8msM8vWHNA/fykE30Bwe3NZzwGKkNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711210; c=relaxed/simple;
	bh=kHY2L9AAUzXeokRXvu9nu/P9V3hBGYDfgVExgxaVQq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUsJq6Ll+0E9EoRpYRbdJ/Xw+VsK93QgJwdFqcf2j05oNnENJxRhWxTDHRxpF9rXLMclpmSrFoQKVkBO3Q0qe0ba++4ASJ40Osh82BaVnMDF2IpVeusP5X/ZvVNaa2MH+UDfxplqgzD/dG3D9e4nL20voqKjn/KpsE8VIgiD0AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfECkK+B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D7QSB014411
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 13:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMYfNUnuS89Wpo1r8C5mbTS3ohz5/xv+vUvBIEOJELk=; b=CfECkK+BZyHZQ8Ad
	DVbqKsJ7rmilEVrJucabreteJTYoeIW1wtLY6UaXsZdQLIaOYBd2dNQ/3pdvNZQV
	IASApCjasMyqnSp4rCU9aHAnmE3O0+AJTfjl9OsAd5Gj4xEDaFEkPkqWxR3ySHZa
	qN31EoxlRtkt+HhfOszKb/KXyrhxEuDKcvMOpjQrOta9GSoygZzbq+K+2+21M70J
	K1B6ICTJpS6X8XRQ6NTrSQJ4Iyg4ZP3jAlBmLX/9LcSDAP69+JGJjJUpQNe2EWkI
	YituhxSnk/+iE38BImbdrWKMSFd2qD9Xad8BJgbEp07AoZkVZCXzmSIRiLGeiLI/
	Fj4WWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4hfp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:33:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5841ae28eso22897685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 06:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711207; x=1747316007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMYfNUnuS89Wpo1r8C5mbTS3ohz5/xv+vUvBIEOJELk=;
        b=jrfyg92SQnSzLxmG4/DrtbAeIG7YOAZqNz6WQ+svjBkefM04efPdTmhxMj6jy3LVOs
         1zmfaMzuHcDwdMqzq7hroDe8IqFUOQlAfbk5m4yuXfu/i2yo2pPiKElYlatuy7Pi8G1t
         hYk+lAxlVccaxbLqvhGemquyhgP0cPnGBaHf4ZTNUGyzwvnGSGF0ad2hhhFOJZ0gbN1i
         le9G+/R4Jd+Ql9j1vtXCrpjwpTIwiYxsm+slHY1fGGUEs9GJHMQ9FTm/gcpNQ4Y/HweG
         XLeq3O75VUsYVoNU4ndGOQWc+H5a49MNvn2/UzAtC9ylY+99GwH2wNibGunN+xU8fGiW
         JBQA==
X-Gm-Message-State: AOJu0YwHVS/NZYUWwQmiDhfb3rlM1NJ/hGPpUpZHtFlDs50OA9txE8Q2
	6vTKDGusxQM+nuWgdaSGu5Gpv0KmSQRvIk5eiJMWNQVxV1f4kYJputZX2IjotJI+WOMJaZxjRYg
	zoW+iAqt7UeqpV0sO4italfrFcRnHOD5paZ2qGjOX3U6P9J6R54/nCgCQ28ad0zVc
X-Gm-Gg: ASbGnct3VE5YFjPS1EDSBXP3VU3/n+GRMR+4OmuQnA0d26rEsZeEzRPV7gN62c5RHsY
	zNMpVTp8YnxWG500gAq/zOQHEHHvzHs2sa3dQF8dWS18y41LNvjJJkTNQdKKm9/kk/Xp+2jjO2v
	YvMjpi31BP2Kan2gdSoSEEN2yqxaVU/0dQD31xSrxcX59wz7K3ULtR7oImFMgfi23RQHYx6t1Mv
	iZlokBDIg0Z6q8ZuCYUhfRa4ZsyzL9fQZdaN6wcUUD4MIUO/YNRdO9qQODM8ewJfQNlyDyDWvmy
	B6UhARNdOc+kjHZUGgpg0/tLgzuO/KagxLInwe+1TmnXqGWb1awFkDFDsSG4iRm3acw=
X-Received: by 2002:a05:620a:2a14:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7caf74220dbmr329259485a.15.1746711206755;
        Thu, 08 May 2025 06:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6s2Ys7CGrDpjUFZ6mMJVSeDH0rUEreHUG859D2NeWarnKpmclxkN93uV3z/V0eMXoKSJDtg==
X-Received: by 2002:a05:620a:2a14:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7caf74220dbmr329258085a.15.1746711206337;
        Thu, 08 May 2025 06:33:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950857fsm1081323966b.125.2025.05.08.06.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:33:24 -0700 (PDT)
Message-ID: <370da6b0-f6ac-4a9c-ac9f-f1adc890fc68@oss.qualcomm.com>
Date: Thu, 8 May 2025 15:33:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs8300: add the pcie smmu node
To: Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
References: <20250508-qcs8300-pcie-smmu-v3-1-c6b4453b0b22@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250508-qcs8300-pcie-smmu-v3-1-c6b4453b0b22@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: swgJdPCkhxRCYoUZ70ShuM2ocvas731p
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681cb2a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=kZKVpPXic2WTofaLpVUA:9 a=QEXdDO2ut3YA:10 a=IkyAniIzxkYA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExNCBTYWx0ZWRfX6NE+fkn/CAKT
 pImVL7dL8RqNmkLchsjj6anrbLWzBRoOK6/XXyS9tH0hVVWnscAHsUJVLIplQslVbbyh6OJqKMJ
 hmMaCFbK9NaUoDCXHEYVAM/D0y3/H/g6rn4y1X1UUbKf/5JQlImYjhZEtMv4GmjdcWbhYKyxqMk
 ZVMf8xbtdkPPh8aAKFnESLD6K5VACjFoIwM6IKBt2rshjSmOXsEgMi6/WVA7QGh0Z7VnzXgCbUI
 kD1sRIj/YwJ8W9PaV9FoirHAhNDO7fNJ2JTweUlH+rlf0a7nkbx5w4G+pwHB88oSPm5rrrMbLmm
 4hNNdM4BkS1ugfqRmquBelVLTKuhbxVQLioyi21iXgob9EPUazux6eHDWz+iEALT0L91dqSlIlO
 4DdPwJrgu6HOhH2k4DSVSo8Ejk+Y4xGJgB+e6tMeIx7rQNZxTCOokvucDKQ83DSjlANlEQMY
X-Proofpoint-ORIG-GUID: swgJdPCkhxRCYoUZ70ShuM2ocvas731p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=767
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080114

On 5/8/25 8:21 AM, Pratyush Brahma wrote:
> Add the PCIe SMMU node to enable address translations
> for pcie.
> 
> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

