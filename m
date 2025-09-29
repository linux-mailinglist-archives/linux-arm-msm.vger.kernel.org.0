Return-Path: <linux-arm-msm+bounces-75468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB42BA8076
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F8794E1409
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC9F29D295;
	Mon, 29 Sep 2025 05:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWlxUduK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2892327F163
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759125264; cv=none; b=Sk4/jcfFU1AbwfjRz4pagpuNvfMM5LQzz1bH8Y/kHL/carHHrRYHL2P0sdifd5UjHTHyX9LPRa99vyRYIf0TAvjb5KpXM9fKWbbVtpZGnNpu8WEbrSSEdSAKv01qWQBOurg9/b9Jrbt355ErmhZslXVzcxuMK0kRQemoRkeaiTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759125264; c=relaxed/simple;
	bh=OZHJCEcFQ/65emGmzMQpXLn2h/BDXU52F0/Z+mAHjsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFwoqFj9RJ5FySzT0h9mLrj31DMgeIJ5/xZ8keuibEp1N56my/FosicK8SwWTrXRAhiZgBV7LxKcPLbjVKFlkBoNfcNAayiQkKb3ODR0HvBuSnzzHtMWMUIvn2VmN01IAPuJQ6sSSH2taD+LfaOxfmULmp52bKc3dm3KOoicRFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWlxUduK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMQGl5001323
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6aX7MYxztQduz7Y4bXCCWCK1ewjXa53r5Z7NdeoH0o=; b=PWlxUduKnLDGR82n
	oHQ5TMcsuQ1G4dNZpWO+Iwhvi45YJd+p0C3Mqlxuceflh7g4OcSofn5oSFgrS0MQ
	9VD37gi1QC9tDBGXqrHUaBna+oAUmB2g5/lQXX6Fdwbp0ePhxpYS4hZmSMsxlRn2
	xgzsk4NBnaijkRQ5AARd3ihUn3YTYDIryYI/WHdUyyvUOlz0EQs3vDu1MU+lTa9r
	BgfhJGdFvwTqxd3rKLA4z9oTU59PRGKYyIRfw4AQthKwsKoxz7RwI7XM/GPR8ZxK
	ODPqbRdaQt5vo9jQMlUFspq/jrfh9W9FK+fYCH3h920CvGj6uZMR75Hcjt4w53ke
	veAoBA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5v0vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:54:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b471737e673so5425321a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 22:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759125261; x=1759730061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6aX7MYxztQduz7Y4bXCCWCK1ewjXa53r5Z7NdeoH0o=;
        b=ior2pV+vmZXPcZnNABwjpVLCAg33GqDS3tcp8FOWBf0IEEnfzLAhBkRNXIpsSi4z9M
         5GNzJ7Csj6XdGgisA/+jhGMZa1h39vBmIgy4gwMi2JfPzyzF2FEYy39GpATk2y2xNPQL
         roLEtBswNF9eZN23JlxVvqp5v+bbf/GBiBuNO/DWLEc/9/40WG7duU6cP9xzeYjbHMk/
         Z2QTJjGVXxcGKue8Fj7UhjJCThEt/xC7MRm3ixr5z6tVrldS9SCWSZnUruZWPRvMnlbB
         8pnJEIKvyjgTbXJZ5KkBwJ76T13JGfy+ngUHxP13KsatUcgElBgcIySY/X69Clm4CtkL
         lHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJj+Rbq/Mxzp9xGXr+nxe/o8e5O1Iiu0uuCo+n7aD8wXO8HFt79Coof7sl89tXYUSvNGK9CmQVRAQ0C3KW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5NfveHefaIxgvsqcfZIDT0DfVQX+v41c75Rp+07WHlcKdV58V
	cTyNNeSVecZGv8ilNrxVT95hBDJFjqVA0Hm6LHSqnjL7FtSlIvzCtavZw+/tehHhAnODJXR+m1P
	84W1dIr9OGEjQjRz7ALYqX2x+dqNE5Y+8Zkxt4BjpDx+sgrnRRNebY4lskqKQupgd6w3o3ruaJe
	N5tBM=
