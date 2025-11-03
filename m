Return-Path: <linux-arm-msm+bounces-80120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5AAC2C20F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 14:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0088A3A6FFB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 13:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D77430504A;
	Mon,  3 Nov 2025 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2fp99AM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBywEpP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75BA2F261D
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762176773; cv=none; b=jbDFOHtJtBEvFu5/l8pwBMZUMuOQ6JaV85ptxrVxR6aETFc4R9mEQxs3k46x7/4sVWYIpyMMeSJozi3h7RTp49V2UeIvfe2oixfjCw/hsqtPwrg7eTgVY2lw895wAIPdpkZjS/hRuT++KhoYGFrxWKonc+zRFaYZEmFmkN4ZgR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762176773; c=relaxed/simple;
	bh=mg7SByJm97xZE/wXkQ1rmnqhs3PTduSImrl8NpJB8ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6Gj/Ms5oZy74HuFoFmHVVLmn+bmXs1kzg9+PHaq9neC9DQsZIzBkY+z0bl6UNNYVUQ0Um26Z2wKed+4Do0lWnqzVEBP+0/XSLsVhmp4FtglF8b9e6q6h+JlP8hXy8a4tDN+g38Tag/2ar3ZOLHq7VfVKyX+dUypXLGzn+2bDUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2fp99AM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBywEpP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3B7ZKE2984015
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 13:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIyw5i9qviVdqzlYyIMTMo7lUxL9keKbptlFRLiNMjc=; b=i2fp99AM+6Tv0AMj
	9kTFkiC49jvRKpQLndVLSSTAItiAxHYIBtFc1OyyKD77BlccMOsOZwMgtw+IfVik
	j1KVqdOfMCyyEmu7/YT8WMSm/qnPOre+EDJSBXvfFeiugAHF07MiLAVpiWLzqlOI
	DwuDvaUHP8qKv+ozrlt9TFKkuJSBCMZMBIMpqnn9kzrBWX3cUHTthtI7iaMBAwpW
	Uke5LKlZQ0EwYtVNUCzbFuHk/QKjRRE/G5nTyPUBUiJmwFm+J1Qzxs+Mh8IOJ7un
	Bc+nPJxjFActRowTFdjY7EC4ahzVDBJ4EqPv9WqrW2R/U7++WEHMZmri+BRdaOxk
	XlyYUw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u8b0ayu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 13:32:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ecf5ea6669so8870941cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762176770; x=1762781570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BIyw5i9qviVdqzlYyIMTMo7lUxL9keKbptlFRLiNMjc=;
        b=EBywEpP+t1samnaBDKfT46dVU4IhGDURs0lLdSp0x8N54sIhMxufNmZ6jW4dF/RF2x
         edLfYC+nmIg3GiTN7VVEr0DCO9W85HxV7S06xtuIyBgT6rPxdUxvEwVLVWjTeOe4loOp
         SFShenVncKdWjiEggP1thrF22V1cRII2uWDAN948W0YFpchNyuQtBR4o4ZpxpX5/9ebb
         rxqSqazDNB5qxsghlEdQUzvIVA9tDX9FSSOBndrORYCEdWh+ALmb53oeEBqtWeYvpUwS
         TH5uyBPCXY78IJrHmM6YfQJqDS2FAQWYoQSYF+fRd+Jy3fMKGB8JB9RNLKVVNxm+AfMK
         iIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176770; x=1762781570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BIyw5i9qviVdqzlYyIMTMo7lUxL9keKbptlFRLiNMjc=;
        b=V+gpPeIwudm8JyuVjU+CBiov6xcNmUxYJdDzGBwE4XGfChha0+sGzdu+bQIwLiiAts
         zINOC2+Elu4hi7mmoZOG8sG867Dny/uAneGlFFkWY35uDjqZ7lUGl4Di+TQqBs0VzKmn
         Iqg6K95cfaEPgm/TEgVfFcx7RO6G6VOAsJyYMETA0Bem2FL/eeCiqxdhWANS0EDHOi6i
         HVOPwPJIcWPtBk7g0kZe2TzxyBxitI0L2Du8jAONrTOdvXQ9SNgB/gUy39+MRwAYtoFu
         6sfQu2TImrtxhCIg3VZrA0b9z8lp6E6PKey6tozs03O/i+dh97dCiLSHzqhZj3W21/nf
         WZTA==
