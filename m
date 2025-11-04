Return-Path: <linux-arm-msm+bounces-80285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4E4C30D6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 12:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C5D11894A6C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 11:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEBD2EBDE9;
	Tue,  4 Nov 2025 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiXSVv76";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XemmKF3m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945D2E9EA1
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257338; cv=none; b=TYNSx81rvSNxEWgpxBKX6u97RcrkLA47jMX6zj5PQlKFOLQ54L1qgXHxr3dBtvezFn+vnqR8lTU/BaIxPsCicyxaXgyoFFY9knWpfkbR4B7JExiW+9quO69IjqEQBE0xcBZRM+vLloWP/lgPJA8CzAIehc6P6fKksPKQ8DbKMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257338; c=relaxed/simple;
	bh=iQhS3BtA5W1bGYkcBI6SxgmHh1GEQDjx65ORueWdtNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QMfrzTPI27i6MX4+MclindtRjLR+aWrJAyosSuVeJe26SGNlvScY/dNltoAu8vg2Cvh5mL0trEXOBXHDMobblcyiGnZSHxwuxNpSe81PV/eZLH+LcBAX+zpLCm4Brsmh9QhU9dP416RBREwB3MH4wHbXftbYjDYadegODD8C+UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiXSVv76; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XemmKF3m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A49dXUR1659026
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 11:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YaeLh1DzXsP54cr2u9onqg6gMyD8ArAyK01quRXud5c=; b=PiXSVv76Fd0AZMgO
	6iI5IpAY426x3PpNUjRtnDT4esKYo9V+c0yIhkmffkB0ZVb82rOnPow97S4lJYph
	iXCf4avL2A0TBtG4dlXBGGLPh2psl/PshJxQXny5+7J1b3XH49FTK0++oIsvUFOb
	kBcXR1z32sVFaXoOeo3SsEa4Zm3cG1jh67yJmAmZQmucn2gGN4+F6Dt98A+8m0Sc
	CkDiSOSBImtdahF15Xa/l6WHqIODhbjkr1MUiTjXzTFQiM6WzDbfRiY5QGL2ywXO
	PRmgaSAuDO0gLMI/RKzxKEubLY1extWFm3XMlYrtC9FUAMGorq6QpiPIYyMR+sHK
	H9blCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7f250b3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 11:55:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eced2a52ceso19862741cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 03:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762257335; x=1762862135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YaeLh1DzXsP54cr2u9onqg6gMyD8ArAyK01quRXud5c=;
        b=XemmKF3mZqgIKsmgRlvlR0xtUJj7ZdOM+oURCEL/Qn5BNmY/0jgRziAimYJjc1dmue
         ffR4X5PB1QWU5TIOA3RGVAoeCOdM5mfe+1aSLXGMO2l5YbctEs9ZAOSxoJeVZuJNYgu3
         7u0s41/fHqMYpa4i7s9cllynyt2rq/utoRWwUoqNTGI35DSlL2XgOXhGd1eCwF98EOsv
         u9RfHQ8cQedsEYs92hLiybCdKAQ5yw2qK2Tx6RztQj0gEoreIYcBZyfLo765uoJvbtv7
         NAqA3ZN+w/N5obvwAqZHfJ35yTvY9dGRFaKJoYsTC/r31LfI2QLkzCznabuMKf7jNfG9
         y2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257335; x=1762862135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YaeLh1DzXsP54cr2u9onqg6gMyD8ArAyK01quRXud5c=;
        b=K+dNN4+KUQu7qcZig+hYkBXk9MGtayOf/EboLRaDRPoOrCdU8hv0XEvtUe2PfegOYb
         aoPGZjGMCAMWpmlyBL3PtK60YD6Qen57MCMn7EOhy/avXkqYRz9nx2xk65Ra6j86FwY9
         gYfq+mswXEsHAz54cjvjUW9UoIV8ELhzlqyUtsozWuDAmswZsQToi0ly4AVWe+t3lmGP
         8t+6VcA3zS/JvZHmKgjWXtnCz9Liiiighk6KRE9yyTzylUPVOFVfjTes6PNT1b/kfx1P
         CEQCzblRwTZc6PTam4hI1mGIs3/bZIqPKlOE4lP9IyNmuCGPFRKdL0khni/VOIQ3fyYE
         Wg1A==
