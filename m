Return-Path: <linux-arm-msm+bounces-82078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A473BC63DD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9089D4EB54D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D89329C79;
	Mon, 17 Nov 2025 11:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2oTFB0f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgf+S39p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED14329E61
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379372; cv=none; b=o3yz1jfdXQVogKryZ/oHv+UKoOuII37JjP8THkG2drMRLR6Mu2JaLD4Vd7wljUUAJmb7w+1flLclsbtghrhJrhx77N3ouPJiDLn693twD+KSMogMEViJxMLw99P70dgNnw2oweGPADoYQpOLAVDGP8P+UH381LEOcvRBb/B71iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379372; c=relaxed/simple;
	bh=9Hld+524ZoUz3kdvtJtXMTd4zPqtzlV/D+fYSvB1dRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XI3ltuIYCD8pYfszRCFNF6fpwAtq+yBV/03n0ASc8p2muVpDv7OknYqu5L57KqCyz8LPsev2CbLgppjfgRhhsfYN9us4PXZvlek3RndjdRvA0tr2JU/23G2lRJlS4TCkFTdvAIdhgSBcjcguQcTrZml14CQQTB9XRScMpxFH6Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2oTFB0f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgf+S39p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2TlE3916554
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=; b=g2oTFB0fT5nEyzED
	i2IAmyCExbdKmj9KoZo+qB9RcY+dRzCTQPMbRNPhDqK5NkCgCv7Waxm2OiwPRKsk
	xdEu4fvPvOd/qvpBajiFSe9W2iSBAIVaHbpzD62yMalENtjvj9pyDBGpciJ/u1d+
	7syS1qkRZbICOsyPduiTU6eu1/rJ+guESkJmAdbhfAz22/hEj7SlHjTw5+fnxhPj
	cbY+HEleyYBvvwj1ipePsih77izDv47a9Zj3WTvJP95Egih88j54yDZ7bQLMSCdI
	mJ75IMuGXJgLL1eKZ3h+KKJWt32YIDuFiIZ/6gV5s93GaMtoBV6y00HXL5iL44wV
	KVxLZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx82t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:36:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edace8bc76so12062211cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763379369; x=1763984169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=jgf+S39prLQDug80508w95AUO/L+uUMVROTf7n7nLNS5Dn8xTF3w1IlcSMBV9XZwjh
         tHcs/NNvCvHm0K0KHgOrCsKaAzPxXJ91X2XCOTjlXTWRNgv/jVCQxDVuR7jnf3P+e6RV
         ZJpFQSC0fxYQxzzp+8SHk0T3E9k0gufhFnxiZAI+ZSkXM+UnnIonocf0LJH5xcNlRl1U
         HbEqj+lEWmYT2Sk56zmcHBFryFsRt9dsCCyyHg0yu/HnZbzi3CmxN29IlwCfNXbR/XGw
         P6etOJoxrffi+efGkHQDYwkgLkrLWvDpFsSw7bGmtvm1Pq+jdnPjhIecOx5b0alTrnt0
         3OMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379369; x=1763984169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=KTDpwdZyC00kin1wEeDKOto7koMx/guRSo/q2RBwAiBmL/tD+IAwOafBah+LeWCF2j
         QNWsrw0++NISn0V5XYnHIvQYjvXS74mN1rdwpiizWmRQOa+yySZaDn81cKgqzWy8J4TO
         XaOvPygrHWgnzWVAnwsAb7p09WXQe5j7FvDpNHiLT9yS//yG2KrWFVsFhJSkAf1eshe1
         EAj/OtqEVRtAjc1L0UrHvXK931PkDhU6PkEI98BWz9JQKXXNdAvCGofXiyUSxeKVkALi
         nRysCuhraB2n4IFCv0ldPRp6mtyja91SKcVaS+K6o0bZP5ztIFTp/t30722xd6bv43cS
         +Jjg==
