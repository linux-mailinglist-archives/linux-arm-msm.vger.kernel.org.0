Return-Path: <linux-arm-msm+bounces-75296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37200BA370D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F21D1C229FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D622F533F;
	Fri, 26 Sep 2025 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zu8WUCUc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D3C2F5316
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885025; cv=none; b=kX2Wn1PHiB1I5LiTot9JXPTqX8hab/CkW/487bvZAL6HI4gDtzuf8437mrjrja1K2kmlTqtAjt5sDmntiUl/mpL+7MqqBuWSvBZijpaaRnej3dD9jE0x/Az+aV9dIwxmsmddLjOHdNCSWDD0fWM5qYADJbTgjhGHYw9tagX9osk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885025; c=relaxed/simple;
	bh=I4xoHL80G2ZfDuKa9HnNaBQgT5lrhctN5hpb7qk6ZIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOMXu8sel5iw2GbtRoibafVKg0Vwt58r9ctMaX+7EorpIgw66t3bBmRLpdQu0J6ltnq9HgnX02Siu2dBjLL8Oo/6IDp06hOLiWnaiYzhE0KOrAmrM6/hYcZ/JO5HanNcKMkvQJjUG7XQs7d5H9hSqXMs7RYp2amei5jbpwxA6uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zu8WUCUc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vYAs002603
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1ONDLRaCsNVpsb5LinjVBIw5qd7QNwulTLtR4csJkU=; b=Zu8WUCUcomq5CxTf
	Sv5MJsUmyuHqJhrnCxb4a1iqle1qCSh8eETGShuNFdPAemlTSL/xpDATRjwDZJMn
	SBJvy9BlMuxtdc4mqin81Zl6rKQKL4mt1nP5s2MjCgjtZNd+9ivaj5j52d04Ld9j
	flPxRZmBSrBWEGc5DGa2wCAz5wYHtA2DtaLPYkDdc9J5vzZ3l1VV6sSXzPJzNDX4
	gVHVqRng6xL2/RcEpXhOB8N5H1AtknAjbbjWKZBPMpdmyvwrcBBEkh7C+YOBwbCB
	oleBg6h4LEB6sVqon1QxuJl3yRFNTbzWZ2aODQXb3x+0Cj93gVVz5y670sxaQoYk
	dDi9Tg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u2kvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:10:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-82b15c1dca8so79526785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758885022; x=1759489822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1ONDLRaCsNVpsb5LinjVBIw5qd7QNwulTLtR4csJkU=;
        b=dklqEtfHPNQe3ZMOpwk4qvFhnBtHz9tGEXk2QISnw4ysnLreW/7/R+cFIZyoDBDkKj
         N4h8uT8fuvtODuAHGnII/tuV5h3CjtNdtS+wx8xmhNdSLs+NrNslMssPU9jT7HlxB8ZX
         27mO0Xwb/RIeuHybWo4HHOHmBf1CS2WftlScg48UBgxkNkLkzSyn9jKCkRXFE7jQVW4j
         axjPt1U/ytAA9CYoULKgVaIjhp5WzcfZ51Y1qpsYxhpfVy8uC7HaR32oZmuSo0BnstJ7
         1HCxTdNO28RhbpQ4HqGutfIdCyI6VlsnDlNdj6WrOx2VWhxKDi1wLLmVBCZ4qIMD3t3p
         yJBA==
X-Gm-Message-State: AOJu0YyI/zoRu9qDKMVV/1PkhXQX3mefUO/xnRlaxDiPNUbio3ei0fy1
	TmRXrR8N4EtAFMfF2Rf67YBxxO6CqnLGxYg+7AHYkSVVKm0Idp3JEVsRrKe7bIQaXtE9EaMVHVl
	8IGndA2LUFDf9K7tujfRuLfi7VtnZROGF27V+jv3zaGllCgBXN62x9eDdiYNiXFRZfh0o
X-Gm-Gg: ASbGncu2HlE2/d+BlcD2YvEfxqlDW4XDz3xoDlXYaykdj9uhNZ1aOjF1BPVqhuMNusW
	hFVF/tQriyxW+0malzKuBklkg6crtJL7AckQG3mbnr9uf/cZifqhIi4YZtj/sUMrc78c07T1+m+
	9m1X05+lJ7LixTsaNKayJyYsSMV3C2EZ7kVReIOedCPyPTZzs/xTIrMOtjKV79TWJIQZ0mwOgrF
	4HIgTymPgJm6uY8JpfJnue3AIMmf8yE3C5dMQDUOf5EooAhFBoqYU6ObvaG2PsJPMjg2rRuAwwA
	BUj0W21cyqH4b+H1Mn4u7p4W1k3rgZtsT6h+oc7TUH1jmJu9xADSroDzQUA+J259ig+qjRrrKJ+
	S20Dpn/IXr/ZwWDVSLfYyGg==
X-Received: by 2002:a05:620a:2551:b0:851:b083:37e9 with SMTP id af79cd13be357-85ae26a5aa4mr562267685a.7.1758885022123;
        Fri, 26 Sep 2025 04:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY4lzzL1WbSfFL3ieBfzZg7Jg97ceiWs/EAECWXTQao7o74NExuOjRcd/rgLZnQ9meP4ZhEA==
X-Received: by 2002:a05:620a:2551:b0:851:b083:37e9 with SMTP id af79cd13be357-85ae26a5aa4mr562265285a.7.1758885021683;
        Fri, 26 Sep 2025 04:10:21 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98de2sm345622166b.96.2025.09.26.04.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:10:21 -0700 (PDT)
Message-ID: <f0f1e386-3860-46fc-bc5e-5a74e2175b7a@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:10:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <20250926073421.17408-3-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926073421.17408-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IHp8FSdxSFnYwh0P5M9aqyVANTN_Talz
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d6749f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pxQL0frbaL4a0zJdC2sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX725A8AIeaYaj
 +iHckXj/cbXUBwYijXBc+zbvQySs5CYxITth8JagIVznTi1hkWEqaMosplBHyO0O78uJmm4fZpy
 mNOrHzR4z+F/YCyV86LNVetRGnxcQqNa86hAEkwv0nuuryBNv8N2Ruk9yh+EwcR5RZVpwDdoQNt
 7cjJM4b3myUmdPVkaW/OWqYgb6g6I6KEhuDMDzMCieFAtNjCdSDk5r0uI0q7Z9LAko8jCOYfTxI
 In7tPGHgXL4jUWZAI1wq0krPTnMno5nLuB4H+QpALTSvT9/eoTYYtwpAwmCj8eRlf7GjDfApTNj
 +DBpOT7nS25Oe7N/VURZUmqs+trvlKJTUyyQrjqk2Mz/wTmfj/YVTGepFmDHA3G8TCgbz+7E9Lw
 1ERals15+DpBSOC0fDkFHXuW4swnaQ==
X-Proofpoint-ORIG-GUID: IHp8FSdxSFnYwh0P5M9aqyVANTN_Talz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/26/25 9:34 AM, Loic Poulain wrote:
> The PM8008 device is a dedicated camera PMIC integrating all the necessary
> camera power management features.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

