Return-Path: <linux-arm-msm+bounces-73925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB0B7F7F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 528D71898596
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9FF2253AB;
	Wed, 17 Sep 2025 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7KlTeAw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79B71C6FFA
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116288; cv=none; b=nRc7au6rQqT9mb7f9QVQBDqd5a7iwAUmY/6HrC24TLWrVqpBHBmH1pwE7xxmdJYEb1jfy5C9HzduDrs213M7SFxioaBl4TWRNpLznLxnP1dwZ7VGoifrUKO7ikIIPtgeHP9S1GzzUs1SRoZYF4QaGU79ghZuYZl9not1VXLHW1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116288; c=relaxed/simple;
	bh=PPJ625NvM7eluHFld7PJ5RUi59lKn3TMrbeTuUnNf8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfZZuRC5aqxRO60MQdy/lhje3yM3inYhn4JVECteU9dbruXLA6Nej0tU+e6cy6KUeazC7R/9PaJCOOs+sljm4n/9nGpd4aTG//7O5JDuOhd0xwCe0mFRQqHhCtbIo8YrjKaWgGWpdccm5mllURb0G6TkEIzdqBoNso6WUrrs5dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7KlTeAw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XaCm010746
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w7GTRhgq5rEoNKib7SIm646B
	tucURKVp2xtEeVTevNk=; b=l7KlTeAwE8ujFDO5CgxNkSl5pqOaQBM0QX+JDmXZ
	+rloiPMN9fsw5H37KWm9XNUV4foPoiKU4RXP5gnlEBKnY+f+UTxUt8jKup6SFOk9
	loEZAwRLCdBIjsPHjBGavUgzYfSrnDg3l4s5CSJcfPScp+XBQXcTEuJOykZF/vPM
	lIgcbhEY3JsHlqhjnGTPV79sJ1OxUWNfZ24QzXdEUA9erLTRNhEqH+H3iLUZJgRA
	r2Gq3nqMvcUXBlXTXDYFotYnu8wjFNRM6xuZ+hsih7hCsrtbexf/0XTewlAusX9S
	VjEbdV//vHJrTuQgyfHZ4EsrOdzqVgdQwU4zNJNSvu9ahg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxtgw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-82119c68f9bso2025141485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116284; x=1758721084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7GTRhgq5rEoNKib7SIm646BtucURKVp2xtEeVTevNk=;
        b=ph28bSHrXdKmZV6Jn1zuKITW8rHFRmlSu3F6Y1apW5MCX+05wKp4J7HkUPT49moA+t
         EAQM3J/1pMNJ17eY893udHuFBwfTgr6ZPEK9za39Vn6wXaA2ANsAdiFEwKOMZNA4Y0jU
         SPvP92OUA4hgUfogP2eR3wAJfuD5Gv9OzITdHwmyuWG2yrhXa28nTyXlHQYHfrB0aqYt
         6Z/5c9V6xBn93ZM0NwGN+yW7YXIYtzzloATYxUFXc0Ylz3/ILq4ehlbBP0I1YV6dyWxo
         ts89wILVGP3ZTTY4gDXdgtuiUWWRIpW2Z2trDipQYFZk5z9gsePTQmH1m0F496ZpZOib
         p/aw==
X-Forwarded-Encrypted: i=1; AJvYcCUavjQRNNfo5fbJlXFE4QqAd8Jw3LQ9RfupYgX6EWb/AAwtXFKmCRRA9kVze7qB6MY6quKz8M/BMdw1vSfs@vger.kernel.org
X-Gm-Message-State: AOJu0YwMXG3eGcLfOX7vZmGzK/IcvStU9JTpI6j8uPY/doQ6BqF6FgPq
	sjQm0wY7MIzffNI0Z6jagB5uibuu3Iir8YDeczw2Fz/oMam1+GepnKjq33x8Thilq2kwHBkYeqC
	afLlyyff7tvJT6SVByqMSLh7jkOlh2CSHu09z5tfaSAKHgVfM0cbaTIImp/hAYEJgDXLV5TsvjS
	W6
