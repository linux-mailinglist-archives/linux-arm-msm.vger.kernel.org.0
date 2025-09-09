Return-Path: <linux-arm-msm+bounces-72699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D557BB4A53A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 405787B104E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 08:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D00E24677C;
	Tue,  9 Sep 2025 08:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyuILiot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D39D241139
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757406416; cv=none; b=CzjXiC7D5mc/QGX0AYUGiZruH8Ccfd32jt0Bd6U7jzP3wK/Yl+KP0RTOmWQM2QGooddMZo6UmCiSakEImbRGGFTCkV+zDOggk0pLU34urUM478+ALfrOq9WnRYsJM+pdzBziPqOXt0HQruJ0KjsNWx0DFWJZjVucxkLN9lFPCH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757406416; c=relaxed/simple;
	bh=P1GM3phe3ykV/SamJ41sqJjVV33ZjMdPB56k+xQB1PQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQH/qtafKkhZ7OuFiCw7ywG87g3CEzyoFWTAoLuHANTir6RjJGWcJJvExkqQ3XEPfBxKrm2y9nz5XrsGsAluPssUgfVP1R998ZqnIlQw9AA9n8Mm/YpRGFlO6bmwkb7bbaqjnx85ORolne/45YakXY7Q47V1Ok7mA0gzKHnhOHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyuILiot; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896TFfw014553
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 08:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZ3qsIZRKMtmRP++MDCauSjBs0OndHKpMtXY+g98584=; b=OyuILiotbj8cEaWn
	s2F/Y5ZBVOVzC/IPMVdXFaZZQNzW3bNRbxcsVqs4pjeDfvfWbFFhirzGZ9dsVJ6c
	z0j5m0TdQRq5u2o6PxpAqBQlTtIITDwQ2DNzs+mb/2AFJYUxuiujI16iGRzr6RRE
	YP1OZ34LgzIannFM2L8ka7983hp/Mz9sY02fRtSdHr++WrS0kMEz3P7DOCwjZhA5
	dbCSG+aGbW8SkOdUY2zEKg5KW1uo0mjUPQAZvnhsgBNkfqNDGayUKXVJnLDO+rSH
	GexIcEPYlC6WcGHg5wA1ikBx/68Wn+OW/b8qzAo4kII3owTCarrNSzG1iwsysRN0
	0aJkcg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc23h8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:26:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-74910ab069bso3402076d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 01:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757406412; x=1758011212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dZ3qsIZRKMtmRP++MDCauSjBs0OndHKpMtXY+g98584=;
        b=ctZzX1cqf0FSwkDuSLsq32IzHMfYmrPXgVZaUHdLMuV6bt/F2u6NMXSyfQSmMgD/Fw
         uP8tqsyGZlx8Qs+4q6maAXO5ZXJ9JWJ3pq0VOkAVh2DbhH+dCztSkH/gcWmqpD4FUv5T
         AkS1AMI3lazhEfQrWdfDsFPHvtPjLdQxJhfOBqoX1jplM9Fm9mRO8zMYI99y/S3bKVEK
         R3Q2SRjNsrv8G8FnOOyZuIVy5dha4A9NSTGBFWsbl+VhZ6pmchhYJo9cOIExrOJKgD1f
         Ere7Jytx25yAXvu6q3FOr9e41lEE+gwUaRce7dxWr785Zp1MiZW0iyrQAPbJI7GZB8bw
         Pxvw==
X-Gm-Message-State: AOJu0YxEEHuNWeMPAlnqlFL4qwS6AUqqaSPVmsipYbGR2tMD+AQDPQLM
	lv1ZuNa1XG9jWxqNUMeu+QFh24YXy8a7+2+HxP3PjBrl8eMW61JnDIVEQUAL9wV2Ho3G+ERFLpH
	rk4i+8+t884rLPs3eF6dTii48DzdC8vF6RBb52/oGVTjaks1w4/XijQIVy/yjqpbc/Mt9
