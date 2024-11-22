Return-Path: <linux-arm-msm+bounces-38845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE489D5F6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 14:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6B6228231D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA8D1DF26F;
	Fri, 22 Nov 2024 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPY66MkL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783BA2309B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732280433; cv=none; b=M2RzJmGaKL3H4J/5nEgB0a0EqnRU8Rv/xhZ4l/tJfdalUVUPxhWhEgXc+rVdGNVelI4/jO7oKU9FvRLASYrHsusY9sm5L4lttpQGeYza3rXlhbcw9vARlBlFRSrosDliDS1f1wT/g8ipWf9HcGEKCSVaYk8p7jE5Waj8gx+h5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732280433; c=relaxed/simple;
	bh=OdrJvFkqb6bC+EloR79wkBi1bpd0qviV4hmO6yyAIR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDHdEGhLEKNwpTKxz2ysYg0gXhdDuFhk02ebl2kh76oU3l21xx9SXU+3z94dhg3SmBjZCtUVCiL9cj/JrBH99Cevg9gINSbsFCDW4t0fIPDNtAQp2MAiZ6m3eVymMZBp3bM5oCDXewo/CUoL7kU0EBcGNoxggwauOoSz/+ZCOQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPY66MkL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM2wmS4025025
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 13:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LH+hnBu66kYZie3BVxH3uKx5YB7h/LfFrN1BKJMM4cQ=; b=VPY66MkLr9gAvTTg
	rMiQzo5yOUErjsj+EEtMbw3XPcdGjxyx7OWHtBzfg7N2C3aHoq08VBOF7GuJIiuD
	GOsneK3dPPbRT9tFinqrSopE+9MPytX1V+gPceK7cfL2W7rmMuuENZS2pWtD3Nwr
	4hJeH46Z5Yw1lOF6qdN30FzqQgo8tGzcZfvSJdHl5COVwx3YWLTI0GP3c+ATP23g
	OgaEEmBFWD8Ncrz6efqMXD91L9CWf8XLUdnJjo6/tvn3K5CsHnf8h258lPz3kXid
	NlX0HhoyFxxkZEa3CilkYrHZZEXmOoiyX+ZVsOp6tJewJbkvUMT4dcuY/oIbY9v5
	wSBNPg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43251nkcyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 13:00:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-460903fc1a1so4965891cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 05:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732280429; x=1732885229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LH+hnBu66kYZie3BVxH3uKx5YB7h/LfFrN1BKJMM4cQ=;
        b=cr1UerZXLZWyRKYhtdBXIvQBA80imCx/8L7/jS2xg+ZergxbCWjWnccB3q9CgVTXp7
         8VI3PB1ZNFtWCXwS6Tk02KSI/iMqID090N2wD94nh66TRCv6JtJDpLm0DsWoG7Pw6k5g
         SYc2LH7FC4/rLkhBb3Astb5QUZzrwtJx0hpmi8uE94YNq0vHwfeuAi2zsu9sak/ImCaj
         uXkCr8HmbnRgTLOZpDHmJJ9WyOXUXSVl4ZMopGHSzIlywn+21D8f6S9pUnGxYRAoMj5V
         LWvbzzWO8nQQAU3VYaIletNPleUI/6U7y+MthxCprFo4PaxB8paz6OXmcl/kV4+0HZOf
         GoYQ==
X-Gm-Message-State: AOJu0YwU9r7zWGyv+4F5TOxNALCNOY4PuViUlqtri2+CqqRea3mzMaYc
	8h87+XickOXOLxeAz2kUKnjYTlKdsRc0nYOF09oLHkL1kqGR9aryygqxRmLiD3kmMxh/OstKMrH
	FKhRGJhQa9T0a6dUY2WGxjUVe/X69nVv+pg/5QuL0QCcoVxRsJp8RqSvTHlCz/Rnp
X-Gm-Gg: ASbGnctjBxFkizbXA23oQcWgh88+QIwKSj2S5QwU16aOFjix4v7YKa620Fh8rr4Yooe
	M8Mp/0eotWDJ8PTmY9rvsybJorfndyufhlV6yaL0gHreRZTyYBZeT1WMUXSrmQaoo9GPkBXiI4S
	HXZQEnwTzgkxBcbCkLwuYvjgKBC6nEiVKFykhPTb/z+32CPMLNRteoZNRWoOltf4iVut7Rlgsc6
	sGE5Srxht+Dp+x17YGdAJU3OVwVJCQG2po1QBPGUU+j3PUYHbIEkuNxwQH1Tm93yv1fTkBLXe0X
	LV1RLx9HyfKoIqODF0ofrtLOHVlrQec=
X-Received: by 2002:a05:620a:2684:b0:7b1:4840:d5d0 with SMTP id af79cd13be357-7b5143e3146mr145389485a.0.1732280428633;
        Fri, 22 Nov 2024 05:00:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZagaW1WN7Rqv4pENPxu3N+jG7jSkKgHtojYpFMpucDcbOsPAqZQVCoL0pN6ftBfX85gSRag==
X-Received: by 2002:a05:620a:2684:b0:7b1:4840:d5d0 with SMTP id af79cd13be357-7b5143e3146mr145386885a.0.1732280428147;
        Fri, 22 Nov 2024 05:00:28 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b28f6b3sm98954966b.23.2024.11.22.05.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 05:00:27 -0800 (PST)
Message-ID: <0a9a0566-7c04-488e-a387-bc8aa2d314d8@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 14:00:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display
 Port
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
References: <20241121091401.20584-1-quic_mukhopad@quicinc.com>
 <20241121091401.20584-3-quic_mukhopad@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241121091401.20584-3-quic_mukhopad@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oB9oK_AjprBv70atKwwFLHioFy-3cimX
X-Proofpoint-GUID: oB9oK_AjprBv70atKwwFLHioFy-3cimX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411220110

On 21.11.2024 10:14 AM, Soutrik Mukhopadhyay wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. edp0 and edp1 correspond to the DP controllers of
> mdss0, whereas edp2 and edp3 correspond to the DP controllers of
> mdss1. This change enables only the DP controllers, DPTX0 and DPTX1
> alongside their corresponding PHYs of mdss0, which have been
> validated.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---

[...]

> +&mdss0_dp0_phy {
> +	status = "okay";

Please make status the last property, like in other nodes

Konrad

