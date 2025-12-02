Return-Path: <linux-arm-msm+bounces-84077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E7710C9B872
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 13:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 67A27344B84
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 12:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689C91F30A4;
	Tue,  2 Dec 2025 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTfs+Gjc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZIOsHLP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D73128D0
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764680147; cv=none; b=Mi5WT9hLCI1/lBuZ9MGoHeOpxGRh5mqnO9f8kyk/8YCT5Phv6QlhtLUPCsSwCbj1IwMfZYNL27OXaMTsYPchU+UXdSTkKgrPMx2dvMyzPnAdztxzWOy1RXDF9SWqJB6n1aoZGcZ0FP/+AUXAw7q6H+Os4KG3I/a2l/Z/5X2O4a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764680147; c=relaxed/simple;
	bh=c99VfiJziIa4p5oGCuYMvysD45YMsYYhzKzywiDorKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJzFkm1hi4wwyHkPtHiVMdwjygKKKwcdqOkK0VA3+3Ltv6JE/7pPKFmH5gAAIVzVK5t4JzHGZgdNIdOPYYVcTEkz8UPRfIOkmj4cfKZJyoN+lrHMEbdCfgWGlwqPSRGyZlv7gbKV+/0UknhYcIiDB3bqdj/XCwWKRM+DzgIGNhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTfs+Gjc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZIOsHLP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B26e0xF1145508
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 12:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPs09PlsZI8fe/FIRCcZ/95GybauVOjun80wvJ9Xx1I=; b=dTfs+Gjc3A3PKdA1
	3u7vgi99q/oxlTAdzbqjlKAJYmvZWNZLeGRDe4fPJgp/mBzaGi8A8x6TgzI/2p/g
	hWIOP7AQQJziisAEhyRCazkJjyzOuXNtRKrsisZg/ACg3FDfxODyzxxGukH0rB1V
	ri4uL6yw9GEBzDR2LkinlR48dnUx0gNNi6E7H18+yeP5BlnAEF8+u8Ppzat0Enwg
	IiNxKM55mSRRxOX3My555Ozp+mIB7mENqdfsLMxItoqTfbC5Cgfqgn6rRRw7Wpc6
	IvvavbvjZsO0NSbi0uati/iFMUsqAGtyIGicNkYGaJRO4oaJ3cTnsy+3Ap1opw+M
	dB0Mlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asj5eanwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 12:55:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b29f90f9fdso108879885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 04:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764680144; x=1765284944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPs09PlsZI8fe/FIRCcZ/95GybauVOjun80wvJ9Xx1I=;
        b=ZIOsHLP4TeXJoaL7XMfBGVtsvicyDJZa8njZTQplpaQsluOB21AO6sSgHlkEwIMUbi
         tke//5cXWgY2Wfn3/wpP1XXIDpnzr4LyxvuqI4lOpG9jy4y08fzz/tW9tKeKC56r6npE
         ibeFfkTHjLZiEsCoF899AWR+Z0bN+YQdjOPbe/CaXjXoVd+Qx4xWv99aVoBFynfZywHd
         qOPCAOGZOIIX8bQib41SKPkroWqOMCX/+kbSey78lwerpuY5pTazhzS9t/+lN17g/7/i
         M4jKOysoSMxGo5JRwemmfhDa6OBvIpX7c3yB+OEGO3OXcSOMsbTZQCJ0+b5uYlaZBqoj
         lO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764680144; x=1765284944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPs09PlsZI8fe/FIRCcZ/95GybauVOjun80wvJ9Xx1I=;
        b=aPnEt/Mj4gErmJYElkZtlyeshtoLVvCtgBVk6LXJ251WiwWVdgHLIM/ydmibpbaDGR
         WrUwjDak4xIefQ0luo8iWnqaozTffjvnOyhrEteEqkH5CwiRqiulxUzmsaIh9GpOehoU
         v2bxYbkUgtlZP6RtXMVlT6kbpRU/icDfAHEO+cyqAUnoZwyTngUkQdjKWkkbDu6L5AnW
         6O1n503FQZ5IS4kq5LHkG7laX5oPaPWq4t88h7vnK80RN+4649pV8kDGEEl73nXe18+n
         QgcvPpUo7PEkv/20UbaIMER8v6mHeD7YjtqKQ+WUcHJ6fI3ZJr3zobdFDiqC07suqVQz
         +x0A==