X-Gm-Gg: ASbGncsFfRV+J5WqIJXhhm+8hjSW1qDwVC7Fa+jlAh6mcfGFQrHyfwAmKqff+OOPFEr
	9vvyAilMhxzUjDmY/p4TQywIv/t+D+ckpQ3nT+CTeV7cq5+47OKLqwP2VB9emBeXZ8aOS41BQ8R
	HgC1e5tYLOD+NwFlnqueBxelD6BzuhEFHP78+Z2rKQtiS5unay/OyP1YsPQxKKHBrWt4vZcbp1E
	sMzuKiIqIVKi/xB060Z2z4lRl2ThlC/kepBpQbSHYFUf4klUn0+yQtE6w99jm4/PLWkxxI6mdwA
	TLAnHsB9R5fzEltsnc/Ed18kcRlPzbe7CWzDlOAR8T42oSr5GDRv0TkbbCK8vcyEI1EZhibbhmc
	X8VNxRIt+zkf9GH1ds7zEOg==
X-Received: by 2002:a05:6214:2aa5:b0:734:4ca1:1da3 with SMTP id 6a1803df08f44-73946b9f476mr69425796d6.7.1757406412264;
        Tue, 09 Sep 2025 01:26:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGfWzUgli8sCKjybiZynjh0Hh9ipnr2D52Wv2AtFKxG9s4JCMp/u55EFix+07znAQjRv9wFA==
X-Received: by 2002:a05:6214:2aa5:b0:734:4ca1:1da3 with SMTP id 6a1803df08f44-73946b9f476mr69425626d6.7.1757406411355;
        Tue, 09 Sep 2025 01:26:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfe9a0198sm847373a12.10.2025.09.09.01.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 01:26:50 -0700 (PDT)
Message-ID: <74d489a8-6a6c-4ee1-8b02-5ddbfbf64b8d@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 10:26:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] arm64: dts: qcom: x1e80100: add video node
To: YijieYang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wangao Wang <quic_wangaow@quicinc.com>
References: <20250909-hamoa_initial-v10-0-ec10057ffcd2@oss.qualcomm.com>
 <20250909-hamoa_initial-v10-2-ec10057ffcd2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-hamoa_initial-v10-2-ec10057ffcd2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68bfe4cd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=0N2-J2CQ4XjjJXqxovsA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: R2F3jcG3NFIHmcgb15r9jE4MYFkNG5Pe
X-Proofpoint-GUID: R2F3jcG3NFIHmcgb15r9jE4MYFkNG5Pe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX8pAq7yOh+G/g
 EK600nqD5QPeXqJsoWQ7YUzKUOlpf5qTl3Vunae2gxhYSFB4UZEyWrbRl8mJ2PdE0RZaZx/+dR8
 yzB96UVsmAHQYWYq/c51dwP3EMp5W1k/6xkkIhEA0i+izYaVMjWsOYUQDx4VYz4ooRuDx/1DhG9
 VMoxLq2r7D/fJdfGopF6iqI2QNOLivxbJgjFK+pOUivnAOWRf9LOQv714/2Z0q/vhX311mkBnUR
 gX31BE21UJRCJ3kUao0dLPto/99GR3Jf0dwaWMCWiYF7xmSGRDdJxTKWd8Vq8VIf8Gv+wr5Qj/M
 Gi0/cr7L/Fb2FxbCnzuGrZGLrbvZ5M3ZQNDyh0rQlQb2uGltrsDmxH2u/c/Yqy+mR922FijKgIG
 s6qK2V9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On 9/9/25 5:56 AM, YijieYang wrote:
> From: Wangao Wang <quic_wangaow@quicinc.com>
> 
> Add the IRIS video-codec node on X1E80100 platform to support video
> functionality.
> 
> Signed-off-by: Wangao Wang <quic_wangaow@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

