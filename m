Return-Path: <linux-arm-msm+bounces-43131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC569FAE1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 13:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B0FE1880678
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 12:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F317F1A8F6E;
	Mon, 23 Dec 2024 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4ukVUVM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668DC192B60
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 12:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734955746; cv=none; b=ooN3iTDxGnD+tEFmS13AeGn6Tk9VAWgfsP2c61MtO4B+4vddQJGirchjsI6l3AmAOuQJiP5kYTNqJEv8nI0xGYDVFN/lwTti/2CwyQKC5pm5O451qg7JrPO6hLeUGH0zqca+VSsN2qI1olmnIp8nnlSWWCpO5XnzKyMc1LM/nXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734955746; c=relaxed/simple;
	bh=PWuxP0waSQYUPxwhiiAvg16IX/P1n90ONOkhHSXMCoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUPxjC0y6CI9ZBRBXGTct3GAK5jKlRLu3mS8WN7Fe54GSwAOqaxOcebRAlHvf5MEFpTmDjzU6dp4v4R6WLodIkd/Lp++VgqxGtgcu3AWALhy9a5AWqrxvunCvG6OSLP3ko6kuBsfSBgpDNHy0+HbZkcIV3qGWcMvONuK1r8iSak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4ukVUVM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBVekP006897
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 12:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIqQZWLugXMrbtd+Pv4u/UkQJRgRYN19wBd0if9gpuc=; b=P4ukVUVM4rjhxZ6t
	QV3r6behOX15JyCas3OnGOialfA9YaLDljXH2JcB2Sgx/mp5fd23itH5NeFnF9bA
	4K0AiX98izx5gA3X/c5BL6NcJxQ+NMX+QexH7mk+TrOOGb+iAOOobS46aezAgNhw
	dXY1VxmiUwzKmP6lHMQNdQpn80XCYjwJOF4aEFy143nLJ6oHCx8CKi82V/6IwNCS
	8EQu55doEHTXiQ/Aj7jfIYR91U3ClGTHp0xREbDg0RBQbdJR0qmCcfvp8/vwHQVw
	+Nw+/xvo0laYxScT223yOy1HivHNx5Qy2TklDupzh8P6BhgqK7UbdqGoOQRC/t4o
	oH+6Lg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q72n82pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 12:09:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467a0d7fb9fso11935721cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 04:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734955743; x=1735560543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIqQZWLugXMrbtd+Pv4u/UkQJRgRYN19wBd0if9gpuc=;
        b=XcxZlBwMrrUU2fXRdkeH55uElKn4CGZ7lUn0fWo8xO/r9SkVV873j7voWRnTc/2sXp
         p842DBlkT0Rbz2Wjp0lx3mjcTmrNHdvqOS7FO/BkSpLxLm5kC8jRf7ki6eycxvcwCC0i
         wGTsBB6W65hoJzHW08JmX0Dglp6lPb20K4Pbt/pQB0S474lEVesxeTQkeW2ZkAldgQuY
         2i8Ur0b3pcxgD0cbAFz/IheT4HyymnfNIqIv1dfcAZDczaHdRyPcWv0aztXnxx9o8YJ5
         m9GxgqpLt6cUZFXQB3MBJSuBhkbjb+TiBc4XKIiHppMn4i8GDF2Lr7rs9WUO3kEjpkJ1
         u8eQ==
X-Gm-Message-State: AOJu0YwfFeOlOty1BzibzZWamWsUU1WjJjKDOv3wSPEHk8e++1FTgy0F
	nNDkKZFj/P+9g4AG5P2Dxwh6t6dI9gQcArbp3SRvDpdBrnVH8xgtn2k0MudJGKY3b2FQ5iWLM3U
	F+4NHRP55bHNjENvIeHLk78SugTZEOabX96jOp90tPi5uX6n5T31qYZ5uxzrDGCQG
X-Gm-Gg: ASbGncvheN7U0hLmZm099iy38WWd4eUN/Ulp61eplr94hfifBsgzF3RBqEG7/hEKnZo
	9euLnrZb9bBfabr1Yfbw2LjkjQCu2NnIPnBK7cSwaXooPEvXRx+eodP4yr+O6AztWXazOSlHatM
	p+V/XggB5i6pxsdPaKAJVfmkIL76f+2StgR+QVKuARoIxlxSdyJx2nxr0eUJDyStwANw3d57A9e
	2EnEcstmY/dVs24aKDS1zy+YS8zlic79PI+jtJ2NEC6neIStyXuaeoy/1dk9VzT9V2OXt0dGeFD
	WfhoDT7hOTTIuCyB62YFcZZtvslGQhdd84Y=
X-Received: by 2002:a05:622a:449:b0:467:79fc:b009 with SMTP id d75a77b69052e-46a4a9709c3mr72961511cf.11.1734955743449;
        Mon, 23 Dec 2024 04:09:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKxC+1tQNCBB99OwH/BNWtDZdrZOkZJjM7RnPRfHbzGHUdI6Li6KnV1PY3BSEGZakTMhxcEw==
X-Received: by 2002:a05:622a:449:b0:467:79fc:b009 with SMTP id d75a77b69052e-46a4a9709c3mr72961371cf.11.1734955743095;
        Mon, 23 Dec 2024 04:09:03 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed752sm5028772a12.54.2024.12.23.04.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 04:09:02 -0800 (PST)
Message-ID: <e6b3e570-81ff-459c-8a5f-55014d22c6d8@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 13:09:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs8300: Add coresight nodes
To: Jie Gan <quic_jiegan@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241219024208.3462358-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241219024208.3462358-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u2bFcM5hMmQkvVkxYLTof_hYcflKmBGj
X-Proofpoint-GUID: u2bFcM5hMmQkvVkxYLTof_hYcflKmBGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=896 spamscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230109

On 19.12.2024 3:42 AM, Jie Gan wrote:
> Add following coresight components for QCS8300 platform.
> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
> TPDM, TPDA and TMC ETF.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---

So I took a look at a bunch of reg values in this patch and the
computer tells me they're bound to names similar to the compatible
strings (good).

This patch is unreviewably long, but at the same time it's made of
very repetitive bits. I'm trusting you that you tested out all of
these coresight components.

I scrolled through a chunk of this, and syntactically it looks good,
Rob's bot doesn't seem to complain either, so FWIW:

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