X-Gm-Message-State: AOJu0Yx+cGsH9NUejYXHr5rVpv3UjxX6UN5x4zZx/HgjV6/ZN/5wvG0d
	3gaDyUC8zp5CrVjBvYumQxIamwux8V7VKrgagTxzA0wVh0vWoxSQUrny+i78thTWzu+K3PyL62A
	VSH8H1rVA7hrrY6EnhLD5Y1iu2+tYOjMEZnWOxiYBqRTo+8Vz+LaoKxH8X79tMT7SGWmc
X-Gm-Gg: ASbGncuqd2X6duqO8k1DrdTGqHWT3My0zR8LwZ7kVcvUW14v1dn1LezRVTE2qgb7JUn
	OCapQPN+9FyHb3yyFs4Wv9aDdtT//A9nU5J/ZTaFg4h01RLK1TVuiL+iTuEXvFRHmPcZARGggXq
	Bx1DX3XCTgNtNftFg11ZaONTH/QL6h9qAG8wPCVEqfnAYmVwkKyX1R8CbOR5dfiaLvErUyHuHec
	LYKacr1jUYl8Jx3HLmwC6wY+A6Nr5g0Li8o/93YoOafrQg4CtPCqEBeRKTMOuRFydleWIkctBCC
	W+HdL41fI4xouQRJ22228zbCO6dFsuTHdlq9WrQla12KA1VL6WE1ggWxw3fTaT8CvoaKeJJUhlW
	RnbC66hB8lHnyG/3S2VAZOtBVGG60LMIUH0Rz2N19nBYHSqi0EackfF5seNdDc3bNAw==
X-Received: by 2002:a05:620a:1aa1:b0:8b2:ddd3:adae with SMTP id af79cd13be357-8b33cfc6cd2mr4243979885a.0.1764680143868;
        Tue, 02 Dec 2025 04:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6t5tAlhnUSrzpVsQ4YaBwDMUp5ld41UwU7dts+koLAB5uAJi/EM37lxZiwbVRa41NR97csw==
X-Received: by 2002:a05:620a:1aa1:b0:8b2:ddd3:adae with SMTP id af79cd13be357-8b33cfc6cd2mr4243976685a.0.1764680143341;
        Tue, 02 Dec 2025 04:55:43 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79cbc1f1d5sm33115466b.63.2025.12.02.04.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 04:55:42 -0800 (PST)
Message-ID: <ed0bdcae-6fa1-48a4-9618-e0ac09097f9e@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 13:55:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-tama: Keep labibb on, so kernel
 can disable it
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251202-tama-labibb-v1-1-f8f3fda53d1d@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202-tama-labibb-v1-1-f8f3fda53d1d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PLDf5v7t8ODrU6SAeW4bfq5j3sB15Io1
X-Authority-Analysis: v=2.4 cv=GMsF0+NK c=1 sm=1 tr=0 ts=692ee1d0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=iaR-HtB-u2oQH_P8YIwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEwNCBTYWx0ZWRfXxkEChSeFIqA7
 8idJ8oAZBI4Uz9qNODfBZweeK8oLZbo3BTU6Tu5QtauUHJGL0JSgMYEpLLD3cEtA9NeQl0LdJvL
 pgblc1eyeJpnOQb5rI+jexXa1V9fsONu6Ca4ELyZFJ8eaxFwNK3ypX37aFYuX1NV0mhH9xQ1Hm2
 n8aSkzh7uhxkRiVk/Mc/zyOHx+BTBZv9yz1gFhtZSl2vYB1FwOgsMVJnfTPJUTiF1zR8wU69EDv
 60Geybnv8M7OQau0MXCL/4pcju5u8rrL1v15e9FLRXJ/uacqbUU7GOUqtTXd5B5C69/p4z7aG43
 zbSIQyD9DbrgFp2g3naE5MXhUBtFY0QZMlUHoKGFgfKYdXH968ym2g68KoRyZlwa10tb49rfY5N
 jpxqJ1KHe46l9iRypYrx+5RVa8SC4Q==
X-Proofpoint-ORIG-GUID: PLDf5v7t8ODrU6SAeW4bfq5j3sB15Io1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020104

On 12/2/25 12:31 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> In case if they were enabled by the bootloader as part of some
> reference/common routine and left hanging. Linux will switch them off if
> they're never used.
> 
> Discussion about it can be found here:
>   https://lore.kernel.org/all/20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz/
> 
> Fixes: 5dcc6587fde2 ("arm64: dts: qcom: sdm845-tama: Add display nodes")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Perhaps "keeping it on" is a little bit unfortunate in that the wording
collides with keeping the regulator's output enabled, but anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

