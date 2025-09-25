Return-Path: <linux-arm-msm+bounces-75019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA987B9E259
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF2471B28327
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9002278E7B;
	Thu, 25 Sep 2025 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7IzIFfg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3350A277C8F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790583; cv=none; b=bP6dxBZc5ZtneGpO6vPDVApgoDRhsPwEzXezCZ7K4kr26MtJs+n7lPO8EONP8BTRrvqzrtBHNcE5yqIPiCdFXsLvcj32wHIvo7UTTkQ5zUZVXhhLGBLDYPoIwSiZWqSW1e2pQKNK1BHKQ4LbRgjFN3h6pZCXsuz3AWmffUhTsaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790583; c=relaxed/simple;
	bh=mfBuiVc1jTrNnBpkc5m0CUezfJaYbkMF3CihobTqPNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GF8H/om6l9n4GRGyN4aqhf/Isp5IV4kPxk5OcfUfbWKshGaqI0yq/G3flRoyQzrZRnzSDJQ3wyVAxZIouXVTyU1GmhcIYZJhCetEQWODF31ZP9M6wvOPFPjViKZeSg3igzZ4opg2z5M+mQtHkMh71G1j4RAQqQJ5uq24BUztIRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7IzIFfg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4bJF7029400
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MyjBhb2r/gU69fmaCmZ9Ifgn+LhunjwusqmSUhFSlqQ=; b=H7IzIFfgCOJyK1b7
	3oIvxiWtBbOozTBiscC8shuYKwGgMy06PMjokEx58soMCQv4XlpK84L+atmXamPb
	yRbal4CIQL8zhDX7vG53lyD0KRTWGGEcRENGP4lqjek/+DUPNiyenRlze9kRfjhX
	FqB7mEH0acP3v6CLFYNFmqLD7jRlvUYiTxEDqu5us7DSd2JwvhhYtxfSHlR3ZeIf
	Y1Y/0kE5z+8vWWnRSsQs4WS/Cl339iOqEd6MZ8cqFq0CrCkJWBRfOzLtH3QZEXPT
	HNwycXhCrtwp0xX9i0XlOVPR88gmE8OVWNRBoz/uUYEElC1broCTnjj7/n8YXg1k
	sAKtmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup0nvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:56:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4cb12718bf7so1589191cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790580; x=1759395380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MyjBhb2r/gU69fmaCmZ9Ifgn+LhunjwusqmSUhFSlqQ=;
        b=NLMmqO3cLn2KcNd5rhzgYROcWo7XTSIHG8eHAnTohZTFq0ZcBbYuK0WMNsMDSewmnh
         6nFOhc3HOMoJ9usrVYyjZcE6KHEd2NZ9lc2tfJ3RDtzi1pF5lxpnoSzJ1m9DydlJpzQ1
         aTpGcnzDGBLp9ajjNLphd+G2IMuBe9hyfNl8vNeQqqgYdmZFMwWA41dxEMURPl8JuNdJ
         czFHOWL6M9FTgd7hzxd5GDxn7DNAnqBzc1Wn6M/t+3CRESH25COfps54IOwp944lk7Ob
         m4NFzf7VjGPQzGkQEkyKhvjRmJUOPY3PlZoMbljX0+CwCxurweD3sVyJPSfwG4KITuB7
         +9SA==
X-Forwarded-Encrypted: i=1; AJvYcCWv/so+A5XeDLY/FOkT7st2jvby0oFPT3VBmEbPy83qugoviU4H6Bbrz4nvKKXLvSbKWjXxCtIYaxUaLotk@vger.kernel.org
X-Gm-Message-State: AOJu0YznIaecsdlQhmg2ILGoYURyYeQcjc7gRZWX2XGzt3Hy/3ApZP0h
	0gVtBR6iBzbyCAZfkW8EvtQq6ZE1O6kAh913MzMkAbQnbKDkR8z0/B8NAnl9Fi5LW6hb+KwS0VA
	nM/KoJjqflbrKdINKB3rbl+iHMeDXH4At5kGJWDMToiKl6XpaayZ7YRRyLXX2iOG0Jh56