X-Gm-Message-State: AOJu0YyfwKemawp+MoxatQQzqlbB9SwTz0gOKRUyIkXY4pUS4dgeW3ZF
	8Zz62b0BhozNwH9YRrpt5HVvou7A0GoE9g5b0vep3zqlR9TWWXwfFTXNV1ZsGV4wha/vc7fDB+7
	j89bI1Ko00zJV8iCriDHXexqQ/TyOCtluhln0D9QnkgWf4qS8MXR4e3i4E3ftwmKsAmRq
X-Gm-Gg: ASbGnct+gZ7CqF3VBABZWJyv7TN/70dQ62kT+6RfjqMX+CpWlQovOrWeY4vzxv3PUCw
	5khIWa5Mgl+w8DOZXX1bb/5tE2QDUNfDWcRHCLTUmUgDALi/t9qSDJth7UdEsVYJfkulq66lDAv
	Ns1x+xu5aFPnwI6E+Yonw6QVXs4CoftDsZrs20Zg7MLJ4gL2xHG9nyvH9goic9cnIBBQqNIu9S3
	rTgo2nzQ0iPe55hGqLy/Uw3EyUdJcBhB7nJHgL3FdYpYbHZvJ1oGpV8g8nrT3vI0vIiknIVGf06
	zx5wzapAaSJsmQwVPIUFp6Za7prkMtCbS1yHtOwvsv+BPQqvJB9Fl1OqTBIsdf05uMSNjKM00Ay
	42fnIDZD5bTkBtJFNQLH5pvDDb65GCFE/03WCI0RAFBcMfMnB1yC3Or9y
X-Received: by 2002:a05:622a:1801:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ed30df22bemr147621901cf.4.1762257334711;
        Tue, 04 Nov 2025 03:55:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx6cBsKczwCY8cK6C1lPEdHIYYD9cqw5rldprbbWnmFR1yVcFP9y2M/7m/IksUx6qsKVVJ6g==
X-Received: by 2002:a05:622a:1801:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ed30df22bemr147621821cf.4.1762257334278;
        Tue, 04 Nov 2025 03:55:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f33aesm190274666b.19.2025.11.04.03.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 03:55:33 -0800 (PST)
Message-ID: <e80e3937-3e82-4769-a2cf-26fc5b3ccfa9@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 12:55:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-add-coresight-nodes-for-sc7280-v2-1-c67fa3890c2a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-add-coresight-nodes-for-sc7280-v2-1-c67fa3890c2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dNyrWeZb c=1 sm=1 tr=0 ts=6909e9b7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NbFZ082cz4qFTsEVaK8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: HccK7J5g4B7q9TOlCb_2gnDMMqQ5on9i
X-Proofpoint-ORIG-GUID: HccK7J5g4B7q9TOlCb_2gnDMMqQ5on9i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA5OCBTYWx0ZWRfXyCW96tdT6DU8
 uAn+wEUwHHXGh0mskJJy4w25/jfX00Ej9y6F2M8pB2GZ/sMDlqzxZnL/mtz+9RJ1ooK5D83js8f
 31QCv689RvjDFIg0FTe1bAXIbRxuOUVn9+9dCvsNM5Ydm7NcPM3L+jWPRp9RD4O7oiV2Ja4kxVJ
 U1OhuzvEhkk3kdBmQHEJGXaeyKJn8YLUFP3V//bStEq5F/L18f70bywvVBQ4z+pi/xDhJz+CCDX
 gJPK3M6MhCcuFnECKFQF/GTpE7wWORqyUCWHje6JTS+047NYmv3+Z99qzccdqZfMNrjwnOwSd/1
 Xaklcwh8DRk9jEWsdnKWQuJcAhTU9ak7IYW3iRfVuVPZpHire2a8jql7pMYrLb5YeseHRmFtIAP
 1IB5zWuCSrcuPuqugvt0AmO2ZBD5oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040098

On 11/4/25 6:48 AM, Jie Gan wrote:
> Add TPDM, TPDA, CTI and funnel coresight devices for AOSS and QDSS
> blocks.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

