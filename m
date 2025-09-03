Return-Path: <linux-arm-msm+bounces-71952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905C5B42D98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 01:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B879561A8A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 23:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3091DE4FB;
	Wed,  3 Sep 2025 23:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx0yNjCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF0DF76
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 23:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756943165; cv=none; b=rvr01IZtga9X+yqgzCKEoaHU/Mce8SfpBlYB/TO3xShWGTocfhqJxlfA1ULt3Zgdc+D86mv+QiJTaXu5U8/W63MaCKVxfbs+S7npdug9HwZEWZlHoFswQjshveTwRMz3PYBxSUeeR21R/xn7nvakWLyKIlqs1bXnvmfLuJitjF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756943165; c=relaxed/simple;
	bh=bKafahgtjgSdUvTRQ8tQoB1hM0RhKnBI179S/IxZw/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlpARzUxCHImg3j2hWWXm6LRka9LwOn7y7lpRwrTd9acxM0gwmolTvb+ywgScyV3Cgq2MAHsDnN2WFTgTDzNn01XHu72c34yAi0Bqify53sUhCaxkWM1pZJ56CgX56nfgCb5FRS9KQnXk9GRkvf61DbEZUbBl4kA+d2qcG0d8OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx0yNjCW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DxJXw004166
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 23:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YkAb+BdBtP58KIf9+ez4rCZs
	0vp9S2izMGPKnDHcn8s=; b=Xx0yNjCWc23/jxyl1eg4ByuqjbHai1cBJFdKW3Q5
	KvdNa7vyj3JWHPxkffq/lRpP7fXMPDknOw6cGXnM/+uk9KGlm8r89byL/v9JMlUO
	QJoLrscT7vDB+w02w0XPUZ79Q9hnk7dw1AXzTZkW34JR85y6bk8kPQMLVv9MbOUP
	pxOFxEUeZYgV6bPNI+dUzwEzod8JbekD7jK/WiPbKj/3MSSy+oJqWZhmdoahRzxY
	vDMStYZ2i2Ckf5Ghux+rqoiqbg6kPdyGa/bdQ4MQgCUqh4mQ63XZXhqVmXktDw+4
	6X0kTnxdAalkzZHB0sN+ObWTIiDOqBESgoBEf845xGPr5Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8we24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 23:46:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-725d32eaa99so9342586d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 16:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756943162; x=1757547962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkAb+BdBtP58KIf9+ez4rCZs0vp9S2izMGPKnDHcn8s=;
        b=Ss+WC2DRAMYcF7vvYvSFQnWpj1ICzG9mluYKLjuQV4tfvUrfo3uYPDDvL8D4MLywJc
         hMl8K7ZcdJZC3Wuhp15qypctw99fDDA7BfaAIa8L1jLahc2yk0zQTAI7mW8BVdhq7O/O
         YvpAiS3fDwQHcf5MPQdZdugvuZHPGK/WXtpW9O+eIEoRsdBl7qv9NmyamQFiQCZWJ8Zs
         dFo0p+aWGemvTg+QcLPf38Q6xDm5h5TL/MvKSESkij4Nv2cqmJC7KlOfOHvNqYH6jvuz
         6bnOGFqvM86bvOl0eDAuqz+lVVqKZPvPsaKHbTFJ6LWONGBXfSFePw2cStiHhMs/cmP6
         XmFg==
X-Forwarded-Encrypted: i=1; AJvYcCXUZeVsdC8CoGVEcWl2wf1nLIsWX5EcZjYgZsSGStpJ2uRVMc+mS/Z4sksc3xf2fToiPaqU+FSL0mD4o3wf@vger.kernel.org
X-Gm-Message-State: AOJu0YwTxEDvYFGm+lzYQKInsx65ELnrm7wTY35CLCJzwxilqGxT9sIb
	vDQqpdUkTF9IVMPcQpexEqAJhEpAIphk7hr3zwJOEdPA5kCdiv00I5PXtmkq6W1Jfm3SxBo0OHc
	xhPPd7mzHZa96mNVN9NnW05uK9oNg9TFc4tT7F+igpZeNtWzXTxfXZ3zdPAIpYpDHi/Tr
X-Gm-Gg: ASbGncsCO7PocG7XiyfpBI91PG5p2j4X3PaClJeUV3EcaCpa03aBXQtxe5+9qNGqKIv
	Ewj3xSJRmWM5cR5wqZEULswP8o3tEi8wc+kuqUvmtxVraGCCll3cOdRBSy3a+avUo1zJAnkWK8c
	1Ww2Ihj4srCreKtwfjTtL4xYrr3QH8d++Gsm1JAcPt9Cgd6GsqG3pA/KcSJLk1jh5wUUmMxU0NG
	IrjFKL36XOEeZ/JOQTmw7ssjeKPJQlaVIfpfCbLzsz+dXfcAo+wvPO0mZRfXqMhc3f7IYrBkwja
	jAxpvkmb3ip5E1MlEsefYy6TirliwLkzV1V1fiQ+rX11PCa1D5QQAfMQm5UADleEeWeTYvHEOZo
	YRVe69PnNF7PphdaDIEZt0RoY9ELqUsZCsbeCVB5fO6jePqFoXvTn
X-Received: by 2002:a05:6214:5199:b0:718:a53c:d5ea with SMTP id 6a1803df08f44-718a53cd8b4mr134396446d6.41.1756943161679;
        Wed, 03 Sep 2025 16:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeKw8/l+JU/+w+pUW5gWTeEM0B3lNbyMq4ZaRy2csjRNAmkpAtPFYULmhJ/idZ8VM17Hpkeg==
X-Received: by 2002:a05:6214:5199:b0:718:a53c:d5ea with SMTP id 6a1803df08f44-718a53cd8b4mr134396226d6.41.1756943161076;
        Wed, 03 Sep 2025 16:46:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfbb87sm827119e87.105.2025.09.03.16.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 16:46:00 -0700 (PDT)
Date: Thu, 4 Sep 2025 02:45:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <j7whxaqfeyz6fqwg54h2mivobbvo3plvxxzor7whmwjkhavndw@ulqfidkwwn6j>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
 <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tjR0yhtlzdTgdqnqq1ActUm5urr6U8KQ
X-Proofpoint-GUID: tjR0yhtlzdTgdqnqq1ActUm5urr6U8KQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX9xHxQTHqXLtJ
 Ze25zehpf7IUEcxIdE8P/HP2J/ivgOFrFlq+35sXrNnchrfsvksnkBryba/S7rWltyKlM7j3TcU
 qKYjSgH5smdiop6+wVL9QcAWJnTawbElS7BJOCh5DIzYv3bdTmbr8YOSwVPnPzPe95yZHaRAryw
 /x78TBbnKaKZo59Y7K3OTcBIDgOLqxONgrofOhlh5HEQ8kN+W6Z2DJ4WX7butjQ299DWoDX4C8V
 2719/fLKCOR6GhXXfDA3RasgYHevsxWpIcddWYj3/Jn68u0jLeQiB1Imoeqo4jPHzOWPDxu6XQ2
 SjpprNq06UxsTC0DxYOWlEeIo+Q4jx59SiseWfHoQx2lKTiEuza2vcjJ3nGKqF53FKJV7wHvNbR
 kSBTJZbx
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b8d33a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EZgLUtVhDPKl7mjbVu8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_11,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On Mon, Sep 01, 2025 at 05:57:30PM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.
> 
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> that supports 4 MST streams.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml           | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

I've picked up the last version of the DP MST patchset. Could you please
rebase this patchset on top of it, hopefully making it finally
mergeable.


-- 
With best wishes
Dmitry