X-Gm-Gg: ASbGncs4QSKU7JtTj6SBV+iQufs+w/iWmmJSTUXYwVzpbi5irorDPKS4OQ7VgVq0KLM
	h3tGqSBqKEsiGYjjAG41GeXo/rUhk7c4/4X1Jm0FwRB621nXkZZAFEkAqY/eiNTsDpy/EqRIINc
	CGXaKwW3SNv7kMRJf8vWfLkVqoj9q8B9i3bNjvuI1N+Lbz/ymLtgZCGkyuOCI7zlPmzALHCGmjF
	4IOsNsZa1noP7p0cm+DPyTFW0eCKu7JIycRd/hKSG9+k82aorIpjedKsihG2GlXlOdGxUU7HxGn
	I8emsl4hD/zxg05mMGYSVGxMLBY6g4783anLnBB3NtHTYdZd03JVuqnGBHhuk9EF87FJ2yX0vxT
	Uab9aVIRC2g0aQuFlbEs+R4XeIBRA2IISTH358Mt+vOv5gnqzuzYM
X-Received: by 2002:a05:6214:411a:b0:780:247c:4b1e with SMTP id 6a1803df08f44-78ecf4f6ae0mr18960776d6.60.1758116283734;
        Wed, 17 Sep 2025 06:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLCBopqInSMbBFKEwP1RvqvH8otaHG8H1R8WN+gvIViYqCYgDcJp7lOy8hiGDIKsQjsbUB/g==
X-Received: by 2002:a05:6214:411a:b0:780:247c:4b1e with SMTP id 6a1803df08f44-78ecf4f6ae0mr18960226d6.60.1758116282976;
        Wed, 17 Sep 2025 06:38:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-570340058c8sm4822487e87.62.2025.09.17.06.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:38:02 -0700 (PDT)
Date: Wed, 17 Sep 2025 16:38:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
Message-ID: <suwpswv3jqes2mj5rilhqv55e72bgipqqq5rvhx3thhtnwhz3f@5hbktxchoqta>
References: <20250917-dts_qcs8300-v6-0-5c862aa80f64@oss.qualcomm.com>
 <20250917-dts_qcs8300-v6-1-5c862aa80f64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-dts_qcs8300-v6-1-5c862aa80f64@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+mbDthgWG+zc
 7VyieP/tJX2UtoujGW+++wqnO521UTWbjg8aNLcrE9KBTgcg9wy//m2xUhksACpdvrm6SB4DRCL
 0wc+f+1JHrMw02RxpjwZXPjhFO+gvkzrQQ5Q8HV9Cuxn8cnlYrDaedbi/mRAlaffe4ot6rQqO8w
 bHNRynwOf5rGJPEmJD8W6gxCXUZZkQYrLhJoxv0yJvwFXK0PTH489j9r0Mq30KfONW9rQtd+d++
 IA9m1ikG8Td84HtBfiahEhopecQO9JC1lzo5lxJNRbmwuOHQcP0Biuor7xqjDv25B1q0duZyOfy
 DGVgnCagKHjcaQENJta9HoM7vFkgocivM4MwaWuUhxW4FAYXgR4Kv6eZuqv1o7XjBAvGtFDjJS4
 SAbBojGF
X-Proofpoint-ORIG-GUID: wyE5qLd8ajQ79-gGPqQDGyyKMkToTp-z
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cab9bd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ggSMAipNaOlLgWN-UjYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: wyE5qLd8ajQ79-gGPqQDGyyKMkToTp-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Wed, Sep 17, 2025 at 02:09:47PM +0800, Yongxing Mou wrote:
> Add devicetree changes to enable MDSS display-subsystem,
> display-controller(DPU), DisplayPort controller and eDP PHY for
> Qualcomm QCS8300 platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 220 +++++++++++++++++++++++++++++++++-
>  1 file changed, 219 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

