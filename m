Return-Path: <linux-arm-msm+bounces-68736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB1CB2248A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B03D189EC02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC5C2EBB92;
	Tue, 12 Aug 2025 10:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEzzw8J5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EFA2E265A
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754994339; cv=none; b=kJJo97U3Qb43xl99qK7TgyCfsxHV206vnf06zWcnQ7e64NsjkNtR8icHiLS8LzzO6X9JNaANYqkhkl1TO5befiWSHOqswfG68ElLa7Hf1bM4Yga5SryoiRyrIcsPY31Lt2YUvXrosoeP1XCT2CwjMvFOVRPYgcmHVf7iEGwcs9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754994339; c=relaxed/simple;
	bh=kPPuaswxwsoGjiS70z4R/GpzZWbmk4tdm1gnkzx6Rx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0MtjyCU7eRWwJ8lUCbx373CkyRtSOz7ri9wPkQ0uPVNv8CRT8ewHVgK52ihxmFlCBAkFMCzw3ao+8oxY38aV3v7d3k9O4iIvaErnNd7wHKj7zvnK08kGw40bceY4ItQytGgJd/hG4kvvv0h9MfOagNDB/SviFsL+xhJEJ+UjlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEzzw8J5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5X9Cs021586
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fl1ygk+1H/NMb3Ro5wivLL15aqHhmZrUJSFbMCh9wRA=; b=CEzzw8J5Btb/DoJM
	414rDABSw/6tYWkIacZ8TQu16IuxooWv1bte9EU4PR8aOemnj6zQYetuMZ5cCaDL
	k/hP1Epet7XDBJcTJE2Me2Q39GRSm7mgiVC5P0zcLJphI8oVshQ2jfW1S4yfOLuO
	FCTozQfT/vdDPBN1hfQR7gwaT+nWZx9k4Zzs5MMZDgdu9dgzz/E1iIb4C5SPO0rA
	riYCber+KvcVqR77U4sL60aTrz/45t9ECIfQYLw7GfErh2Bc/Y3U+aWr9ysCEgtG
	mwpIACE96JFgjqa0mslvRjWZ76aVHHiQng/WpFHfBEGVGNY5A/42Wy7e0m+QZMMd
	08Qgmw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj47r4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:25:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2424aaa9840so58336325ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754994336; x=1755599136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fl1ygk+1H/NMb3Ro5wivLL15aqHhmZrUJSFbMCh9wRA=;
        b=vrPg6jEDd2VjTe2TfIw4Ie+nEaPGDo0fcsvmTUwvbupJE7wIleggxoqEuj8BiijGLm
         SM1cT+38aHhXRj4pyENtWJok2yCNquks9e/l7V9w4qUobffySCz2kFk4YBWUzSwgjHWA
         z5eLncTaVOAAJZisCU4oT1EE3LAQ5y7Y4CUr8ka7KRRGI30z9rlh6jnII6qHX+pVnLIs
         183lTdtfswGGXIKhP4GtGcsqPaPtnvGYxvnbyNvAV8ZSqGcUAZlpx5vBXvvgv6IIJkIY
         jfJvEooG/oJaXWqXyQDoBbOiPdmz0L2SWIR6CLSXQmCSzbB6XJiPYyRTN3vWovcl2WzN
         vhlg==
X-Forwarded-Encrypted: i=1; AJvYcCWF6EuiIfthCCa7u+QagR1IFH+cCP+hjs0NL6qvHpZ+s1+ntg9zxcKUVxBO5NRFVquTAMHVIKtVPBkCsmOD@vger.kernel.org
X-Gm-Message-State: AOJu0YwnkdcDnOaXoiFWhyhaBpo/RTEO7OWoDXbNmEJthc3RHIt2pUvh
	HhZA9b3mvAqIYYs1sF5dYn1txTKBChiZ2GCEvOfDXConJqgeZTSf+gGcGBRPd606oSA6vePXnzp
	1K0MykDgqCBhb//qIV2AQiirs/COIXj3SjaaBCwpGoWn6jWkDth3mT/75Vtt0Nt9KxhQC
X-Gm-Gg: ASbGnctbLAMoqeFkhL3fsLU0RMvpAfvy7PcTXQ0gyoomJ31ughSl2WdJxM3uETosCv0
	6+3elJ9OwIyeCfgMSD0z8iSNFuuRVhipOPaqCmuu3vMDaO3gOJJgr8Rw2Udz2aoI/JN/DYDA4QH
	IkoxfqKdWnzrRdLnzn68JBoxCa9LDS+hSy/3xolDa7GE/0akuO3e5aitpazjUqHk+LaBRr0XwpW
	84SKqoi9ytqjtPepzprPHIIz6z1w9bLidnULdIYkuaiIyEV9ftJ32xsEDPckYKShQygPVZQCAHM
	zxRLYu5McaOSt8tqlYregJacdZlO7P0O6tRMfKxdSmYB/5Tl+R29s2+8vKd6sccg3obSSpbL