X-Forwarded-Encrypted: i=1; AJvYcCWDSr8LMo5JrHJzwOW8I3UayqsKKMetw3cbtrtLIPKSbq1jJeD+gD6UtiSH9qL4fJ25clhzN6JMqAdO4S1s@vger.kernel.org
X-Gm-Message-State: AOJu0YxAR7TE5YMZnZzHiizY58EnSNFtChBnMuymxF7gpJ4ZDRxeA4nN
	S0sMZMdOWRI/51O/1GOQiBeuOnFxhS3hiPJn9ZqmHSCtvdV9CSBSurDv2iIIHPAt80mLn7em33X
	6REm37Z78qxAekegbL8irGbgp+8+gNJwfoRTiE4/AxLHqPoOnyWL53lTQrT4gqJzuoLuU
X-Gm-Gg: ASbGnctf36Kpwg6tJLzpkiphIDYtnUQ4wndIXAZZ53Dx8/LAxwzXdSM2PWfAUlZCZFi
	rzhk3Qt8vzOGF0/VSfO1T1QDGn+Ea76YUqIJU2JBWwSaNOlOWuH5w4LFF4Ol4cl2RkszGnROigd
	mq8J2PMsggD7GAOFUbc5fG76s7maGVEif0P3fNCjYubG5btiBZYPcuZZaFyC94T5P/LMdhqt3h0
	OvKA3k1KY4r0jp3xi2uCN6yrkmq+RQk08V0hEGMlofkOKd+n7f1TjHiW1uzSPFWA+dOoluTF9Kq
	uemMkKrVZwadlblWnEUfw4vYrFUgxvnmk4jfrFYERh6S72FOIsk9RYs9p1TgwpMomG1VWdrgCzU
	7+mhhWAe5jreRt74vAGc8uaye+E72QxClntkW/RrBI44a4pZYvUxyEbAZ
X-Received: by 2002:a05:622a:1649:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ed30f7af4cmr106303341cf.9.1762176770059;
        Mon, 03 Nov 2025 05:32:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEARl4356Q+2Zi/1x+agQ2KP3My3PdqzDEFeuGS3FcOWXSR2Dn/DSniysgJ/5j+YoE1zUxc+A==
X-Received: by 2002:a05:622a:1649:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ed30f7af4cmr106302941cf.9.1762176769506;
        Mon, 03 Nov 2025 05:32:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70abbb6106sm537864066b.67.2025.11.03.05.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 05:32:48 -0800 (PST)
Message-ID: <0c409660-dd67-48e3-961f-6eeeec11074f@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 14:32:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] clk: qcom: Add support for Global clock controller
 on Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-6-a774a587af6f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-6-a774a587af6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEyMyBTYWx0ZWRfX+jmPgiV0ZdqG
 OLS1tswZBVrNOOBvFakx7Yf3XKMJUQjxmo0k9QcF4nX6dKuSLZCBaz5t2DfCqlJgl27h+r6YBy2
 V036b7FseIGfqUnZyZfrnikXWwr3lp0GiWC0AadbyeTR4HX9RDYVqKCjd7jcTrhQ6EJlOljtfwg
 uuu6T/WnKJ4vyAAfsd+MnJDR8C9vfE3TyaX3zMZAyD3RQii77F5y1dew5JUuC3DdchBTdu8hefi
 G92BGVqMhl04R6N/oQk+wbiU53wTPFHj2O78IIv+doVdcF5lnTWktQKLp7kCgJmyXzHjCOYWkVe
 lnnKEEMjkkke5YOHwdcyMMM7vKZ3bylU8nJuRmo4mpMylhiR2NSNiWNbrIE+Ky6EiytpQlhYI17
 hso+704oY68zrCDyMc5D6oevoq+2FQ==
X-Proofpoint-GUID: qEQ5pPpFxKZiYPm1vLU64PIpJQGMkflu
X-Authority-Analysis: v=2.4 cv=Ha8ZjyE8 c=1 sm=1 tr=0 ts=6908af02 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JX4wz1K3SFr7njo99sgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: qEQ5pPpFxKZiYPm1vLU64PIpJQGMkflu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030123

On 10/30/25 12:09 PM, Taniya Das wrote:
> Add support for Global clock controller for Kaanapali Qualcomm SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

