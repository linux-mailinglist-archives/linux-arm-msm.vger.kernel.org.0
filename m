Return-Path: <linux-arm-msm+bounces-64081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA2AFD4DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 19:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BA6C3A435F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 17:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984CFBE46;
	Tue,  8 Jul 2025 17:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHzQc6mj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2E52E540C
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751994521; cv=none; b=bRCTigFOizU6KXifVt8V0CQVaWDpgqJ6I8YEuyHMP6MH8S+7HjrnmXTY/UpYet/olNbLOKAI3ISoq7nVIpr0IY39tZtvPbQJggpUa6337JQvBr4+s180GX22GYGs3qtiR7YZLMYTZDXWsRColtO5fPyGcvBl7dHEZVA0sSLpb6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751994521; c=relaxed/simple;
	bh=GHglzFE+Ixz0smICAMlxbuuSv/s54zBE6ok15ILfLDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UprTZKSCwkCnwYdQxSHjXRMpPEUpMqR0xqh4sCosMihPhXXP66o5abfHXmz41oVZ5lCq49pEG69Hwto4nCRNYdmgYpF7FGCtN3comq1XIljVHVRuN57PZw3YtvEn912AxbL0rHGnsdRzYKPEKVWeI33XfFuFLImmMwQzpodwCv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHzQc6mj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAWwK025574
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 17:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEXFn1f7VxEWXKlywCXNbVNhNpXfn1kydvwqsDgBq34=; b=XHzQc6mjJOMn4raw
	kilbJTRZcvdtnowryALQXdGWloE5cDEA3tAd5F3Th/SFXV7ZCOyhvEQWHz7F4vWV
	4XGKr5EGrsiaBu0ZhEUJXDen8SRR9U0KWINBlMe7HBNlDbLJ/A1/9pbZsPVp2OVp
	3iDaFcdFWk0wr0MXHJncwbCoN/jN2bl4tPP+JJDZemuFpt5Ti8zbFIt2VP0qRPTP
	e6zN3lVkpC2WrdPpwBvwrz5dB+oZnCmgZ7i2+bFuPnsxQpFaDFadrXFanPD7JlBg
	BXuGr/h3XdqgPB8KD0d0wU0EtOCTKWXrZ4ZlImHmg4t4T3QQ4Lje1pAOuNApcDTJ
	kb1G5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0wfvnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 17:08:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09a3b806aso42772185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 10:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751994518; x=1752599318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEXFn1f7VxEWXKlywCXNbVNhNpXfn1kydvwqsDgBq34=;
        b=Eewbf3hNnYx05JIy6Fhy4Wu3FqaP0Z4Xlsu6cszj7oTM7q7kjhPxPqHOBUwMFLNCr0
         uLckNSiJhmvQ27L0Z/7CfikmNrlpVj2P/6HQN/aIqYgUpG1X8uUsqkZKCCorMu3Hl5CF
         Z2bdMiQlHX3faqASJwUcg+FqdJcJSZMG+4u9pWBEjlAD/kkU/f6/6s3Gz3vO1Mn7bsCV
         gD6cOkUlozIuL8NzMwIMlZ6jz5qTybIOo4qMXCvjRB0qAavUUFoyMMU8ljfUHP2Vj21/
         3C5v9/xMmAMW+YxlqQNP8I+I8oUb0X6zWch0UFkbvSe0ksRKK3IzW9VBgIDKCxToKcSK
         dM2w==
X-Gm-Message-State: AOJu0Yw8ln97GxEKYV2jNAIFMFTPVQ2I0w/u2/Xyj9RVp0kQn7xw9WIZ
	b/ubmG0FNot8iuXHvfU3qTmtwy66H9T669zlSqTG1aDOqR7cZ4umEZKpYdoV+NR1jInlJ6x5LY9
	Ymx2lI6Oo7XnNcZjjKla/wSl5Osn/8OCeSg02mMLKPilGXqZeJzWU+0ZrKIcQEADf+JFN
X-Gm-Gg: ASbGncvOfJtkvAJQkM+UWpYnVAhuBzU/71cOXywdOyCkWK9ZNIe3OMisBUsGsagpVmT
	i+xOUS2DhstMUDmz4Hw1y7bgtdkMsi7DMVnBOi8BBe9PQ0Ez3yjMq93K0NOv+gMX5uooGaijTJK
	99Nk43k9UNGsndUbgYtbkNDHLx+urrK8C8ZiZVx6hW/QYW/gZfzclbX8PLcinUff6yZjVGCL5Z0
	xq4zQYVDLXcPccwecdBubIgnKZgYOuxmoboW60+mhmueE24jk0bFS1h1vlfIXrQuiFh9xVZrhB/
	c0uGstcXtTFWdXx/yidxSBqSz7CxiCkesCSJWJI5EoTjfeMgmAV4JBE79iDxQbhubXjar5BIMkF
	oR2M=
X-Received: by 2002:a05:620a:440b:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7d5ddc9bdd4mr870218685a.13.1751994518047;
        Tue, 08 Jul 2025 10:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcNZy9pWSVwJg7fRmgzuM3id/0/CdApeVMj/tklF5yeHuIPH6i7ffymVFB2QsY1SEGTt8uiA==
X-Received: by 2002:a05:620a:440b:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7d5ddc9bdd4mr870211885a.13.1751994516343;
        Tue, 08 Jul 2025 10:08:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1c37sm928144366b.35.2025.07.08.10.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 10:08:35 -0700 (PDT)
Message-ID: <e50c332c-eabf-4615-87ac-2d371f8ea640@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 19:08:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/3] arm64: dts: qcom: Add eMMC support for qcs8300
To: Sayali Lokhande <quic_sayalil@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc-owner@vger.kernel.org
References: <20250702085927.10370-1-quic_sayalil@quicinc.com>
 <20250702085927.10370-3-quic_sayalil@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702085927.10370-3-quic_sayalil@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 55vGLU39g69hlu6MEKPc-FCR_UOVWUfO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE0NSBTYWx0ZWRfX9XevwCZ22waA
 gl1FFcE2vsNn2Q5TDHoT2UzumUHyzpHSDSGph8I68aajM5TG582KHzG+QwU2xuBIFrpCXPBaov8
 JjWdBiHNvcK24DjBgzQWk+/FclJRc+P0Jf7qKQOkgG10D+Pfm1NVvxW2M1d92WBRkX/JvwzhYHk
 Bdhh8+S/gRNDjreIULaRXRP6NY/9PKSy6MRQ2YXuKyzhgXON6BDc5FbxAkqm8Smb3a2a5YjEKRc
 qmYz8GMaBNC0MQf69EjOuGTohefxsvW2bQDGWCknjQeM/f5MZszXqqyBnA2CEctjFOUUmYjFT7p
 jyKE9NmA0QVh3GWAWzb2tpZ6CaiL/0T+wIqh6+UIQxJRA1nD+FTRDKH/0IN8pSBQ+wXvpnZXW3w
 kM/P2Z4W1gkXT4xkYQVnYU7XllGPQkgHpzyn2In8brVWxGHPY4Q4Mz0u+Yd+DxxOmRbYKx5v
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686d5097 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=sXtFBv1i6a_ckmA1iBkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 55vGLU39g69hlu6MEKPc-FCR_UOVWUfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080145

On 7/2/25 10:59 AM, Sayali Lokhande wrote:
> Add eMMC support for qcs8300 board.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> ---

[...]

> +			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;

SLAVE_SDC1, see include/dt-bindings/interconnect/qcom,qcs8300-rpmh.h

Konrad