X-Gm-Gg: ASbGncvhCM3qXILbpmh+CKMuyvv3xR0R446zKEP8yAfSfNOyuzfkb5LN7ObfB8MrSgO
	TNMPRKt7K/7nxeJz1kuTbCJzVlysEs4xMhWWz4bTFmU+V5Aoh/ecEkVwELTTmaKi9FLA25PB0m6
	hpYnqnw+xMU87SA/sugVZDkyFeYKCbZS5dryAOWipVbw0jYOz5uaguVGOBQhKDWH/QdJJwP0u39
	eP7RbrF60N27USPH8+9eKILcK2l75K+MKJrTK1t4InNPKD/SePQhoCFHJvCoh0ZzMcXAomi00RQ
	iHdkGT7WBButNyVDKbqV0+iiNmUsTBZjKs8jDwkRchC4ajZoddZMi4qKdjOo0PnSa5KEXGMFdrH
	59H/pEqJMnak6WjHwdtFSvQ==
X-Received: by 2002:a05:620a:2946:b0:827:d72a:7b45 with SMTP id af79cd13be357-85aeba1f4b1mr214525885a.12.1758790579977;
        Thu, 25 Sep 2025 01:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvIE5OPFID+YJREvS0boNYXOcv2oaoxwC5+Hv9MQUwY7sobh6xykrZTLcHUGRL/Jq8V+GX/A==
X-Received: by 2002:a05:620a:2946:b0:827:d72a:7b45 with SMTP id af79cd13be357-85aeba1f4b1mr214522685a.12.1758790579433;
        Thu, 25 Sep 2025 01:56:19 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3539347676sm127658066b.0.2025.09.25.01.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:56:18 -0700 (PDT)
Message-ID: <c85c00b4-cd73-4672-8a9d-8c97aa0094d2@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 10:56:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] dt-bindings: leds: Add bindings for Kaanapali PMIC
 peripherals
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
 <e06694ec-41a9-4d31-9fd7-8f24f6aa17ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e06694ec-41a9-4d31-9fd7-8f24f6aa17ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d503b5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=cUfx7Bp6FHvb-ErLiqwA:9
 a=QEXdDO2ut3YA:10 a=UzISIztuOb4A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX+Inx6PBgZ0Wr
 3e1Pk2rHMznkFbf2Ktize22D3LOhZdCjqeN3cg3xxOpfBmerQ4y7ObGaP8VpjlNMFKebVm543kF
 cEJvuexdbEeAeBNTSIyGSox40cX/u3XuJ5iqh/ESnyXWi0/c7C2ioYBCyQ2U/wIanBSqmK4btBz
 n3ksRqZaCgjDx9F7IJF8vT/byfVKsK4EdTwXLhr9RYnAQAwHHaG/nsWiM7w4MGGjPsSBvFuZ8Lo
 3sG/A2I6mqkkHdWSxEHcZZMzxGGkVFkLp4hhoQhcdRgcULudDydaar4ZRgvwVOR5ohXmtVhbLlK
 Yk3xEDan1psV9aw9uwN+DjLRn43gCOcrC/96Taf2cKn5DQXC7iv1cQWDyevzgqDkoxh8qu6gTGT
 KkAxmR8D
X-Proofpoint-GUID: 8Zg3Jk3WBmmRQAgrHeT6k4oqjalJGUkq
X-Proofpoint-ORIG-GUID: 8Zg3Jk3WBmmRQAgrHeT6k4oqjalJGUkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

On 9/25/25 1:55 AM, Jingyi Wang wrote:
> this was accidentally sent twice, please ignore this.
> 
> Thanks, Jingyi

No issues. When sending a follow-up, please make sure you'll send
a *v3* (so that two parallel v2s don't show up on LKML, confusing
tooling)

Konrad