X-Gm-Gg: ASbGnct1X+bjQ0YPNOAoNPyx7+zJIILd+bWQTNdjRXdbc9aFGKMIVDQt/E8pzb5fPUI
	Ql16HA8uY5aABWTlyal7k11swsujbDQcdH8RFnAx4irCF0ksSF36DUnJ4RdOZo3LOTGRfefsn2T
	GNZULCt5VBSVZB8jzLHB/jmOZNfRGeXXWG+UVEW/sFkXZLb7vC6fKfGUircEyo2I7sjzbNQuN5o
	V/78VIWaGuLOhGx67YxnMUIBVFeG4sUn0a5xzyjISzVeaSYjjjD6ka/E5Z2pd8yYBW2nB6aP9R1
	nRL0Xl/rlPoZEBKg5w60R3wc/iKibyysGNKr413bBis1teUVwYfCWBFVdZkSzrFMYmNghU23A4a
	bT28qPCDCmJTray0R8BDu3Qt55KUa2abD2rs=
X-Received: by 2002:a05:6a21:110:b0:2fb:add5:5574 with SMTP id adf61e73a8af0-2fbadd571bamr9816472637.47.1759125260678;
        Sun, 28 Sep 2025 22:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVksNJyHFtS+HequOtik73iZkCJvwcnPgJVzBHKlsG/Uvvmk9RsrSRPaXHrIlk4LLsM2hl5A==
X-Received: by 2002:a05:6a21:110:b0:2fb:add5:5574 with SMTP id adf61e73a8af0-2fbadd571bamr9816448637.47.1759125260260;
        Sun, 28 Sep 2025 22:54:20 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c5575350sm10147763a12.26.2025.09.28.22.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 22:54:19 -0700 (PDT)
Message-ID: <6094ed8b-ddcd-462c-8753-06a1d58a9691@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 13:54:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add Qualcomm SM8850 socinfo
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com>
 <ebxbhaaefuoemadcef5h4lxfw2k2hwkfe72aubctqb3tk2zdmp@p7ck45rd2hy7>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ebxbhaaefuoemadcef5h4lxfw2k2hwkfe72aubctqb3tk2zdmp@p7ck45rd2hy7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68da1f0e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_Kg6Ejj7DnKBMOYh5WUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Y8w0ho2kx5Pave44JPrXxdy4hyOI2tGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXzffX9F5hVSrB
 qwWbPdUmWii1kMeDA5dOE4L8fpoaarNlQroVtKDlpocJLW2Aw7+MfpuuMzFAS3qW4ZJbOIu8hEs
 4uEy1x6O03cFnufIgwS4byBTJ3+wj9w7VUMoadd/+Aa6PRkrfnnCIOUAgGQHG62kN3lNhGZ5dl3
 Zcq+DAdTNj9fgsOCq5/VVdP00dWbCWxCuKxjRFmGOHT3EYnzjHXKQ/exRZWiAQ4MLS9/wCQjbFg
 dD3W0KdJ3WNK6TIHWTBsqsjqs9VCkcqz8FlmYrwdmGu6XKxWd3cOBI8N1sRr+Cjt0rXGxlLzC2m
 14tjHeSqFd+21JCR69TSXLOxqBZ1muXXqgzLW2es71tsZBBaJ65gAIxJY9b3TKn8n52NuIu0c1b
 vN496GECRbdj90eijVzIT/jqKHd24A==
X-Proofpoint-ORIG-GUID: Y8w0ho2kx5Pave44JPrXxdy4hyOI2tGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033



On 9/25/2025 10:38 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:17:45PM -0700, Jingyi Wang wrote:
>> Add socinfo for Qualcomm SM8850 SoC.
> 
> What is SM8850?
> 

SM8850 is the soc id for Kaanapali, SKU numbers instead of codename
is used in this file, like QCS9100 for lemans, do you mean we should
add the info "kaanapali" in commit msg?

Thanks,
Jingyi

>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>> Jingyi Wang (2):
>>       dt-bindings: arm: qcom,ids: add SoC ID for SM8850
>>       soc: qcom: socinfo: add SM8850 SoC ID
>>
>>  drivers/soc/qcom/socinfo.c         | 1 +
>>  include/dt-bindings/arm/qcom,ids.h | 1 +
>>  2 files changed, 2 insertions(+)
>> ---
>> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
>> change-id: 20250917-knp-socid-f96f14a9640d
>>
>> Best regards,
>> -- 
>> Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>
> 