X-Received: by 2002:a17:903:2d0:b0:240:8f4:b36e with SMTP id d9443c01a7336-242fc31a558mr50178745ad.34.1754994336500;
        Tue, 12 Aug 2025 03:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhW84RupltOd7oYpjSDnmy/Z1WFZCo3v4UmpgKw/WVJ1C3vhkkf5vDczM3TxczTksqAgL8EQ==
X-Received: by 2002:a17:903:2d0:b0:240:8f4:b36e with SMTP id d9443c01a7336-242fc31a558mr50178275ad.34.1754994336053;
        Tue, 12 Aug 2025 03:25:36 -0700 (PDT)
Received: from [10.217.216.215] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-242ffd9e3besm13858015ad.106.2025.08.12.03.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 03:25:35 -0700 (PDT)
Message-ID: <c783b319-3b88-45b0-8a0c-8c3ba9c462af@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 15:55:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] interconnect: qcom: sa8775p: enable QoS configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
 <20250808140300.14784-3-odelu.kukatla@oss.qualcomm.com>
 <sdp4moiiii5zjz7m7ysds3je4h66biuusilc4fx4bq2j4dw7ur@5d3c6gkk6wb7>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <sdp4moiiii5zjz7m7ysds3je4h66biuusilc4fx4bq2j4dw7ur@5d3c6gkk6wb7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX2CPBAsx3j3oM
 pg4lX+pLUwNgIb5Pxnae6PEq7pyCj3zXByOPK2pb0KWvpd6/lKA+4d3ZPYu3caCxoFC2SrrPMkx
 Q/O/ibogHnu430poE/j1IcVYi9G8xToz2yGnsM3ZTipo00EjSPvSxAEl8/LrJEmIbTyJChAMGsU
 UAzk8oqC/FE3FOamTuLct6wMf91+CYgHp7J4jbp7VIT3QtLjw7zrWI9sLZPCElFWrhHh1Hgv6t2
 60V4DHopKrbHKuKKgaKz3xCdCPtCfhYrDnjkZm9nYv4YEpBSb5i3CHfprPsv1XwojwoeSaC75ag
 a4NC74NdZZdl+5HgIs8sbBN2JTYjqYX6emd01dqPN4Y9LFTv7jfSbf91aMH9fL9lrkNMLUv85Dg
 5B3OA2jK
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689b16a1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=wifMmZQcaQcT46JyXskA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DLdmoYBZZ4b910QgRJOfsxfVgfSr9COM
X-Proofpoint-GUID: DLdmoYBZZ4b910QgRJOfsxfVgfSr9COM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_05,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027



On 8/9/2025 1:05 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 08, 2025 at 07:32:59PM +0530, Odelu Kukatla wrote:
>> Enable QoS configuration for master ports with predefined
>> priority and urgency forwarding.
>>
>> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
>> ---
>>  drivers/interconnect/qcom/sa8775p.c | 439 ++++++++++++++++++++++++++++
>>  1 file changed, 439 insertions(+)
>>
>> diff --git a/drivers/interconnect/qcom/sa8775p.c b/drivers/interconnect/qcom/sa8775p.c
>> index 04b4abbf4487..5bf27dbe818d 100644
>> --- a/drivers/interconnect/qcom/sa8775p.c
>> +++ b/drivers/interconnect/qcom/sa8775p.c
>> @@ -213,6 +213,13 @@ static struct qcom_icc_node qxm_qup3 = {
>>  	.name = "qxm_qup3",
>>  	.channels = 1,
>>  	.buswidth = 8,
>> +	.qosbox = &(const struct qcom_icc_qosbox) {
> 
> Please follow the design on milos / sar2130p / sm8650 and add a separate
> struct instance outside of qcom_icc_node.
> 
> LGTM otherwise
> 
Thanks Dmitry for the review!

We discussed this during patch https://patchwork.kernel.org/project/linux-pm/patch/20240306073016.2163-3-quic_okukatla@quicinc.com/#25749420, 
it was decided to follow embedded structure notation for QoS as per comment for sc7280.>> +		.num_ports = 1,
>> +		.port_offsets = { 0x11000 },
>> +		.prio_fwd_disable = 1,
>> +		.prio = 2,
>> +		.urg_fwd = 0,
>> +	},
>>  	.num_links = 1,
>>  	.link_nodes = (struct qcom_icc_node *[]) { &qns_a1noc_snoc },
>>  };
> 