X-Gm-Message-State: AOJu0YzelDk/BrcoV/aN9SZN3+oRTTAg/FW538iQJzFc3jAFi4sHqOaT
	4m1mpBTSGjO47UORN/2y3p3Dua/gFqy3qnDGw1tr7NIi+D85tArGqpq63PTrD38tMSTBBjh+Mqi
	EDRmO8om8ndamTrJYfbwnseLUvV2YiQy9iqbqXjeVv/G6FHNL9rqE6GrbXTER0Ws9tgwe
X-Gm-Gg: ASbGnctAjQ3CIBF88jya8rmgnXF3pFQCODBUl0JQEli50akkT21SVF6D9C+J2YY7fuy
	Zxm74EAUNBYGipC6S6nIsJtaIIG915X6J69WCvuPpuDSIi2aHEPbAaqBDOCpbuhnWEWGQklp15C
	KXy6YEzp1GdjwM1hSobfctZiv5X9oYtI6iKG+9qYfMptPrg/zBRCJzmEIh43J8dCoByQRGGEfpb
	von5iBZ14pO3VE8AV+D0KvqEYezNN5zieYHaLAodgL81Bjk8ETT6+Lh7hJ4lDm7t4vZp78B4PIm
	7Vt+m9YYQWRyawxOcXTBP9DXMHXkrqxPLu0zTz1Dixln/2GDQ9ftZfa+2TM1fMQG8eNYJ/csmIE
	JnhzXxgdcL7HpBD9A17PCL0DoKPsp7cinMzAq3Mflps1dkBt3g6t2KVW0
X-Received: by 2002:a05:622a:1a0b:b0:4ed:dafd:e98 with SMTP id d75a77b69052e-4edf372c172mr106906831cf.12.1763379368999;
        Mon, 17 Nov 2025 03:36:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJDf3ANHxWw70vwBLGSufDfawW1JN/MCaYkPXltRQiExR00IRNoLR9I/ajFQ0O+1J6C+BCCQ==
X-Received: by 2002:a05:622a:1a0b:b0:4ed:dafd:e98 with SMTP id d75a77b69052e-4edf372c172mr106906651cf.12.1763379368607;
        Mon, 17 Nov 2025 03:36:08 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm1051942466b.70.2025.11.17.03.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:36:08 -0800 (PST)
Message-ID: <fee040b2-0bc5-4ebc-90c0-4494e47d3675@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:36:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] soc: qcom: pd-mapper: Use __cleanup() for
 device_node pointers
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-3-5f107071d171@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-3-5f107071d171@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GkEEJ-MWZTLsWntn-AjRMFWT6IEuCukh
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b08a9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=00rvZbY-6gurv9TMER0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: GkEEJ-MWZTLsWntn-AjRMFWT6IEuCukh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5OCBTYWx0ZWRfX5bqT/p2am8nY
 oFAxfr38JLXtH1PnQHOClz7s9h8uouoen2lcFa2BXAdoj4HY+KKeFr3xnRrVX4Qm2mBeD7FDwa4
 bDFfvDPM8rEnP+8XUJmLfcXML29V4nDrAqRQo5m4EdU7gLS6LvUbB3eVIzv1Xh86zoFT66tYiL0
 kl+s3R+wTLL0mmF8U8LH/6JDCfsiasq+pPCHxeyjGm9cMSTnppckwo02thGQ5ykm2j/ldRXC49Y
 5Xb4kgD56QpF1/+75kAbvIvAwCQVS82Cmkz8EHglGW+BXLEOEF5BiMQmM98tqFr+NJ8L3VVM+a2
 B734Jc6NYEUJWC4Vmr0dcIa9nY+qWSVzx/KDboqw73MpuIfajBZWsL6G9eJTXsWTiwDceQM1d/Q
 Z5HVriKUcjmMPBT1zDuTezuCpX+/8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170098

On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
> Apply the __cleanup() attribute to device_node pointers to simplify
> resource management and remove explicit of_node_put() calls.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

